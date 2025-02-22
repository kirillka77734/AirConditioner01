function HowManyBots()
{
    local player = null;    local num = 0;
    while(player = Entities.FindByClassname(player, "player"))
    {
        local Team_id = NetProps.GetPropInt(player, "m_iTeamNum");
        if(player.GetZombieType() == 9 && Team_id == 2)
        {
            if(IsPlayerABot(player))
                num = num + 0.334;
            else
                num = num + 1.0;
        }
    }
    num = num.tointeger();
    return num;
}



function CheckVersusForCommons()
{
	if(Director.GetGameMode() != "mutation4")
	{
		local num = HowManyBots();
		num = num * 15;
		if(num > 60)
			return 60;
		return num;
	}
	else
		return 60;
}

function CheckVersusForMobSize()
{
	if(Director.GetGameMode() != "mutation4")
	{
		local num = HowManyBots();
		num = num * 15;
		if(num > 120)
			return 120;
		
		return num;
	}
	else
		return 120;
}

function CheckVersusForMobSpawnMinTime()
{
	if ( HasPlayerControlledZombies() || Director.IsSinglePlayerGame() || Director.GetGameMode() != "mutation4")
		return 120;
	else
		return 90;
}

function CheckVersusForMobSpawnMaxTime()
{
	if ( HasPlayerControlledZombies() || Director.IsSinglePlayerGame() || Director.GetGameMode() != "mutation4")
		return 240;
	else
		return 150;
}


function CheckIfMutation4()
{
	if(Director.GetGameMode() != "mutation4")
	{
		local num = HowManyBots();
		local relax = 4000 - num * 500;
		if(relax < 600)
			return 600;
		else
			return relax;
	}
	else
		return 600;
}

DirectorOptions <-
{

	MobSpawnMinTime = CheckVersusForMobSpawnMinTime()
	MobSpawnMaxTime = CheckVersusForMobSpawnMaxTime()
	RelaxMaxFlowTravel = CheckIfMutation4()

	MobMinSize = 30
	MobMaxSize = 50
	MegaMobSize = CheckVersusForMobSize()
	CommonLimit = CheckVersusForCommons()

 

	ZombieSpawnRange = 2000
}