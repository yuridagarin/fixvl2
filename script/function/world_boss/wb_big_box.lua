--��ս����
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	if wb_GetBigBoxFlag() > 0 then
		Talk(1,"",format("M�i ng�y ch� ���c nh�n 1 l�n ph�n th��ng %s", GetNpcName(GetTargetNpc())));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","Ch� c� ng��i ch�i tham gia ti�u di�t BOSS m�i c� th� m� b�o r��ng");
		return
	end
	wb_SetBigBoxIndex(GetTargetNpc())
	UseScrollEnable(0);
	SetDeathScript("\\script\\function\\world_boss\\wb_player_death.lua")
	CastState("state_fetter", 100, 18*16, 1, 9999);
	ProgressSlot(15 * 18, "wb_BigBoxAward")
end