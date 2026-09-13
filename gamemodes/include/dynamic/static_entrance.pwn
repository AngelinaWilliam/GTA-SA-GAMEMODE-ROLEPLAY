enum entranceEnum
{
	eName[32],
	eInterior,
 	eWorld,
 	eMapIcon,
 	eFreeze,
	Float:ePosX,
	Float:ePosY,
	Float:ePosZ,
	Float:ePosA,
	Float:eIntX,
	Float:eIntY,
	Float:eIntZ,
	Float:eIntA
};

new const staticEntrances[][entranceEnum] =
{
    // Name                         INT     World   Mapicon    Freeze    ePosX       ePosY      ePosZ    ePosA     eIntX      eIntY      eIntZ      eIntA
	{"Allsaints General Hospital ", 1,      1,      22,        true,     1172.1577, -1323.3389, 15.4030, 269.4372, 196.7153, 1884.9635, 369.3091, 269.8590},
    {"County General Hospital ",    1,      2,      22,        true,     2037.8998, -1404.7322, 17.2519, 90.6179,  196.7153, 1884.9635, 369.3091, 269.8590}
};

public OnGameModeInit()
{
    new string[128 * 2];
    for(new i = 0; i < sizeof(staticEntrances); i ++)
	{
	    format(string, sizeof(string), ""SVRCLR"%s [%i]\n"WHITE"Press 'Y' to enter", staticEntrances[i][eName]);

	    CreateDynamicPickup(19132, 1, staticEntrances[i][ePosX], staticEntrances[i][ePosY], staticEntrances[i][ePosZ]);
		CreateDynamicPickup(19132, 1, staticEntrances[i][eIntX], staticEntrances[i][eIntY], staticEntrances[i][eIntZ], .worldid = staticEntrances[i][eWorld], .interiorid = staticEntrances[i][eInterior]);

	    CreateDynamic3DTextLabel(string, COLOR_GREY, staticEntrances[i][ePosX], staticEntrances[i][ePosY], staticEntrances[i][ePosZ], 5.0);

	    format(string, sizeof(string), ""SVRCLR"%s [%i]\n"WHITE"Press 'Y' to exit", staticEntrances[i][eName]);
		CreateDynamic3DTextLabel(string, COLOR_GREY, staticEntrances[i][eIntX], staticEntrances[i][eIntY], staticEntrances[i][eIntZ], 5.0, .worldid = staticEntrances[i][eWorld], .interiorid = staticEntrances[i][eInterior]);

	    if(staticEntrances[i][eMapIcon])
	    {
	        CreateDynamicMapIcon(staticEntrances[i][ePosX], staticEntrances[i][ePosY], staticEntrances[i][ePosZ], staticEntrances[i][eMapIcon], 0);
		}
	}
    #if defined StaticEntrance_OnGameModeInit
		return StaticEntrance_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit StaticEntrance_OnGameModeInit
#if defined StaticEntrance_OnGameModeInit
	forward StaticEntrance_OnGameModeInit();
#endif