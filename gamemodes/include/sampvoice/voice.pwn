new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
new SV_GSTREAM:factionstream[MAX_FACTIONS] = { SV_NULL, ... };
new SV_GSTREAM:gangstream[MAX_GANGS] = { SV_NULL, ... };
new SV_GSTREAM:OnPhone[MAX_PLAYERS];

stock SobeitUser(playerid)
{
    KickPlayer(playerid);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has been kicked triggering f12 key!", GetRPName(playerid));
	SendClientMessage(playerid, COLOR_WHITE, "You have been kicked triggering f12 key");
	return 1;
}

stock AimBotUser(playerid)
{
    KickPlayer(playerid);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has been kicked triggering f10 key!", GetRPName(playerid));
	SendClientMessage(playerid, COLOR_WHITE, "You have been kicked triggering f10 key");
	return 1;
}

stock InsertPress(playerid)
{
    KickPlayer(playerid);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has been kicked triggering Insert key!", GetRPName(playerid));
	SendClientMessage(playerid, COLOR_WHITE, "You have been kicked triggering Insert key");
	return 1;
}

stock DeletePress(playerid)
{
    KickPlayer(playerid);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has been kicked triggering Delete key!", GetRPName(playerid));
	SendClientMessage(playerid, COLOR_WHITE, "You have been kicked triggering Delete key");
	return 1;
}

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
{
    if(keyid == 0x7B) SobeitUser(playerid);
	if(keyid == 0x79) AimBotUser(playerid);
	if(keyid == 0x2D) InsertPress(playerid);
	if(keyid == 0x2E) DeletePress(playerid);
    if(PlayerInfo[playerid][pCallStage] == 2)
    {
    	if (keyid == 0x5A && OnPhone[playerid]) SvAttachSpeakerToStream(OnPhone[playerid], playerid);
    }
    if(PlayerInfo[playerid][pFactionRadio] == 1)
    {
    	if(keyid == 0x5A && factionstream[PlayerInfo[playerid][pFaction]]) SvAttachSpeakerToStream(factionstream[PlayerInfo[playerid][pFaction]], playerid);
    }
    if(PlayerInfo[playerid][pGangRadio] == 1)
    {
    	if(keyid == 0x5A && gangstream[PlayerInfo[playerid][pGang]]) SvAttachSpeakerToStream(gangstream[PlayerInfo[playerid][pGang]], playerid);
    }
    else
    {
    	if (keyid == 0x5A && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    }
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if(PlayerInfo[playerid][pCallStage] == 2)
    {
    	if (keyid == 0x5A && OnPhone[playerid]) SvDetachSpeakerFromStream(OnPhone[playerid], playerid);
    }
    if(PlayerInfo[playerid][pFactionRadio] == 1)
    {
    	if(keyid == 0x5A && factionstream[PlayerInfo[playerid][pFaction]]) SvDetachSpeakerFromStream(factionstream[PlayerInfo[playerid][pFaction]], playerid);
    }
    if(PlayerInfo[playerid][pGangRadio] == 1)
    {
    	if(keyid == 0x5A && gangstream[PlayerInfo[playerid][pGang]]) SvDetachSpeakerFromStream(gangstream[PlayerInfo[playerid][pGang]], playerid);
    }
    else
    {
    	if (keyid == 0x5A && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    }
}

public OnPlayerConnect(playerid)
{
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "{B23030}Could not find plugin sampvoice.");
    }
    // Checking for a microphone
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "{B23030}The microphone could not be found.");
    }
    else if((lstream[playerid] = SvCreateDLStreamAtPlayer(20.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        SvAddKey(playerid, 0x5A);
        SendClientMessage(playerid, COLOR_GREEN, "{A9C4E4}Intializing SA-MP Voice plugin");
		SendClientMessage(playerid, COLOR_GREEN, "{A9C4E4}SA-MP Voice loaded!");
		SendClientMessage(playerid, COLOR_GREEN, "{A9C4E4}Checking if microphone available");
		SendClientMessage(playerid, COLOR_GREEN, "{A9C4E4}Microphone is OK.");
		SendClientMessage(playerid, COLOR_GREEN, "{A9C4E4}"SERVER_NAME" Voice Chat Loaded!");
    }

	// Disabled Buttons
	SvAddKey(playerid, 0x7B); // f12
	SvAddKey(playerid, 0x79); // f10
	SvAddKey(playerid, 0x71); // f2
	SvAddKey(playerid, 0x2D); // Insert
	SvAddKey(playerid, 0x2E); // Delete
    #if defined Voice_OnPlayerConnect
		return Voice_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDisconnect(playerid, reason)
{
    if (lstream[playerid]) {
		SvDeleteStream(lstream[playerid]);
		lstream[playerid] = SV_NULL;
	}
	#if defined Voice_OnPlayerDisconnect
		return Voice_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}

CMD:voicemute(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /voiceunmute [playerid]");
	}
	PlayerInfo[playerid][pVoiceChat] = 1;
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET voicechat = 1 WHERE uid = %i", PlayerInfo[targetid][pID]);
	mysql_tquery(connectionID, queryBuffer);
	SvMutePlayerEnable(targetid);

	SendAdminMessage(COLOR_LIGHTRED, "%s un muted %s on using voice chat.", GetRPName(playerid), GetRPName(targetid));
	SendMessage(targetid, COLOR_RED, "You have been muted on using voice chat by %s.", GetRPName(playerid));
	return 1;
}

CMD:voiceunmute(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /voiceunmute [playerid]");
	}
	PlayerInfo[playerid][pVoiceChat] = 0;
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET voicechat = 0 WHERE uid = %i", PlayerInfo[targetid][pID]);
	mysql_tquery(connectionID, queryBuffer);
	SvMutePlayerDisable(targetid);

	SendAdminMessage(COLOR_LIGHTRED, "%s un muted %s on using voice chat.", GetRPName(playerid), GetRPName(targetid));
	SendMessage(targetid, COLOR_RED, "You have been unmuted on using voice chat by %s.", GetRPName(playerid));
	return 1;
}

CMD:voicestatus(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /voicestatus [playerid]");
	}
	new status;
	status = SvMutePlayerStatus(targetid);
	if(status == 0)
	{
		SendMessage(playerid, COLOR_RED, "Voice Chat Status of %s: Not Muted", GetRPName(targetid));
	}
	else
	{
		SendMessage(playerid, COLOR_RED, "Voice Chat Status of %s: Muted", GetRPName(targetid));
	}
	return 1;
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Voice_OnPlayerConnect
#if defined Voice_OnPlayerConnect
	forward Voice_OnPlayerConnect(playerid);
#endif

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect Voice_OnPlayerDisconnect
#if defined Voice_OnPlayerDisconnect
	forward Voice_OnPlayerDisconnect(playerid, reason);
#endif