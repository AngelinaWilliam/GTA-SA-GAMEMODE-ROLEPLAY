CMD:checkdoublesalary(playerid, params[])
{   
    SendMessage(playerid, COLOR_YELLOW, "========================= ["SERVER_NAME" Double Salary Information] =========================");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"7:00 AM - 10:00 AM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"1:00 PM - 4:00 PM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"6:00 PM - 10:00 PM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"1:00 AM - 4:00 AM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "=============================================================================================");
    return 1;
}

CMD:checkdoubleexp(playerid, params[])
{   
    SendMessage(playerid, COLOR_YELLOW, "========================= ["SERVER_NAME" Double Experience Information] =========================");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"7:00 AM - 10:00 AM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"1:00 PM - 4:00 PM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"6:00 PM - 10:00 PM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"1:00 AM - 4:00 AM "GREY"(Server Time)");
    SendMessage(playerid, COLOR_YELLOW, "=============================================================================================");
    return 1;
}

CMD:checkdiamondmining(playerid, params[])
{
    if(enableDiamond)
    {
        SendMessage(playerid, COLOR_YELLOW, "========================= ["SERVER_NAME" Double Experience Information] =========================");
        SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"7:00 AM - 6:00 PM "GREEN"(Active)");
        SendMessage(playerid, COLOR_YELLOW, "=============================================================================================");
    }
    else
    {
        SendMessage(playerid, COLOR_YELLOW, "========================= ["SERVER_NAME" Double Experience Information] =========================");
        SendMessage(playerid, COLOR_YELLOW, "PH Time: "WHITE"7:00 AM - 6:00 PM "GREY"(Server Time)");
        SendMessage(playerid, COLOR_YELLOW, "=============================================================================================");
    }
    return 1;
} 