-- =====================================================
-- File : ҩƷnpc�Ի��ű�
-- Desc : ��npc�Ի���ȡ��ҩƷ
-- Creator : Tony(Jizheng)
-- =====================================================

Include("\\script\\yaopin_npc_head.lua")

nTotalItemCount = 6					-- �ܹ��ж��ٲɼ���Ʒ

szItemGenre = 		{2,2,2,2,2,2}			-- �ɼ���Ʒ�Ĵ���
szItemDetail = 		{1,1,1,1,1,1}			-- �ɼ���Ʒ�ĸ���
szItemParticular = 	{901,902,903,904,906,907}			-- �ɼ���Ʒ����ϸ���
szItemGailv = 		{17,34,52,68,84,100}		-- �ɼ���Ʒ�ĸ��ʣ��������ʱ�򣬺���һ��Ҫ����ǰ��һ���ĸ��ʣ�
szItemLowCount =	{20,20,20,20,20,20}		-- �ɼ���Ʒ�������
szItemHighCount =	{40,40,40,40,40,40}		-- �ɼ���Ʒ�������

nSkillType = 0						-- �ɼ�������ܴ�����
nSkillID = 7						-- ���鼼��ID
nSkillLevelLow = 1					-- ��Ҫ�ﵽ�Ĳɼ�������͵ȼ�
nSkillLevelHigh = 10				-- ��Ҫ�ﵽ�Ĳɼ�������ߵȼ�

nDigToolCount = 2							-- �ɼ�������������
nDigToolGenre = {0, 0}				-- �ɼ����ߴ���
nDigToolDetail = {200, 200}				-- �ɼ����߸���
nDigToolParticular = {36, 38}		-- �ɼ�������ϸ��
nEndureCount = 90							-- �ɼ��������Ҫ���ĵ��;ö�

-- Ĭ����ں���
function main()
	local nCurNpcIndex = GetTargetNpc()
	if (nCurNpcIndex == 0) then
		return
	end
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- �˶η�ˢ

	local nCanDig = check_dig_condition(nSkillType, nSkillID, nSkillLevelLow)
	
	-- ����Ƿ��вɼ�����
	local nCanDigTool = 0
	for i = 1, nDigToolCount do
		local bHaveDigTool = GetItemCount(nDigToolGenre[i], nDigToolDetail[i], nDigToolParticular[i])
		if (bHaveDigTool ~= 0) then
			nCanDigTool = 1
			break
		end
	end
	
	-- �����ҿ��������ҩƷ����������ִ�ж�
	if (nCanDig == 1 and nCanDigTool == 1) then
		if (DoFireworks(890, 1) == 1) then
			Msg2Player("Thu th�p......");
			CastState("state_fetter", 1, 5 * 18)
			ProgressSlot(5 * 18)
			
			local nMapID, nX, nY = GetWorldPos()
			MedicNpcDeath(nMapID, nCurNpcIndex)
			SetNpcLifeTime(nCurNpcIndex, 0)
			SetNpcScript(nCurNpcIndex, "")
			AbradeDigTool(nSkillID, nSkillLevelLow, nEndureCount)	-- ���Ĳɼ����ߵ��;�
		else
			Msg2Player("Kh�ng th� l�m ��ng t�c n�y � tr�ng th�i ng�i")
		end
	end
	
	if nCanDigTool == 0 then
		Msg2Player("B�n kh�ng mang theo c�ng c� c�n thi�t!")
	end
	
	-- �����Ҳ��������ҩƷ���ñ��˿��Լ�����
	AddUnitStates(nCurNpcIndex, 0, -100)	-- �˶η�ˢ
end;

-- �ھ�����Ժ�Ļص�����
function OnProgressCallback()
	local nExpMultiCount = get_dig_multi_count(nSkillType, nSkillID, nSkillLevelHigh)	-- ��õþ����ʱ��ļӳɱ���
	
	local nSel = random(1, 99)
	local nChoice = 0
	local nSelCount = 0
	
	for i = 1, nTotalItemCount do
		if (nSel < szItemGailv[i]) then
			nChoice = i			
			break
		end
	end
	
	-- ��������Եõ�����
	if (nChoice ~= 0) then
		nSelCount = random(szItemLowCount[nChoice], szItemHighCount[nChoice])
		AddItem(szItemGenre[nChoice], szItemDetail[nChoice], szItemParticular[nChoice], nSelCount)	-- ����Ʒ
		AddLifeSkillExp(nSkillType, nSkillID, nExpMultiCount * nSelCount)							-- �Ӿ���
	end
	
	-- ��ʾ
	if (nChoice == 1) then
		Say("V�t li�u linh ph� n�y c� th� d�ng, ng��i t�m ���c"..nSelCount.." Bi�n Kinh ph� th�ch!", 0)
	elseif (nChoice == 2) then
		Say("Kh�ng ng� b�n trong c�n m�t s� ��, b�n nh�n ���c "..nSelCount.." Th�nh �� ph� th�ch!", 0)
	elseif (nChoice == 3) then
		Say("Kh�ng ng� b�n trong c�n m�t s� ��, b�n nh�n ���c "..nSelCount.." Tuy�n Ch�u ph� th�ch!", 0)
	elseif (nChoice == 4) then
		Say("Kh�ng ng� b�n trong c�n m�t s� ��, b�n nh�n ���c "..nSelCount.." T��ng D��ng ph� th�ch!", 0)
	elseif (nChoice == 5) then
		Say("Kh�ng ng� b�n trong c�n m�t s� ��, b�n nh�n ���c "..nSelCount.." ��i L� ph� th�ch!", 0)
	elseif (nChoice == 6) then
		Say("Kh�ng ng� b�n trong c�n m�t s� ��, b�n nh�n ���c "..nSelCount.." D��ng Ch�u ph� th�ch!", 0)
	else
		Say("M�y t�m da n�y �� r�ch n�t, ng��i v�n ch�a t�m ���c �� c�n d�ng!", 0)
	end	
end;

