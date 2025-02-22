


function CheckIfNeed()
{
    local value = Convars.GetFloat("director_relax_max_flow_travel");
    if(value > 2000)
        Convars.SetValue("director_relax_max_flow_travel", 2000);
}