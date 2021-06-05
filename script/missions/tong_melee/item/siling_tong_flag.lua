Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local	tMapName = {
		[100] = "Tuy�n Ch�u",
		[150] = "D��ng Ch�u",
		[200] = "Bi�n Kinh",
		[300] = "Th�nh ��",
		[350] = "T��ng D��ng",
		[400] = "��i L�",
		[500] = "Ph�ng T��ng",
	}
	local nMapId, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapId) ~= 1 then
		Talk(1,"","Ch� c� th� s� d�ng � 7 th�nh th� l�n!");
		return 0;
	end
	if IsTongMember() <= 0 then
		Talk(1,"","Ng��i kh�ng ph�i th�nh vi�n c�a bang h�i!");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local sTongName = GetTongName();
	local npcIndex = CreateNpc("QxBangpaiqi", sTongName, nMapId, nX, nY);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, "\\script\\missions\\tong_melee\\item\\siling_tong_flag.lua");
		SetNpcLifeTime(npcIndex, 2*60*60);
		local msg = format("%s �� ���c %s th�nh l�p %s, c�c ��i hi�p c� th� ��n nh�n th��ng!",GetName(), tMapName[nMapId], "Chi�n K� T� Linh Bang H�i");
		Msg2Global(msg);
		AddLocalCountNews(msg, 2);
		Msg2Tong(msg);
	end
end

function main()
	local tSay = {};
	local sTongName = GetNpcName(GetTargetNpc());
	local msg = "<color=green> Chi�n K� T� Linh Bang H�i :<color>"..format("Bang h�i <color=yellow>%s<color> trong l�c bang h�i lo�n chi�n nh�n ���c th�nh t�ch v��t tr�i, c�c th�nh vi�n bang h�i ��u c� th� ��i tho�i v�i ta �� nh�n ph�n th��ng v��t m�c!", sTongName);
	if GetTongName() ~= sTongName then
		tinsert(tSay, "Ng��i kh�ng thu�c th�nh vi�n bang h�i n�y/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetTaskByte(TM_TASKID_YINJUAN, 3) ~= 0 then
		tinsert(tSay, "Ng��i �� nh�n th��ng r�i/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTime() - GetJoinTongTime() < 24 * 3600 then
		tinsert(tSay, "Ng��i gia nh�p bang h�i ch�a �� 24 ti�ng/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTongName() == sTongName then
		tinsert(tSay, "Nh�n th��ng ngay/get_award_now");
		tinsert(tSay, "�� ta suy ngh�/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
end

function get_award_now()
	if gf_GetTaskByte(TM_TASKID_YINJUAN, 3) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	gf_SetTaskByte(TM_TASKID_YINJUAN, 3, 1, TASK_ACCESS_CODE_TONG_MELEE);
	local nLevel = GetLevel();
	gf_ModifyExp(nLevel*nLevel*nLevel*20);
	AwardGenuineQi(500);
	gf_EventGiveCustomAward(3, 150, 1);
	gf_EventGiveCustomAward(4, 200, 1);
	gf_AddItemEx2({2, 1, 30588, 20}, "M�nh L�nh B�i Bang H�i", "Lo�n chi�n bang h�i", "Chi�n K� T� Linh Bang H�i", 0, 1);
end

function nothing()
end