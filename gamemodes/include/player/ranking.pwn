// Topplayers
stock ReturnName(playerid)
{
	new
		color, sz_playerName[MAX_PLAYER_NAME];

	if(!isnull(PlayerInfo[playerid][pUsername]))
	{
		if((color = GetPlayerColor(playerid)) == 0xFFFFFF00)
		{
	        color = 0xAAAAAAFF;
		}
	    format(sz_playerName, sizeof(sz_playerName), "{%06x}%s", color >>> 8, PlayerInfo[playerid][pUsername]);
	}
	else
	{
		GetPlayerName(playerid, sz_playerName, MAX_PLAYER_NAME);
	}
	return sz_playerName;
}

ReturnUserEx(text[]) {

	new
		strPos,
		returnID = 0,
		bool: isnum = true;

	while(text[strPos]) {
		if(isnum) {
			if ('0' <= text[strPos] <= '9') returnID = (returnID * 10) + (text[strPos] - '0');
			else isnum = false;
		}
		strPos++;
	}
	if (isnum) {
		if(IsPlayerConnected(returnID)) return returnID;
	}
	else {
		foreach(new i : Player) {
			if(!strcmp(PlayerInfo[i][pUsername], text, true, strPos)) return i;
		}
	}
	return INVALID_PLAYER_ID;
}
forward OnPlayerListRankings(playerid);
public OnPlayerListRankings(playerid)
{
	new rows = cache_num_rows(connectionID), szDialog[1024];
	new username[MAX_PLAYER_NAME], hours, giveplayerid;

	for(new i = 0; i < rows; i++)
	{
	    cache_get_field_content(i, "Name", username);
	    hours = cache_get_field_content_int(i, "hours");

		giveplayerid = ReturnUserEx(username);
	    format(szDialog, sizeof(szDialog), "%s{FFFFFF}%s\t%d playing hours\t%s\n", szDialog, username, hours, (giveplayerid == INVALID_PLAYER_ID) ? ("{FF0606}Offline") : ("{33AA33}Online"));
	}

	if(isnull(szDialog)) format(szDialog, sizeof(szDialog), "There are no recorded playing hours yet.");
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST, "Top 10 Playing Hours for this month (February 2022)", szDialog, "Close", "");
	return 1;
}

forward OnPlayerChangeNameRankings(playerid, newname[]);
public OnPlayerChangeNameRankings(playerid, newname[])
{
	if(cache_num_rows(connectionID)) {
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE rankings SET Name = '%e' WHERE Name = '%e'", newname, PlayerInfo[playerid][pUsername]);
		mysql_tquery(connectionID, queryBuffer);
	}
	return 1;
}

forward OnPlayerUpdateRankings(playerid);
public OnPlayerUpdateRankings(playerid)
{
	if(cache_num_rows(connectionID)) {
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE rankings SET hours = hours + 1 WHERE Name = '%e'", PlayerInfo[playerid][pUsername]);
		mysql_tquery(connectionID, queryBuffer);
	} else {
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO rankings (Name, hours) VALUES('%e', %d)", PlayerInfo[playerid][pUsername], 1);
		mysql_tquery(connectionID, queryBuffer);
	}
	return 1;
}
CMD:resettopplayers(playerid, params[])
{  
	if(PlayerInfo[playerid][pAdmin] < 6)
	{
		return SendClientMessage(playerid, COLOR_GREY, "You are not Executive Admin+");
	}
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has reset all top hours players", GetPlayerNameEx(playerid));
	mysql_tquery(connectionID, "DELETE FROM rankings");
	return 1;
}
CMD:topplayers(playerid, params[])
{  
	mysql_tquery(connectionID, "SELECT * FROM rankings ORDER BY hours DESC LIMIT 10", "OnPlayerListRankings", "d", playerid);
	return 1;
}