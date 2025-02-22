
laster_ent <- null;
gun_hurt <- null;
start_pos <- Vector(-2636.5, -3160.5, -1819.85)

function beam_thinkfunc()
{
    local target = Director.GetHighestFlowSurvivor();
    local end_pos = target.GetOrigin();
    local m_trace = { 
		start = start_pos, 
		end = end_pos, 
		ignore = null, 
		mask = -1
	};
	TraceLine(m_trace);

    if(laster_ent == null)
    {
        local ent = null;
        while(ent = Entities.FindByName(ent, "laster_1"))
        {
            laster_ent = ent;
            laster_ent.SetOrigin(m_trace.pos);
        }
    }
    else
        laster_ent.SetOrigin(m_trace.pos);  
}



function hurt_thinkfunc()
{
    if(gun_hurt == null)
    {
        local ent = null;
        while(ent = Entities.FindByName(ent, "gun_hurt"))
        {
            gun_hurt = ent;
            gun_hurt.SetOrigin(laster_ent.GetOrigin());
        }
    }
    else
        gun_hurt.SetOrigin(laster_ent.GetOrigin());
}



