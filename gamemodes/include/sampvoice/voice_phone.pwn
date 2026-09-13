ResetPlayerPhone(playerid)
{
	if (OnPhone[playerid]) SvDetachSpeakerFromStream(OnPhone[playerid], playerid);
	return 1;
}

public OnPlayerConnect(playerid)
{
    ResetPlayerPhone(playerid);
	#if defined PVoice_OnPlayerConnect
		return PVoice_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

alias:pickup("p");
CMD:pickup(playerid, params[])
{
    if(PlayerInfo[playerid][pCallStage] != 1)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You have no incoming calls which you can answer right now.");
	}
    if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You are unable to use your cellphone at the moment.");
	}

	new targetid = PlayerInfo[playerid][pCallLine];
	
	PlayerInfo[PlayerInfo[playerid][pCallLine]][pCallStage] = 2;
	PlayerInfo[playerid][pCallStage] = 2;

	SendClientMessage(playerid, COLOR_YELLOW, "* You accepted the phone call.");
	SendClientMessage(targetid, COLOR_YELLOW, "* Accepted the phone call.");

	OnPhone[targetid] = SvCreateGStream(0xFFA200FF, "Phone");

    if (OnPhone[targetid]) {
        SvAttachListenerToStream(OnPhone[targetid], targetid);
        SvAttachListenerToStream(OnPhone[targetid], playerid);
    }
    if (OnPhone[targetid] && PlayerInfo[playerid][pCallLine] != INVALID_PLAYER_ID) {
        SvAttachSpeakerToStream(OnPhone[targetid], playerid);
    }

    if(OnPhone[targetid] && PlayerInfo[targetid][pCallLine] != INVALID_PLAYER_ID){
        SvAttachSpeakerToStream(OnPhone[targetid], targetid);
    }
	return 1;
}

alias:hangup("h");
CMD:hangup(playerid, const params[])
{
	new targetid = PlayerInfo[playerid][pCallLine];

    if(PlayerInfo[playerid][pCallLine] == INVALID_PLAYER_ID)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You have no calls in session which you can hangup.");
	}
	if (targetid == INVALID_PLAYER_ID)
	{
	    return SendClientMessage(playerid, COLOR_WHITE, "* Already disconnected from the call.");
	}
	else
	{
	    SendClientMessage(targetid, COLOR_WHITE, "* They hung up their phone and ended the call.");

	    if (OnPhone[targetid] && PlayerInfo[targetid][pCallLine] != INVALID_PLAYER_ID) {
            SvDetachSpeakerFromStream(OnPhone[targetid], targetid);
        }

        if(OnPhone[targetid] && PlayerInfo[playerid][pCallLine] != INVALID_PLAYER_ID){
            SvDetachSpeakerFromStream(OnPhone[targetid], playerid);
        }

        if(OnPhone[targetid]){
            SvDetachListenerFromStream(OnPhone[targetid], targetid);
            SvDetachListenerFromStream(OnPhone[targetid], playerid);
            SvDeleteStream(OnPhone[targetid]);
            OnPhone[targetid] = SV_NULL;
        }

        if (OnPhone[playerid] && PlayerInfo[targetid][pCallLine] != INVALID_PLAYER_ID) {
            SvDetachSpeakerFromStream(OnPhone[playerid], targetid);
        }

        if(OnPhone[playerid] && PlayerInfo[playerid][pCallLine] != INVALID_PLAYER_ID){
            SvDetachSpeakerFromStream(OnPhone[playerid], playerid);
        }

        if(OnPhone[playerid])
		{
            SvDetachListenerFromStream(OnPhone[playerid], targetid);
            SvDetachListenerFromStream(OnPhone[playerid], playerid);
            SvDeleteStream(OnPhone[playerid]);
            OnPhone[playerid] = SV_NULL;
        }
	}
	PlayerInfo[playerid][pCallLine] = INVALID_PLAYER_ID;
	PlayerInfo[targetid][pCallLine] = INVALID_PLAYER_ID;
    HangupCall(playerid, HANGUP_USER);
	return 1;
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect PVoice_OnPlayerConnect
#if defined PVoice_OnPlayerConnect
	forward PVoice_OnPlayerConnect(playerid);
#endif