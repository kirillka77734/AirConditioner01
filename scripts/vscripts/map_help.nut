





function special_help()
{
    local player = Director.GetHighestFlowSurvivor();
    local maxflow = GetCurrentFlowDistanceForPlayer(player);
    local infected = null;
    while(infected = Entities.FindByClassname(infected, "player"))
    {
        if(infected.GetZombieType() < 7 && !infected.IsDead() && !infected.IsDying() && IsPlayerABot(infected))
        {
            local infected_flow = GetCurrentFlowDistanceForPlayer(infected);
            if(infected_flow == -1)
                infected.Kill();
            if((maxflow - infected_flow) > 3000.0)
            {
                infected.Kill();
                Director.ResetSpecialTimers();
            }     
        }
    }
}



