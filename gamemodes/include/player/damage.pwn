#define BODY_PART_CHEST             3
#define BODY_PART_GROIN             4
#define BODY_PART_LEFT_ARM          5
#define BODY_PART_RIGHT_ARM         6
#define BODY_PART_LEFT_LEG          7
#define BODY_PART_RIGHT_LEG         8
#define BODY_PART_HEAD              9
#define MAX_DAMAGES                 30

new totalDamages[MAX_PLAYERS];

enum e_Damages
{
    Float:damageTaken,
    damageWeapon,
    damageBodypart,
    damageArmor,
    damageTime,
    damageBy[90],
}
new DamageData[MAX_PLAYERS][MAX_DAMAGES][e_Damages];

stock ClearDamages(playerid)
{
    for(new id = 0; id < MAX_DAMAGES; id++)
    {
        if(DamageData[playerid][id][damageTaken] != 0)
        {
            DamageData[playerid][id][damageTaken] = -1;
            DamageData[playerid][id][damageBodypart] = 0;
            DamageData[playerid][id][damageTime] = 0;
            DamageData[playerid][id][damageWeapon] = -1;
            DamageData[playerid][id][damageBy] = -1;
        }
    }

    totalDamages[playerid] = 0;
    return true;
}

stock ReturnDamages(damaged, playerid)
{
    new str[400], longstr[2500], title[90], count = 0;

    format(title, sizeof(title), "%s - Received damage (%s)", GetRPName(damaged), ReturnDate());

    for(new id = 0; id < MAX_DAMAGES; id++){
        if(DamageData[damaged][id][damageTaken] != 0) count++;
    }
    if(!count) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, title, "There are no damages to show.", ">>>", "");
    else if(count > 0){
        for(new id = 0; id < MAX_DAMAGES; id++){

            if(DamageData[damaged][id][damageTaken] >= 1){

                format(str, sizeof(str), "{FF6346}%.3f {FFFFFF}dmg from %s to %s (Kevlarhit: %d) %d s ago\n", DamageData[damaged][id][damageTaken], GetWeaponNameEx(DamageData[damaged][id][damageWeapon]), ReturnBodypartName(DamageData[damaged][id][damageBodypart]), DamageData[damaged][id][damageArmor], gettime() - DamageData[damaged][id][damageTime]);
                strcat(longstr, str);
            }
        }

        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, title, longstr, ">>>", "");
    }

    return true;
}

stock ReturnDamagesAdmin(damaged, playerid)
{
    new str[400], longstr[2500], title[90], count = 0;

    format(title, sizeof(title), "%s - Received damage (%s)", GetRPName(damaged), ReturnDate());

    for(new id = 0; id < MAX_DAMAGES; id++){
        if(DamageData[damaged][id][damageTaken] != 0) count++;
    }
    if(!count) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, title, "There are no damages to show.", ">>>", "");
    else if(count > 0){
        for(new id = 0; id < MAX_DAMAGES; id++){

            if(DamageData[damaged][id][damageTaken] != 0){
                format(str, sizeof(str), "{FF6346}(%s){FFFFFF} %.3f dmg from %s to %s (Kevlarhit: %d) %d s ago\n", DamageData[damaged][id][damageBy], DamageData[damaged][id][damageTaken], GetWeaponNameEx(DamageData[damaged][id][damageWeapon]), ReturnBodypartName(DamageData[damaged][id][damageBodypart]), DamageData[damaged][id][damageArmor], gettime() - DamageData[damaged][id][damageTime]);
                strcat(longstr, str);
            }
        }

        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, title, longstr, ">>>", "");
    }

    return true;
}

stock ReturnBodypartName(bodypart)
{
    new bodyname[20] = EOS;

    switch(bodypart)
    {
        case BODY_PART_CHEST:bodyname = "CHEST";
        case BODY_PART_GROIN:bodyname = "GROIN";
        case BODY_PART_LEFT_ARM:bodyname = "LEFT ARM";
        case BODY_PART_RIGHT_ARM:bodyname = "RIGHT ARM";
        case BODY_PART_LEFT_LEG:bodyname = "LEFT LEG";
        case BODY_PART_RIGHT_LEG:bodyname = "RIGHT LEG";
        case BODY_PART_HEAD:bodyname = "HEAD";
        default:  bodyname = "NONE";
    }

    return bodyname;
}

stock AddDamages(playerid, issuerid, weaponid, bodypart, Float:amount)
{
    new id;

    totalDamages[playerid]++;

    for(new i = 0; i < MAX_DAMAGES; i++)
    {
        if(!DamageData[playerid][i][damageTaken]){
            id = i;
            break;
        }
    }

    new Float: Armour;
    GetPlayerArmour(playerid, Armour);

    if(Armour > 1 && bodypart == BODY_PART_CHEST){
        DamageData[playerid][id][damageArmor] = 1;
    }
    else{
        DamageData[playerid][id][damageArmor] = 0;
    }

    DamageData[playerid][id][damageTaken] = amount;
    DamageData[playerid][id][damageWeapon] = weaponid;
    DamageData[playerid][id][damageBodypart] = bodypart;
    DamageData[playerid][id][damageTime] = gettime();
    format(DamageData[playerid][id][damageBy], 90, "%s", GetPlayerNameEx(issuerid));
    return true;
}

public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        AddDamages(playerid, issuerid, weapon, bodypart, amount);
    }
    #if defined Damage_OnPlayerDamage
        return Damage_OnPlayerDamage(playerid, Float:amount, issuerid, weapon, bodypart);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerDamage
    #undef OnPlayerDamage
#else
    #define _ALS_OnPlayerDamage
#endif
#define OnPlayerDamage Damage_OnPlayerDamage
#if defined Damage_OnPlayerDamage
    forward Damage_OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart);
#endif

public OnPlayerConnect(playerid)
{
    for(new i = 0; i < MAX_DAMAGES; i++)
    {
        DamageData[playerid][i][damageTaken] = 0;
        DamageData[playerid][i][damageWeapon] = 0;
        DamageData[playerid][i][damageBy] = 0;
    }
    #if defined Damage_OnPlayerConnect
		return Damage_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Damage_OnPlayerConnect
#if defined Damage_OnPlayerConnect
	forward Damage_OnPlayerConnect(playerid);
#endif

CMD:damages(playerid, params[])
{
    new playerb;

    if(sscanf(params, "u", playerb))
        return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /damages [playerid/PartofName]");
    if(!IsPlayerConnected(playerb))
        return SendClientMessage(playerid, COLOR_SYNTAX, "You have specified an invalid player.");

    if(PlayerInfo[playerid][pAdmin])
    {
        ReturnDamagesAdmin(playerb, playerid);
    }
    else
    {
        if(!IsPlayerInRangeOfPlayer(playerid, playerb, 5.0)) return SendClientMessage(playerid, COLOR_SYNTAX, "You must be closer to that player.");
        ReturnDamages(playerb, playerid);
    }
    return true;
}