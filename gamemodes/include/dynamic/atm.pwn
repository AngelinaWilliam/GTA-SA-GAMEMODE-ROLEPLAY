#define	MAX_ATM      100

enum atmData
{
	atmID,
	atmExists,
	atmModel,
	Float:atmPosX,
	Float:atmPosY,
	Float:atmPosZ,
	Float:atmPosA,
	atmInterior,
	atmWorld,
	atmObject,
	Text3D: atmTextId
};
new atmInfo[MAX_ATM][atmData];


forward OnAtmCreated(i);
public OnAtmCreated(i)
{
	if (i == -1 || !atmInfo[i][atmExists])
	    return 0;

	atmInfo[i][atmID] = cache_insert_id(connectionID);
	Atm_Save(i);

	return 1;
}

stock IsAtAtm(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		for(new x; x < MAX_ATM; x++)
		{
			if(atmInfo[x][atmPosX] != 0)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, atmInfo[x][atmPosX], atmInfo[x][atmPosY], atmInfo[x][atmPosZ]) && GetPlayerInterior(playerid) == atmInfo[x][atmInterior] && GetPlayerVirtualWorld(playerid) == atmInfo[x][atmWorld]) return 1;
			}
		}
	}
	return -1;
}

stock Atm_Create(playerid)
{
	new
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	if (GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
	{
		for (new i = 0; i < MAX_ATM; i ++) if (!atmInfo[i][atmExists])
		{
		    atmInfo[i][atmExists] = true;
			atmInfo[i][atmModel] = 19324;

			atmInfo[i][atmPosX] = x;
			atmInfo[i][atmPosY] = y;
			atmInfo[i][atmPosZ] = z - 0.10;
			atmInfo[i][atmPosA] = angle;

            atmInfo[i][atmInterior] = GetPlayerInterior(playerid);
            atmInfo[i][atmWorld] = GetPlayerVirtualWorld(playerid);

            new string[128];
		    format(string,sizeof(string),"ATM Machine (ID: %d)\nType /awithdraw to withdraw and deposit cash", i);
		    atmInfo[i][atmTextId] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, atmInfo[i][atmPosX], atmInfo[i][atmPosY], atmInfo[i][atmPosZ] + 0.4, 10.0, .worldid = atmInfo[i][atmWorld], .testlos = 0, .streamdistance = 25.0);
		    atmInfo[i][atmObject] = CreateDynamicObject(atmInfo[i][atmModel], atmInfo[i][atmPosX], atmInfo[i][atmPosY], atmInfo[i][atmPosZ], 0.0, 0.0, atmInfo[i][atmPosA], atmInfo[i][atmWorld], atmInfo[i][atmInterior], .streamdistance = 100.0);
			mysql_tquery(connectionID, "INSERT INTO `atm` (`atmModel`) VALUES(1340)", "OnAtmCreated", "d", i);
			Streamer_UpdateEx(playerid, atmInfo[i][atmPosX], atmInfo[i][atmPosY], atmInfo[i][atmPosZ]);
			RenderAtm(i);
			return i;
		}
	}
	return -1;
}

stock RenderAtm(id)
{
	DestroyDynamicObject(atmInfo[id][atmObject]);
	DestroyDynamic3DTextLabel(atmInfo[id][atmTextId]);
	if(atmInfo[id][atmPosX] != 0.0)
	{
		new string[128];
		format(string,sizeof(string),"ATM Machine (ID: %d)\nType /awithdraw to withdraw and deposit cash", id);
		atmInfo[id][atmTextId] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, atmInfo[id][atmPosX], atmInfo[id][atmPosY], atmInfo[id][atmPosZ] + 0.4, 10.0, .worldid = atmInfo[id][atmWorld], .testlos = 0, .streamdistance = 25.0);
		atmInfo[id][atmObject] = CreateDynamicObject(atmInfo[id][atmModel], atmInfo[id][atmPosX], atmInfo[id][atmPosY], atmInfo[id][atmPosZ], 0.0, 0.0, atmInfo[id][atmPosA], atmInfo[id][atmWorld], atmInfo[id][atmInterior], .streamdistance = 100.0);
	}
	return 1;
}

stock Atm_Delete(atmid)
{
	if (atmid != -1 && atmInfo[atmid][atmExists])
	{
		new query[64];

		format(query, sizeof(query), "DELETE FROM `atm` WHERE `atmID` = '%d'", atmInfo[atmid][atmID]);
		mysql_tquery(connectionID, query);

		if (IsValidDynamicObject(atmInfo[atmid][atmObject]))
		    DestroyDynamicObject(atmInfo[atmid][atmObject]);
		DestroyDynamic3DTextLabel(atmInfo[atmid][atmTextId]);
		for (new i = 0; i != MAX_ATM; i ++) if (atmInfo[i][atmExists] && atmInfo[atmid][atmID]) {
		    Atm_Save(i);
		}
	    atmInfo[atmid][atmExists] = false;
	    atmInfo[atmid][atmID] = 0;
	}
	return 1;
}


stock Atm_Save(atmid)
{
	new
	    query[768];

	format(query, sizeof(query), "UPDATE `atm` SET `atmModel` = '%d', `atmPosX` = '%f', `atmPosY` = '%f', `atmPosZ` = '%f', `atmInterior` = '%d', `atmWorld` = '%d', `atmPosA` = '%f' WHERE `atmID` = '%d'",
	    atmInfo[atmid][atmModel],
	    atmInfo[atmid][atmPosX],
	    atmInfo[atmid][atmPosY],
	    atmInfo[atmid][atmPosZ],
	    atmInfo[atmid][atmInterior],
	    atmInfo[atmid][atmWorld],
	    atmInfo[atmid][atmPosA],
	    atmInfo[atmid][atmID]
	);
	return mysql_tquery(connectionID, query);
}

forward Atm_Load();
public Atm_Load()
{
    static
	    rows,
	    fields;

	cache_get_data(rows, fields, connectionID);

	for (new i = 0; i < rows; i ++) if (i < MAX_ATM)
	{
	    atmInfo[i][atmExists] = true;

	    atmInfo[i][atmID] = cache_get_field_content_int(i, "atmID");
	    atmInfo[i][atmModel] = cache_get_field_content_int(i, "atmModel");
	    atmInfo[i][atmInterior] = cache_get_field_content_int(i, "atmInterior");
	    atmInfo[i][atmWorld] = cache_get_field_content_int(i, "atmWorld");
	    atmInfo[i][atmPosA] = cache_get_field_content_int(i, "atmPosA");

	    atmInfo[i][atmPosX] = cache_get_field_content_float(i, "atmPosX");
	    atmInfo[i][atmPosY] = cache_get_field_content_float(i, "atmPosY");
	    atmInfo[i][atmPosZ] = cache_get_field_content_float(i, "atmPosZ");

	    new string[128];
	    format(string,sizeof(string),"ATM Machine (ID: %d)\nType /awithdraw to withdraw and deposit cash", i);
	    atmInfo[i][atmTextId] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, atmInfo[i][atmPosX], atmInfo[i][atmPosY], atmInfo[i][atmPosZ] + 0.3, 10.0, .worldid = atmInfo[i][atmWorld], .testlos = 0, .streamdistance = 25.0);
	    atmInfo[i][atmObject] = CreateDynamicObject(atmInfo[i][atmModel], atmInfo[i][atmPosX], atmInfo[i][atmPosY], atmInfo[i][atmPosZ], 0.0, 0.0, atmInfo[i][atmPosA], atmInfo[i][atmWorld], atmInfo[i][atmInterior], .streamdistance = 100.0);
	    RenderAtm(i);
	}
	printf("[Script] %i atm machine loaded", rows);
	return 1;
}


CMD:createatm(playerid, params[])
{
	static
	    id = -1;

	if(PlayerInfo[playerid][pAdmin] < 7)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

	id = Atm_Create(playerid);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The server has reached the limit for gates.");

	SM(playerid, COLOR_WHITE, "You have successfully created atm stall ID: %d.", id);
	return 1;
}

CMD:removeatm(playerid, params[])
{
	static
	    id = 0;

	if(PlayerInfo[playerid][pAdmin] < 6)
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "Usage: /removeatm [stall id]");

	if ((id < 0 || id >= MAX_ATM) || !atmInfo[id][atmExists])
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You have specified an invalid atm stall ID.");

	Atm_Delete(id);
	SM(playerid, COLOR_WHITE, "You have successfully removed atm stall ID: %d.", id);
	return 1;
}