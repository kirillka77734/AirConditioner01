


function SingleHelp()
{
    if(!Director.IsSinglePlayerGame())
        return;
    
    local num = RandomInt(1, 3);
    if(num == 1)
    {
        EntFire("butt_realy3", "Trigger");
        EntFire("butt_realy2", "Trigger");
    }

    if(num == 2)
    {
        EntFire("butt_realy3", "Trigger");
        EntFire("butt_realy1", "Trigger");
    }

    if(num == 3)
    {
        EntFire("butt_realy1", "Trigger");
        EntFire("butt_realy2", "Trigger");
    }
}