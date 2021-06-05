Include("\\settings\\static_script\\kf_newbattles\\battle_equipment_jungong.lua")
Include("\\settings\\static_script\\kf_newbattles\\battle_equipment_item.lua")


function CanEquip(nItemIdx)
	if check_palyer_jungong_equip_state(nItemIdx,1) == 0 then
		if check_palyer_state(nItemIdx) == 0 then
			return 1;	--���ܴ�
		end
	end
	return 0;
end;

function OnUse(nItemIdx)
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end

function check_palyer_jungong_or_junxian_equip_state_by_index(nJunGongEquipCamp,nJungGongEquipIdx, nJunXianEquipCamp,nJungXianEquipIdx)
	if nEquipCamp == 0 then
		Msg2Player("��y kh�ng ph�i l� trang b� chi�n tr�n ");
		return 0;
	end;
	local nPlayerCamp = BT_GetCurCamp()
	local nCurPoint = abs(BT_GetData(PT_RANKPOINT));
	
	local tEquipJG = tJunGongBattleEquip[nJunGongEquipCamp][nJunGongEquipCamp]
	local sEquipName = tEquipJG[1][1]
	local nNeedPoint = tEquipJG[2];
	
	if nPlayerCamp == ALL_ID then
		Msg2Player("Qu�n h�m c�a b�n hi�n m�i l� Binh s�, kh�ng th� nh�n trang b�"..sEquipName)
		return 0;	
	end;
	
	if (nJunGongEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("Ng��i l� phe T�ng, kh�ng th� m�c trang b� phe Li�u");
		else
			Msg2Player("Ng��i l� phe Li�u, kh�ng th� m�c trang b� phe T�ng");
		end;
		return 0;
	end;
	
	if nCurPoint >= nNeedPoint then --ͨ��
		return 1;
	end;
	
	--local szMsg = format("��ľ�������%d����װ��%s", nNeedPoint, sEquipName)
	---------------------------------------------------------------------------------------------------------------
	local nCurRank = BT_GetData(PT_CURRANK)
	local nPlayerCamp = 0
	local tEquipJX = tBattleEquip[nJunXianEquipCamp][nJungXianEquipIdx]
	local sEquipName = tEquipJX[1][1]
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID
	end
	if (nJunXianEquipCamp ~= nPlayerCamp) then
		Msg2Player("B�n l� ng��i c�a phe "..tCampNameZ[nPlayerCamp]..", kh�ng th� s� d�ng trang b� c�a phe "..tCampNameZ[nEquipCamp]..".")
		return 0
	end
	
	local nYSChanceCount = GetTask(765)
	local nJJChanceCount = GetTask(766)
	local nXFChanceCount = GetTask(767)
	
	nCurRank = abs(nCurRank)
	local nType = tEquipJX[2]
	if nType == 3 then		-- ��ͳ
		if nCurRank >= 3 or					-- �����Ƕ�ͳ�����Ͼ���
			nYSChanceCount >= 15 or			-- ����Ԫ˧
			nJJChanceCount + nYSChanceCount >= 10 or			-- ���ý���
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- �����ȷ�
			return 1
		end
	elseif nType == 4 then	-- �ȷ�
		if nCurRank >= 4 or					-- �������ȷ�����Ͼ���
			nYSChanceCount >= 15 or			-- ����Ԫ˧
			nJJChanceCount + nYSChanceCount >= 10 or			-- ���ý���
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- �����ȷ�
			return 1
		end
	elseif nType == 5 then	-- ����
		if nCurRank >= 5 or					-- �����Ǵ󽫻����Ͼ���
			nYSChanceCount >= 15 or			-- ����Ԫ˧
			nJJChanceCount + nYSChanceCount >= 10 then			-- ���ý���
			return 1
		end
	elseif nType == 6 then	-- Ԫ˧
		if nCurRank == 6 then					-- ������Ԫ˧
			return 1
		end
	elseif nType == 7 then	-- ����Ԫ˧
		if nCurRank == 6 or					-- ������Ԫ˧
			nYSChanceCount >= 15 then		-- ����Ԫ˧
			return 1
		end
	end
	Msg2Player("Qu�n h�m c�a b�n qu� th�p, kh�ng th� trang b�"..sEquipName)
	return 0
	
end