enum vipEnum
{
    cModel,
    cBone,
    cName[24]
};
new const vipClothing[][vipEnum] =
{
    {365,   1,  "Spray Can"},
    {368,   1,  "Nightvision Googles"},
    {373,   1,  "Armour model"},
    {371,   1,  "Parachute"},
    {1486,  1,  "Beer Bottle"},
    {1575,  1,  "white sack of cocaine"},
    {1212,  1,  "money packet"},
    {343,   1,  "teargas grenade"},
    {326,   1,  "cane"},
    {325,   1,  "flowers"},
    {1484,  1,  "beer bottle"},
    {3028,  1,  "sword"},
    {1279,  1,  "drug bundle"},
    {3027,  1,  "weed"},
    {2114,  1,  "basketball"},
    {19348, 1,  "cane"},
    {19349, 1,  "monocle"},
    {19469, 1,  "scarf"},
    {19472, 1,  "gasmask"},
    {19352, 1,  "Top hat 01"},
    {19487, 1,  "tophat02"},
    {1212,  1,  "money packet"},
    {334,   1,  "Nightstick"},
    {18693, 1,  "LargeFlame"},
    {18698, 1,  "Insects"},
    {18708, 1,  "Bubbles"},
    {18643, 1,  "LaserPointer1"},
    {19080, 1,  "LaserPointer2"},
    {19081, 1,  "LaserPointer3"},
    {19082, 1,  "LaserPointer4"},
    {19083, 1,  "LaserPointer5"},
    {19084, 1,  "LaserPointer6"},
    {19086, 1,  "ChainsawDildo1"},
    {18675, 1,  "SmokePuff"},
    {19701, 1,  "SmallFlame"}
};

forward OnPlayerAttachVipClothing(playerid, name[], clothingid);
public OnPlayerAttachVipClothing(playerid, name[], clothingid)
{
    strcpy(ClothingInfo[playerid][clothingid][cName], name, 32);
    ClothingInfo[playerid][clothingid][cID] = cache_insert_id(connectionID);
    ClothingInfo[playerid][clothingid][cExists] = 1;
    ClothingInfo[playerid][clothingid][cAttached] = 0;
    ClothingInfo[playerid][clothingid][cAttachedIndex] = -1;
    SendMessage(playerid, COLOR_WHITE, "%s added to clothing inventory. /toys to attach your new item.", name);
}

BuyVIPToys(playerid)
{
    new modelid = vipClothing[PlayerInfo[playerid][pSelected]][cModel], boneid = vipClothing[PlayerInfo[playerid][pSelected]][cBone], Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ;
    RemovePlayerAttachedObject(playerid, 9);

    for(new i = 0; i < MAX_PLAYER_CLOTHING; i ++)
    {
        if(!ClothingInfo[playerid][i][cExists])
        {
            ClothingInfo[playerid][i][cModel] = modelid;
            ClothingInfo[playerid][i][cBone] = boneid;
            ClothingInfo[playerid][i][cPosX] = fOffsetX;
            ClothingInfo[playerid][i][cPosY] = fOffsetY;
            ClothingInfo[playerid][i][cPosZ] = fOffsetZ;
            ClothingInfo[playerid][i][cRotX] = fRotX;
            ClothingInfo[playerid][i][cRotY] = fRotY;
            ClothingInfo[playerid][i][cRotZ] = fRotZ;
            ClothingInfo[playerid][i][cScaleX] = 1.0;
            ClothingInfo[playerid][i][cScaleY] = 1.0;
            ClothingInfo[playerid][i][cScaleZ] = 1.0;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO clothing VALUES(null, %i, '%e', %i, %i, 0, '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f')", PlayerInfo[playerid][pID], vipClothing[PlayerInfo[playerid][pSelected]][cName], modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
            mysql_tquery(connectionID, queryBuffer, "OnPlayerAttachVipClothing", "isi", playerid, vipClothing[PlayerInfo[playerid][pSelected]][cName], i);
            return 1;
        }
    }
    SendClientMessage(playerid, COLOR_SYNTAX, "You have no more clothing slots available. Therefore you can't buy this.");
    return 1;
}

PreviewVipClothing(playerid, index)
{
    PlayerInfo[playerid][pSelected] = index;
    BuyVIPToys(playerid);
}

ShowDialogVIPToys(playerid)
{
    new models[sizeof(vipClothing)];
    for(new i = 0; i < sizeof(vipClothing); i ++) {
        models[i] = vipClothing[i][cModel];
    }
    ShowPlayerSelectionMenu(playerid, MODEL_SELECTION_VIPTOYS, "VIP Toys Shop", models, sizeof(models));
}

CMD:viptoys(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 4.0, 2787.0110,2390.3564,1240.5311))
    {
        return SendClientMessage(playerid, COLOR_GREY, "You are not in range of the VIP Lounge.");
    }
    if(PlayerInfo[playerid][pVIPPackage] < 2)
    {
        return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you don't have a VIP subscription.");
    }
    ShowDialogVIPToys(playerid);
    return 1;
}