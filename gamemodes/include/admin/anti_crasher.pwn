stock OnDetectWeaponCrasher(playerid, oldweapon, newweapon)
{
    #pragma unused oldweapon
    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK)
    {
        switch(newweapon)
        {
            case 39:
            {
                SendMessageToAll(COLOR_LIGHTRED, "AdmCmd: %s was automatically kick by %s, Reason: Weapon Crasher", GetRPName(playerid), SERVER_ANTICHEAT);
                Kick(playerid);
            }
        }
    }
}

public OnPlayerUpdate(playerid)
{
    new wepcrash = GetPlayerWeapon(playerid);	
    if(wepcrash != GetPVarInt(playerid, "weaponcrasher"))
    {
        OnDetectWeaponCrasher(playerid, GetPVarInt(playerid, "weaponcrasher"), wepcrash);
        SetPVarInt(playerid, "weaponcrasher", wepcrash);
    }

    if(GetPlayerWeapon(playerid) == 40)
	{
		new string[128];
		format(string, sizeof(string), "Detonator");
		SMA(COLOR_LIGHTRED, "AdmCmd: %s was auto-banned by %s, reason: %s", GetRPName(playerid), SERVER_ANTICHEAT, string);
		BanPlayer(playerid, SERVER_ANTICHEAT, 30, string);
	}

    #if defined Crasher_OnPlayerUpdate
		return Crasher_OnPlayerUpdate(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate Crasher_OnPlayerUpdate
#if defined Crasher_OnPlayerUpdate
	forward Crasher_OnPlayerUpdate(playerid);
#endif