new Flaming[MAX_PLAYERS];

CMD:flaminghand(playerid, params[])
{
	if(PlayerInfo[playerid][pVIPPackage] < 1)
	{
		SendClientMessage(playerid, COLOR_WHITE, "You're not a Bronze+ Donator");
		return 1;
	}
	if(Flaming[playerid] == 0)
	{
		Flaming[playerid] = 1;
		SetPlayerAttachedObject( playerid, 0, 18693, 5, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000 );
		SetPlayerAttachedObject( playerid, 1, 18693, 6, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000 );
		SetPlayerAttachedObject( playerid, 2, 18703, 6, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000 );
		SetPlayerAttachedObject( playerid, 3, 18703, 5, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000 );
		SetPlayerAttachedObject( playerid, 4, 19142,  1, 0.1,  0.05, 0.0,  0.0,   0.0,   0.0);
		SendClientMessage(playerid, 0xFFFFFFAA, "VIP: Flaming Hand effects is now active.");
	}
	else if(Flaming[playerid] == 1)
	{
		Flaming[playerid] = 0;
		for ( new i = 0; i < 4; i++ )
		if ( IsPlayerAttachedObjectSlotUsed( playerid, i ) )
		RemovePlayerAttachedObject( playerid, i );
		SendClientMessage(playerid, COLOR_VIP, "VIP: Flaming Hand effects has been disabled.");
	}
	return 1;
}