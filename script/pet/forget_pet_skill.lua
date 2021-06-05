--�������＼��

NEED_GOLD = 10
MONTE_TO_GOLD_RATE = 10000

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList--���³����б�
	if nPetCount > 0 then
		local szTitle = format("C� ph�i b�n ��ng h�nh c�a c�c h� s� h�u nh�ng k� n�ng h� tr� kh�ng ���c �ng �, kh�ng c�n lo l�ng, ta c� th� gi�p ng��i x�a b� nh�ng k� n�ng b�nh th��ng �� d�nh v� tr� cho k� n�ng cao c�p h�n. Chi ph� cho m�i l�n x�a k� n�ng l� %d v�ng. <color=red>K� n�ng b� x�a �i s� kh�ng th� kh�i ph�c l�i, ch� c� th� luy�n l�i t� ��u.<color> H�y ch�n k� n�ng b�n ��ng h�nh c�n x�a b�:", NEED_GOLD);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T� ch�t c�n l�i:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "Tho�t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","C�c h� ch�a c� b�n ��ng h�nh kh�ng th� x�a k� n�ng!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("C�c h� x�c ��nh x�a k� n�ng b�n ��ng h�nh <color=yellow>%s(t� ch�t c�n l�i:%d/%d)<color> kh�ng?<color=red>k� n�ng b� x�a s� kh�ng th� kh�i ph�c l�i, c� th� th� luy�n l�i t� ��u<color>H�y ch�n k� n�ng c�n x�a (x�a k� n�ng c�n ti�u hao %d v�ng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, NEED_GOLD);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("D�y %d: %s%d c�p (Chi�m t� ch�t: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "tr� l�i/_ChoosePet")
		tinsert(tbSay, "Tho�t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("B�n ��ng h�nh <color=yellow>%s<color> v�n ch�a c� k� n�ng h� tr�, kh�ng th� x�a", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		local szTitle = format("X�c ��nh cho b�n ��ng h�nh <color=yellow>%s (T� ch�t c�n l�i: %d/%d)<color>x�a k� n�ng<color=yellow>d�y th� %d: %s%d c�p (chi�m t� ch�t %d)<color> kh�ng? Th�nh c�ng x�a b� <color=yellow>���c nh�n l�i �i�m t� ch�t: %d<color>. <color=red>K� n�ng b� x�a �i s� kh�ng th� kh�i ph�c l�i, ch� c� th� luy�n l�i t� ��u.<color>H�y x�c ��nh l�n cu�i (x�a k� n�ng c�n ti�u hao %d v�ng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi, NEED_GOLD);
		local szItem = format("X�c ��nh x�a/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("tr� l�i/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "Tho�t/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	local nNeedMoney = NEED_GOLD * MONTE_TO_GOLD_RATE
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("S� v�ng hi�n c� c�a c�c h� kh�ng �� %d v�ng", NEED_GOLD))
		t_player_pet_list[PlayerIndex] = nil
		return
	end
	
	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			Pay(nNeedMoney)
			local szMsg = format("B�n ��ng h�nh %s �� x�a k� n�ng %s th�nh c�ng", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end