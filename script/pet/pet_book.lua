--Include("\\script\\pet\\pet_book_exchange.lua")
--Include("\\script\\pet\\pet_update.lua")
--Include("\\script\\pet\\forget_pet_skill.lua")
--ENABLE_PET_NPC_TEST=1

--ͨ�����＼����ѧϰ���＼��
--MONEY_NEED_RATE = 50000
MONTE_TO_GOLD_RATE = 10000

function OnUse(id)
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	local szBookName = GetItemName(id)
	if nPetCount > 0 then
		local nLevel = GetItemLevel(id)
		local nNeedMoney = _get_need_money(nLevel)
		local nNeedGold = floor(nNeedMoney / MONTE_TO_GOLD_RATE)
		local szTitle = format("H�y ch�n k� n�ng c�n luy�n <color=yellow>[%s]<color> cho b�n ��ng h�nh (luy�n k� n�ng c�n ti�u hao %d v�ng). ��i v�i nh�ng k� n�ng �� c� v�i c�p �� th�p h�n ���c n�ng c�p th�nh c�ng s� ���c nh�n l�i t� ch�t �� chi�m d�ng. <enter><color=red>Ch� �, k� n�ng luy�n th�nh c�ng c� t� l� nh�t ��nh thay th� k� n�ng h� tr� hi�n c�.<color>", szBookName, nNeedGold);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T� ch�t c�n l�i:%d/%d)/#_OnLearnOnPet(%d, %d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, id, tbPetList[i].nIndex)
			tinsert(tbSay, szItem)
		end
--		if ENABLE_PET_NPC_TEST then
--			tinsert(tbSay, "��Ҫ�������/PetUpdateMain")
--			tinsert(tbSay, "��Ҫ�һ���鼼����/PetBookExchangeMain")
--			tinsert(tbSay, "��Ҫ������鼼��/ForgetPetSkillMain")
--		end
		tinsert(tbSay, "Th�i �i, ta kh�ng mu�n h�c/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		Talk(1,"","C�c h� ch�a c� b�n ��ng h�nh, kh�ng th� s� d�ng s�ch k� n�ng n�y!")
	end
end

function _OnLearnOnPet(nBookId, nPetIndex)
	local nLevel = GetItemLevel(nBookId)
	local nNeedMoney = _get_need_money(nLevel)
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("S� v�ng hi�n c� c�a c�c h� kh�ng �� %d v�ng", floor(nNeedMoney/MONTE_TO_GOLD_RATE)))
		return
	end
	
	local nRet = LearnPetSkill(nBookId, nPetIndex)
	if nRet > 0 then
		DelItemByIndex(nBookId, -1)--��ɾ��������
		Pay(nNeedMoney)
		if nRet > 1 then
			Msg2Player("Luy�n k� n�ng b�n ��ng h�nh th�nh c�ng!")
		else
			Msg2Player("Luy�n k� n�ng b�n ��ng h�nh th�t b�i!")
		end
		WriteLog(format("[Account:%s Role:%s]Use pet skill book %s(%d,%d,%d) ItemIdx=%d, PayMoney=%d, RetValue=%d(2=success)"
			, GetAccount(), GetName(), GetItemName(nBookId), GetItemGenre(nBookId), GetItemDetail(nBookId), GetItemParticular(nBookId)
			, nBookId, nNeedMoney, nRet
			))
	end
end

function _get_need_money(nLevel)
	local tMoney = {
		2*10000,
		4*10000,
		10*10000,
		50*10000,
		200*10000,
	}
	if nLevel>=1 and nLevel<=getn(tMoney) then
		return tMoney[nLevel]
	else
		return 999999*10000
	end
end

function no()
end