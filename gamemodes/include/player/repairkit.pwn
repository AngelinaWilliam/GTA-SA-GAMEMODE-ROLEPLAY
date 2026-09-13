new MechanicActor[1];

CMD:buyrepairkit(playerid, params[])
{
	if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command at the moment.");

	if(!IsPlayerInRangeOfPoint(playerid, 3, 1889.9796,-1794.2096,13.6728))
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not in range of the mechanic mechanic.");

	if((FactionInfo[PlayerInfo[playerid][pFaction]][fType] != FACTION_MECHANIC))
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "Only Mechanics are allowed to buy repair kits and can sell it to other players.");
	}

	if(PlayerInfo[playerid][pCash] < 5000)
		return SM(playerid, COLOR_SYNTAX, "You don't have enough Cash, you need %i more.", 5000 - PlayerInfo[playerid][pCash]);

	if(PlayerInfo[playerid][pRepairKit] >= 5)
	{
		return SCM(playerid, COLOR_SYNTAX, "You can't carry more than 5 repairkits.");
	}

	GivePlayerCash(playerid, -5000);
	PlayerInfo[playerid][pRepairKit]++;
	SendMessage(playerid, COLOR_LIGHTBLUE, "[MANAGER]: Thank you for buying 1x repair kit (All your repairkit tools: %s)", number_format(PlayerInfo[playerid][pRepairKit]));

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET repairkit = %i WHERE uid = %i", PlayerInfo[playerid][pRepairKit], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);
	return 1;
}

forward OnVehicleRepair(playerid);
public OnVehicleRepair(playerid)
{
	RepairVehicle(GetPlayerVehicleID(playerid));
	SendClientMessage(playerid, COLOR_YELLOW, "Your vehicle has been repaired.");
	return 1;
}

public OnGameModeInit()
{
	MechanicActor[0] = CreateActor(50, 1889.9796,-1794.2096,13.6728,359.5331);
    ApplyActorAnimation(MechanicActor[0], "PED", "IDLE_CHAT", 4.1, 1, 1, 1, 1, 1);
  	SetActorInvulnerable(MechanicActor[0], true);

	CreateDynamic3DTextLabel(""YELLOW"Mechanic Manager\n\n"WHITE"Cost: $5,000\nType /buyrepairkit to buy repair kit", COLOR_WHITE, 1889.9796,-1794.2096,13.6728, 10.0);


	#if defined Mechanic_OnGameModeInit
		return Mechanic_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Mechanic_OnGameModeInit
#if defined Mechanic_OnGameModeInit
	forward Mechanic_OnGameModeInit();
#endif