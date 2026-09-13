stock ShowPlayerBackPack(playerid)
{
	new string[1028], header[1028];
	format(header, sizeof(header), "Backpack Menu - Owned By: %s", GetRPName(playerid));
	format(string, sizeof(string),
		"Items:\tInformation:\n\
		Cash:\t%s\n\
		Pots:\t%sg\n\
		Cracks:\t%sg\n\
		Materials:\t%s\n",
		number_format(PlayerInfo[playerid][bpCash]),
		number_format(PlayerInfo[playerid][bpPot]),
		number_format(PlayerInfo[playerid][bpCrack]),
		number_format(PlayerInfo[playerid][bpMaterials]));
	if(PlayerInfo[playerid][pBackpack] == 1) {
		format(string, sizeof(string),
			"%s\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)",
			string,
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][0]), PlayerInfo[playerid][bpAmmo][0],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][1]), PlayerInfo[playerid][bpAmmo][1],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][2]), PlayerInfo[playerid][bpAmmo][2]);
	}
	else if(PlayerInfo[playerid][pBackpack] == 2) {
		format(string, sizeof(string),
			"%s\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)",
			string,
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][0]), PlayerInfo[playerid][bpAmmo][0],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][1]), PlayerInfo[playerid][bpAmmo][1],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][2]), PlayerInfo[playerid][bpAmmo][2],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][3]), PlayerInfo[playerid][bpAmmo][3],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][4]), PlayerInfo[playerid][bpAmmo][4]);
	}
	else if(PlayerInfo[playerid][pBackpack] == 3) {
		format(string, sizeof(string),
			"%s\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)\n\
			Weapon:\t%s (Ammo: %i)",
			string,
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][0]), PlayerInfo[playerid][bpAmmo][0],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][1]), PlayerInfo[playerid][bpAmmo][1],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][2]), PlayerInfo[playerid][bpAmmo][2],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][3]), PlayerInfo[playerid][bpAmmo][3],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][4]), PlayerInfo[playerid][bpAmmo][4],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][5]), PlayerInfo[playerid][bpAmmo][5],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][6]), PlayerInfo[playerid][bpAmmo][6],
			GetWeaponNameEx(PlayerInfo[playerid][bpWeapons][7]), PlayerInfo[playerid][bpAmmo][7]);
	}
	ShowPlayerDialog(playerid, DIALOG_BP_MAIN, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Select", "Cancel");
	return 1;
}

CMD:backpackhelp(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "Available Commands");
	SendClientMessage(playerid, COLOR_SYNTAX, "Commands: /bopen, /bwear, /bunwear");
	return 1;
}

CMD:bopen(playerid, params[])
{
	if(enabledpurge) return SendClientMessage(playerid, COLOR_SYNTAX, "The purge is enable at the moment.");
	if(PlayerInfo[playerid][bpWearing] == 0)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You must be wearing your backpack to use this command"); 
	}
	if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0 || PlayerInfo[playerid][pDueling] != INVALID_PLAYER_ID)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
	}
	if(GetHealth(playerid) < 60)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can't drop weapons if your health is below 60.");
	}

	new string[128];
	format(string, sizeof(string), "lays down and opens a backpack.");
	callcmd::me(playerid, string);

	ShowPlayerBackPack(playerid);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:bwear(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pJoinedEvent])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
	}
	if(!PlayerInfo[playerid][bpWearing])
	{
		if(PlayerInfo[playerid][pBackpack] == 1)
		{
			format(string, sizeof(string), "wears his small backpack on his back.");
			callcmd::me(playerid, string);

			SetPlayerAttachedObject(playerid, 1, 3026,1,-0.157000,-0.071000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
		}
		else if(PlayerInfo[playerid][pBackpack] == 2)
		{
			format(string, sizeof(string), "wears his medium backpack on his back.");
			callcmd::me(playerid, string);

			SetPlayerAttachedObject(playerid, 1, 3026,1,-0.157000,-0.071000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
		}
		else if(PlayerInfo[playerid][pBackpack] == 3)
		{
			format(string, sizeof(string), "wears his large backpack on his back.");
			callcmd::me(playerid, string);

			SetPlayerAttachedObject(playerid, 1, 3026,1,-0.157000,-0.071000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
		}
		PlayerInfo[playerid][bpWearing] = 1;
	}
    return 1;
}

CMD:bunwear(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pBackpack] == 1)
	{
		format(string, sizeof(string), "takes off his small backpack from his back.");
		callcmd::me(playerid, string);

		PlayerInfo[playerid][bpWearing] = 0;
		RemovePlayerAttachedObject(playerid, 1);
	}
	else if(PlayerInfo[playerid][pBackpack] == 2)
	{
		format(string, sizeof(string), "takes off his medium backpack from his back.");
		callcmd::me(playerid, string);
		
		PlayerInfo[playerid][bpWearing] = 0;
		RemovePlayerAttachedObject(playerid, 1);
	}
	else if(PlayerInfo[playerid][pBackpack] == 3)
	{
		format(string, sizeof(string), "takes off his large backpack from his back.");
		callcmd::me(playerid, string);
		
		PlayerInfo[playerid][bpWearing] = 0;
		RemovePlayerAttachedObject(playerid, 1);
	}
	return 1;
}

// Admin Commands
CMD:givebackpack(playerid, params[])
{
	new targetid, size[10];
	if(PlayerInfo[playerid][pAdmin] < 8)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "us[14]S()[32]", targetid, size))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /givebackpack [playerid] [size]");
	    SendClientMessage(playerid, COLOR_WHITE, "Sizes:   Small, Medium, Large");
	    return 1;
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	}
	if(!strcmp(size, "small", true))
	{
		PlayerInfo[targetid][pBackpack] = 1;
	    SendMessage(targetid, COLOR_WHITE, "* %s has given you a small backpack.", GetRPName(playerid));
	    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has given %s a small backpack.", GetRPName(playerid), GetRPName(targetid));
	}
	if(!strcmp(size, "medium", true))
	{
		PlayerInfo[targetid][pBackpack] = 2;
	    SendMessage(targetid, COLOR_WHITE, "* %s has given you a medium backpack.", GetRPName(playerid));
	    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has given %s a medium backpack.", GetRPName(playerid), GetRPName(targetid));
	}
	if(!strcmp(size, "large", true))
	{
		PlayerInfo[targetid][pBackpack] = 3;
	    SendMessage(targetid, COLOR_WHITE, "* %s has given you a large backpack.", GetRPName(playerid));
	    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has given %s a large backpack.", GetRPName(playerid), GetRPName(targetid));
	}
	return 1;
}

CMD:resetbackpack(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "u", targetid))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /resetbackpack [playerid]");
	    SendClientMessage(playerid, COLOR_SYNTAX, "* This command removes the player's backpack and all items inside it.");
	    return 1;
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	}
	ResetBackpack(targetid);
	SendMessage(targetid, COLOR_LIGHTRED, "Administrator %s has reset your backpack and all its items.", GetRPName(playerid));
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has reset %s's backpack and all its items.", GetRPName(playerid), GetRPName(targetid));
	return 1;
}