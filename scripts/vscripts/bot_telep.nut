



function TelepBot()
{
    local surv = null;
    while(surv = Entities.FindByClassname(surv, "player"))
    {
        if(surv.IsSurvivor() && IsPlayerABot(surv))
        {
            surv.SetOrigin(Vector(4527.5,26.5,3474));
        }
    }
}