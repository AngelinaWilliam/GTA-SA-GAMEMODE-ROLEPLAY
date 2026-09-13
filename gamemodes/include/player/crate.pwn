#define CRATE_MODEL               (3799)
#define CRATE_FLARE_MODEL         (18728)

new gCrateObject;
new Text3D:gCrateLabel;

new Float: gRandomCrate[][3] =
{   // X          Y        Z
    {836.4020,-2060.7915,12.8672}
};

stock ResetCrateVariables()
{
    gCrateObject = 0;
    DestroyDynamicObject(CRATE_MODEL); 
    DestroyDynamic3DTextLabel(Text3D:gCrateLabel); 
    SendClientMessageToAll(COLOR_LIGHTRED, "SERVER: The crate has been destroyed! Another will respawn soon.");
    return 1;
}

public OnGameModeInit()
{
    SetTimer("OnCreateCrateDynamic", 60000, true);
    #if defined Crate_OnGameModeInit
		return Crate_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Crate_OnGameModeInit
#if defined Crate_OnGameModeInit
	forward Crate_OnGameModeInit();
#endif

public OnGameModeExit()
{
    gCrateObject = 0;
    DestroyDynamicObject(gCrateObject); 
	DestroyDynamic3DTextLabel(Text3D:gCrateLabel); 
    #if defined Crate_OnGameModeExit
		return Crate_OnGameModeExit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit Crate_OnGameModeExit
#if defined Crate_OnGameModeExit
	forward Crate_OnGameModeExit();
#endif

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_CRATE_BOX)
    {
        if(response) 
        {
            if(listitem == 0) // Random Weapons
            {
                new randwep = Random(0, 50);
                switch(randwep)
                {
                    case 0..50: 
                    {
                        new randweps = random(15);
                        if(randweps == 0)
					    { 
                            GivePlayerWeaponEx(playerid, 1, true); // Brass Knuckles
                            ResetCrateVariables();
                            
                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Brass Knuckles");
                        }
                        if(randweps == 1)
					    { 
                            GivePlayerWeaponEx(playerid, 5, true); // Baseball Bat
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Baseball Bat");
                        }
                        if(randweps == 2)
					    { 
                            GivePlayerWeaponEx(playerid, 4, true); // Knife
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Knife");
                        }
                        if(randweps == 3)
					    {
                            GivePlayerWeaponEx(playerid, 8, true); // Katana
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Katana");
                        }
                        if(randweps == 4)
					    { 
                            GivePlayerWeaponEx(playerid, 27, 100); // Spas
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Spas");
                        }
                        if(randweps == 5)
					    { 
                            GivePlayerWeaponEx(playerid, 26, 100); // Sawn Off
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Sawn Off");
                        }
                        if(randweps == 6)
					    { 
                            GivePlayerWeaponEx(playerid, 25, 100); // Shotgun
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Shotgun");
                        }
                        if(randweps == 7)
					    { 
                            GivePlayerWeaponEx(playerid, 24, 150); // Deagle
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Deagle");
                        }
                        if(randweps == 8)
					    { 
                            GivePlayerWeaponEx(playerid, 22, 150); // 9mm
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received 9mm");
                        }
                        if(randweps == 9)
					    { 
                            GivePlayerWeaponEx(playerid, 23, 150); // Silenced Pistol
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Silenced Pistol");
                        }
                        if(randweps == 10)
					    { 
                            GivePlayerWeaponEx(playerid, 29, 250); // MP5
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received MP5");
                        }
                        if(randweps == 11)
					    { 
                            GivePlayerWeaponEx(playerid, 30, 300); // AK
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received AK47");
                        }
                        if(randweps == 12)
					    { 
                            GivePlayerWeaponEx(playerid, 31, 300); // M4
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received M4");
                        }
                        if(randweps == 13)
					    { 
                            GivePlayerWeaponEx(playerid, 33, 100); // Cuntgun
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Cuntgun");
                        }
                        if(randweps == 14)
					    { 
                            GivePlayerWeaponEx(playerid, 34, 100); // Sniper
                            ResetCrateVariables();

                            SendClientMessage(playerid, COLOR_GREEN, "Congratulations: You have received Sniper");
                        }
                    }
                }
            }
            if(listitem == 1) // Random Items
            {
                new randitem = Random(0, 50);
                switch(randitem)
                {
                    case 0..50: 
                    {
                        new randitems = random(10);
                        if(randitems == 0)
					    { 
                            new pot = Random(1, 20);
                            PlayerInfo[playerid][pPot] += pot;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d gram(s) of pot", pot);
                        }
                        if(randitems == 1)
					    { 
                            new crack = Random(1, 20);
                            PlayerInfo[playerid][pCrack] += crack;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d gram(s) of crack", crack);
                        }
                        if(randitems == 2)
					    { 
                            new crack = Random(2500, 7500);
                            PlayerInfo[playerid][pCrack] += crack;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d materials", crack);
                        }
                        if(randitems == 3)
					    { 
                            new seed = Random(1, 20);
                            PlayerInfo[playerid][pSeeds] += seed;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d gram(s) of seeds", seed);
                        }
                        if(randitems == 4)
					    { 
                            new meth = Random(1, 20);
                            PlayerInfo[playerid][pMeth] += meth;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d gram(s) of meth", meth);
                        }
                        if(randitems == 5)
					    { 
                            new firstaid = Random(1, 20);
                            PlayerInfo[playerid][pFirstAid] += firstaid;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d firstaid", firstaid);
                        }
                        if(randitems == 6)
					    {

                        }
                        if(randitems == 7)
					    { 

                        }
                        if(randitems == 8)
					    { 
                            new bank = Random(100000, 250000);
                            PlayerInfo[playerid][pBank] += bank;

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d bank cash", bank);
                        }
                        if(randitems == 9)
					    {
                            new money = Random(100000, 250000);
                            GivePlayerCash(playerid, money);

                            SavePlayerVariables(playerid);
                            SendMessage(playerid, COLOR_GREEN, "Congratulations: You have received %d$ cash", money);
                        }
                    }
                }
            }
        }
        if(!response) 
        {
            ResetCrateVariables();
        }
    }
	#if defined Crate_OnDialogResponse
		return Crate_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Crate_OnDialogResponse
#if defined Crate_OnDialogResponse
	forward Crate_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

CMD:opencrate(playerid, params[])
{
	if(gCrateObject != 0)
	{
	    new rand = random(sizeof(gRandomCrate));
		if(IsPlayerInRangeOfPoint(playerid, 5.0, gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]))
		{
            SendMessageToAll(COLOR_YELLOW, "Congratulations: %s has found the crate. A new one will spawn soon!", GetRPName(playerid));
		    SendClientMessage(playerid, COLOR_RED, "The crate will be  destroyed once you click the close dialog");

			ShowPlayerDialog(playerid, DIALOG_CRATE_BOX, DIALOG_STYLE_LIST, "Crate System","Random Weapons\nRandom Items", "Select", "Close");
		}
		else SendClientMessage(playerid, COLOR_SYNTAX, "You aren't near the crate");
	}
    else SendClientMessage(playerid, COLOR_SYNTAX, "No crates have spawned on our server");
	return 1;
}

CMD:nearcrate(playerid, params[])
{
    if(gCrateObject != 0)
	{
		new rand = random(sizeof(gRandomCrate)),
        Float: CrateDistance = GetPlayerDistanceFromPoint(playerid, gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]);
        SendMessage(playerid, COLOR_YELLOW, "You're %.0f meters away from the crate.", CrateDistance);
	}
	else SendClientMessage(playerid, COLOR_SYNTAX, "No crates have spawned on our server");
	return 1;
}

CMD:dropcrate(playerid, params[])
{
    new rand = random(sizeof(gRandomCrate));

    if(PlayerInfo[playerid][pAdmin] < 2)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
    if(gCrateObject == 0)
    {
        gCrateObject = CreateDynamicObject(CRATE_MODEL, gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2] - 1.0, 1.0, -1, -1, -1);
        gCrateLabel = CreateDynamic3DTextLabel("Crate Box\nType {FFFF00}[/opencrate] {FFFFFF}to claim random rewards", COLOR_WHITE, gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]+0.0, 10.0);

        SendMessageToAll(COLOR_LIGHTRED, "SERVER: A crate has been spawned at %s. Find it, and you'll be rewarded.", GetZoneName(gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]));
    }
    return 1;
}

forward OnCreateCrateDynamic(playerid);
public OnCreateCrateDynamic(playerid)
{
    new hour, minutes,
        rand = random(sizeof(gRandomCrate));

    gettime(hour, minutes);
    if(minutes == 30)
    {
        if(gCrateObject == 0)
	    {
            gCrateObject = CreateDynamicObject(CRATE_MODEL, gRandomCrate[rand][0]-0.2, gRandomCrate[rand][1], gRandomCrate[rand][2]-0.2, -1, -1, -1);
            gCrateLabel = CreateDynamic3DTextLabel("Crate Box\nType {FFFF00}[/opencrate] {FFFFFF}to claim random rewards", COLOR_WHITE, gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]+0.0, 10.0);

            SendMessageToAll(COLOR_LIGHTRED, "SERVER: A crate has been spawned at %s. Find it, and you'll be rewarded.", GetZoneName(gRandomCrate[rand][0], gRandomCrate[rand][1], gRandomCrate[rand][2]));
        }
    }
}