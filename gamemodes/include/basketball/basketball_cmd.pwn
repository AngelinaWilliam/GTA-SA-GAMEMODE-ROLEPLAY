CMD:basketball(playerid, params[])
{
	new type[20], string[128];
	if(sscanf(params, "s[20]S()[128]", type, string)) return SendClientMessage(playerid, -1, "Usage: /basketball [Solo / Duel / Accept / End]");

	if(!strcmp(params, "end", true, 20))
	{
	    new id = GetPlayerCourt(playerid);
	    if(id == -1)
	    {
	        SendClientMessage(playerid, -1, "You're not playing basket");
	        return 1;
	    }
	    EndBasket(id);
	}
	if(!strcmp(params, "duel", true, 20))
	{
	    new otherid;
	    if(!sscanf(string, "i", otherid)) return SendClientMessage(playerid, -1, "Usage: /basketball [duel] [playerid]");

		new id = GetNearestBasketField(playerid, 50.0);
	    if(id == -1) return SendClientMessage(playerid, -1, "You're not on any basketball court");
	    if(!IsPlayerInPlayerArea(playerid, otherid, 5.0)) return SendClientMessage(playerid, -1, "You too far from person you invite");

        if(IsPlayerInRangeOfPoint(playerid, 1.0, bsData[id][BallDefaultPos][0], bsData[id][BallDefaultPos][1], bsData[id][BallDefaultPos][2]))
	    {
		    YangDiInvite[playerid] = otherid;
		    YangDiInvite[otherid] = otherid;
		    YangInvite[playerid] = playerid;
		    YangInvite[playerid] = playerid;

		    SendClientMessageEx(otherid, -1, "%s has invite you to playing basket. type '/basketball accept' to accept.", ReturnName(playerid));
		}
		else SendClientMessage(playerid, -1, "You're not near to any basketball court");
	}
	if(!strcmp(params, "solo", true, 20))
	{
	    new id = GetNearestBasketField(playerid, 50.0);

        if(id == -1) return SendClientMessage(playerid, -1, "You're not on any basketball court");

	    foreach(new i : Player)
	    {
	        if(PlayerCourt[i] == id)
	        {
	            {
	                return SendClientMessage(playerid, -1, "Someone use this basketball court");
	            }
	        }
	    }
	    if(IsPlayerInRangeOfPoint(playerid, 1.0, bsData[id][BallDefaultPos][0], bsData[id][BallDefaultPos][1], bsData[id][BallDefaultPos][2]))
	    {
	    	StartPlayBasketball(playerid, id);
	    	SendClientMessage(playerid, -1, "You started playing basketball alone");
		}
		else SendClientMessage(playerid, -1, "You're not near to any basketball court");
	}
    if(!strcmp(params, "accept", true, 20))
	{
        if(GetPlayerCourt(playerid) != -1) return SendClientMessage(playerid, -1, "You playing basketball, type '/basketball end' for end your game");
        if(YangInvite[playerid] >= 0)
        {
            new id = GetNearestBasketField(playerid, 50.0);

            SendClientMessageEx(YangInvite[playerid], -1, "%s accept your challenge to play basketballt", ReturnName(playerid));
            SendClientMessageEx(playerid, -1, "You accept the challenge to play basketball from %s", ReturnName(YangInvite[playerid]));
            StartPlayBasketball(YangInvite[playerid], id, playerid);
        }
    }
	return 1;
}