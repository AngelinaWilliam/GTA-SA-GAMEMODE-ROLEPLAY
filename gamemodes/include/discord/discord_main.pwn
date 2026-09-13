#define DCMD_STRICT_CASE 
#define DCMD_ALLOW_BOTS
#define DISCORD_CHANNEL_ONE 	"1139361346186649661"    // Member
#define DISCORD_CHANNEL_TWO 	"1144726049930870924"    // Admin

new DCC_Channel:member_channel;
new DCC_Channel:admin_channel;

stock SendDiscordMessage(channel, message[]) {
	new DCC_Channel:ChannelId;
	switch(channel) {
		// log-admin
		case 0: {
			ChannelId = DCC_FindChannelById("1420295957026967604"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-chat
        case 1: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
		// log-roleplay
		case 2: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-properties
        case 3: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-global-chat
        case 4: {
			ChannelId = DCC_FindChannelById("1419920665577914409"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-join-and-leave
        case 5: {
			ChannelId = DCC_FindChannelById("11419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-verified
        case 6: {
			ChannelId = DCC_FindChannelById("1420296269003362335"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-whisper
        case 7: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-pm
        case 8: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
		// log-diamonds
        case 9: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
        // log-gpci
        case 10: {
			ChannelId = DCC_FindChannelById("1419920706107605024"); //
			DCC_SendChannelMessage(ChannelId, message);
		}
	}
	return 1;
}

forward SendMessageChannel(DCC_Channel:channel, color, const title[], const message[]);
public SendMessageChannel(DCC_Channel:channel, color, const title[], const message[])
{
    new DCC_Embed:embed= DCC_CreateEmbed(title);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, message);
    DCC_SendChannelEmbedMessage(channel, embed);
    return 1;
}

forward SendWrongChannel(DCC_Channel:channel, color, const title[], const message[]);
public SendWrongChannel(DCC_Channel:channel, color, const title[], const message[])
{
    new DCC_Embed:embed= DCC_CreateEmbed(title);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, message);
    DCC_SendChannelEmbedMessage(channel, embed);
    return 1;
}

forward DiscordBotStatus();
public DiscordBotStatus()
{
	new string[128 * 2];
	format(string, sizeof(string), "MGCRP | Players: %d/%d", Iter_Count(Player), MAX_PLAYERS);
	DCC_SetBotPresenceStatus(DO_NOT_DISTURB);
	DCC_SetBotActivity(string);
	member_channel = DCC_FindChannelById(DISCORD_CHANNEL_ONE);
	admin_channel = DCC_FindChannelById(DISCORD_CHANNEL_TWO);
	return 1;
}

public OnGameModeInit()
{
	SetTimer("DiscordBotStatus", 1000, true); 
    #if defined Discord_OnGameModeInit
        return Discord_OnGameModeInit();
    #else
        return 1;
    #endif
}
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Discord_OnGameModeInit
#if defined Discord_OnGameModeInit
    forward Discord_OnGameModeInit();
#endif


DCMD:players(user, channel, params[]) 
{
	new string[1000], dialog_string[1024], count = 0, name[24];
	if(channel != member_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(member_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    for(new i=0; i < MAX_PLAYERS; i++) {
    if(!IsPlayerConnected(i)) continue;
    GetPlayerName(i, name, MAX_PLAYER_NAME);
    {
        format(string, sizeof(string), "```(%d) : %s : %s\n```", i, name, number_format(PlayerInfo[i][pLevel]));
		strcat(dialog_string, string);
        count++;}
    }
    if (count == 0) return SendMessageChannel(member_channel, 0xFF0000, "Players", "There are no players online.");

	new DCC_Embed:embed = DCC_CreateEmbed("```ID - Name - Level\n```", dialog_string);
	DCC_SetEmbedColor(embed, 0x000000);
	DCC_SendChannelEmbedMessage(member_channel, embed);
    return 1;
}

DCMD:gangs(user, channel, params[]) 
{
	new string[1000], dialog_string[1024], count = 0;
	if(channel != member_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(member_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    for(new gangid = 0; gangid < MAX_GANGS; gangid ++)
    {
        if(GangInfo[gangid][gSetup] == 1)
		{
        format(string, sizeof(string), "> (%i) : %s\n",  gangid, GangInfo[gangid][gName]);
		strcat(dialog_string, string);
        count++;
		}
    }
    if (count == 0) return SendMessageChannel(member_channel, 0xFF0000, "List of Gangs", "There are no gangs created..");

	new DCC_Embed:embed = DCC_CreateEmbed("List Oof Gangs", dialog_string);
	DCC_SetEmbedColor(embed, 0x000000);
	DCC_SendChannelEmbedMessage(member_channel, embed);
    return 1;
}

DCMD:factions(user, channel, params[]) 
{
	new string[1000], dialog_string[1024], count = 0;
	if(channel != member_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(member_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
	for(new factionid = 1; factionid < MAX_FACTIONS; factionid++)
	{
		if(FactionInfo[factionid][fType] != FACTION_NONE) {
			
			if(FactionInfo[factionid][fType] == FACTION_HITMAN)
			{
				format(string, sizeof(string), "%i %s Confidential\n", factionid, FactionInfo[factionid][fName]);
				
			}
			else
			{
				format(string, sizeof(string), "%i %s\n", factionid, FactionInfo[factionid][fName], FactionInfo[factionid][fLeader]);
			}
			strcat(dialog_string, string);
			count++;
		}
    }
    if (count == 0) return SendMessageChannel(member_channel, 0xFF0000, "List of Factions", "There are no gangs created..");

	new DCC_Embed:embed = DCC_CreateEmbed("List of Factions", dialog_string);
	DCC_SetEmbedColor(embed, 0x000000);
	DCC_SendChannelEmbedMessage(member_channel, embed);
    return 1;
}

DCMD:kick(user, channel, params[]) 
{
    new targetid, reason[24], string[128], rpname[MAX_PLAYER_NAME + 1];
	if(channel != admin_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(admin_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }

    if (sscanf(params, "us[24]", targetid, reason))
        return SendMessageChannel(admin_channel, 0xFF0000, "", "`Usage: !kick [playerid] [reason]`");

    if (targetid == INVALID_PLAYER_ID)
        return SendMessageChannel(admin_channel, 0xFF0000, "", "`Invalid player specified.`");

    GetPlayerName(targetid, rpname, sizeof rpname);

    Kick(targetid);
	format(string, sizeof(string), "%s has been kicked from server, Reason: %s", rpname, reason);
    return SendMessageChannel(admin_channel, 0xFF0000, "", string);
}

DCMD:whitelist(user, channel, params[]) 
{
    new username[MAX_PLAYER_NAME];
    if(channel != admin_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(admin_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    if(sscanf(params, "s[24]", username))
    {
        return SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "Usage: !whitelist [username]");
    }

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT locked FROM users WHERE username = '%e'", username);
    mysql_tquery(connectionID, queryBuffer, "OnDiscordUnlockAccount", "s", username);
    return 1;
}

DCMD:blacklist(user, channel, params[]) 
{
    new username[MAX_PLAYER_NAME];
    if(channel != admin_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(admin_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    if(sscanf(params, "s[24]", username))
    {
        return SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "Usage: !blacklist [username]");
    }

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT uid FROM users WHERE username = '%e' AND locked = 1", username);
    mysql_tquery(connectionID, queryBuffer, "OnDiscordLockAccount", "s", username);
    return 1;
}

DCMD:togwhitelist(user, channel, params[]) 
{
    new option;
    if(channel != admin_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(admin_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    if(sscanf(params, "i", option) || !(0 <= option <= 1))
	{
        SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "Usage: /togwhitelist [(1/0)]");
	}
    
    switch(option)
    {
        case 0:
        {
            mysql_tquery(connectionID, "UPDATE users SET locked = 0");
            SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "All player's account has set into blacklist");
        }
        case 1:
        {
            mysql_tquery(connectionID, "UPDATE users SET locked = 1");
            SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "All player's account has set into whitelist");
        }
    }
    return 1;
}

forward OnDiscordLockAccount(username[]);
public OnDiscordLockAccount(username[])
{
    new string[128];
	if(!cache_get_row_count(connectionID))
	{
        SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "The player specified doesn't exist, or their account is not locked.");
	}
	else
	{
	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET locked = 0 WHERE username = '%e'", username);
	    mysql_tquery(connectionID, queryBuffer);

        format(string, sizeof(string), "You have been successfully blacklist %s", username);
        SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", string);
	}
}

forward OnDiscordUnlockAccount(username[]);
public OnDiscordUnlockAccount(username[])
{
    new string[128];
 	if(!cache_get_row_count(connectionID))
	{
        SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", "The player specified doesn't exist, or their account is not locked.");
	}
	else
	{
	    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET locked = 1 WHERE username = '%e'", username);
	    mysql_tquery(connectionID, queryBuffer);

	    format(string, sizeof(string), "You have been successfully whitelist %s", username);
        SendMessageChannel(admin_channel, 0xFF0000, "Whitelist System", string);
	}
}