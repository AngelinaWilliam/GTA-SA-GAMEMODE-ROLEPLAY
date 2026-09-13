#define MAX_GRAFFITIES			(100)
#define GRAFFITY_OBJECT_ID      (19482)
#define MAX_GRAFFITY_COLORS     (7)
#define MAX_GRAFFITY_BACKS      (8)
#define MAX_GRAFFITY_FONTS      (11)
#define MIN_GRAFFITY_FONTSIZE   (12)
#define MAX_GRAFFITY_FONTSIZE   (28)
#define MIN_GRAFFITY_TEXT       (4)
#define MAX_GRAFFITY_TEXT       (24)
#define GRAFFITY_DISTANCE_WARN  (10.0)
#define GRAFFITY_DESTROY_TIME   (15)
#define RIGHT_YES       "{00B200}Yes"
#define RIGHT_NO        "{CC0000}No"


// New Graffiti
enum GRAFFITY_DATA
{
    gID,
    gText[MAX_GRAFFITY_TEXT],
    gColor,
    gBackColor,
    gFont[16],
    gFontSize,
    gBold,
    gCreator[32],
    gCreateDate[64],
    Float:gPosX,
    Float:gPosY,
    Float:gPosZ,
    Float:gRotX,
    Float:gRotY,
    Float:gRotZ,
    Float:gGotoX,
    Float:gGotoY,
    Float:gGotoZ,
    gInterior,
    gVW,
    gAccepted,
    gAcceptor[32],
    gAcceptDate[64],
    gON,
    gObject,
    gEditing
}
new E_GRAFFITY[MAX_GRAFFITIES][GRAFFITY_DATA];

enum GRAFFITY_COLOR_DATA
{
    color_id,
    color_name[16],
    color_data,
    color_dlg[16],
};
new GRAFFITY_COLOR[MAX_GRAFFITY_COLORS][GRAFFITY_COLOR_DATA] = //цвета
{
    {0, "White",    0xFFFFFFFF, "{FFFFFF}"},
    {1, "Red",      0xFFFF0000, "{FF0000}"},
    {2, "Yellow",   0xFFFFFF00, "{FFFF00}"},
    {3, "Green",    0xFF33CC33, "{33CC33}"},
    {4, "Blue",     0xFF33CCFF, "{33CCFF}"},
    {5, "Orange",   0xFFFFA500, "{FFA500}"},
    {6, "Blue",     0xFF1394BF, "{1394BF}"}
};

enum GRAFFITY_BACK_DATA
{
    color_id,
    color_name[16],
    color_data,
    color_dlg[16],
};
new GRAFFITY_BACK[MAX_GRAFFITY_BACKS][GRAFFITY_BACK_DATA] =
{
    {0, "No",       0,          "{CC0000}"},
    {1, "White",    0xFFFFFFFF, "{FFFFFF}"},
    {2, "Red",      0xFFFF0000, "{FF0000}"},
    {3, "Yellow",   0xFFFFFF00, "{FFFF00}"},
    {4, "Green",    0xFF33CC33, "{33CC33}"},
    {5, "Blue",     0xFF33CCFF, "{33CCFF}"},
    {6, "Orange",   0xFFFFA500, "{FFA500}"},
    {7, "Blue",     0xFF1394BF, "{1394BF}"}
};

enum GRAFFITY_FONT_DATA
{
    font_id,
    font_name[16],
};
new GRAFFITY_FONT[MAX_GRAFFITY_FONTS][GRAFFITY_FONT_DATA] =
{
    {0, "Arial"},
    {1, "Calibri"},
    {2, "Courier New"},
    {3, "Georgia"},
    {4, "Impact"},
    {5, "Tahoma"},
    {6, "Times New Roman"},
    {7, "Verdana"},
    {8, "Segoe Print"},
    {9, "Segoe Script"},
    {10, "Segoe UI"}
};

public OnPlayerDisconnect(playerid, reason)
{
    Graffity_OnPlayerDisconnect(playerid);
    #if defined Graf_OnPlayerDisconnect
		return Graf_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect Graf_OnPlayerDisconnect
#if defined Graf_OnPlayerDisconnect
	forward Graf_OnPlayerDisconnect(playerid, reason);
#endif

public OnPlayerDeath(playerid, killerid, reason)
{
    Graffity_OnPlayerDeath(playerid);
    #if defined Graf_OnPlayerDeath
		return Graf_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath Graf_OnPlayerDeath
#if defined Graf_OnPlayerDeath
	forward Graf_OnPlayerDeath(playerid, killerid, reason);
#endif

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == Graffity_CE)
	{
		if (!response) return ShowPlayerDialog(playerid, Graffity_CE_Cancel, DIALOG_STYLE_MSGBOX, "{FFFFFF}Cancel the creation of graffiti", "{FFFFFF}Are you sure you want to cancel Graffiti creation?", "Yes", "No");

	    new grafid = Graffity_GetPlayerEdit(playerid);
	    switch(listitem)
	    {
	        case 0:
	        {
	            SetPVarInt(playerid, "Graffity:Showing", 1);
	            SetPVarInt(playerid, "Graffity:Show", 8);
	            SendClientMessage(playerid, COLOR_SYNTAX, "The editing window will appear again after 8 seconds.");
	            SendClientMessage(playerid, COLOR_SYNTAX, "Stay close to the graffiti. ");
	        }
	        case 1:
	        {
	            ShowPlayerDialog(playerid, Graffity_CE_Done, DIALOG_STYLE_MSGBOX, "{FFFFFF}Graffiti - Creation", "{FFFFFF}Are you sure you want to paint graffiti with these parameters?", "Yes", "No"); //åñ íîó
	        }
	        case 2:
	        {
	            EditDynamicObject(playerid, E_GRAFFITY[grafid][gObject]);
	            SetPVarInt(playerid, "Graffity:EditPos", 1);
	            SendClientMessage(playerid, COLOR_SYNTAX, "You can use {FF6347}SPACE {FFFFFF}to move the camera around. ");
	        }
	        case 3:
	        {
	            new graf_string[256];
	            format(graf_string, sizeof(graf_string), "{FFFFFF}Current text: %s\n\n* The text must contain at least %i and no more %i characters.\n\nEnter new text in the box below:", E_GRAFFITY[grafid][gText], MIN_GRAFFITY_TEXT, MAX_GRAFFITY_TEXT);
	            ShowPlayerDialog(playerid, Graffity_CE_Text, DIALOG_STYLE_INPUT, "{FFFFFF}Graffiti - Change Text", graf_string, ">>>", "Return");
	        }
	        case 4:
	        {
	            Graffity_ShowPlayerEditDialog(playerid);
	        }
	        case 5:
	        {
	            new graf_string[196];
	            graf_string[0] = EOS;

	            for(new i = 0; i < MAX_GRAFFITY_COLORS; i++)
	            {
	                format(graf_string, sizeof(graf_string), "%s%s%s\n", graf_string, GRAFFITY_COLOR[i][color_dlg], GRAFFITY_COLOR[i][color_name]);
	            }
	            ShowPlayerDialog(playerid, Graffity_CE_Color, DIALOG_STYLE_LIST, "{FFFFFF}Graffiti - Color Choice", graf_string, "Select", "Return");
	        }
	        case 6:
	        {
	            new graf_string[256];
	            graf_string[0] = EOS;

	            for(new i = 0; i < MAX_GRAFFITY_BACKS; i++)
	            {
	                format(graf_string, sizeof(graf_string), "%s%s%s\n", graf_string, GRAFFITY_BACK[i][color_dlg], GRAFFITY_BACK[i][color_name]);
	            }
	            ShowPlayerDialog(playerid, Graffity_CE_BackColor, DIALOG_STYLE_LIST, "{FFFFFF}Graffiti - Background Selection", graf_string, "Select", "Return");
	        }
	        case 7:
	        {
	            new graf_string[256];
	            graf_string[0] = EOS;

	            for(new i = 0; i < MAX_GRAFFITY_FONTS; i++)
	            {
	                format(graf_string, sizeof(graf_string), "%s%s\n", graf_string, GRAFFITY_FONT[i][font_name]);

	            }
	            ShowPlayerDialog(playerid, Graffity_CE_Font, DIALOG_STYLE_LIST, "{FFFFFF}Graffiti - Font Selection", graf_string, "Select", "Return");
	        }
	        case 8:
	        {
	            new graf_string[196];
	            format(graf_string, sizeof(graf_string), "{FFFFFF}Current size: %i\n\n* Font size from %i to %i.\n\nEnter the new value in the box below:", E_GRAFFITY[grafid][gFontSize], MIN_GRAFFITY_FONTSIZE, MAX_GRAFFITY_FONTSIZE);
	            ShowPlayerDialog(playerid, Graffity_CE_FontSize, DIALOG_STYLE_INPUT, "{FFFFFF}Graffiti - Font Size", graf_string, "Select", "Return");
	        }
	        case 9:
	        {
	            Graffity_SetBold(grafid, !E_GRAFFITY[grafid][gBold]);
	            Graffity_ShowPlayerEditDialog(playerid);
	        }
	    }
	}
	if(dialogid == Graffity_CE_Cancel)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);
	    if (!response)   return Graffity_ShowPlayerEditDialog(playerid);

	    Graffity_DestroyTemporary(grafid);
	    Graffity_ResetPlayer(playerid);
	    SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti creation has been canceled.");
	}
	if(dialogid == Graffity_CE_Done)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);

	    if (!response) return Graffity_ShowPlayerEditDialog(playerid);
	    Graffity_DestroyTemporary(playerid);
	    SetPVarInt(playerid, "Graffity:Spraying", 1);
	    TogglePlayerControllable(playerid, 0);
	    ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.0,1,0,0,0,0);
	    SetPVarInt(playerid, "Graffity:SprayingTime", strlen(E_GRAFFITY[grafid][gText]));
	    SendClientMessage(playerid, COLOR_SYNTAX, "To stop drawing graffiti, enter / gr stop.");
	    SendAdminMessage(COLOR_RED, "AdmWarning: "YELLOW"%s is done doing his graffiti and is waiting for approval. /agr to approve the graffiti. [Graffiti ID: %i]", GetRPName(playerid), grafid);
	}
	if(dialogid == Graffity_CE_Text)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);
	    if (response)
	    {
	        if (strlen(inputtext) > MAX_GRAFFITY_TEXT || strlen(inputtext) < MIN_GRAFFITY_TEXT)
	        {
	            SendMessage(playerid, COLOR_SYNTAX, "Graffiti text with at least %i and at most %i characters.", MIN_GRAFFITY_TEXT, MAX_GRAFFITY_TEXT);

	            new graf_string[256];

	            format(graf_string, sizeof(graf_string), "{FFFFFF}Current text: %s\n\n* The text must contain at least %i and at most %i characters.\n\nEnter new text in the box below:", E_GRAFFITY[grafid][gText], MIN_GRAFFITY_TEXT, MAX_GRAFFITY_TEXT);
	            ShowPlayerDialog(playerid, Graffity_CE_Text, DIALOG_STYLE_INPUT, "{FFFFFF}Graffiti - change text", graf_string, ">>>", "Return");
	            return 1;
	        }

	        Graffity_SetText(grafid, inputtext);
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	    else
	    {
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	}
	if(dialogid == Graffity_CE_Color)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);
	    if (response)
	    {
	        Graffity_SetColor(grafid, GRAFFITY_COLOR[listitem][color_data]);
	        SetPVarInt(playerid, "Graffity:Color", listitem+1);
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	    else
	    {
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	}
	if(dialogid == Graffity_CE_BackColor)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);
	    if (response)
	    {
	        Graffity_SetBackColor(grafid, GRAFFITY_BACK[listitem][color_data]);
	        SetPVarInt(playerid, "Graffity:Back", listitem+1);
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	    else
	    {
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	}
	if(dialogid == Graffity_CE_Font)
	{
		new grafid = Graffity_GetPlayerEdit(playerid);
	    if (response)
	    {
	        Graffity_SetFont(grafid, GRAFFITY_FONT[listitem][font_name]);
	        SetPVarInt(playerid, "Graffity:Font", listitem+1);
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	    else
	    {
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	}
	if(dialogid == Graffity_CE_FontSize)
	{
		new grafid = Graffity_GetPlayerEdit(playerid), fsz = strval(inputtext);
	    if (response)
	    {
	        if (fsz > MAX_GRAFFITY_FONTSIZE || fsz < MIN_GRAFFITY_FONTSIZE)
	        {
	            SendMessage(playerid, COLOR_SYNTAX, "Font size from %i to %i.", MIN_GRAFFITY_FONTSIZE, MAX_GRAFFITY_FONTSIZE);

	            new graf_string[196];

	            format(graf_string, sizeof(graf_string), "{FFFFFF}Current sizeð: %i\n\n* Font size from %i to %i.\n\nEnter the new value in the box below:", E_GRAFFITY[grafid][gFontSize], MIN_GRAFFITY_FONTSIZE, MAX_GRAFFITY_FONTSIZE);
	            ShowPlayerDialog(playerid, Graffity_CE_FontSize, DIALOG_STYLE_INPUT, "{FFFFFF} Graffiti - font size", graf_string, "Select", "Return");
	            return 1;
	        }

	        Graffity_SetFontSize(grafid, fsz);
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	    else
	    {
	        Graffity_ShowPlayerEditDialog(playerid);
	    }
	}
    #if defined Graf_OnDialogResponse
		return Graf_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Graf_OnDialogResponse
#if defined Graf_OnDialogResponse
	forward Graf_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

stock SQL_SetInteger(sql_table[], sql_field[], sql_integer, sql_id)
{
    new sql_query[256];
    mysql_format(connectionID, sql_query, sizeof(sql_query), "UPDATE `%s` SET `%s`=%i WHERE `id`=%i", sql_table, sql_field, sql_integer, sql_id);
    return mysql_tquery(connectionID, sql_query);
}

stock SQL_SetString(sql_table[], sql_field[], sql_string[], sql_id)
{
    new sql_query[256];
    mysql_format(connectionID, sql_query, sizeof(sql_query), "UPDATE `%s` SET `%s`='%e' WHERE `id`=%i", sql_table, sql_field, sql_string, sql_id);
    return mysql_tquery(connectionID, sql_query);
}

forward LoadDynamicGraffities();
public LoadDynamicGraffities()
{
    new rows = cache_num_rows(), total;
    for(new i = 0; i < rows; i++)
    {
        if (i >= MAX_GRAFFITIES) break;
        E_GRAFFITY[i][gID] = cache_get_field_content_int(i, "id");
        cache_get_field_content(i, "text", E_GRAFFITY[i][gText], connectionID, MAX_GRAFFITY_TEXT);
        E_GRAFFITY[i][gColor] = cache_get_field_content_int(i, "color");
        E_GRAFFITY[i][gBackColor] = cache_get_field_content_int(i, "back_color");
        cache_get_field_content(i, "font", E_GRAFFITY[i][gFont], connectionID, 16);
        E_GRAFFITY[i][gFontSize] = cache_get_field_content_int(i, "font_size");
        E_GRAFFITY[i][gBold] = cache_get_field_content_int(i, "bold");
        cache_get_field_content(i, "creator", E_GRAFFITY[i][gCreator], connectionID, 32);
        cache_get_field_content(i, "c_date", E_GRAFFITY[i][gCreateDate], connectionID, 64);
        E_GRAFFITY[i][gPosX] = cache_get_field_content_float(i, "posx");
        E_GRAFFITY[i][gPosY] = cache_get_field_content_float(i, "posy");
        E_GRAFFITY[i][gPosZ] = cache_get_field_content_float(i, "posz");
        E_GRAFFITY[i][gRotX] = cache_get_field_content_float(i, "rotx");
        E_GRAFFITY[i][gRotY] = cache_get_field_content_float(i, "roty");
        E_GRAFFITY[i][gRotZ] = cache_get_field_content_float(i, "rotz");
        E_GRAFFITY[i][gGotoX] = cache_get_field_content_float(i, "gotox");
        E_GRAFFITY[i][gGotoY] = cache_get_field_content_float(i, "gotoy");
        E_GRAFFITY[i][gGotoZ] = cache_get_field_content_float(i, "gotoz");
        E_GRAFFITY[i][gInterior] = cache_get_field_content_int(i, "interior");
        E_GRAFFITY[i][gVW] = cache_get_field_content_int(i, "world");
        E_GRAFFITY[i][gAccepted] = cache_get_field_content_int(i, "accepted");
        cache_get_field_content(i, "acceptor", E_GRAFFITY[i][gAcceptor], connectionID, 32);
        cache_get_field_content(i, "a_date", E_GRAFFITY[i][gAcceptDate], connectionID, 64);

        E_GRAFFITY[i][gON] = 1;
        E_GRAFFITY[i][gEditing] = 0;
        if(E_GRAFFITY[i][gAccepted])
        {

            E_GRAFFITY[i][gObject] = CreateDynamicObject(GRAFFITY_OBJECT_ID, E_GRAFFITY[i][gPosX], E_GRAFFITY[i][gPosY], E_GRAFFITY[i][gPosZ], 0.0, 0.0, E_GRAFFITY[i][gRotZ], E_GRAFFITY[i][gVW], E_GRAFFITY[i][gInterior]);
            SetDynamicObjectMaterial(E_GRAFFITY[i][gObject], 0, 0, "none", "none", 0);
            SetDynamicObjectMaterialText(E_GRAFFITY[i][gObject], 0, E_GRAFFITY[i][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[i][gFont], E_GRAFFITY[i][gFontSize], E_GRAFFITY[i][gBold], E_GRAFFITY[i][gColor], E_GRAFFITY[i][gBackColor], 0);
        }

        total++;
    }
    printf("[MySQL] %i graffities loaded.", rows);
    return 1;
}

Graffity_Nearest(playerid)
{
    for(new i = 0; i < MAX_GRAFFITIES; i++)
    {
        if (E_GRAFFITY[i][gON])
        {
            if (IsPlayerInRangeOfPoint(playerid, 10.0, E_GRAFFITY[i][gPosX], E_GRAFFITY[i][gPosY], E_GRAFFITY[i][gPosZ]) && GetPlayerInterior(playerid) == E_GRAFFITY[i][gInterior] && GetPlayerVirtualWorld(playerid) == E_GRAFFITY[i][gVW])
            {
                return i;
            }
        }
    }
    return -1;
}

Graffity_GetFreeID()
{
    for(new i = 0; i < MAX_GRAFFITIES; i++)
    {
        if (!E_GRAFFITY[i][gON]) return i;
    }
    return -1;
}

Graffity_SetText(g_id, g_text[])
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    format(E_GRAFFITY[g_id][gText], 32, "%s", g_text);
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_SetColor(g_id, g_color)
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    E_GRAFFITY[g_id][gColor] = g_color;
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_SetBackColor(g_id, g_color)
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    E_GRAFFITY[g_id][gBackColor] = g_color;
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_SetFont(g_id, g_font[])
{
    if (!E_GRAFFITY[g_id][gON])  return -1;
    format(E_GRAFFITY[g_id][gFont], 16, "%s", g_font);
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_SetFontSize(g_id, g_fontsize)
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    E_GRAFFITY[g_id][gFontSize] = g_fontsize;
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_SetBold(g_id, g_bold)
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    E_GRAFFITY[g_id][gBold] = g_bold;
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    return 1;
}

Graffity_ResetVariables(g_id)
{
    E_GRAFFITY[g_id][gID] = -1;
    E_GRAFFITY[g_id][gText][0] =
    E_GRAFFITY[g_id][gFont][0] =
    E_GRAFFITY[g_id][gCreator][0] =
    E_GRAFFITY[g_id][gCreateDate][0] =
    E_GRAFFITY[g_id][gAcceptor][0] =
    E_GRAFFITY[g_id][gAcceptDate][0] = EOS;
    E_GRAFFITY[g_id][gColor] =
    E_GRAFFITY[g_id][gBackColor] =
    E_GRAFFITY[g_id][gFontSize] =
    E_GRAFFITY[g_id][gBold] =
    E_GRAFFITY[g_id][gInterior] =
    E_GRAFFITY[g_id][gVW] =
    E_GRAFFITY[g_id][gAccepted] = 0;
    E_GRAFFITY[g_id][gPosX] =
    E_GRAFFITY[g_id][gPosY] =
    E_GRAFFITY[g_id][gPosZ] =
    E_GRAFFITY[g_id][gRotX] =
    E_GRAFFITY[g_id][gRotY] =
    E_GRAFFITY[g_id][gRotZ] =
    E_GRAFFITY[g_id][gGotoX] =
    E_GRAFFITY[g_id][gGotoY] =
    E_GRAFFITY[g_id][gGotoZ] =
    E_GRAFFITY[g_id][gON] = 0;
    E_GRAFFITY[g_id][gObject] = INVALID_OBJECT_ID;
    return 1;
}

GetFullDate()
{
	new date[56], year, month, day, hour, minute, second;

	getdate(year, month, day);
	gettime(hour, minute, second);
	format(date, sizeof(date), "%02d/%02d/%i, %02d:%02d:%02d", day, month, year, hour, minute, second);
	return date;
}

Graffity_Accept(g_id, playerid)
{
    if (!E_GRAFFITY[g_id][gON]) return -1;
    if (E_GRAFFITY[g_id][gAccepted]) return -2;

    E_GRAFFITY[g_id][gAccepted] = 1;
    format(E_GRAFFITY[g_id][gAcceptor], 32, "%s", GetRPName(playerid));
    format(E_GRAFFITY[g_id][gAcceptDate], 64, "%s", GetFullDate());
    SQL_SetInteger("graffities", "accepted", E_GRAFFITY[g_id][gAccepted], g_id);
    SQL_SetString("graffities", "acceptor", E_GRAFFITY[g_id][gAcceptor], g_id);
    SQL_SetString("graffities", "a_date", E_GRAFFITY[g_id][gAcceptDate], g_id);

    if(!IsValidDynamicObject(E_GRAFFITY[g_id][gObject]))
    {
        E_GRAFFITY[g_id][gObject] = CreateDynamicObject(GRAFFITY_OBJECT_ID, E_GRAFFITY[g_id][gPosX], E_GRAFFITY[g_id][gPosY], E_GRAFFITY[g_id][gPosZ], 0.0, 0.0, E_GRAFFITY[g_id][gRotZ]);
        SetDynamicObjectMaterial(E_GRAFFITY[g_id][gObject], 0, 0, "none", "none", 0);
        SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
    }

    if (GetPVarInt(playerid, "Tester:Graffity"))     DeletePVar(playerid, "Tester:Graffity");
    if (GetPVarInt(playerid, "Tester:GraffityTime")) DeletePVar(playerid, "Tester:GraffityTime");
    SendMessage(playerid, COLOR_SYNTAX, "You approved graffiti [ID: %i].", g_id);
    Graffity_Refresh(g_id);
    return 1;
}

Graffity_Decline(g_id, playerid)
{
    if (!E_GRAFFITY[g_id][gON])  return -1;
    if (E_GRAFFITY[g_id][gAccepted]) return -2;

    Graffity_ResetVariables(g_id);

    new query[128];
    mysql_format(connectionID, query, sizeof(query), "DELETE FROM `graffities` WHERE `id` = %i", g_id);
    mysql_tquery(connectionID, query);

    SendMessage(playerid, COLOR_SYNTAX, "You have rejected graffiti [ID: %i].", g_id);
    return 1;
}

Graffity_GetAccepts(playerid)
{
    new acceptid = -1;

    for(new i = 0; i < MAX_GRAFFITIES; i++)
    {
        if (E_GRAFFITY[i][gON])
        {
            if (CompareStrings(E_GRAFFITY[i][gCreator], GetRPName(playerid)))
            {
                if (!E_GRAFFITY[i][gAccepted]) return acceptid;
            }
        }
    }
    return acceptid;
}

Graffity_GetPlayerEdit(playerid)
{
    if (!GetPVarInt(playerid, "Graffity:Edit")) return -1;
    return GetPVarInt(playerid, "Graffity:ID") - 1;
}

Graffity_GetColor(playerid)
{
    if (!GetPVarInt(playerid, "Graffity:Edit")) return -1;
    return GetPVarInt(playerid, "Graffity:Color") - 1;
}

Graffity_GetBackColor(playerid)
{
    if (!GetPVarInt(playerid, "Graffity:Edit")) return -1;
    return GetPVarInt(playerid, "Graffity:Back") - 1;
}

Graffity_GetFont(playerid)
{
    if (!GetPVarInt(playerid, "Graffity:Edit")) return -1;
    return GetPVarInt(playerid, "Graffity:Font")-1;
}

Graffity_CreateTemporary(playerid, g_text[])
{
    new g_id = Graffity_GetFreeID(), Float:gx, Float:gy, Float:gz, Float:x, Float:y, Float:z, Float:angle;

    GetXYInFrontOfPlayerEx(playerid, gx, gy, gz, 1.0);
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, angle);

    E_GRAFFITY[g_id][gObject] = CreateDynamicObject(GRAFFITY_OBJECT_ID, gx, gy, gz, 0.0, 0.0, angle, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    SetDynamicObjectMaterial(E_GRAFFITY[g_id][gObject], 0, 0, "none", "none", 0);
    SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, g_text, OBJECT_MATERIAL_SIZE_256x32, GRAFFITY_FONT[0][font_name], 16, 0, GRAFFITY_COLOR[0][color_data], GRAFFITY_BACK[0][color_data], 0);

    E_GRAFFITY[g_id][gID] = g_id;
    format(E_GRAFFITY[g_id][gText], 32, "%s", g_text);
    E_GRAFFITY[g_id][gColor] = GRAFFITY_COLOR[0][color_data];
    E_GRAFFITY[g_id][gBackColor] = GRAFFITY_BACK[0][color_data];
    format(E_GRAFFITY[g_id][gFont], 16, "%s", GRAFFITY_FONT[0][font_name]);
    E_GRAFFITY[g_id][gFontSize] = 16;
    E_GRAFFITY[g_id][gBold] = 0;
    format(E_GRAFFITY[g_id][gCreator], 32, "%s", GetRPName(playerid));
    format(E_GRAFFITY[g_id][gCreateDate], 64, "%s", GetFullDate());
    E_GRAFFITY[g_id][gPosX] = gx;
    E_GRAFFITY[g_id][gPosY] = gy;
    E_GRAFFITY[g_id][gPosZ] = gz;
    E_GRAFFITY[g_id][gRotX] = 0.0;
    E_GRAFFITY[g_id][gRotY] = 0.0;
    E_GRAFFITY[g_id][gRotZ] = 90.0;
    E_GRAFFITY[g_id][gGotoX] = x;
    E_GRAFFITY[g_id][gGotoY] = y;
    E_GRAFFITY[g_id][gGotoZ] = z;
    E_GRAFFITY[g_id][gInterior] = GetPlayerInterior(playerid);
    E_GRAFFITY[g_id][gVW] = GetPlayerVirtualWorld(playerid);
    E_GRAFFITY[g_id][gAccepted] = 0;
    E_GRAFFITY[g_id][gAcceptor] = EOS;
    E_GRAFFITY[g_id][gAcceptDate] = EOS;
    E_GRAFFITY[g_id][gON] = 1;
    E_GRAFFITY[g_id][gEditing] = 1;

    SetPVarInt(playerid, "Graffity:Edit", 1);
    SetPVarInt(playerid, "Graffity:ID", g_id + 1);
    SetPVarInt(playerid, "Graffity:Color", 1);
    SetPVarInt(playerid, "Graffity:Back", 1);
    SetPVarInt(playerid, "Graffity:Font", 1);

    Graffity_ShowPlayerEditDialog(playerid);

}

Graffity_ShowPlayerEditDialog(playerid)
{
    new msg[1024] = "{FFFFFF}Parameter\t{FFFFFF}Value\n", catmsg[128], bold_state[16], title[32];

    new gcol = Graffity_GetColor(playerid), gback = Graffity_GetBackColor(playerid), gfont = Graffity_GetFont(playerid), g_id = Graffity_GetPlayerEdit(playerid);

    strcat(msg, "Preview\n");
    strcat(msg, "Finish editing\n");
    strcat(msg, "Change the position of the graffiti\n");
    strcat(msg, "Change graffiti text\n");
    strcat(msg, "   \n");
    format(catmsg, sizeof(catmsg), "Graffiti color\t%s%s\n", GRAFFITY_COLOR[gcol][color_dlg], GRAFFITY_COLOR[gcol][color_name]);
    strcat(msg, catmsg);
    format(catmsg, sizeof(catmsg), "{FFFFFF}The background\t%s%s\n", GRAFFITY_BACK[gback][color_dlg], GRAFFITY_BACK[gback][color_name]);
    strcat(msg, catmsg);
    format(catmsg, sizeof(catmsg), "{FFFFFF}Font\t%s\n", GRAFFITY_FONT[gfont][font_name]);
    strcat(msg, catmsg);
    format(catmsg, sizeof(catmsg), "Font size\t%i\n", E_GRAFFITY[g_id][gFontSize]);
    strcat(msg, catmsg);

    if (E_GRAFFITY[g_id][gBold]) format(bold_state, sizeof(bold_state), "%s", RIGHT_YES);
    else                        format(bold_state, sizeof(bold_state), "%s", RIGHT_NO);

    format(catmsg, sizeof(catmsg), "Highlight in bold\t%s", bold_state);
    strcat(msg, catmsg);

    format(title, sizeof(title), "{FFFFFF}Graffiti [ID: %i]", Graffity_GetPlayerEdit(playerid));
    ShowPlayerDialog(playerid, Graffity_CE, DIALOG_STYLE_TABLIST_HEADERS, title, msg, "Select", "Cancel");
    return 1;
}

Graffity_DestroyTemporary(g_id, clear_var = 0)
{
	if (g_id != -1 && E_GRAFFITY[g_id][gON])
	{
		if(IsValidDynamicObject(E_GRAFFITY[g_id][gObject]))
		{
			DestroyDynamicObject(E_GRAFFITY[g_id][gObject]);
		}
	}

    if(clear_var)
    {
    	Graffity_ResetVariables(g_id);
    }

    return 1;
}

Graffity_Destroy(g_id)
{
    if (!E_GRAFFITY[g_id][gON])          return -1;

    if (IsValidDynamicObject(E_GRAFFITY[g_id][gObject]))
			DestroyDynamicObject(E_GRAFFITY[g_id][gObject]);

    Graffity_ResetVariables(g_id);

    new query[128];
    mysql_format(connectionID, query, sizeof(query), "DELETE FROM `graffities` WHERE `id` = %i", g_id);
    mysql_tquery(connectionID, query);
    return 1;
}

Graffity_Insert(g_id)
{
    new query[1024];
    mysql_format(connectionID, query, sizeof(query), "INSERT INTO `graffities` (`id`, `text`, `color`, `back_color`, `font`, `font_size`, `bold`, `creator`, `c_date`, `posx`, `posy`, `posz`, `rotx`, `roty`, `rotz`, `gotox`, `gotoy`, `gotoz`, `interior`, `world`, `accepted`, `acceptor`, `a_date`) VALUES (%i, '%s', %d, %d, '%s', %i, %i, '%s', '%s', %f, %f, %f, %f, %f, %f, %f, %f, %f, %i, %i, 0, '', '')",
    g_id, E_GRAFFITY[g_id][gText], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gCreator], E_GRAFFITY[g_id][gCreateDate], E_GRAFFITY[g_id][gPosX], E_GRAFFITY[g_id][gPosY], E_GRAFFITY[g_id][gPosZ],
    E_GRAFFITY[g_id][gRotX], E_GRAFFITY[g_id][gRotY], E_GRAFFITY[g_id][gRotZ], E_GRAFFITY[g_id][gGotoX], E_GRAFFITY[g_id][gGotoY], E_GRAFFITY[g_id][gGotoZ], E_GRAFFITY[g_id][gInterior], E_GRAFFITY[g_id][gVW]);
    mysql_tquery(connectionID, query);
    return 1;
}

Graffity_ResetPlayer(playerid)
{
    DeletePVar(playerid, "Graffity:Edit");
    DeletePVar(playerid, "Graffity:ID");
    DeletePVar(playerid, "Graffity:Color");
    DeletePVar(playerid, "Graffity:Back");
    DeletePVar(playerid, "Graffity:Font");
    DeletePVar(playerid, "Graffity:Show");
    DeletePVar(playerid, "Graffity:Showing");
    DeletePVar(playerid, "Graffity:BackState");
    DeletePVar(playerid, "Graffity:BackTime");
    DeletePVar(playerid, "Graffity:EditPos");
    DeletePVar(playerid, "Graffity:Spraying");
    DeletePVar(playerid, "Graffity:SprayingTime");
    return 1;
}

Graffity_GetAcceptList(playerid)
{
    new msg[1024] = "{FFFFFF}ID graffiti\t{FFFFFF}Creator\t{FFFFFF}date of creation\n";

    new count = 0;

    for(new i = 0; i < MAX_GRAFFITIES; i++)
    {
        if (count == 10) break;
        if (!E_GRAFFITY[i][gAccepted] && E_GRAFFITY[i][gON] && !E_GRAFFITY[i][gEditing])
        {
            format(msg, sizeof(msg), "%s%i\t%s\t%s\n", msg, i, E_GRAFFITY[i][gCreator], E_GRAFFITY[i][gCreateDate]);
            count++;
        }
    }
    if (count > 0)
    {
        ShowPlayerDialog(playerid, GraffityList, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Graffiti pending", msg, "Close", "");
    }
    else
    {
        SendMessage(playerid, COLOR_SYNTAX, "There are currently no graffiti to consider.");
    }
    return 1;
}

Graffity_PlayerTimer(playerid)
{
    if (GetPVarInt(playerid, "Graffity:Edit"))
    {
        if (GetPVarInt(playerid, "Graffity:Showing"))
        {
            if (GetPVarInt(playerid, "Graffity:Show"))
            {
                SetPVarInt(playerid, "Graffity:Show", GetPVarInt(playerid, "Graffity:Show")-1);
            }
            else
            {
                if (!GetPVarInt(playerid, "Graffity:BackState"))
                {
                    DeletePVar(playerid, "Graffity:Show");
                    DeletePVar(playerid, "Graffity:Showing");
                    Graffity_ShowPlayerEditDialog(playerid);
                }
            }
        }
    }
    if (GetPVarInt(playerid, "Graffity:Edit"))
    {
        new grafid = Graffity_GetPlayerEdit(playerid);
        if (!IsPlayerInRangeOfPoint(playerid, GRAFFITY_DISTANCE_WARN, E_GRAFFITY[grafid][gPosX], E_GRAFFITY[grafid][gPosY], E_GRAFFITY[grafid][gPosZ]) || GetPlayerVirtualWorld(playerid) != E_GRAFFITY[grafid][gVW] || GetPlayerInterior(playerid) != E_GRAFFITY[grafid][gInterior])
        {
            if (!GetPVarInt(playerid, "Graffity:BackState"))
            {
                SetPVarInt(playerid, "Graffity:BackState", 1);
                SetPVarInt(playerid, "Graffity:BackTime", GRAFFITY_DESTROY_TIME);
                SendMessage(playerid, COLOR_SYNTAX, "You have %i seconds to return to the graffiti.", GRAFFITY_DESTROY_TIME);
            }
            else
            {
                if (GetPVarInt(playerid, "Graffity:BackTime"))
                {
                    SetPVarInt(playerid, "Graffity:BackTime", GetPVarInt(playerid, "Graffity:BackTime") - 1);
                }
                else
                {
                    SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti has been canceled. ");
                    Graffity_DestroyTemporary(grafid, 1);

                    Graffity_ResetPlayer(playerid);
                }
            }
        }
        else
        {
            if (GetPVarInt(playerid, "Graffity:BackState"))
            {
                DeletePVar(playerid, "Graffity:BackState");
                DeletePVar(playerid, "Graffity:BackTime");
            }
        }
    }
    if (GetPVarInt(playerid, "Graffity:Spraying"))
    {
        if (GetPVarInt(playerid, "Graffity:SprayingTime"))
        {
            if (!PlayerInfo[playerid][pInjured] || GetPlayerAnimationIndex(playerid) != 1469) {
                SetPVarInt(playerid, "Graffity:SprayingTime", GetPVarInt(playerid, "Graffity:SprayingTime")-1);
                new mes[32];
                format(mes, sizeof(mes), "~y~Spraying the graffiti... %i", GetPVarInt(playerid, "Graffity:SprayingTime"));
                Graffity_DestroyTemporary(Graffity_GetPlayerEdit(playerid), 0);
                GameTextForPlayer(playerid, mes, 1000, 4);
            } else {
                Graffity_DestroyTemporary(Graffity_GetPlayerEdit(playerid), 1);
                Graffity_ResetPlayer(playerid);

                SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti creation has been canceled.");
            }
        }
        else
        {
            new g_id = Graffity_GetPlayerEdit(playerid);
            Graffity_DestroyTemporary(Graffity_GetPlayerEdit(playerid), 0);
            SendClientMessage(playerid, COLOR_SYNTAX, "Your graffiti will appear here when the administration approves.");
            Graffity_ResetPlayer(playerid);
            Graffity_Insert(g_id);
            E_GRAFFITY[g_id][gEditing] = 0;
            TogglePlayerControllable(playerid, 1);
            ClearAnimations(playerid, 1);
        }
    }
    if (GetPVarInt(playerid, "Tester:Graffity"))
    {
        new grafid = GetPVarInt(playerid, "Tester:Graffity")-1;
        if (GetPVarInt(playerid, "Tester:GraffityTime"))
        {
            SetPVarInt(playerid, "Tester:GraffityTime", GetPVarInt(playerid, "Tester:GraffityTime") - 1);
        }
        else
        {
            Graffity_DestroyTemporary(grafid);
            DeletePVar(playerid, "Tester:Graffity");
            DeletePVar(playerid, "Tester:GraffityTime");
            SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti was removed after 10 seconds of viewing. ");
        }
    }
    return 1;
}

Graffity_OnPlayerDisconnect(playerid)
{
    new grafid = Graffity_GetPlayerEdit(playerid);
    if (GetPVarInt(playerid, "Graffity:Edit"))
    {
        Graffity_DestroyTemporary(grafid, 1);
    }
    if (GetPVarInt(playerid, "Graffity:Spraying"))
    {
        Graffity_DestroyTemporary(grafid, 1);
    }
    if (GetPVarInt(playerid, "Tester:Graffity"))
    {
        Graffity_DestroyTemporary(GetPVarInt(playerid, "Tester:Graffity") - 1);
    }
    return 1;
}

Graf_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rz)
{
	new Float:oldX, Float:oldY, Float:oldZ,
	Float:oldRotX, Float:oldRotY, Float:oldRotZ;

    GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

    if (GetPVarInt(playerid, "Graffity:EditPos") && response == EDIT_RESPONSE_CANCEL)
    {
        new graf_id = Graffity_GetPlayerEdit(playerid);

        if (E_GRAFFITY[graf_id][gEditing] && E_GRAFFITY[graf_id][gON] && E_GRAFFITY[graf_id][gObject] == objectid)
        {
            SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
            SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
            Graffity_ShowPlayerEditDialog(playerid);
            DeletePVar(playerid, "Graffity:EditPos");
        }
    }
    else if (GetPVarInt(playerid, "Graffity:EditPos") && response == EDIT_RESPONSE_FINAL)
    {
        new graf_id = Graffity_GetPlayerEdit(playerid);

        if (E_GRAFFITY[graf_id][gEditing] && E_GRAFFITY[graf_id][gON] && E_GRAFFITY[graf_id][gObject] == objectid)
        {
            E_GRAFFITY[graf_id][gPosX] = x;
            E_GRAFFITY[graf_id][gPosY] = y;
            E_GRAFFITY[graf_id][gPosZ] = z;
            E_GRAFFITY[graf_id][gRotZ] = rz;
            Graffity_ShowPlayerEditDialog(playerid);
            DeletePVar(playerid, "Graffity:EditPos");
        }
    }
    return 1;
}

Graffity_OnPlayerDeath(playerid)
{
    if (Graffity_GetPlayerEdit(playerid) != -1 || GetPVarInt(playerid, "Graffity:Spraying"))
    {
        SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti creation has been canceled."); //מעלוא
        Graffity_DestroyTemporary(Graffity_GetPlayerEdit(playerid), 1);
        Graffity_ResetPlayer(playerid);
    }
    return 1;
}

Graffity_Refresh(id)
{
	if (id != -1 && E_GRAFFITY[id][gON])
	{

		if(IsValidDynamicObject(E_GRAFFITY[id][gObject]))
		{
			DestroyDynamicObject(E_GRAFFITY[id][gObject]);
		}

        //GraffitiData[id][graffitiIcon] = CreateDynamicMapIcon(GraffitiData[id][graffitiPos][0], GraffitiData[id][graffitiPos][1], GraffitiData[id][graffitiPos][2], 23, 0, -1, -1, -1, 100.0, MAPICON_GLOBAL);
		E_GRAFFITY[id][gObject] = CreateDynamicObject(GRAFFITY_OBJECT_ID, E_GRAFFITY[id][gPosX], E_GRAFFITY[id][gPosY], E_GRAFFITY[id][gPosZ], 0.0, 0.0, E_GRAFFITY[id][gRotZ], E_GRAFFITY[id][gVW], E_GRAFFITY[id][gInterior]);

		SetDynamicObjectMaterial(E_GRAFFITY[id][gObject], 0, 0, "none", "none", 0);
        SetDynamicObjectMaterialText(E_GRAFFITY[id][gObject], 0, E_GRAFFITY[id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[id][gFont], E_GRAFFITY[id][gFontSize], E_GRAFFITY[id][gBold], E_GRAFFITY[id][gColor], E_GRAFFITY[id][gBackColor], 0);
	}
	return 1;
}

CMD:gr(playerid, params[])
{
    new option[16], parameters[145];
    if (sscanf(params, "s[16]S()[144]", option, parameters))
    {
        SendClientMessage(playerid, COLOR_SYNTAX, "(/gr)affity [create / stop]");
        return 1;
    }
    if(CompareStrings(option, "create"))
    {
        new g_text[33];
        if (sscanf(parameters, "s[32]", g_text))                                         return SendClientMessage(playerid, COLOR_SYNTAX, "/gr create [text]");
        if (strlen(g_text) > MAX_GRAFFITY_TEXT || strlen(g_text) < MIN_GRAFFITY_TEXT)    return SendMessage(playerid, COLOR_SYNTAX, "Min: %i characters, Max: %i characters.", MIN_GRAFFITY_TEXT, MAX_GRAFFITY_TEXT);
        if (Graffity_GetFreeID() == -1)                                                  return SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti limit exceeded. Please try to create graffiti later.");
        if (AntiCheatGetWeapon(playerid) != 41)                                          return SendClientMessage(playerid, COLOR_SYNTAX, "You should have a can in your hands.");
        if (Graffity_GetAccepts(playerid) != -1)
        {
            SendClientMessage(playerid, COLOR_SYNTAX, "You have already created graffiti and it is under consideration.");
            SendClientMessage(playerid, COLOR_SYNTAX, "Wait until the graffiti is rejected or approved before painting a new one.");
            return 1;
        }
        if (Graffity_Nearest(playerid) != -1)        return SendClientMessage(playerid, COLOR_SYNTAX, "There is already graffiti next to you. ");
        if (Graffity_GetPlayerEdit(playerid) != -1)  return SendClientMessage(playerid, COLOR_SYNTAX, "You are already editing graffiti.");
        if (IsPlayerInAnyVehicle(playerid))          return SendClientMessage(playerid, COLOR_SYNTAX, "You must not be in vehicle. ");
        if (PlayerInfo[playerid][pInjured])          return SendClientMessage(playerid, COLOR_SYNTAX, "You cannot paint graffiti while injured / dying. ");

        Graffity_CreateTemporary(playerid, g_text);
        return 1;
    }
    else if (CompareStrings(option, "stop"))
    {
        if (Graffity_GetPlayerEdit(playerid) == -1)      return SendClientMessage(playerid, COLOR_SYNTAX, "You are not editing graffiti. ");
        if (!GetPVarInt(playerid, "Graffity:Spraying"))   return SendClientMessage(playerid, COLOR_SYNTAX, "You don't paint graffiti.");

        SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti creation has been canceled.");
        Graffity_DestroyTemporary(Graffity_GetPlayerEdit(playerid), 1);
        Graffity_ResetPlayer(playerid);
        TogglePlayerControllable(playerid, true);
        ClearAnimations(playerid, 1);
        return 1;
    }
    else
    {
        SendClientMessage(playerid, COLOR_SYNTAX, "(/gr)affity [create / stop]");
    }
    return 1;
}

CMD:agr(playerid, params[]) return callcmd::agreegraffiti(playerid, params);
CMD:agreegraffiti(playerid, params[])
{
	new option[16], parameters[128];
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
		return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if (sscanf(params, "s[16]S()[127]", option, parameters))
	{
		SendClientMessage(playerid, COLOR_SYNTAX, "(/agr)eegraffiti [options]");
		if(PlayerInfo[playerid][pAdmin] < 5)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
		}
		else
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Available Commands: goto, show, accept, decline, info");
		}
	}
	if (CompareStrings(option, "list"))
	{
		return Graffity_GetAcceptList(playerid);
	}
	else if (CompareStrings(option, "goto"))
	{
		new grafid;

		if (sscanf(parameters, "d", grafid)) 															 return SendClientMessage(playerid, COLOR_SYNTAX, "/agreegraffitigoto [ID graffiti]");
		if (grafid < 0 || grafid >= MAX_GRAFFITIES || !E_GRAFFITY[grafid][gON])							 return SendClientMessage(playerid, COLOR_SYNTAX, "No graffiti with this ID found.");
		if (PlayerInfo[playerid][pAdmin] < 5 && E_GRAFFITY[grafid][gAccepted]) return SendClientMessage(playerid, COLOR_SYNTAX, "This graffiti has already been approved. It is impossible to teleport to him.");

		SetPlayerPos(playerid, E_GRAFFITY[grafid][gGotoX], E_GRAFFITY[grafid][gGotoY], E_GRAFFITY[grafid][gGotoZ]);
		SetPlayerInterior(playerid, E_GRAFFITY[grafid][gInterior]);
		SetPlayerVirtualWorld(playerid, E_GRAFFITY[grafid][gVW]);
	}
	else if (CompareStrings(option, "show"))
	{
		new g_id = Graffity_Nearest(playerid);

		if (g_id == -1) 										return SendClientMessage(playerid, COLOR_SYNTAX, "There is no graffiti near you.");
		if (E_GRAFFITY[g_id][gAccepted])						return SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti needs no consideration.");
		if (E_GRAFFITY[g_id][gEditing])							return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is currently being edited. Please wait a while.");
		if (IsValidDynamicObject(E_GRAFFITY[g_id][gObject])) 	return SendClientMessage(playerid, COLOR_SYNTAX, "Graffiti already exists.");

		E_GRAFFITY[g_id][gObject] = CreateDynamicObject(GRAFFITY_OBJECT_ID, E_GRAFFITY[g_id][gPosX], E_GRAFFITY[g_id][gPosY], E_GRAFFITY[g_id][gPosZ], 0.0, 0.0, E_GRAFFITY[g_id][gRotZ], E_GRAFFITY[g_id][gVW], E_GRAFFITY[g_id][gInterior]);
    	SetDynamicObjectMaterial(E_GRAFFITY[g_id][gObject], 0, 0, "none", "none", 0);
    	SetDynamicObjectMaterialText(E_GRAFFITY[g_id][gObject], 0, E_GRAFFITY[g_id][gText], OBJECT_MATERIAL_SIZE_256x32, E_GRAFFITY[g_id][gFont], E_GRAFFITY[g_id][gFontSize], E_GRAFFITY[g_id][gBold], E_GRAFFITY[g_id][gColor], E_GRAFFITY[g_id][gBackColor], 0);
		SetPVarInt(playerid, "Tester:Graffity", g_id+1);
		SetPVarInt(playerid, "Tester:GraffityTime", 10);
		SendClientMessage(playerid, COLOR_SYNTAX, "After 10 seconds, the graffiti will disappear.");
	}
	else if (CompareStrings(option, "accept"))
	{
		new g_id = Graffity_Nearest(playerid);

		if (g_id == -1) 				 return SendClientMessage(playerid, COLOR_SYNTAX, "There is no graffiti near you.");
		if (E_GRAFFITY[g_id][gAccepted]) return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti needs no consideration.");
		if (E_GRAFFITY[g_id][gEditing])	 return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is currently being edited. Please wait a while.");

		Graffity_Accept(g_id, playerid);
		return 1;
	}
	else if (CompareStrings(option, "decline"))
	{
		new g_id = Graffity_Nearest(playerid);

		if (g_id == -1)					 return SendClientMessage(playerid, COLOR_SYNTAX, "There is no graffiti near you.");
		if (E_GRAFFITY[g_id][gAccepted]) return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti needs no consideration.");
		if (E_GRAFFITY[g_id][gEditing])	 return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is currently being edited. Please wait a while.");
		Graffity_Destroy(g_id);
		Graffity_Decline(g_id, playerid);
		return 1;
	}
	else if (CompareStrings(option, "info"))
	{
		new g_id = Graffity_Nearest(playerid);

		if(PlayerInfo[playerid][pAdmin] < 5)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
		}
		if (g_id == -1)												   	return SendClientMessage(playerid, COLOR_SYNTAX, "There is no graffiti near you.");
		if (E_GRAFFITY[g_id][gEditing])								 	return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is currently being edited. Please wait a while.");

		new msg[1024] = "{FFFFFF}", msgcat[128];
		format(msg, sizeof(msg), "{FFFFFF}ID graffiti\t%d\nCreator\t%s\nCreation date\t%s\nFont\t%s\n", g_id, E_GRAFFITY[g_id][gCreator], E_GRAFFITY[g_id][gCreateDate], E_GRAFFITY[g_id][gFont]);
		if (E_GRAFFITY[g_id][gAccepted])
		{
			format(msgcat, sizeof(msgcat), "	\nApproved\t%s\nDate of approval\t%s\n", E_GRAFFITY[g_id][gAcceptor], E_GRAFFITY[g_id][gAcceptDate]); //î
		}
		strcat(msg, msgcat);

		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST, "{FFFFFF}Information about graffiti", msg, "Close", "");
	}
	else if (CompareStrings(option, "destroy"))
	{
		new g_id;

		if(PlayerInfo[playerid][pAdmin] < 5)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
		}
		if (sscanf(parameters, "d", g_id)) 									return SendClientMessage(playerid, COLOR_SYNTAX, "/agreegraffitidestroy [ID graffiti]");
		if (g_id < 0 || g_id >= MAX_GRAFFITIES || !E_GRAFFITY[g_id][gON])	return SendClientMessage(playerid, COLOR_SYNTAX, "No graffiti with this ID found.");
		if (E_GRAFFITY[g_id][gEditing])										return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is currently being edited. Please wait a while.");
		if (!E_GRAFFITY[g_id][gAccepted])									return SendClientMessage(playerid, COLOR_SYNTAX, "The graffiti is not yet approved. If you want to remove it - use /gr decline.");

		Graffity_Destroy(g_id);
		SendMessage(playerid, COLOR_SYNTAX, "You removed the graffiti [ID: %i].", g_id);
	}
	else
	{
		SendClientMessage(playerid, COLOR_SYNTAX, "/agreegraffiti [options]");
		if(PlayerInfo[playerid][pAdmin] < 5)
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Available Commands: goto, show, accept, decline, info");
		}
		else
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "Available Commands: goto, show, accept, decline, info");
		}
	}
	return 1;
}