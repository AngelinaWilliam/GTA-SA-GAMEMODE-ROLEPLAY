enum copEnum
{
    cModel,
    cBone,
    cName[24]
};
new const copClothing[][copEnum] =
{
    {19138, 2, "PoliceGlasses1"},
    {19139, 2, "PoliceGlasses2"},
    {19140, 2, "PoliceGlasses3"},
    {18636, 2, "Police cap"},
    {19521, 2, "Police hat"},
    {19099, 2, "Black rim hat"},
    {19100, 2, "Brown rim hat"},
    {19139, 2, "Red shades"},
    {19140, 2, "Blue shades"},
    {19138, 2, "Black shades"},
    {19774, 1, "Badge"},
    {19942, 1, "Radio"},
    {19162, 2, "Blue cap"},
    {19161, 2, "Black cap"},
    {19200, 2, "Bike helmet"},
    {18637, 1, "Riot shield"},
    {19141, 2, "SWAT helmet"},
    {19142, 1, "SWAT armor"},
    {19515, 1, "Grey armor"},
    {19514, 2, "Grey helmet"},
    {19777, 1, "FBI insignia"},
    {19776, 1, "FBI ID card"},
    {18642, 1, "Taser"},
    {18641, 1, "Flashlight"},
    {11749, 1, "Handcuffs"},
    {11750, 1, "Closed cuff"},
    {19783, 1, "Police badge"},
    {19784, 1, "Police badge 2"},
    {19785, 1, "Senior Ld. badge"},
    {19778, 1, "Detective badge"},
    {19779, 1, "Detective badge 2"},
    {19780, 1, "Detective badge 3"},
    {19781, 1, "Sergeant badge"},
    {19782, 1, "Sergeant badge 2"}
};

forward OnPlayerAttachFactionClothing(playerid, name[], clothingid);
public OnPlayerAttachFactionClothing(playerid, name[], clothingid)
{
    strcpy(ClothingInfo[playerid][clothingid][cName], name, 32);
    ClothingInfo[playerid][clothingid][cID] = cache_insert_id(connectionID);
    ClothingInfo[playerid][clothingid][cExists] = 1;
    ClothingInfo[playerid][clothingid][cAttached] = 0;
    ClothingInfo[playerid][clothingid][cAttachedIndex] = -1;
    SendMessage(playerid, COLOR_WHITE, "%s added to clothing inventory. /toys to attach your new item.", name);
}

BuyFactionToys(playerid)
{
    new modelid = copClothing[PlayerInfo[playerid][pSelected]][cModel], boneid = copClothing[PlayerInfo[playerid][pSelected]][cBone], Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ;
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
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO clothing VALUES(null, %i, '%e', %i, %i, 0, '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f')", PlayerInfo[playerid][pID], copClothing[PlayerInfo[playerid][pSelected]][cName], modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
            mysql_tquery(connectionID, queryBuffer, "OnPlayerAttachFactionClothing", "isi", playerid, copClothing[PlayerInfo[playerid][pSelected]][cName], i);
            return 1;
        }
    }
    SendClientMessage(playerid, COLOR_SYNTAX, "You have no more clothing slots available. Therefore you can't buy this.");
    return 1;
}

PreviewFactionClothing(playerid, index)
{
    PlayerInfo[playerid][pSelected] = index;
    BuyFactionToys(playerid);
}

ShowDialogFactionToys(playerid)
{
    new models[sizeof(copClothing)];
    for(new i = 0; i < sizeof(copClothing); i ++) {
        models[i] = copClothing[i][cModel];
    }
    ShowPlayerSelectionMenu(playerid, MODEL_SELECTION_FACTIONTOYS, "Faction Locker Toys", models, sizeof(models));
}