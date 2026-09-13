forward SavePhoneVariables(playerid);
public SavePhoneVariables(playerid)
{
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phonebattery = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneBattery], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phonebrand = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneBrand], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phoneload = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneLoad], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phoneexpired = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneExpired], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phonecharger = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneCharger], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phonesim = %i WHERE uid = %i", PlayerInfo[playerid][pPhoneSim], PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);
}

forward ResetPhoneVariables(playerid);
public ResetPhoneVariables(playerid)
{
    PlayerInfo[playerid][pPhoneLoad] = 0;
	PlayerInfo[playerid][pPhoneSim] = 0;
	PlayerInfo[playerid][pPhoneBrand] = 0;
	PlayerInfo[playerid][pPhoneBattery] = 0;
	PlayerInfo[playerid][pPhoneCharger] = 0;
	PlayerInfo[playerid][pPhoneExpired] = 0;
    SavePhoneVariables(playerid);
}

GetCellphoneBrand(playerid)
{
	new string[35];
	switch(PlayerInfo[playerid][pPhoneBrand])
	{
	    case 0: string = "None";
	    case 1: string = "Samsung Galaxy";
        case 2: string = "Oppo";
        case 3: string = "Vivo";
        case 4: string = "Realme";
        case 5: string = "IPhone";
	}
	return string;
}

GetCellphoneSim(playerid)
{
	new string[35];
	switch(PlayerInfo[playerid][pPhoneSim])
	{
	    case 0: string = "None";
	    case 1: string = "Dito";
        case 2: string = "Globe";
        case 3: string = "TM";
        case 4: string = "Smart";
        case 5: string = "Tnt";
	}
	return string;
}

IsPlayerAtPhoneStore(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1271.4993,-1550.2538,14.2547) || IsPlayerInRangeOfPoint(playerid, 3.0, 1272.1719,-1533.9674,14.2547)) {
        return 1;
	}
	return 0;
}

CMD:buyphone(playerid, params[])
{
    if(!IsPlayerAtPhoneStore(playerid))
        return SendClientMessage(playerid, COLOR_SYNTAX, "You are not in range of any Cellphone Shop.");

    /*if(PlayerInfo[playerid][pPhoneBrand])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You already have a cellphone wait for it to expire to buy again");*/
        
    new string[128 * 2], header[128];
    strcat(string, "Cellphone Brand:\tPrice:\tExpiration:");
    format(header, sizeof(header), "Cellphone Brand Shop");
    format(string, sizeof(string), "%s\n\
    {FFFFFF}Samsung Galaxy\t$1,500\t15 Days\n\
    {FFFFFF}Vivo\t$1,750\t20 Days\n\
	{FFFFFF}Oppo\t$2,000\t20 Days\n\
    {FFFFFF}Realme\t$2,250\t25 Days\n\
    {FFFFFF}Iphone\t$2,500\t30 Days", string);
    ShowPlayerDialog(playerid, DIALOG_BUY_PHONE, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Buy", "Cancel");
    return 1;
}

CMD:buyload(playerid, params[])
{
    if(!IsPlayerAtPhoneStore(playerid))
        return SendClientMessage(playerid, COLOR_SYNTAX, "You are not in range of any Cellphone Shop.");

    if(!PlayerInfo[playerid][pPhoneBrand])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have any brand of cellphone");
    
    if(!PlayerInfo[playerid][pPhoneSim])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have sim card");
        
    new string[128 * 2], header[128];
    strcat(string, "Load List:\tPrice:");
    format(header, sizeof(header), "Cellphone Brand Shop");
    format(string, sizeof(string), "%s\n\
    {FFFFFF}20 Load Text & Call\t$20\n\
    {FFFFFF}25 Load Text & Call\t$50\n\
    {FFFFFF}35 Load Text & Call\t$100\n\
    {FFFFFF}40 Load Text & Call\t$150\n\
    {FFFFFF}50 Load Text & Call\t$200", string);
    ShowPlayerDialog(playerid, DIALOG_LOAD_PHONE, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Buy", "Cancel");
    return 1;
}

CMD:buysimcard(playerid, params[])
{
    if(!IsPlayerAtPhoneStore(playerid))
        return SendClientMessage(playerid, COLOR_SYNTAX, "You are not in range of any Cellphone Shop.");
        
    if(!PlayerInfo[playerid][pPhoneBrand])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have any brand of cellphone");
        
    new string[128 * 2], header[128];
    strcat(string, "Simcard:\tPrice:");
    format(header, sizeof(header), "Cellphone Brand Shop");
    format(string, sizeof(string), "%s\n\
    {FFFFFF}Dito\t$750\n\
    {FFFFFF}Globe\t$500\n\
    {FFFFFF}TM\t$400\n\
    {FFFFFF}Smart\t$300\n\
    {FFFFFF}Tnt\t$200", string);
    ShowPlayerDialog(playerid, DIALOG_SIM_PHONE, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Buy", "Cancel");
    return 1;
}

CMD:myphone(playerid, params[])
{
    if(!PlayerInfo[playerid][pPhoneBrand])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have any brand of cellphone");
        
    new string[128 * 2], header[128], expiration[32];
	expiration = formatdate(PlayerInfo[playerid][pPhoneExpired], 4);

    strcat(string, "List:\tInfo:");
    format(header, sizeof(header), "Cellphone Brand: %s", GetCellphoneBrand(playerid));
    format(string, sizeof(string), "%s\n\
    {FFFFFF}Expiration\t{FDE364}%s\n\
    {FFFFFF}Number\t{FDE364}%d\n\
    {FFFFFF}Battery\t{FDE364}%d%%\n\
    {FFFFFF}Load\t%d\n\
    {FFFFFF}Sim Card\t%s", 
    string,
    expiration,
    PlayerInfo[playerid][pPhone],
    PlayerInfo[playerid][pPhoneBattery],
    PlayerInfo[playerid][pPhoneLoad],
    GetCellphoneSim(playerid),
    string);
    ShowPlayerDialog(playerid, DIALOG_MAIN_PHONE, DIALOG_STYLE_TABLIST_HEADERS, header, string, "Buy", "Cancel");
    return 1;
}

// Phone Version 2.0
CMD:phone(playerid, params[])
{
    if(!PlayerInfo[playerid][pPhoneBrand])
        return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have any brand of cellphone");

	ShowPlayerPhoneTextdraw(playerid);
    SelectTextDraw(playerid, 0x808080FF);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
    return 1;
}

forward UpdatePlayerPhone(playerid);
public UpdatePlayerPhone(playerid)
{
    new string[128 * 2], date[6], suffix[3], thour, month[12];

    // Phone Date
    getdate(date[2], date[1], date[0]);
    switch (date[1]) {
	    case 1: month = "January";
	    case 2: month = "February";
	    case 3: month = "March";
	    case 4: month = "April";
	    case 5: month = "May";
	    case 6: month = "June";
	    case 7: month = "July";
	    case 8: month = "August";
	    case 9: month = "September";
	    case 10: month = "October";
	    case 11: month = "November";
	    case 12: month = "December";
	}

    format(string, sizeof(string), "%s", month, date[0]);
	PlayerTextDrawSetString(playerid, PhoneTD[playerid][8], string);

    // Phone Time
	gettime(date[3], date[4]);
	date[3] += 8;
	date[3] = shifthour;
	FixHour(date[3]);
	if(date[3] > 12 && date[3] < 24) {
		thour = date[3] - 12;
		suffix = "PM";
	} else if(date[3] == 12) {
		thour = 12;
		suffix = "AM";
	} else if(date[3] > 0 && date[3] < 12) {
		thour = date[3];
		suffix = "AM";
	} else if(date[3] == 0) {
		thour = 12;
		suffix = "AM";
	}
	format(string, sizeof(string), "%d:%02d %s", thour, date[4], suffix);
	PlayerTextDrawSetString(playerid, PhoneTD[playerid][9], string);

    // Phone Charge
    format(string, sizeof(string), "%d", PlayerInfo[playerid][pPhoneBattery]);
	PlayerTextDrawSetString(playerid, PhoneTD[playerid][11], string);
    return 1;
}

stock ShowPlayerPhoneTextdraw(playerid)
{
	// phonesystem
	PhoneTD[playerid][0] = CreatePlayerTextDraw(playerid, 563.000000, 226.000000, "_");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][0], 0.600000, 18.950002);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][0], 298.500000, 105.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][0], 255);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][0], 0);

	PhoneTD[playerid][1] = CreatePlayerTextDraw(playerid, 563.000000, 230.000000, "_");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][1], 0.600000, 16.250043);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][1], 298.500000, 97.500000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][1], 0);

	PhoneTD[playerid][2] = CreatePlayerTextDraw(playerid, 563.000000, 230.000000, "_");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][2], 0.600000, 0.400046);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][2], 298.500000, 97.500000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][2], 1296911871);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][2], 0);

	PhoneTD[playerid][3] = CreatePlayerTextDraw(playerid, 508.000000, 223.000000, "HUD:siterocket");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][3], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][3], 0);

	PhoneTD[playerid][4] = CreatePlayerTextDraw(playerid, 618.000000, 223.000000, "HUD:siterocket");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][4], -17.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][4], 0);

	PhoneTD[playerid][5] = CreatePlayerTextDraw(playerid, 617.000000, 382.000000, "HUD:siterocket");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][5], -17.500000, -16.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][5], 0);

	PhoneTD[playerid][6] = CreatePlayerTextDraw(playerid, 509.000000, 382.000000, "HUD:siterocket");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][6], 14.000000, -16.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][6], 0);

	PhoneTD[playerid][7] = CreatePlayerTextDraw(playerid, 554.000000, 380.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][7], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][7], 1);

	PhoneTD[playerid][8] = CreatePlayerTextDraw(playerid, 513.000000, 226.000000, "May 26, 2023");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][8], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][8], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][8], 0);

	PhoneTD[playerid][9] = CreatePlayerTextDraw(playerid, 554.000000, 226.000000, "12:00pm");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][9], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][9], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][9], 0);

	PhoneTD[playerid][10] = CreatePlayerTextDraw(playerid, 517.000000, 279.000000, "F");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][10], 0.383333, 2.900001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][10], 529.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][10], 16777086);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][10], 1);

	PhoneTD[playerid][11] = CreatePlayerTextDraw(playerid, 598.000000, 226.000000, "100%");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][11], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][11], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][11], 0);

	PhoneTD[playerid][12] = CreatePlayerTextDraw(playerid, 516.000000, 240.000000, "G");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][12], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][12], 0.383333, 2.850001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][12], 528.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][12], 16777215);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][12], 1);

	PhoneTD[playerid][13] = CreatePlayerTextDraw(playerid, 540.000000, 287.000000, "HUD:radar_cash");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][13], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][13], 1);

	PhoneTD[playerid][14] = CreatePlayerTextDraw(playerid, 543.000000, 240.000000, "C");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][14], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][14], 0.383333, 2.900001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][14], 553.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][14], 16777086);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][14], 1);

	PhoneTD[playerid][15] = CreatePlayerTextDraw(playerid, 571.000000, 239.000000, "B");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][15], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][15], 0.383333, 2.900001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][15], 582.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][15], 16777086);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][15], 1);

	PhoneTD[playerid][16] = CreatePlayerTextDraw(playerid, 596.000000, 239.000000, "T");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][16], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][16], 0.383333, 2.900001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][16], 608.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][16], 16777086);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][16], 1);

	PhoneTD[playerid][17] = CreatePlayerTextDraw(playerid, 596.000000, 279.000000, "M");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][17], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][17], 0.383333, 2.900001);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][17], 608.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][17], 16777086);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][17], 1);

	PhoneTD[playerid][18] = CreatePlayerTextDraw(playerid, 567.000000, 289.000000, "HUD:radar_centre");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][18], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][18], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][18], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][18], 1);

	PhoneTD[playerid][19] = CreatePlayerTextDraw(playerid, 515.000000, 262.000000, "Gcash");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][19], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][19], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][19], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][19], 0);

	PhoneTD[playerid][20] = CreatePlayerTextDraw(playerid, 543.000000, 262.000000, "Call");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][20], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][20], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][20], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][20], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][20], 0);

	PhoneTD[playerid][21] = CreatePlayerTextDraw(playerid, 571.000000, 262.000000, "Bank");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][21], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][21], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][21], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][21], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][21], 0);

	PhoneTD[playerid][22] = CreatePlayerTextDraw(playerid, 593.000000, 262.000000, "Twitter");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][22], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][22], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][22], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][22], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][22], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][22], 0);

	PhoneTD[playerid][23] = CreatePlayerTextDraw(playerid, 513.000000, 307.000000, "Facebook");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][23], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][23], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][23], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][23], 0);

	PhoneTD[playerid][24] = CreatePlayerTextDraw(playerid, 543.000000, 307.000000, "ads");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][24], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][24], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][24], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][24], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][24], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][24], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][24], 0);

	PhoneTD[playerid][25] = CreatePlayerTextDraw(playerid, 566.000000, 307.000000, "location");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][25], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][25], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][25], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][25], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][25], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][25], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][25], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][25], 0);

	PhoneTD[playerid][26] = CreatePlayerTextDraw(playerid, 593.000000, 307.000000, "message");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][26], 2);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][26], 0.095833, 1.100000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][26], 751.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][26], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][26], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][26], 50);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][26], 0);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][26], 0);

	PhoneTD[playerid][27] = CreatePlayerTextDraw(playerid, 552.000000, 378.000000, "ld_beat:cring");
	PlayerTextDrawFont(playerid, PhoneTD[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, PhoneTD[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PhoneTD[playerid][27], 20.000000, 21.000000);
	PlayerTextDrawSetOutline(playerid, PhoneTD[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, PhoneTD[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, PhoneTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, PhoneTD[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, PhoneTD[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, PhoneTD[playerid][27], -206);
	PlayerTextDrawUseBox(playerid, PhoneTD[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, PhoneTD[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, PhoneTD[playerid][27], 0);

	//end of phone system
    for(new i = 0; i < 28; i++) PlayerTextDrawShow(playerid, PhoneTD[playerid][i]);

    return 1;
}

stock HidePlayerPhone(playerid)
{
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USECELLPHONE) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
    for(new i = 0; i < 23; i++) PlayerTextDrawHide(playerid, PhoneTD[playerid][i]);
	CancelSelectTextDraw(playerid);
    return 1;
}

stock CallNumber(playerid, number)
{
    if(PlayerInfo[playerid][pCallLine] != INVALID_PLAYER_ID)
    {
        return SendClientMessage(playerid, COLOR_GREY, "You have a call in session. /(h)angup to end that call.");
    }
    if(number == 911)
    {
        PlayerInfo[playerid][pCallLine] = playerid;
        PlayerInfo[playerid][pCallStage] = 911;

        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
        SendClientMessage(playerid, COLOR_DISPATCH, "911, what is your emergency? Enter 'police' or 'medic'.");
        return 1;
    }
    else if(number == 6397)
    {
        PlayerInfo[playerid][pCallLine] = playerid;
        PlayerInfo[playerid][pCallStage] = 6397;

        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
        SendClientMessage(playerid, COLOR_DISPATCH, "This is SANews here. Leave a message and we'll get back to you! *BEEP*");
        return 1;
    }
    else if(number == 6324)
    {
        PlayerInfo[playerid][pCallLine] = playerid;
        PlayerInfo[playerid][pCallStage] = 6324;

        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
        SendClientMessage(playerid, COLOR_DISPATCH, "This is the mechanic hotline. Please explain your situation to us.");
        return 1;
    }
    else if(number == 8294)
    {
        PlayerInfo[playerid][pCallLine] = playerid;
        PlayerInfo[playerid][pCallStage] = 8294;

        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
        SendClientMessage(playerid, COLOR_DISPATCH, "This is the cab company. Please state your location and destination.");
        return 1;
    }
    else if(number == 666)
    {
        SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
        SendClientMessage(playerid, COLOR_WHITE, "* They hung up their phone and ended the call.");
        return 1;
    }
    foreach(new i : Player)
    {
        if(PlayerInfo[i][pPhone] == number)
        {
            if(PlayerInfo[i][pJailType] > 0)
            {
                return SendClientMessage(playerid, COLOR_GREY, "That player is currently imprisoned and cannot use their phone.");
            }
            if(PlayerInfo[i][pCallLine] != INVALID_PLAYER_ID)
            {
                return SendClientMessage(playerid, COLOR_GREY, "This player is currently in a call. Wait until they hang up.");
            }
            if(PlayerInfo[i][pTogglePhone])
            {
                return SendClientMessage(playerid, COLOR_GREY, "That player has their mobile phone switched off.");
            }
            if(PlayerInfo[i][pLiveBroadcast] != INVALID_PLAYER_ID)
            {
                return SendClientMessage(playerid, COLOR_GREY, "That player is currently in a live interview and can't talk on the phone.");
            }
            if(PlayerInfo[playerid][pInjured] > 0)
            {
                return SendClientMessage(playerid, COLOR_GREY, "You are unable to use your cellphone at the moment.");
            }

            PlayerInfo[playerid][pCallLine] = i;
            PlayerInfo[playerid][pCallStage] = 0;

            PlayerInfo[i][pCallLine] = playerid;
            PlayerInfo[i][pCallStage] = 1;

            SendProximityMessage(playerid, 20.0, COLOR_PURPLE, "* %s dials a number on their keypad and begins a call.", GetRPName(playerid));
            SendProximityMessage(i, 20.0, COLOR_PURPLE, "* %s's mobile phone begins to ring.", GetRPName(i));

            SendMessage(playerid, COLOR_YELLOW, "* You've placed a call to number: %i. Please wait for your call to be answered.", number);
            SendMessage(i, COLOR_YELLOW, "* Incoming call from #%i. Use /pickup to take this call.", PlayerInfo[playerid][pPhone]);
            return 1;
        }
    }
    SendClientMessage(playerid, COLOR_GREY, "That number is either not in service or the owner is offline.");
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    new string[3000];
    if(playertextid == PhoneTD[playerid][12]) // Gcash
	{
        SetPVarInt(playerid, "GcashTransaction", 1);
        ShowPlayerDialog(playerid, DIALOG_PHONE_GCASH, DIALOG_STYLE_INPUT, "Phone > Gcash Money", "Please enter the playerid you wanted to send money:", "Send", "Return");
	}
    if(playertextid == PhoneTD[playerid][14]) // Call
	{
        ShowPlayerDialog(playerid, DIALOG_PHONE_CALL, DIALOG_STYLE_INPUT, "Phone > Dial Number", "Special numbers: 911 = Emergency hotline, 6397 = News, 6324 = Mechanic, 8294 = Taxi\nPlease enter the number that you wish to dial below:", "Call", "Return");
	}
    if(playertextid == PhoneTD[playerid][15]) // Checking Cash
	{
        strcat(string, "List:\tValue:");
        format(string, sizeof(string), "%s\n\
        {FFFFFF}Pocket Money\t{FFFFFF}%s\n\
        {FFFFFF}Bank Money\t{FFFFFF}%s", string, number_format(PlayerInfo[playerid][pCash]), number_format(PlayerInfo[playerid][pBank]));
        ShowPlayerDialog(playerid, DIALOG_PHONE_CASH, DIALOG_STYLE_TABLIST_HEADERS, "Phone > Check Cash", string, "Selelct", "Return");
	}
    if(playertextid == PhoneTD[playerid][16]) // Tweeter
	{
        //ShowPlayerDialog(playerid, DIALOG_PHONE_TWEETER, DIALOG_STYLE_INPUT, "Phone > Tweeter Post", "Enter new post message below", "Confirm", "Return");
		SCM(playerid, COLOR_SYNTAX, "Disabled!");
	}
    if(playertextid == PhoneTD[playerid][10]) // Facebook
	{
		SCM(playerid, COLOR_SYNTAX, "Disabled!");
        //ShowPlayerDialog(playerid, DIALOG_PHONE_FACEBOOK, DIALOG_STYLE_INPUT, "Phone > Facebook Post", "Enter new post message below", "Confirm", "Return");
	}
    if(playertextid == PhoneTD[playerid][13]) // Adverisement
	{
        ShowPlayerDialog(playerid, DIALOG_PHONE_ADS, DIALOG_STYLE_INPUT, "Phone > Advertisement", "Enter new advertise message below", "Confirm", "Return");
	}
    if(playertextid == PhoneTD[playerid][18]) // Send Location
	{
        ShowPlayerDialog(playerid, DIALOG_PHONE_LOCATION, DIALOG_STYLE_INPUT, "Phone > Send Location", "Please enter the playerid you wanted to send your location:", "Send", "Return");
	}
    if(playertextid == PhoneTD[playerid][17]) // Messages
	{   
        callcmd::texts(playerid, "\1");
    }
	if(playertextid == PhoneTD[playerid][7]) // Hide Phone
	{
        HidePlayerPhone(playerid);
	}
	#if defined PT_OnPlayerClickPlayerTextDraw
        return PT_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif

#define OnPlayerClickPlayerTextDraw PT_OnPlayerClickPlayerTextDraw
#if defined PT_OnPlayerClickPlayerTextDraw
    forward PT_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
#endif

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
     // Phone System v2.0
    if(dialogid == DIALOG_PHONE_CASH)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_ADS)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            SendMessageToAll(COLOR_GREEN, "{32CD32}[Phone Advertisement]: {FFFFFF}%s {32CD32}Contact: {FFFFFF}%d", inputtext, PlayerInfo[playerid][pPhone]);
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_TWEETER)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            SendMessageToAll(COLOR_ROYALBLUE, "[Tweeter Post]: {FFFFFF}%s, From @%s", inputtext, PlayerInfo[playerid][pPhone], GetRPName(playerid));
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_FACEBOOK)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            SendMessageToAll(COLOR_ROYALBLUE, "[Facebook Post]: %s, From @%s", inputtext, PlayerInfo[playerid][pPhone], GetRPName(playerid));
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_GCASH)
	{
		if(response) 
		{
            if(response)
            {
                if(!IsNumeric(inputtext))
                {
                    return ShowPlayerDialog(playerid, DIALOG_PHONE_GCASH, DIALOG_STYLE_INPUT, "Phone > Gcash", "Please Input the ID of the player that you want to send the money:", "Send","Cancel");
                }
                SetPVarInt(playerid, "GcashID", strval(inputtext));
                ShowPlayerDialog(playerid, DIALOG_PHONE_SEND_GCASH, DIALOG_STYLE_INPUT, "Phone > Gcash", "Please Input the exact ammount that you want to send:", "Send","Cancel");
            }
            else
            {
                DeletePVar(playerid, "GcashID");
                DeletePVar(playerid, "GcashTransaction");
            }
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_SEND_GCASH)
	{
        if(response)
		{
			new params[24];
			format(params, sizeof(params), "%d %s", GetPVarInt(playerid, "GcashID"), inputtext);
	        DeletePVar(playerid, "GcashID");
	        callcmd::gcash(playerid, params);
	        return 1;
		}
		else
		{
			DeletePVar(playerid, "GcashID");
			DeletePVar(playerid, "GcashTransaction");
		}
        HidePlayerPhone(playerid);
    }
    if(dialogid == DIALOG_PHONE_CALL)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            new number = strval(inputtext);
            if(number == 0 || number == PlayerInfo[playerid][pPhone])
            {
                return ShowPlayerDialog(playerid, DIALOG_PHONE_CALL, DIALOG_STYLE_INPUT, "Phone > Dial Number", "Invalid Number!\nSpecial numbers: 911 = Emergency hotline, 6397 = News, 6324 = Mechanic, 8294 = Taxi\nPlease enter the number that you wish to dial below:", "Call", "Back");
            }
            CallNumber(playerid, number);
            HidePlayerPhone(playerid);
        }
    }
    if(dialogid == DIALOG_PHONE_LOCATION)
	{
        if(!response) HidePlayerPhone(playerid);
		if(response) 
		{
            new targetid = strval(inputtext);
            if(!IsNumeric(inputtext))
            {
                return ShowPlayerDialog(playerid, DIALOG_PHONE_GCASH, DIALOG_STYLE_INPUT, "Phone > Gcash", "Please Input the ID of the player that you want to send the money:", "Send","Cancel");
            }
            if(!targetid)
            {
                return ShowPlayerDialog(playerid, DIALOG_PHONE_LOCATION, DIALOG_STYLE_INPUT, "Phone > Send Location", "Invalid playerid!\n\nPlease enter the playerid you wanted to send your location:", "Send", "Back");
            }
            if(targetid == playerid)
            {
                return ShowPlayerDialog(playerid, DIALOG_PHONE_LOCATION, DIALOG_STYLE_INPUT, "Phone > Send Location", "You can't use this on yourself!\n\nPlease enter the playerid you wanted to send your location:", "Send", "Back");
            }
            PlayerInfo[targetid][pSendlocOffer] = playerid;
            SendMessage(targetid, COLOR_LIGHTBLUE, "* %s has initiated a send location with you (/accept location).", GetRPName(playerid));
            SendMessage(playerid, COLOR_LIGHTBLUE, "* You have initiated a send location against %s.", GetRPName(targetid));
            HidePlayerPhone(playerid);
        }
    }
    // Phone System v1.0
	if(dialogid == DIALOG_BUY_PHONE)
	{
		if(response) 
		{
			switch(listitem)
            {
                case 0:
                {
                    PlayerInfo[playerid][pPhone] = random(100000) + 899999;
                    PlayerInfo[playerid][pPhoneBrand] = 1;
                    PlayerInfo[playerid][pPhoneBattery] = 100;
                    PlayerInfo[playerid][pPhoneExpired] = gettime() + (15 * 86400);

                    SavePhoneVariables(playerid);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pID]);
	                mysql_tquery(connectionID, queryBuffer);
	
                    SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Samsung Galaxy Brand!");
                    SendMessage(playerid, COLOR_SYNTAX, "Your new phone number is %i.", PlayerInfo[playerid][pPhone]);

                    SetMissionComplete(playerid, 0);
					GivePlayerCash(playerid, -1500);
                }
                case 1:
                {
	                PlayerInfo[playerid][pPhone] = random(100000) + 899999;
                    PlayerInfo[playerid][pPhoneBrand] = 2;
                    PlayerInfo[playerid][pPhoneBattery] = 100;
                    PlayerInfo[playerid][pPhoneExpired] = gettime() + (18 * 86400);

                    SavePhoneVariables(playerid);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pID]);
	                mysql_tquery(connectionID, queryBuffer);
	
                    SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Oppo Brand!");
                    SendMessage(playerid, COLOR_SYNTAX, "Your new phone number is %i.", PlayerInfo[playerid][pPhone]);

                    SetMissionComplete(playerid, 0);
					GivePlayerCash(playerid, -1750);
                }
                case 2:
                {
	                PlayerInfo[playerid][pPhone] = random(100000) + 899999;
                    PlayerInfo[playerid][pPhoneBrand] = 3;
                    PlayerInfo[playerid][pPhoneBattery] = 100;
                    PlayerInfo[playerid][pPhoneExpired] = gettime() + (20 * 86400);

                    SavePhoneVariables(playerid);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pID]);
	                mysql_tquery(connectionID, queryBuffer);
	
                    SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Vivo Brand!");
                    SendMessage(playerid, COLOR_SYNTAX, "Your new phone number is %i.", PlayerInfo[playerid][pPhone]);

                    SetMissionComplete(playerid, 0);
					GivePlayerCash(playerid, -2000);
                }
                case 3:
                {
	                PlayerInfo[playerid][pPhone] = random(100000) + 899999;
                    PlayerInfo[playerid][pPhoneBrand] = 4;
                    PlayerInfo[playerid][pPhoneBattery] = 100;
                    PlayerInfo[playerid][pPhoneExpired] = gettime() + (25 * 86400);

                    SavePhoneVariables(playerid);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pID]);
	                mysql_tquery(connectionID, queryBuffer);
	
                    SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Realme Brand!");
                    SendMessage(playerid, COLOR_SYNTAX, "Your new phone number is %i.", PlayerInfo[playerid][pPhone]);

                    SetMissionComplete(playerid, 0);
					GivePlayerCash(playerid, -2250);
                }
                case 4:
                {
	                PlayerInfo[playerid][pPhone] = random(100000) + 899999;
                    PlayerInfo[playerid][pPhoneBrand] = 5;
                    PlayerInfo[playerid][pPhoneBattery] = 100;
                    PlayerInfo[playerid][pPhoneExpired] = gettime() + (30 * 86400);

                    SavePhoneVariables(playerid);
                    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET phone = %i WHERE uid = %i", PlayerInfo[playerid][pPhone], PlayerInfo[playerid][pID]);
	                mysql_tquery(connectionID, queryBuffer);
	
                    SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying IPhone Brand!");
                    SendMessage(playerid, COLOR_SYNTAX, "Your new phone number is %i.", PlayerInfo[playerid][pPhone]);

                    SetMissionComplete(playerid, 0);
					GivePlayerCash(playerid, -2500);
                }
            }
        }
    }
    if(dialogid == DIALOG_LOAD_PHONE)
	{
	    if(response) 
		{
			switch(listitem)
	        {
	            case 0:
	            {
	                PlayerInfo[playerid][pPhoneLoad] = 20;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -20);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying 20x text and call load!");
	            }
	            case 1:
	            {
	                PlayerInfo[playerid][pPhoneLoad] = 25;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -50);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying 25x text and call load!");
	            }
				case 2:
	            {
	                PlayerInfo[playerid][pPhoneLoad] = 35;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -100);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying 35x text and call load!");
	            }
				case 3:
	            {
	                PlayerInfo[playerid][pPhoneLoad] = 40;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -150);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying 40x text and call load!");
	            }
				case 4:
	            {
	                PlayerInfo[playerid][pPhoneLoad] = 50;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -200);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying 50x text and call load!");
	            }
	        }
	    }
	}
	if(dialogid == DIALOG_SIM_PHONE)
	{
	    if(response) 
		{
			switch(listitem)
	        {
	            case 0:
	            {
	                PlayerInfo[playerid][pPhoneSim] = 1;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -750);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying DITO sim card");
	            }
	            case 1:
	            {
	                PlayerInfo[playerid][pPhoneSim] = 2;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -500);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Globe sim card");
	            }
				case 2:
	            {
	                PlayerInfo[playerid][pPhoneSim] = 3;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -400);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying TM sim card");
	            }
				case 3:
	            {
	                PlayerInfo[playerid][pPhoneSim] = 4;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -300);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Smart sim card");
	            }
				case 4:
	            {
	                PlayerInfo[playerid][pPhoneSim] = 5;
					SavePhoneVariables(playerid);
					GivePlayerCash(playerid, -200);
					
					SendClientMessage(playerid, COLOR_YELLOW, "Thankyou for buying Tnt sim card");
	            }
	        }
	    }
	}
	#if defined Phone_OnDialogResponse
		return Phone_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Phone_OnDialogResponse
#if defined Phone_OnDialogResponse
	forward Phone_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif