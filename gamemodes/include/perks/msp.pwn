CMD:setmsp(playerid, params[])
{
    new targetid;
    if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
    if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setmsp [playerid]");
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	}
	if(!IsPlayerSpawned(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is either not spawned, or spectating.");
	}

    PlayerInfo[targetid][pMSP] = 1;
    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has made %s a part of Cavite Town Special Perks.", GetRPName(playerid), GetRPName(targetid));

    SendMessage(playerid, COLOR_WHITE, "You have made %s a part of Cavite Town Special Perks (/mspsettings).", GetRPName(targetid));
    SendMessage(targetid, COLOR_WHITE, "%s has made you a part of Cavite Town Special Perks (/mspsettings).", GetRPName(playerid));
    return 1;
}

CMD:mspsettings(playerid, params[])
{
    new string[1028] = "Perks:\tStatus:";
    format(string, sizeof(string), "%s\n\
    "PERKS"%s Member of MSP\n\n\
    Special Tag\t%s\n\
    Special Custom Title\t%s\n\
    Special Vehicle\t%s\n\
    Rainbow Neon\t%s\n\
    Daily Login Cash\t%s\n\
    Daily Login Items\t%s", 
    string,
    GetRPName(playerid));
    Dialog_Show(playerid, Msp_Settings, DIALOG_STYLE_TABLIST_HEADERS, "Cavite Town Special Perks", string, "Start", "Return");
    return 1;
}

Dialog:Msp_Settings(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                
            }
            case 1:
            {

            }
            case 2:
            {

            }
            case 3:
            {

            }
            case 4:
            {

            }
            case 5:
            {

            }
        }
    }
    return 1;
}
