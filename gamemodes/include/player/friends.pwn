#define MAX_FRIENDS     20

CMD:listoffriends(playerid, params[])
{
    SendClientMessage(playerid, COLOR_YELLOW, "List of your Friends");
    for(new i = 0; i < MAX_FRIENDS; i ++)
	{
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT COUNT(*) FROM users WHERE friends = %i", i);
	    mysql_tquery(connectionID, queryBuffer, "OnPlayerListFriends", "ii", playerid, i);
    }
    return 1;
}

CMD:makefriend(playerid, params[])
{
    new targetid;
    if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /makefriend [playerid]");
	}
	if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	}
	if(targetid == playerid)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can't mkae friend to yourself.");
	}

    PlayerInfo[targetid][pFriendOffer] = playerid;
    SendMessage(targetid, COLOR_WHITE, "** %s offered you as his friend (/accept friend)", GetRPName(playerid));
	SendMessage(playerid, COLOR_WHITE, "** You offered %s to make your friend", GetRPName(targetid));
    return 1;
}

