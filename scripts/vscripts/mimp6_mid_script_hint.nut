

Target_Hint <- null;


function ShowFirstHint()
{
    local ent = null;   local lag_type = 0;
    while(ent = Entities.FindByClassname(ent, "player"))
    {
        if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
        {
            local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
            switch(language){
                case "schinese":case "tchinese":	lag_type = 1; break;
                default:	lag_type = 2; break;
            }
        }
    }
    local msg = " ";
    if(lag_type == 1)
        msg = "前往控制台拷贝数据!";
    else
        msg = "Before escape, use the laptop to copy data from the console.";

    Target_Hint = Entities.FindByName(null, "mid_event_hint");
    Target_Hint.__KeyValueFromString("hint_caption",msg);
    DoEntFire( "mid_event_hint", "ShowHint", "", 0.0, ent, ent );
}


function EndHint()
{
    local ent = null; 
    while(ent = Entities.FindByClassname(ent, "player"))
    {
        if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
        {
            DoEntFire( "mid_event_hint", "EndHint", "", 0.0, ent, ent );
        }
    }
}


function ShowSencondHint()
{
    local ent = null;   local lag_type = 0;
    while(ent = Entities.FindByClassname(ent, "player"))
    {
        if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
        {
            local language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
            switch(language){
                case "schinese":case "tchinese":	lag_type = 1; break;
                default:	lag_type = 2; break;
            }
        }
    }
    local msg = " ";
    if(lag_type == 1)
        msg = "数据拷贝成功，继续坚守到救援来临!";
    else
        msg = "Data copying done, hold out until the rescue arrives!";

    Target_Hint = Entities.FindByName(null, "mid_event_hint");
    Target_Hint.__KeyValueFromString("hint_caption",msg);
    DoEntFire( "mid_event_hint", "ShowHint", "", 0.0, ent, ent );
    DoEntFire( "mid_event_hint", "EndHint", "", 10.0, ent, ent );
}