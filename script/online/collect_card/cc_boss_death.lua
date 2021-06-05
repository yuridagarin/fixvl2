--BOSS����
Include("\\script\\online\\collect_card\\cc_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		--��������
		cc_daily_clear();
		local nTimes= CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD);
		if nTimes < CC_BOX_MAX_LM_CARD then
			gf_AddItemEx2({2,1,30507,1}, "Th� Linh Mi�u V�n", "Ho�t ��ng m�n ph�i m�i", "Th� T� BOSS", 0, 1);
			CC_ACTIVITY_TASK_GROUP:SetTask(CC_ACTIVITY_TASK_GROUP.BOX_AWARD_CARD, nTimes + 1);
		else
			Msg2Player("Th� T� Linh Mi�u V�n �� ��t ��n gi�i h�n s� l�n nh�n m�i ng�y");
		end
	end
	local nMapID, nX, nY = GetNpcWorldPos(id);
	local nBoxIndex = CreateNpc("huangjinbaobei", "Ho�ng Kim B�o B�i", nMapID, nX, nY);
	SetNpcScript(nBoxIndex, "\\script\\online\\collect_card\\cc_boss_box.lua");
	SetNpcLifeTime(nBoxIndex, 10*60);
	local strMsg = format("BOSS %s �� b� hi�p s� %s ti�u di�t, BOSS r�i ra Ho�ng Kim B�o B�i, c�c ��i hi�p nhanh ch�n ��n thu th�p!", GetNpcName(id), GetName());
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
	SetNpcLifeTime(id, 0);
end