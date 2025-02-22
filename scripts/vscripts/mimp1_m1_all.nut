
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


DirectorOptions <-
{
	
	MobSpawnMaxTime = CheckMobMaxTime()
	AlwaysAllowWanderers = true
	PreferredMobDirection = SPAWN_ANYWHERE
	RelaxMaxInterval = 30
	RelaxMinInterval = 20
	ZombieSpawnInFog = true
	PreferredSpecialDirection = SPAWN_SPECIALS_ANYWHERE
	cm_AggressiveSpecials = true
	ProhibitBosses = true
}