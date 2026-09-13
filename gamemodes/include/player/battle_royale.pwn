new PlayerText:BattleRoyaleTD[MAX_PLAYERS][1];
new brAnnouncer[MAX_PLAYERS],
    brTotalKill[MAX_PLAYERS];

enum BattleRoyaleWeaponsArray 
{
    WepID,
	Float:WepX,
	Float:WepY,
	Float:WepZ
};

new const BRWeapons[][BattleRoyaleWeaponsArray] = {
    {24,-210.2016,1061.1672,23.9063},
    {25,-202.4476,1137.9946,19.7422},
    {26,-110.8329,1134.7495,19.7422},
    {27,-84.2287,1080.1077,19.7422},
    {28,13.4927,1067.1764,20.2422},
    {29,-49.6193,1036.8320,19.7261},
    {30,-168.0328,1030.7303,19.7344},
    {31,-217.1298,979.7183,19.5012},
    {32,-321.0400,1056.0925,19.7422},
    {33,-306.9613,1116.8979,19.7493},
    {34,-373.9136,1130.0449,19.6961},
    {24,-347.4498,1192.2494,19.7422},
    {25,-300.7050,1305.1549,53.7839},
    {26,-103.1794,1371.3221,10.2734},
    {27,9.8958,1221.4225,19.3463},
    {28,20.6637,1178.0244,19.4041},
    {24,-154.8964,1109.8994,19.7422},
    {24,-153.8693,1112.3947,19.7422},
    {24,-167.2672,1124.7252,19.7500},
    {24,-167.2672,1124.7252,19.7500},
    {24,-157.3808,1133.4545,19.7422},
    {31,-157.3808,1133.4545,19.7422},
    {31,-143.7144,1137.4856,19.7422},
    {31,-134.7861,1116.2787,20.1966},
    {31,-116.2095,1137.0002,19.7422},
    {31,-89.4611,1158.3273,19.7422},
    {26,-82.5339,1165.7433,19.7422},
    {26,-77.2836,1137.9293,19.7422},
    {26,-76.3532,1109.6194,19.7500},
    {26,-177.6481,1109.9443,19.7422},
    {26,-179.8499,1125.8295,19.7422},
    {27,-211.4288,1133.0862,19.7422},
    {28,-218.7534,1160.8278,19.7422},
    {29,-218.5080,1177.3455,19.7422},
    {30,-290.0301,1124.0448,20.2422},
    {24,-288.8411,1107.0811,19.7422},
    {31,-302.0139,1091.4519,19.7422},
    {33,-296.8088,1080.5068,19.7344},
    {22,-312.4851,1056.7190,19.7422},
    {34,-320.0876,1048.3617,20.3403},
    {25,-326.0219,1059.7882,19.7794},
    {17,-336.3422,1104.2347,19.7422},
    {5,-365.3426,1103.5737,19.7493},
    {4,-362.5714,1110.9556,20.9399},
    {32,-360.4419,1140.1055,20.9399},
    {34,-337.3116,1135.0728,19.7422},
    {33,-321.2346,1126.9473,20.1876},
    {27,-316.4756,1143.0115,19.7422},
    {24,-307.4399,1157.2700,19.7422},
    {30,-285.7459,1155.7144,19.7422},
    {31,-281.7340,1178.1543,19.7422},
    {30,-269.0817,1176.4468,19.7422},
    {30,-199.4572,1188.4619,19.5933},
    {27,-199.2394,1213.3575,19.7422},
    {27,-191.2629,1225.3746,19.7422},
    {28,-174.5395,1234.5306,19.7422},
    {28,-162.1076,1225.4385,19.7422},
    {24,-126.1022,1211.1138,19.7422},
    {25,-92.4500,1221.4384,19.7352},
    {23,-94.4945,1228.5310,19.7422},
    {24,-99.9269,1229.7189,22.4403},
    {25,-94.0116,1228.9412,22.4403},
    {31,-88.7781,1229.3540,22.4403},
    {30,-79.6746,1229.1211,22.4403},
    {32,-70.0053,1212.8232,22.4403},
    {33,-64.4961,1210.7938,22.4365},
    {34,-56.9409,1194.9675,19.2914},
    {31,-32.1261,1175.0216,19.3520}
};
enum BattleRoyaleArray
{
	BRSafezone[2], // 0 Rectangle || 1 GangZone
    BRZoneTimer
};
new BattleRoyale[BattleRoyaleArray];

public OnGameModeInit()
{
    // Ship
    CreateObjectEx(14548, -239.454, 1041.96, 550.852, 0, 0, 2.414);
	CreateDynamic3DTextLabel("Welcome to Battle Royale\nGet a parachute soldier!\nWeapons deployed around the place\nCP Users can type /spawnme to those have bugged apk's.", COLOR_YELLOW, -240.0681,1058.9230,545.8827, 35.0); 
    #if defined Br_OnGameModeInit
		return Br_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Br_OnGameModeInit
#if defined Br_OnGameModeInit
	forward Br_OnGameModeInit();
#endif

public OnPlayerConnect(playerid)
{
    BattleRoyaleTD[playerid][0] = CreatePlayerTextDraw(playerid, 88.000000, 251.000000, "_");
	PlayerTextDrawFont(playerid, BattleRoyaleTD[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, BattleRoyaleTD[playerid][0], 0.170833, 1.000000);
	PlayerTextDrawTextSize(playerid, BattleRoyaleTD[playerid][0], 952.000000, 88.500000);
	PlayerTextDrawSetOutline(playerid, BattleRoyaleTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, BattleRoyaleTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, BattleRoyaleTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, BattleRoyaleTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, BattleRoyaleTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, BattleRoyaleTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, BattleRoyaleTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, BattleRoyaleTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, BattleRoyaleTD[playerid][0], 0);
	#if defined Br_OnPlayerConnect
		return Br_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Br_OnPlayerConnect
#if defined Br_OnPlayerConnect
	forward Br_OnPlayerConnect(playerid);
#endif


public OnPlayerDeath(playerid, killerid, reason)
{
    if(PlayerInfo[playerid][pJoinedEvent] > 0)
    {
        brAnnouncer[killerid] += 1;
        brTotalKill[killerid] += 1;
        
        if(PlayerInfo[playerid][pJoinedEvent])
        {
            if(killerid == INVALID_PLAYER_ID) 
            {
                brAnnouncer[playerid] = 0;
                brTotalKill[killerid] += 1;
            } 
            else 
            {
                brAnnouncer[playerid] = 0;

                if(brAnnouncer[killerid] > 4) {
                    SendMessageToAll(0x84f542ff, "%s is above godlike.", GetRPName(killerid), GetRPName(playerid));
                    GameTextForPlayer(killerid, "~r~Godlike", 2000, 4);
                } else if (brAnnouncer[killerid] == 4) {
                    SendMessageToAll(0x84f542ff, "%s is is dominating.", GetRPName(killerid), GetRPName(playerid));
                    GameTextForPlayer(killerid, "~y~Dominating", 2000, 4);
                } else if (brAnnouncer[killerid] == 3) {
                    SendMessageToAll(0x84f542ff, "%s is in killing spree.", GetRPName(killerid), GetRPName(playerid));
                    GameTextForPlayer(killerid, "~y~Killing spree", 2000, 4);
                } else if (brAnnouncer[killerid] == 2) {
                    SendMessageToAll(0x84f542ff, "%s is in double kill.", GetRPName(killerid), GetRPName(playerid));
                    GameTextForPlayer(killerid, "~y~Double kill", 2000, 4);
                } else if (brAnnouncer[killerid] == 1) {
                    SendMessageToAll(0x84f542ff, "%s has taken the first blood of %s", GetRPName(killerid), GetRPName(playerid));
                    GameTextForPlayer(killerid, "~g~First blood", 2000, 4);
                }
            }
        }
    }
    #if defined Br_OnPlayerDeath
		return Br_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath Br_OnPlayerDeath
#if defined Br_OnPlayerDeath
	forward Br_OnPlayerDeath(playerid, killerid, reason);
#endif

ResetBR() 
{
    BattleRoyale[BRZoneTimer] = 0;
    if(IsValidDynamicArea(BattleRoyale[BRSafezone][0])) DestroyDynamicArea(BattleRoyale[BRSafezone][0]);
    GangZoneDestroy(BattleRoyale[BRSafezone][1]);

    // Weapons Drop
	for(new i = 0, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i <= j; i ++)
	{
        new Text3D:textid = Text3D:Streamer_GetExtraInt(i, E_OBJECT_GUN3DTEXT);
        if(Streamer_GetExtraInt(i, E_OBJECT_EVENT))
        {
			if(IsValidDynamic3DTextLabel(textid)) DestroyDynamic3DTextLabel(textid);
			DestroyDynamicObject(i);
        }
    }
}


forward BRUseInventory(playerid);
public BRUseInventory(playerid)
{
	if(GetPVarInt(playerid, "brselected") == 1)
	{	
        EventInfo[eBRMedkit]--;
        SetPlayerHealth(playerid, 100.0);
        SendClientMessage(playerid, COLOR_YELLOW, "[Battle Royale]: "WHITE"Health generate successfully, Health added 100%%");
	}
	if(GetPVarInt(playerid, "brselected") == 2)
	{
        EventInfo[eBRVest]--;
        SetScriptArmour(playerid, 100.0);
        SendClientMessage(playerid, COLOR_YELLOW, "[Battle Royale]: "WHITE"Armor generate successfully, Armor added 100%%");
	}
    return 1;
}


// Start of Commands
CMD:spawnme(playerid, params[]) 
{
    if(PlayerInfo[playerid][pJoinedEvent] && EventInfo[eType] == 4 && IsPlayerAndroid(playerid))
    {
        SetPlayerPos(playerid, -193.3018,1099.6786,19.5938);
        SetPlayerFacingAngle(playerid, 21.8927);
    }
    return 1;
}

CMD:brhelp(playerid, params[])
{
    if(EventInfo[eType] == 4) 
    {
        SendClientMessage(playerid, COLOR_WHITE, "Battle Royal Command List:");
        SendClientMessage(playerid, COLOR_WHITE, "Command: /brbackpack, /brmedkit, /brinv(entory), /bruse");
    }
    return 1;
}

CMD:brbackpack(playerid, params[])
{
    new string[128];
    if(!PlayerInfo[playerid][pJoinedEvent])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to be part of an event.");
	}

    if(EventInfo[eType] == 4) 
    {
        if(EventInfo[eBRBackpack] == 1)
        {
            SetPlayerAttachedObject(playerid, 9, 3026,1,-0.064000,-0.104000,0.000000,0.000000,0.000000,0.000000,0.870999,0.748000,0.828999);
            format(string, sizeof(string), "wears his backpack on his back.");
            callcmd::me(playerid, string);
        }
	}
    return 1;
}

CMD:bruse(playerid, params[])
{
    new option[24];
    if(!PlayerInfo[playerid][pJoinedEvent])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to be part of an event.");
	}
    if(EventInfo[eType] == 4) 
    {
        if(sscanf(params, "s[24]", option))
        {
            SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /bruse [option]");
            SendMessage(playerid, COLOR_WHITE, "Available options: Medkit, Vest");
            return 1;
        }
        if(!strcmp(option, "medkit", true))
        {
            SendClientMessage(playerid, COLOR_YELLOW, "[Battle Royale]: "WHITE"Wait 10 seconds to generate your health");
            SetTimerEx("BRUseInventory", 10000, false, "i", playerid);
            SetPVarInt(playerid, "brselected", 1);
        }
        else if(!strcmp(option, "vest", true))
        {
            SendClientMessage(playerid, COLOR_YELLOW, "[Battle Royale]: "WHITE"Wait 10 seconds to generate your armor");
            SetTimerEx("BRUseInventory", 10000, false, "i", playerid);
            SetPVarInt(playerid, "brselected", 2);
        }
    }
    return 1;
}

alias:("brinventory");
CMD:brinv(playerid, params[])
{
    new string[128];
    if(!PlayerInfo[playerid][pJoinedEvent])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to be part of an event.");
	}
    if(EventInfo[eType] == 4) 
    {
        strcat(string, "Items:\tTotal Items:");
        format(string, sizeof(string), "%s\n\
        Medkit\t%d\n\
        Vest\t%d\n\
        "WHITE"    \n\
        "YELLOW"Type (/bruse) to use medkit and vest armor", string, EventInfo[eBRMedkit], EventInfo[eBRVest]);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "List of Inventory in Battle Royale", string, "Close", "");
	}
    return 1;
}

CMD:participants(playerid, params[]) return callcmd::survivors(playerid, params);
CMD:survivors(playerid, params[])
{
	if(PlayerInfo[playerid][pJoinedEvent])
	{
		new string[(1024 * 2)], count;
		string[0] = EOS;
        strcat(string, "Name:\tLevel:\n");
		foreach(new i : Player)
		{
			if(PlayerInfo[i][pJoinedEvent])
			{
				format(string, sizeof(string), "%s[ID: %d] %s\t%d\n", string, i, GetRPName(i), PlayerInfo[i][pLevel]);
				count++;
			}
		}
		if(!string[0]) format(string, sizeof(string), "No survivors left.");
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, "List of Survivors in Battle Royale", string, "Close", "");
	}
	else SendClientMessage(playerid, COLOR_GREY, "You need to be part of an event.");
	return 1;
}