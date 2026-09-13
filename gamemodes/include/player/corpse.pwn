#define MAX_CORPS 100

enum cpInfo
{
	cUsed,
	cType,
	cName[MAX_PLAYER_NAME],
	cTime,
	Float:cX,
	Float:cY,
	Float:cZ,
	Text3D:cText,
	cVeh,
	cNote[170],
	cSkin,
	cBody
};
new CorpInfo[MAX_CORPS][cpInfo];

GetNearestCorpse(playerid, Float:corpse_range = 2.0)
{
    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return -1;

	for(new i = 0; i < sizeof(CorpInfo); i++)
    {
        if (CorpInfo[i][cUsed] == 1)
        {
            if (IsPlayerInRangeOfPoint(playerid, corpse_range, CorpInfo[i][cX], CorpInfo[i][cY], CorpInfo[i][cZ]))
            {
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0, 1);
                return i;
            }
        }
    }
    return -1;
}

RemoveCorpse(id)
{
	if (id == 0) return 1;
	if (CorpInfo[id][cUsed] == 1)
	{
	    CorpInfo[id][cUsed]=0;
        CorpInfo[id][cType]=0;
	    CorpInfo[id][cX]=0;
        CorpInfo[id][cY]=0;
        CorpInfo[id][cZ]=0;
		CorpInfo[id][cSkin]=0;

		if (IsValidActor(CorpInfo[id][cBody]))           DestroyActor(CorpInfo[id][cBody]);
        if (IsValidDynamicObject(CorpInfo[id][cBody]))   DestroyDynamicObject(CorpInfo[id][cBody]);

        if (CorpInfo[id][cVeh] > 0 && GetVehicleModel(CorpInfo[id][cVeh]) > 0) {
		    VehicleInfo[CorpInfo[id][cVeh]][vCorp]=0;
		} else { DestroyDynamic3DTextLabel(CorpInfo[id][cText]); }

        for(new i; i < GetPlayerPoolSize(); i++) {
            if (pTemp[i][UsingCorpse] == id) {
                pTemp[i][UsingCorpse] = 0;
                break;
            }
        }
	}
	return 1;
}

Corpse_OnPlayerEdit(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rz)
{
    if (GetPVarInt(playerid, #CorpsEdit) != 0 && (response == EDIT_RESPONSE_FINAL || response == EDIT_RESPONSE_CANCEL))
	{
		new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;

		GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
		GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

	    new id = GetPVarInt(playerid, #CorpsEdit)-1;
		DeletePVar(playerid, #CorpsEdit);

	    if (id < 0 || id >= sizeof(CorpInfo) || !CorpInfo[id][cUsed])
	    {
	    	return SendClientMessage(playerid, COLOR_GREY, "The body was not found.");
	    }
	    if (objectid != CorpInfo[id][cBody])
	    {
	    	return  SendClientMessage(playerid, COLOR_GREY, "Corpse edit error.");
	    }

		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, 0.0, 0.0, rz);

        GetDynamicObjectPos(objectid, CorpInfo[id][cX], CorpInfo[id][cY], CorpInfo[id][cZ]);

        if (IsValidDynamic3DTextLabel(CorpInfo[id][cText])) DestroyDynamic3DTextLabel(CorpInfo[id][cText]);

		new string[128 * 2];
		format(string, sizeof(string), "%s's {FFFFFF}Corpse\nPress {FFFF00}'N' {FFFFFF}to inspect the corpse", GetRPName(playerid));
		CorpInfo[id][cText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, CorpInfo[id][cX], CorpInfo[id][cY], CorpInfo[id][cZ]-0.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 50.0);
	}
    return 1;
}

stock GetXYInFrontOfPlayerEx(playerid, &Float:X, &Float:Y, &Float:Z, Float:distance)
{
	new Float:A;
	GetPlayerPos(playerid, X, Y, Z);

	if (GetPlayerVehicleID(playerid))	GetVehicleZAngle(GetPlayerVehicleID(playerid), A);
	else								GetPlayerFacingAngle(playerid, A);

	X += (distance * floatsin(-A, degrees));
	Y += (distance * floatcos(-A, degrees));
}

Corpse_OnPlayerUpdate(playerid)
{
    if(pTemp[playerid][UsingBort] && pTemp[playerid][UsingCorpse])
	{
        new Float:X, Float:Y, Float:Z, Float:R;
        GetPlayerPos(playerid, X, Y, Z);
        GetPlayerFacingAngle(playerid, R);
        GetXYInFrontOfPlayerEx(playerid, X, Y, Z, 1.8);

        new idx = pTemp[playerid][UsingCorpse];
        CorpInfo[idx][cX]=X;
        CorpInfo[idx][cY]=Y;
        CorpInfo[idx][cZ]=Z;
        SetActorPos(CorpInfo[idx][cBody], X, Y, Z + 0.60);
        SetActorFacingAngle(CorpInfo[idx][cBody], R);
    }
    return 1;
}

Corpse_OnPlayerEnterVehicle(playerid)
{
    if (pTemp[playerid][UsingBort])
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPos(playerid,x,y,z);
        SendClientMessage(playerid,COLOR_GREY, "You cannot get into the vehicle while holding the wheelchair.");
    }
    return 1;
}

CreateCorpse(playerid, weaponid)
{
    if (weaponid == 53) return 1;

    new
        found = 0,
        foundid = 0,
        Float:x,
        Float:y,
        Float:z,
        sex[8],
        age
    ;

    GetPlayerPos(playerid, x, y, z);

	for(new o = 0; o < sizeof(CorpInfo); o++)
	{
		if (o != 0)
		{
	        if (CorpInfo[o][cUsed] == 0 && found == 0)
		    {
		        found++;
			    foundid=o;
                break;
            }
        }
    }
    if (found == 0) return 1;

    CorpInfo[foundid][cUsed]=1;
    CorpInfo[foundid][cVeh]=0;

    format(CorpInfo[foundid][cName], 25, "%s", GetRPName(playerid));
    CorpInfo[foundid][cType] = 0;
    CorpInfo[foundid][cTime] = gettime();

    CorpInfo[foundid][cX]=x;
    CorpInfo[foundid][cY]=y;
    CorpInfo[foundid][cZ]=z;

    if (weaponid == 54) CorpInfo[foundid][cX] -= 0.5;

	CorpInfo[foundid][cSkin]=GetPlayerSkin(playerid);
	CorpInfo[foundid][cBody]=CreateActor(GetPlayerSkin(playerid), x, y, z, 0.0);
	SetActorInvulnerable(CorpInfo[foundid][cBody], true);
	ApplyActorAnimation(CorpInfo[foundid][cBody], "PED", "KO_shot_stom", 4.0, 0, 0, 0, 1, 0);
    SetActorVirtualWorld(CorpInfo[foundid][cBody], GetPlayerVirtualWorld(playerid));

	if (PlayerInfo[playerid][pGender] == 1)	format(sex, sizeof(sex), "Male");
	else 			                        format(sex, sizeof(sex), "Female");

    age = PlayerInfo[playerid][pAge];

    format(CorpInfo[foundid][cNote], 200, "\n\
	"WHITE"Name: %s\n\
	"WHITE"Age: %d\n\
	"WHITE"Gender: %s", GetRPName(playerid), age, sex);

	new string[128 * 2];
	format(string, sizeof(string), "%s's {FFFFFF}Corpse\nPress {FFFF00}'N' {FFFFFF}to inspect the corpse", GetRPName(playerid));
    CorpInfo[foundid][cText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, x, y, z-0.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 50.0);
	return 1;
}


CMD:corpse(playerid, params[])
{
    new i;

    if(PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pCuffed] > 0)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You can't use this command at the moment.");
	}
    if(!PlayerInfo[playerid][pLogged])
	{
	    SendClientMessage(playerid, COLOR_RED, "You cannot use commands if you're not logged in.");
		return 0;
	}
    if ((i = GetNearestCorpse(playerid)) == -1)
    {
    	return SendClientMessage(playerid, COLOR_RED, "There is no corpse near you.");
	}
    ShowPlayerDialog(playerid, CorpseInfo, DIALOG_STYLE_MSGBOX, "Death Body", CorpInfo[i][cNote], "Options", "Close");
    return 1;
}

CMD:removeallcorpse(playerid, params[])
{
    for(new i = 0; i < MAX_CORPS; i ++)
    {
        RemoveCorpse(i);
    }
    SendAdminMessage(COLOR_LIGHTRED, "AdmCmd: %s has remove all dead bodies", GetPlayerNameEx(playerid));
    return 1;
}
