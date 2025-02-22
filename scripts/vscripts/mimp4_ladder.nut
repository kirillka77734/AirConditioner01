
mim_ladder <- {};

function weapon_ladderfunc() 
{
	local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
		if(player != null && player.GetZombieType() == 9 && (!IsPlayerABot(player)))
		{		
			local MoveType = NetProps.GetPropInt(player, "movetype");
			if(MoveType == 4 || MoveType == 9)
			{
				if(!mim_ladder.rawin(player))
					mim_ladder.rawset(player, MoveType);

				if (MoveType == 4)
				{
					if (mim_ladder.rawget(player) != 9) 
						return;
					
					if(IsMoving(player))
					{
						NetProps.SetPropInt(player, "movetype", 9);
					}
						
				}

				if(MoveType = 9)
				{
					if(!IsMoving(player))
					{
						if (mim_ladder.rawget(player) == 4)
							return;

						NetProps.SetPropInt(player, "movetype", 4);
					}
				}

				if(player.GetButtonMask() != 0)
					mim_ladder.rawset(player, MoveType);	
			}
			else{
				continue;
			}
		}
	}
}




function IsMoving(player)
{
	local player_vec = NetProps.GetPropVector(player, "m_vecAbsVelocity");
	if(player_vec.Length() > 0.0)
	{
		return true;
	}
	return false;
}