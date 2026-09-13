
/* -----------------------------------------------------------------------------------------------*/

public OnGameModeInit() {
    progress_bar_TD[0] = TextDrawCreate(233.3332, 359.8148, "LD_SPAC:white"); // �����
    TextDrawTextSize(progress_bar_TD[0], 160.0000, 37.0000);
    TextDrawAlignment(progress_bar_TD[0], 1);
    TextDrawColor(progress_bar_TD[0], 623191551);
    TextDrawBackgroundColor(progress_bar_TD[0], 255);
    TextDrawFont(progress_bar_TD[0], 4);
    TextDrawSetProportional(progress_bar_TD[0], 0);
    TextDrawSetShadow(progress_bar_TD[0], 0);

    progress_bar_TD[1] = TextDrawCreate(238.3333, 362.6667, "PROGRESS_BAR"); // �����
    TextDrawLetterSize(progress_bar_TD[1], 0.1675, 1.0296);
    TextDrawAlignment(progress_bar_TD[1], 1);
    TextDrawColor(progress_bar_TD[1], -1);
    TextDrawBackgroundColor(progress_bar_TD[1], 255);
    TextDrawFont(progress_bar_TD[1], 2);
    TextDrawSetProportional(progress_bar_TD[1], 1);
    TextDrawSetShadow(progress_bar_TD[1], 0);

    progress_bar_TD[2] = TextDrawCreate(238.3333, 374.8517, "LD_SPAC:white"); // �����
    TextDrawTextSize(progress_bar_TD[2], 150.0000, 13.0000);
    TextDrawAlignment(progress_bar_TD[2], 1);
    TextDrawColor(progress_bar_TD[2], -206);
    TextDrawBackgroundColor(progress_bar_TD[2], 255);
    TextDrawFont(progress_bar_TD[2], 4);
    TextDrawSetProportional(progress_bar_TD[2], 0);
    TextDrawSetShadow(progress_bar_TD[2], 0);
	#if defined prog_OnGameModeInit
		return prog_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit prog_OnGameModeInit
#if defined prog_OnGameModeInit
	forward prog_OnGameModeInit();
#endif

/* -----------------------------------------------------------------------------------------------*/

public OnPlayerConnect(playerid) {
    player_progress_step[playerid] = 0;
    player_progress_type[playerid] = 0;
    is_progress_show[playerid] = false;
    progress_key[playerid] = 0; 
    progress_timer[playerid] = -1;
    current_position_progress[playerid] = 0.0;

    progress_bar_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 238.3333, 374.8517, "LD_SPAC:white"); // �����
    PlayerTextDrawTextSize(playerid, progress_bar_PTD[playerid][0], 0.0000, 13.0000);
    PlayerTextDrawAlignment(playerid, progress_bar_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, progress_bar_PTD[playerid][0], -6732289);
    PlayerTextDrawBackgroundColor(playerid, progress_bar_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, progress_bar_PTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, progress_bar_PTD[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, progress_bar_PTD[playerid][0], 0);

    progress_bar_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 272.9165, 377.1852, "Press_(Y)_on_the_bar_to_proceed"); // �����
    PlayerTextDrawLetterSize(playerid, progress_bar_PTD[playerid][1], 0.1200, 0.8533);
    PlayerTextDrawAlignment(playerid, progress_bar_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, progress_bar_PTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, progress_bar_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, progress_bar_PTD[playerid][1], 2);
    PlayerTextDrawSetProportional(playerid, progress_bar_PTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, progress_bar_PTD[playerid][1], 0);

    progress_bar_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 238.3333, 374.8517, "LD_SPAC:white"); // �����
    PlayerTextDrawTextSize(playerid, progress_bar_PTD[playerid][2], 0.0000, 13.0000);
    PlayerTextDrawAlignment(playerid, progress_bar_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, progress_bar_PTD[playerid][2], -6732289);
    PlayerTextDrawBackgroundColor(playerid, progress_bar_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, progress_bar_PTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, progress_bar_PTD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, progress_bar_PTD[playerid][2], 0);
	#if defined prog_OnPlayerConnect
		return prog_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect prog_OnPlayerConnect
#if defined prog_OnPlayerConnect
	forward prog_OnPlayerConnect(playerid);
#endif

/* -----------------------------------------------------------------------------------------------*/

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {	
    if(newkeys == 65536) 
    {
        if(progress_key[playerid] == 1) {
            new Float: current_position = current_position_progress[playerid];
            new success_position = random_position_progress[playerid] - 240;

            if(floatround(current_position) >= success_position && current_position <= success_position + 15)
            {
                KillTimer(progress_timer[playerid]);
                player_progress_step[playerid] ++;
                current_position_progress[playerid] = 0.0;
                progress_timer[playerid] = SetTimerEx("updateProgress", 50, true, "i", playerid);
                ShowPlayerProgress(playerid, player_progress_type[playerid], player_progress_title[playerid]);
            }
            else 
            {
                switch(player_progress_type[playerid])
                {
                    case 2:
                    {
                        new targetid = GetPVarInt(playerid, "IsStealing");
                        ClearAnimations(playerid, 1);
                        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has failed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                        DeletePVar(playerid, "IsStealing");
                        return HideProgress(playerid);
                    }
                }
            }
        }
    }

    if(newkeys == 131072) 
    {
        if(progress_key[playerid] == 2) {
            new Float: current_position = current_position_progress[playerid];
            new success_position = random_position_progress[playerid] - 240;

            if(floatround(current_position) >= success_position && current_position <= success_position + 15)
            {
                KillTimer(progress_timer[playerid]);
                current_position_progress[playerid] = 0.0;
                player_progress_step[playerid] ++;
                progress_timer[playerid] = SetTimerEx("updateProgress", 50, true, "i", playerid);                
                ShowPlayerProgress(playerid, player_progress_type[playerid], player_progress_title[playerid]);
            }
            else 
            {
                switch(player_progress_type[playerid])
                {
                    case 2:
                    {
                        new targetid = GetPVarInt(playerid, "IsStealing");
                        ClearAnimations(playerid, 1);
                        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has failed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                        DeletePVar(playerid, "IsStealing");
                        return HideProgress(playerid);
                    }
                }
            }
        }
    }
    #if defined prog_OnPlayerKeyStateChange
		return prog_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange prog_OnPlayerKeyStateChange
#if defined prog_OnPlayerKeyStateChange
	forward prog_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif
/* -----------------------------------------------------------------------------------------------*/
/*CMD:progress(playerid)
{
    new string[32];
    format(string, sizeof(string), "Mining...");
    strcpy(player_progress_title[playerid], string);
    ShowPlayerProgress(playerid, 1, string);
    return 1;
}*/
/* -----------------------------------------------------------------------------------------------*/
stock ShowPlayerProgress(playerid, progress_type, title[])
{   
    if(!is_progress_show[playerid])
    {
        for(new i; i < sizeof progress_bar_TD; i++) TextDrawShowForPlayer(playerid, progress_bar_TD[i]);
        for(new j; j < 3; j++) PlayerTextDrawShow(playerid, progress_bar_PTD[playerid][j]);

        TogglePlayerControllable(playerid, false);
        is_progress_show[playerid] = true;
        player_progress_step[playerid] = 0;
        player_progress_type[playerid] = progress_type;        
        progress_key[playerid] = 0;
        current_position_progress[playerid] = 0.0;

        progress_timer[playerid] = SetTimerEx("updateProgress", 50, true, "i", playerid);
    }
    if(player_progress_step[playerid] >= 3)
    {
        switch(progress_type) // progress_type - 1 - Mining
        {
            case 2:
            {
                new targetid = GetPVarInt(playerid, "IsStealing");
                new string2[1024], titles[64];
                format(titles, sizeof(titles), "Stealing Items");
                format(string2, sizeof(string2), "Item\tAmount\tPercentage\nCash\t%i\t%i Percent\nMaterials\t%i\t%i Percent\nPot\t%i\t%i Percent\nCrack\t%i\t%i Percent\nWeapons",
                PlayerInfo[targetid][pCash], gStealPercent, PlayerInfo[targetid][pMaterials], gStealPercent, PlayerInfo[targetid][pPot], gStealPercent, PlayerInfo[targetid][pCrack], gStealPercent);
                ShowPlayerDialog(playerid, DIALOG_STEAL, DIALOG_STYLE_TABLIST_HEADERS, titles, string2, "Steal", "Cancel");
				ClearAnimations(playerid, 1);
            }
        }

        HideProgress(playerid);

        return 1;
    }
    new random_key = random(6), progress_key_name[2][2] = {"Y", "N"};
    random_position_progress[playerid] = 260 + (random(12) * 10);
    PlayerTextDrawDestroy(playerid, progress_bar_PTD[playerid][2]);
    
    progress_bar_PTD[playerid][2] = CreatePlayerTextDraw(playerid, random_position_progress[playerid], 374.8517, "LD_SPAC:white"); // �����
    PlayerTextDrawTextSize(playerid, progress_bar_PTD[playerid][2], 10.0000, 13.0000);
    PlayerTextDrawAlignment(playerid, progress_bar_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, progress_bar_PTD[playerid][2], -155);
    PlayerTextDrawBackgroundColor(playerid, progress_bar_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, progress_bar_PTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, progress_bar_PTD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, progress_bar_PTD[playerid][2], 0);

    PlayerTextDrawShow(playerid, progress_bar_PTD[playerid][2]);

    switch(random_key) 
    {
        case 0, 2, 4: progress_key[playerid] = 1;
        case 1, 3, 5: progress_key[playerid] = 2;
        default: progress_key[playerid] = 1; 
    }
    new string3[90];
    format(string3, sizeof string3, "Press (%s) on the bar to proceed", progress_key_name[progress_key[playerid] - 1]);
    PlayerTextDrawSetString(playerid, progress_bar_PTD[playerid][1], string3);

    TextDrawSetString(progress_bar_TD[1], title);
    
    return 1;
}
/* -----------------------------------------------------------------------------------------------*/
forward updateProgress(playerid);
public updateProgress(playerid)
{
    if(current_position_progress[playerid] >= 150.0) {
        switch(player_progress_type[playerid])
        {
            case 2:
            {
                new targetid = GetPVarInt(playerid, "IsStealing");
                ClearAnimations(playerid, 1);
                SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "** %s has failed to steal from %s.", GetRPName(playerid), GetRPName(targetid));
                DeletePVar(playerid, "IsStealing");
            }
        }
        TogglePlayerControllable(playerid, true);
        is_progress_show[playerid] = false;
        player_progress_step[playerid] = 0;
        player_progress_type[playerid] = 0;    
        progress_key[playerid] = 0;
        KillTimer(progress_timer[playerid]);
        for(new i; i < sizeof progress_bar_TD; i++) TextDrawHideForPlayer(playerid, progress_bar_TD[i]);
        for(new i; i < 3; i++) PlayerTextDrawHide(playerid, progress_bar_PTD[playerid][i]);

        return 1;
    }
    switch(player_progress_type[playerid])
    {
        case 1:
        {
            current_position_progress[playerid] = current_position_progress[playerid] + 0.5;
            PlayerTextDrawTextSize(playerid, progress_bar_PTD[playerid][0], current_position_progress[playerid], 13.000);
            PlayerTextDrawHide(playerid, progress_bar_PTD[playerid][0]);
            PlayerTextDrawShow(playerid, progress_bar_PTD[playerid][0]);
        }
        case 2:
        {
            current_position_progress[playerid] = current_position_progress[playerid] + 1.5;
            PlayerTextDrawTextSize(playerid, progress_bar_PTD[playerid][0], current_position_progress[playerid], 13.000);
            PlayerTextDrawHide(playerid, progress_bar_PTD[playerid][0]);
            PlayerTextDrawShow(playerid, progress_bar_PTD[playerid][0]);
        }
    }
    return 1;
}
/* -----------------------------------------------------------------------------------------------*/
stock HideProgress(playerid)
{
    for(new i; i < sizeof progress_bar_TD; i++) TextDrawHideForPlayer(playerid, progress_bar_TD[i]);
    for(new i; i < 3; i++) PlayerTextDrawHide(playerid, progress_bar_PTD[playerid][i]);

    TogglePlayerControllable(playerid, true);
    is_progress_show[playerid] = false;
    player_progress_step[playerid] = 0;
    player_progress_type[playerid] = 0;    
    progress_key[playerid] = 0;
    current_position_progress[playerid] = 0.0;
    KillTimer(progress_timer[playerid]); 
    return 1;
}
/* -----------------------------------------------------------------------------------------------*/
/* -----------------------------------------------------------------------------------------------*/
/* -----------------------------------------------------------------------------------------------*/