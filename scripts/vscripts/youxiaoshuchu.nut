

weapon_origin <- Vector(-68.5, 5027, 1048);


function OnGameEvent_item_pickup(event)
{
    local player = GetPlayerFromUserID(event.userid);
    local origin = player.GetOrigin();
    local distance = (origin - weapon_origin).Length();
    if(distance <= 200.0 && Director.GetGameMode() == "mutation4")
    {
        EntFire("youxiao", "PlaySound");
    }
}


__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);