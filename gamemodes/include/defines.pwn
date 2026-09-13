#define SCM 	SendClientMessage
#define SM 		SendMessage
#define SMA 	SendMessageToAll
#define SAM 	SendAdminMessage
//--------------------------------------------------------------
// Model Selection
#define MODEL_SELECTION_CLOTHING    1
#define MODEL_SELECTION_FURNITURE 	2
#define MODEL_SELECTION_LANDOBJECTS 3
#define MODEL_SELECTION_CLOTHES     4
#define MODEL_SELECTION_SKIN        5
#define MODEL_SELECTION_VIPTOYS     6
#define MODEL_SELECTION_FACTIONTOYS 7
//--------------------------------------------------------------
#undef MAX_PLAYERS
#define MAX_PLAYERS 				300
#define MAX_LISTED_NUMBERS          50
#define MAX_LISTED_OBJECTS          100
#define MAX_LISTED_STATIONS         50
#define MAX_SPLIT_LENGTH            70
//--------------------------------------------------------------
#define MAX_REPORTS         		50
#define MAX_HOUSES          		1500
#define MAX_CCTVS 					100
#define MAX_CCTVMENUS 				10  // This number should be MAX_CCTVS divided by 10
#define MAX_GARAGES         		1000
#define MAX_BUSINESSES      		500
#define MAX_ENTRANCES       		500
#define MAX_SPEED_CAMERAS           50
#define MAX_GATES					500
#define MAX_MAPOBJECTS				1000
#define MAX_PLAYER_CLOTHING     	10
#define MAX_ANTICHEAT_WARNINGS   	5
#define MAX_OOB_WARNINGS   	        3
#define MAX_FACTIONS                40
#define MAX_FACTION_RANKS           20
#define MAX_FACTION_SKINS           15
#define MAX_FACTION_DIVISIONS       5
#define MAX_DEPLOYABLES             50
#define MAX_FIRES                   100
#define MAX_LANDS                   100
#define MAX_GANGS                   20
#define MAX_GANG_SKINS              10
#define MAX_POINTS                  15
#define MAX_TURFS                   150
#define MAX_BANK_ROBBERS            7
#define MAX_GRAFFITI_POINTS         200
#define MAX_HOSPITALBEDS			4
#define	MAX_HOSPITALS				3

// Dealership
#define INVALID_BUSINESS_ID 	-1
#define MAX_BUSINESS_DEALERSHIP_VEHICLES	10
//--------------------------------------------------------------
#define SERVER_MUSIC_URL ""SERVER_URL"/music"
#define SERVER_FETCH_URL ""SERVER_URL"/music"
#define SOUND_MUSIC3                140
#define RED_TEAM    0
#define BLUE_TEAM   1
//--------------------------------------------------------------
#define strcpy(%0,%1)   strcat(((%0[0] = 0), %0), %1)
#define percent(%0,%1)  floatround((float((%0)) / 100) * (%1))
#define Random(%0,%1)   (random((%1) - (%0)) + (%0))
#define Bit_State(%0,%1) ((%0) & (%1))
#define Bit_On(%0,%1) ((%0) |= (%1))
#define Bit_Off(%0,%1) ((%0) &= ~(%1))
#define Bit_Toggle(%0,%1) ((%0) ^= (%1))
#define GetPlayerCash(%0) PlayerInfo[%0][pCash]

#undef SSCANF_Join
#undef SSCANF_Leave
#define Create
#define Object

#define GetVehicleBoot(%0,%1,%2,%3) \
	(GetVehicleOffset((%0), VEHICLE_OFFSET_BOOT, %1, %2, %3))
//--------------------------------------------------------------
// Tune system
new pvehicleid[MAX_PLAYERS];
new pmodelid[MAX_PLAYERS];
#define DIALOG_TYPE_MAIN 14400
#define DIALOG_TYPE_EXHAUSTS 14700
#define DIALOG_TYPE_FBUMPS 14800
#define DIALOG_TYPE_RBUMPS 14900
#define DIALOG_TYPE_ROOFS 15000
#define DIALOG_TYPE_SPOILERS 15100
#define DIALOG_TYPE_SIDESKIRTS 15200
#define DIALOG_TYPE_BULLBARS 15300
#define DIALOG_TYPE_WHEELS 15400
#define DIALOG_TYPE_CSTEREO 15500
#define DIALOG_TYPE_HYDRAULICS 15600
#define DIALOG_TYPE_NITRO 15700
#define DIALOG_TYPE_LIGHTS 15800
#define DIALOG_TYPE_HOODS 15900
#define DIALOG_TYPE_VENTS 16000