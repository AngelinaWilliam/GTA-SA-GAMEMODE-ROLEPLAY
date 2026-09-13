new gStealPercent = 20;

CMD:setstealpercent(playerid, params[])
{
    new percent; //string[1024], title[64];
    if(PlayerInfo[playerid][pAdmin] != 8)
    {
        return SCM(playerid, COLOR_SYNTAX, "You are not authorize to use this command.");
    }
    if(sscanf(params, "i", percent))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setstealpercent [percentage 10 - 50 only.]");
        return 1;
	}
    if(percent < 10 || percent > 50)
    {
        return SCM(playerid, COLOR_SYNTAX, "Percentage must be 10 - 50 percent only!");
    }
    new oldpercent = gStealPercent;
    gStealPercent = percent;
    SMA(COLOR_GREEN, "Steal Percentage is changed from %i Percent to %i Percent", oldpercent, percent);
    return 1;
}

CMD:rpsteal(playerid, params[])
{
    SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s reaches for the pocket of the victim, as he searches for items to steal.", GetRPName(playerid));
    return 1;
}

CMD:steal(playerid, params[])
{
    new targetid;
    if(sscanf(params, "u", targetid))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /steal [playerid]");
        return 1;
	}
    if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	}
	if(targetid == playerid)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can steal something from yourself, You dumbass!");
	}
	if(!PlayerInfo[targetid][pInjured])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Player must be injured in order to steal something from him/her.");
	}
    if(PlayerInfo[targetid][pLootedTime] > gettime())
    {
        return SCM(playerid, COLOR_SYNTAX, "This player has been looted in the past 5 minutes.");
    }

    SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has attempted to steal from %s.", GetRPName(playerid), GetRPName(targetid));

    new string4[32];
    format(string4, sizeof(string4), "Stealing...");
    strcpy(player_progress_title[playerid], string4);
    ShowPlayerProgress(playerid, 2, string4);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
    
    SetPVarInt(playerid, "IsStealing", targetid);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_STEAL)
    {
        new targetid = GetPVarInt(playerid, "IsStealing");
        if(!response)
        {
            DeletePVar(playerid, "IsStealing");
            return 1;
        }
        if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
        {
            DeletePVar(playerid, "IsStealing");
            return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
        }
        if(!PlayerInfo[targetid][pInjured])
        {
            DeletePVar(playerid, "IsStealing");
            return SCM(playerid, COLOR_SYNTAX, "That player is no longer injured.");
        }
        if(PlayerInfo[targetid][pLootedTime] > gettime())
        {
            DeletePVar(playerid, "IsStealing");
            return SCM(playerid, COLOR_SYNTAX, "This player has been looted in the past 5 minutes.");
        }
        switch(listitem)
        {
            case 0:
            {
                new cash = PlayerInfo[targetid][pCash], stealpercent = gStealPercent, total;
                if(PlayerInfo[targetid][pCash] < 1)
                {
                    SM(playerid, COLOR_GREEN, "%s has no cash on his hand or pocket, Better Luck Next Time!", GetRPName(targetid));
                    DeletePVar(playerid, "IsStealing");
                    return 1;
                }
                total = (cash * stealpercent) / 100;
                GivePlayerCash(targetid, -total);
                GivePlayerCash(playerid, total);
                PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                SM(playerid, COLOR_GREEN, "You have stole $%i from %s.", total, GetRPName(targetid));
                SM(targetid, COLOR_RED, "%s has stolen $%i from you.", GetRPName(playerid), total);
                SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has succeed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                DeletePVar(playerid, "IsStealing");
            }
            case 1:
            {
                new mats = PlayerInfo[targetid][pMaterials], stealpercent = gStealPercent, total;
                if(PlayerInfo[targetid][pMaterials] < 1)
                {
                    SM(playerid, COLOR_GREEN, "%s has no materials on his hand or pocket, Better Luck Next Time!", GetRPName(targetid));
                    DeletePVar(playerid, "IsStealing");
                    return 1;
                }
                total = (mats * stealpercent) / 100;
                PlayerInfo[targetid][pMaterials] -= total;
                PlayerInfo[playerid][pMaterials] += total;
                PlayerInfo[targetid][pLootedTime] = gettime() + 300;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET materials = %i WHERE uid = %i", PlayerInfo[playerid][pMaterials], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET materials = %i WHERE uid = %i", PlayerInfo[targetid][pMaterials], PlayerInfo[targetid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SM(playerid, COLOR_GREEN, "You have stole %i Materials from %s.", total, GetRPName(targetid));
                SM(targetid, COLOR_RED, "%s has stolen %i Materials from you.", GetRPName(playerid), total);
                SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has succeed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                DeletePVar(playerid, "IsStealing");
            }
            case 2:
            {
                new pot = PlayerInfo[targetid][pPot], stealpercent = gStealPercent, total;
                if(PlayerInfo[targetid][pPot] < 1)
                {
                    SM(playerid, COLOR_GREEN, "%s has no pots on his hand or pocket, Better Luck Next Time!", GetRPName(targetid));
                    DeletePVar(playerid, "IsStealing");
                    return 1;
                }
                total = (pot * stealpercent) / 100;
                PlayerInfo[targetid][pPot] -= total;
                PlayerInfo[playerid][pPot] += total;
                PlayerInfo[targetid][pLootedTime] = gettime() + 300;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", PlayerInfo[playerid][pPot], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", PlayerInfo[targetid][pPot], PlayerInfo[targetid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SM(playerid, COLOR_GREEN, "You have stole %i Pots from %s.", total, GetRPName(targetid));
                SM(targetid, COLOR_RED, "%s has stolen %i Pots from you.", GetRPName(playerid), total);
                SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has succeed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                DeletePVar(playerid, "IsStealing");
            }
            case 3:
            {
                new crack = PlayerInfo[targetid][pCrack], stealpercent = gStealPercent, total;
                if(PlayerInfo[targetid][pCrack] < 1)
                {
                    SM(playerid, COLOR_GREEN, "%s has no cracks on his hand or pocket, Better Luck Next Time!", GetRPName(targetid));
                    DeletePVar(playerid, "IsStealing");
                    return 1;
                }
                total = (crack * stealpercent) / 100;
                PlayerInfo[targetid][pCrack] -= total;
                PlayerInfo[playerid][pCrack] += total;
                PlayerInfo[targetid][pLootedTime] = gettime() + 300;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crack = %i WHERE uid = %i", PlayerInfo[playerid][pCrack], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crack = %i WHERE uid = %i", PlayerInfo[targetid][pCrack], PlayerInfo[targetid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SM(playerid, COLOR_GREEN, "You have stole %i cracks from %s.", total, GetRPName(targetid));
                SM(targetid, COLOR_RED, "%s has stolen %i cracks from you.", GetRPName(playerid), total);
                SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has succeed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                DeletePVar(playerid, "IsStealing");
            }
            case 4:
            {
                //DeletePVar(playerid, "IsStealing");
                ShowPlayerDialog(playerid, Loot_Weapon, DIALOG_STYLE_LIST, "Choose what you want to loot for this player", "Deagle\nShotgun\nMP5\nAK47\nRifle\nKatana\nBat", ">>>", "Cancel");
                //return SCM(playerid, COLOR_SYNTAX, "Stealing Weapons are still under development.");
            }
        }

    }
    if(dialogid == Loot_Weapon)
    {
        new targetid = GetPVarInt(playerid, "IsStealing");
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    if(!PlayerHasWeapon(targetid, 24)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 24);
                    GivePlayerWeaponEx(playerid, 24, 75);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your Deseart Eagle weapon", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole the Deseart Eagle weapon from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 1:
                {
                    if(!PlayerHasWeapon(targetid, 25)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 25);
                    GivePlayerWeaponEx(playerid, 25, 40);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your shotgun", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole the shotgun from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 2:
                {
                    if(!PlayerHasWeapon(targetid, 29)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 29);
                    GivePlayerWeaponEx(playerid, 29, 200);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your MP5 weapon", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole MP5 weapon from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 3:
                {
                    if(!PlayerHasWeapon(targetid, 30)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 30);
                    GivePlayerWeaponEx(playerid, 30, 150);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your Ak47 weapon", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole Ak47 weapon from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 4:
                {
                    if(!PlayerHasWeapon(targetid, 33)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 33);
                    GivePlayerWeaponEx(playerid, 33, 50);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your Rifle weapon", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole Rifle weapon from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 5:
                {
                    if(!PlayerHasWeapon(targetid, 8)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 8);
                    GivePlayerWeaponEx(playerid, 8, 1);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your Katana", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole Katana from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
                case 6:
                {
                    if(!PlayerHasWeapon(targetid, 5)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon."), DeletePVar(playerid, "IsStealing");

                    RemovePlayerWeapon(targetid, 5);
                    GivePlayerWeaponEx(playerid, 5, 1);

                    SendMessage(targetid, COLOR_YELLOW, "%s has stole your Katana", GetRPName(playerid));
                    SendMessage(playerid, COLOR_YELLOW, "You stole Katana from %s", GetRPName(targetid));
                    PlayerInfo[targetid][pLootedTime] = gettime() + 300;
                    DeletePVar(playerid, "IsStealing");
                }
            }
        }
    }

    #if defined Loot_OnDialogResponse
		return Loot_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Loot_OnDialogResponse
#if defined Loot_OnDialogResponse
	forward Loot_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif