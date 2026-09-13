//============================================================================//
// FIREWORKS SYSTEM
//============================================================================//
#define RocketHeight 80
#define TYPE_COUNTDOWN 2000
#define TYPE_LAUNCH 2001
#define TYPE_EXPLODE 2002
#define MAX_FIREWORKS 100
#define FireworkSpread 30

new Rocket[MAX_PLAYERS];
new RocketLight[MAX_PLAYERS];
new RocketSmoke[MAX_PLAYERS];
new RocketExplosions[MAX_PLAYERS];

forward Firework(playerid, type);
public Firework(playerid, type)
{
	if(!IsPlayerConnected(playerid))
	{
		DestroyDynamicObject(Rocket[playerid]);
		DestroyDynamicObject(RocketLight[playerid]);
		DestroyDynamicObject(RocketSmoke[playerid]);
		return 1;
	}
	new Float:x, Float:y, Float:z;
	x = GetPVarFloat(playerid, "fxpos");
	y = GetPVarFloat(playerid, "fypos");
	z = GetPVarFloat(playerid, "fzpos");
	if (type == TYPE_COUNTDOWN)
	{
     	SendMessage(playerid, COLOR_GREEN, "STAND BACK! 5 seconds till launch!", GetRPName(playerid));
		SetTimerEx("Firework", 5000, 0, "ii", playerid, TYPE_LAUNCH);
	}
	else if(type == TYPE_LAUNCH)
	{
		CreateExplosion(x ,y, z, 13, 5);
		new time = MoveDynamicObject(Rocket[playerid], x, y, z + RocketHeight, 10);
		MoveDynamicObject(RocketLight[playerid], x, y, z + 2 + RocketHeight, 10);
		MoveDynamicObject(RocketSmoke[playerid], x, y, z + RocketHeight, 10);
		SetTimerEx("Firework", time, 0, "ii", playerid, TYPE_EXPLODE);
	}
	else if(type == TYPE_EXPLODE)
	{
		z += RocketHeight;
		if (RocketExplosions[playerid] == 0)
		{
			DestroyDynamicObject(Rocket[playerid]);
			DestroyDynamicObject(RocketLight[playerid]);
			DestroyDynamicObject(RocketSmoke[playerid]);
			CreateExplosion(x ,y, z, 4, 10);
			CreateExplosion(x ,y, z, 5, 10);
			CreateExplosion(x ,y, z, 6, 10);
		}
		else if (RocketExplosions[playerid] >= MAX_FIREWORKS)
		{
			for (new i = 0; i <= FireworkSpread; i++)
			{
				CreateExplosion(x + float(i - (FireworkSpread / 2)), y, z, 7, 10);
				CreateExplosion(x, y + float(i - (FireworkSpread / 2)), z, 7, 10);
				CreateExplosion(x, y, z + float(i - (FireworkSpread / 2)), 7, 10);
			}
			RocketExplosions[playerid] = -1;
			return 1;
		}
		else
		{
			x += float(random(FireworkSpread) - (FireworkSpread / 2));
			y += float(random(FireworkSpread) - (FireworkSpread / 2));
			z += float(random(FireworkSpread) - (FireworkSpread / 2));
			CreateExplosion(x, y, z, 7, 10);
		}
		RocketExplosions[playerid]++;
		SetTimerEx("Firework", 250, 0, "ii", playerid, TYPE_EXPLODE);
	}
	return 1;
}

GivePlayerFirework(playerid, amount)
{
	if(PlayerInfo[playerid][pLogged])
	{
		PlayerInfo[playerid][pFirework] = PlayerInfo[playerid][pFirework] + amount;

		if(!PlayerInfo[playerid][pAdminDuty])
	    {
			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET firework = firework + %i WHERE uid = %i", amount, PlayerInfo[playerid][pID]);
			mysql_tquery(connectionID, queryBuffer);
		}
	}
}

CMD:givefirework(playerid, params[])
{
	new targetid, amount, string[128];

    if(PlayerInfo[playerid][pAdmin] < 3)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 6)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "ui", targetid, amount))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /givefirework [playerid] [amount]");
	}
	if(!IsPlayerConnected(targetid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected.");
	}
	if(!PlayerInfo[targetid][pLogged])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "That player hasn't logged in yet.");
	}
	GivePlayerFirework(targetid, amount);

	format(string, sizeof(string), "You have received %d fireworks from %s. ", amount, GetRPName(playerid));
	SendClientMessageEx(targetid, COLOR_YELLOW, string);
	return 1;
}

CMD:givefireworkall(playerid, params[])
{
	new amount, targetid, string[128];

    if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(sscanf(params, "i", amount))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /givefireworkall [amount]");
    }
	if(amount < 1 || amount > 5)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "The amount specified must range between 1 and 5.");
	}

	foreach(new i : Player)
	{
	    if(PlayerInfo[i][pLogged])
		{
			GivePlayerFirework(i, amount);
		}
	}
	format(string, sizeof(string), "You have received %d Fireworks from Admin %s. ", amount, GetRPName(playerid));
	SendClientMessageEx(targetid, COLOR_YELLOW, string);
	return 1;
}

CMD:fireworkhelp(playerid, params[])
{
	SendClientMessage(playerid, COLOR_SYNTAX, "Fireworks: /placefirework, /fireworknear");
	return 1;
}

CMD:placefirework(playerid, params[])
{
	if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are unable to use your cellphone at the moment.");
	}
	if(RocketExplosions[playerid] != -1)
	{
		SendClientMessageEx(playerid, COLOR_SYNTAX, "You are already using another firework!");
		return 1;
	}
	if(GetPlayerInterior(playerid) != 0 || GetPlayerVirtualWorld(playerid) != 0)
	{
		SendClientMessageEx(playerid, COLOR_SYNTAX, "You can't launch fireworks indoors!");
		return 1;
	}
	if(PlayerInfo[playerid][pFirework] > 0 || PlayerInfo[playerid][pAdmin] >= 4)
	{
		PlayerInfo[playerid][pFirework] -= 1;

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET firework = %i WHERE uid = %i", PlayerInfo[playerid][pFirework], PlayerInfo[playerid][pID]);
		mysql_tquery(connectionID, queryBuffer);

     	SendProximityMessage(playerid, 3.0, COLOR_PURPLE, "** %s has placed a firework which will go off in 30 seconds.", GetRPName(playerid));

		new Float:x, Float:y, Float:z, Float:a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);
		ApplyAnimation(playerid,"BOMBER","BOM_Plant_Crouch_In", 4.0, 0, 0, 0, 0, 0, 1);
		x += (2 * floatsin(-a, degrees));
		y += (2 * floatcos(-a, degrees));
		Rocket[playerid] = CreateDynamicObject(3786, x, y, z, 0, 90, 0);
		RocketLight[playerid] = CreateDynamicObject(354, x, y, z + 1, 0, 0, 0);
		RocketSmoke[playerid] = CreateDynamicObject(18716, x, y, z - 4, 0, 0, 0);
		SetPVarFloat(playerid,"fxpos",x);
		SetPVarFloat(playerid,"fypos",y);
		SetPVarFloat(playerid,"fzpos",z);
		RocketExplosions[playerid] = 0;
		SetTimerEx("Firework", 25000, 0, "ii", playerid, TYPE_COUNTDOWN);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "You don't have any fireworks!");
	}
	return 1;
}


CMD:fireworknear(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float: pos[3];
		SendClientMessageEx(playerid, COLOR_RED, "* Listing all fireworks within 50 meters of you...");
		foreach(new i : Player)
		{
			if(RocketExplosions[i] != -1)
			{
				new string[128];
				
				pos[0] = GetPVarFloat(i, "fxpos");
				pos[1] = GetPVarFloat(i, "fypos");
				pos[2] = GetPVarFloat(i, "fzpos");
				if(IsPlayerInRangeOfPoint(playerid, 50, pos[0], pos[1], pos[2]))
				{
					format(string, sizeof(string), "** Firework Owner: %s | %f from you", GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, GetPVarFloat(i, "fxpos"), GetPVarFloat(i, "fypos"), GetPVarFloat(i, "fzpos")));
					SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
			}
		}
	}
	else 
		return SendClientMessageEx(playerid, COLOR_GRAD1, "You're not authorized to use this command!");
	return true;
}
