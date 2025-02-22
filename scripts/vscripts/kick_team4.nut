



function Kick_team4()
{
    local player = null;
    while(player = Entities.FindByClassname(player, "player"))
    {
        if(NetProps.GetPropInt(player, "m_iTeamNum") == 4)
            player.Kill();
    }
}