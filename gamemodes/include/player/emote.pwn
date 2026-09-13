forward EmoteSystem(playerid);
public EmoteSystem(playerid)
{
	if(IsPlayerAttachedObjectSlotUsed(playerid, 4)) RemovePlayerAttachedObject(playerid, 4);
	return 1;
}

GetPlayerDamageEmote(playerid)
{
    PlayerInfo[playerid][pEmote] = 1;
    if(PlayerInfo[playerid][pEmote])
	{
		SetPlayerAttachedObject(playerid, 4, 1240, 2, 0.468, 0, 0, 0, 89.3, 0, 1, 1, 1);
		SetTimerEx("EmoteSystem", 5000, false, "i", playerid);
	}
}

CMD:emote(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_EMOTE, DIALOG_STYLE_LIST, "Emote", "Heart\nAlert\nDrugs", "Select", "Back");
    return 1;
}

public OnPlayerConnect(playerid)
{
    PlayerInfo[playerid][pEmote] = 0;
    #if defined Emote_OnPlayerConnect
		return Emote_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_EMOTE:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        SetPlayerAttachedObject(playerid, 4, 1240, 2, 0.468, 0, 0, 0, 89.3, 0, 1, 1, 1);
                    }
                    case 1:
                    {
                        SetPlayerAttachedObject(playerid, 4, 1239, 2, 0.468, 0, 0, 0, 89.3, 0, 1, 1, 1);
                    }
                    case 2:
                    {
                        SetPlayerAttachedObject(playerid, 4, 1575, 2, 0.468, 0, 0, 0, 89.3, 0, 1, 1, 1);
                    }
                }
            }
            SetTimerEx("EmoteSystem", 5000, false, "i", playerid);
        }
    }
    #if defined Emote_OnDialogResponse
		return Emote_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Emote_OnDialogResponse
#if defined Emote_OnDialogResponse
	forward Emote_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Emote_OnPlayerConnect
#if defined Emote_OnPlayerConnect
	forward Emote_OnPlayerConnect(playerid);
#endif