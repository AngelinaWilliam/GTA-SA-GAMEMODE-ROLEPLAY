total_skins(playerid)
{
	new x;
	for(new i; i < 4; i++) {
		if(PlayerInfo[playerid][pSkins][i] != -1) x++;
	}
	return x;
}

have_this_skin(playerid, model) 
{
	for(new i; i < 4; i++) {
		if(PlayerInfo[playerid][pSkins][i] == model) return 1;
	}
	return 0;
}

give_skin(playerid, model) 
{
	for(new i; i < 4; i++) 
	{
		if(PlayerInfo[playerid][pSkins][i] == -1) 
		{
			PlayerInfo[playerid][pSkins][i] = model;
			save_skin(playerid);
			break;
		}
	}
}

save_skin(playerid)
{
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET skin_slot_1 = %i WHERE uid = %i", PlayerInfo[playerid][pSkins][0], PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET skin_slot_2 = %i WHERE uid = %i", PlayerInfo[playerid][pSkins][1], PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET skin_slot_3 = %i WHERE uid = %i", PlayerInfo[playerid][pSkins][2], PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET skin_slot_4 = %i WHERE uid = %i", PlayerInfo[playerid][pSkins][3], PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);
}

CMD:myskins(playerid, params[]) {
	new szDialog[512], string[128], businessid = GetInsideBusiness(playerid);
	strcat(szDialog, "Skin List\tStatus\n");
	if(BusinessInfo[businessid][bType] != BUSINESS_CLOTHES)
    {
        return SendClientMessage(playerid, COLOR_SYNTAX, "You must be in a clothing shop to use this command");
    }
	for(new i; i < 4; i++) 
    {
        strcat(szDialog, string);
		if(PlayerInfo[playerid][pSkins][i] == GetPlayerSkin(playerid)) 
        {
            format(string, sizeof(string), "%d\t%s{FFE381}Equipped\n", PlayerInfo[playerid][pSkins][i]);
        }
		else if(PlayerInfo[playerid][pSkins][i] != -1) 
        {
            format(string, sizeof(string), "%d\t%s{FF5353}Not Equipped\n", PlayerInfo[playerid][pSkins][i]);
        }
        else if(PlayerInfo[playerid][pSkins][i] == -1) 
        {
            format(string, sizeof(string), "There's no skin\t%s{63C773}Available\n");
        }
	}
	ShowPlayerDialog(playerid, DIALOG_SKIN_MENU, DIALOG_STYLE_TABLIST_HEADERS, "Skin Inventory", szDialog, "Select", "Cancel");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_SKIN_MENU:
        {
	        if(!response) return 1;
        	new id = listitem;
        	if(PlayerInfo[playerid][pSkins][id] == -1) return SendClientMessage(playerid, COLOR_SYNTAX, "You do not have a skin on this slot");
        	ShowPlayerDialog(playerid, DIALOG_SKIN_LIST, DIALOG_STYLE_MSGBOX, "Skin Inventory", "Select the action you want to do", "Equip", "Delete");
        	SetPVarInt(playerid, "skin", id);
        }
        case DIALOG_SKIN_LIST: 
        {
        	switch(response)
        	{
        		case 0:
	         	{
					new id = PlayerInfo[playerid][pSkins][GetPVarInt(playerid, "skin")];
					if(GetPlayerSkin(playerid) == id) SetPlayerSkin(playerid, 250);
					PlayerInfo[playerid][pSkins][GetPVarInt(playerid, "skin")] = -1;
					SendMessage(playerid, COLOR_YELLOW, "You have been successfully delete the skin slot %i", id);
					save_skin(playerid);
		    	}
	        	case 1:
	        	{
					new id = PlayerInfo[playerid][pSkins][GetPVarInt(playerid, "skin")];
					SetPlayerSkin(playerid, id);
					SendMessage(playerid, COLOR_YELLOW, "You have been successfully equip the skin slot %i", id);
					give_skin(playerid, id);
	         	}
		    }
		    DeletePVar(playerid, "skin");
		}
    }
    #if defined SkinInventory_OnDialogResponse
		return SkinInventory_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse SkinInventory_OnDialogResponse
#if defined SkinInventory_OnDialogResponse
	forward SkinInventory_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif