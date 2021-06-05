Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
Include("\\script\\newbattles\\box_effect_head.lua");
TBOX_FILE = new(KTabFile, "\\settings\\newbattles\\mainbattle\\box.txt")

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_KILL_BOX_COUNT,GetMissionV(MV_KILL_BOX_COUNT)+1);
	BT_AddBattleActivity(BA_MAIN_OPEN_BOX);
	Do_Box_Effect(TBOX_FILE);
end
