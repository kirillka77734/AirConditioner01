DirectorOptions <-
{
	ProhibitBosses = true
	LockTempo = true
	IntensityRelaxThreshold = 0.99
	MobSpawnMaxTime = 1
	MobSpawnMinTime = 1
	RelaxMaxFlowTravel = 50
	RelaxMaxInterval = 3
	RelaxMinInterval = 1
	ZombieSpawnInFog = true
	ShouldAllowMobsWithTank = true
	ShouldAllowSpecialsWithTank = true
	SpecialRespawnInterval = 1.0
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	CommonLimit = 30
	MegaMobSize = 30
	MobMaxPending = 30
	MobMaxSize = 30
	MobMinSize = 30
	cm_AggressiveSpecials = true
	PreferredMobDirection = SPAWN_NO_PREFERENCE
}

Director.PlayMegaMobWarningSounds();
Director.ResetMobTimer();
Director.ResetSpecialTimers();
