
::worldspwan <- Entities.FindByClassname(null, "worldspawn");
::Disable_tank <-{
	Events = {}
    title_table = {}
}


// 防止导演克刷在奇怪的地方
::Disable_tank.Events.OnGameEvent_tank_spawn <-function(event) {
	if(Director.GetMapName() == "l4d2_mimp1" || Director.GetMapName() == "l4d2_mimp3" || Director.GetMapName() == "l4d2_mimp4" )
    {
        local tank = GetPlayerFromUserID(event["userid"]);
        local origin = tank.GetOrigin();
        local ent = null;
        ent = Entities.FindByClassnameWithin(ent, "commentary_zombie_spawner", origin, 500.0);
        if(ent == null)
        {
            tank.Kill();
        }
    }
}



// 每2分钟给在场bot随机药/针
function Disable_tank::GiveAward()
{
    local map = Director.GetMapName();
    if( map == "l4d2_mimp5" || map == "l4d2_mimp3" || map == "l4d2_mimp4" || map == "l4d2_mimp6" || map == "l4d2_mimp1" || map == "l4d2_mimp2")
    {
        for(local i = 1; i<= 32; i++)
        {
            local player = EntIndexToHScript(i);
            if(!player || !player.IsPlayer())
                continue;
            
            if(player.GetZombieType() != 9 || player.IsDead() || player.IsDying() || !IsPlayerABot(player))
                continue;
            
            player.GiveItem("pain_pills");
        }
    }
    DoEntFire("!self", "RunScriptCode", "Disable_tank.GiveAward()", 120.0, worldspwan, worldspwan);
}








function Disable_tank::DelayGive()
{
    // local player = null;
    // while(player = Entities.FindByClassname(player, "player"))
    // {
    //     local choice = 0;
    //     if(player.IsSurvivor() && !IsPlayerABot(player))
    //     {
    //         local steamid = player.GetNetworkIDString();
    //         try{
    //             choice = DirectorScript.Disable_tank.title_table.rawget(steamid);
    //         }
    //         catch(err){
    //             choice = 0;
    //         }
    //         local path_use = "";
    //         switch(choice)
    //         {
    //             case 1:
    //                 path_use = "sprites/fw.vmt"; break;
    //             case 2:
    //                 path_use = "sprites/gs.vmt"; break;
    //             case 3:
    //                 path_use = "sprites/lz.vmt"; break;
    //             case 4:
    //                 path_use = "sprites/zs.vmt"; break;
    //         }
    //         local origin = player.GetOrigin();
    //         origin.z = origin.z + 90;
    //         local ent = SpawnEntityFromTable("env_sprite",{
    //         origin = origin,
    //         rendermode = 2,
    //         model = path_use
    //         })
    //         DoEntFire("!self", "SetParent","!activator" , 0.0, player, ent);
    //     }
    // }
}


::Disable_tank.Events.OnGameEvent_round_start <-function(event) {
    DoEntFire("!self", "RunScriptCode", "Disable_tank.GiveAward()", 120.0, worldspwan, worldspwan);
}




__CollectEventCallbacks(::Disable_tank.Events, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);