SetMissionComplete(playerid, complete)
{
    switch(complete)
    {
        case 0:
        {
            PlayerInfo[playerid][pTaskStatus][0] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_0 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][0], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 2nd Task (1st Mission) was complete, (/mydailytask) to get your prize");
        }
        case 1:
        {
            if(PlayerInfo[playerid][pCigars] >= 3)
            {
                PlayerInfo[playerid][pTaskStatus][1] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_1 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][1], PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer);
                SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 2nd Task (2md Mission) was complete, (/mydailytask) to get your prize");
            }
        }
        case 2:
        {
            PlayerInfo[playerid][pTaskStatus][2] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_2 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][2], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 3rd Task (3rd Mission) was complete, (/mydailytask) to get your prize");
        }
        case 3:
        {
            PlayerInfo[playerid][pTaskStatus][3] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_3 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][3], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 4th Task (4th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 4:
        {
            PlayerInfo[playerid][pTaskStatus][4]= 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_4 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][4], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 5th Task (5th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 5:
        {
            PlayerInfo[playerid][pTaskStatus][5] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_5 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][5], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 6th Task (6th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 6:
        {
            PlayerInfo[playerid][pTaskStatus][6] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_6 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][6], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 7th Task (7th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 7:
        {
            PlayerInfo[playerid][pTaskStatus][7] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_7 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][7], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 8th Task (8th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 8:
        {
            PlayerInfo[playerid][pTaskStatus][8] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_8 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][8], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 9th Task (9th Mission) was complete, (/mydailytask) to get your prize");
        }
        case 9:
        {
            PlayerInfo[playerid][pTaskStatus][9] = 1;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET status_9 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskStatus][9], PlayerInfo[playerid][pID]);
            mysql_tquery(connectionID, queryBuffer);
            SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations the 10th Task (10th Mission) was complete, (/mydailytask) to get your prize");
        }
    }
}

alias:dailytaskhelpremoved("dthrr");
CMD:dailytaskhelpremoved(playerid, params[])
{
    SendClientMessage(playerid, COLOR_SYNTAX, "List of Command:");
    SendClientMessage(playerid, COLOR_SYNTAX, "Command: /mydailytask, /taskcomplete, /exchangetoken");
    return 1;
}

CMD:exchangetokenremoved(playerid, params[])
{
    new string[1028] = "Items:\tTokens:";
    format(string, sizeof(string), "\n\
    30 Pot & 30 Crack & 30 Meth\t25 Token\n\
    10,000 Materials\t30 Token\n\
    1x Ak-47\t70 Token\n\
    1x Deagle\t50 Token\n\
    1x Sawn Off\t80 Token\n\
    1x Micro Uzi\t90 Token\n\
    1 Week Gold Donator\t180 Token\n\
    1 Week Diamond Donator\t190 Token\n\
    1 Week Platinum Donator\t200 Token\n\
    1 Month Gold Donator\t220 Token\n\
    1 Month Diamond Donator\t230 Token\n\
    1 Month Platinum Donator\t250 Token\n\
    Small Backpack\t270 Token\n\
    Medium Backpack\t280 Token\n\
    Large Backpack\t290 Token\n\
    Small House\t300 Token\n\
    Medium House\t310 Token\n\
    Large House\t320 Token\n\
    Small Land\t330 Token\n\
    Medium Land\t340 Token\n\
    Large Land\t350 Token");
	Dialog_Show(playerid, Exchange_Token, DIALOG_STYLE_TABLIST_HEADERS, "Exchange your Token", string, ">>>", "Cancel");
    return 1;
}

alias:taskcompleteremoved("tcrr");
CMD:taskcompleteremoved(playerid, params[])
{
    new string[1028] = "List:\tItems:";
    format(string, sizeof(string), "\n\
    1st Task\t5 Items Mission\n\
    2nd Task\t5 Items Mission\n\
    3rd Task\t10 Items Mission\n\
    "YELLOW"Total of 20 Mission");
	Dialog_Show(playerid, Complete_Mission, DIALOG_STYLE_TABLIST_HEADERS, "Task Mission", string, ">>>", "Cancel");
    return 1;
}

alias:mydailytaskremoved("mdtrr");
CMD:mydailytaskremoved(playerid, params[])
{
    new string[1028] = "List:\tItems:";
    format(string, sizeof(string), "\n\
    1st Task\t5 Items Mission\n\
    2nd Task\t10 Items Mission\n\
    3rd Task\t5 Items Mission\n\
    "YELLOW"Total of 20 Mission");
	Dialog_Show(playerid, Mission_Menu, DIALOG_STYLE_TABLIST_HEADERS, "Task Mission", string, ">>>", "Cancel");
    return 1;
}

Dialog:Exchange_Token(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(PlayerInfo[playerid][pToken] < 25)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 25;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 30 pot & 30 crack & 30 meth, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 1:
            {
                if(PlayerInfo[playerid][pToken] < 30)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 30;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 10,000 Materials, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 2:
            {
                if(PlayerInfo[playerid][pToken] < 70)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 70;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1x Ak-47, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 3:
            {
                if(PlayerInfo[playerid][pToken] < 50)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 50;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1x Deagle, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 4:
            {
                if(PlayerInfo[playerid][pToken] < 80)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 80;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1x Sawn Off, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 5:
            {
                if(PlayerInfo[playerid][pToken] < 90)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 90;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1x Micro Uzi, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 6:
            {
                if(PlayerInfo[playerid][pToken] < 180)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 180;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Week Gold VIP Donator,, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 7:
            {
                if(PlayerInfo[playerid][pToken] < 190)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 190;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Week Diamond VIP Donator,, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 8:
            {
                if(PlayerInfo[playerid][pToken] < 200)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 200;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Week Platinum VIP Donator, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 9:
            {
                if(PlayerInfo[playerid][pToken] < 220)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 220;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Month Gold VIP Donator, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 10:
            {
                if(PlayerInfo[playerid][pToken] < 230)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 230;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Month Diamond VIP Donator, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 11:
            {
                if(PlayerInfo[playerid][pToken] < 250)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 250;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange 1 Month Platinum VIP Donator, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 12:
            {
                if(PlayerInfo[playerid][pToken] < 270)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 270;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Small Backpack, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 13:
            {
                if(PlayerInfo[playerid][pToken] < 280)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 280;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Medium Backpack, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 14:
            {
                if(PlayerInfo[playerid][pToken] < 290)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 290;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Large Backpack, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 15:
            {
                if(PlayerInfo[playerid][pToken] < 300)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 300;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Small House, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 16:
            {
                if(PlayerInfo[playerid][pToken] < 310)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 310;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Medium House, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 17:
            {
                if(PlayerInfo[playerid][pToken] < 320)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 320;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Large House, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 18:
            {
                if(PlayerInfo[playerid][pToken] < 330)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 330;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Small Land, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 19:
            {
                if(PlayerInfo[playerid][pToken] < 340)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 340;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Medium Land, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
            case 20:
            {
                if(PlayerInfo[playerid][pToken] < 350)
                {
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You don't have enough token. You can't exchange this.");
                }

                PlayerInfo[playerid][pToken] -= 350;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                SendClientMessage(playerid, COLOR_YELLOW, "Your exchange request has been sent to online admins");
                SendAdminMessage(COLOR_YELLOW, "AdmWarning: %s[%i] has requesting to exchange Large Land, use telerport (/gotoid) ", GetRPName(playerid), playerid);
            }
        }
    }
    return 1;
}

Dialog:Complete_Mission(playerid, response, listitem, inputtext[]) 
{
    new string[1028] = "Mission:\tStatus:";
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                format(string, sizeof(string), "%s\n\
                Play a total of 5 Playing Hours\t%s\n\
                Play a total of 10 Playing Hours\t%s\n\
                Play a total of 15 Playing Hours\t%s\n\
                Play a total of 20 Playing Hours\t%s\n\
                Play a total of 25 Playing Hours\t%s", 
                string, 
                PlayerInfo[playerid][pTaskComplete][0] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][1] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][2] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][3] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][4] ? (""GREEN"Complete") : (""RED"Complete"));
                Dialog_Show(playerid, First_Mission, DIALOG_STYLE_TABLIST_HEADERS, "1st Mission", string, "Start", "Return");
            }
            case 1:
            {
                format(string, sizeof(string), "%s\n\
                Buy 1x Mobile Phone in 24/7 Phone Store (/locate > General Locations > Phone Store)\t3 Tokens\t%s\n\
                Buy 3x Cigars in 24/7 Business Store\t%s\n\
                Buy 1x Portable Radio in 24/7 Business Stor\t%s\n\
                Buy any Foods and Water in Business Restaurant\t%s\n\
                Buy 1x Phonebook in 24/7 Business Stor\t%s\n\
                Buy Deseart Eagle in Business Ammunation\t%s\n\
                Buy any clothes in Business Clothing Store\t%s\n\
                Buy any Fighting style in City Gym's\t%s\n\
                Buy any wine in Business Bar Club\t%s\n\
                Buy any Car in Dealership\t%s",
                string,
                PlayerInfo[playerid][pTaskComplete][5] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][6] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][7] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][8] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][9] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][10] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][11] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][12] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][13] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][14] ? (""GREEN"Complete") : (""RED"Complete"));
                Dialog_Show(playerid, Second_Mission, DIALOG_STYLE_TABLIST_HEADERS, "2nd Mission", string, "Start", "Return");
            }
            case 2:
            {
                format(string, sizeof(string), "%s\n\
                Work as pizza deliverer and deliver 10 pizza\t%s\n\
                Work as trucker and deliver in any business store 15 times\t%s\n\
                Work as fisherman and catch up 20 fishes\t%s\n\
                Work as harvest and complete collect all wheats 10 times\t%s\n\
                Work as miner and dig 30 rocks/stones\t%s",
                string, 
                PlayerInfo[playerid][pTaskComplete][15] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][16] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][17] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][18] ? (""GREEN"Complete") : (""RED"Complete"),
                PlayerInfo[playerid][pTaskComplete][19] ? (""GREEN"Complete") : (""RED"Complete"));
                Dialog_Show(playerid, Third_Mssion, DIALOG_STYLE_TABLIST_HEADERS, "3rd Mission", string, "Start", "Return");
            }
        }
    }
    return 1;
}

Dialog:Mission_Menu(playerid, response, listitem, inputtext[]) 
{
    new string[1028] = "Mission:\tStatus:";
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                format(string, sizeof(string), "%s\n\
                Play a total of 5 Playing Hours\t$150,000\n\
                Play a total of 10 Playing Hours\t$250,000\n\
                Play a total of 15 Playing Hours\t$350,000\n\
                Play a total of 20 Playing Hours\t$450,000\n\
                Play a total of 25 Playing Hours\t$550,000", string);
                Dialog_Show(playerid, First_Mission, DIALOG_STYLE_TABLIST_HEADERS, "1st Mission", string, "Start", "Return");
            }
            case 1:
            {
                format(string, sizeof(string), "%s\n\
                Buy 1x Mobile Phone in 24/7 Phone Store (/locate > General Locations > Phone Store)\t3 Tokens\n\
                Buy 3x Cigats in 24/7 Business Store\t3 Tokens\n\
                Buy 1x Portable Radio in 24/7 Business Stor\t3 Tokens\n\
                Buy any Foods and Water in Business Restaurant\t3 Tokens\n\
                Buy 1x Phonebook in 24/7 Business Stor\t3 Tokens\n\
                Buy Deseart Eagle in Business Ammunation\t3 Tokens\n\
                Buy any clothes in Business Clothing Store\t3 Tokens\n\
                Buy any Fighting style in City Gym's\t3 Tokens\n\
                Buy any wine in Business Bar Club\t3 Tokens\n\
                Buy any Car in Dealership\t3 Tokens", string);
                Dialog_Show(playerid, Second_Mission, DIALOG_STYLE_TABLIST_HEADERS, "2nd Mission", string, "Start", "Return");
            }
            case 2:
            {
                format(string, sizeof(string), "%s\n\
                Work as pizza deliverer and deliver 10 pizza\t5 Tokens\n\
                Work as trucker and deliver in any business store 15 times\t20 Tokens\n\
                Work as fisherman and catch up 20 fishes\t10 Tokens\n\
                Work as harvest and complete collect all wheats 10 times\t20 Tokens\n\
                Work as miner and dig 30 rocks/stones\t15 Tokens", string);
                Dialog_Show(playerid, Third_Mssion, DIALOG_STYLE_TABLIST_HEADERS, "3rd Mission", string, "Start", "Return");
            }
        }
    }
    return 1;
}

Dialog:First_Mission(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(PlayerInfo[playerid][pTaskComplete][0])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                
                if(PlayerInfo[playerid][pHours] < 5)
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to played less than 5 playing hours.");
                

                GivePlayerCash(playerid, 150000);
                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 1st task (1st Mission)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received $150,000 Ingame Cash");

                PlayerInfo[playerid][pTaskComplete][0] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_0 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 1:
            {
                if(PlayerInfo[playerid][pTaskComplete][1])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                
                if(PlayerInfo[playerid][pHours] < 10)
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to played less than 10 playing hours.");
                

                GivePlayerCash(playerid, 250000);
                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (2nd Mission)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received $250,000 Ingame Cash");

                PlayerInfo[playerid][pTaskComplete][1] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_1 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][1], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 2:
            {
                if(PlayerInfo[playerid][pTaskComplete][2])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                
                if(PlayerInfo[playerid][pHours] < 15)
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to played less than 15 playing hours.");
                

                GivePlayerCash(playerid, 350000);
                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 3rd task (3rd Mission)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received $350,000 Ingame Cash");

                PlayerInfo[playerid][pTaskComplete][1] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_2 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][1], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 3:
            {
                if(PlayerInfo[playerid][pTaskComplete][3])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                
                if(PlayerInfo[playerid][pHours] < 20)
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to played less than 20 playing hours.");
                

                GivePlayerCash(playerid, 450000);
                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 4th task (4th Mission)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received $450,000 Ingame Cash");

                PlayerInfo[playerid][pTaskComplete][3] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_3 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][3], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 4:
            {
                if(PlayerInfo[playerid][pTaskComplete][4])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                
                if(PlayerInfo[playerid][pHours] < 25)
                    return SendClientMessage(playerid, COLOR_SYNTAX, "You need to played less than 25 playing hours.");


                GivePlayerCash(playerid, 550000);
                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 5th task (5th Mission)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received $550,000 Ingame Cash");

                PlayerInfo[playerid][pTaskComplete][4] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_4 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][4], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
        }
    }
    return 1;
}

Dialog:Second_Mission(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(!PlayerInfo[playerid][pTaskStatus][0])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][5])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (1st Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][5] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_5 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 1:
            {
                if(!PlayerInfo[playerid][pTaskStatus][1])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][6])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (2nd Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][6] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_6 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 2:
            {   
                if(!PlayerInfo[playerid][pTaskStatus][2])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][7])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (3rd Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][7] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_7 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 3:
            {
                if(!PlayerInfo[playerid][pTaskStatus][3])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][8])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (4th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][8] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_8 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 4:
            {
                if(!PlayerInfo[playerid][pTaskStatus][4])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][9])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (5th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][9] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_9 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 5:
            {
                if(!PlayerInfo[playerid][pTaskStatus][5])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][10])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (6th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][10] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_10 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 6:
            {
                if(!PlayerInfo[playerid][pTaskStatus][6])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][11])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (7th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][11] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_11 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 7:
            {
                if(!PlayerInfo[playerid][pTaskStatus][7])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][12])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (8th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][12] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_12 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 8:
            {
                if(!PlayerInfo[playerid][pTaskStatus][8])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][13])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (9th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][13] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_13 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
            case 9:
            {
                if(!PlayerInfo[playerid][pTaskStatus][9])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is not done");
                
                if(PlayerInfo[playerid][pTaskComplete][14])
                    return SendClientMessage(playerid, COLOR_SYNTAX, "This mission is done");
                

                SendClientMessage(playerid, COLOR_YELLOW, "Thank you for completing the 2nd task (10th Missioon)");
                SendClientMessage(playerid, COLOR_SYNTAX, "You have received 3x Tokens");

                PlayerInfo[playerid][pToken] += 3;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET token = %i WHERE uid = %i", PlayerInfo[playerid][pToken], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);

                PlayerInfo[playerid][pTaskComplete][14] = 1;
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET task_14 = %i WHERE uid = %i", PlayerInfo[playerid][pTaskComplete][0], PlayerInfo[playerid][pID]);
	            mysql_tquery(connectionID, queryBuffer);
            }
        }
    }
    return 1;
}

Dialog:Third_Mssion(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {

            }
            case 1:
            {

            }
            case 2:
            {

            }
            case 3:
            {

            }
            case 4:
            {

            }
        }
    }
    return 1;
}