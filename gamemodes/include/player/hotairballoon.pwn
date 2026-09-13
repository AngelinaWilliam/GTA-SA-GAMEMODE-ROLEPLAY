enum airBalloonEnum
{
	abObject[2],
	bool:abInAir[2],
	Text3D:abText[2]

}
new HotAirBalloon[airBalloonEnum];

public OnGameModeInit()
{
    HotAirBalloon[abObject][0] = CreateDynamicObject(19335, 1884.284790, -2543.098876, 16.182872, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    HotAirBalloon[abObject][1] = CreateDynamicObject(19336, 1652.572387, -2543.098876, 16.182872, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	HotAirBalloon[abText][0] = CreateDynamic3DTextLabel("Use /ab to fly", COLOR_YELLOW, 1884.284790, -2543.098876, 16.182872, 12.0);	
	HotAirBalloon[abText][1] = CreateDynamic3DTextLabel("Use /ab to fly", COLOR_YELLOW, 1652.572387, -2543.098876, 16.182872, 12.0);
	HotAirBalloon[abInAir][0] = false;
	HotAirBalloon[abInAir][1] = false;
    #if defined HotAirBalloon_OnGameModeInit
		return HotAirBalloon_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit HotAirBalloon_OnGameModeInit
#if defined HotAirBalloon_OnGameModeInit
	forward HotAirBalloon_OnGameModeInit();
#endif


CMD:ab(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1884.284790, -2543.098876, 16.182872) && !IsPlayerInRangeOfPoint(playerid, 5.0, 1652.572387, -2543.098876, 16.182872))
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not in range of any Hot Air Balloons.");
	
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1884.284790, -2543.098876, 16.182872))
	{
		if(HotAirBalloon[abInAir][0] == false)
		{
			MoveDynamicObject(HotAirBalloon[abObject][0], 1884.284790, -2543.098876, 560.000000, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][0] = true;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You light up the fire and the Balloon starts to lift.");
			SendClientMessage(playerid, COLOR_SYNTAX, "Note: Use /ab again to goes down.");
		}
		else if(HotAirBalloon[abInAir][0] == true)
		{
			MoveDynamicObject(HotAirBalloon[abObject][0], 1884.284790, -2543.098876, 16.182872, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][0] = false;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You turn off the fire and the Balloon starts to slowly goes down.");
		}
	}
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1884.284790, -2543.098876, 560.000000))
	{
		if(HotAirBalloon[abInAir][0] == false)
		{
			MoveDynamicObject(HotAirBalloon[abObject][0], 1884.284790, -2543.098876, 560.000000, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][0] = true;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You light up the fire and the Balloon starts to lift.");
			SendClientMessage(playerid, COLOR_SYNTAX, "Note: Use /ab again to goes down.");
		}
		else if(HotAirBalloon[abInAir][0] == true)
		{
			MoveDynamicObject(HotAirBalloon[abObject][0], 1884.284790, -2543.098876, 16.182872, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][0] = false;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You turn off the fire and the Balloon starts to slowly goes down.");
		}
	}
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1652.572387, -2543.098876, 16.182872))
	{
		if(HotAirBalloon[abInAir][1] == false)
		{
			MoveDynamicObject(HotAirBalloon[abObject][1], 1652.572387, -2543.098876, 560.000000, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][1] = true;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You light up the fire and the Balloon starts to lift.");
			SendClientMessage(playerid, COLOR_SYNTAX, "Note: Use /ab again to goes down.");
		}
		else if(HotAirBalloon[abInAir][1] == true)
		{
			MoveDynamicObject(HotAirBalloon[abObject][1], 1652.572387, -2543.098876, 16.182872, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][1] = false;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You turn off the fire and the Balloon starts to slowly goes down.");
		}
	}
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1652.572387, -2543.098876, 560.000000))
	{
		if(HotAirBalloon[abInAir][1] == false)
		{
			MoveDynamicObject(HotAirBalloon[abObject][1], 1652.572387, -2543.098876, 560.000000, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][1] = true;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You light up the fire and the Balloon starts to lift.");
			SendClientMessage(playerid, COLOR_SYNTAX, "Note: Use /ab again to goes down.");
		}
		else if(HotAirBalloon[abInAir][1] == true)
		{
			MoveDynamicObject(HotAirBalloon[abObject][1], 1652.572387, -2543.098876, 16.182872, 5.0, 0.000000, 0.000000, 0.000000);
			HotAirBalloon[abInAir][1] = false;
			SendClientMessage(playerid, COLOR_YELLOW, "[HOT-AIR BALLOON]"WHITE" You turn off the fire and the Balloon starts to slowly goes down.");
		}
	}
	return 1;
}