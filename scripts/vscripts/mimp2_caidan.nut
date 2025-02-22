

b_HaveTrigger <- false;
wave_num <- 0;
i_helpnum <- 0;


function BoolStart()
{
    b_HaveTrigger = true;
}
function BoolEnd()
{
    b_HaveTrigger = false;      
}


function PreventShove()
{
    if(activator.IsSurvivor())
        NetProps.SetPropFloat(activator, "m_flNextShoveTime", Time() + 1.0); 
}


function TelepSurvToTarget(player, target_string)
{
    player.SetOrigin(Entities.FindByName(null, target_string).GetOrigin())
}


function TelepOtherSurvToSafeArea()
{
    local player = null;
    local telep_num = 0;
    while(player = Entities.FindByClassname(player, "player"))
    {
        if(player.GetZombieType() == 9 && !player.IsDead() && !player.IsDying())
        {
            local origin = player.GetOrigin();
            if((origin.y < 13924.0 && origin.y > 11075.5 && origin.x < -11128.5 && origin.x > -14270.0 && player != activator) || IsPlayerABot(player))
            {
                switch (telep_num)
                {
                    case 0:
                    {
                        TelepSurvToTarget(player, "target_A");
                        telep_num = telep_num + 1;
                        break;
                    }
                    case 1:
                    {
                        TelepSurvToTarget(player, "target_B");
                        telep_num = telep_num + 1;
                        break;
                    }
                    case 2:
                    {
                        TelepSurvToTarget(player, "target_C");
                        telep_num = telep_num + 1;
                        break;
                    }
                    case 3:
                    {
                        TelepSurvToTarget(player, "target_D");
                        telep_num = 0;
                        break;
                    }
                }
            }
        }
        else if(player.GetZombieType() <= 8)
        {
            local world = Entities.FindByClassname(null, "worldspawn");
            player.TakeDamage(player.GetMaxHealth()+ 1.0, 2, world);
        }
    }
}


function OnGameEvent_player_hurt(event)
{
    if(!b_HaveTrigger)
        return;
    
    local attacker = GetPlayerFromUserID(event["attacker"]);
    local victim = GetPlayerFromUserID(event["userid"]);
    local iZclass = NetProps.GetPropInt(attacker, "m_zombieClass");

    if(victim.IsSurvivor() && IsPlayerABot(attacker) &&  iZclass < 6 && victim.IsDominatedBySpecialInfected())
    {
        local iRemainingHealth = attacker.GetHealth();
        local class_name = "";
        switch (iZclass)
        {
            case 3:
                class_name = "hunter"; break;
            case 5:
                class_name = "jockey"; break;
        }
        local vit_name = victim.GetPlayerName();
        ClientPrint(null, 5, format("%s真是废物一个，能被%s控，多和9帝学学", vit_name, class_name));
        attacker.TakeDamage((attacker.GetMaxHealth() + 1), 2, victim);
        i_helpnum = i_helpnum + 1;
    }
}


function Update_SpawnZombie()
{
    if(!b_HaveTrigger)
        return;
    
    wave_num = wave_num + 1;
    EntFire("start_sound", "PlaySound", "", 1.0);
    EntFire("mimp2_caidan", "RunScriptCode", "SpawnZombie()", 1.0);

    EntFire("mimp2_caidan", "RunScriptCode", "Update_SpawnZombie()", 9.0);
}


function SpawnZombie()
{
    switch (wave_num)
    {
        case 0:
        {
            for(local i = 0; i < 1; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 3, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            break;
        }
        case 1:
        {
            for(local i = 0; i < 2; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 5, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            break;
        }
        case 2:
        {
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 3, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            break;
        }
        case 3:
        {
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 5, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            local ent = null;
            while(ent = Entities.FindByClassname(ent, "player"))
            {
                if(ent.GetZombieType() == 5)
                {
                    ent.__KeyValueFromInt("rendermode", 1);
                    ent.__KeyValueFromInt("renderamt", 1);
                }
            }
            break;
        }NetProps.SetPropFloat(player, "m_flLaggedMovementValue", 2.0);
        case 4:
        {
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 3, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            local ent = null;
            while(ent = Entities.FindByClassname(ent, "player"))
            {
                if(ent.GetZombieType() == 5)
                {
                    ent.__KeyValueFromInt("rendermode", 1);
                    ent.__KeyValueFromInt("renderamt", 1);
                }
            }
            break;
        }
        case 5:
        {
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 5, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            local ent = null;
            while(ent = Entities.FindByClassname(ent, "player"))
            {
                if(ent.GetZombieType() == 5)
                {
                    NetProps.SetPropFloat(ent, "m_flLaggedMovementValue", 2.0);
                }
            }
            break;
        }
        case 6:
        {
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 5, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            for(local i = 0; i < 3; i ++)
            {
                local num = RandomInt(1, 14);
                local spawn_point = "wave" + num.tostring();
                ZSpawn( { type = 3, pos =  Entities.FindByName(null, spawn_point).GetOrigin()} );
            }
            break;
        }
        case 8:
        {
            Finale_Sum();
            wave_num = 0;
            b_HaveTrigger = false;
            break;
        }
        
    }
    EntFire("mimp2_caidan", "RunScriptCode", "Update_SpawnZombie()", 8.0);
}




function Finale_Sum()
{
    EntFire("help_player", "Enable", "", 0.0);
    EntFire("telep_away", "Enable", "", 0.0);
    EntFire("telep_away", "Disable", "", 1.0);
    EntFire("help_player", "Disable", "", 2.0);
    EntFire("tiaozhan_end", "Trigger", "", 0.5);
}



function GiveTitle()
{
    local path_use = "";    local choice;
    if(i_helpnum == 0)
        choice = 4;
    else if(i_helpnum <= 3)
        choice = 3;
    else if(i_helpnum <= 6)
        choice = 2;
    else
        choice = 1;
    switch(choice)
    {
        case 1:
            path_use = "【空爆废物】"; break;
        case 2:
            path_use = "【空爆高手】"; break;
        case 3:
            path_use = "【空爆老祖】"; break;
        case 4:
            path_use = "【玖帝真身】"; break;
    }
    
    ClientPrint(null, 5, "-------------------")
    ClientPrint(null, 5, format("%s:%s", activator.GetPlayerName(), path_use));
    ClientPrint(null, 5, format("%s:被控%d次", activator.GetPlayerName(), i_helpnum));
    ClientPrint(null, 5, "-------------------")
    // PrecacheModel( "sprites/fw.vmt" );
    // PrecacheModel( "sprites/gs.vmt" );
    // PrecacheModel( "sprites/lz.vmt" );
    // PrecacheModel( "sprites/zs.vmt" );
    
    // local path_use = "";    local choice;
    // if(i_helpnum == 0)
    //     choice = 4;
    // else if(i_helpnum <= 3)
    //     choice = 3;
    // else if(i_helpnum <= 6)
    //     choice = 2;
    // else
    //     choice = 1;
    // switch(choice)
    // {
    //     case 1:
    //         path_use = "sprites/fw.vmt"; break;
    //     case 2:
    //         path_use = "sprites/gs.vmt"; break;
    //     case 3:
    //         path_use = "sprites/lz.vmt"; break;
    //     case 4:
    //         path_use = "sprites/zs.vmt"; break;
    // }
    // local origin = activator.GetOrigin();
    // local steamID = activator.GetNetworkIDString();
    // origin.z = origin.z + 90.0;
    // local ent = SpawnEntityFromTable("env_sprite",{
    //     origin = origin,
    //     rendermode = 2,
    //     model = path_use
    // })
    // DoEntFire("!self", "SetParent","!activator" , 0.1, activator, ent);
    EntFire("give_title","Disable");
    i_helpnum = 0;

    // DirectorScript.Disable_tank.title_table.rawset(steamID, choice);  
	// SaveTable("title_table", DirectorScript.Disable_tank.title_table);
}




function GiveTitleLater()
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
    //     }
    //     local path_use = "";
    //     switch(choice)
    //     {
    //         case 1:
    //             path_use = "sprites/fw.vmt"; break;
    //         case 2:
    //             path_use = "sprites/gs.vmt"; break;
    //         case 3:
    //             path_use = "sprites/lz.vmt"; break;
    //         case 4:
    //             path_use = "sprites/zs.vmt"; break;
    //     }
    //     local origin = player.GetOrigin();
    //     origin.z = origin.z + 90;
    //     local ent = SpawnEntityFromTable("env_sprite",{
    //     origin = origin,
    //     rendermode = 2,
    //     model = path_use
    //     })
    //     DoEntFire("!self", "SetParent","!activator" , 0.1, player, ent);
    // }
}


function DisableBot()
{
    if(IsPlayerABot(activator))
        CommandABot( { bot = activator, cmd = DirectorScript.BOT_CMD_MOVE, pos = activator.GetOrigin()} );
}


function EnableBot()
{
    local surv = null;
    while(surv = Entities.FindByClassname(surv, "player"))
    {
        if(surv.IsSurvivor() && IsPlayerABot(surv))
        {
            CommandABot( { bot = surv, cmd = DirectorScript.BOT_CMD_RESET} );
        }
    }
}


__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
