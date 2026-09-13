CMD:rappel(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "You must be in a helicopter to rappel.");
	if(!IsAHelicopter(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_GREY, "You must be in a helicopter to rappel.");
	if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return SendClientMessage(playerid, COLOR_GREY, "You must be in a passenger seat.");
	if(GetPlayerAnimationIndex(playerid) == 995) return SendClientMessage(playerid, COLOR_GREY, "You are already rappelling.");
	if(!IsLawEnforcement(playerid)) {
		if(PlayerInfo[playerid][pRope] <= 1)
 		   return SendClientMessage(playerid, COLOR_GREY, "You need at least 2 ropes to rappel.");
		PlayerInfo[playerid][pRope] -= 2;
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET rope = %i WHERE uid = %i", PlayerInfo[playerid][pRope], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);
	}
	RemovePlayerFromVehicle(playerid);

	Dyuze(playerid, "Rappel", "~w~Type ~y~/stoprappel~w~ to stop rappelling.");
	new Float:X, Float:Y, Float:Z,Float:Angle;
	GetPlayerPos(playerid, X, Y, Z);
	SetPlayerPos(playerid, X, Y, Z-2);
	GetPlayerFacingAngle(playerid, Angle);
	ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,1,0);
	return 1;
}

CMD:stoprappel(playerid)
{
	if(GetPlayerAnimationIndex(playerid) != 995) return SendClientMessage(playerid, COLOR_GREY, "You are not rappelling.");
	ClearAnimations(playerid);
	return 1;
}