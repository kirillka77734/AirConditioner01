
need_ent <- null;


function Give_AD()
{
    local player = null;
    while(player = Entities.FindByClassname(player, "player"))
    {
        if(player.IsSurvivor() && !IsPlayerABot(player))
            player.GiveItem("adrenaline");
    }
}


function Show_runHint()
{
    local ent = null;
    while(ent =Entities.FindByName(ent, "water_rush"))
        need_ent = ent;

    local player = null;
    while(player = Entities.FindByClassname(player, "player"))
    {
        if(player.GetZombieType() == 9 && (!IsPlayerABot(player)))
		{
			local language = Convars.GetClientConvarValue("cl_language", player.GetEntityIndex());
			local msg = " ";
			switch(language){
				case "schinese":case "tchinese":	msg = "使用肾上腺素，沿着发光的花跑！"; break;
				default:							msg = "Use Adrenaline, Run along with the glowing plants!";	break;
			}

			need_ent.__KeyValueFromString("hint_caption",msg);
			DoEntFire( "water_rush", "ShowHint", "", 0.0, player, player );	
		}	
    }
}




function Help_WaterBot()
{
    local bot = null;
    while(bot = Entities.FindByClassname(bot, "player"))
    {
        if(bot.IsSurvivor() && IsPlayerABot(bot))
        {
            local botpos = bot.GetOrigin();
            local nav = NavMesh.GetNavArea(botpos, 999.0);
            if(nav.IsUnderwater())
                bot.UseAdrenaline(5.0);
        }
    }
}