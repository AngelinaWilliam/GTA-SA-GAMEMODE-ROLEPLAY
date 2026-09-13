#include <discord-cmd>

#define DCMD_PREFIX '!'

// Guild
#define GUILD "1357328969300705512"    // Discord Server ID
/*
#define DISCORD_ID			"1357328969300705512"    // Discord Server ID
#define DISCORD_CHANNEL 	"1404718133100679218"    // Discord channel ID
#define ROLE_ID				"1357328969346711714"  // Discord Role ID 1205164080675946506
*/
// Roles
#define ROLE_VERIFY "1419704061053374646"  // Discord Role ID
#define ROLE_ADMIN "1419738409517191179"
#define ROLE_HELPER "1420294945650118757"
#define ROLE_FACTION "1420294790364401685"
#define ROLE_GANG "1420295095433039962"

// Channels
#define CHANNEL_VERIFY "1419718059752427695"    // Discord channel ID
#define CHANNEL_ROLEREQ "1151446411947298826"

#define DC_FOOTER "1998 Gang Development - !help for more info"

// Functions
CreateEmbed(const channel[], const desc[] = "")
{
	return DCC_SendChannelEmbedMessage(DCC_FindChannelById(channel), DCC_CreateEmbed("", desc, "", "", 0, DC_FOOTER));
}

// In-game commands
stock DiscordVerification(playerid)
{
	PlayerInfo[playerid][pDiscordCode] = random(899) + 100;
	SendMessage(playerid, COLOR_YELLOW, "Your confirmation code is: %i. Your code expires in 5 minutes.", PlayerInfo[playerid][pDiscordCode]);
	Dialog_Show(playerid, -1, DIALOG_STYLE_MSGBOX, "Discord Verification", "Your confirmation code is: %i. Your code expires in 5 minutes\nReply '!verify %i' in verification channel at "SERVER_URL"", "Close", "", PlayerInfo[playerid][pDiscordCode], PlayerInfo[playerid][pDiscordCode]);
	return 1;
}

stock DC_OnUserUnlink(playerid)
{
	// Remove roles
	DCC_RemoveGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(PlayerInfo[playerid][pDiscord]), DCC_FindRoleById(ROLE_VERIFY));
	if(PlayerInfo[playerid][pAdmin])
	{
		DCC_RemoveGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(PlayerInfo[playerid][pDiscord]), DCC_FindRoleById(ROLE_ADMIN));
	}
	if(PlayerInfo[playerid][pHelper])
	{
		DCC_RemoveGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(PlayerInfo[playerid][pDiscord]), DCC_FindRoleById(ROLE_HELPER));
	}

	// Player
	strcpy(PlayerInfo[playerid][pDiscord], "None", 21);
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET discord_id = 'None' WHERE uid = %i", PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);
	return 1;
}

IsPlayerVerified(playerid) {
    return PlayerInfo[playerid][pVerified];
}

CMD:getcode(playerid, params[])
{
	DiscordVerification(playerid);
	return 1;
}

// Discord commands
DCMD:verify(user, channel, params[])
{
	new duserid[DCC_ID_SIZE], code;
	DCC_GetUserId(user, duserid, sizeof(duserid));

	if(channel != DCC_FindChannelById(CHANNEL_VERIFY)) return DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", "`You can use this command in verification channel.`", "", "", 0, DC_FOOTER));
	if(sscanf(params, "i", code)) return DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", "`Usage: !verify [code]`", "", "", 0, DC_FOOTER));
	if(code == -1) return DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", "`Usage: !verify [code]`", "", "", 0, DC_FOOTER));

	foreach(new i : Player)
	{
		if(PlayerInfo[i][pDiscordCode] == code)
		{
			new string[128*2];
			format(string, sizeof(string), "**Player Verification**\nThe user has been successfully linked.\n`Name:` %s\n`Discord:` <@%s>\n`Level:` %i\n`Role added:` <@&"ROLE_VERIFY">", GetRPName(i), duserid, PlayerInfo[i][pLevel]);
			DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", string, "", "", 0, DC_FOOTER));

			// Change the name into Roleplay
			DCC_SetGuildMemberNickname(DCC_FindGuildById(GUILD), user, GetPlayerNameEx(i)); // Nickname
			DCC_AddGuildMemberRole(DCC_FindGuildById(GUILD), user, DCC_FindRoleById(ROLE_VERIFY)); // Role

			strcpy(PlayerInfo[i][pDiscord], duserid, MAX_PLAYER_NAME);
			SendMessage(i, COLOR_YELLOW, "Discord verification: Your account is now linked to %s.", duserid);

			// Save the UID into database
			PlayerInfo[i][pDiscordCode] = -1;
			PlayerInfo[i][pVerified] = 1;
			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET discord_id = %s, verified = %i WHERE uid = %i", duserid, PlayerInfo[i][pVerified], PlayerInfo[i][pID]);
			mysql_tquery(connectionID, queryBuffer);

			TogglePlayerControllable(i, true);
			return 1;
		}
	}
	DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", "`Error verification code!`", "", "", 0, DC_FOOTER));
	return 1;
}

DCMD:role(user, channel, params[])
{
	new uid[DCC_ID_SIZE], chid[DCC_ID_SIZE];
	DCC_GetUserId(user, uid, sizeof(uid));
	DCC_GetChannelId(channel, chid, sizeof(chid));

	if(channel != DCC_FindChannelById(CHANNEL_ROLEREQ)) return DCC_SendChannelEmbedMessage(channel, DCC_CreateEmbed("", "`You can use this command in role channel.`", "", "", 0, DC_FOOTER));

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT adminlevel, helperlevel, faction, gang FROM users WHERE discord_id = '%s'", uid);
	mysql_tquery(connectionID, queryBuffer, "DC_OnPlayerRole", "ss", uid, chid);
	return 1;
}

forward DC_OnPlayerRole(user[], channel[]); 
public DC_OnPlayerRole(user[], channel[])
{
	if(!cache_get_row_count(connectionID))
	{
		CreateEmbed(channel, "`You are not verify yet.`");
	}
	else
	{
		new string[128], count = 0;
		if(cache_get_field_content_int(0, "adminlevel") > 0)
		{
			DCC_AddGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(user), DCC_FindRoleById(ROLE_ADMIN));
			format(string, sizeof(string), "`Discord:` <@%s>\n`Role added:` <@&"ROLE_ADMIN">", user);
			CreateEmbed(channel, string);
			count++;
		}
		if(cache_get_field_content_int(0, "helperlevel") > 0)
		{
			DCC_AddGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(user), DCC_FindRoleById(ROLE_HELPER));
			format(string, sizeof(string), "`Discord:` <@%s>\n`Role added:` <@&"ROLE_HELPER">", user);
			CreateEmbed(channel, string);
			count++;
		}
		if(cache_get_field_content_int(0, "faction") > 0)
		{
			DCC_AddGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(user), DCC_FindRoleById(ROLE_FACTION));
			format(string, sizeof(string), "`Discord:` <@%s>\n`Role added:` <@&"ROLE_FACTION">", user);
			CreateEmbed(channel, string);
			count++;
		}
		if(cache_get_field_content_int(0, "gang") > 0)
		{
			DCC_AddGuildMemberRole(DCC_FindGuildById(GUILD), DCC_FindUserById(user), DCC_FindRoleById(ROLE_GANG));
			format(string, sizeof(string), "`Discord:` <@%s>\n`Role added:` <@&"ROLE_GANG">", user);
			CreateEmbed(channel, string);
			count++;
		}
		if(count == 0)
		{
			CreateEmbed(channel, "`You don't have permission to use this command.`");
		}
	}
}
