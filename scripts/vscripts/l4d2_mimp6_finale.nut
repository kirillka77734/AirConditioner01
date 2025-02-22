PANIC 		<- 0
TANK 		<- 1
DELAY 		<- 2
ONSLAUGHT 	<- 3

TkCVcount <- 2
TKstageTime <- 0
b_HasTrigger <- false

CurrentFinaleStageNumber <- null
CurrentFinaleStageType <- null

if ( Director.GetGameMode() == "versus" )
{
	TkCVcount <- 1
}


DirectorOptions <-
{
	D_CustomFinale_StageCount = 10

	D_CustomFinale1 		= ONSLAUGHT
	D_CustomFinaleValue1 	= "mimp6_min"
	
	D_CustomFinale2 		= PANIC
	D_CustomFinaleValue2 	= 2
	
	D_CustomFinale3 		= DELAY
	D_CustomFinaleValue3 	= 18
	
	D_CustomFinale4 		= TANK
	D_CustomFinaleValue4 	= 1
	
	D_CustomFinale5 		= DELAY
	D_CustomFinaleValue5 	= 12

    D_CustomFinale6		    = ONSLAUGHT
	D_CustomFinaleValue6 	= "mimp6_min"	
	
	D_CustomFinale7 		= PANIC
	D_CustomFinaleValue7 	= 2	
	
	D_CustomFinale8 		= DELAY
	D_CustomFinaleValue8 	= 18	
	
	D_CustomFinale9 		= TANK
	D_CustomFinaleValue9 	= TkCVcount
	
	D_CustomFinale10 		= DELAY
	D_CustomFinaleValue10 	= 10

	MobMinSize = 60
	MobMaxSize = 60
	MobMaxPending = 60
	
	CommonLimit = 60
	ShouldConstrainLargeVolumeSpawn = false
	PreferredMobDirection = SPAWN_LARGE_VOLUME

	ZombieSpawnRange = 2500
	ShouldAllowSpecialsWithTank = true
	ShouldAllowMobsWithTank = false
	
	SpecialRespawnInterval = 6.0

	MusicDynamicMobSpawnSize = 25
}


function OnBeginCustomFinaleStage( num, type )
{
	CurrentFinaleStageNumber = num
	CurrentFinaleStageType = type
}


function HasTankAlive()
{
	local infStats = {};
	GetInfectedStats( infStats );
    if(infStats.Tanks > 0)
	    return true;
    return false;
}


function Update() 
{
	if(CurrentFinaleStageType == TANK)
	{
		if(TKstageTime == 0)
            TKstageTime = Time();
        else if((Time() - TKstageTime >= 45) && !HasTankAlive())
            Director.ForceNextStage();
	}

	if(CurrentFinaleStageType != TANK && TKstageTime!= 0)
        TKstageTime = 0;

    if(CurrentFinaleStageNumber == 6 && !b_HasTrigger)
	{
		b_HasTrigger = true;
		EntFire( "mid_event_relay", "Trigger" );
	}       
}