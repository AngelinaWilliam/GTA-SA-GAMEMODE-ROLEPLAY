new Float:LABankDelivery_X;
new Float:LABankDelivery_Y;
new Float:LABankDelivery_Z;
new Float:LABankDelivery[][3] = {
{2143.2334,-1163.3490,24.0228},
{2436.6750,-1471.0729,24.0346},
{2424.5154,-1507.2292,24.0768},
{2511.8743,-1727.3556,13.5141},
{2396.1650,-1895.0166,13.5085},
{2220.6477,-1705.3005,13.6121},
{2094.5466,-1798.5317,13.5098},
{2065.0435,-1903.7532,13.6719},
{1504.5338,-1750.2394,13.5469},
{1351.0018,-1753.2513,13.4823},
{483.2833,-1501.2810,20.4748},
{455.4522,-1373.1908,23.6984},
{997.1725,-920.9366,42.3048},
{338.0354,-1376.0376,14.3796},
{-2160.6577,-2421.2717,30.6664},
{-2090.3438,-2459.2312,30.5944},
{-2105.8921,-2350.4724,30.5945},
{248.6770,-68.4204,1.5537},
{279.3307,-158.0786,1.5549},
{179.0486,-154.0454,1.5540},
{46.6426,-288.0773,1.9613},
{1283.8816,368.0580,19.5617},
{1292.0250,266.4245,19.5855},
{1362.5967,259.5391,19.6930},
{2297.3889,-15.1795,26.4521},
{2304.4526,86.7143,26.5292},
{2340.0020,34.6298,26.4607}
};


enum jobEnum
{
	jobName[32],
	jobActor,
	Float:jobX,
	Float:jobY,
	Float:jobZ,
	Float:JobA
};
new const jobLocations[][jobEnum] =
{
	// Job Name					Skin	Pos X		Pos Y	    Pos Z  	 Pos A
	{"Pizzaman", 				155,	2104.7771, 	-1805.1772, 13.5547, 94.5307},
	{"Trucker",     			71,		2214.9797, 	-2661.3469, 13.5468, 2.27},
	{"Fisherman",   			14,		393.2632,  	-2070.5837, 7.8359,  19.1341},
	{"Bodyguard",   			164,	2227.4705, 	-1715.9694, 13.5302, 132.57},
	{"Arms Dealer",  			29,		1366.4503,  -1274.5061, 13.5468, 131.01},
	{"Taxi Driver",     		61,		1748.1373, 	-1863.0981, 13.5755, 1.0},
	{"Drug Dealer",    			29,		2165.3611, 	-1673.0824, 15.0778, 271.98},
	{"Lawyer",          		147,	1381.0668, 	-1086.6857, 27.3906, 90.25},
	{"Detective",      			165,	1548.2339,	-1668.2773, 13.5667, 92.13},
	{"Miner",           		27,		443.1771, 	-847.7908,  29.8050, 140.26},
	{"Butcher",     			168,	2087.8628, 	-1569.9656, 13.1981, 220.7662},
	{"Adonis Bar",     			246,	1019.8801,	-1122.3483,	23.8665, 183.6713},
	{"Construction Worker",     27,		1900.9370,	-1873.4185, 13.5380, 89.9732},
	{"Craftsman",     			29,		2194.4121,	-1973.1595, 13.5592, 180.8242},
	{"Harvest",     			158,	1945.8213, 	163.0656, 	37.2226, 344.53},
	{"Garbage Man",    			8,		2432.8596, 	-2123.8972, 13.5469, 0.8604},
	{"Brinks",    				253,	1527.8966,  -1008.2614, 24.0781, 225.4103},
	{"Tailor",    				37,		1013.9363,  -1297.1431, 13.5469, 138.8476},
	{"Sweeper",     			8,		2193.8438, 	-1984.7574, 13.5509, 96.2869},
	{"Greenwich Delivery",     	8,		1007.7026,  -1355.9747, 13.3359, 50.0316}
};

CMD:locate(playerid, params[])
{
	if(!PlayerInfo[playerid][pGPS])
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have a GPS. You can buy one at 24/7.");
	}
	SetPVarInt(playerid, "UsingData", 1);
	ShowPlayerDialog(playerid, DIALOG_LOCATE, DIALOG_STYLE_LIST, "List of Destination", "Job Locations\nGeneral Locations\nPoints\nTurfs", "Select", "Close");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_LOCATE)
	{
		if(!response) return DeletePVar(playerid, "UsingData");
		if(response)
        {
           	switch(listitem)
        	{
				case 0:
        	    {
                	ShowPlayerDialog(playerid, DIALOG_LOCATE_LIST1, DIALOG_STYLE_LIST, "Job Locations", "Pizzaman\nTrucker\nFisherman\nBodyguard\nArms Dealer\nTaxi Driver\nDrug Deagle\nLawyer\nDetective\nMiner\nButcher\nAdonis Bar\nConstruction Worker\nCraftsman\nHarvester\nGarbage Man\nBrinks\nTailor\nSweeper\nGreenwich Delivery", "Locate", "Close");
        	    }
        	    case 1:
        	    {
					new string[34 * MAX_LOCATION];
					for(new x = 0; x < MAX_LOCATION; x++) {
						if(LocationInfo[x][lcExists]) {
							strcat(string, LocationInfo[x][lcName]);
							strcat(string, "\n");
						}
					}
					if(strlen(string) > 2) {
						ShowPlayerDialog(playerid, DIALOG_LOCATE_LIST2, DIALOG_STYLE_LIST, "General Locations", string, "Select", "Return");
					} else {
						SendClientMessage(playerid, COLOR_WHITE, "Unable to locate any new locations.");
					}
				}
				case 2:
        	    {
					new string[34 * MAX_POINTS];
					for(new x = 0; x < MAX_POINTS; x++) {
						if(PointInfo[x][pExists]) {
							strcat(string, PointInfo[x][pName]);
							strcat(string, "\n");
						}
					}
					if(strlen(string) > 2) {
						ShowPlayerDialog(playerid, DIALOG_LOCATE_LIST3, DIALOG_STYLE_LIST, "Points Locations", string, "Select", "Return");
					} else {
						SendClientMessage(playerid, COLOR_WHITE, "Unable to locate any new locations.");
					}
				}
				case 3:
				{
					new string[34 * MAX_TURFS];
					for(new x = 0; x < MAX_TURFS; x++) {
						if(TurfInfo[x][tExists]) 
						{
							strcat(string, TurfInfo[x][tName]);
							strcat(string, "\n");
						}
					}
					if(strlen(string) > 2) {
						ShowPlayerDialog(playerid, DIALOG_LOCATE_LIST4, DIALOG_STYLE_LIST, "Turf Lccations", string, "Select", "Return");
					} else {
						SendClientMessage(playerid, COLOR_WHITE, "Unable to locate any new locations.");
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_LOCATE_LIST1)
	{
		if(!response) return DeletePVar(playerid, "UsingData");
		if(response)
		{
			if(jobLocations[listitem][jobName])
			{
				SetPVarInt(playerid, "UsingData", 1);
				PlayerInfo[playerid][pCP] = CHECKPOINT_MISC;
				SetPlayerCheckpoint(playerid, jobLocations[listitem][jobX], jobLocations[listitem][jobY], jobLocations[listitem][jobZ], 3.0);
				SendMessage(playerid, COLOR_WHITE, "Global Position System");
				SendMessage(playerid, COLOR_WHITE, "Name: %s", jobLocations[listitem][jobName]);
				SendMessage(playerid, COLOR_WHITE, "Located at: %s", GetZoneName(jobLocations[listitem][jobX], jobLocations[listitem][jobY], jobLocations[listitem][jobZ]));
				SendMessage(playerid, COLOR_WHITE, "Distance: %.1f meters.", GetPlayerDistanceFromPoint(playerid, jobLocations[listitem][jobX], jobLocations[listitem][jobY], jobLocations[listitem][jobZ]));

				Waypoint_Set(playerid, jobLocations[listitem][jobName], jobLocations[listitem][jobX], jobLocations[listitem][jobY], jobLocations[listitem][jobZ]);
			}
		}
	}
	if(dialogid == DIALOG_LOCATE_LIST2)
	{
		if(!response) return DeletePVar(playerid, "UsingData");
		if(response)
		{
			if(LocationInfo[listitem][lcExists])
			{
				SetPVarInt(playerid, "UsingData", 1);
				PlayerInfo[playerid][pCP] = CHECKPOINT_MISC;
				SetPlayerCheckpoint(playerid, LocationInfo[listitem][lcPosX], LocationInfo[listitem][lcPosY], LocationInfo[listitem][lcPosZ], 3.0);
				SendMessage(playerid, COLOR_WHITE, "Global Position System");
				SendMessage(playerid, COLOR_WHITE, "Name: %s", LocationInfo[listitem][lcName]);
				SendMessage(playerid, COLOR_WHITE, "Located at: %s", GetZoneName(LocationInfo[listitem][lcPosX], LocationInfo[listitem][lcPosY], LocationInfo[listitem][lcPosZ]));
				SendMessage(playerid, COLOR_WHITE, "Distance: %.1f meters.", GetPlayerDistanceFromPoint(playerid, LocationInfo[listitem][lcPosX], LocationInfo[listitem][lcPosY], LocationInfo[listitem][lcPosZ]));
			
				Waypoint_Set(playerid, LocationInfo[listitem][lcName], LocationInfo[listitem][lcPosX], LocationInfo[listitem][lcPosY], LocationInfo[listitem][lcPosZ]);
			}
		}
	}
	if(dialogid == DIALOG_LOCATE_LIST3)
	{
		if(!response) return DeletePVar(playerid, "UsingData");
		if(response)
		{	
			if(PointInfo[listitem][pExists])
			{
				SetPVarInt(playerid, "UsingData", 1);
				PlayerInfo[playerid][pCP] = CHECKPOINT_MISC;
				SetPlayerCheckpoint(playerid, PointInfo[listitem][pPointX], PointInfo[listitem][pPointY], PointInfo[listitem][pPointZ], 3.0);
				SendMessage(playerid, COLOR_WHITE, "Global Position System");
				SendMessage(playerid, COLOR_WHITE, "Name: %s", PointInfo[listitem][pName]);
				SendMessage(playerid, COLOR_WHITE, "Located at: %s", GetZoneName(PointInfo[listitem][pPointX], PointInfo[listitem][pPointY], PointInfo[listitem][pPointZ]));
				SendMessage(playerid, COLOR_WHITE, "Distance: %.1f meters.", GetPlayerDistanceFromPoint(playerid, PointInfo[listitem][pPointX], PointInfo[listitem][pPointY], PointInfo[listitem][pPointZ]));
			
				Waypoint_Set(playerid, PointInfo[listitem][pName], PointInfo[listitem][pPointX], PointInfo[listitem][pPointY], PointInfo[listitem][pPointZ]);
			}	
		}
	}
	if(dialogid == DIALOG_LOCATE_LIST4)
	{
		if(!response) return DeletePVar(playerid, "UsingData");
		if(response)
		{
			for(new i = 0; i < MAX_TURFS; i ++)
			{
				if(strfind(TurfInfo[i][tName], inputtext) != -1)
				{
					SetPVarInt(playerid, "UsingData", 1);
					PlayerInfo[playerid][pCP] = CHECKPOINT_MISC;
					SetPlayerCheckpoint(playerid, TurfInfo[i][tMinX], TurfInfo[i][tMinY], TurfInfo[i][tHeight], 3.0);
					SendMessage(playerid, COLOR_WHITE, "Global Position System");
					SendMessage(playerid, COLOR_WHITE, "Name: %s", TurfInfo[i][tName]);
					SendMessage(playerid, COLOR_WHITE, "Located at: %s", GetZoneName(TurfInfo[i][tMinX], TurfInfo[i][tMinY], TurfInfo[i][tHeight]));
					SendMessage(playerid, COLOR_WHITE, "Distance: %.1f meters.", GetPlayerDistanceFromPoint(playerid, TurfInfo[i][tMinX], TurfInfo[i][tMinY], TurfInfo[i][tHeight]));
					
					Waypoint_Set(playerid, TurfInfo[i][tName], TurfInfo[i][tMinX], TurfInfo[i][tMinY], TurfInfo[i][tHeight]);
					break;
				}
				
			}
		}
	}
	#if defined Locate_OnDialogResponse
		return Locate_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Locate_OnDialogResponse
#if defined Locate_OnDialogResponse
	forward Locate_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif