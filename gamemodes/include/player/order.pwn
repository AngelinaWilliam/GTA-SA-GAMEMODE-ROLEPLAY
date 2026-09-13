public OnGameModeInit()
{
    CreateDynamic3DTextLabel("Mc Donalds\n"WHITE"Type '/order' to order any foods.", COLOR_YELLOW, 0.0,0.0,0.0, 10.0);
	CreateDynamicPickup(1274, 1, 1721.8334,-1704.1190,14.3068);

    CreateDynamic3DTextLabel("Shakeys\n"WHITE"Type '/order' to order any foods.", COLOR_YELLOW, 0.0,0.0,0.0, 10.0);
	CreateDynamicPickup(1274, 1, 0.0,0.0,0.0);

    CreateDynamic3DTextLabel("Jollibee\n"WHITE"Type '/order' to order any foods.", COLOR_YELLOW, 0.0,0.0,0.0, 10.0);
	CreateDynamicPickup(1274, 1, 0.0,0.0,0.0);

    CreateDynamic3DTextLabel("Greenwich\n"WHITE"Type '/order' to order any foods.\nType '/sellfood' to sell random food", COLOR_GREEN, 1023.8523,-1363.2314,14.4396, 10.0);
	CreateDynamicPickup(1274, 1, 1023.8523,-1363.2314,14.4396);
    #if defined Order_OnGameModeInit
		return Order_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Order_OnGameModeInit
#if defined Order_OnGameModeInit
	forward Order_OnGameModeInit();
#endif

CMD:order(playerid, params[])
{
	new string[128] = "Food:\tPrice:";
	if(isnull(params))
	{
	    SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /order [type]");
	    SendClientMessage(playerid, COLOR_WHITE, "Available Type: Mcdo, Shakeys, Jollibee. Greenwich");
		return 1;
	}
	if(!strcmp(params, "mcdo", true))
	{
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1721.8334,-1704.1190,14.3068))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not near at the mcdo store.");
		}

        format(string, sizeof(string), "%s\n\
        Friend Chicken\t$1,000\n\
        Spaghetti\t$900\n\
        Burger\t$800\n\
        Fries\t$700\n\
        Fanta\t$500\n\
        Sprite\t$500\n\
        Coke\t$500", string);
        Dialog_Show(playerid, Mcdo_Meal, DIALOG_STYLE_TABLIST_HEADERS, "Mcdo Meal", string, "Start", "Return");
	}
	else if(!strcmp(params, "shakeys", true))
	{
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2110.2256,-1799.0452,14.0375))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not near at the shakeys store.");
		}

        format(string, sizeof(string), "%s\n\
        Angus Burger Pizza\t$3,000\n\
        Pepperoni Crunch Pizza\t$2,500\n\
        Angus Steakhouse Pizza\t$2,000\n\
        Friend Chicken\t$1,500\n\
        Buddy Pack\t$1,250\n\
        Basket of Mojos\t$1,000", string);
        Dialog_Show(playerid, Shakeys_Meal, DIALOG_STYLE_TABLIST_HEADERS, "Shakeys Meal", string, "Start", "Return");
	}
	else if(!strcmp(params, "jollibee", true))
	{
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, 952.2914,-1662.5679,13.6828))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not near at the jollibee store.");
		}

        format(string, sizeof(string), "%s\n\
        Friend Chicken\t$1,000\n\
        Spaghetti\t$900\n\
        Burger\t$800\n\
        Burger Steak\t$950\n\
        Fries\t$700\n\
        Sundae\t$600\n\
        Sprite\t500\n\
        Pineapple Juice\t500\n\
        Coke\t500\n\
        Coke Float\t$500", string);
        Dialog_Show(playerid, Jollibee_Meal, DIALOG_STYLE_TABLIST_HEADERS, "Jollibee Meal", string, "Start", "Return");
	}
    else if(!strcmp(params, "greenwich", true))
	{
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1023.8523,-1363.2314,14.4396))
		{
			return SendClientMessage(playerid, COLOR_SYNTAX, "You are not near at the greenwich store.");
		}

        format(string, sizeof(string), "%s\n\
        Hawaiian Overload\t$2000\n\
        Hawaiian BBQ Overload\t$1500\n\
        Ham & Cheese Classic\t$1000\n\
        Lasagna Supreme\t$800\n\
        Tuna Lasagna Supreme\t$700\n\
        Meaty Spaghetti\t$600\n\
        Lasagna Chicken Combo\t$500\n\
        Tuna Lasagna Chicken Combo\t$500", string);
        Dialog_Show(playerid, Greenwich_Meal, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich Menu", string, "Start", "Return");
	}
	return 1;
}

Dialog:Greenwich_Meal(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                GivePlayerHunger(playerid, 75);
                GivePlayerCash(playerid, -2000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Hawaiian Overload", GetRPName(playerid));
            }
            case 1:
            {
                GivePlayerHunger(playerid, 60);
                GivePlayerCash(playerid, -1500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Hawaiian BBQ Overload", GetRPName(playerid));
            }
            case 2:
            {
                GivePlayerHunger(playerid, 55);
                GivePlayerCash(playerid, -1000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Ham & Cheese Classic", GetRPName(playerid));
            }
            case 3:
            {
                GivePlayerHunger(playerid, 25);
                GivePlayerCash(playerid, -800);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Lasagna Supreme", GetRPName(playerid));
            }
            case 4:
            {
                GivePlayerHunger(playerid, 35);
                GivePlayerCash(playerid, -700);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Tuna Lasagna Supreme", GetRPName(playerid));
            }
            case 5:
            {
                GivePlayerHunger(playerid, 35);
                GivePlayerCash(playerid, -600);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has drink the Meaty Spaghetti", GetRPName(playerid));
            }
            case 6:
            {
                GivePlayerHunger(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Lasagna Chicken Combo", GetRPName(playerid));
            }
            case 7:
            {
                GivePlayerHunger(playerid, 25);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Tuna Lasagna Chicken Combo", GetRPName(playerid));
            }
        }
    }
    return 1;
}

Dialog:Mcdo_Meal(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                GivePlayerHunger(playerid, 75);
                GivePlayerCash(playerid, -1000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the fried chicken", GetRPName(playerid));
            }
            case 1:
            {
                GivePlayerHunger(playerid, 60);
                GivePlayerCash(playerid, -900);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the spaghetti", GetRPName(playerid));
            }
            case 2:
            {
                GivePlayerHunger(playerid, 55);
                GivePlayerCash(playerid, -800);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the burger", GetRPName(playerid));
            }
            case 3:
            {
                GivePlayerHunger(playerid, 25);
                GivePlayerCash(playerid, -700);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the fries", GetRPName(playerid));
            }
            case 4:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the fanta", GetRPName(playerid));
            }
            case 5:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has drink the sprite", GetRPName(playerid));
            }
            case 6:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the coke", GetRPName(playerid));
            }
        }
    }
    return 1;
}

Dialog:Shakeys_Meal(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                GivePlayerHunger(playerid, 75);
                GivePlayerCash(playerid, -3000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Angus Burger Pizza", GetRPName(playerid));
            }
            case 1:
            {
                GivePlayerHunger(playerid, 60);
                GivePlayerCash(playerid, -2500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Pepperoni Crunch Pizza", GetRPName(playerid));
            }
            case 2:
            {
                GivePlayerHunger(playerid, 55);
                GivePlayerCash(playerid, -2000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Angus Steakhouse Pizza", GetRPName(playerid));
            }
            case 3:
            {
                GivePlayerHunger(playerid, 45);
                GivePlayerCash(playerid, -1500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Friend Chicken", GetRPName(playerid));
            }
            case 4:
            {
                GivePlayerHunger(playerid, 25);
                GivePlayerCash(playerid, -1250);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Buddy Pack", GetRPName(playerid));
            }
            case 5:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -1000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the Basket of Mojos", GetRPName(playerid));
            }
        }
    }
    return 1;
}

Dialog:Jollibee_Meal(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                GivePlayerHunger(playerid, 75);
                GivePlayerCash(playerid, -1000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the fried chicken", GetRPName(playerid));
            }
            case 1:
            {
                GivePlayerHunger(playerid, 60);
                GivePlayerCash(playerid, -900);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the spaghetti", GetRPName(playerid));
            }
            case 2:
            {
                GivePlayerHunger(playerid, 55);
                GivePlayerCash(playerid, -800);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the burger", GetRPName(playerid));
            }
            case 3:
            {
                GivePlayerHunger(playerid, 45);
                GivePlayerCash(playerid, -950);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the burger steak", GetRPName(playerid));
            }
            case 4:
            {
                GivePlayerHunger(playerid, 25);
                GivePlayerCash(playerid, -700);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the fries", GetRPName(playerid));
            }
            case 5:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -1000);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the sundae", GetRPName(playerid));
            }
            case 6:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -600);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has drink the sprite", GetRPName(playerid));
            }
            case 7:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the pineapple juice", GetRPName(playerid));
            }
            case 8:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the coke", GetRPName(playerid));
            }
            case 9:
            {
                GivePlayerThirst(playerid, 35);
                GivePlayerCash(playerid, -500);
                SendProximityMessage(playerid, 20.0, SERVER_COLOR, "**{C2A2DA} %s has eat the coke float", GetRPName(playerid));
            }
        }
    }
    return 1;
}