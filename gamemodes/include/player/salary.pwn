ShowConfigSalary(playerid)
{
    new string[1028] = "Option:\tToggle:";

    format(string, sizeof(string), "%s\n\
    2x Salary\t%s\n\
    3x Salary\t%s\n\
    4x Salary\t%s", 
    string,
    gDoubleSalary ? (""YELLOW"Enabled") : (""RED"Disabled"),
    g3xSalary ? (""YELLOW"Enabled") : (""RED"Disabled"),
    g4xSalary ? (""YELLOW"Enabled") : (""RED"Disabled"));
    Dialog_Show(playerid, Config_Salary, DIALOG_STYLE_TABLIST_HEADERS, "Configuratio of Job Salary", string, "Start", "Return");
    return 1;
}

CMD:configsalary(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 7)
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
    ShowConfigSalary(playerid);
    return 1;
}

Dialog:Config_Salary(playerid, response, listitem, inputtext[]) 
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(!gDoubleSalary)
                {
                    gDoubleSalary = true;
                    SendRconCommand("hostname [2x Salary] "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has enabled double salary. You will now gain double of any jobs salary ))", GetRPName(playerid));
                }
                else
                {
                    gDoubleSalary = false;
                    SendRconCommand("hostname "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has disable double salary ))", GetRPName(playerid));
                }

                g3xSalary = false;
                g4xSalary = false;
                ShowConfigSalary(playerid);
            }
            case 1:
            {
                if(!g3xSalary)
                {
                    g3xSalary = true;
                    SendRconCommand("hostname [3x Salary] "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has enabled 3x salary. You will now gain 3x of any jobs salary ))", GetRPName(playerid));
                }
                else
                {
                    g3xSalary = false;
                    SendRconCommand("hostname "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has disable 3x salary ))", GetRPName(playerid));
                }

                gDoubleSalary = false;
                g4xSalary = false;
                ShowConfigSalary(playerid);
            }
            case 2:
            {
                if(!g4xSalary)
                {
                    g4xSalary = true;
                    SendRconCommand("hostname [4x Salary] "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has enabled 4x salary. You will now gain 4x of any jobs salary ))", GetRPName(playerid));
                }
                else
                {
                    g4xSalary = false;
                    SendRconCommand("hostname "SERVER_NAME"");
                    SendMessageToAll(COLOR_WHITE, "(( Administrator %s: has disable 4x salary ))", GetRPName(playerid));
                }

                gDoubleSalary = false;
                g3xSalary = false;
                ShowConfigSalary(playerid);
            }
        }
    }
    return 1;
}