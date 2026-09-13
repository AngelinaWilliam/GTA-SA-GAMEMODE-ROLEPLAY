#include <discord-connector>
#include <discord-cmd>

DCMD:profile(user, channel, params[])
{
    if(channel != member_channel)
    {   
        new channel_name[64], szString[128];
        DCC_GetChannelName(member_channel, channel_name, sizeof(channel_name));

        format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
        SendWrongChannel(channel, 0xFF0000, "Wrong Channel", szString);
        return 0;
    }
    if(isnull(params))
    {
        return SendMessageChannel(channel, 0xFF0000, "", "`Usage: !profile [username]`");
    }

    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT * FROM users WHERE username = '%e'", params);
    mysql_tquery(connectionID, queryBuffer, "DiscordCheckingStats", "s", params);
    return 1;
}

forward DiscordCheckingStats(username[]);
public DiscordCheckingStats(username[])
{
    member_channel = DCC_FindChannelById(DISCORD_CHANNEL_ONE);
    if(!cache_get_row_count(connectionID))
	{
        SendMessageChannel(member_channel, 0xFF0000, "Error: Invalid Username", "The player specified doesn't exist.");
    }
    else
    {
        new skin, hours, number;
        new online[20], string[1028], skinurl[1028];
        
        skin = cache_get_field_content_int(0, "skin");
        hours = cache_get_field_content_int(0, "hours");
        number = cache_get_field_content_int(0, "phone");

        if(!IsPlayerOnline(username)) {
            online = "Offline";
        } else {
            online = "Online";
        }

        new DCC_Embed:embed = DCC_CreateEmbed(""SERVER_NAME" Profile");
        format(string, sizeof(string), "**Name:** %s\n**Status:** %s\n**Skin:** %i\n**Playing Hours:** %i\n**Phone Number:** %i", username, online, skin, hours, number);
        format(skinurl, sizeof(skinurl), "https://assets.open.mp/assets/images/skins/%i.png", cache_get_field_content_int(0, "skin"));
        DCC_SetEmbedDescription(embed, string);
        DCC_SetEmbedImage(embed, skinurl);
        DCC_SetEmbedColor(embed, 0xFF0000);
        DCC_SendChannelEmbedMessage(member_channel, embed);
    }
}