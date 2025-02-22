
Bool_Start <- false;

function ChangeBool()
{
    Bool_Start = true;
}


OnGameEvent_player_death <-function(event){
    if(!Bool_Start)
        return;
    
    if(Director.GetGameMode() != "mutation4")
        return;
    
    if(event["victimname"] != "Infected" && event["victimname"] != "Witch")
    {
        local EntityKill = null;	
        EntityKill = GetPlayerFromUserID(event["userid"]);
        local SItype = EntityKill.GetZombieType();

        Director.ResetSpecialTimers();
           
        if (IsPlayerABot(EntityKill) && SItype < 7 && SItype != 4)
        {   
            EntityKill.Kill();
        }	
    }         
}



__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);