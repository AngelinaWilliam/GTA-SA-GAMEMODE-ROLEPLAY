/*

	Safezone System (GangZones)
	Developed By: Genjii#4764

*/

#define MAX_SAFEZONE		20
new EnterSafezone[MAX_PLAYERS];

enum E_SAFEZONE_INFO
{
	sExists,
	Float:sMinX,
	Float:sMinY,
	Float:sMaxX,
	Float:sMaxY,
	Float:sHeight,
	sGangZone,
	sArea
};
new SafezoneInfo[MAX_SAFEZONE][E_SAFEZONE_INFO];

IsPlayerInSafezone(playerid)
{
	for(new i = 0; i < MAX_SAFEZONE; i ++)
	{
    	if(SafezoneInfo[i][sExists] && IsPlayerInDynamicArea(playerid, SafezoneInfo[i][sArea]) && GetPlayerInterior(playerid) == 0 && GetPlayerVirtualWorld(playerid) == 0)
    	{
    	    return 1;
    	}
	}
	return 0;
}

ShowSafezoneOnMap(playerid, enable)
{
	for(new i = 0; i < MAX_SAFEZONE; i ++)
	{
	    if(SafezoneInfo[i][sExists])
	    {
		    if(enable)
			{
			    GangZoneShowForPlayer(playerid, SafezoneInfo[i][sGangZone], 0x33CC33AA);
			}
			else
			{
		    	GangZoneHideForPlayer(playerid, SafezoneInfo[i][sGangZone]);
			}
		}
	}
	PlayerInfo[playerid][pShowSafezone] = enable;
}

ReloadSafezone(safezoneid)
{
    if(SafezoneInfo[safezoneid][sExists])
    {
        if(IsValidDynamicArea(SafezoneInfo[safezoneid][sArea]))
			DestroyDynamicArea(SafezoneInfo[safezoneid][sArea]);

		if(!(SafezoneInfo[safezoneid][sMinX] == 0.0 && SafezoneInfo[safezoneid][sMinY] == 0.0))
		{
			SafezoneInfo[safezoneid][sArea] = CreateDynamicRectangle(SafezoneInfo[safezoneid][sMinX], SafezoneInfo[safezoneid][sMinY], SafezoneInfo[safezoneid][sMaxX], SafezoneInfo[safezoneid][sMaxY]);
			SafezoneInfo[safezoneid][sGangZone] = GangZoneCreateEx(SafezoneInfo[safezoneid][sMinX], SafezoneInfo[safezoneid][sMinY], SafezoneInfo[safezoneid][sMaxX], SafezoneInfo[safezoneid][sMaxY]);
		}
        foreach(new i : Player)
        {
            if(PlayerInfo[i][pShowSafezone])
            {
                ShowSafezoneOnMap(i, true);
            }
        }
    }
}

forward OnAdminCreateSafezone(playerid, safezoneid, Float:minx, Float:miny, Float:maxx, Float:maxy, Float:height);
public OnAdminCreateSafezone(playerid, safezoneid, Float:minx, Float:miny, Float:maxx, Float:maxy, Float:height)
{
    SafezoneInfo[safezoneid][sExists] = 1;
	SafezoneInfo[safezoneid][sMinX] = minx;
	SafezoneInfo[safezoneid][sMinY] = miny;
	SafezoneInfo[safezoneid][sMaxX] = maxx;
	SafezoneInfo[safezoneid][sMaxY] = maxy;
	SafezoneInfo[safezoneid][sHeight] = height;
	SafezoneInfo[safezoneid][sGangZone] = -1;
	SafezoneInfo[safezoneid][sArea] = -1;

	ReloadSafezone(safezoneid);
	SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has created safezone area [ID: %i]", GetRPName(playerid), safezoneid);
}

forward LoadDynamicSafezone();
public LoadDynamicSafezone()
{
	new rows = cache_num_rows();
	if(rows) 
	{
		for(new i; i < rows; i++) 
		{
			new safezoneid = cache_get_field_content_int(i, "id");
            SafezoneInfo[safezoneid][sMinX] = cache_get_field_content_float(i, "min_x");
            SafezoneInfo[safezoneid][sMinY] = cache_get_field_content_float(i, "min_y");
            SafezoneInfo[safezoneid][sMaxX] = cache_get_field_content_float(i, "max_x");
            SafezoneInfo[safezoneid][sMaxY] = cache_get_field_content_float(i, "max_y");
            SafezoneInfo[safezoneid][sHeight] = cache_get_field_content_float(i, "height");
            SafezoneInfo[safezoneid][sGangZone] = -1;
            SafezoneInfo[safezoneid][sArea] = -1;
            SafezoneInfo[safezoneid][sExists] = 1;
            ReloadSafezone(safezoneid);
		}
	}
	printf("[MySQL] %i safezone loaded.", rows);
	return 1;
}

stock OnPlayerEnterGZ(playerid, areaid)
{
    for(new i = 0; i < MAX_SAFEZONE; i++)
    {
    	if(areaid == SafezoneInfo[i][sArea])
    	{
			ShowGlobalTextdraw(playerid, "You just entered to ~g~Greenzone Area.", 5000);
			EnterSafezone[playerid] = 1;
		}
	}
    return 1;
}

stock OnPlayerLeaveGZ(playerid, areaid)
{
    for(new i = 0; i < MAX_SAFEZONE; i++)
    {
    	if(areaid == SafezoneInfo[i][sArea])
    	{
			ShowGlobalTextdraw(playerid, "You just left to ~g~Greenzone Area.", 5000);
			EnterSafezone[playerid] = 0;
		}
	}
    return 1;
}

forward OnPlayerDamageInsideGZ(playerid);
public OnPlayerDamageInsideGZ(playerid)
{
    TogglePlayerControllable(playerid, true);
}

public OnPlayerConnect(playerid)
{
    EnterSafezone[playerid] = 0;
    #if defined Sz_OnPlayerConnect
		return Sz_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Sz_OnPlayerConnect
#if defined Sz_OnPlayerConnect
	forward Sz_OnPlayerConnect(playerid);
#endif

CMD:createsz(playerid, params[])
{
	if(GetPlayerInterior(playerid) > 0 || GetPlayerVirtualWorld(playerid) > 0)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You cannot create turfs indoors.");
	}
	PlayerInfo[playerid][pZoneType] = ZONETYPE_SAFEZONE;
	ShowPlayerDialog(playerid, DIALOG_CREATEZONE, DIALOG_STYLE_MSGBOX, "Safezones creation system", "You have entered safezones creation mode. In order to create a turf you need\nto mark four points around the area you want your turf to be in, forming\na square. You must make a square or your outcome won't be as expected.\n\nPress "SVRCLR"Confirm{A9C4E4} to begin safezones creation.", "Confirm", "Cancel");
	return 1;
}

CMD:cancelsz(playerid, params[])
{
	if(PlayerInfo[playerid][pZoneCreation] != ZONETYPE_SAFEZONE)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not creating a safezones at the moment.");
	}
	CancelZoneCreation(playerid);
	SendClientMessage(playerid, COLOR_LIGHTRED, "** Safezones creation cancelled.");
	return 1;
}

CMD:removesz(playerid, params[])
{
	new safezoneid;
	if(sscanf(params, "i", safezoneid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /removesz [safezoneid]");
	}
	if(!(0 <= safezoneid < MAX_SAFEZONE) || !SafezoneInfo[safezoneid][sExists])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid safezone.");
	}

	GangZoneDestroy(SafezoneInfo[safezoneid][sGangZone]);
	DestroyDynamicArea(SafezoneInfo[safezoneid][sArea]);

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM safezones WHERE id = %i", safezoneid);
	mysql_tquery(connectionID, queryBuffer);

	SafezoneInfo[safezoneid][sExists] = 0;

    SendMessage(playerid, COLOR_WHITE, "** You have removed safezone %i.", safezoneid);
	return 1;
}

CMD:showsafezone(playerid, params[])
{
	if(!PlayerInfo[playerid][pShowSafezone])
	{
		ShowSafezoneOnMap(playerid, true);
		SendClientMessage(playerid, COLOR_WHITE, "You will now see safezones on your mini-map.");
	}
	else
	{
		ShowSafezoneOnMap(playerid, false);
		SendClientMessage(playerid, COLOR_WHITE, "You will now see safezones on your mini-map.");
	}
	return 1;
}