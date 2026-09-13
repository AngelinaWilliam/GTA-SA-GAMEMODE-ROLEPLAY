#define IsPlayerAndroid(%0) !GetPVarInt(%0, "NotAndroid")
native SendClientCheck(playerid, type, arg, offset, size);
forward OnClientCheckResponse(playerid, type, arg, response);

GetPlayerPlatform(playerid)
{
    new platform[128];
    if(IsPlayerAndroid(playerid)) {
        platform = "Mobile";
    } else {
        platform = "Desktop";
    }
    return platform;
}

public OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {
        case 0x48:
        {
            SetPVarInt(playerid, "NotAndroid", 1);
        }
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientCheck(playerid, 0x48, 0, 0, 2);

    #if defined Platform_OnPlayerConnect
		return Platform_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Platform_OnPlayerConnect
#if defined Platform_OnPlayerConnect
	forward Platform_OnPlayerConnect(playerid);
#endif