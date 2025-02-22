
Stuck_Array <- array(32, 0);
last_flow <- 0.0;
mimp1_Ent <- Entities.FindByClassname(null, "worldspawn");


function CheckSpecialPos()
{
    local highest_flow;
    if(Director.GetHighestFlowSurvivor())
    {   
        highest_flow = GetFlowDistanceForPosition(Director.GetHighestFlowSurvivor().GetOrigin());
        last_flow = highest_flow;
    }
    else{
        highest_flow = last_flow;
    }
    local inf = null;
    while(inf = Entities.FindByClassname(inf, "player"))
    {
        if(inf.IsValid() && inf.GetZombieType() < 7 && IsPlayerABot(inf) && !inf.IsDead() && !inf.IsDying())
        {
            local inf_flow = GetFlowDistanceForPosition(inf.GetOrigin());
            if(highest_flow - inf_flow > 2500.0)
            {
                if(Stuck_Array[inf.GetEntityIndex()] == 1)
                {
                    inf.TakeDamage(601.0, 1, mimp1_Ent);
                    Stuck_Array[inf.GetEntityIndex()] = 0;
                }
                else
                    Stuck_Array[inf.GetEntityIndex()] = 1;   
            }
            else
            {
                Stuck_Array[inf.GetEntityIndex()] = 0;
            }
        }
    }
}


function HurtTruePlayer()
{
    if(!IsPlayerABot(activator))
        activator.TakeDamage(2.0, 256, null);
}