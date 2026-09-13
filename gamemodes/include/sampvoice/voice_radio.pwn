CMD:radiochat(playerid)
{
    new string[2048], status[128], statuss[128];
    strcat(string, "Channel\tToggle\tDescription");
    if(PlayerInfo[playerid][pFactionRadio] == 0)
    {
    	status = "{ff0000}OFF{FFFFFF}";
    }
    else
    {
    	status = "{009900}ON{FFFFFF}";
    }
    if(PlayerInfo[playerid][pGangRadio] == 0)
    {
    	statuss = "{ff0000}OFF{FFFFFF}";
    }
    else
    {
    	statuss = "{009900}ON{FFFFFF}";
    }
    format(string, sizeof(string), "%s\nFaction Radio\t%s\tRadio Channel for your faction\
		\nGang Radio\t%s\tRadio Channel for your Gang.", string, status, statuss);
    ShowPlayerDialog(playerid, DIALOG_VOICECHAT, DIALOG_STYLE_TABLIST_HEADERS, "Voice Chat Setup", string, "Toggle", "Close");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_VOICECHAT)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pFaction] == -1)
				{
					return SCM(playerid, COLOR_SYNTAX, "You can't use this command as you're not apart of any faction.");
				}
				if(PlayerInfo[playerid][pFactionRadio] == 0)
				{
					PlayerInfo[playerid][pFactionRadio] = 1;
					SvAttachListenerToStream(factionstream[PlayerInfo[playerid][pFaction]], playerid);
					callcmd::radiochat(playerid);
					SendMessage(playerid, COLOR_LIGHTBLUE, "Succesfuly connected to %s radio channel.", FactionInfo[PlayerInfo[playerid][pFaction]][fName]);
				}
				else if(PlayerInfo[playerid][pFactionRadio] == 1)
				{
					PlayerInfo[playerid][pFactionRadio] = 0;
					SvDetachListenerFromStream(factionstream[PlayerInfo[playerid][pFaction]], playerid);
					callcmd::radiochat(playerid);
					SendMessage(playerid, COLOR_LIGHTBLUE, "You have disconnected on %s radio channel.", FactionInfo[PlayerInfo[playerid][pFaction]][fName]);
				}
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pGang] == -1)
			    {
			        return SCM(playerid, COLOR_SYNTAX, "You are not apart of any gang at the moment.");
				}
				if(PlayerInfo[playerid][pGangRadio] == 0)
				{
					PlayerInfo[playerid][pGangRadio] = 1;
					SvAttachListenerToStream(gangstream[PlayerInfo[playerid][pGang]], playerid);
					callcmd::radiochat(playerid);
					SendMessage(playerid, COLOR_LIGHTBLUE, "Succesfuly connected to %s radio channel.", GangInfo[PlayerInfo[playerid][pGang]][gName]);
				}
				else if(PlayerInfo[playerid][pGangRadio] == 1)
				{
					PlayerInfo[playerid][pGangRadio] = 0;
					SvDetachListenerFromStream(gangstream[PlayerInfo[playerid][pGang]], playerid);
					callcmd::radiochat(playerid);
					SendMessage(playerid, COLOR_LIGHTBLUE, "You have disconnected on %s radio channel.", GangInfo[PlayerInfo[playerid][pGang]][gName]);
				}
			}
		}
	}
    #if defined RVoice_OnDialogResponse
		return RVoice_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse RVoice_OnDialogResponse
#if defined RVoice_OnDialogResponse
	forward RVoice_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif