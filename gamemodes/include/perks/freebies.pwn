CMD:ctrp(playerid, params[])
{
	if(PlayerInfo[playerid][pFreebies] == 1)
	{
	    return SendClientMessage(playerid, COLOR_GREY2, "You already refunded.");
	}

    PlayerInfo[playerid][pFreebies] = 1;
    PlayerInfo[playerid][pVIPVoucher][2] = 1;
	PlayerInfo[playerid][pCarVoucher][0] = 1;
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET freebies = %i, vipvoucher_2 = %i, carvoucher_0 = %i WHERE uid = %i", PlayerInfo[playerid][pFreebies], PlayerInfo[playerid][pVIPVoucher][2], PlayerInfo[playerid][pCarVoucher][0], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

	new vehicleid = 462;
	new color1 = 0, color2 = 0, Float:x, Float:y, Float:z, Float:a;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);
    GivePlayerCash(playerid, 5000);
    vehicleid = AddStaticVehicleEx(462, x, y, z, a, color1, color2, -1);
    PutPlayerInVehicle(playerid, vehicleid, 0);
    SendClientMessage(playerid, SERVER_COLOR, "You have been receive $5,000 ingame cash and 1x 7D SVIP Voucher and 1x Car Voucher");
    return 1;
}

CMD:resetfreebies(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have permission to use this command.");

	foreach(new i : Player) PlayerInfo[i][pFreebies] = 0;
	mysql_tquery(connectionID, "UPDATE users SET freebies = 0");

	SendMessageToAll(COLOR_LIGHTRED, "AdmCmd: %s has reset the freebies system", GetRPName(playerid));
	return 1;
}
