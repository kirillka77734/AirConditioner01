

start_time <- 0;
count_tick <- 0;
serv_tick1 <- 0;
serv_tick2 <- 0;
serv_tick3 <- 0;
serv_tick_avg <- 0;


function GetServerTick()
{
    if(start_time == 0)
        start_time = Time();
    
    if(start_time + 1.0 >= Time())
        count_tick ++;

    if(start_time + 1.0 < Time())
    {
        count_tick = 0;
        start_time = 0;
        if(serv_tick1 == 0)
            serv_tick1 = count_tick;
        else if(serv_tick2 == 0)
            serv_tick2 = count_tick;
        else if(serv_tick3 == 0)
            serv_tick3 = count_tick;
        return;
    }
    EntFire("tick_help", "RunScriptCode", "GetServerTick()", 0.01);
}


function GetAvgTick()
{
    serv_tick_avg = ((serv_tick1 + serv_tick2 + serv_tick3) / 3).tointeger();
}


function CheckIfNeedStopRock()
{
    if(start_time == 0)
        start_time = Time();
    
    if(start_time + 1.0 >= Time())
        count_tick ++;

    if(start_time + 1.0 < Time())
    {
        if(count_tick * 2 < serv_tick_avg)
        {
            EntFire("tick_timer", "Disable");
        }
        count_tick = 0;
        start_time = 0;
        return;
    }
    EntFire("tick_help", "RunScriptCode", "CheckIfNeedStopRock()", 0.01);
}