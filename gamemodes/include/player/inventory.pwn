new PlayerText:InventoryTD[MAX_PLAYERS][85];

stock ShowInventory(playerid)
{
    for (new i = 0; i < 85; i ++)
	{
		PlayerTextDrawShow(playerid, InventoryTD[playerid][i]);
	}
    return 1;
}

stock HideInventory(playerid)
{
    CancelSelectTextDraw(playerid);
    for (new i = 0; i < 85; i ++)
	{
		PlayerTextDrawHide(playerid, InventoryTD[playerid][i]);
	}
    return 1;
}

public OnPlayerConnect(playerid)
{
    InventoryTD[playerid][0] = CreatePlayerTextDraw(playerid, 315.000000, 129.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][0], 0.600000, 20.300003);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][0], 258.500000, 330.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][0], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][0], 0);

	InventoryTD[playerid][1] = CreatePlayerTextDraw(playerid, 152.000000, 130.000000, "MGCRP ~y~Inventory");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][1], 0.183329, 1.049998);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][1], 0);

	InventoryTD[playerid][2] = CreatePlayerTextDraw(playerid, 315.000000, 148.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][2], 0.600000, -0.449997);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][2], 258.500000, 298.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][2], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][2], 0);

	InventoryTD[playerid][3] = CreatePlayerTextDraw(playerid, 315.000000, 295.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][3], 0.600000, -0.449997);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][3], 258.500000, 298.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][3], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][3], 0);

	InventoryTD[playerid][4] = CreatePlayerTextDraw(playerid, 164.000000, 148.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][4], 0.600000, 15.850006);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][4], 193.500000, -3.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][4], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][4], 0);

	InventoryTD[playerid][5] = CreatePlayerTextDraw(playerid, 466.000000, 148.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][5], 0.600000, 15.850006);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][5], 193.500000, -3.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][5], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][5], 0);

	InventoryTD[playerid][6] = CreatePlayerTextDraw(playerid, 314.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][6], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][6], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][6], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][6], 0);

	InventoryTD[playerid][7] = CreatePlayerTextDraw(playerid, 314.000000, 313.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][7], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][7], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][7], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][7], 0);

	InventoryTD[playerid][8] = CreatePlayerTextDraw(playerid, 290.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][8], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][8], 298.500000, -3.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][8], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][8], 0);

	InventoryTD[playerid][9] = CreatePlayerTextDraw(playerid, 339.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][9], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][9], 297.000000, -4.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][9], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][9], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][9], 0);

	InventoryTD[playerid][10] = CreatePlayerTextDraw(playerid, 302.000000, 298.000000, "Close");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][10], 0.187500, 1.200000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][10], 328.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][10], -1061109710);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][10], 1);

	InventoryTD[playerid][11] = CreatePlayerTextDraw(playerid, 165.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][11], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][11], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][11], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][11], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][11], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][11], 2703);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][11], -56.000000, 0.000000, 4.000000, 1.229997);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][11], 1, 1);

	InventoryTD[playerid][12] = CreatePlayerTextDraw(playerid, 206.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][12], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][12], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][12], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][12], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][12], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][12], 1487);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][12], -35.000000, 0.000000, -12.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][12], 1, 1);

	InventoryTD[playerid][13] = CreatePlayerTextDraw(playerid, 247.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][13], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][13], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][13], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][13], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][13], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][13], 19897);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][13], -41.000000, 0.000000, 145.000000, 0.870000);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][13], 1, 1);

	InventoryTD[playerid][14] = CreatePlayerTextDraw(playerid, 288.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][14], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][14], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][14], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][14], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][14], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][14], 1212);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][14], -34.000000, 0.000000, 145.000000, 1.159999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][14], 1, 1);

	InventoryTD[playerid][15] = CreatePlayerTextDraw(playerid, 329.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][15], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][15], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][15], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][15], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][15], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][15], 11738);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][15], -11.000000, 0.000000, 154.000000, 1.159999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][15], 1, 1);

	InventoryTD[playerid][16] = CreatePlayerTextDraw(playerid, 370.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][16], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][16], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][16], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][16], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][16], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][16], 1241);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][16], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][16], 1, 1);

	InventoryTD[playerid][17] = CreatePlayerTextDraw(playerid, 411.000000, 148.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][17], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][17], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][17], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][17], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][17], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][17], 1577);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][17], -11.000000, 0.000000, 154.000000, 1.499999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][17], 1, 1);

	InventoryTD[playerid][18] = CreatePlayerTextDraw(playerid, 165.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][18], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][18], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][18], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][18], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][18], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][18], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][18], 1576);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][18], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][18], 1, 1);

	InventoryTD[playerid][19] = CreatePlayerTextDraw(playerid, 206.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][19], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][19], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][19], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][19], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][19], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][19], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][19], 1578);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][19], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][19], 1, 1);

	InventoryTD[playerid][20] = CreatePlayerTextDraw(playerid, 247.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][20], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][20], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][20], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][20], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][20], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][20], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][20], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][20], 1310);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][20], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][20], 1, 1);

	InventoryTD[playerid][21] = CreatePlayerTextDraw(playerid, 288.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][21], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][21], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][21], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][21], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][21], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][21], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][21], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][21], 1650);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][21], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][21], 1, 1);

	InventoryTD[playerid][22] = CreatePlayerTextDraw(playerid, 329.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][22], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][22], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][22], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][22], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][22], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][22], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][22], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][22], 19832);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][22], -15.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][22], 1, 1);

	InventoryTD[playerid][23] = CreatePlayerTextDraw(playerid, 370.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][23], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][23], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][23], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][23], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][23], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][23], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][23], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][23], 18644);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][23], -313.000000, 9.000000, 111.000000, 0.979999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][23], 1, 1);

	InventoryTD[playerid][24] = CreatePlayerTextDraw(playerid, 411.000000, 193.500000, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][24], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][24], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][24], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][24], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][24], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][24], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][24], 19515);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][24], -280.000000, -79.000000, 93.000000, 0.979999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][24], 1, 1);

	InventoryTD[playerid][25] = CreatePlayerTextDraw(playerid, 165.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][25], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][25], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][25], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][25], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][25], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][25], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][25], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][25], 1575);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][25], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][25], 1, 1);

	InventoryTD[playerid][26] = CreatePlayerTextDraw(playerid, 206.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][26], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][26], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][26], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][26], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][26], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][26], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][26], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][26], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][26], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][26], 1579);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][26], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][26], 1, 1);

	InventoryTD[playerid][27] = CreatePlayerTextDraw(playerid, 247.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][27], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][27], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][27], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][27], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][27], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][27], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][27], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][27], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][27], 1580);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][27], -11.000000, 0.000000, 154.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][27], 1, 1);

	InventoryTD[playerid][28] = CreatePlayerTextDraw(playerid, 288.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][28], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][28], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][28], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][28], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][28], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][28], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][28], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][28], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][28], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][28], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][28], 19570);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][28], -31.000000, 0.000000, 53.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][28], 1, 1);

	InventoryTD[playerid][29] = CreatePlayerTextDraw(playerid, 329.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][29], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][29], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][29], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][29], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][29], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][29], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][29], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][29], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][29], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][29], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][29], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][29], 1668);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][29], -11.000000, 0.000000, 219.000000, 1.539999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][29], 1, 1);

	InventoryTD[playerid][30] = CreatePlayerTextDraw(playerid, 370.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][30], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][30], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][30], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][30], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][30], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][30], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][30], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][30], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][30], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][30], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][30], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][30], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][30], 1550);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][30], -28.000000, 0.000000, 279.000000, 1.459998);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][30], 1, 1);

	InventoryTD[playerid][31] = CreatePlayerTextDraw(playerid, 411.000000, 238.998992, "Preview_Model");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][31], 5);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][31], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][31], 40.000000, 44.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][31], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][31], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][31], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][31], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][31], 1296911871);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][31], 255);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][31], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][31], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][31], 1);
	PlayerTextDrawSetPreviewModel(playerid, InventoryTD[playerid][31], 365);
	PlayerTextDrawSetPreviewRot(playerid, InventoryTD[playerid][31], 31.000000, -19.000000, 62.000000, 0.779999);
	PlayerTextDrawSetPreviewVehCol(playerid, InventoryTD[playerid][31], 1, 1);

	InventoryTD[playerid][32] = CreatePlayerTextDraw(playerid, 453.000000, 148.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][32], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][32], 0.600000, 15.850006);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][32], 193.500000, -3.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][32], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][32], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][32], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][32], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][32], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][32], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][32], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][32], 0);

	InventoryTD[playerid][33] = CreatePlayerTextDraw(playerid, 210.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][33], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][33], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][33], 297.000000, -4.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][33], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][33], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][33], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][33], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][33], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][33], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][33], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][33], 0);

	InventoryTD[playerid][34] = CreatePlayerTextDraw(playerid, 259.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][34], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][34], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][34], 297.000000, -4.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][34], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][34], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][34], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][34], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][34], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][34], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][34], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][34], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][34], 0);

	InventoryTD[playerid][35] = CreatePlayerTextDraw(playerid, 235.000000, 313.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][35], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][35], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][35], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][35], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][35], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][35], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][35], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][35], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][35], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][35], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][35], 0);

	InventoryTD[playerid][36] = CreatePlayerTextDraw(playerid, 235.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][36], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][36], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][36], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][36], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][36], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][36], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][36], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][36], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][36], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][36], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][36], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][36], 0);

	InventoryTD[playerid][37] = CreatePlayerTextDraw(playerid, 369.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][37], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][37], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][37], 297.000000, -4.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][37], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][37], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][37], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][37], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][37], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][37], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][37], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][37], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][37], 0);

	InventoryTD[playerid][38] = CreatePlayerTextDraw(playerid, 394.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][38], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][38], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][38], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][38], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][38], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][38], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][38], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][38], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][38], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][38], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][38], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][38], 0);

	InventoryTD[playerid][39] = CreatePlayerTextDraw(playerid, 418.000000, 300.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][39], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][39], 0.600000, 1.000005);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][39], 297.000000, -4.500000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][39], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][39], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][39], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][39], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][39], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][39], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][39], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][39], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][39], 0);

	InventoryTD[playerid][40] = CreatePlayerTextDraw(playerid, 394.000000, 313.000000, "_");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][40], 1);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][40], 0.600000, -0.449995);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][40], 298.500000, 45.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][40], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][40], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][40], 2);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][40], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][40], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][40], -1094795521);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][40], 1);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][40], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][40], 0);

	InventoryTD[playerid][41] = CreatePlayerTextDraw(playerid, 225.000000, 299.000000, "<<<");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][41], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][41], 0.187500, 1.200000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][41], 255.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][41], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][41], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][41], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][41], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][41], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][41], -1061109710);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][41], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][41], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][41], 1);

	InventoryTD[playerid][42] = CreatePlayerTextDraw(playerid, 386.000000, 299.000000, ">>>");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][42], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][42], 0.187500, 1.200000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][42], 414.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][42], 1);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][42], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][42], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][42], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][42], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][42], -1061109710);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][42], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][42], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][42], 1);

	InventoryTD[playerid][43] = CreatePlayerTextDraw(playerid, 166.000000, 148.000000, "~y~Food");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][43], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][43], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][43], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][43], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][43], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][43], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][43], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][43], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][43], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][43], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][43], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][43], 0);

	InventoryTD[playerid][44] = CreatePlayerTextDraw(playerid, 207.000000, 148.000000, "~y~Drink");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][44], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][44], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][44], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][44], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][44], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][44], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][44], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][44], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][44], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][44], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][44], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][44], 0);

	InventoryTD[playerid][45] = CreatePlayerTextDraw(playerid, 248.000000, 148.000000, "~y~cigarette");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][45], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][45], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][45], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][45], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][45], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][45], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][45], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][45], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][45], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][45], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][45], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][45], 0);

	InventoryTD[playerid][46] = CreatePlayerTextDraw(playerid, 289.000000, 148.000000, "~y~Cash");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][46], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][46], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][46], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][46], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][46], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][46], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][46], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][46], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][46], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][46], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][46], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][46], 0);

	InventoryTD[playerid][47] = CreatePlayerTextDraw(playerid, 331.000000, 148.000000, "~y~Medkit");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][47], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][47], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][47], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][47], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][47], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][47], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][47], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][47], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][47], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][47], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][47], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][47], 0);

	InventoryTD[playerid][48] = CreatePlayerTextDraw(playerid, 372.000000, 148.000000, "~y~Painkiller");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][48], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][48], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][48], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][48], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][48], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][48], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][48], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][48], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][48], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][48], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][48], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][48], 0);

	InventoryTD[playerid][49] = CreatePlayerTextDraw(playerid, 413.000000, 148.000000, "~y~Pot");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][49], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][49], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][49], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][49], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][49], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][49], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][49], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][49], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][49], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][49], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][49], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][49], 0);

	InventoryTD[playerid][50] = CreatePlayerTextDraw(playerid, 166.000000, 193.000000, "~y~Crack");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][50], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][50], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][50], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][50], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][50], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][50], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][50], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][50], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][50], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][50], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][50], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][50], 0);

	InventoryTD[playerid][51] = CreatePlayerTextDraw(playerid, 207.000000, 193.000000, "~y~Meth");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][51], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][51], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][51], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][51], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][51], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][51], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][51], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][51], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][51], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][51], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][51], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][51], 0);

	InventoryTD[playerid][52] = CreatePlayerTextDraw(playerid, 249.000000, 193.000000, "~y~Backpack");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][52], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][52], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][52], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][52], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][52], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][52], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][52], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][52], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][52], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][52], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][52], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][52], 0);

	InventoryTD[playerid][53] = CreatePlayerTextDraw(playerid, 290.000000, 193.000000, "~y~Gascan");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][53], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][53], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][53], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][53], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][53], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][53], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][53], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][53], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][53], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][53], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][53], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][53], 0);

	InventoryTD[playerid][54] = CreatePlayerTextDraw(playerid, 331.000000, 193.000000, "~y~Repairkit");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][54], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][54], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][54], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][54], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][54], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][54], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][54], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][54], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][54], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][54], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][54], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][54], 0);

	InventoryTD[playerid][55] = CreatePlayerTextDraw(playerid, 372.000000, 193.000000, "~y~Toolkit");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][55], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][55], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][55], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][55], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][55], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][55], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][55], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][55], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][55], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][55], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][55], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][55], 0);

	InventoryTD[playerid][56] = CreatePlayerTextDraw(playerid, 413.000000, 193.000000, "~y~Vest");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][56], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][56], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][56], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][56], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][56], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][56], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][56], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][56], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][56], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][56], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][56], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][56], 0);

	InventoryTD[playerid][57] = CreatePlayerTextDraw(playerid, 166.000000, 240.000000, "~y~Materials");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][57], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][57], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][57], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][57], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][57], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][57], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][57], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][57], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][57], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][57], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][57], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][57], 0);

	InventoryTD[playerid][58] = CreatePlayerTextDraw(playerid, 207.000000, 240.000000, "~y~Ephedrine");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][58], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][58], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][58], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][58], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][58], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][58], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][58], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][58], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][58], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][58], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][58], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][58], 0);

	InventoryTD[playerid][59] = CreatePlayerTextDraw(playerid, 249.000000, 240.000000, "~y~Seed");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][59], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][59], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][59], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][59], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][59], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][59], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][59], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][59], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][59], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][59], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][59], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][59], 0);

	InventoryTD[playerid][60] = CreatePlayerTextDraw(playerid, 290.000000, 240.000000, "~y~Baking Soad");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][60], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][60], 0.116663, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][60], 325.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][60], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][60], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][60], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][60], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][60], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][60], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][60], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][60], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][60], 0);

	InventoryTD[playerid][61] = CreatePlayerTextDraw(playerid, 331.000000, 240.000000, "~y~Muriatic Acid");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][61], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][61], 0.116663, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][61], 380.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][61], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][61], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][61], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][61], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][61], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][61], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][61], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][61], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][61], 0);

	InventoryTD[playerid][62] = CreatePlayerTextDraw(playerid, 372.000000, 240.000000, "~y~Dirty Cash");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][62], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][62], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][62], 406.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][62], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][62], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][62], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][62], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][62], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][62], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][62], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][62], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][62], 0);

	InventoryTD[playerid][63] = CreatePlayerTextDraw(playerid, 414.000000, 240.000000, "~y~Spraycan");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][63], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][63], 0.129166, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][63], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][63], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][63], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][63], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][63], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][63], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][63], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][63], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][63], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][63], 0);

	InventoryTD[playerid][64] = CreatePlayerTextDraw(playerid, 166.000000, 155.000000, "8/~r~8");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][64], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][64], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][64], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][64], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][64], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][64], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][64], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][64], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][64], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][64], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][64], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][64], 0);

	InventoryTD[playerid][65] = CreatePlayerTextDraw(playerid, 208.000000, 155.000000, "8/~r~8");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][65], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][65], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][65], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][65], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][65], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][65], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][65], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][65], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][65], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][65], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][65], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][65], 0);

	InventoryTD[playerid][66] = CreatePlayerTextDraw(playerid, 248.000000, 155.000000, "20/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][66], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][66], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][66], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][66], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][66], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][66], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][66], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][66], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][66], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][66], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][66], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][66], 0);

	InventoryTD[playerid][67] = CreatePlayerTextDraw(playerid, 289.000000, 155.000000, "999,999,999");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][67], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][67], 0.116663, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][67], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][67], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][67], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][67], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][67], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][67], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][67], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][67], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][67], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][67], 0);

	InventoryTD[playerid][68] = CreatePlayerTextDraw(playerid, 331.000000, 155.000000, "1/~r~3");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][68], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][68], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][68], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][68], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][68], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][68], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][68], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][68], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][68], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][68], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][68], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][68], 0);

	InventoryTD[playerid][69] = CreatePlayerTextDraw(playerid, 371.000000, 155.000000, "1/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][69], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][69], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][69], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][69], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][69], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][69], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][69], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][69], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][69], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][69], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][69], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][69], 0);

	InventoryTD[playerid][70] = CreatePlayerTextDraw(playerid, 413.000000, 155.000000, "100/~r~100");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][70], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][70], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][70], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][70], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][70], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][70], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][70], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][70], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][70], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][70], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][70], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][70], 0);

	InventoryTD[playerid][71] = CreatePlayerTextDraw(playerid, 166.000000, 200.000000, "50/~r~50");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][71], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][71], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][71], 202.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][71], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][71], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][71], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][71], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][71], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][71], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][71], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][71], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][71], 0);

	InventoryTD[playerid][72] = CreatePlayerTextDraw(playerid, 207.000000, 200.000000, "50/~r~50");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][72], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][72], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][72], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][72], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][72], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][72], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][72], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][72], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][72], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][72], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][72], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][72], 0);

	InventoryTD[playerid][73] = CreatePlayerTextDraw(playerid, 249.000000, 200.000000, "1/~r~1");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][73], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][73], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][73], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][73], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][73], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][73], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][73], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][73], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][73], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][73], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][73], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][73], 0);

	InventoryTD[playerid][74] = CreatePlayerTextDraw(playerid, 290.000000, 200.000000, "20/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][74], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][74], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][74], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][74], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][74], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][74], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][74], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][74], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][74], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][74], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][74], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][74], 0);

	InventoryTD[playerid][75] = CreatePlayerTextDraw(playerid, 331.000000, 200.000000, "1/~r~3");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][75], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][75], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][75], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][75], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][75], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][75], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][75], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][75], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][75], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][75], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][75], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][75], 0);

	InventoryTD[playerid][76] = CreatePlayerTextDraw(playerid, 372.000000, 200.000000, "1/~r~2");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][76], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][76], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][76], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][76], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][76], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][76], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][76], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][76], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][76], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][76], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][76], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][76], 0);

	InventoryTD[playerid][77] = CreatePlayerTextDraw(playerid, 413.000000, 200.000000, "2/~r~2");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][77], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][77], 0.137500, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][77], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][77], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][77], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][77], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][77], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][77], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][77], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][77], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][77], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][77], 0);

	InventoryTD[playerid][78] = CreatePlayerTextDraw(playerid, 166.000000, 247.000000, "10000/~r~10000");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][78], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][78], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][78], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][78], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][78], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][78], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][78], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][78], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][78], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][78], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][78], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][78], 0);

	InventoryTD[playerid][79] = CreatePlayerTextDraw(playerid, 208.000000, 247.000000, "50/~r~50");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][79], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][79], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][79], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][79], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][79], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][79], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][79], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][79], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][79], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][79], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][79], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][79], 0);

	InventoryTD[playerid][80] = CreatePlayerTextDraw(playerid, 249.000000, 247.000000, "100/~r~100");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][80], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][80], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][80], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][80], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][80], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][80], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][80], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][80], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][80], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][80], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][80], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][80], 0);

	InventoryTD[playerid][81] = CreatePlayerTextDraw(playerid, 289.000000, 247.000000, "20/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][81], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][81], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][81], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][81], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][81], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][81], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][81], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][81], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][81], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][81], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][81], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][81], 0);

	InventoryTD[playerid][82] = CreatePlayerTextDraw(playerid, 331.000000, 247.000000, "20/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][82], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][82], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][82], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][82], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][82], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][82], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][82], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][82], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][82], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][82], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][82], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][82], 0);

	InventoryTD[playerid][83] = CreatePlayerTextDraw(playerid, 371.000000, 247.000000, "999,999,999");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][83], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][83], 0.116663, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][83], 451.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][83], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][83], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][83], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][83], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][83], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][83], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][83], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][83], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][83], 0);

	InventoryTD[playerid][84] = CreatePlayerTextDraw(playerid, 413.000000, 247.000000, "20/~r~20");
	PlayerTextDrawFont(playerid, InventoryTD[playerid][84], 2);
	PlayerTextDrawLetterSize(playerid, InventoryTD[playerid][84], 0.120833, 0.850000);
	PlayerTextDrawTextSize(playerid, InventoryTD[playerid][84], 462.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, InventoryTD[playerid][84], 0);
	PlayerTextDrawSetShadow(playerid, InventoryTD[playerid][84], 0);
	PlayerTextDrawAlignment(playerid, InventoryTD[playerid][84], 1);
	PlayerTextDrawColor(playerid, InventoryTD[playerid][84], -1);
	PlayerTextDrawBackgroundColor(playerid, InventoryTD[playerid][84], 255);
	PlayerTextDrawBoxColor(playerid, InventoryTD[playerid][84], 50);
	PlayerTextDrawUseBox(playerid, InventoryTD[playerid][84], 0);
	PlayerTextDrawSetProportional(playerid, InventoryTD[playerid][84], 1);
	PlayerTextDrawSetSelectable(playerid, InventoryTD[playerid][84], 0);
    #if defined Inv_OnPlayerConnect
		return Inv_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect Inv_OnPlayerConnect
#if defined Inv_OnPlayerConnect
	forward Inv_OnPlayerConnect(playerid);
#endif

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_INVPOT:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::usedrug(playerid, "pot");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVEPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVCRACK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::usedrug(playerid, "crack");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVECRACK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVMETH:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::usedrug(playerid, "meth");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVEMETH, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVPK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::usedrug(playerid, "painkillers");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVEPK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVFOOD:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::eat(playerid, "");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVEFOOD, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        SendMessage(playerid, COLOR_YELLOW, "You can't sell this ITEM");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVDRINK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::drink(playerid, "");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVEDRINK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        SendMessage(playerid, COLOR_YELLOW, "You can't sell this ITEM");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVRK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                switch(listitem)
				{
					case 0:
					{
                        callcmd::use(playerid, "repairkit");
                        ShowInventory(playerid);
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_INVGIVERK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID and the amount. Format: [(playerid) (amount)].", "Enter", "Cancel");
                        ShowInventory(playerid);
                    }
                    case 2:
                    {
                        SendMessage(playerid, COLOR_YELLOW, "You can't sell this ITEM");
                        ShowInventory(playerid);
                    }
				}
			}
        }
        case DIALOG_INVGIVEPOT:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEPOT, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pPot])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pPot] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more pot.");
			    }

			    PlayerInfo[playerid][pPot] -= amount;
			    PlayerInfo[targetid][pPot] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", PlayerInfo[playerid][pPot], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET pot = %i WHERE uid = %i", PlayerInfo[targetid][pPot], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i grams of pot.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i grams of pot to %s.", amount, GetRPName(targetid));
			    ShowInventory(playerid);

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some pot to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i grams of pot to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVSELLPOT:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount, price;
                if(sscanf(inputtext, "iii", targetid, amount, price))
	            {
					ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID of the player you want to sell this item.", "Enter", "Cancel");
					SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
					return 1;
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
            	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
             	}
                if(amount < 1 || amount > PlayerInfo[playerid][pPot])
	         	{
	         	    SendClientMessage(playerid, COLOR_SYNTAX, "Insufficient amount.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
	         	    return 1;
	        	}
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
	            	return 1;
	        	}
	        	if(targetid == playerid)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
	            	return 1;
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(price < 1)
         		{
	        	    SendClientMessage(playerid, COLOR_SYNTAX, "The price can't be below $1.");
	        	    ShowPlayerDialog(playerid, DIALOG_INVSELLPOT, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID, amount and price. Format: [(playerid) (amount) (price)].", "Enter", "Cancel");
	        	    return 1;
	        	}
	        	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
             	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
            	}

		    	PlayerInfo[playerid][pLastSell] = gettime();
		    	PlayerInfo[targetid][pSellOffer] = playerid;
		    	PlayerInfo[targetid][pSellType] = ITEM_WEED;
		    	PlayerInfo[targetid][pSellExtra] = amount;
		    	PlayerInfo[targetid][pSellPrice] = price;
		    	ShowInventory(playerid);

		    	SendMessage(targetid, COLOR_WHITE, "** %s offered to sell you %i grams of pot for $%i. (/accept item)", GetRPName(playerid), amount, price);
		    	SendMessage(playerid, COLOR_WHITE, "** You have offered to sell %s your %i grams of pot for $%i.", GetRPName(targetid), amount, price);
			}
        }
        case DIALOG_INVGIVECRACK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVECRACK, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pCrack])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pCrack] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more crack.");
			    }

			    PlayerInfo[playerid][pCrack] -= amount;
			    PlayerInfo[targetid][pCrack] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crack = %i WHERE uid = %i", PlayerInfo[playerid][pCrack], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET crack = %i WHERE uid = %i", PlayerInfo[targetid][pCrack], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i grams of crack.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i grams of crack to %s.", amount, GetRPName(targetid));

			    ShowInventory(playerid);

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some crack to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i grams of crack to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVSELLCRACK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount, price;
                if(sscanf(inputtext, "iii", targetid, amount, price))
	            {
					ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID of the player you want to sell this item.", "Enter", "Cancel");
					SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
					return 1;
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
            	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
             	}
                if(amount < 1 || amount > PlayerInfo[playerid][pCrack])
	         	{
	         	    SendClientMessage(playerid, COLOR_SYNTAX, "Insufficient amount.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price) ] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	         	    return 1;
	        	}
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK, DIALOG_STYLE_INPUT, "Inventory", "[Format: (amount) (price)] Enter the amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
	        	if(targetid == playerid)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price) ] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(price < 1)
         		{
	        	    SendClientMessage(playerid, COLOR_SYNTAX, "The price can't be below $1.");
	        	    ShowPlayerDialog(playerid, DIALOG_INVSELLCRACK2, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price) ] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	        	    return 1;
	        	}
	        	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
             	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
            	}

		    	PlayerInfo[playerid][pLastSell] = gettime();
		    	PlayerInfo[targetid][pSellOffer] = playerid;
		    	PlayerInfo[targetid][pSellType] = ITEM_COCAINE;
		    	PlayerInfo[targetid][pSellExtra] = amount;
		    	PlayerInfo[targetid][pSellPrice] = price;

		    	ShowInventory(playerid);

		    	SendMessage(targetid, COLOR_WHITE, "** %s offered to sell you %i grams of Crack for $%i. (/accept item)", GetRPName(playerid), amount, price);
		    	SendMessage(playerid, COLOR_WHITE, "** You have offered to sell %s your %i grams of Crack for $%i.", GetRPName(targetid), amount, price);
			}
        }
        case DIALOG_INVGIVEMETH:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEMETH, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(amount < 1 || amount > PlayerInfo[playerid][pMeth])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pMeth] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more meth.");
			    }

			    PlayerInfo[playerid][pMeth] -= amount;
			    PlayerInfo[targetid][pMeth] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET meth = %i WHERE uid = %i", PlayerInfo[playerid][pMeth], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET meth = %i WHERE uid = %i", PlayerInfo[targetid][pMeth], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    ShowInventory(playerid);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i grams of meth.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i grams of meth to %s.", amount, GetRPName(targetid));

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some meth to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i grams of meth to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVSELLMETH:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount, price;
                if(sscanf(inputtext, "iii", targetid, amount, price))
	            {
					ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID of the player you want to sell this item.", "Enter", "Cancel");
					SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
					return 1;
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
            	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
             	}
                if(amount < 1 || amount > PlayerInfo[playerid][pMeth])
	         	{
	         	    SendClientMessage(playerid, COLOR_SYNTAX, "Insufficient amount.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	         	    return 1;
	        	}
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
	        	if(targetid == playerid)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(price < 1)
         		{
	        	    SendClientMessage(playerid, COLOR_SYNTAX, "The price can't be below $1.");
	        	    ShowPlayerDialog(playerid, DIALOG_INVSELLMETH, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	        	    return 1;
	        	}
	        	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
             	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
            	}

		    	PlayerInfo[playerid][pLastSell] = gettime();
		    	PlayerInfo[targetid][pSellOffer] = playerid;
		    	PlayerInfo[targetid][pSellType] = ITEM_METH;
		    	PlayerInfo[targetid][pSellExtra] = amount;
		    	PlayerInfo[targetid][pSellPrice] = price;

		    	ShowInventory(playerid);

		    	SendMessage(targetid, COLOR_WHITE, "** %s offered to sell you %i grams of meth for $%i. (/accept item)", GetRPName(playerid), amount, price);
		    	SendMessage(playerid, COLOR_WHITE, "** You have offered to sell %s your %i grams of meth for $%i.", GetRPName(targetid), amount, price);
			}
        }
        case DIALOG_INVGIVEPK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEPK, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pPainkillers])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pPainkillers] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more painkillers.");
			    }

			    PlayerInfo[playerid][pPainkillers] -= amount;
			    PlayerInfo[targetid][pPainkillers] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET painkillers = %i WHERE uid = %i", PlayerInfo[playerid][pPainkillers], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET painkillers = %i WHERE uid = %i", PlayerInfo[targetid][pPainkillers], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i grams of painkillers.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i grams of painkillers to %s.", amount, GetRPName(targetid));

			    ShowInventory(playerid);

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some painkillers to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i grams of painkillers to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVSELLPK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount, price;
                if(sscanf(inputtext, "iii", targetid, amount, price))
	            {
					ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID of the player you want to sell this item.", "Enter", "Cancel");
					SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
					return 1;
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
            	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
             	}
                if(amount < 1 || amount > PlayerInfo[playerid][pPainkillers])
	         	{
	         	    SendClientMessage(playerid, COLOR_SYNTAX, "Insufficient amount.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	         	    return 1;
	        	}
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
	        	if(targetid == playerid)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(price < 1)
         		{
	        	    SendClientMessage(playerid, COLOR_SYNTAX, "The price can't be below $1.");
	        	    ShowPlayerDialog(playerid, DIALOG_INVSELLPK, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	        	    return 1;
	        	}
	        	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
             	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
            	}

		    	PlayerInfo[playerid][pLastSell] = gettime();
		    	PlayerInfo[targetid][pSellOffer] = playerid;
		    	PlayerInfo[targetid][pSellType] = ITEM_PAINKILLERS;
		    	PlayerInfo[targetid][pSellExtra] = amount;
		    	PlayerInfo[targetid][pSellPrice] = price;

		    	ShowInventory(playerid);

		    	SendMessage(targetid, COLOR_WHITE, "** %s offered to sell you %i grams of painkillers for $%i. (/accept item)", GetRPName(playerid), amount, price);
		    	SendMessage(playerid, COLOR_WHITE, "** You have offered to sell %s your %i grams of painkillers for $%i.", GetRPName(targetid), amount, price);
			}
		}
        case DIALOG_INVGIVEMATS:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "i", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEMATS, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pMaterials])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pMaterials] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more materials.");
			    }

			    PlayerInfo[playerid][pMaterials] -= amount;
			    PlayerInfo[targetid][pMaterials] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET materials = %i WHERE uid = %i", PlayerInfo[playerid][pMaterials], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET materials = %i WHERE uid = %i", PlayerInfo[targetid][pMaterials], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    ShowInventory(playerid);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i materials.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i materials to %s.", amount, GetRPName(targetid));

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some materials to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i materials to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVSELLMATS:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount, price;
                if(sscanf(inputtext, "iii", targetid, amount, price))
	            {
					ShowPlayerDialog(playerid, DIALOG_INVSELLMATS, DIALOG_STYLE_INPUT, "Inventory", "Enter the name or ID of the player you want to sell this item.", "Enter", "Cancel");
					SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
					return 1;
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
            	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
             	}
                if(amount < 1 || amount > PlayerInfo[playerid][pMaterials])
	         	{
	         	    SendClientMessage(playerid, COLOR_SYNTAX, "Insufficient amount.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMATS, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	         	    return 1;
	        	}
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMATS, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
	        	if(targetid == playerid)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
                    ShowPlayerDialog(playerid, DIALOG_INVSELLMATS, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	            	return 1;
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
                if(price < 1)
         		{
	        	    SendClientMessage(playerid, COLOR_SYNTAX, "The price can't be below $1.");
	        	    ShowPlayerDialog(playerid, DIALOG_INVSELLMATS, DIALOG_STYLE_INPUT, "Inventory", "[Format:(playerid) (amount) (price)] Enter the ID, amount and how much you want to sell the item.", "Enter", "Cancel");
	        	    return 1;
	        	}
	        	if(gettime() - PlayerInfo[playerid][pLastSell] < 10)
            	{
             	    return SendMessage(playerid, COLOR_SYNTAX, "You can only use this command every 10 seconds. Please wait %i more seconds.", 10 - (gettime() - PlayerInfo[playerid][pLastSell]));
            	}

		    	PlayerInfo[playerid][pLastSell] = gettime();
		    	PlayerInfo[targetid][pSellOffer] = playerid;
		    	PlayerInfo[targetid][pSellType] = ITEM_MATERIALS;
		    	PlayerInfo[targetid][pSellExtra] = amount;
		    	PlayerInfo[targetid][pSellPrice] = price;

		    	ShowInventory(playerid);

		    	SendMessage(targetid, COLOR_WHITE, "** %s offered to sell you %i materials for $%i. (/accept item)", GetRPName(playerid), amount, price);
		    	SendMessage(playerid, COLOR_WHITE, "** You have offered to sell %s your %i materials for $%i.", GetRPName(targetid), amount, price);
			}
        }
        case DIALOG_INVGIVEFOOD:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEFOOD, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pFood][0])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pFood][0] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more food.");
			    }

			    PlayerInfo[playerid][pFood][0] -= amount;
			    PlayerInfo[targetid][pFood][0] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET food = %i WHERE uid = %i", PlayerInfo[playerid][pFood][0], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET food = %i WHERE uid = %i", PlayerInfo[targetid][pFood][0], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i pieces of food.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i pieces of food to %s.", amount, GetRPName(targetid));

			    ShowInventory(playerid);

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some food to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i pieces of food to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVGIVEDRINK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVEDRINK, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pWater][0])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pWater][0] + amount > GetPlayerCapacity(playerid, CAPACITY_WEED))
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more drink.");
			    }

			    PlayerInfo[playerid][pWater][0] -= amount;
			    PlayerInfo[targetid][pWater][0] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET drink = %i WHERE uid = %i", PlayerInfo[playerid][pWater][0], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET drink = %i WHERE uid = %i", PlayerInfo[targetid][pWater][0], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    ShowInventory(playerid);    

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i pieces of drink.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i pieces of drink to %s.", amount, GetRPName(targetid));

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some drink to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i pieces of drink to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
        case DIALOG_INVGIVERK:
		{
            if(!response) HideInventory(playerid);
			if(response)
			{
                new targetid, amount;
                if(sscanf(inputtext, "ii", targetid, amount))
	            {
					return ShowPlayerDialog(playerid, DIALOG_INVGIVERK, DIALOG_STYLE_INPUT, "Inventory", "(ERROR THE PLAYER IS DISCONNECTED or NOT IN RANGE) Enter the name or ID of the player you want to give this item.", "Enter", "Cancel");
	            }
	            if(!IsPlayerConnected(targetid) || !IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "The player specified is disconnected or out of range.");
	        	}
	        	if(targetid == playerid)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command on yourself.");
	        	}
       	        if(PlayerInfo[playerid][pPaintball] > 0 || PlayerInfo[playerid][pTazedTime] > 0 || PlayerInfo[playerid][pInjured] > 0 || PlayerInfo[playerid][pHospital] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pTied] > 0 || PlayerInfo[playerid][pCuffed] > 0 || PlayerInfo[playerid][pJailTime] > 0 || PlayerInfo[playerid][pJoinedEvent] > 0)
	        	{
	            	return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command at the moment.");
            	}
            	if(amount < 1 || amount > PlayerInfo[playerid][pRepairKit])
     		    {
		            return SendClientMessage(playerid, COLOR_WHITE, "Insufficient amount.");
			    }
			    if(PlayerInfo[targetid][pRepairKit] + amount > 5)
			    {
		    	    return SendMessage(playerid, COLOR_SYNTAX, "That player can't carry that much more repairkit.");
			    }

			    PlayerInfo[playerid][pRepairKit] -= amount;
			    PlayerInfo[targetid][pRepairKit] += amount;

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET repairkit = %i WHERE uid = %i", PlayerInfo[playerid][pRepairKit], PlayerInfo[playerid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET repairkit = %i WHERE uid = %i", PlayerInfo[targetid][pRepairKit], PlayerInfo[targetid][pID]);
			    mysql_tquery(connectionID, queryBuffer);

			    ShowInventory(playerid);

			    SendMessage(targetid, COLOR_WHITE, "%s has given you %i pieces of repairkit.", GetRPName(playerid), amount);
			    SendMessage(playerid, COLOR_WHITE, "You have given %i pieces of repairkit to %s.", amount, GetRPName(targetid));

			    SendProximityMessage(playerid, 20.0, COLOR_GREY, "**{C2A2DA} %s gives some repairkit to %s.", GetRPName(playerid), GetRPName(targetid));
	    	    Log_Write("log_give", "%s (uid: %i) gives %i pieces of repairkit to %s (uid: %i)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pID], amount, GetPlayerNameEx(targetid), PlayerInfo[targetid][pID]);
			}
        }
    }
    #if defined INV_OnDialogResponse
		return INV_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse INV_OnDialogResponse
#if defined INV_OnDialogResponse
	forward INV_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(playertextid == InventoryTD[playerid][17])
	{
        ShowPlayerDialog(playerid, DIALOG_INVPOT, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][18])
	{
        ShowPlayerDialog(playerid, DIALOG_INVCRACK, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][19])
	{
        ShowPlayerDialog(playerid, DIALOG_INVMETH, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][16])
	{
        ShowPlayerDialog(playerid, DIALOG_INVPK, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][25])
	{
        ShowPlayerDialog(playerid, DIALOG_INVMATS, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][9])
	{
        callcmd::planthelp(playerid, "");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][19])
	{
        SendClientMessage(playerid, COLOR_YELLOW, "This is a Drugs needs to cooking a Meth.");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][28])
	{
        SendClientMessage(playerid, COLOR_YELLOW, "This is the ingredients needs to cook a Meth.");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][29])
	{
        SendClientMessage(playerid, COLOR_YELLOW, "This is the ingredients needs to cook a Meth.");
        HideInventory(playerid);
    }
    if(playertextid == InventoryTD[playerid][29])
	{
        SendClientMessage(playerid, COLOR_YELLOW, "This is the ingredients needs to cook a Meth.");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][13])
	{
        callcmd::usecigar(playerid, "");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][12])
	{
        ShowPlayerDialog(playerid, DIALOG_INVDRINK, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][11])
	{
        ShowPlayerDialog(playerid, DIALOG_INVFOOD, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][16])
	{
        SendClientMessage(playerid, COLOR_YELLOW, "You can use it to tag a wall.");
        HideInventory(playerid);
    }
	if(playertextid == InventoryTD[playerid][22])
	{
        ShowPlayerDialog(playerid, DIALOG_INVRK, DIALOG_STYLE_LIST, "Inventory Menu", "Use\nGive\nSell", "Select", "Return");
        HideInventory(playerid);
    }
 	if(playertextid == InventoryTD[playerid][10])
	{
		HideInventory(playerid);
		CancelSelectTextDraw(playerid);
    }
	#if defined IN_OnPlayerClickPlayerTextDraw
        return IN_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif

#define OnPlayerClickPlayerTextDraw IN_OnPlayerClickPlayerTextDraw
#if defined IN_OnPlayerClickPlayerTextDraw
    forward IN_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
#endif

CMD:myinv(playerid, params[])
{
    ShowInventory(playerid);
    SelectTextDraw(playerid,0x33AA33AA);
	return 1;
}