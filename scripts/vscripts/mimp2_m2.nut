
function CheckMobMaxTime()
{
	switch(Convars.GetStr("z_difficulty"))
	{
	case "Easy":
	case "easy":
		return 180
		
	case "Normal":
	case "normal":
		return 150
		
	case "Hard":
	case "hard":
		return 120
		
	case "Impossible":
	case "impossible":
		return 90
	
	default:
		return 150
	}
}


function IfAllow()
{
	if(Director.GetGameMode() == "mutation4")
		return true;
	return false;
}

DirectorOptions <-
{
	
	MobSpawnMaxTime = CheckMobMaxTime()
	AlwaysAllowWanderers = true
	PreferredMobDirection = SPAWN_ANYWHERE
	// RelaxMaxFlowTravel = 1000
	RelaxMaxInterval = 30
	RelaxMinInterval = 20
	ZombieSpawnInFog = IfAllow()
	// PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	cm_AggressiveSpecials = IfAllow()
}