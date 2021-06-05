--���ڱ���ʹ�ýű�
Include("\\script\\online\\spring2014\\sp_head.lua")

function OnUse(nItem)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	sp_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	local npcIndex = GetTargetNpc();
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName ~= "Ni�n th�" then
		Talk(1,"","Ph�o n�m m�i ch� c� th� s� d�ng ��i v�i Ni�n Th�");
		return 0;
	end
	local nCount = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.MaxUse);
	if nCount >= 20 then
		NpcChat(npcIndex, SP_NIANSHOU_EXTALK[random(getn(SP_NIANSHOU_EXTALK))]);
		Talk(1,"",format("��i hi�p th�t l�i h�i, h�m nay �� ��t %d ph�o, ngh� ng�i �i, ng�y mai l�i ��n t�m Ni�n Th� nh�.", nCount));
		return 0;
	end
	local npcMapId, npcX, npcY = GetNpcWorldPos(npcIndex);
	local nMapId, nX, nY = GetWorldPos();
	if npcMapId ~= nMapId or 
		(npcX - nX)^2 + (npcY - nY)^2 > 160 then
		Msg2Player("Cu� ly c�ch Ni�n Th� qu� xa kh�ng th� s� dung ph�o n�m m�i");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.MaxUse, nCount + 1);
	local nDate = tonumber(date("%m%d"));
	local nLastDate = SP_TASK_GROUP:GetMyTaskByte(SP_TASK_GROUP.UseTimes, 1, 2);
	local nDays = SP_TASK_GROUP:GetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4);
	DebugOutput(nLastDate, nDate, nDays)
	if nDate ~=  nLastDate then
		SP_TASK_GROUP:SetMyTaskByte(SP_TASK_GROUP.UseTimes, 1, 2, nDate);
		SP_TASK_GROUP:SetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4, nDays + 1);
	end
	--������Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(), 936, 0, 0, 3*18);
	--����
	gf_ModifyExp(200000);
	AwardGenuineQi(20);
	local bIsDropBox = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.DropBox);
	if bIsDropBox == 0 and nCount + 1 > 5 then
		if nCount + 1 >= 20 then
			gf_AddItemEx2({2,1,30626,1}, "B�o R��ng Ni�n Th�", "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
			SP_TASK_GROUP:SetTask(SP_TASK_GROUP.DropBox, 1);
			SetCurrentNpcSFX(npcIndex, 944, 2, 0, 6*18);
			NpcChat(npcIndex, SP_NIANSHOU_TALK[random(getn(SP_NIANSHOU_TALK))]);
		else
			if 5 + random(15) == nCount + 1 then
				gf_AddItemEx2({2,1,30626,1}, "B�o R��ng Ni�n Th�", "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
				SP_TASK_GROUP:SetTask(SP_TASK_GROUP.DropBox, 1);
				SetCurrentNpcSFX(npcIndex, 944, 2, 0, 6*18);
				NpcChat(npcIndex, SP_NIANSHOU_TALK[random(getn(SP_NIANSHOU_TALK))]);
			end
		end
	end
end