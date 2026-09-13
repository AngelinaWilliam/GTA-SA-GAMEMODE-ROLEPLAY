
new purgeAnnouncer[MAX_PLAYERS];
new PlayerText:PurgeTD[MAX_PLAYERS][5];

stock ShowPurgeConfiguration(playerid)
{ 
    new string [1028], header[1028];
    strcat(string, "List:\tDescription:");
    format(header, sizeof(header), ""SERVER_NAME" Configuration");
    format(string, sizeof(string), "%s\n\
    "YELLOW"Start Purge\tTo start the purge system\n\
    "YELLOW"Announce Weapon\tSo they can receive a weapon\n\
    "RED"End Purge\tTo end the purge system", string);
    ShowPlayerDialog(playerid, DIALOG_SETUP_PURGE, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Select", "Cancel");
    return 1;
}

CMD:configpurge(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 5)    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
    ShowPurgeConfiguration(playerid);
    return 1;
}

CMD:purgewep(playerid, params[])
{
	if(!enabledpurge)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The purge is disabled at the moment.");
	}
	if(PlayerInfo[playerid][pPurge])
	{
		GiveWeapon(playerid, 5, true);
		GiveWeapon(playerid, 22, true);
		GiveWeapon(playerid, 30, true);
		SendClientMessage(playerid, COLOR_SYNTAX,"SERVER: Given you 9mm, Baseball bat, and AK-47 for the purge.");
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_SETUP_PURGE:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
						enabledpurge = 1;
						foreach(new i: Player)
						{
							PlayAudioStreamForPlayer(i, "http://c.top4top.io/m_27979s5ka1.mp3");
							PlayerInfo[i][pPurge] = 1;

							SavePlayerVariables(i);
							ResetPlayerWeapons(i);
						}
						SetWeather(20);
						SendMessageToAll(SERVER_COLOR, "(( Administrator %s enabled the Purge. ))", GetRPName(playerid));
                     }
                     case 1:
                     {
	                     if(!enabledpurge) return SendClientMessage(playerid, COLOR_SYNTAX, "The purge is disabled at the moment.");
	                     SendClientMessage(playerid, COLOR_YELLOW, "Purge is now starting type /purgewep to get weapons");
                     }
                     case 2:
                     {
						if(!enabledpurge) return SendClientMessage(playerid, COLOR_SYNTAX, "The purge is disabled at the moment.");
						foreach(new i: Player) 
						{
							PlayerInfo[i][pPurge] = 0;
							StopAudioStreamForPlayer(i);
							
							SetPlayerWeapons(i);
						}
	                    enabledpurge = 0;
						SetWeather(17);
					    SendMessageToAll(SERVER_COLOR, "(( Administrator %s disabled the Purge. ))", GetRPName(playerid));
                     }
                }
            }
        }
    }
    #if defined Purge_OnDialogResponse
		return Purge_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}

public OnPlayerUpdate(playerid)
{
	new string[128];
    if(enabledpurge) 
	{
		SetWeather(20);
		PlayerInfo[playerid][pPurge] = 1;

		format(string, sizeof(string), "%d", PlayerInfo[playerid][pPurgeKill]);
		PlayerTextDrawSetString(playerid, PurgeTD[playerid][3], string);

		format(string, sizeof(string), "%d", PlayerInfo[playerid][pPurgeDeath]);
		PlayerTextDrawSetString(playerid, PurgeTD[playerid][4], string);
		
		for(new i = 0; i < 5; i++) PlayerTextDrawShow(playerid, PurgeTD[playerid][i]);
	}
	else 
	{
		for(new i = 0; i < 5; i++) PlayerTextDrawHide(playerid, PurgeTD[playerid][i]);

		PlayerInfo[playerid][pPurge] = 0;

		PlayerInfo[playerid][pPurgeKill] = 0;
		PlayerInfo[playerid][pPurgeDeath] = 0;

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET purgekill = %i WHERE uid = %i", PlayerInfo[playerid][pPurgeKill], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET purgedeath = %i WHERE uid = %i", PlayerInfo[playerid][pPurgeDeath], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);
	}
    
    #if defined Purge_OnPlayerUpdate
		return Purge_OnPlayerUpdate(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerSpawn(playerid)
{
    if(enabledpurge) 
	{
		PlayerInfo[playerid][pPurge] = 1;
		PlayAudioStreamForPlayer(playerid, "http://e.top4top.io/m_2656b6si71.mp3");
		SendClientMessage(playerid, COLOR_YELLOW, "Purge is now starting type /purgewep to get weapons");
	}
    
    #if defined Purge_OnPlayerSpawn
		return Purge_OnPlayerSpawn(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new string[128];
	if(enabledpurge) 
	{
		if(PlayerInfo[playerid][pPurge] > 0)
		{
			purgeAnnouncer[killerid] += 1;
			PlayerInfo[killerid][pPurgeKill] += 1;
			
			if(PlayerInfo[playerid][pPurge])
			{
				if(killerid == INVALID_PLAYER_ID) 
				{
					purgeAnnouncer[playerid] = 0;
					PlayerInfo[killerid][pPurgeKill] += 1;
					format(string, sizeof(string), "%d", PlayerInfo[killerid][pPurgeKill]);
					PlayerTextDrawSetString(killerid, PurgeTD[killerid][3], string);

					mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET purgekill = %i WHERE uid = %i", PlayerInfo[killerid][pPurgeKill], PlayerInfo[killerid][pID]);
					mysql_tquery(connectionID, queryBuffer);
				} 
				else 
				{
					purgeAnnouncer[playerid] = 0;
					if(purgeAnnouncer[killerid] > 4) {
						SendMessageToAll(0x84f542ff, "%s is above godlike.", GetRPName(killerid), GetRPName(playerid));
						GameTextForPlayer(killerid, "~r~Godlike", 2000, 4);
					} else if (purgeAnnouncer[killerid] == 4) {
						SendMessageToAll(0x84f542ff, "%s is is dominating.", GetRPName(killerid), GetRPName(playerid));
						GameTextForPlayer(killerid, "~y~Dominating", 2000, 4);
					} else if (purgeAnnouncer[killerid] == 3) {
						SendMessageToAll(0x84f542ff, "%s is in killing spree.", GetRPName(killerid), GetRPName(playerid));
						GameTextForPlayer(killerid, "~y~Killing spree", 2000, 4);
					} else if (purgeAnnouncer[killerid] == 2) {
						SendMessageToAll(0x84f542ff, "%s is in double kill.", GetRPName(killerid), GetRPName(playerid));
						GameTextForPlayer(killerid, "~y~Double kill", 2000, 4);
					} else if (purgeAnnouncer[killerid] == 1) {
						SendMessageToAll(0x84f542ff, "%s has taken the first blood of %s", GetRPName(killerid), GetRPName(playerid));
						GameTextForPlayer(killerid, "~g~First blood", 2000, 4);
					}

					PlayerInfo[playerid][pPurgeDeath] += 1;
					format(string, sizeof(string), "%d", PlayerInfo[playerid][pPurgeDeath]);
					PlayerTextDrawSetString(playerid, PurgeTD[playerid][4], string);

					mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET purgekill = %i WHERE uid = %i", PlayerInfo[killerid][pPurgeKill], PlayerInfo[killerid][pID]);
					mysql_tquery(connectionID, queryBuffer);

					mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET purgedeath = %i WHERE uid = %i", PlayerInfo[playerid][pPurgeDeath], PlayerInfo[playerid][pID]);
					mysql_tquery(connectionID, queryBuffer);
				}
			}
		}
	}
    #if defined Purge_OnPlayerDeath
		return Purge_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}

public OnPlayerConnect(playerid)
{
	PlayerInfo[playerid][pPurge] = 0;
	purgeAnnouncer[playerid] = 0;
	
	PurgeTD[playerid][0] = CreatePlayerTextDraw(playerid, 324.000000, 5.000000, "~y~"SERVER_NAME"~n~~w~start of purge");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][0], 0.179166, 1.450000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][0], 845.000000, 462.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][0], 0);

	PurgeTD[playerid][1] = CreatePlayerTextDraw(playerid, 270.000000, 33.000000, "Total Kill:");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][1], 0.179166, 1.450000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][1], 845.000000, 462.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][1], 0);

	PurgeTD[playerid][2] = CreatePlayerTextDraw(playerid, 376.000000, 33.000000, "Total Death:");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][2], 0.179166, 1.450000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][2], 845.000000, 462.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][2], 0);

	PurgeTD[playerid][3] = CreatePlayerTextDraw(playerid, 270.000000, 46.000000, "_");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][3], 0.179166, 1.450000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][3], 845.000000, 462.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][3], 0);

	PurgeTD[playerid][4] = CreatePlayerTextDraw(playerid, 376.000000, 46.000000, "_");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][4], 0.179166, 1.450000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][4], 845.000000, 462.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][4], 0);
    #if defined Purge_OnPlayerConnect
		return Purge_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Purge_OnDialogResponse
#if defined Purge_OnDialogResponse
	forward Purge_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate Purge_OnPlayerUpdate
#if defined Purge_OnPlayerUpdate
	forward Purge_OnPlayerUpdate(playerid);
#endif

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn Purge_OnPlayerSpawn
#if defined Purge_OnPlayerSpawn
	forward Purge_OnPlayerSpawn(playerid);
#endif

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath Purge_OnPlayerDeath
#if defined Purge_OnPlayerDeath
	forward Purge_OnPlayerDeath(playerid, killerid, reason);
#endif

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Purge_OnPlayerConnect
#if defined Purge_OnPlayerConnect
	forward Purge_OnPlayerConnect(playerid);
#endif