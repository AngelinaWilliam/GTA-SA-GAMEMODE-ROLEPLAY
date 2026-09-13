// Mareya

// Actor System 

#define MAX_DYNAMIC_ACTORS (100)
#define MAX_ACTORANIMS     (44)

new gstr[2056];

enum ACTOR_ANIMS
{
	AnimName[64],
	AnimLibrary[64],
	AnimationName[64],
	Float:AnimDelta,
	AnimLoop,
	AnimLockX,
	AnimLockY,
	AnimFreeze,
	AnimTime
};
new AnimData[MAX_ACTORANIMS][ACTOR_ANIMS] =
{
	{"/handsup", "ROB_BANK","SHP_HandsUp_Scr", 4.0, 0, 1, 1, 1, 0},
	{"/crossarms", "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1},
	{"/lay", "BEACH", "bather", 4.0, 1, 0, 0, 0, 0},
	{"/hide", "ped", "cower", 3.0, 1, 0, 0, 0, 0},
	{"/wave", "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0},
	{"/crack",  "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0},
	{"/wounded", "CRACK", "crckidle1", 4.0, 1, 0, 0, 0, 0},
	{"/sleep", "CRACK", "crckidle2", 4.0, 1, 0, 0, 0, 0},
	{"/smoke 1", "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0},
	{"/smoke 2", "SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0},
	{"/smoke 3", "SMOKING","M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0},
	{"/smoke 4", "SMOKING","M_smk_out", 4.0, 1, 0, 0, 0, 0},
	{"/gro (/groundsit)", "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0},
	{"/chat", "PED","IDLE_CHAT",4.0,1,0,0,1,1},
	{"/sit", "PED","SEAT_down",4.0,0,0,0,1,0},
	{"/fsit", "SUNBATHE","SBATHE_F_LieB2Sit",4.0,0,0,0,1,0},
	{"/fall", "PED","KO_skid_front",4.0,0,1,1,1,0},
	{"/fall2", "PED", "BIKE_fall_off",4.0,0,1,1,1,0},
	{"/fallback", "PED","FLOOR_hit_f", 4.0, 1, 0, 0, 0, 0},
	{"/injured", "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0},
	{"/exhaust", "FAT","IDLE_tired",3.0,1,0,0,0,0},
	{"/lay2", "SUNBATHE","Lay_Bac_in",3.0,0,1,1,1,0},
	{"/chant", "RIOT","RIOT_CHANT",4.0,1,1,1,1,0},
	{"/dealstance", "DEALER","DEALER_IDLE",4.0,1,0,0,0,0},
	{"/lean 1", "GANGS","leanIDLE",4.0,0,1,1,1,0},
	{"/lean 2", "MISC","Plyrlean_loop",4.0,0,1,1,1,0},
	{"/lean 3", "RYDER","Van_Lean_R",4.0,0,1,1,1,0},
	{"/strip 1", "STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1},
	{"/strip 2", "STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1},
	{"/strip 3", "STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1},
	{"/strip 4", "STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1},
	{"/strip 5", "STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1},
	{"/strip 6", "STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1},
	{"/strip 7", "STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1},
	{"/dance 1", "DANCING", "DAN_Loop_A", 4.1, 1, 1, 1, 1, 1},
	{"/dance 2", "DANCING", "dnce_M_a", 4.1, 1, 1, 1, 1, 1},
	{"/dance 3", "DANCING", "dnce_M_b", 4.1, 1, 1, 1, 1, 1},
	{"/dance 4", "DANCING", "dnce_M_c", 4.1, 1, 1, 1, 1, 1},
	{"/dance 5", "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, 1},
	{"/dance 6", "DANCING", "dnce_M_e", 4.1, 1, 1, 1, 1, 1},
	{"/dance 7", "DANCING", "bd_clap1", 4.1, 1, 1, 1, 1, 1},
	{"/relax", "BAR", "BARman_idle", 4.0, 1, 0, 0, 0, 0},
	{"/angry", "RIOT", "RIOT_ANGRY", 4.0, 1, 0, 0, 0, 0},
	{"/cheer", "RIOT", "RIOT_ANGRY_B", 4.0, 1, 0, 0, 0, 0}
};


enum actEnum
{
    actor_ID,
    Text3D:actor_Label,
    actorID,
    actorExists,
    actorName[24],
    actorSkin,
    Float:actorX,
    Float:actorY,
    Float:actorZ,
    Float:actorA,
    actorVW,
    actorAnim
};
new ActorInfo[MAX_DYNAMIC_ACTORS][actEnum];

// mysql 

forward OnAdminCreateActor(playerid, actorid, name[], skin, Float:x, Float:y, Float:z, Float:angle, world, anim);
public OnAdminCreateActor(playerid, actorid, name[], skin, Float:x, Float:y, Float:z, Float:angle, world, anim)
{
	strcpy(ActorInfo[actorid][actorName], name, MAX_PLAYER_NAME);
	ActorInfo[actorid][actorID] = cache_insert_id(connectionID);
	ActorInfo[actorid][actorSkin] = skin;
	ActorInfo[actorid][actorX] = x;
	ActorInfo[actorid][actorY] = y;
	ActorInfo[actorid][actorZ] = z;
	ActorInfo[actorid][actorA] = angle;
	ActorInfo[actorid][actorVW] = world;
    ActorInfo[actorid][actorAnim] = anim;
	ActorInfo[actorid][actorExists] = 1;
	ReloadActor(actorid);

    ApplyDynamicActorAnim(ActorInfo[actorid][actor_ID], ActorInfo[actorid][actorAnim]);
	SM(playerid, COLOR_GREY, "[Actor System]: "WHITE"You've created an actor ID: %d.", actorid);
}


// commands 
CMD:loadactor(playerid, param[])
{
	for(new i = 0; i < MAX_DYNAMIC_ACTORS; i ++)
	{
		ApplyDynamicActorAnim(ActorInfo[i][actor_ID], ActorInfo[i][actorAnim]);
	}
	SAM(COLOR_LIGHTRED, "%s has loaded actors animation", GetRPName(playerid));
	return 1;
}

CMD:createactor(playerid, params[])
{
	new name[24], world = GetPlayerVirtualWorld(playerid), anim = 1, skin, Float:x, Float:y, Float:z, Float:a;

    if(PlayerInfo[playerid][pAdmin] < 7)
	    return SCM(playerid, COLOR_LIGHTRED, "You are not authorized to use this command.");

	if(sscanf(params, "s[24]d", name, skin))
		return SCM(playerid, COLOR_GREY, "Usage: "WHITE"/createactor [name] [skin]");

	if(skin < 0 || skin == 74 || skin > 311)
		return SCM(playerid, COLOR_GREY, "Invalid SkinID.");

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

 	for(new i = 0; i < MAX_DYNAMIC_ACTORS; i ++)
	{
	    if(!ActorInfo[i][actorExists])
	    {		
			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO actors (name, skin, x, y, z, a, world, anim) VALUES('%e', %d, %f, %f, %f, %f, %d, %d)", name, skin, x, y, z, a, world, anim);
			mysql_tquery(connectionID, queryBuffer, "OnAdminCreateActor", "iisiffffii", playerid, i, name, skin, x, y, z, a, world, anim);
			return 1;
		}
	}

	SCM(playerid, COLOR_LIGHTRED, "Actor slots are currently full. Ask developers to increase the internal limit.");
	return 1;
}

CMD:editactor(playerid, params[])
{
	new actorid, option[14], param[32];

	if(PlayerInfo[playerid][pAdmin] < 7)
	    return SCM(playerid, COLOR_GREY, "You are not authorized to use this command.");

	if(sscanf(params, "is[14]S()[32]", actorid, option, param))
	{
	    SCM(playerid, COLOR_GREY, "Usage: "WHITE"/editactor [actorid] [option]");
	    SCM(playerid, COLOR_GREY, "[Actor System]: "WHITE"Name, Skin, Position, World, Animation");
	    return 1;
	}
	if(!(0 <= actorid < MAX_DYNAMIC_ACTORS) || !ActorInfo[actorid][actorExists])
	    return SCM(playerid, COLOR_LIGHTRED, "Invalid actor.");

	if(!strcmp(option, "name", true))
	{
		new name[24];
	
		if(sscanf(param, "s[24]", name))
			return SCM(playerid, COLOR_GREY, "Usage: "WHITE"/editactor [actorid] [name] [name of actor]");

        DestroyActor(ActorInfo[actorid][actor_ID]);

		strcpy(ActorInfo[actorid][actorName], name, 24);

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE actors SET name = '%e' WHERE id = %i", ActorInfo[actorid][actorName], ActorInfo[actorid][actorID]);
	    mysql_tquery(connectionID, queryBuffer);

	    ReloadActor(actorid);
	    SM(playerid, COLOR_WHITE, "You've changed the name of Actor %i to %s.", actorid, name);
	}
	else if(!strcmp(option, "skin", true))
	{
		new skin;
	
		if(sscanf(param, "d", skin))
			return SCM(playerid, COLOR_GREY, "Usage: "WHITE"/editactor [actorid] [skin] [skinid]");
			
		if(skin < 0 || skin == 74 || skin > 311)
			return SCM(playerid, COLOR_GREY, "Invalid SkinID.");

        DestroyActor(ActorInfo[actorid][actor_ID]);

		ActorInfo[actorid][actorSkin] = skin;

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE actors SET skin = %d WHERE id = %i", ActorInfo[actorid][actorSkin], ActorInfo[actorid][actorID]);
	    mysql_tquery(connectionID, queryBuffer);

	    ReloadActor(actorid);
	    SM(playerid, COLOR_WHITE, "You've changed the skin of Actor %i to %d.", actorid, skin);
	}
	else if(!strcmp(option, "position", true))
	{
        DestroyActor(ActorInfo[actorid][actor_ID]);

		GetPlayerPos(playerid, ActorInfo[actorid][actorX], ActorInfo[actorid][actorY], ActorInfo[actorid][actorZ]);
		GetPlayerFacingAngle(playerid, ActorInfo[actorid][actorA]);
		ActorInfo[actorid][actorVW] = GetPlayerVirtualWorld(playerid);
		
	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE actors SET x = %f, y = %f, z = %f, a = %f, world = %d WHERE id = %i", ActorInfo[actorid][actorX], ActorInfo[actorid][actorY], ActorInfo[actorid][actorZ], ActorInfo[actorid][actorA], ActorInfo[actorid][actorVW], ActorInfo[actorid][actorID]);
	    mysql_tquery(connectionID, queryBuffer);

	    ReloadActor(actorid);

		SM(playerid, COLOR_WHITE, "You've changed the position of Actor %i to your position.", actorid);
	}
	else if(!strcmp(option, "world", true))
	{
		new world;
		if(sscanf(param, "d", world))
			return SCM(playerid, COLOR_GREY, "Usage: "WHITE"/editactor [actorid] [world] [vw]");

        DestroyActor(ActorInfo[actorid][actor_ID]);
        DestroyDynamic3DTextLabel(ActorInfo[actorid][actor_Label]);
        
		ActorInfo[actorid][actorVW] = world;
		
	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE actors SET world = %d WHERE id = %i", ActorInfo[actorid][actorVW], ActorInfo[actorid][actorID]);
	    mysql_tquery(connectionID, queryBuffer);

	    ReloadActor(actorid);

		SM(playerid, COLOR_WHITE, "You've changed the world ID of Actor %i to %d.", actorid, world);
	}
	else if(!strcmp(option, "animation", true))
	{
        SetPVarInt(playerid, "EditingActor", actorid);
        new sub[32];
        gstr[0] = EOS;
        strcat(gstr, "Clear Animation\n");
        for(new x = 0; x < MAX_ACTORANIMS; x++)
        {
            format(sub, sizeof(sub), "%s", AnimData[x][AnimName]);
            strcat(gstr, sub);
            strcat(gstr, "\n");
        }
        Dialog_Show(playerid, ActorAnimation, DIALOG_STYLE_LIST, "Set Actor Animation", gstr, "Select", "Cancel");
	}
	return 1;
}

CMD:removeactor(playerid, params[])
{
	new actorid;

	if(PlayerInfo[playerid][pAdmin] < 7)
	    return SCM(playerid, COLOR_LIGHTRED, "You are not authorized to use this command.");

	if(sscanf(params, "i", actorid))
	    return SCM(playerid, COLOR_GREY, "Usage: "WHITE"/removeactor [actorid]");

	if(!(0 <= actorid < MAX_DYNAMIC_ACTORS) || !ActorInfo[actorid][actorExists])
	    return SCM(playerid, COLOR_GREY, "Invalid actor.");

	DestroyDynamic3DTextLabel(ActorInfo[actorid][actor_Label]);
	DestroyActor(ActorInfo[actorid][actor_ID]);

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM actors WHERE id = %i", ActorInfo[actorid][actorID]);
	mysql_tquery(connectionID, queryBuffer);

	ActorInfo[actorid][actorExists] = 0;
	ActorInfo[actorid][actorID] = 0;

	SM(playerid, COLOR_GREY, "[Actor System]: "WHITE"You have removed actor ID: %i.", actorid);
	return 1;
}

// functions

ReloadActor(actorid)
{
	if(ActorInfo[actorid][actorExists])
	{
		new string[128], name[24];
	
		strcpy(name, ActorInfo[actorid][actorName], 24);
		
		for(new i = 0, l = strlen(name); i < l; i ++)
		{
			if(name[i] == '_')
			{
				name[i] = ' ';
			}
		}		
	
		for(new i = 0; i < MAX_DYNAMIC_ACTORS; i ++)
		{
			ApplyDynamicActorAnim(ActorInfo[i][actor_ID], ActorInfo[i][actorAnim]);
		}

		ActorInfo[actorid][actor_ID] = CreateActor(ActorInfo[actorid][actorSkin], ActorInfo[actorid][actorX], ActorInfo[actorid][actorY], ActorInfo[actorid][actorZ], ActorInfo[actorid][actorA]);

		DestroyDynamic3DTextLabel(ActorInfo[actorid][actor_Label]);
		format(string, sizeof(string), "{FF0000}ID: %d\n{00FF00}%s", actorid, name);
		ActorInfo[actorid][actor_Label] = CreateDynamic3DTextLabel(string, COLOR_WHITE, ActorInfo[actorid][actorX], ActorInfo[actorid][actorY], ActorInfo[actorid][actorZ] + 1, 10.0);

		SetActorVirtualWorld(ActorInfo[actorid][actor_ID], ActorInfo[actorid][actorVW]);
	}
}

stock ApplyDynamicActorAnim(actorid, animid)
{
	new x = animid;
	if(x != -1) ApplyActorAnimation(actorid, AnimData[x][AnimLibrary], AnimData[x][AnimationName], AnimData[x][AnimDelta], AnimData[x][AnimLoop], AnimData[x][AnimLockX], AnimData[x][AnimLockY], AnimData[x][AnimFreeze], AnimData[x][AnimTime]);
	return true;
}

Dialog:ActorAnimation(playerid, response, listitem, inputtext[])
{
	if(!response) return DeletePVar(playerid, "EditingActor");
	else
	{
		new a = GetPVarInt(playerid, "EditingActor"), x = listitem - 1;
		if(listitem == 0)
		{
			ClearActorAnimations(ActorInfo[a][actorID]);
			ActorInfo[a][actorAnim] = -1;
		}
		else
		{
            ActorInfo[a][actorAnim] = x;
			ApplyDynamicActorAnim(ActorInfo[a][actor_ID], ActorInfo[a][actorAnim]);
		}

	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE actors SET anim = %d WHERE id = %i", ActorInfo[a][actorAnim], ActorInfo[a][actorID]);
	    mysql_tquery(connectionID, queryBuffer);

		DeletePVar(playerid, "EditingActor");
		return true;
	}
}