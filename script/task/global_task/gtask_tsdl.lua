Include("\\script\\task\\global_task\\gtask_head.lua");

tGTaskTSDL = {};		--��������ͳһ����

--������� ��ǰ�����Ƿ����
--����ֵ
	--0 ������
	--����ֵ ����
function tGTaskTSDL:IsTSDLExist(nTaskID)
	return tGTaskTSDL:GetTSDLIdx(nTaskID);
end

--������� ��ǰ�����Ӧ��Idx
--����ֵ
	-- 0 ������
	-- ����ֵ Idx
function tGTaskTSDL:GetTSDLIdx(nTaskID)
	for n = 2,TABLE_GT_TSDL:getRow() do
		local nTSDLTaskID = tonumber(TABLE_GT_TSDL:getCell(n,1));
		if nTSDLTaskID == nTaskID then
			return n
		end
	end
	
	return 0
end

--������� ��һ������ID���ҵ��������
function tGTaskTSDL:ExtractTSDLList(tTaskID)
	local tRetTaskID = {};
	local tRetTSDLIdx = {};
	
	for n = 2,TABLE_GT_TSDL:getRow() do
		local nTSDLTaskID = tonumber(TABLE_GT_TSDL:getCell(n,1));
		for i = 1, getn(tTaskID) do
			local nTaskID = tTaskID[i];
			if nTSDLTaskID == nTaskID then	--�������ˣ����������Ҫ�������
				tinsert(tRetTSDLIdx, n);
				tinsert(tRetTaskID, nTSDLTaskID);
				break
			end
		end
	end
	
	return tRetTaskID, tRetTSDLIdx
end

--������� ��һ������ID���ҵ���δ��ɵ��������
function tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
	local tRetTaskIDList = {};
	local tRetTSDLList = {};
	local tTaskIDList = {};
	local tTSDLList = {};
	
	tTaskIDList, tTSDLList = tGTaskTSDL:ExtractTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 0 then
			tinsert(tRetTSDLList, tTSDLList[i]);
			tinsert(tRetTaskIDList, tTaskIDList[i]);
		end
	end
	
	return tRetTaskIDList, tRetTSDLList
end

--������� һ������ID�к����������
-- ����ֵ
	--1����
	--0����
function tGTaskTSDL:IsLiveTSDL(tTaskID)
	local tTaskIDList = {}
	local tTSDLList = {};
	
	tTaskIDList , tTSDLList = tGTaskTSDL:ExtractTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 0 then
			return 1
		end
	end
	
	return 0
end

--��������Ƿ����
--����ֵ
	--1�����
	--0��δ���
function tGTaskTSDL:IsTSDLEnd(nTSDLIdx)
	local szTemp = TABLE_GT_TSDL:getCell(nTSDLIdx, 5);
	local tItemID = split(szTemp,",");
	
	if tonumber(TABLE_GT_TSDL:getCell(nTSDLIdx, 7)) > GetItemCount(tItemID[1],tItemID[2],tItemID[3]) then
		return 0
	end
	
	return 1
end

--��������ͼƥ��
--����ֵ
	--0��ƥ��
	--����ֵ����ƥ��
function tGTaskTSDL:IsMatchMap(nTSDLIdx, nMapID)
	local nTabMapID = tonumber(TABLE_GT_TSDL:getCell(n, 2));
	if nTabMapID == nil then
		nTabMapID = 0
	end
	if  nTabMapID ~= 0 and nTabMapID == nMapID then
		nTabMapID = 0
	end	
	return nTabMapID;
end

--�������Npcƥ��
--����ֵ
	--1��ƥ��
	--0����ƥ��
function tGTaskTSDL:IsMatchNpc(nTSDLIdx, szNpcName)
	local strNpcName = TABLE_GT_TSDL:getCell(nTSDLIdx, 3);
	local tNpcName =split(strNpcName, ",");
	for i = 1, getn(tNpcName) do
		if tNpcName[i] == szNpcName then
			return 1;
		end
	end	
	
	return 0
end

--������� ���������������
--����ֵ
	--1������
	--2��������
function tGTaskTSDL:IsMatch(nTSDLIdx, szNpcName, nMapID)
	local bMap = tGTaskTSDL:IsMatchMap(nTSDLIdx, nMapID);
	local nIsTSDLNpc = tGTaskTSDL:IsMatchNpc(nTSDLIdx, szNpcName);
	
	if bMap == 0 and nIsTSDLNpc == 1 then
		return 1
	end
	
	return 0
end

----------------------------------------------------------------------------------------------------������й�
