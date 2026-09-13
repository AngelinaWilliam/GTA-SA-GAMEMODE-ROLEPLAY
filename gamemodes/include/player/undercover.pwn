new const randFirstname[][] = {
	"Alex", "Blake", "Hayden", "Devin", "Jane", "John", "Austin", "Richy", "Richard", "Alexander",
	"Salem", "Daisy", "Janey", "Casey", "Orlando", "Jake", "Kevin", "Faze", "India", "Vene", "Demorgan", "Jazzy", "Dori", "Jess", "Linda",
	"Dave", "Jessica", "Masey", "Rose", "Romeo", "Juliet", "Ben", "Lenny", "Kayle", "Emily", "Tori", "Michael", "Mike", "Mikey", "Christian", "Josh", "Travis",
	"Dulles", "William", "Stephen", "Peter", "Quin", "Raze", "Morgan", "Oliver", "Madison", "Mark", "Robin", "Tyler", "Sophie", "Sophia", "Brianna", "Azure", "Steely", "Lee",
	"Ray", "Harry", "Ralph", "Anthony", "Alan", "Shawn", "Kanye", "Kane", "Stephanie", "Kimmy", "Kim" "Fox", "Bob", "Adore", "Lexi", "Rex", "Hex", "Xav", "Wally", "Stone", "Kate", "Katie", "Patrick", "James", "Thomas", "Hank",
	"George", "David", "Dori", "Dante", "Jordan", "Arnold" };

new const randLastname[][] = {
	"Craig", "Jones", "Johnson", "Kennedy", "Hinson", "Doe", "Silva", "Nigeria", "Branche", "Erickson", "Defolt", "Morgan",
	"Stalovsky", "Box", "Wards", "Sanders", "Williams", "Trump", "Nixon", "Jackson", "Houston", "Hilfiger", "Gucci", "Washington", "Clinton",
	"Cromwell", "Prime", "Connor", "ONeil", "Rose", "Ginger", "Dodge", "McKing", "Guerreo", "Jackson", "Cartel", "Devil", "Rolex", "Street", "Molintino",
	"Martin", "Stone", "Henderson", "Brady", "Wilkinson" }; // keep adding names if u want

GetRandomName()
{
	new rand[2], name[60];
	rand[0] = random(sizeof(randFirstname));
	rand[1] = random(sizeof(randLastname));

	if(strcmp(randFirstname[rand[0]], randLastname[rand[1]], true) != 0)
	{
	    format(name, sizeof(name), "%s_%s", randFirstname[rand[0]], randLastname[rand[1]]);
		if(strlen(name) < MAX_PLAYER_NAME)
   		{
		    return name;
   		}
	}
 	return GetRandomName();
}

forward OnUndercover(playerid, tog, name[], level, Float:hp, Float:armor);
public OnUndercover(playerid, tog, name[], level, Float:hp, Float:armor)
{
	if(tog)
	{
		if(cache_get_row_count(connectionID))
		{
		    SendClientMessage(playerid, COLOR_GREY, "The name specified is taken already.");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "** You changed your name from %s to %s.", GetRPName(playerid), name);
			PlayerInfo[playerid][pUndercover][0] = 1;
			PlayerInfo[playerid][pUndercover][1] = PlayerInfo[playerid][pLevel];
			PlayerInfo[playerid][pUndercoverHP] = PlayerInfo[playerid][pHealth];
			PlayerInfo[playerid][pUndercoverAR] = PlayerInfo[playerid][pArmor];
			PlayerInfo[playerid][pLevel] = level;
			SetPlayerHealth(playerid, hp);
			SetScriptArmour(playerid, armor);
			SetPlayerName(playerid, name);
	    	SendClientMessage(playerid, COLOR_WHITE, "** You are now hidden in /admins and your admin rank no longer shows in /g or /o.");
		}
	}
	else
	{
	    SetPlayerName(playerid, PlayerInfo[playerid][pUsername]);
		PlayerInfo[playerid][pUndercover][0] = 0;
		PlayerInfo[playerid][pLevel] = PlayerInfo[playerid][pUndercover][1];
		SetPlayerHealth(playerid, PlayerInfo[playerid][pUndercoverHP]);
		SetScriptArmour(playerid, PlayerInfo[playerid][pUndercoverAR]);
	    SendClientMessage(playerid, COLOR_WHITE, "** You are no longer hidden as an administrator.");
	}
	return 1;
}

CMD:undercover(playerid, params[])
{
	new name[MAX_PLAYER_NAME], level, Float:ar;
	if(GetFactionType(playerid) != FACTION_HITMAN && IsLawEnforcement(playerid))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "You can't use this command as you're not a hitman.");
	}
	if(sscanf(params, "s[24]", name))
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /undercover [name | random | off]");
	}
    if(PlayerInfo[playerid][pUndercover][0])
    {
 		OnUndercover(playerid, 0, "", 0, 0.0, 0.0);
 		SendClientMessageEx(playerid, COLOR_WHITE, "** You are no longer undercover.", GetRPName(playerid), name);
    }
    else if(!strcmp(name, "random", true)) {
		strcpy(name, GetRandomName());
		level = random(9) + 1;
		ar = float(random(50)+50);
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT uid FROM users WHERE username = '%e'", name);
		mysql_tquery(connectionID, queryBuffer, "OnUndercover", "iisiff", playerid, 1, name, level, 100.0, ar);
	}
	else if(strfind(name, "_") != -1) {
		level = random(9) + 1;
		ar = float(random(50)+50);
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT uid FROM users WHERE username = '%e'", name);
		mysql_tquery(connectionID, queryBuffer, "OnUndercover", "iisiff", playerid, 1, name, level, 100.0, ar);
	}
	else
	{
	    return SendClientMessage(playerid, COLOR_SYNTAX, "Usage: /undercover [Firstname_Lastname | random]");
	}
	return 1;
}