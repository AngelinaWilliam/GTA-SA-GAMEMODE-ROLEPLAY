CMD:myvouchers(playerid, params[])
{
    if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0 || PlayerInfo[playerid][pPaintball])
	    return SendClientMessage(playerid, COLOR_GREY, "You can't use this command at the moment.");

    ShowPlayerVoucher(playerid);
    return 1;
}

ShowPlayerVoucher(playerid)
{
    new string[1028], header[128];

    strcat(string, "Vouchers\tAmount");
    format(header, sizeof(header), "Player '%s' Vouchers | %s", GetRPName(playerid),ReturnDate());
    format(string, sizeof(string), "%s\n\
    {AFAFAF}Car Vouchers:\t{FFFFFF}%d\n\
    {AFAFAF}Rare Car Vouchers:\t{FFFFFF}%d\n\
    {AFAFAF}Restricted Car Vouchers:\t{FFFFFF}%d\n\
    {AFAFAF}7 Days GVIP Vouchers\t{FFFFFF}%d\n\
    {AFAFAF}7 Days DVIP Vouchers\t{FFFFFF}%d\n\
    {AFAFAF}7 Days PVIP Vouchers\t{FFFFFF}%d\n\
    {AFAFAF}1 Month GVIP Vouchers\t{FFFFFF}%d\n\
    {AFAFAF}1 Month DVIP Vouchers\t{FFFFFF}%d\n\
    {AFAFAF}1 Month PVIP Vouchers\t{FFFFFF}%d", string,
    PlayerInfo[playerid][pCarVoucher][0],
    PlayerInfo[playerid][pCarVoucher][1],
    PlayerInfo[playerid][pCarVoucher][2],
    PlayerInfo[playerid][pVIPVoucher][0],
    PlayerInfo[playerid][pVIPVoucher][1],
    PlayerInfo[playerid][pVIPVoucher][2],
    PlayerInfo[playerid][pVIPVoucher][3],
    PlayerInfo[playerid][pVIPVoucher][4],
    PlayerInfo[playerid][pVIPVoucher][5]);
    ShowPlayerDialog(playerid, DIALOG_VOUCHER, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Select", "Close");
    return 1;
}

CMD:setvoucher(playerid, params[])
{
    new targetid, string[128], option[24], param[32], value;

    if(PlayerInfo[playerid][pAdmin] < 6)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "This command requires you to be on admin duty. /aduty to go on duty.");
	}
	if(sscanf(params, "us[24]S()[32]", targetid, option, param))
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /setvoucher [playerid] [option]");
		SendClientMessageEx(playerid, COLOR_GREY, "Available names: CarVoucher, RareCarVoucher, RestrictedCarVoucher, 7DayGVIP, 7DayDVIP, 7DayPVIP, BronzeVIP, SilverVIP, PlatinumVIP");
		return 1;
	}
    if(!strcmp(option, "carvoucher", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [carvoucher] [value]");
		}

        PlayerInfo[targetid][pCarVoucher][0] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_0 = %i WHERE uid = %i", PlayerInfo[targetid][pCarVoucher][0], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx car voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i car vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "rarecarvoucher", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [rarecarvoucher] [value]");
		}

        PlayerInfo[targetid][pCarVoucher][1] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_1 = %i WHERE uid = %i", PlayerInfo[targetid][pCarVoucher][1], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx rare car voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i rare car vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "restrictedcarvoucher", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [rarecarvoucrestrictedcarvoucherher] [value]");
		}

        PlayerInfo[targetid][pCarVoucher][2] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_2 = %i WHERE uid = %i", PlayerInfo[targetid][pCarVoucher][2], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx restricted car voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i restricted car vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "7daygvip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [7daygvip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][0] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_0 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][0], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 7 days gvip voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 7 days gvip vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "7daydvip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [7daydvip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][1] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_1 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][1], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 7 days dvip voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 7 days dvip vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "7daypvip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [7daypvip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][2] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_2 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][2], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 7 days pvip voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 7 days pvip vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "bronzevip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [bronzevip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][3] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_3 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][3], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 1 month gvip voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 1 month gvip vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "silvervip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [silvervip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][4] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_4 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][4], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 1 month DVIP voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 1 month DVIP vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    else if(!strcmp(option, "platinumvip", true))
	{
        if(sscanf(param, "i", value))
	    {
			return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /setvoucher [playerid] [platinumvip] [value]");
		}

        PlayerInfo[targetid][pVIPVoucher][5] += value;
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_5 = %i WHERE uid = %i", PlayerInfo[targetid][pVIPVoucher][5], PlayerInfo[targetid][pID]);
        mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been given %dx 1 month pvip voucher by %s", value, GetPlayerNameEx(playerid));
        SM(playerid, COLOR_GREEN, "You have given %i 1 month pvip vouchers for %s.", value, GetRPName(targetid));
        SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);
	}
    return 1;
}

amount_format(number, amount = 1)
{
    new length, value[32];
    format(value, sizeof(value), "%i", (number < 0) ? (-number) : (number));
    length = strlen(value);

    if(length > 3)
    {
        for(new l = 0, i = length; --i >= 0; l ++)
        {
            if((l % 3 == 0) && l > 0)
            {
                strins(value, ",", i + 1);
            }
        }
    }
    if(amount)
        strins(value, " ", 0);
    if(number < 0)
        strins(value, "-", 0);
    return value;
}

// Normal Car Vehicles
enum cvEnum {
    vModel,
    vCVAmount
}
new const CVoucherMenu[][cvEnum] = {
    {543, 1},
    {466, 1},
    {463, 1},
    {410, 1},
    {401, 1},
    {546, 1},
    {529, 1},
    {540, 1},
    {491, 1},
    {516, 1},
    {507, 1},
    {445, 1},
    {580, 1},
    {405, 1},
    {602, 1},
    {462, 1},
    {468, 1},
    {461, 1},
    {521, 1},
    {581, 1},
    {586, 1}
};

enum rcvEnum {
    vRCModel,
    vRCVAmount
}
new const RCVoucherMenu[][rcvEnum] = {
    {402, 1},
    {411, 1},
    {415, 1},
    {429, 1},
    {451, 1},
    {477, 1},
    {506, 1},
    {565, 1},
    {560, 1},
    {562, 1},
    {535, 1},
    {536, 1},
    {567, 1},
    {534, 1},
    {412, 1}
};

enum rtvEnum {
    vRTModel,
    vRTVAmount
}
new const RTVoucherMenu[][rtvEnum] = {
    {494, 1},
    {502, 1},
    {503, 1},
    {432, 1},
    {427, 1},
    {490, 1},
    {528, 1},
    {596, 1},
    {597, 1},
    {598, 1},
    {599, 1},
    {601, 1},
    {544, 1},
    {523, 1},
    {438, 1},
    {431, 1},
    {420, 1},
    {416, 1},
    {407, 1}
};

forward OnPlayerUseCVoucher(playerid, index);
public OnPlayerUseCVoucher(playerid, index)
{
    new szString[1028], count = cache_get_row_int(0, 0), Float:x, Float:y, Float:z, Float:a;
    if(count >= GetPlayerAssetLimit(playerid, LIMIT_VEHICLES))
    {
        SendMessage(playerid, COLOR_SYNTAX, "You currently own %i/%i vehicles. You can't own anymore unless you upgrade your asset perk.", count, GetPlayerAssetLimit(playerid, LIMIT_VEHICLES));
    }
    else
    {
        GetPlayerPos(playerid, x, y ,z);
        GetPlayerFacingAngle(playerid, a);
        
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO vehicles (ownerid, owner, modelid, price, pos_x, pos_y, pos_z, pos_a) VALUES(%i, '%s', %i, %i,  %f, %f, %f, %f)", PlayerInfo[playerid][pID], GetPlayerNameEx(playerid), CVoucherMenu[index][vModel], CVoucherMenu[index][vCVAmount], x, y, z, a);
        mysql_tquery(connectionID, queryBuffer);

        format(szString, sizeof(szString), "You have successfully used one of your car voucher(s), you have %d car voucher(s) left.", PlayerInfo[playerid][pCarVoucher][0]);
		SendClientMessage(playerid, COLOR_YELLOW, szString);
    }
}

forward OnPlayerUseRCVoucher(playerid, index);
public OnPlayerUseRCVoucher(playerid, index)
{
    new szString[1028], count = cache_get_row_int(0, 0), Float:x, Float:y, Float:z, Float:a;
    if(count >= GetPlayerAssetLimit(playerid, LIMIT_VEHICLES))
    {
        SendMessage(playerid, COLOR_SYNTAX, "You currently own %i/%i vehicles. You can't own anymore unless you upgrade your asset perk.", count, GetPlayerAssetLimit(playerid, LIMIT_VEHICLES));
    }
    else
    {
        GetPlayerPos(playerid, x, y ,z);
        GetPlayerFacingAngle(playerid, a);
        
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO vehicles (ownerid, owner, modelid, price, pos_x, pos_y, pos_z, pos_a) VALUES(%i, '%s', %i, %i,  %f, %f, %f, %f)", PlayerInfo[playerid][pID], GetPlayerNameEx(playerid), RCVoucherMenu[index][vRCModel], RCVoucherMenu[index][vRCVAmount], x, y, z, a);
        mysql_tquery(connectionID, queryBuffer);

        format(szString, sizeof(szString), "You have successfully used one of your rare car voucher(s), you have %d car voucher(s) left.", PlayerInfo[playerid][pCarVoucher][1]);
		SendClientMessage(playerid, COLOR_YELLOW, szString);
    }
}

forward OnPlayerUseRTVoucher(playerid, index);
public OnPlayerUseRTVoucher(playerid, index)
{
    new szString[1028], count = cache_get_row_int(0, 0), Float:x, Float:y, Float:z, Float:a;
    if(count >= GetPlayerAssetLimit(playerid, LIMIT_VEHICLES))
    {
        SendMessage(playerid, COLOR_SYNTAX, "You currently own %i/%i vehicles. You can't own anymore unless you upgrade your asset perk.", count, GetPlayerAssetLimit(playerid, LIMIT_VEHICLES));
    }
    else
    {
        GetPlayerPos(playerid, x, y ,z);
        GetPlayerFacingAngle(playerid, a);
        
        mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO vehicles (ownerid, owner, modelid, price, pos_x, pos_y, pos_z, pos_a) VALUES(%i, '%s', %i, %i,  %f, %f, %f, %f)", PlayerInfo[playerid][pID], GetPlayerNameEx(playerid), RTVoucherMenu[index][vRTModel], RTVoucherMenu[index][vRTVAmount], x, y, z, a);
        mysql_tquery(connectionID, queryBuffer);

        format(szString, sizeof(szString), "You have successfully used one of your restricted vehicle voucher(s), you have %d restricted vehicle voucher(s) left.", PlayerInfo[playerid][pCarVoucher][2]);
		SendClientMessage(playerid, COLOR_YELLOW, szString);
    }
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new string[1028];
    switch(dialogid)
    {
        case DIALOG_VOUCHER:
        {
            if(response) 
			{
				switch(listitem) 
				{
                    case 0:
                    {
                        SetPVarInt(playerid, "voucherdialog", 1);
                        string = "Vehicle\tAmount";
                        for(new i = 0; i < sizeof(CVoucherMenu); i ++) format(string, sizeof(string), "%s\n%s\t%s\t%s", string, vehicleNames[CVoucherMenu[i][vModel] - 400], amount_format(CVoucherMenu[i][vCVAmount]));
                        ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_TABLIST_HEADERS, "Voucher System", string, "Select", "Return");
                    }
                    case 1:
                    {
                        SetPVarInt(playerid, "voucherdialog", 2);
                        string = "Vehicle\tAmount";
                        for(new i = 0; i < sizeof(RCVoucherMenu); i ++) format(string, sizeof(string), "%s\n%s\t%s\t%s", string, vehicleNames[RCVoucherMenu[i][vRCModel] - 400], amount_format(RCVoucherMenu[i][vRCVAmount]));
                        ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_TABLIST_HEADERS, "Voucher System", string, "Select", "Return");
                    }
                    case 2:
                    {
                        SetPVarInt(playerid, "voucherdialog", 3);
                        string = "Vehicle\tAmount";
                        for(new i = 0; i < sizeof(RTVoucherMenu); i ++) format(string, sizeof(string), "%s\n%s\t%s\t%s", string, vehicleNames[RTVoucherMenu[i][vRTModel] - 400], amount_format(RTVoucherMenu[i][vRTVAmount]));
                        ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_TABLIST_HEADERS, "Voucher System", string, "Select", "Return");
                    }
                    case 3:
                    {
                        SetPVarInt(playerid, "voucherdialog", 4);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 7 Days GVIP Voucher?", "Yes", "Return");
                    }
                    case 4:
                    {
                        SetPVarInt(playerid, "voucherdialog", 5);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 7 Days DVIP Voucher?", "Yes", "Return");
                    }
                    case 5:
                    {
                        SetPVarInt(playerid, "voucherdialog", 6);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 7 Days PVIP Voucher?", "Yes", "Return");
                    }
                    case 6:
                    {
                        SetPVarInt(playerid, "voucherdialog", 7);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 1 Month GVIP Voucher?", "Yes", "Return");
                    }
                    case 7:
                    {
                        SetPVarInt(playerid, "voucherdialog", 8);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 1 Month DVIP Voucher?", "Yes", "Return");
                    }
                    case 8:
                    {
                        SetPVarInt(playerid, "voucherdialog", 9);
                        return ShowPlayerDialog(playerid, DIALOG_NEXT_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", "Are you sure you want to use your 1 Month PVIP Voucher?", "Yes", "Return");
                    }
                }
            }
        }
        case DIALOG_NEXT_VOUCHER:
		{
            if(!response) ShowPlayerVoucher(playerid);
			if(response)
			{
				if(PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0 || PlayerInfo[playerid][pPaintball])
				{
					DeletePVar(playerid, "voucherdialog");
					return SendClientMessage(playerid, COLOR_GREY, "You can't use this command at the moment.");
				}
                if(GetPVarInt(playerid, "voucherdialog") == 1) // Car Voucher
                {
                    PlayerInfo[playerid][pSelected] = listitem;
                    format(string, sizeof(string), "Are you sure you want to select this %s for 1x Car Voucher?", vehicleNames[CVoucherMenu[listitem][vModel] - 400], CVoucherMenu[listitem][vCVAmount]);
                    ShowPlayerDialog(playerid, DIALOG_CAR_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", string, "Yes", "Return");
                }
                if(GetPVarInt(playerid, "voucherdialog") == 2) // rare Car Voucher
                {
                    PlayerInfo[playerid][pSelected] = listitem;
                    format(string, sizeof(string), "Are you sure you want to select this %s for 1x Rare Car Voucher?", vehicleNames[RCVoucherMenu[listitem][vRCModel] - 400], RCVoucherMenu[listitem][vRCVAmount]);
                    ShowPlayerDialog(playerid, DIALOG_RARECAR_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", string, "Yes", "Return");
                }
                if(GetPVarInt(playerid, "voucherdialog") == 3) // Restricted Car Voucher
                {
                    PlayerInfo[playerid][pSelected] = listitem;
                    format(string, sizeof(string), "Are you sure you want to select this %s for 1x Restricted Car Voucher?", vehicleNames[RTVoucherMenu[listitem][vRTModel] - 400], RTVoucherMenu[listitem][vRTVAmount]);
                    ShowPlayerDialog(playerid, DIALOG_RESTRICTEDCAR_VOUCHER, DIALOG_STYLE_MSGBOX, "Voucher System", string, "Yes", "Return");
                }
                if(GetPVarInt(playerid, "voucherdialog") == 4) // 7 Days GVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][0]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7D GVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][0]--;
                    PlayerInfo[playerid][pVIPPackage] = 1;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 604800;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 7D GVIP voucher(s), you have %d 7D GVIP voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][0]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Bronze VIP will expire in 7 days.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_0 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][0], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
                if(GetPVarInt(playerid, "voucherdialog") == 5) // 7 Days DVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][1]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7D DVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][1]--;
                    PlayerInfo[playerid][pVIPPackage] = 2;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 604800;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 7D DVIP voucher(s), you have %d 7D DVIP voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][1]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Silver VIP will expire in 7 days.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_1 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][1], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
                if(GetPVarInt(playerid, "voucherdialog") == 6) // 7 Days PVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][2]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7D PVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][2]--;
                    PlayerInfo[playerid][pVIPPackage] = 3;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 604800;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 7D PVIP voucher(s), you have %d 7D PVIP voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][2]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Platinum VIP will expire in 7 days.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_2 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][2], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
                if(GetPVarInt(playerid, "voucherdialog") == 7) // 1 Month GVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][3]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7 Month GVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][3]--;
                    PlayerInfo[playerid][pVIPPackage] = 1;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 2592000;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 1 Month GVIP voucher(s), you have %d 1 Month GVIP voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][3]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Bronze VIP will expire in 1 Month.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_3 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][3], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
                if(GetPVarInt(playerid, "voucherdialog") == 8) // 1 Month DVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][4]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7 Month DVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][4]--;
                    PlayerInfo[playerid][pVIPPackage] = 2;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 2592000;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 1 Month DVIP voucher(s), you have %d 1 Month DVIP voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][4]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Silver VIP will expire in 1 Month.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_4 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][4], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
                if(GetPVarInt(playerid, "voucherdialog") == 9) // 1 Month PVIP
                {
                    if(PlayerInfo[playerid][pVIPVoucher][5]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a 7 Month PVIP Voucher.");
                    
                    PlayerInfo[playerid][pVIPVoucher][5]--;
                    PlayerInfo[playerid][pVIPPackage] = 3;
                    PlayerInfo[playerid][pVIPTime] = gettime() + 2592000;

                    SendMessage(playerid, COLOR_YELLOW, "You have successfully used one of your 1 Month voucher(s), you have %d 1 Month voucher(s) left.", PlayerInfo[playerid][pVIPVoucher][5]);
					SendClientMessage(playerid, COLOR_GREY, "** Note: Your Platinum VIP will expire in 1 Month.");

                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vippackage = %i, viptime = %i, vipcooldown = 0 WHERE uid = %i", PlayerInfo[playerid][pVIPPackage], PlayerInfo[playerid][pVIPTime], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET vipvoucher_5 = %i WHERE uid = %i", PlayerInfo[playerid][pVIPVoucher][5], PlayerInfo[playerid][pID]);
                    mysql_tquery(connectionID, queryBuffer);
                }
            }
        }
        case DIALOG_CAR_VOUCHER:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pCarVoucher][0]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a Car Voucher.");
                listitem = PlayerInfo[playerid][pSelected];
                PlayerInfo[playerid][pCarVoucher][0]--;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_0 = %i WHERE uid = %i", PlayerInfo[playerid][pCarVoucher][0], PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer);
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT COUNT(*) FROM vehicles WHERE ownerid = %i", PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer, "OnPlayerUseCVoucher", "ii", playerid, PlayerInfo[playerid][pSelected]);
            }
        }
        case DIALOG_RARECAR_VOUCHER:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pCarVoucher][1]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a Rare Car Voucher.");
                listitem = PlayerInfo[playerid][pSelected];
                PlayerInfo[playerid][pCarVoucher][1]--;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_1 = %i WHERE uid = %i", PlayerInfo[playerid][pCarVoucher][1], PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer);
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT COUNT(*) FROM vehicles WHERE ownerid = %i", PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer, "OnPlayerUseRCVoucher", "ii", playerid, PlayerInfo[playerid][pSelected]);
            }
        }
        case DIALOG_RESTRICTEDCAR_VOUCHER:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pCarVoucher][2]<= 0) return DeletePVar(playerid, "voucherdialog"), SendClientMessageEx(playerid, COLOR_GREY, "You don't have a Restricted Vehicle Voucher.");
                listitem = PlayerInfo[playerid][pSelected];
                PlayerInfo[playerid][pCarVoucher][2]--;

                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET carvoucher_2 = %i WHERE uid = %i", PlayerInfo[playerid][pCarVoucher][2], PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer);
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT COUNT(*) FROM vehicles WHERE ownerid = %i", PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer, "OnPlayerUseRTVoucher", "ii", playerid, PlayerInfo[playerid][pSelected]);
            }
        }
    }
    #if defined Voucher_OnDialogResponse
		return Voucher_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Voucher_OnDialogResponse
#if defined Voucher_OnDialogResponse
	forward Voucher_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif