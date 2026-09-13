stock Interact_Pay(playerid, targetid, amount)
{
    if(gettime() - PlayerInfo[playerid][pLastPay] < 3)
       return SendClientMessage(playerid, COLOR_GREY, "Please wait three seconds between each transaction.");
    
    if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
        return SendClientMessage(playerid, COLOR_GREY, "The player specified is disconnected or out of range.");
    
    if(targetid == playerid)
        return SendClientMessage(playerid, COLOR_GREY, "You can't pay yourself.");
    
    if(amount > PlayerInfo[playerid][pCash])
        return SendClientMessage(playerid, COLOR_GREY, "You don't have that much.");
    
    if(amount > 1000 && PlayerInfo[playerid][pLevel] < 2)
        return SendClientMessage(playerid, COLOR_GREY, "You can only pay up to $1,000 at a time as a level 1.");
    
    if(!(1 <= amount <= 100000))
        return SendMessage(playerid, COLOR_GREY, "Don't go below $1, or above $100,000 at once.");
    
    if(amount < 1)
        return SendMessage(playerid, COLOR_GREY, "Invalid amount");
    
	if(PlayerInfo[playerid][pAdminDuty]) 
	    return SendClientMessage(playerid, COLOR_GREY, "You can't pay while on duty.");
	

    PlayerInfo[playerid][pLastPay] = gettime();
    GivePlayerCash(playerid, -amount);
    GivePlayerCash(targetid, amount);
    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
    PlayerPlaySound(targetid, 1052, 0.0, 0.0, 0.0);

    SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s takes out $%i and gives it to %s.", GetRPName(playerid), amount, GetRPName(targetid));
    Log_Write("log_give", "%s (uid: %i) (IP: %s) gives $%i to %s (uid: %i) (IP: %s)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], GetPlayerIP(playerid), amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID], GetPlayerIP(targetid));

    if(!strcmp(GetPlayerIP(playerid), GetPlayerIP(targetid)))
    {
        SAM(COLOR_YELLOW, "AdmWarning: %s (IP: %s) has given $%i to %s (IP: %s).", GetRPName(playerid), GetPlayerIP(playerid), amount, GetRPName(targetid), GetPlayerIP(targetid));
    }
    return 1;
}

alias:interact("i");
CMD:interact(playerid, params[]) 
{
    new targetid, szMiscArray[128*2], szTitle[32];
	if(sscanf(params, "u", targetid))
	{
		return SendClientMessage(playerid, COLOR_GREY, "Usage: /interact [playerid]");
	}
	if(targetid == playerid)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You can't interact yourself.");
	}
	if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "The player specified is disconnected or out of range.");
	}

    SetPVarInt(playerid, "Interact_Target", targetid);
	format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
    format(szMiscArray, sizeof(szMiscArray), "Pay\nGive Item");
    ShowPlayerDialog(playerid, DIALOG_INTERACT_MENU, DIALOG_STYLE_LIST, szTitle, szMiscArray, "Select", "Close");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_INTERACT_MENU:
        {
            new targetid = GetPVarInt(playerid, "Interact_Target"), szMiscArray[128*2], szTitle[32];
	        if(!response) return DeletePVar(playerid, "Interact_Target");
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        if(PlayerInfo[playerid][pLevel] == 1) return SendClientMessage(playerid, COLOR_GREY, "To use this pay interaction, you must be at least level 2+.");
                        format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
                        format(szMiscArray, sizeof(szMiscArray), ""WHITE"Please enter an amount to give %s.", GetRPName(targetid));
                        ShowPlayerDialog(playerid, DIALOG_INTERACT_PAY, DIALOG_STYLE_INPUT, szTitle, szMiscArray, "Pay", "Cancel");
                    }
                    case 1:
                    {
                        format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
                        format(szMiscArray, sizeof(szMiscArray), "Weapon\nPot\nCrack\nMaterials\nMeth\nCigars\nSpraycans\nGas Can");
                        ShowPlayerDialog(playerid, DIALOG_INTERACT_GIVE, DIALOG_STYLE_LIST, szTitle, szMiscArray, "Give", "Cancel");
                    }
                }
            }
        }
        case DIALOG_INTERACT_PAY:
        {
            if(response)
            {
                new amount, szMiscArray[128*2], szTitle[32], targetid = GetPVarInt(playerid, "Interact_Target");
                if(sscanf(inputtext, "i", amount))
                {
                    format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
                    format(szMiscArray, sizeof(szMiscArray), ""WHITE"Please enter an amount to give %s.", GetRPName(targetid));
                    return ShowPlayerDialog(playerid, DIALOG_INTERACT_PAY, DIALOG_STYLE_INPUT, szTitle, szMiscArray, "Pay", "Cancel");
                }
                if(!(1 <= amount <= 200000))
                {
                    format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
                    format(szMiscArray, sizeof(szMiscArray), ""RED"Don't go below $1, or above $200,000 at once.\n\n"WHITE"Please enter an amount to give %s.", GetRPName(targetid));
                    return ShowPlayerDialog(playerid, DIALOG_INTERACT_PAY, DIALOG_STYLE_INPUT, szTitle, szMiscArray, "Pay", "Cancel");
                }
                Interact_Pay(playerid, targetid, amount);
            }
        }
        case DIALOG_INTERACT_GIVE:
        {
            if(response)
            {
                new szMiscArray[128*2], szTitle[128*2], targetid = GetPVarInt(playerid, "Interact_Target");
                PlayerInfo[playerid][pSelected] = listitem;
                switch(listitem)
                {
                    case 0:
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i weapon", targetid);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    default:
                    {
                        format(szTitle, sizeof(szTitle), "Interaction - %s", GetRPName(targetid));
                        format(szMiscArray, sizeof(szMiscArray), ""WHITE"Please enter amount/quantity you want to give");
                        ShowPlayerDialog(playerid, DIALOG_INTERACT_AMOUNT, DIALOG_STYLE_INPUT, szTitle, szMiscArray, "Give", "Cancel");
                    }
                }
            }
        }
        case DIALOG_INTERACT_AMOUNT:
        {
            if(response)
            {
                new amount, szMiscArray[128*2], targetid = GetPVarInt(playerid, "Interact_Target");
                if(sscanf(inputtext, "i", amount))
                {
                    return ShowPlayerDialog(playerid, DIALOG_INTERACT_AMOUNT, DIALOG_STYLE_INPUT, "Interaction - Give Item", ""WHITE"Please enter amount/quantity you want to give.", "Proceed", "Cancel");
                }
                switch(PlayerInfo[playerid][pSelected])
                {
                    case 1: // Pot
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i pot %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 2: // Crack
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i crack %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 3: // Materials
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i materials %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 4: // Meth
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i meth %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 5: // Cigars
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i cigars %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 6: // Spray Cans
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i spraycans %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                    case 7: // Gas Can
                    {
                        format(szMiscArray, sizeof(szMiscArray), "/give %i gascan %i", targetid, amount);
                        PC_EmulateCommand(playerid, szMiscArray);
                    }
                }
            }
        }
    }
    #if defined Interact_OnDialogResponse
		return Interact_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Interact_OnDialogResponse
#if defined Interact_OnDialogResponse
	forward Interact_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif