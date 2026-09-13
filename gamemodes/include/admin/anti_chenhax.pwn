native gpci(playerid, serial[], len);
new gAllowChenHax = 1;

GetPlayerGpci(playerid)
{
    new gpciStr[41];
    gpci(playerid, gpciStr, sizeof(gpciStr));
    return gpciStr;
}

public OnPlayerConnect(playerid)
{
	if(!gAllowChenHax && IsPlayerUsingChenHax(playerid) && PlayerInfo[playerid][pAdmin] < 2)
	{
		SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s was kicked by %s, reason: ChenHax Apk", GetRPName(playerid), SERVER_ANTICHEAT);
		SendClientMessage(playerid, COLOR_YELLOW, "You have been detected using the ChenHax Apk, you have been kicked from the server.");
		Kick(playerid);
		return 1;
	}
    printf("%s GCPI: %s Platform: %s", GetRPName(playerid), GetPlayerGpci(playerid), GetPlayerPlatform(playerid));
    #if defined Chenhax_OnPlayerConnect
		return Chenhax_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Chenhax_OnPlayerConnect
#if defined Chenhax_OnPlayerConnect
	forward Chenhax_OnPlayerConnect(playerid);
#endif

IsPlayerUsingChenHax(playerid)
{
	new samp_version[24], szSerial[41];
	GetPlayerVersion(playerid, samp_version, sizeof(samp_version));
	gpci(playerid, szSerial, sizeof(szSerial));

    if(!strcmp(szSerial, "5638413348335738345A4536524D4A524539334B", true))
        return 1;
	
	if(!(!strcmp("0.3.7", samp_version, false) || !strcmp("0.3.7-R1", samp_version, false) || !strcmp("0.3.7-R2", samp_version, false) || !strcmp("0.3.7-R3", samp_version, false) || !strcmp("0.3.7-R4", samp_version, false) || !strcmp("0.3.DL-R1", samp_version, false)) || isnull(samp_version))
	    return 1;
	
	return 0;
}

CMD:togchenhax(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

	gAllowChenHax = !gAllowChenHax;

	if(!gAllowChenHax)
	{
		foreach(new i : Player)
		{
			if(IsPlayerUsingChenHax(i))
			{
				Kick(i);
				SendClientMessage(i, COLOR_YELLOW, "You have been kicked for using the ChenHax Apk.");
			}
		}
		SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: All user of ChenHax was kicked by %s anticheat", SERVER_ANTICHEAT);
	}

	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has %s ChenHax users in the server.", GetRPName(playerid), gAllowChenHax ? ("enabled") : ("disabled"));
	return 1;
}

CMD:listchenhax(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

    new string[MAX_PLAYER_NAME * 100], title[80], count = 0, name[MAX_PLAYER_NAME+1];
    strcat(string, "ID\tName\tPlatform");
    if(IsPlayerUsingChenHax(playerid))
    {
		count++;
	    GetPlayerName(playerid, name, sizeof(name));
	    format(string, sizeof(string), "%s\n%d\t%s\t%s", string, playerid, name, GetPlayerPlatform(playerid));
	}
	foreach (new i : Player)
    {
        if(IsPlayerUsingChenHax(i) && IsPlayerConnected(i) && i != playerid)
        {
            count++;
            GetPlayerName(i, name, sizeof(name));
            format(string, sizeof(string), "%s\n%d\t%s\t%s", string, i, name, GetPlayerPlatform(i));
        }
    }
    format(title, sizeof(title), "List of Chen Hax User %d/%d", count, MAX_PLAYERS);
    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, title, string, "Closed", "");
	return 1;
}