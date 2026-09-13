/*enum E_RENTCAR_DATA {
	Float:RentX,
	Float:RentY,
	Float:RentZ
};

new const RentVehicleStation[][E_RENTCAR_DATA] = {
	{1431.9008,-2286.4915,13.3828}
};

public OnGameModeInit()
{
    for(new i = 0; i < sizeof(RentVehicleStation); i ++)
	{
	    CreateDynamic3DTextLabel("Rent Vehicle\nType '/rentvehicle' to rent the vehicle", COLOR_GREY, RentVehicleStation[i][RentX], RentVehicleStation[i][RentY], RentVehicleStation[i][RentZ] + 0.4, 12.0);
	}
    #if defined RentCar_OnGameModeInit
		return RentCar_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit RentCar_OnGameModeInit
#if defined RentCar_OnGameModeInit
	forward RentCar_OnGameModeInit();
#endif

CMD:rentvehicle(playerid, params[])
{
    new string[1028] = "Vehicle Name:\tRent Price:";
    format(string, sizeof(string), "%s\n\
    Sultan\t10000\n\
    Elegy\t15000\n\
    Uranus\t\t20000\n\
    Super GT\t25000", string);
	Dialog_Show(playerid, Rent_Vehicle, DIALOG_STYLE_TABLIST_HEADERS, "Rent Vehicle Station", string, "Rent", "Cancel");
    return 1;
}
*/

Dialog:Rent_Vehicle(playerid, response, listitem, inputtext[]) 
{
    new Float:x, Float:y, Float:z, Float:a, vehicleid;
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                GivePlayerCash(playerid, -10000);
                GetPlayerPos(playerid, x, y, z);
                GetPlayerFacingAngle(playerid, a);
                vehicleid = AddStaticVehicleEx(560, x, y, z, a, 1, 1, -1);
                vehicleFuel[vehicleid] = 100;
                rentVehicle{vehicleid} = true;

                SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
                LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
                PutPlayerInVehicle(playerid, vehicleid, 0);

                SendClientMessage(playerid, COLOR_YELLOW, "[RENT VEHICLE]: You have been successfully rent this vehicle (Name: Sultan) (Price: $10,000)");
            }
            case 1:
            {
                GivePlayerCash(playerid, -10000);
                GetPlayerPos(playerid, x, y, z);
                GetPlayerFacingAngle(playerid, a);
                vehicleid = AddStaticVehicleEx(560, x, y, z, a, 1, 1, -1);
                vehicleFuel[vehicleid] = 100;
                rentVehicle{vehicleid} = true;

                SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
                LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
                PutPlayerInVehicle(playerid, vehicleid, 0);

                SendClientMessage(playerid, COLOR_YELLOW, "[RENT VEHICLE]: You have been successfully rent this vehicle (Name: Elegy) (Price: $15,000)");
            }
            case 2:
            {
                GivePlayerCash(playerid, -10000);
                GetPlayerPos(playerid, x, y, z);
                GetPlayerFacingAngle(playerid, a);
                vehicleid = AddStaticVehicleEx(560, x, y, z, a, 1, 1, -1);
                vehicleFuel[vehicleid] = 100;
                rentVehicle{vehicleid} = true;

                SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
                LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
                PutPlayerInVehicle(playerid, vehicleid, 0);

                SendClientMessage(playerid, COLOR_YELLOW, "[RENT VEHICLE]: You have been successfully rent this vehicle (Name: Uranus) (Price: $20,000)");
            }
            case 3:
            {
                GivePlayerCash(playerid, -10000);
                GetPlayerPos(playerid, x, y, z);
                GetPlayerFacingAngle(playerid, a);
                vehicleid = AddStaticVehicleEx(560, x, y, z, a, 1, 1, -1);
                vehicleFuel[vehicleid] = 100;
                rentVehicle{vehicleid} = true;

                SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
                LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
                PutPlayerInVehicle(playerid, vehicleid, 0);

                SendClientMessage(playerid, COLOR_YELLOW, "[RENT VEHICLE]: You have been successfully rent this vehicle (Name: Super GT) (Price: $25,000)");
            }
        }
    }
    return 1;
}