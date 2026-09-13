new RandomMessagesToSend[][] =
{
    "Need help? The Community Advisors are here to help you. (/requesthelp to get help)",
    "Join our discord community "SERVER_URL""
};

forward SendRandomMessageToAll();
public SendRandomMessageToAll()
{
    SendMessageToAll(COLOR_LIGHTBLUE, RandomMessagesToSend[random(sizeof(RandomMessagesToSend))]);
    return 1;
}

public OnGameModeInit()
{
    SetTimer("SendRandomMessageToAll",600000,1);
    
    #if defined Randommsg_OnGameModeInit
		return Randommsg_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Randommsg_OnGameModeInit
#if defined Randommsg_OnGameModeInit
	forward Randommsg_OnGameModeInit();
#endif
