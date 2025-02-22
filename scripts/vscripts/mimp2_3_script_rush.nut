
function SingleDiff()
{
	if(Director.IsSinglePlayerGame() || Director.GetGameMode() != "mutation4")
		return 25;
	else
		return 45;
}




DirectorOptions <-
{
	IntensityRelaxThreshold = 0.99
	MobSpawnMaxTime = 10
	MobSpawnMinTime = 5
	RelaxMaxFlowTravel = 90
	RelaxMaxInterval = 3
	RelaxMinInterval = 1
	ZombieSpawnInFog = true
	ShouldAllowMobsWithTank = false
	ShouldAllowSpecialsWithTank = false
	SpecialRespawnInterval = 15.0
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	CommonLimit = SingleDiff()
	MegaMobSize = SingleDiff()
	MobMaxPending = SingleDiff()
	MobMaxSize = SingleDiff()
	MobMinSize = SingleDiff()
	cm_AggressiveSpecials = true
	PreferredMobDirection = SPAWN_NO_PREFERENCE
}

Director.PlayMegaMobWarningSounds();
Director.ResetMobTimer();
Director.ResetSpecialTimers();
