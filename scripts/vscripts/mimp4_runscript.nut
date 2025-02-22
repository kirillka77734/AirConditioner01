
EscapeTime <- 420;
Current_Time <- 0;
Tips_Times <- 0;
Tips_ent <- null;
mimp4_Ent <- Entities.FindByClassname(null, "worldspawn");
EscapeHUD <- null;


HUD_MID_TOP <- g_ModeScript.HUD_MID_TOP;
HUD_FLAG_BEEP <- g_ModeScript.HUD_FLAG_BEEP;
HUD_FLAG_NOTVISIBLE <- g_ModeScript.HUD_FLAG_NOTVISIBLE;
HUD_FLAG_ALIGN_CENTER <- g_ModeScript.HUD_FLAG_ALIGN_CENTER;
HUD_SPECIAL_TIMER0 <- g_ModeScript.HUD_SPECIAL_TIMER0;


function Find_needent()
{
    local ent = null;
    while(ent = Entities.FindByName(ent, "tips_esacpe"))
    {
        Tips_ent = ent;
    }
}




function SetRunTime()
{
    if(Director.IsSinglePlayerGame())
        EscapeTime = 540;
}


function Say_wait()
{
    Say(null,"***等待电梯到达！***",false);
	Say(null,"Wait Elevator arrival...",false);
}

function StartCountDown()
{
    EscapeHUD =
    {
        Fields =
        {
            escape = { slot = HUD_MID_TOP, name = "escape", special = HUD_SPECIAL_TIMER0, flags = HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE }
        }
    }
    HUDSetLayout( EscapeHUD );
    HUDManageTimers( 0, 2, EscapeTime ); 
	EscapeHUD.Fields.escape.flags = EscapeHUD.Fields.escape.flags & ~HUD_FLAG_NOTVISIBLE; 
}


function HideFunc()
{
    EscapeHUD.Fields.escape.flags = EscapeHUD.Fields.escape.flags | HUD_FLAG_NOTVISIBLE;
}


function Run_MainFunc()
{
    local minutes = (EscapeTime / 60);
    if(Tips_ent == null)
    {
        Find_needent();
        StartCountDown();
    }
        
    if(Current_Time == 0)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = format("你有%d分钟的时间逃离！",minutes); break;
                    default:							msg = format("There are still %d minutes left for escape!",minutes);	break;
                }

                Current_Time = Time();
                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        Say(null,"***返回电梯处逃离！***",false);
	    Say(null,"Return to the surface and escape!",false);
        Tips_Times ++;
    }
        

    local used_time = EscapeTime - Time() + Current_Time;
    minutes = (used_time / 60);
    if(used_time <= 240 && Tips_Times == 1)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = format("你有%d分钟的时间逃离！",minutes); break;
                    default:							msg = format("There are still %d minutes left for escape!",minutes);	break;
                }

                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        Tips_Times ++;
    }


    if(used_time <= 180 && Tips_Times == 2)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = format("你有%d分钟的时间逃离！",minutes); break;
                    default:							msg = format("There are still %d minutes left for escape!",minutes);	break;
                }

                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        Tips_Times ++;
    }


    if(used_time <= 120 && Tips_Times == 3)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = format("你有%d分钟的时间逃离！",minutes); break;
                    default:							msg = format("There are still %d minutes left for escape!",minutes);	break;
                }

                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        Tips_Times ++;
    }



    if(used_time <= 60 && Tips_Times == 4)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = format("你有%d分钟的时间逃离！",minutes); break;
                    default:							msg = format("There are still %d minutes left for escape!",minutes);	break;
                }

                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        EscapeHUD.Fields.escape.flags = EscapeHUD.Fields.escape.flags | HUD_FLAG_BEEP;
        Tips_Times ++;
    }


    if(used_time <= 30 && Tips_Times == 5)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
                local msg = " ";
                switch(language){
                    case "schinese":case "tchinese":	msg = "你还有30秒的时间逃离！"; break;
                    default:							msg = "There are still 30 Seconds left for escape!";	break;
                }

                Tips_ent.__KeyValueFromString("hint_caption",msg);
                DoEntFire( "tips_esacpe", "ShowHint", "", 0.0, ent, ent );
            }	
        }
        Tips_Times ++;
    }


    if(used_time < 1)
    {
        local ent = null;		
        while(ent = Entities.FindByClassname(ent, "player"))
        {
            if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
            {
                local health = ent.GetHealth();
                local healthbuff = ent.GetHealthBuffer();
                local player_health = health + healthbuff.tointeger();
                if(!ent.IsIncapacitated())
                    ent.TakeDamage(player_health.tofloat() + 1.0, 1, mimp4_Ent);
            }
        }
        EscapeHUD.Fields.escape.flags = EscapeHUD.Fields.escape.flags | HUD_FLAG_NOTVISIBLE;
    }
}

SetRunTime()