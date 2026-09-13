CMD:voicechathelp(playerid, params[])
{
    SendClientMessage(playerid, COLOR_SYNTAX, "SAMP Voice Type(s) Command");
    SendClientMessage(playerid, COLOR_WHITE, "Available Commands: /voicewhisper, /voicelocal, /voiceshout, /voicemegaphone");
    return 1;
}

CMD:voicewhisper(playerid, params[])
{
    if(gettime() - PlayerInfo[playerid][pLastGlobal] < 5)
	{
	    return SendMessage(playerid, COLOR_SYNTAX, "You can only speak in this channel every 30 seconds. Please wait %i more seconds.", 5 - (gettime() - PlayerInfo[playerid][pLastGlobal]));
	}
    if(PlayerInfo[playerid][pAdmin] < 2 && !PlayerInfo[playerid][pFormerAdmin])
	{
		PlayerInfo[playerid][pLastGlobal] = gettime();
	}
    SvUpdateDistanceForLStream(lstream[playerid], 5.0);
	SvCreateDLStreamAtPlayer(5.0, SV_INFINITY, playerid, 0xff0000ff, "Whisper");
    SendClientMessage(playerid, COLOR_YELLOW, "Succesfuly connected to whisper voicechat channel.");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "HINT: Be careful using this command to avoid reporting on your microphone");
    return 1;
}

CMD:voicelocal(playerid, params[])
{
    if(gettime() - PlayerInfo[playerid][pLastGlobal] < 5)
	{
	    return SendMessage(playerid, COLOR_SYNTAX, "You can only speak in this channel every 30 seconds. Please wait %i more seconds.", 5 - (gettime() - PlayerInfo[playerid][pLastGlobal]));
	}
    if(PlayerInfo[playerid][pAdmin] < 2 && !PlayerInfo[playerid][pFormerAdmin])
	{
		PlayerInfo[playerid][pLastGlobal] = gettime();
	}
    SvUpdateDistanceForLStream(lstream[playerid], 20.0);
	SvCreateDLStreamAtPlayer(20.0, SV_INFINITY, playerid, 0xff0000ff, "Local");
	SendClientMessage(playerid, COLOR_YELLOW, "Succesfuly connected to local voicechat channel.");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "HINT: Be careful using this command to avoid reporting on your microphone");
    return 1;
}

CMD:voiceshout(playerid, params[])
{
    if(gettime() - PlayerInfo[playerid][pLastGlobal] < 5)
	{
	    return SendMessage(playerid, COLOR_SYNTAX, "You can only speak in this channel every 30 seconds. Please wait %i more seconds.", 5 - (gettime() - PlayerInfo[playerid][pLastGlobal]));
	}
    if(PlayerInfo[playerid][pAdmin] < 2 && !PlayerInfo[playerid][pFormerAdmin])
	{
		PlayerInfo[playerid][pLastGlobal] = gettime();
	}
    SvUpdateDistanceForLStream(lstream[playerid], 40.0);
	SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Shout");
	SendClientMessage(playerid, COLOR_YELLOW, "Succesfuly connected to shout voicechat channel.");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "HINT: Be careful using this command to avoid reporting on your microphone");
    return 1;
}

CMD:voicemegaphone(playerid, params[])
{
    if(PlayerInfo[playerid][pFaction] == -1)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you're not apart of any faction.");
	}
    if(PlayerInfo[playerid][pAdmin] < 2 && !PlayerInfo[playerid][pFormerAdmin])
	{
		PlayerInfo[playerid][pLastGlobal] = gettime();
	}
    SvUpdateDistanceForLStream(lstream[playerid], 50.0);
	SvCreateDLStreamAtPlayer(50.0, SV_INFINITY, playerid, 0xff0000ff, "Megaphone");
	SendClientMessage(playerid, COLOR_YELLOW, "Succesfuly connected to megaphone voicechat channel.");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "HINT: Be careful using this command to avoid reporting on your microphone");
    return 1;
}