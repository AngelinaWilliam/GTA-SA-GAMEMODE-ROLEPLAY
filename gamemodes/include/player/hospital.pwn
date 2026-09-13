// new hospital system inspired by NGG

GetFreeHospitalBed(iHospital)
{
	new iFree;
	
	for(new i = 0; i < MAX_HOSPITALBEDS; i++)
	{
		if(hBedData[iHospital][bBedOccupied][i] == false)
		{
			iFree = i;
			break;
		}
	}
	return iFree;
}

forward Hospital_StreamIn(playerid, iHospital, index);
public Hospital_StreamIn(playerid, iHospital, index)
{

	SetPlayerPos(playerid, hBed[index][0], hBed[index][1], hBed[index][2]);
	SetPlayerFacingAngle(playerid, 180);
	
	TogglePlayerControllable(playerid, 0);
	SetTimerEx("UnfreezeNewbie", 3000, false, "i", playerid);
	ApplyAnimation(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0, 1);
    ResetInjured(playerid);
	return 1;
}

forward ReleaseFromHospital(playerid, iHospital, iBed);
public ReleaseFromHospital(playerid, iHospital, iBed)
{
	if(!IsPlayerConnected(playerid))
	{
		hBedData[iHospital][bBedOccupied][iBed] = false;
		return 1;
	}

	new string[128];

	if(--hBedData[iHospital][iCountDown][iBed] <= 0)
	{
        ApplyAnimation(playerid, "SUNBATHE", "Lay_Bac_out", 4.0, 0, 1, 1, 0, 0, 1);
				
		if(!enabledpurge) 
		{
			GivePlayerCash(playerid, -500);
			Dyuze(playerid, "Notice", "Discharged we deduct you $500.");
			if(PlayerInfo[playerid][pDelivered])
			{
				SendClientMessage(playerid, COLOR_DOCTOR, "You have been billed $500 for your stay. Your items is safed!");
				PlayerInfo[playerid][pDelivered] = 0;

				if(PlayerInfo[playerid][pHeadHit] == true)
				{
					PlayerInfo[playerid][pAmnesia] = 1800;
					PlayerInfo[playerid][pHeadHit] = false;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_DOCTOR, "You have been billed $500 for your stay. Your illegal items have been confiscated by staff.");
				SendClientMessage(playerid, COLOR_LIGHTRED, "(( You have lost 30 minutes of your memory. ))");

				if(PlayerInfo[playerid][pHeadHit] == true)
				{
					PlayerInfo[playerid][pAmnesia] = 1800;
					PlayerInfo[playerid][pHeadHit] = false;
				}
			}
		} 
		else 
		{
			SendClientMessage(playerid, COLOR_DOCTOR, "You have been discharged for free for the purge event. (( Type /purgewep to refill your weapons. ))");
		}

		/*new hospital[32];
		switch(iHospital)
		{
		    case HOSPITAL_ALLSAINTS: strcat(hospital, "All Saints Hospital");  
			case HOSPITAL_COUNTY: strcat(hospital, "County General");  
		}*/

		UpdateDynamic3DTextLabelText(InjuredLabel[playerid], COLOR_DOCTOR, "");
		SetPlayerHealth(playerid, PlayerInfo[playerid][pSpawnHealth]);
		SetScriptArmour(playerid, PlayerInfo[playerid][pSpawnArmor]);
		SetPlayerHunger(playerid, 50.0);
		SetPlayerThirst(playerid, 50.0);
		SetPlayerStress(playerid, 50.0);
		ResetInjured(playerid);

		PlayerInfo[playerid][pDirtyCash] = 0;
		PlayerInfo[playerid][pHospital] = 0;
	    PlayerInfo[playerid][pHospitalTime] = 0;
	    hBedData[iHospital][iCountDown][iBed] = 0;
    }
	else
	{
        new rstring[64];
        format(rstring, sizeof(rstring), "Recovering Time Left: %s", TimeConvert(hBedData[iHospital][iCountDown][iBed]));
        UpdateDynamic3DTextLabelText(InjuredLabel[playerid], COLOR_DOCTOR, rstring);
        PlayerInfo[playerid][pHospitalTime]--;

		format(string, sizeof(string), "Respawn Time: ~r~%s", TimeConvert(hBedData[iHospital][iCountDown][iBed]));
		ShowGlobalTextdraw(playerid, string, 1000);

        GivePlayerHealth(playerid, 1);
		hBedData[iHospital][iTimer][iBed] = SetTimerEx("ReleaseFromHospital", 1000, false, "iii", playerid, iHospital, iBed);
	}
	return 1;
}
