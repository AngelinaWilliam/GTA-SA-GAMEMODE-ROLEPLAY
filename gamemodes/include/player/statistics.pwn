/*
	Player Statistics
		Settings & Inventory 

	Developed by:
		Genjii#4765 (Jericho Terrobias)
*/

stock ReturnDate()
{
	new sendString[90], MonthStr[40], month, day, year;
	
	getdate(year, month, day);
	switch(month)
	{
	    case 1:  MonthStr = "January";
	    case 2:  MonthStr = "February";
	    case 3:  MonthStr = "March";
	    case 4:  MonthStr = "April";
	    case 5:  MonthStr = "May";
	    case 6:  MonthStr = "June";
	    case 7:  MonthStr = "July";
	    case 8:  MonthStr = "August";
	    case 9:  MonthStr = "September";
	    case 10: MonthStr = "October";
	    case 11: MonthStr = "November";
	    case 12: MonthStr = "December";
	}
	
	format(sendString, 90, "%s %d, %d", MonthStr, day, year);
	return sendString;
}

stock ShowStatsDialog(playerid, targetid)
{
	new string[1028], header[128];
	new exp = (PlayerInfo[targetid][pLevel] * 4);
	new Float:health, Float:armor;
	GetPlayerHealth(targetid, health);
	GetPlayerArmour(targetid, armor);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(targetid, x, y, z);

	new gender[16];
	if(PlayerInfo[targetid][pGender] == 1) { gender = "Male"; } else { gender = "Female"; }
	new age = PlayerInfo[targetid][pAge];

	new insurance[64];
	switch(PlayerInfo[targetid][pInsurance])
	{
		case 1: insurance = "County General Hospital";
		case 2: insurance = "Allsaints General Hospital";
		default: insurance = "None";
	}

	new user[33], id[5];
	DCC_GetUserName(DCC_FindUserById(PlayerInfo[targetid][pDiscord]), user, sizeof(user));
	DCC_GetUserDiscriminator(DCC_FindUserById(PlayerInfo[targetid][pDiscord]), id, sizeof(id));

	SetPVarInt(playerid, "ShowStats", targetid);

	strcat(string, "Stats Name:\tInformations:");
	format(header, sizeof(header), "Player Stats of %s in "SERVER_NAME" - %s", GetRPName(targetid), ReturnDate());
	format(string, sizeof(string), "%s\n\
	Name:\t%s\n\
	Discord:\t%s#%s\n\
	Current Location:\t%s (%f, %f, %f)\n\
	Age:\t%d\n\
	Gender:\t%s\n\
	Level:\t%s\n\
	Health:\t%.1f\n\
	Armor:\t%.1f\n\
	Hunger:\t%.1f\n\
	Thirst:\t%.1f\n\
	Stress:\t%.1f\n\
	Playing Hours:\t%s\n\
	Upgrade Points:\t%i\n\
	Experience:\t%i / %i\n\
	Paycheck:\t%s\n\
	Job 1:\t%s\n\
	Job 2:\t%s\n\
	Insurance:\t%s\n\
	Virtual World:\t%i", string,
	GetRPName(targetid),
	user, id,
	GetPlayerZoneName(targetid),
	x, y, z,
	age,
	gender,
	number_format(PlayerInfo[targetid][pLevel]), 
	GetPlayerHealth(targetid, health),
	GetPlayerArmour(targetid, armor),
	PlayerInfo[targetid][pHunger],
	PlayerInfo[targetid][pThirst],
	PlayerInfo[targetid][pStress],
	number_format(PlayerInfo[targetid][pHours]),
	PlayerInfo[targetid][pUpgradePoints],
	PlayerInfo[targetid][pEXP], 
	exp, 
	number_format(PlayerInfo[targetid][pPaycheck]),
	GetJobName(PlayerInfo[targetid][pJob]), 
	GetJobName(PlayerInfo[targetid][pSecondJob]),
	insurance,
	GetPlayerVirtualWorld(targetid));
	ShowPlayerDialog(playerid, DIALOG_NEXT_STATS, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Next", "Close");
	return 1;
}

DisplayInventory(playerid, targetid)
{
	SetPVarInt(playerid, "ShowInventory", targetid);

    new string[1028], header[128];
	strcat(string, "Inventory Name:\tInformations:");
	format(header, sizeof(header), "Player Inv of %s in "SERVER_NAME" - %s", GetRPName(targetid), ReturnDate());
	format(string, sizeof(string), "%s\n\
	Total Wealth:\t$%s\n\
	Cash:\t$%s\n\
	Bank:\t$%s\n\
	Diamond:\t%i\n\
	Gold:\t%i\n\
	Silver:\t%i\n\
	Phone Number:\t%i\n\
	Radio Frequency:\t%i khz\n\
	Dirty Cash:\t%d\n\
	Materials:\t%s\n\
	Pot:\t%s\n\
	Crack:\t%s\n\
	Seeds:\t%s\n\
	Meth:\t%s\n\
	Ephedrine:\t%s\n\
	Rope::\t%s\n\
	Cigars:\t%s\n\
	Spray Cans:\t%s\n\
	Muriatic Acid:\t%s\n\
	GPS:\t%s",
	string,
	number_format(PlayerInfo[targetid][pCash] + PlayerInfo[targetid][pBank]),
	number_format(PlayerInfo[targetid][pCash]),
	number_format(PlayerInfo[targetid][pBank]),
	PlayerInfo[targetid][pDiamond],
	PlayerInfo[targetid][pGold],
	PlayerInfo[targetid][pSilver],
	PlayerInfo[targetid][pPhone],
	PlayerInfo[targetid][pWalkieTalkie],
	number_format(PlayerInfo[targetid][pDirtyCash]),
	number_format(PlayerInfo[targetid][pMaterials]),
	number_format(PlayerInfo[targetid][pPot]),
	number_format(PlayerInfo[targetid][pCrack]),
	number_format(PlayerInfo[targetid][pSeeds]),
	number_format(PlayerInfo[targetid][pMeth]),
	number_format(PlayerInfo[targetid][pEphedrine]),
	number_format(PlayerInfo[targetid][pRope]),
	number_format(PlayerInfo[targetid][pCigars]),
	number_format(PlayerInfo[targetid][pSpraycans]),
	number_format(PlayerInfo[targetid][pMuriaticAcid]),
	PlayerInfo[targetid][pGPS] ? ("Yes") : ("No"));
	ShowPlayerDialog(playerid, DIALOG_NEXT_INVENTORY, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Next", "Close");
	return 1;
}

CMD:checkstats(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 3)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

	if(sscanf(params, "u", targetid))
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /check [playerid]");
	
	if(!IsPlayerConnected(targetid))
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	
	if(!PlayerInfo[targetid][pLogged])
	    return SendClientMessage(playerid, COLOR_SYNTAX, "That player hasn't logged in yet.");
	
	ShowStatsDialog(playerid, targetid);
	return 1;
}

CMD:checkinv(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 3)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

	if(sscanf(params, "u", targetid))
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /check [playerid]");
	
	if(!IsPlayerConnected(targetid))
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	
	if(!PlayerInfo[targetid][pLogged])
	    return SendClientMessage(playerid, COLOR_SYNTAX, "That player hasn't logged in yet.");
	
	DisplayInventory(playerid, targetid);
	return 1;
}

CMD:stats(playerid, params[])
{
	if(!PlayerInfo[playerid][pLogged])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "That player hasn't logged in yet.");
	}
	ShowStatsDialog(playerid, playerid);
	return 1;
}

CMD:inv(playerid, params[]) return callcmd::inventory(playerid, params);
CMD:inventory(playerid, params[])
{
	if(!PlayerInfo[playerid][pLogged])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "That player hasn't logged in yet.");
	}
	DisplayInventory(playerid, playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_NEXT_STATS)
	{
		new targetid = GetPVarInt(playerid, "ShowStats");
		if(response) 
		{
			new faction[48], facrank[32], gang[32], gangrank[32];
			if(PlayerInfo[targetid][pFaction] >= 0)
			{
				if(!strcmp(FactionInfo[PlayerInfo[targetid][pFaction]][fShortName], "", true))
				{
					strcpy(faction, FactionInfo[PlayerInfo[targetid][pFaction]][fName]);
				}
				else
				{
					strcpy(faction, FactionInfo[PlayerInfo[targetid][pFaction]][fShortName]);
				}

				format(facrank, sizeof(facrank), "%i %s ", PlayerInfo[targetid][pFactionRank], FactionRanks[PlayerInfo[targetid][pFaction]][PlayerInfo[targetid][pFactionRank]]);
			}
			else
			{
				faction = "None";
				facrank = "None";
			}
			if(PlayerInfo[targetid][pGang] >= 0)
			{
				strcpy(gang, GangInfo[PlayerInfo[targetid][pGang]][gName]);
				strcpy(gangrank, GangRanks[PlayerInfo[targetid][pGang]][PlayerInfo[targetid][pGangRank]]);
			}
			else
			{
				gang = "None";
				gangrank = "None";
			}

			new string[1028], header[128];
			strcat(string, "Stats Name:\tInformations:");
			format(header, sizeof(header), "Player Stats of %s in "SERVER_NAME" - %s", GetRPName(targetid), ReturnDate());
			format(string, sizeof(string), "%s\n\
			Faction: \t%s\n\
			Faction Rank: \t%s\n\
			Gang: \t%s\n\
			Gang Rank: \t%s\n\
			Wanted Level:\t%i\n\
			Total Crime:\t%i\n\
			Total Arrest:\t%i\n\
			Warnings:\t%i\n\
			Referral:\t%i\n\
			Newbie chat muted:\t%i\n\
			Global chat muted:\t%i", string, 
			faction, facrank,
			gang, gangrank,
			PlayerInfo[targetid][pWantedLevel],
			PlayerInfo[targetid][pCrimes],
			PlayerInfo[targetid][pArrested],
			PlayerInfo[targetid][pWarnings],
			PlayerInfo[targetid][pReferralUID],
			PlayerInfo[targetid][pNewbieMuted],
			PlayerInfo[targetid][pGlobalMuted]);
			ShowPlayerDialog(playerid, DIALOG_PREV_STATS, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Prev", "Close");
		}
	}
	if(dialogid == DIALOG_NEXT_INVENTORY)
	{
		new targetid = GetPVarInt(playerid, "ShowInventory");
		if(response)
		{
			if(response)
			{
				new string[1028], header[128];

				strcat(string, "Inventory Name:\tInformations:");
				format(header, sizeof(header), "Player Inv of %s in "SERVER_NAME" - %s", GetRPName(targetid), ReturnDate());
				format(string, sizeof(string), "%s\n\
				First Aid:\t%s\n\
				Gas Can:\t%s\n\
				Flashlight:\t%s\n\
				Fishing Rod:\t%s\n\
				Fish Bait:\t%s\n\
				Mask:\t%s\n\
				Blind Fold\t%s\n\
				Phonebook:\t%s\n\
				MP3 Player:\t%s",
				string,
				number_format(PlayerInfo[targetid][pFirstAid]),
				number_format(PlayerInfo[targetid][pGasCan]),
				PlayerInfo[targetid][pFlashlight] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pFishingRod] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pFishingBait] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pMask] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pBlindfold] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pPhonebook] ? ("Yes") : ("None"),
				PlayerInfo[targetid][pMP3Player] ? ("Yes") : ("None"));
				ShowPlayerDialog(playerid, DIALOG_PREV_INVENTORY, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Next", "Close");
			}
		}
	}
	if(dialogid == DIALOG_PREV_STATS)
	{
		new targetid = GetPVarInt(playerid, "ShowInventory");
		if(response) ShowStatsDialog(playerid, targetid);
	}
	if(dialogid == DIALOG_PREV_INVENTORY)
	{
		new targetid = GetPVarInt(playerid, "ShowInventory");
		if(response) DisplayInventory(playerid, targetid);
	}
	#if defined Statistics_OnDialogResponse
		return Statistics_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Statistics_OnDialogResponse
#if defined Statistics_OnDialogResponse
	forward Statistics_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif