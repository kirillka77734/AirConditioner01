

function SetSelfVector()
{
    NetProps.SetPropFloat(activator, "m_flLaggedMovementValue", 2.0);
}


function ReSetSelfVector()
{
    NetProps.SetPropFloat(activator, "m_flLaggedMovementValue", 1.0);
}


function RushElevator(targetpos)
{
    local surv = null;
    while(surv = Entities.FindByClassname(surv, "player"))
    {
        if(surv.IsSurvivor() && IsPlayerABot(surv))
        {
            local surv_pos = surv.GetOrigin();
            if((targetpos - surv_pos).Length() <= 500.0)
            {
                if((targetpos - surv_pos).Length() <= 50.0)
                    CommandABot( { bot = surv, cmd = DirectorScript.BOT_CMD_RESET} );
                else
                    CommandABot( { bot = surv, cmd = DirectorScript.BOT_CMD_MOVE, pos = targetpos } );
            }
        }
    }
}


function RestBotCommAnd()
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




function RushFallen()
{
    local surv = null;
    while(surv = Entities.FindByClassname(surv, "player"))
    {
        if(surv.IsSurvivor() && IsPlayerABot(surv))
        {
            local surv_pos = surv.GetOrigin();
            if(surv_pos.z >= 4300)
                CommandABot( { bot = surv, cmd = DirectorScript.BOT_CMD_MOVE, pos = Vector(4136,353,4521.04) } );
            else
                CommandABot( { bot = surv, cmd = DirectorScript.BOT_CMD_RESET} );
        }
    }
}