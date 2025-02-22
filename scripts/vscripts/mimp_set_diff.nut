


function Set_Diff1000()
{
    Convars.SetValue("director_relax_max_flow_travel", 1000);
    local _string = "1000";
    StringToFile("l4d2_mimp/mimp_set.txt", _string);
    Say(null,"3000码打的想睡觉，我要打1000码",false);
    ClientPrint(null, 5, "已修改为1000码");
}


function Set_Diff3000()
{
    Convars.SetValue("director_relax_max_flow_travel", 3000);
    local _string = "3000";
    StringToFile("l4d2_mimp/mimp_set.txt", _string);
    Say(null,"1000码太难了，我要打3000码",false);
    ClientPrint(null, 5, "已修改为3000码");
}



function Get_Current_Diff()
{
    if(Director.GetGameMode() != "mutation4")
    {
        EntFire("mutation_only", "Kill");  
        return;
    }

    
    local fileContents = FileToString("l4d2_mimp/mimp_set.txt");
    if (fileContents == null || fileContents == "" || fileContents == "3000")
    {
        local relax_flow = Convars.GetFloat("director_relax_max_flow_travel");
        if(relax_flow != 3000)
            Convars.SetValue("director_relax_max_flow_travel", 3000);
        EntFire("relay_1000", "Trigger");
    }
    else
    {
        local relax_flow = Convars.GetFloat("director_relax_max_flow_travel");
        if(relax_flow != 1000)
            Convars.SetValue("director_relax_max_flow_travel", 1000);
        EntFire("relay_3000", "Trigger");
    }
}