-- =====================================================
-- File : ҩƷnpc�Ի��ű���ͷ�ļ�
-- Desc : һЩͨ�õĺ���
-- Creator : Tony(Jizheng)
-- =====================================================

-- ����3������������ܵĴ��࣬ID����������ܵĵȼ�
-- ����һ��������1��ʾ�����ѧ�������ܣ����ҵȼ��ﵽҪ��0��ʾ����Ҫ��
function check_dig_condition(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)

	strTab = {"��n c�y", "L�m da", "Canh t�c", "H�i thu�c", "��o kho�ng", "K�o t�", "T�p linh"}
	
	local nRet = 0
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	
	if (nCurLifeSkillLevel == 0) then
		Say("H�y �i h�c k� n�ng "..strTab[nLifeSkillID].." r�i quay l�i nh�!", 0)
	elseif (nCurLifeSkillLevel < nLifeSkillLevel) then
		Say("Thi�u hi�p_"..strTab[nLifeSkillID].." (K� n�ng) ch�a �� c�p "..nLifeSkillLevel..", h�y �i t�ng c�p k� n�ng!", 0)
	else
		nRet = 1
	end
	
	return nRet
end;

-- ����3������������ܵĴ��࣬ID�����вɼ���Ʒ����ߵȼ�
-- ����һ����������ʾ��Ҳɼ��������Ʒ���ܵõ��ľ��鱶��
function get_dig_multi_count(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)
	local nRet = 1
	
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	if (nCurLifeSkillLevel <= nLifeSkillLevel) then
		nRet = 8
	elseif (nCurLifeSkillLevel - nLifeSkillLevel <= 10) then
		nRet = 4
	end
	
	return nRet
end;

