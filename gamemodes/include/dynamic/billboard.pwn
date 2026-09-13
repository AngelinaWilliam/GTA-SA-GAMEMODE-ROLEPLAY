#define MAX_BILLBOARDS      100
#define	MAX_ZONE_NAME       28
#define DIALOG_CONFIRM_SYS  7020

enum dyBollard
{
	bbObject,

    bbID,
    bbText[100],
    bbRentBy,
    bbRentDate,
    bbRentCost,
	Float: bbPosX,
	Float: bbPosY,
	Float: bbPosZ,
	Float: bbPosRX,
	Float: bbPosRY,
	Float: bbPosRZ,
	bbInt,
	bbVW,
	bbModel,
	bool:bbActive
}
new BillboardInfo[MAX_BILLBOARDS][dyBollard];

forward OnBillboardsLoad();
public OnBillboardsLoad()
{
	new rows = cache_num_rows();
	for(new i; i < rows; i++)
    {
        BillboardInfo[i][bbActive] = true;

        BillboardInfo[i][bbID] = cache_get_field_content_int(i, "id", connectionID);
		cache_get_field_content(i, "text", BillboardInfo[i][bbText], connectionID, 100);
		BillboardInfo[i][bbRentBy] = cache_get_field_content_int(i, "rentby", connectionID);
		BillboardInfo[i][bbRentDate] = cache_get_field_content_int(i, "rentdate", connectionID);
		BillboardInfo[i][bbRentCost] = cache_get_field_content_int(i, "cost", connectionID);
        BillboardInfo[i][bbPosX] = cache_get_field_content_float(i, "posX", connectionID);
        BillboardInfo[i][bbPosY] = cache_get_field_content_float(i, "posY", connectionID);
        BillboardInfo[i][bbPosZ] = cache_get_field_content_float(i, "posZ", connectionID);
        BillboardInfo[i][bbPosRX] = cache_get_field_content_float(i, "posRX", connectionID);
        BillboardInfo[i][bbPosRY] = cache_get_field_content_float(i, "posRY", connectionID);
        BillboardInfo[i][bbPosRZ] = cache_get_field_content_float(i, "posRZ", connectionID);
        BillboardInfo[i][bbInt] = cache_get_field_content_int(i, "int", connectionID);
        BillboardInfo[i][bbVW] = cache_get_field_content_int(i, "vw", connectionID);
        BillboardInfo[i][bbModel] = cache_get_field_content_int(i, "model", connectionID);

        BillboardInfo[i][bbObject] = CreateDynamicObject(BillboardInfo[i][bbModel], BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ], BillboardInfo[i][bbPosRX], BillboardInfo[i][bbPosRY], BillboardInfo[i][bbPosRZ], BillboardInfo[i][bbInt], BillboardInfo[i][bbVW]);

		SetDynamicObjectMaterial(BillboardInfo[i][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
		SetDynamicObjectMaterialText(BillboardInfo[i][bbObject], 0, BillboardInfo[i][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	}

    printf("[MySQL] %i billboard loaded.", rows);
    return 1;
}

stock ConfirmDialog(playerid, caption[], info[], callback[], ...)
{
	new n = numargs(), 		// number of arguments, static + optional
		szParamHash[64];	// variable where the passed arguments will be stored
	for(new arg = 4; arg < n; arg++){	// loop all additional arguments
		format(szParamHash, sizeof(szParamHash), "%s%d|", szParamHash, getarg(arg)); // store them in szParamHash
	}
	SetPVarInt(playerid, "confDialogArgs", n -4);			// store the amount of additional arguments
	SetPVarString(playerid, "confDialCallback", callback);	// store the callback that needs to be called after response
	SetPVarString(playerid, "confDialog_arg", szParamHash);	// store the additional arguments

	ShowPlayerDialog(playerid, DIALOG_CONFIRM_SYS, DIALOG_STYLE_MSGBOX, caption, info, ">>>", "Cancel"); // display the dialog message itself

	return 1;
}

stock TextTab(text[], minlen = 32, maxlen = 40, cellphone = 1, n = 1)
{
    new string[256],
		temporystring[256]
	;

	format(temporystring, sizeof(temporystring), "%s", text);

	if (n) if (strfind(temporystring, "\n", true) != -1)	return temporystring;
	else
	{
		new pos = strfind(temporystring, "\n", true);
		format(string, sizeof(string), "%.*s", string, pos+1, temporystring);
		strdel(temporystring, 0, pos+1);

	}
	for(new i = 0; i < floatround(strlen(text)/maxlen, floatround_floor); i++)
	{
		new pos = maxlen;
		while(temporystring[--pos] != ' ') {}

		if (pos < minlen)
		{
			pos = maxlen;
			if (temporystring[pos] == ' ')
			{
				format(string, sizeof(string), "%s%.*s", string, pos, temporystring);
				format(temporystring, 256, "%s",temporystring[pos+1]);
			} else {
				format(string, sizeof(string), "%s%.*s-", string, pos, temporystring);
				format(temporystring, 256, "%s",temporystring[pos]);
			}
		}
		else
		{
			format(string, sizeof(string), "%s%.*s", string, pos, temporystring);
			format(temporystring, 256, "%s",temporystring[pos+1]);
		}

		if (i+1 <= floatround(strlen(text)/maxlen, floatround_floor))
		{
			if (cellphone)	format(string, sizeof(string), "%s\n", string);
			else			format(string, sizeof(string), "%s~n~", string);
		}
	}

	format(string, sizeof(string), "%s%s", string, temporystring);
	return string;
}

GetZone(Float:x, Float:y, zone[], len)
{
	for(new i = 0; i != sizeof(gSAZones); i++)
	{
		if (x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4]) return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
	}
	return format(zone, len, "Unknown");
}

CheckDialogString(string[])
{
    if (strfind(string, "\n", true) != -1)  return 1;

    return 0;
}

CompareStrings(string[], string2[])
{
	return (!strcmp(string, string2, true))?(1):(0);
}

stock Save_BB(i)
{
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer),
        "UPDATE `billboards` SET `text`='%e',`rentby`=%i,`cost`=%i,`rentdate`=%i,`posX`=%f,`posY`=%f,`posZ`=%f,`posRX`=%f,`posRY`=%f,`posRZ`=%f,`model`=%i,`int`=%i,`vw`=%i WHERE `id`=%i",
        BillboardInfo[i][bbText], BillboardInfo[i][bbRentBy], BillboardInfo[i][bbRentCost], BillboardInfo[i][bbRentDate],
		BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ],
        BillboardInfo[i][bbPosRX], BillboardInfo[i][bbPosRY], BillboardInfo[i][bbPosRZ],
        BillboardInfo[i][bbModel], BillboardInfo[i][bbInt], BillboardInfo[i][bbVW], BillboardInfo[i][bbID]
    );
	return mysql_tquery(connectionID, queryBuffer);
}

forward GetIDforBillboard(i);
public GetIDforBillboard(i)
{
	BillboardInfo[i][bbID] = cache_insert_id();
	return 1;
}

stock DeleteBillBoard(bbid)
{
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM `billboards` WHERE `ID` = %d", BillboardInfo[bbid][bbID]);
	mysql_tquery(connectionID, queryBuffer);

	DestroyDynamicObject(BillboardInfo[bbid][bbObject]);

    BillboardInfo[bbid][bbID] = 0;
	BillboardInfo[bbid][bbText] = EOS;
	BillboardInfo[bbid][bbRentDate] = 0;
	BillboardInfo[bbid][bbRentBy] = 0;
    BillboardInfo[bbid][bbPosX] = 0.0;
    BillboardInfo[bbid][bbPosY] = 0.0;
    BillboardInfo[bbid][bbPosZ] = 0.0;
    BillboardInfo[bbid][bbPosRX] = 0.0;
    BillboardInfo[bbid][bbPosRY] = 0.0;
    BillboardInfo[bbid][bbPosRZ] = 0.0;
    BillboardInfo[bbid][bbInt] = 0;
    BillboardInfo[bbid][bbVW] = 0;
    BillboardInfo[bbid][bbActive] = false;
	return 1;
}

stock IsAtBillBoard(playerid)
{
	for(new i = 0; i < MAX_BILLBOARDS; i++)
	{
	    if (BillboardInfo[i][bbActive] != true) continue;
	    if (IsPlayerInRangeOfPoint(playerid, 5.0, BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ])) return 1;
	}
	return 0;
}

stock GetPlayerDistanceToPointEx(playerid,Float:sx,Float:sy,Float:sz) //By Sacky
{
	new Float:x1,Float:y1,Float:z1;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(sx,x1)),2)+floatpower(floatabs(floatsub(sy,y1)),2)+floatpower(floatabs(floatsub(sz,z1)),2));
	return floatround(tmpdis);
}

stock GetClosestBillBoard(playerid, Float:radius = 9999.0)
{
	new cl_ID = -1, Float:cl_DIST = radius;
	for(new i = 0; i < MAX_BILLBOARDS; i++)
	{
	    if (BillboardInfo[i][bbActive] != true) continue;
		if ( GetPlayerDistanceToPointEx(playerid, BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ]) < cl_DIST )
		{
		    cl_ID = i;
		    cl_DIST = GetPlayerDistanceToPointEx(playerid, BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ]);
		}
	}
	return cl_ID;
}

stock GetUnusedBillBoard()
{
	for(new i = 0; i < MAX_BILLBOARDS; i++)
	{
	    if (BillboardInfo[i][bbActive] != true) return i;
	}
	return -1;
}

stock MyBillBoard_Unrent(playerid, response)
{
	if (!response)
	{
		return DeletePVar(playerid, #BB_SELECT_ID);
	}

	BillBoard_Unrent(GetPVarInt(playerid, #BB_SELECT_ID));
	DeletePVar(playerid, #BB_SELECT_ID);
	return 1;
}

BillBoard_Unrent(i)
{
	if (IsValidDynamicObject(BillboardInfo[i][bbObject])) DestroyDynamicObject(BillboardInfo[i][bbObject]);
	BillboardInfo[i][bbObject] = CreateDynamicObject(BillboardInfo[i][bbModel], BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ], BillboardInfo[i][bbPosRX], BillboardInfo[i][bbPosRY], BillboardInfo[i][bbPosRZ], BillboardInfo[i][bbInt], BillboardInfo[i][bbVW]);

	BillboardInfo[i][bbRentDate] = 0;
	BillboardInfo[i][bbRentBy] = 0;
	format(BillboardInfo[i][bbText], 100, "ADVERTISE HERE!\nBILLBOARD #%i\n{595959}Ph. 1-800-555", i+1);

	Save_BB(i);

	SetDynamicObjectMaterial(BillboardInfo[i][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
	SetDynamicObjectMaterialText(BillboardInfo[i][bbObject], 0, BillboardInfo[i][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

	return 1;
}

BB_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
	GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

	if (GetPVarInt(playerid, "BB:Edit") && response == EDIT_RESPONSE_FINAL)
	{
		new i = GetPVarInt(playerid, "BB:Edit")-1;

		BillboardInfo[i][bbPosX] = x;
		BillboardInfo[i][bbPosY] = y;
		BillboardInfo[i][bbPosZ] = z;
		BillboardInfo[i][bbPosRX] = rx;
		BillboardInfo[i][bbPosRY] = ry;
		BillboardInfo[i][bbPosRZ] = rz;
		BillboardInfo[i][bbInt] = GetPlayerInterior(playerid);
		BillboardInfo[i][bbVW] = GetPlayerVirtualWorld(playerid);

        Save_BB(i);
		DeletePVar(playerid, "BB:Edit");

		if (IsValidDynamicObject(BillboardInfo[i][bbObject])) DestroyDynamicObject(BillboardInfo[i][bbObject]);
		BillboardInfo[i][bbObject] = CreateDynamicObject(BillboardInfo[i][bbModel], BillboardInfo[i][bbPosX], BillboardInfo[i][bbPosY], BillboardInfo[i][bbPosZ], BillboardInfo[i][bbPosRX], BillboardInfo[i][bbPosRY], BillboardInfo[i][bbPosRZ], BillboardInfo[i][bbInt], BillboardInfo[i][bbVW]);

		SetDynamicObjectMaterial(BillboardInfo[i][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
		SetDynamicObjectMaterialText(BillboardInfo[i][bbObject], 0, BillboardInfo[i][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		return 1;
	}
	if (GetPVarInt(playerid, "BB:Edit") &&  response == EDIT_RESPONSE_CANCEL)
	{
		SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
		SetDynamicObjectPos(objectid, oldRotX, oldRotY, oldRotZ);
		DeletePVar(playerid, "BB:Edit");
	}
	return 1;
}

CheckBillBoard()
{
	new time = gettime();

	for(new i = 0; i < MAX_BILLBOARDS; i++)
	{
	    if (!BillboardInfo[i][bbActive] || !BillboardInfo[i][bbRentBy]) continue;
		if (BillboardInfo[i][bbRentDate] < time) BillBoard_Unrent(i);
	}

	return 1;
}

CMD:abillboard(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}

	new option[16], secoption[128];

	if (sscanf(params, "s[16]S()[7]", option, secoption))
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "/abillboard [create/delete/edit/goto]");
	}

	if (CompareStrings(option, "create"))
	{
        new bb = GetUnusedBillBoard();
	    if (bb == -1)
	    {
	    	return SendClientMessage(playerid, COLOR_SYNTAX, "Billboards limit exceeded!");
	    }

		if (strval(secoption) <= 0)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "/abb create [price]");
		}

		SetPVarInt(playerid, #BB_COST, strval(secoption));
		ShowPlayerDialog(playerid, BillboardCreate, DIALOG_STYLE_LIST, "Choose your billboard model", "Small\nMedium", "Select", "Cancel");
	}
	if (CompareStrings(option, "remove"))
	{
		new id;
		if (sscanf(secoption, "I(-1)", id))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "/abb remove {c7c7c7}[ID billboard]");
		}

		if (id == -1)
		{
			if ((id = GetClosestBillBoard(playerid, 15.0)) == -1)
			{
				return SendClientMessage(playerid, COLOR_SYNTAX, "There is no billboard next to you!");
			}
		}

		if (id >= MAX_BILLBOARDS || id < 0)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}
		if (!BillboardInfo[id][bbActive])
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}

		SM(playerid, COLOR_SYNTAX, "You have successfully removed the billboard #%i!", id+1);
		DeleteBillBoard(id);
	}
	if (CompareStrings(option, "edit"))
	{
		new id;
		if (sscanf(secoption, "I(-1)", id))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "/abb edit {c7c7c7}[ID billboard]");
		}

		if (id == -1)
		{
			if ((id = GetClosestBillBoard(playerid, 15.0)) == -1)
			{
				return SendClientMessage(playerid, COLOR_SYNTAX, "There is no billboard next to you!");
			}
		}

		if (id >= MAX_BILLBOARDS || id < 0)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}
		if (!BillboardInfo[id][bbActive])
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}

		SetPVarInt(playerid, "BB:Edit", id+1);
		EditDynamicObject(playerid, BillboardInfo[id][bbObject]);
	}
	if (CompareStrings(option, "goto"))
	{
		new id;
		if (sscanf(secoption, "i", id))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "/abb goto {c7c7c7}[ID billboard]");
		}

		if (id >= MAX_BILLBOARDS || id < 0)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}
		if (!BillboardInfo[id][bbActive])
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Invalid ID.");
		}

		SetPlayerPos(playerid, BillboardInfo[id][bbPosX], BillboardInfo[id][bbPosY], BillboardInfo[id][bbPosZ]);
		SetPlayerInterior(playerid, BillboardInfo[id][bbInt]);
		SetPlayerVirtualWorld(playerid, BillboardInfo[id][bbVW]);
	}
	else SendClientMessage(playerid, COLOR_SYNTAX, "/abillboard [create/remove/edit/goto]");
	return 1;
}

// PLAYER COMANDS
CMD:rentbillboard(playerid , params[])
{
	new str[128], mes[(13+MAX_ZONE_NAME+128)*MAX_BILLBOARDS+27] = "Location\tName\tStatus\n";

	new count;
	for(new i; i < MAX_BILLBOARDS; i++) if (BillboardInfo[i][bbRentBy] == PlayerInfo[playerid][pID]) count++;
	if (count >= 3)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You have already rented the maximum number of billboards! /mybb - for management.");
	}

	new location[MAX_ZONE_NAME];
	count = 0;

	for(new i; i < MAX_BILLBOARDS; i++)
	{
		if (!BillboardInfo[i][bbActive]) continue;
		GetZone(BillboardInfo[i][bbPosX],BillboardInfo[i][bbPosY], location, MAX_ZONE_NAME);

		if (!BillboardInfo[i][bbRentDate])
		{
			format(str, sizeof(str), "%s\tBillboard #%i\t{16b819}Free{FFFFFF}", location, i+1);
		}
		else
		{
			format(str, sizeof(str), "%s\tBillboard #%i\t{FF6347}Rented by %s to %s{FFFFFF}", location, i+1, BillboardInfo[i][bbRentBy], formatdate(BillboardInfo[i][bbRentDate], 4));
		}

		format(mes, sizeof(mes), "%s\n%s", mes, str);
		count++;
	}

	if (!count)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "There are no billboards on the server!");
	}

	ShowPlayerDialog(playerid, BillboardList, DIALOG_STYLE_TABLIST_HEADERS, "Billboard rental", mes, "Rent", "Cancel");
	return 1;
}

CMD:mybillboards(playerid , params[])
{
	new count, str[90], mes[(60+MAX_ZONE_NAME+13)*3+27] = "Location\tName\tStatus\n", location[MAX_ZONE_NAME];

	for(new i; i < MAX_BILLBOARDS; i++)
	{
		if (BillboardInfo[i][bbRentBy] == PlayerInfo[playerid][pID])
		{
			GetZone(BillboardInfo[i][bbPosX],BillboardInfo[i][bbPosY], location, MAX_ZONE_NAME);
			format(str, sizeof(str), "%s\tBillboard #%i\tRent to %s{FFFFFF}", location, i+1, formatdate(BillboardInfo[i][bbRentDate], 4));

			format(mes, sizeof(mes), "%s\n%s", mes, str);
			count++;

			if (count == 3) break;
		}
	}

	if (!count)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You have no rented billboards!");
	}

	ShowPlayerDialog(playerid, MyBillboards, DIALOG_STYLE_TABLIST_HEADERS, "Your billboards", mes, "Remove", "Cancel");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == BillboardCreate)
	{
		if (response)
        {
        	if(listitem == 0)
        	{
        		if (GetUnusedBillBoard() == -1) return SCM(playerid, COLOR_SYNTAX, "Billboards limit exceeded!");

				new Float:X, Float:Y, Float:Z;
		        GetPlayerPos(playerid, X, Y, Z);
		        /*new modelid;
		        modelid = 7302;
		        CreateBillBoard(playerid, X, Y, Z, 0.0, 0.0, 0.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), modelid, GetPVarInt(playerid, #BB_COST));*/
		        new bbid = GetUnusedBillBoard();

			    BillboardInfo[bbid][bbPosX] = X;
			    BillboardInfo[bbid][bbPosY] = Y;
			    BillboardInfo[bbid][bbPosZ] = Z;
			    BillboardInfo[bbid][bbPosRX] = 0.0;
			    BillboardInfo[bbid][bbPosRY] = 0.0;
			    BillboardInfo[bbid][bbPosRZ] = 0.0;
			    BillboardInfo[bbid][bbInt] = GetPlayerInterior(playerid);
			    BillboardInfo[bbid][bbVW] = GetPlayerVirtualWorld(playerid);
			    BillboardInfo[bbid][bbActive] = true;

				BillboardInfo[bbid][bbRentCost] = GetPVarInt(playerid, #BB_COST);
				BillboardInfo[bbid][bbModel] = 7302;

			    BillboardInfo[bbid][bbObject] = CreateDynamicObject(BillboardInfo[bbid][bbModel], BillboardInfo[bbid][bbPosX], BillboardInfo[bbid][bbPosY], BillboardInfo[bbid][bbPosZ], BillboardInfo[bbid][bbPosRX], BillboardInfo[bbid][bbPosRY], BillboardInfo[bbid][bbPosRZ], BillboardInfo[bbid][bbInt], BillboardInfo[bbid][bbVW]);

				format(BillboardInfo[bbid][bbText], 100, "ADVERTISE HERE!\nBILLBOARD #%i\n{595959}Ph. 1-800-555", bbid+1);

				SetDynamicObjectMaterial(BillboardInfo[bbid][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
				SetDynamicObjectMaterialText(BillboardInfo[bbid][bbObject], 0, BillboardInfo[bbid][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

				mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO `billboards` (`posX`,`posY`,`posZ`,`posRX`,`posRY`,`posRZ`,`int`,`vw`,`model`,`cost`,`text`) VALUES (%f,%f,%f,%f,%f,%f,%d,%d,%d,%i,'%e')", X, Y, Z, BillboardInfo[bbid][bbPosRX], BillboardInfo[bbid][bbPosRY], BillboardInfo[bbid][bbPosRZ], BillboardInfo[bbid][bbInt], BillboardInfo[bbid][bbVW], BillboardInfo[bbid][bbModel], GetPVarInt(playerid, #BB_COST), BillboardInfo[bbid][bbText]);
				mysql_tquery(connectionID, queryBuffer, "GetIDforBillboard", "d", bbid);

				SM(playerid, COLOR_SYNTAX, "You have created a billboard #%i / price - $%i / model - %i", bbid+1, GetPVarInt(playerid, #BB_COST), BillboardInfo[bbid][bbModel]);
				DeletePVar(playerid, #BB_COST);
        	}
			if(listitem == 1)
        	{
        		if (GetUnusedBillBoard() == -1) return SCM(playerid, COLOR_SYNTAX, "Billboards limit exceeded!");

				new Float:X, Float:Y, Float:Z;
		        GetPlayerPos(playerid, X, Y, Z);
		        /*new modelid;
		        modelid = 7302;
		        CreateBillBoard(playerid, X, Y, Z, 0.0, 0.0, 0.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), modelid, GetPVarInt(playerid, #BB_COST));*/
		        new bbid = GetUnusedBillBoard();

			    BillboardInfo[bbid][bbPosX] = X;
			    BillboardInfo[bbid][bbPosY] = Y;
			    BillboardInfo[bbid][bbPosZ] = Z;
			    BillboardInfo[bbid][bbPosRX] = 0.0;
			    BillboardInfo[bbid][bbPosRY] = 0.0;
			    BillboardInfo[bbid][bbPosRZ] = 0.0;
			    BillboardInfo[bbid][bbInt] = GetPlayerInterior(playerid);
			    BillboardInfo[bbid][bbVW] = GetPlayerVirtualWorld(playerid);
			    BillboardInfo[bbid][bbActive] = true;

				BillboardInfo[bbid][bbRentCost] = GetPVarInt(playerid, #BB_COST);
				BillboardInfo[bbid][bbModel] = 7302;

			    BillboardInfo[bbid][bbObject] = CreateDynamicObject(BillboardInfo[bbid][bbModel], BillboardInfo[bbid][bbPosX], BillboardInfo[bbid][bbPosY], BillboardInfo[bbid][bbPosZ], BillboardInfo[bbid][bbPosRX], BillboardInfo[bbid][bbPosRY], BillboardInfo[bbid][bbPosRZ], BillboardInfo[bbid][bbInt], BillboardInfo[bbid][bbVW]);

				format(BillboardInfo[bbid][bbText], 100, "ADVERTISE HERE!\nBILLBOARD #%i\n{595959}Ph. 1-800-555", bbid+1);

				SetDynamicObjectMaterial(BillboardInfo[bbid][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
				SetDynamicObjectMaterialText(BillboardInfo[bbid][bbObject], 0, BillboardInfo[bbid][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

				mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO `billboards` (`posX`,`posY`,`posZ`,`posRX`,`posRY`,`posRZ`,`int`,`vw`,`model`,`cost`,`text`) VALUES (%f,%f,%f,%f,%f,%f,%d,%d,%d,%i,'%e')", X, Y, Z, BillboardInfo[bbid][bbPosRX], BillboardInfo[bbid][bbPosRY], BillboardInfo[bbid][bbPosRZ], BillboardInfo[bbid][bbInt], BillboardInfo[bbid][bbVW], BillboardInfo[bbid][bbModel], GetPVarInt(playerid, #BB_COST), BillboardInfo[bbid][bbText]);
				mysql_tquery(connectionID, queryBuffer, "GetIDforBillboard", "d", bbid);

				SM(playerid, COLOR_SYNTAX, "You have created a billboard #%i / price - $%i / model - %i", bbid+1, GetPVarInt(playerid, #BB_COST), BillboardInfo[bbid][bbModel]);
				DeletePVar(playerid, #BB_COST);
        	}
		}
		else DeletePVar(playerid, #BB_COST);
		return 1;
	}
	if(dialogid == BillboardList)
	{
		if (!response)	return 1;

		if (BillboardInfo[listitem][bbRentDate])
		{
			callcmd::rentbillboard(playerid, "");
			return SCM(playerid, COLOR_SYNTAX, "This billboard is already rented!");
		}

		static const msg[] = "Select the number of rental hours:\n{FFFFFF}24 hours\t{FF6347}$%i\n{FFFFFF}48 hours\tFF6347$%i\n{FFFFFF}72 hours\t{FF6347}$%i";
		new string[sizeof(msg)+10];

		format(string, sizeof(string), msg,
			BillboardInfo[listitem][bbRentCost],
			floatround(BillboardInfo[listitem][bbRentCost]*2.2),
			floatround(BillboardInfo[listitem][bbRentCost]*3.5)
		);

		SetPVarInt(playerid, #BB_SELECT_ID, listitem);
		ShowPlayerDialog(playerid, BillboardRent, DIALOG_STYLE_TABLIST_HEADERS, "Billboard rental", string, ">>>", "Cancel");
		return 1;
	}
	if(dialogid == BillboardRent)
	{
		if (!response)	return DeletePVar(playerid, #BB_SELECT_ID);

		SetPVarInt(playerid, #BB_SELECT_HH, listitem);

		new id = GetPVarInt(playerid, #BB_SELECT_ID);

		static const msg[] = "{ffffff}Now enter the text for your ad!\nConsider the maximum characters: %i\n\n\n{c3c3c3}[ ! ] Save as a last resort what you wrote CTRL + C";
		new string[sizeof(msg)+1];

		new max_char;

		switch(BillboardInfo[id][bbModel])
		{
			case 7302: max_char = 100;
			case 9314: max_char = 87;
		}

		format(string, sizeof(string), msg, max_char);

		ShowPlayerDialog(playerid, BillboardRent2, DIALOG_STYLE_INPUT, "Billboard rental", string, ">>>", "Cancel");
		return 1;
	}
	if(dialogid == BillboardRent2)
	{
		if (!response)
		{
		DeletePVar(playerid, #BB_SELECT_ID);
		DeletePVar(playerid, #BB_SELECT_HH);
		return 1;
		}

		new id = GetPVarInt(playerid, #BB_SELECT_ID);

		if (CheckDialogString(inputtext))
		{
			callcmd::rentbillboard(playerid, "");
			DeletePVar(playerid, #BB_SELECT_ID);
			DeletePVar(playerid, #BB_SELECT_HH);

			return SCM(playerid, COLOR_SYNTAX, "Cannot be used in ad text '\n'!");
		}

		if (1 < strlen(inputtext) < 100)
		{
			SetPVarString(playerid, #BB_SELECT_TEXT, TextTab(inputtext, 22, 35, 1, 0));

			static const msg[] = "• {ffffff}Billboard {c3c3c3}#%i\n{ffffff}• Rent price: {c3c3c3}$%i\n{ffffff}• Rental time: {c3c3c3}%i h\n{ffffff}• Advertisement text:\n\n{c3c3c3}%s\n\n{ffffff}Check if everything is correct? If yes, click 'Buy'!";
			new string[sizeof(msg)+100+2];

			new hours, cost;
			switch(GetPVarInt(playerid, #BB_SELECT_HH))
			{
				case 0: { hours = 24; cost = BillboardInfo[id][bbRentCost]; } // 24h
				case 1: { hours = 48; cost = floatround(BillboardInfo[id][bbRentCost]*2.2); } // 48h
				case 2: { hours = 72; cost = floatround(BillboardInfo[id][bbRentCost]*3.5); } // 72h
			}

			format(string, sizeof(string), msg,
				id+1,
				cost,
				hours,
				TextTab(inputtext, 22, 35, 1, 0)
			);

			ShowPlayerDialog(playerid, BillboardRentFinal, DIALOG_STYLE_MSGBOX, "Billboard rental", string, "Buy", "Cancel");
		}
		else
		{
			callcmd::rentbillboard(playerid, "");

			new max_char;
			switch(BillboardInfo[id][bbModel])
			{
				case 7302: max_char = 100;
				case 9314: max_char = 87;
			}

			DeletePVar(playerid, #BB_SELECT_ID);
			DeletePVar(playerid, #BB_SELECT_HH);

			return SM(playerid, COLOR_SYNTAX, "1 <= Advertisement text <= %i", max_char);
		}

		return 1;
	}
	if(dialogid == BillboardRentFinal)
	{
		if (!response)
		{
		DeletePVar(playerid, #BB_SELECT_ID);
		DeletePVar(playerid, #BB_SELECT_HH);
		DeletePVar(playerid, #BB_SELECT_TEXT);
		return 1;
		}

		new mes[100], hours, cost, id = GetPVarInt(playerid, #BB_SELECT_ID);

		GetPVarString(playerid, #BB_SELECT_TEXT, mes, 100);

		switch(GetPVarInt(playerid, #BB_SELECT_HH))
		{
			case 0: { hours = 24; cost = BillboardInfo[id][bbRentCost]; } // 24h
			case 1: { hours = 48; cost = floatround(BillboardInfo[id][bbRentCost]*2.2); } // 48h
			case 2: { hours = 72; cost = floatround(BillboardInfo[id][bbRentCost]*3.5); } // 72h
		}

		GivePlayerMoney(playerid, -cost);

		BillboardInfo[id][bbRentDate] = gettime()+hours*60*60;
		BillboardInfo[id][bbRentBy] = PlayerInfo[playerid][pID];
		format(BillboardInfo[id][bbText], 100, "%s\n{595959}Ph. %i", mes, PlayerInfo[playerid][pPhone]);

		Save_BB(id);

		SM(playerid, COLOR_SYNTAX, "You have successfully rented a billboard #%i on {FF6347}%ih{ffffff} for {FF6347}$%i{ffffff}.", id+1, hours, cost);
	    SCM(playerid, COLOR_SYNTAX, "Use /mybb - to manage your billboards.");

		SetDynamicObjectMaterial(BillboardInfo[id][bbObject], 0, -1, "none", "none", 0xFFFFFFFF);
		SetDynamicObjectMaterialText(BillboardInfo[id][bbObject], 0, BillboardInfo[id][bbText], OBJECT_MATERIAL_SIZE_512x128,"Arial", 28, 0, 0xFF000000, 0x0FFFFFFF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

		return 1;
	}
	if(dialogid == MyBillboards)
	{
		if (!response)	return 1;

	    new id, count;

	    for(new i; i < MAX_BILLBOARDS; i++)
	    {
			if (BillboardInfo[i][bbRentBy] == PlayerInfo[playerid][pID] && listitem+1 == count) id = i;
	        else count++;
	    }

	    static const msg[] = "{FFFFFF}Are you sure you want to cancel your billboard rental #%i, %s";
	    new string[sizeof(msg)+1+MAX_ZONE_NAME];

	    new location[MAX_ZONE_NAME];
		GetZone(BillboardInfo[id][bbPosX],BillboardInfo[id][bbPosY], location, MAX_ZONE_NAME);

	    format(string, sizeof(string), msg,
	        id,
	        location
	    );

	    SetPVarInt(playerid, #BB_SELECT_ID, id);
		ConfirmDialog(playerid, "Confirmation", string, "MyBillBoard_Unrent");
		return 1;
	}
    #if defined BBDyn_OnDialogResponse
		return BBDyn_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse BBDyn_OnDialogResponse
#if defined BBDyn_OnDialogResponse
	forward BBDyn_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif