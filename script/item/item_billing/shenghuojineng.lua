------------------------------------------------------------
-- ũɣ��Ҫ�Ľű� shenghuojineng.lua
--
-- comment: ʹ��ѧϰ��һ���ɼ�����
-- creator: Tony(Jizheng)
-- Date   : Feb 1st, 2007
--
-- Item ID:  2,1,1056
------------------------------------------------------------
DIG_SKILL_LEVEL = 70		-- ����ܵĵȼ�

-- ʹ����Ʒ��ʱ��Ĭ�ϵ���ں���
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- ��ʹ�õ�����������Index
	Say("B�n mu�n d�ng <color=yellow>N�ng Tang ph�<color>? N� c� th� gi�p b�n h�c ���c 1 trong c�c k� n�ng thu th�p ��n c�p <color=yellow>70<color>.",
		8,
		"K� n�ng ��n c�y/#learn_dig_skill("..nScrollIndex..", 1)",
		"K� n�ng thu�c da/#learn_dig_skill("..nScrollIndex..", 2)",
		"K� n�ng canh t�c/#learn_dig_skill("..nScrollIndex..", 3)",
		"K� n�ng h�i thu�c/#learn_dig_skill("..nScrollIndex..", 4)",
		"K� n�ng khai kho�ng/#learn_dig_skill("..nScrollIndex..", 5)",
		"K� n�ng k�o t�/#learn_dig_skill("..nScrollIndex..", 6)",
		"T�p linh/#learn_dig_skill("..nScrollIndex..", 7)",
		"T�m th�i ch�a c�n!/cancel_dialog")
end;

function cancel_dialog()
end;

-- ѧ���ƶ��ļ��ܵ��ƶ�����
function learn_dig_skill(nScrollIndex, nSkillID)
	local nCurDigSkillLevel = GetLifeSkillLevel(0, nSkillID)
	if (nCurDigSkillLevel >= 70) then
		Say("B�n �� h�c ���c k� n�ng thu th�p n�y v� v��t qua c�p 70, kh�ng c�n s� d�ng N�ng Tang ph�! ", 0)
		return
	end
	
	if (DelItemByIndex(nScrollIndex, 1) == 1) then
		LearnLifeSkill(0, nSkillID, 70, 79, 0)
		SetTask(1925, 15)
	end
	
	Say("B�n �� h�c ���c k� n�ng thu th�p n�y!", 0)
end;

