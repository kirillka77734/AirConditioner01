


DirectorOptions <-
{
	// This turns off tanks and witches.
	ProhibitBosses = true
	
	//LockTempo = true
	MobSpawnMinTime = 1
	MobSpawnMaxTime = 3
	MobMinSize = 18
	MobMaxSize = 30
	MobMaxPending = 10
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	IntensityRelaxThreshold = 0.99
	RelaxMinInterval = 5
	RelaxMaxInterval = 10
	RelaxMaxFlowTravel = 400
	SpecialRespawnInterval = 1.0
	PreferredMobDirection = SPAWN_BEHIND_SURVIVORS
	ZombieSpawnRange = 2000
}

Director.ResetMobTimer()
Director.PlayMegaMobWarningSounds()