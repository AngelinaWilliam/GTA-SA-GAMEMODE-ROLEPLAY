#define SPAM_LIMIT 10 // maximum number of spacebar presses in a second before kick
#define WARN_LIMIT 3 // maximum warning before it kicks a player

new spam_count[MAX_PLAYERS]; // array to store spam count for each player
new warn_count[MAX_PLAYERS]; // array to store warn count for each player
new bool:enabledSB = false;

CMD:togsb(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 7)
    {
        return SCM(playerid, COLOR_SYNTAX, "You are not allowed to use this command.");
    }
    if(enabledSB == false)
    {
        enabledSB = true;
        SAM(COLOR_RED, "%s has turned on the anti-sprintbind system", GetRPName(playerid));
    }
    else 
    {
        enabledSB = false;
        SAM(COLOR_RED, "%s has turned off the anti-sprintbind system", GetRPName(playerid));
    }
    return 1;
}

// OnPlayerKeyStateChange callback function
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if (newkeys & KEY_SPRINT && PlayerInfo[playerid][pAdmin] < 7 && enabledSB == true) { // check if player pressed spacebar
        spam_count[playerid]++; // increment spam count for the player
        SetTimerEx("ResetSpamCount", 1000, false, "i", playerid); // set timer to reset spam count after 1 second
        if(spam_count[playerid] >= SPAM_LIMIT) // check if player exceeded spam limit
        {
            warn_count[playerid]++;
            SM(playerid, COLOR_RED, "You have been warned [%i / 3] for possibly using SprintBind Cleo.", warn_count[playerid]);
        }
        if(warn_count[playerid] >= WARN_LIMIT)
        {
            SMA(COLOR_RED, "%s has been kicked for possibly using a sprintbind.", GetRPName(playerid)); // notify all online players
            ResetSpamCount(playerid); // reset spam count for the player
            Kick(playerid); // kick player from server
        }
    }
    #if defined asb_OnPlayerKeyStateChange
		return asb_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange asb_OnPlayerKeyStateChange
#if defined asb_OnPlayerKeyStateChange
	forward asb_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

// ResetSpamCount timer function
forward ResetSpamCount(playerid);
public ResetSpamCount(playerid) {
    spam_count[playerid] = 0; // reset spam count for the player
    warn_count[playerid] = 0;
}
