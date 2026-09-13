CMD:ythelp(playerid, params[])
{
    if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a Influencer role.");
	}
    SendClientMessage(playerid, COLOR_SYNTAX, "Youber: /y, /setmyskin, /spawncar, /ygoto, /ysettime");
    return 1;
}

CMD:setyoutuber(playerid, params[])
{
	new targetid, status;
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	}
	if(sscanf(params, "ui", targetid, status) || !(0 <= status <= 1))
	{
	    SendClientMessage(playerid, COLOR_GREY, "Usage: /setinfluencer [playerid] [status (0/1)]");
		return 1;
	}

    if(status)
    {
        SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has made %s a Influencer.", GetRPName(playerid), GetRPName(targetid));
        Log_Write("log_admin", "%s (uid: %i) has made %s (uid: %i) a Influencer.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);

        SendMessage(playerid, COLOR_LIGHTBLUE, "You have made %s a Influencer.", GetRPName(targetid));
	    SendMessage(targetid, COLOR_LIGHTBLUE, "%s has made you a Influencer.", GetRPName(playerid));
	}
	else
    {
        SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has removed %s's Influencer status.", GetRPName(playerid), GetRPName(targetid));
        Log_Write("log_admin", "%s (uid: %i) has removed %s's (uid: %i) Influencer status.", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);

        SendMessage(playerid, COLOR_LIGHTBLUE, "You have removed %s's Influencer status.", GetRPName(targetid));
	    SendMessage(targetid, COLOR_LIGHTBLUE, "%s has removed your Influencer status.", GetRPName(playerid));
	}
    PlayerInfo[targetid][pYoutuber] = status;

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET youtuber = %i WHERE uid = %i", PlayerInfo[targetid][pYoutuber], PlayerInfo[targetid][pID]);
    mysql_tquery(connectionID, queryBuffer);
	return 1;
}

CMD:y(playerid, params[])
{
	if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a Influencer role.");
	}
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Usage: /(y) [text]");
	}

	foreach(new i : Player)
	{
	    if(PlayerInfo[i][pYoutuber] > 0)
	    {
			SendMessage(i, COLOR_REALRED, "* Influencer %s: %s *", GetRPName(playerid), params);
		}
	}

	return 1;
}

CMD:ysettime(playerid, params[])
{
	new hour;

	if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a influencer role.");
	}
	if(sscanf(params, "i", hour))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /settime [hour]");
	}
	if(!(0 <= hour <= 23))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The hour must range from 0 to 23.");
	}

	gWorldTime = hour;

	SetWorldTime(hour);
	SendMessageToAll(COLOR_GREY2, "Time of day changed to %i hours.", hour);
	return 1;
}

CMD:setmyskin(playerid, params[])
{
    new skinid;
	if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a influencer role.");
	}
	if(sscanf(params, "i", skinid))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Usage: /setmyskin [skinid]");
	}
	if(!(0 <= skinid <= 311))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Invalid skin specified.");
	}

	PlayerInfo[playerid][pSkin] = skinid;

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET skin = %i WHERE uid = %i", skinid, PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);

	SetPlayerSkin(playerid, skinid);
	SendMessage(playerid, COLOR_GREY2, "You set your skin to ID %i.", skinid);
	return 1;
}

CMD:spawncar(playerid, params[])
{
	new model[20], modelid, color1, color2, Float:x, Float:y, Float:z, Float:a, vehicleid;
	if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a Influencer role.");
	}
	if(sscanf(params, "s[20]I(-1)I(-1)", model, color1, color2))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Usage: /veh [modelid/name] [color1 (optional)] [color2 (optional)]");
	}
	if((modelid = GetVehicleModelByName(model)) == 0)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Invalid vehicle model.");
	}
	if(!(-1 <= color1 <= 255) || !(-1 <= color2 <= 255))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Invalid color. Valid colors range from -1 to 255.");
	}

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	vehicleid = AddStaticVehicleEx(modelid, x, y, z, a, color1, color2, -1);

	if(vehicleid == INVALID_PLAYER_ID)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Cannot spawn vehicle. The vehicle pool is currently full.");
	}
	ResetVehicleObjects(vehicleid);
	adminVehicle{vehicleid} = true;
	vehicleFuel[vehicleid] = 100;
	vehicleColors[vehicleid][0] = color1;
	vehicleColors[vehicleid][1] = color2;

	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));

	PutPlayerInVehicle(playerid, vehicleid, 0);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s spawned a %s for content.", GetRPName(playerid), GetVehicleName(vehicleid));
	return 1;
}

CMD:ygoto(playerid, params[])
{
	new targetid;
    if(!PlayerInfo[playerid][pYoutuber])
	{
		return SendClientMessage(playerid, COLOR_GREY, "You can't use this command as you don't have a Influencer role.");
	}
	/*if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 5)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}*/
	if(sscanf(params, "u", targetid))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /goto [playerid/location]");
 		SendClientMessage(playerid, COLOR_WHITE, "Locations: LS, SF, LV, Grove, Idlewood, Unity, Jefferson, Market, Airport, Bank");
 		SendClientMessage(playerid, COLOR_WHITE, "Locations: Dealership, DMV, Casino, Allsaints, Mall, Paintball");
		return 1;
	}

	if(!strcmp(params, "ls", true))
    {
		TeleportToCoords(playerid, 1544.4407, -1675.5522, 13.5584, 90.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Los Santos.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Los Santos.", GetRPName(playerid));
    }
    else if(!strcmp(params, "paintball", true))
    {
        TeleportToCoords(playerid, 2114.292968, -1742.445800, 13.554714, 360.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Paintball.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Paintball.", GetRPName(playerid));
	}
    else if(!strcmp(params, "sf", true))
    {
		TeleportToCoords(playerid, -1421.5629, -288.9972, 14.1484, 135.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to San Fierro.");
        SendAdminMessage(COLOR_RED, "%s has teleported to San Fierro.", GetRPName(playerid));
    }
    else if(!strcmp(params, "lv", true))
    {
		TeleportToCoords(playerid, 1670.6908, 1423.5240, 10.7811, 270.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Las Venturas.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Las Venturas.", GetRPName(playerid));
    }
    else if(!strcmp(params, "grove", true))
    {
		TeleportToCoords(playerid, 2497.8274, -1668.9033, 13.3438, 90.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Grove Street.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Grove Street.", GetRPName(playerid));
    }
    else if(!strcmp(params, "idlewood", true))
    {
		TeleportToCoords(playerid, 2090.0664, -1816.9071, 13.3904, 90.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Idlewood.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Idlewood.", GetRPName(playerid));
    }
    else if(!strcmp(params, "unity", true))
    {
		TeleportToCoords(playerid, 1782.2683, -1865.5726, 13.5725, 0.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Unity Station.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Unity Station.", GetRPName(playerid));
    }
    else if(!strcmp(params, "jefferson", true))
    {
		TeleportToCoords(playerid, 2222.3438, -1164.5013, 25.7331, 0.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Jefferson Motel.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Jefferson Motel.", GetRPName(playerid));
    }
    else if(!strcmp(params, "market", true))
    {
		TeleportToCoords(playerid, 818.1782, -1349.2217, 13.5260, 0.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Market.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Market.", GetRPName(playerid));
    }
    else if(!strcmp(params, "airport", true))
    {
		TeleportToCoords(playerid, 1938.7185, -2370.6375, 13.5469, 0.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to LS airport.");
        SendAdminMessage(COLOR_RED, "%s has teleported to LS Airport.", GetRPName(playerid));
    }
    else if(!strcmp(params, "bank", true))
    {
        TeleportToCoords(playerid, 1463.8929, -1026.6189, 23.8281, 180.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Mulholland bank.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Mulholland Bank.", GetRPName(playerid));
    }
    else if(!strcmp(params, "dealership", true))
    {
		TeleportToCoords(playerid, 595.587158,-1250.354003,18.285120, 180.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Grotti dealership.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Grotti Dealership.", GetRPName(playerid));
    }
	else if(!strcmp(params, "dmv", true))
    {
        TeleportToCoords(playerid, 2489.2214,-1943.3082,13.5144, 180.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to DMV.");
        SendAdminMessage(COLOR_RED, "%s has teleported to DMV.", GetRPName(playerid));
	}
	else if(!strcmp(params, "casino", true))
    {
        TeleportToCoords(playerid, 1310.0944, -1367.9332, 13.5424, 180.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Casino.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Casino.", GetRPName(playerid));
	}
	else if(!strcmp(params, "allsaints", true))
    {
        TeleportToCoords(playerid, 1179.5540,-1323.4713,14.1752, 270.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Allsaints.");
        SendAdminMessage(COLOR_RED, "%s has teleported to All Saints.", GetRPName(playerid));
	}
	else if(!strcmp(params, "mall", true))
    {
        TeleportToCoords(playerid, 1129.6364,-1425.1180,15.7969, 357.0000, 0, 0);
        SendClientMessage(playerid, COLOR_GREY2, "Teleported to Mall.");
        SendAdminMessage(COLOR_RED, "%s has teleported to Mall.", GetRPName(playerid));
	}
	else
	{
		if(!IsPlayerConnected(targetid))
		{
		    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
		}
		if(!IsPlayerSpawned(targetid))
		{
		    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is either not spawned, or spectating.");
		}
		if(PowerSpec[targetid] == 1)
		{
		    return SendClientMessage(playerid, COLOR_SYNTAX, "You cannot Teleport to Alfredo or Elizabeth as they'll be doing their RP.");
		}

		TeleportToPlayer(playerid, targetid);
		SendMessage(playerid, COLOR_GREY2, "Teleported to %s's position.", GetRPName(targetid));
		SendAdminMessage(COLOR_RED, "%s has teleported to %s's position.", GetRPName(playerid), GetRPName(targetid));
	}
	return 1;
}