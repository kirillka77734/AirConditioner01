

Convars.SetValue("mat_force_vertexfog", 0);

HUD_RIGHT_TOP <- g_ModeScript.HUD_RIGHT_TOP;
HUD_MID_TOP <- g_ModeScript.HUD_MID_TOP;
HUD_MID_BOT <- g_ModeScript.HUD_MID_BOT;
HUD_LEFT_TOP <- g_ModeScript.HUD_LEFT_TOP;
HUD_LEFT_BOT <- g_ModeScript.HUD_LEFT_BOT;
HUD_FLAG_NOBG <- g_ModeScript.HUD_FLAG_NOBG;
HUD_FLAG_NOTVISIBLE <- g_ModeScript.HUD_FLAG_NOTVISIBLE;
HUD_FLAG_ALIGN_CENTER <- g_ModeScript.HUD_FLAG_ALIGN_CENTER;



Timer_Ent  <- null;
Base_HUD  <- null;
_CurrentString  <- "";
e_CurrentString  <- "";
b_haveberak  <- false;
b_ehavebreak  <- false;
b_ifStringEnd  <- false;
b_eifStringEnd  <- false;

addnum  <- "a";


function FindNeedEnt()
{
   local ent = null;
   while(ent = Entities.FindByName(ent, "intro_timer"))
   {
      Timer_Ent = ent;
   }
}

function CloseString()
{
   local _string = "close";
   StringToFile("l4d2_mimp/mimp_set_cl.txt", _string);
   EntFire("c333", "Kill");
}



function OpenString()
{
   local _string = "open";
   StringToFile("l4d2_mimp/mimp_set_cl.txt", _string);
}



function UpDateString(_string, line_break)
{
   local _len = _string.len();
   local _startindex = _CurrentString.len();

   if(b_ifStringEnd)
       return;
      
   if(b_haveberak)
   {
      if(_startindex + line_break * 3 + 3 >= _len)
         b_ifStringEnd = true;   
   }
   else
   {
      if(_startindex >= _len)
         b_ifStringEnd = true;   
   }

   if(_startindex + 3 > line_break * 3 && !b_haveberak)
   {
      _CurrentString = "";
      b_haveberak = true;
   }

   if(b_haveberak)
   {
      _CurrentString = _CurrentString + _string.slice(_startindex + line_break * 3, _startindex + line_break * 3 + 3);
      Base_HUD.Fields.cn2.dataval = _CurrentString;
      HUDSetLayout( Base_HUD );
   }
   else
   { 
      _CurrentString = _CurrentString + _string.slice(_startindex, _startindex + 3);
      Base_HUD.Fields.cn1.dataval = _CurrentString;
      HUDSetLayout( Base_HUD );
   }
}


function UpDateEnglishString(_string, line_break)
{
   local _len = _string.len();
   local _startindex = e_CurrentString.len();

   if(b_eifStringEnd)
       return;

   if(b_ehavebreak)
   {
      if(_startindex + line_break + 1 >= _len)
         b_eifStringEnd = true; 
   }
   else
   {
      if(_startindex >= _len)
         b_eifStringEnd = true;
   }

   if(_startindex + 1 > line_break && !b_ehavebreak)
   {
      e_CurrentString = "";
      b_ehavebreak = true;
   }

   if(b_ehavebreak)
   {
      e_CurrentString = e_CurrentString + _string.slice(_startindex + line_break, _startindex + line_break + 1);
      Base_HUD.Fields.en2.dataval = e_CurrentString;
      HUDSetLayout( Base_HUD );
   }
      
   else
   { 
      e_CurrentString = e_CurrentString + _string.slice(_startindex, _startindex + 1);
      Base_HUD.Fields.en1.dataval = e_CurrentString;
      HUDSetLayout( Base_HUD );
   }
}


function BuildBaseHud()
{
   local fileContents = FileToString("l4d2_mimp/mimp_set_cl.txt");
   if (fileContents == "close")
   {
      EntFire("skip_logic", "Disable");
      EntFire("intro_timer", "Disable");
      EntFire("c333", "Kill");
      EntFire("c222", "Kill");
      EntFire("c111", "Kill");
      return;
   }
   
   if(Base_HUD == null)
   {
      Base_HUD =
      {
         Fields =
         {
            cn1 = { slot = HUD_MID_TOP, name = "cn1", dataval = " ", flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE | HUD_FLAG_NOBG }
            cn2 = { slot = HUD_MID_BOT, name = "cn2", dataval = " ", flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE | HUD_FLAG_NOBG }
            en1 = { slot = HUD_LEFT_TOP, name = "en1", dataval = " ", flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE | HUD_FLAG_NOBG }
            en2 = { slot = HUD_LEFT_BOT, name = "en2", dataval = " ", flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE | HUD_FLAG_NOBG }
            skip = { slot = HUD_RIGHT_TOP, name = "skip", dataval = " ", flags = HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE}
         }
      }
      HUDPlace(HUD_MID_TOP, 0.03, 0.34, 0.94, 0.21);
      HUDPlace(HUD_MID_BOT, 0.03, 0.37, 0.94, 0.21);
      HUDPlace(HUD_LEFT_TOP, 0.03, 0.42, 0.94, 0.21);
      HUDPlace(HUD_LEFT_BOT, 0.03, 0.45, 0.94, 0.21);
      HUDSetLayout( Base_HUD );
      Base_HUD.Fields.cn1.flags = Base_HUD.Fields.cn1.flags & ~HUD_FLAG_NOTVISIBLE;
      Base_HUD.Fields.cn2.flags = Base_HUD.Fields.cn2.flags & ~HUD_FLAG_NOTVISIBLE;
      Base_HUD.Fields.en1.flags = Base_HUD.Fields.en1.flags & ~HUD_FLAG_NOTVISIBLE;
      Base_HUD.Fields.en2.flags = Base_HUD.Fields.en2.flags & ~HUD_FLAG_NOTVISIBLE;
      Base_HUD.Fields.skip.flags = Base_HUD.Fields.skip.flags & ~HUD_FLAG_NOTVISIBLE;
      SkipHint_HUD();
   }
}


function ClearAllHUD()
{
   Base_HUD.Fields.cn1.flags = Base_HUD.Fields.cn1.flags | HUD_FLAG_NOTVISIBLE;
   Base_HUD.Fields.cn2.flags = Base_HUD.Fields.cn2.flags | HUD_FLAG_NOTVISIBLE;
   Base_HUD.Fields.en1.flags = Base_HUD.Fields.en1.flags | HUD_FLAG_NOTVISIBLE;
   Base_HUD.Fields.en2.flags = Base_HUD.Fields.en2.flags | HUD_FLAG_NOTVISIBLE;
   Base_HUD.Fields.skip.flags = Base_HUD.Fields.skip.flags | HUD_FLAG_NOTVISIBLE;
   
   delete Base_HUD.Fields["cn1"];
   delete Base_HUD.Fields["cn2"];
   delete Base_HUD.Fields["en1"];
   delete Base_HUD.Fields["en2"];
   delete Base_HUD.Fields["skip"];
   Base_HUD = null;
}


function SkipHint_HUD()
{
   local have_chinese = 0;     local have_english = 0;    local language = null;     local ent = null;
   while(ent = Entities.FindByClassname(ent, "player"))
   {
      if(ent.GetZombieType() == 9 && (!IsPlayerABot(ent)))
      {
         language = Convars.GetClientConvarValue("cl_language", ent.GetEntityIndex());
         switch(language){
            case "schinese":case "tchinese":	have_chinese = 1; break;
            default:	have_english = 2; break;
         }
      }
   }

   HUDPlace(HUD_RIGHT_TOP, 0.344, 0.875, 0.25, 0.04);
   local msg = null;
   if(have_chinese + have_english == 1)
      msg = "按下W键可跳过开场动画";
   else if(have_chinese + have_english == 2)
      msg = "Can Press W button to Skip Intro";
   else
   {
      msg = "    按下W键跳过开场动画\nPress W button to Skip Intro";
      HUDPlace(HUD_RIGHT_TOP, 0.344, 0.875, 0.25, 0.07);
   }
   Base_HUD.Fields.skip.dataval = msg;
   HUDSetLayout( Base_HUD );
}


function GetPlayerMask()
{
   local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
      if(player != null && player.GetZombieType() == 9 && (!IsPlayerABot(player)))
		{		
         local Button = player.GetButtonMask();
         if(Button & 8)
            SkipIntro();
      }
   }
}


function HideHud()
{
   local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
      if(!IsPlayerABot(player))
      {
         local name = player.GetName();
         DoEntFire("!self", "SetHUDVisibility", "0", 0, null, player); 
      } 
   }
}


function NoHideHud()
{
   local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
      if(!IsPlayerABot(player))
      {
         DoEntFire("!self", "SetHUDVisibility", "1", 0, null, player); 
      }
   }
}


function FadeOutEnt()
{
   local tbl = { origin = Vector(0, 0, 0), angles = QAngle(0, 0, 0), spawnflags = 1, rendercolor = "0 0 0", renderamt = 255, holdtime = 1, duration = 1 };
   local ent = SpawnEntityFromTable("env_fade", tbl);
   if (!ent)
   {
      printl("Could not create env_fade!");
      return;
   }
   ent.ValidateScriptScope();
    
    DoEntFire("!self", "Fade", "", 0, null, ent);
    DoEntFire("!self", "Kill", "", 2.5, null, ent);
}

function SkipIntro()
{
   FadeOutEnt();
   EntFire("skip_logic", "Disable");
   EntFire("sview_viewm", "Disable");
   EntFire("sview_mover", "StartForward");
   EntFire("director", "ReleaseSurvivorPositions");
   EntFire("director", "FinishIntro");
   EntFire("intro_timer", "Disable");
   NoHideHud();
   // ClearAllHUD();
   
   EntFire("intro_timer", "Disable", "", 2.5);
   DoEntFire("mimp1_intro", "runscriptcode", "ClearAllHUD()", 2.5, Timer_Ent, Timer_Ent);
}




function ChnageBool()
{
   _CurrentString = "";
   e_CurrentString = ""
   b_ifStringEnd = false;
   b_eifStringEnd = false;
   b_haveberak = false;
   b_ehavebreak = false;
}



function MainFunc()
{
   local _string1 = "在教区，你们幸运的赶上了军方的最后一趟飞机，然而你们还不知道，一场噩梦即将开始..."
   local _string2 = "你们被确诊为无症状感染者，并将被军方送往实验室观察研究。"
   local _string3 = "幸运的是，先前帮你们撤离的直升机飞行员感染了你们身上的病毒，这给军事基地带来巨大的混乱，你们四人则趁着混乱逃离..."

   local _string4 = "In the Parish,you were fortunate enough to catch the last military helicopter before the bridge was bombed,but youdidn't know yet that a nightmare was about to begin..."
   local _string5 = "You have been diagnosed by the military as an asymptomatic carrier and will be scent to the laboratory for observationand research."
   local _string6 = "Fortunately the helicopter pilot who helped you evacuate earlier was infected with the vinus on your body, which caused huge chaos inside the military basc. The four of you took advantage of the chaos to escape..."

   if(Timer_Ent == null)
      FindNeedEnt();
   
   BuildBaseHud();
   EntFire("intro_timer", "RefireTime", "0.08");
   
   switch(addnum)
   {
      case "a":
      {
         if(b_ifStringEnd && b_eifStringEnd)
         {
            addnum = "b";
            ChnageBool();

            DoEntFire("!self", "Disable", "", 0.0, Timer_Ent, Timer_Ent);
            DoEntFire("!self", "Enable", "", 2.0, Timer_Ent, Timer_Ent);
            DoEntFire("mimp1_intro", "runscriptcode", "ClearAllHUD()", 2.0, Timer_Ent, Timer_Ent);
            break;
         }

         if(!b_ifStringEnd)
            UpDateString(_string1, 40);

         if(!b_eifStringEnd)
         {
            for(local i = 0; i < 3; i++)
               UpDateEnglishString(_string4, 100);
         }
         break;
      }

      case "b":
      {
         if(b_ifStringEnd && b_eifStringEnd)
         {
            addnum = "c";
            ChnageBool();

            DoEntFire("!self", "Disable", "", 0.0, Timer_Ent, Timer_Ent);
            DoEntFire("!self", "Enable", "", 2.0, Timer_Ent, Timer_Ent);
            DoEntFire("mimp1_intro", "runscriptcode", "ClearAllHUD()", 2.0, Timer_Ent, Timer_Ent);
            break;
         }

         if(!b_ifStringEnd)
            UpDateString(_string2, 40);

         if(!b_eifStringEnd)
         {
            for(local i = 0; i < 3; i++)
               UpDateEnglishString(_string5, 100);
         }
         break;
      }

      case "c":
      {
         if(b_ifStringEnd && b_eifStringEnd)
         {
            addnum = "d";
            ChnageBool();
            DoEntFire("!self", "Disable", "", 0.0, Timer_Ent, Timer_Ent);
            DoEntFire("mimp1_intro", "runscriptcode", "ClearAllHUD()", 2.0, Timer_Ent, Timer_Ent);
            delete Base_HUD.Fields["skip"];
            break;
         }

         if(!b_ifStringEnd)
            UpDateString(_string3, 40);

         if(!b_eifStringEnd)
         {
            for(local i = 0; i < 3; i++)
               UpDateEnglishString(_string6, 100);
         }
         break;
      }

      case "d":
      {
         break;
      }
   }
}