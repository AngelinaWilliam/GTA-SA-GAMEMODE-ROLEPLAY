CMD:lootplayer(playerid, params[])
{
    new targetid, string[1028], header[1028];
    if(sscanf(params, "u", targetid))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /lootplayer [playerid]");
        return 1;
	}
    if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	}
	if(targetid == playerid)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can't carry yourself.");
	}
	if(!PlayerInfo[targetid][pInjured])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player isn't injured!");
	}
    if(gettime() - PlayerInfo[playerid][pLastLoot] < 240)
	{
	    return SendMessage(playerid, COLOR_SYNTAX, "You can only loot in this player every 2 minutes. Please wait %i more seconds.", 240 - (gettime() - PlayerInfo[playerid][pLastLoot]));
	}

    PlayerInfo[playerid][pLastLoot] = gettime();

    SetPVarInt(playerid, "lootplayer", targetid);
    format(header, sizeof(header), "Choose what you want to loot for this player");
    format(string, sizeof(string), "Weapon\nDirty Cash(%d)\nCash(%d)\nMaterials(%d)\nPot(%d)\nDrugs(%d)", PlayerInfo[targetid][pDirtyCash], PlayerInfo[targetid][pCash], PlayerInfo[targetid][pMaterials], PlayerInfo[targetid][pPot], PlayerInfo[targetid][pCrack]);
    Dialog_Show(playerid, Loot_Player, DIALOG_STYLE_LIST, header, string, ">>>", "Cancel");
    return 1;
}

Dialog:Loot_Player(playerid, response, listitem, inputtext[]) 
{
    new string[1028], header[1028], targetid = GetPVarInt(playerid, "lootplayer");
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                format(header, sizeof(header), "Choose what you want to loot for this player");
                format(string, sizeof(string), "Deagle\nSpas\nM4A1\nAK47");
                Dialog_Show(playerid, Loot_Weapon, DIALOG_STYLE_LIST, header, string, ">>>", "Cancel");
            }
            case 1:
            {
                new cash = 10000 + random(20000);
                if(PlayerInfo[targetid][pDirtyCash] < 0) return SendClientMessage(playerid, COLOR_SYNTAX, "This player does not have dirty cash");

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your dirty cash %s", GetRPName(playerid), number_format(cash));
                SendMessage(playerid, COLOR_YELLOW, "You looted $%s dirty cash from %s", number_format(cash), GetRPName(targetid));

                PlayerInfo[targetid][pDirtyCash] -= cash;
                PlayerInfo[playerid][pDirtyCash] += cash;
            }
            case 2:
            {
                new cash = 10000 + random(20000);
                if(PlayerInfo[targetid][pCash] < 0) return SendClientMessage(playerid, COLOR_SYNTAX, "This player does not have cash");

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your cash %s", GetRPName(playerid), number_format(cash));
                SendMessage(playerid, COLOR_YELLOW, "You looted $%s cash from %s", number_format(cash), GetRPName(targetid));

                GivePlayerCash(targetid, -cash);
                GivePlayerCash(playerid, cash);
            }
            case 3:
            {
                new materials = 1000 + random(5000);
                if(PlayerInfo[targetid][pMaterials] < 0) return SendClientMessage(playerid, COLOR_SYNTAX, "This player does not have materials");

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your materials %s", GetRPName(playerid), number_format(materials));
                SendMessage(playerid, COLOR_YELLOW, "You looted $%s materials from %s", number_format(materials), GetRPName(targetid));

                PlayerInfo[targetid][pMaterials] -= materials;
                PlayerInfo[playerid][pMaterials] += materials;
            }
            case 4:
            {
                new pot = 5 + random(10);
                if(!PlayerInfo[targetid][pPot]) return SendClientMessage(playerid, COLOR_SYNTAX, "This player does not have pot");

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your pot %s", GetRPName(playerid), number_format(pot));
                SendMessage(playerid, COLOR_YELLOW, "You looted %s pot from %s", number_format(pot), GetRPName(targetid));

                PlayerInfo[targetid][pPot] -= pot;
                PlayerInfo[playerid][pPot] += pot;
            }
            case 5:
            {
                new crack = 5 + random(10);
                if(!PlayerInfo[targetid][pCrack]) return SendClientMessage(playerid, COLOR_SYNTAX, "This player does not have crack");

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your crack %s", GetRPName(playerid), number_format(crack));
                SendMessage(playerid, COLOR_YELLOW, "You looted %s crack from %s", number_format(crack), GetRPName(targetid));

                PlayerInfo[targetid][pCrack] -= crack;
                PlayerInfo[playerid][pCrack] += crack;
            }
        }
    }
    return 1;
}

Dialog:Loot_Weapon(playerid, response, listitem, inputtext[]) 
{
    new targetid = GetPVarInt(playerid, "lootplayer");
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(!PlayerHasWeapon(targetid, 24)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon.");

                RemovePlayerWeapon(targetid, 24);
                GivePlayerWeaponEx(playerid, 24, 150);

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your Deseart Eagle weapon", GetRPName(playerid));
                SendMessage(playerid, COLOR_YELLOW, "You looted Deseart Eagle weapon from %s", GetRPName(targetid));
            }
            case 1:
            {
                if(!PlayerHasWeapon(targetid, 26)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon.");

                RemovePlayerWeapon(targetid, 26);
                GivePlayerWeaponEx(playerid, 26, 100);

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your Combat Shotgun weapon", GetRPName(playerid));
                SendMessage(playerid, COLOR_YELLOW, "You looted Combat Shotgun weapon from %s", GetRPName(targetid));
            }
            case 2:
            {
                if(!PlayerHasWeapon(targetid, 31)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon.");

                RemovePlayerWeapon(targetid, 31);
                GivePlayerWeaponEx(playerid, 31, 300);

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your M4A1 weapon", GetRPName(playerid));
                SendMessage(playerid, COLOR_YELLOW, "You looted M4A1 weapon from %s", GetRPName(targetid));
            }
            case 3:
            {
                if(!PlayerHasWeapon(targetid, 30)) return SendClientMessage(playerid, COLOR_SYNTAX, "That player don't have that weapon.");

                RemovePlayerWeapon(targetid, 30);
                GivePlayerWeaponEx(playerid, 30, 300);

                SendMessage(targetid, COLOR_YELLOW, "%s has loot your Ak47 weapon", GetRPName(playerid));
                SendMessage(playerid, COLOR_YELLOW, "You looted Ak47 weapon from %s", GetRPName(targetid));
            }
        }
    }
    return 1;
}