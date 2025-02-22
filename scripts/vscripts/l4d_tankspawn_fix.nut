// Implementation

::_PostInputScope <- null
::_PostInputFunc  <- null

::SetInputHook <- function(entity, input, pre_func, post_func)
{
        entity.ValidateScriptScope()
	local scope = entity.GetScriptScope()
	if (post_func)
	{
		local wrapper_func = function() 
		{ 
			_PostInputScope = scope
			_PostInputFunc  = post_func
			if (pre_func)
				return pre_func.call(scope)
			return true
		}
		
		scope["Input" + input]           <- wrapper_func
		scope["Input" + input.tolower()] <- wrapper_func // workaround for case bug
	}
	else if (pre_func)
	{
		scope["Input" + input]           <- pre_func
		scope["Input" + input.tolower()] <- pre_func // workaround for case bug
	}
}

getroottable().setdelegate(
{
	_delslot = function(k)
	{
		if (_PostInputScope && k == "activator" && "activator" in this)
		{
			_PostInputFunc.call(_PostInputScope)
			_PostInputFunc = null
		}
		
		rawdelete(k)
	}
})

// Example that hooks the RunScriptCode input on worldspawn

function PreInputRunScriptCode()
{
	printl("INPUT PRE: RunScriptCode")
	printl("\tself: " + self)
	printl("\tactivator: " + activator)
	return 0
}

function PostInputRunScriptCode()
{
	printl("INPUT POST: RunScriptCode")
	printl("\tself: " + self)
	printl("\tactivator: " + activator)
}

local world = Entities.FindByClassname(null, "worldspawn")
SetInputHook(world, "RunScriptCode", PreInputRunScriptCode, PostInputRunScriptCode)

EntFire("worldspawn", "RunScriptCode", "printl(`RunScriptCode executed`)", 0, GetListenServerHost())