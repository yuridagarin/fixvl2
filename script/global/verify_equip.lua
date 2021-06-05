--Include("\\script\\newbattles\\functions.lua");
Include("\\script\\newbattles\\battle_equipment_item.lua")
Include("\\script\\newbattles\\battle_equipment_jungong.lua")
Include("\\script\\newbattles\\battle_equipment_jungong_or_junxian.lua")
-- ��¼���ж�װ���Ƿ���Ч(װ��ħ�������Ƿ�ӵ�Player����)

-- �������˵��
-- 764 ��¼��ұ��ܵ�����,���δ��100��,������Ϊ999
-- 765 ��¼��һ��Ԫ˧�Ĵ���(��������,ֻҪ��Ԫ˧����)
-- 766 ��¼��һ�ý����Ĵ���(��������)
-- 767 ��¼��һ���ȷ�Ĵ���


function VerifyEquip(nGenre, nDetail, nParticular)
	if nGenre ~= 0 then
		return 1
	end
	-- �жϹ���սװ��
	if in_taishou_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
			return 1
		end
		return 0
	elseif in_shiye_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 3) > 0 or IsTitleExist(51, 7) > 0 or IsTitleExist(51, 11) > 0 then
			return 1
		end
		return 0
	elseif in_tixia_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 4) > 0 or IsTitleExist(51, 8) > 0 or IsTitleExist(51, 12) > 0 then
			return 1
		end
		return 0
	end
	
	-- �жϾ���װ��
	local nJXEquipCamp, nJXEquipIdx = in_battle_equip(nGenre, nDetail, nParticular)
	local nJGEquipCamp, nJGEquipIdx = get_jungong_equip_index_in_table_by_gdp(nGenre, nDetail, nParticular)
	if nJXEquipCamp > 0 and nJGEquipCamp > 0 then
		return check_palyer_jungong_or_junxian_equip_state_by_index(nJGEquipCamp,nJGEquipIdx,nJXEquipCamp, nJXEquipIdx)
	elseif nJGEquipCamp > 0 then
		return check_palyer_jungong_equip_state_by_index(nJGEquipCamp,nJGEquipIdx)
	elseif nJXEquipCamp > 0 then
		return ChkBattleEquip(nJXEquipCamp, nJXEquipIdx)
	end
	
	return 1
end

function in_taishou_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 101 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 103 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 102 and nParticular >= 8013 and nParticular <= 8020 then
		return 1
	end
	return 0
end

function in_shiye_item(nDetail, nParticular)
	if nDetail == 102 and nParticular >= 8021 and nParticular <= 8022 then
		return 1
	end
	return 0
end

function in_tixia_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 101 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 103 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8023 and nParticular <= 8026 then
		return 1
	end
	return 0
end



--���װ������Ӫ����table�е�����
function in_battle_equip(nGenre, nDetail, nParticular)
	local nBody = GetBody()
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1]
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4]+nBody-1 == nParticular then
				return i,j	--��Ӫ����table�е�����
			end
		end
	end
	return 0,0
end

function ChkBattleEquip(nEquipCamp, nEquipIdx)
	local nCurRank = BT_GetData(PT_CURRANK)
	local nPlayerCamp = 0
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1]
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID
	end
	if (nEquipCamp ~= nPlayerCamp) then
		Msg2Player("B�n l� ng��i c�a phe "..tCampNameZ[nPlayerCamp]..", kh�ng th� s� d�ng trang b� c�a phe "..tCampNameZ[nEquipCamp]..".")
		return 0
	end
	
	local nYSChanceCount = GetTask(765)
	local nJJChanceCount = GetTask(766)
	local nXFChanceCount = GetTask(767)
	
	nCurRank = abs(nCurRank)
	local nType = tBattleEquip[nEquipCamp][nEquipIdx][2]
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
