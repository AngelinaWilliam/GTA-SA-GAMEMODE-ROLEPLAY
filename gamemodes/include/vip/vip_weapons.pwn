/*

    VIP Lifetime Weapon System
        
        Created:
            > Genjii#4764 - Head Development Legacy Gaming 

*/

CMD:setvipwep(playerid, params[])
{
    new targetid;
    if(PlayerInfo[playerid][pAdmin] < 2)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 5)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
    if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /gethere [playerid]");
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	}
	if(!IsPlayerSpawned(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is either not spawned, or spectating.");
	}

    PlayerInfo[targetid][pVIPWeapons] = 1;
    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has made %s a part of VIP Lifetime Weapons.", GetRPName(playerid), GetRPName(targetid));

    SendMessage(playerid, COLOR_WHITE, "You have made %s a part of VIP Lifetime Weapons.", GetRPName(targetid));
    SendMessage(targetid, COLOR_WHITE, "%s has made you a part of VIP Lifetime Weapons (/vipweaponhelp).", GetRPName(playerid));
    return 1;
}

CMD:vipweaponhelp(playerid, params[])
{
    if(!PlayerInfo[playerid][pVIPWeapons])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP Weapons subscription.");
	}
    SendClientMessage(playerid, COLOR_SYNTAX, "VIP Lifetime Weapon Command:");
    SendClientMessage(playerid, COLOR_WHITE, "Available Commands: /getsawnoff, /get9mm, /getuzi, /gettec9");
    return 1;
}

CMD:getsawnoff(playerid, params[])
{
    if(!PlayerInfo[playerid][pVIPWeapons])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP Weapons subscription.");
	}

	new weaponid = 26;
	switch(weaponid)
	{
		case 22, 23: if(!PlayerInfo[playerid][pWeaponLicense][0]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 1 Weapon License on them.");
		case 32, 28: if(!PlayerInfo[playerid][pWeaponLicense][1]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 2 Weapon License on them.");
		case 25, 26, 27, 29: if(!PlayerInfo[playerid][pWeaponLicense][2]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 3 Weapon License on them.");
		case 24, 30: if(!PlayerInfo[playerid][pWeaponLicense][3]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 4 Weapon License on them.");
		case 31, 33, 34: if(!PlayerInfo[playerid][pWeaponLicense][4]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 5 Weapon License on them.");
	}

    GivePlayerWeaponEx(playerid, 26, 150);
    SendClientMessage(playerid, COLOR_YELLOW, "[VIP WEAPONS] You have received dual sawn off");
    return 1;
}

CMD:get9mm(playerid, params[])
{
    if(!PlayerInfo[playerid][pVIPWeapons])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP Weapons subscription.");
	}
	
	new weaponid = 22;
	switch(weaponid)
	{
		case 22, 23: if(!PlayerInfo[playerid][pWeaponLicense][0]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 1 Weapon License on them.");
		case 32, 28: if(!PlayerInfo[playerid][pWeaponLicense][1]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 2 Weapon License on them.");
		case 25, 26, 27, 29: if(!PlayerInfo[playerid][pWeaponLicense][2]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 3 Weapon License on them.");
		case 24, 30: if(!PlayerInfo[playerid][pWeaponLicense][3]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 4 Weapon License on them.");
		case 31, 33, 34: if(!PlayerInfo[playerid][pWeaponLicense][4]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 5 Weapon License on them.");
	}

    GivePlayerWeaponEx(playerid, 22, 200);
    SendClientMessage(playerid, COLOR_YELLOW, "[VIP WEAPONS] You have received dual 9mm");
    return 1;
}

CMD:getuzi(playerid, params[])
{
    if(!PlayerInfo[playerid][pVIPWeapons])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP Weapons subscription.");
	}
	
	new weaponid = 28;
	switch(weaponid)
	{
		case 22, 23: if(!PlayerInfo[playerid][pWeaponLicense][0]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 1 Weapon License on them.");
		case 32, 28: if(!PlayerInfo[playerid][pWeaponLicense][1]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 2 Weapon License on them.");
		case 25, 26, 27, 29: if(!PlayerInfo[playerid][pWeaponLicense][2]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 3 Weapon License on them.");
		case 24, 30: if(!PlayerInfo[playerid][pWeaponLicense][3]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 4 Weapon License on them.");
		case 31, 33, 34: if(!PlayerInfo[playerid][pWeaponLicense][4]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 5 Weapon License on them.");
	}

    GivePlayerWeaponEx(playerid, 28, 300);
    SendClientMessage(playerid, COLOR_YELLOW, "[VIP WEAPONS] You have received dual micro uzi");
    return 1;
}

CMD:gettec9(playerid, params[])
{
    if(!PlayerInfo[playerid][pVIPWeapons])
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP Weapons subscription.");
	}
	
	new weaponid = 32;
	switch(weaponid)
	{
		case 22, 23: if(!PlayerInfo[playerid][pWeaponLicense][0]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 1 Weapon License on them.");
		case 32, 28: if(!PlayerInfo[playerid][pWeaponLicense][1]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 2 Weapon License on them.");
		case 25, 26, 27, 29: if(!PlayerInfo[playerid][pWeaponLicense][2]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 3 Weapon License on them.");
		case 24, 30: if(!PlayerInfo[playerid][pWeaponLicense][3]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 4 Weapon License on them.");
		case 31, 33, 34: if(!PlayerInfo[playerid][pWeaponLicense][4]) return SendClientMessage(playerid, COLOR_SYNTAX, "That player has no Level 5 Weapon License on them.");
	}

    GivePlayerWeaponEx(playerid, 32, 300);
    SendClientMessage(playerid, COLOR_YELLOW, "[VIP WEAPONS] You have received dual tec 9");
    return 1;
}