
/*
author：洛琪希
Script Function: Skip Map Intro
url = "https://steamcommunity.com/profiles/76561198812009299/"
*/

::Fix <- {
    hookenttable = {}
    MapStartTime = 0.0
}




function Fix::InputHook()
{
    local ent = null;
    local function prehook_func()
    {
        if(Fix.hookenttable.rawin(caller))
            return true;
        ClientPrint(null, 5, "使得")
        
        local nElements = EntityOutputs.GetNumElements( caller, "OnUser1" );
        local outputs = [];
        for ( local i = 0; i < nElements; i++ )
		{
            local outputtable = {};
            EntityOutputs.GetOutputTable( caller, "OnUser1", outputtable, i );
            outputs.push(outputtable);
        }
        Fix.hookenttable.rawset(caller, outputs);
        local tb_output = Fix.hookenttable.rawget(caller);
        for(local i = 0; i < tb_output.len(); i++)
        {
            foreach (k, v in tb_output[i]) {
                ClientPrint(null, 5,  k.tostring() + "的值是:" + v.tostring())
                
            }
        }
        
        return false;
      
    }
    printl("do you find me?")
    while(ent = Entities.Next(ent))
    {
        local entclass = ent.GetClassname();
        switch (entclass) 
        {
            // case "info_director":
            // {
            //     printl("do you find me111?")
            //     ent.ValidateScriptScope();
            //     local scope = ent.GetScriptScope();
            //     scope["InputForceSurvivorPositions"] <- prehook_func;
            //     scope["Inputforcesurvivorpositions"] <- prehook_func;
            //     scope["InputStartIntro"] <- prehook_func;
            //     scope["Inputstartintro"] <- prehook_func;
            //     break;
            // }         
            // case "point_viewcontrol_survivor": case "point_viewcontrol_multiplayer":
            // {
            //     ent.ValidateScriptScope();
            //     local scope = ent.GetScriptScope();
            //     scope["InputEnable"] <- prehook_func;
            //     scope["Inputenable"] <- prehook_func;
            //     scope["InputStartMovement"] <- prehook_func;
            //     scope["Inputstartmovement"] <- prehook_func;
            //     break;
            // }
            // case "env_fade":
            // {
            //     ent.ValidateScriptScope();
            //     local scope = ent.GetScriptScope();
            //     scope["InputFade"] <- prehook_func;
            //     break;
            // }
            case "player":
            {
                ent.ValidateScriptScope();
                local scope = ent.GetScriptScope();
                scope["InputTeleportToSurvivorPosition"] <- prehook_func;
                break;
            }
            default:
                break;
        }  
    }
}


Fix.MapStartTime = Time();
Fix.InputHook()