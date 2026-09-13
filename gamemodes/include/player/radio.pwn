enum RADIOS_ENUM
{
	radioID,
	radioChannel,
	radioOwner,
	radioPass[33],
	radioOn
}
new RadiosInfo[MAX_RADIOS][RADIOS_ENUM];

forward LoadDynamicRadios();
public LoadDynamicRadios()
{
    new rows = cache_num_rows(), time = GetTickCount(), total;

	if (!rows)	return print("[Radio] No records found.");

	for(new i; i < rows && i < MAX_RADIOS; i ++)
	{
	    new radioid = cache_get_field_content_int(i, "id");
	    
		RadiosInfo[radioid][radioChannel] = cache_get_field_content_int(i, "channelid");
		RadiosInfo[radioid][radioOwner] = cache_get_field_content_int(i, "owner");
		cache_get_field_content(i, "pass", RadiosInfo[radioid][radioPass], connectionID, 33);

		RadiosInfo[radioid][radioOn] = 1;
		walkietalkiestream[radioid] = SvCreateGStream(0xffff0000, "Radio");
		
		total++;
	}
	printf("[Radio] Rows - %i. Load - %i. Time: %i ms.", rows, total, GetTickCount()-time);
	return 1;
}

forward OnChannelInsert(playerid, channel);
public OnChannelInsert(playerid, channel)
{
	if (!PlayerInfo[playerid][pLogged]) return 1;

    RadiosInfo[channel][radioOn] = 1;
	RadiosInfo[channel][radioID] = cache_insert_id();
	return 1;
}