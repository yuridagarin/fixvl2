
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--============================================================================================== HEAD ====
SF_FILE_SVR =
{
	"\\script\\�ؽ�ɽׯ\\task_script\\�ɶ�\\�ؽ�ʹ��.lua",
	"\\script\\�ؽ�ɽׯ\\task_script\\�꾩\\�ؽ�ʹ��.lua",
	"\\script\\�ؽ�ɽׯ\\task_script\\Ȫ��\\�ؽ�ʹ��.lua",
	"\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua",
	"\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua"
}

--���д����ң��Ƿ��������ͣ���Ʒ���ƣ����࣬���࣬��ϸ���
tGOOD_DROP_ITEM = 
{
	[1] = {1, "T�ng Qu�n kh�", 0, 101, 91},
	[2] = {1, "T�ng Qu�n Ngo�i trang", 0, 100, 91},
	[3] = {0, "Ti�u Th� Gi�i Ch�", 0, 102, 36},
	[4] = {1, "Trang Ch� m�o", 0, 103, 91},
	[5] = {0, "Tr��ng L�o Ch� Ho�n", 0, 102, 37},
	[6] = {0, "T�ng Ki�m B�o Ch�u", 0, 102, 38},
	[7] = {0, "T�ng Ki�m K� Th�ch", 0, 102, 39},
	[8] = {1, "T�ng Ki�m T� Kim m�o", 0,103,95},
	[9] = {1, "Kim L� Th��ng", 0,100,95},
	[10] = {1, "T�ng Ki�m � kim ph�c", 0,101,95},
	[11] = {0, "T�ng Ki�m Kim �n", 0,102,40},
}

tBOSS_GOOD_DROP =
{
	["T�ng qu�n ngo�i vi�n"] = {
		[70] = {{100, 1}},
		[80] = {{120, 1}},
		[90] = {{160, 1}},
	},
		
	["T�ng qu�n n�i vi�n"] = {
		[70] = {{100, 2}},
		[80] = {{120, 2}},
		[90] = {{160, 2}},
	},
	
	["��i ti�u th�"] = {
		[70] = {{100, 3}},
		[80] = {{120, 3}},
		[90] = {{160, 3}},
	},
		
	["��i trang ch�"] = {
		[70] = {{100, 4}},
		[80] = {{120, 4}},
		[90] = {{160, 4}},
	},
	
	["Tr��ng l�o T�ng Ki�m C�c"] = {
		[70] = {{100, 5}},
		
		[80] = {
			{120, 5},
			{160, 11},
			{200, 7},
		},
		
		[90] = {
			{160, 5},
			{210, 11},
			{260, 7},
		},
	},
		
	["C�u Tuy�t Ki�m Ma"] = {
		[80] = {
			{60	, 8},
			{160, 9},
			{220, 10},
			{235, 6},
		},
		
		[90] = {
			{60 , 8},
			{160, 9},
			{220, 10},
			{235, 6},
		},
	},
}


SF_TOWNID_SVR = {300,200,100,350,150}
SF_TOWNNAME_SVR = {"Th�nh ��","Bi�n Kinh","Tuy�n Ch�u","T��ng D��ng","D��ng Ch�u"}
SF_BACKPOINT_SVR = {			-- �����жϺ���ҷ��صĵص�
{300,1776,3704},
{200,1229,2763},
{100,1510,3107},
{350,1395,2852},
{150,1745,3120}}
SF_FILE = ""		-- ��ͬ��������Ҫ�޸Ĵ˴�ָ��ʵ���ļ�
SF_TOWNID = 350
SF_TOWNNAME = "T��ng D��ng"
SF_BACKPOINT = {350, 1397, 2852}
SF_MAPBASE = 1000
--09��8�²ؽ�������������
tNEW_AWARD_EX = {
	{--��һ��
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--�ڶ���
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--������
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--���Ĺ�
		[5] = 30000,
		[6] = 120000,
		[7] = 150000,
		[8] = 180000,
		[9] = 210000,
	},
	{--�����
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--������
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

tNEW_AWARD_EX_2 = {
	{--��һ��
		[5] = 15000,
		[6] = 60000,
		[7] = 75000,
		[8] = 90000,
		[9] = 105000,
	},
	{--�ڶ���
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--������
		[5] = 20000,
		[6] = 80000,
		[7] = 100000,
		[8] = 120000,
		[9] = 140000,
	},
	{--���Ĺ�
		[5] = 2100000,
		[6] = 2300000,
		[7] = 2500000,
		[8] = 3000000,
		[9] = 3250000,
	},
	{--�����
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
	{--������
		[5] = 40000,
		[6] = 160000,
		[7] = 200000,
		[8] = 240000,
		[9] = 280000,
	},
};

--09��8�²ؽ�������������
tNEW_AWARD_EX_STAGE_7_NEW = {
		[5] = 1225000,
		[6] = 1675000,
		[7] = 2125000,
		[8] = 3250000,
		[9] = 3812500,
};

tNEW_AWARD_EX_STAGE_7_2 = {
		[5] = 2200000,
		[6] = 2600000,
		[7] = 3000000,
		[8] = 4000000,
		[9] = 4500000,
};

------------------------------------------------------------------------------------------------ FUNCTION ----    			
function Main_Init(nSvr)
	SF_FILE = SF_FILE_SVR[nSvr]
	SF_MAPBASE = nSvr*1000
	SF_TOWNID = SF_TOWNID_SVR[nSvr]
	SF_TOWNNAME = SF_TOWNNAME_SVR[nSvr]
	SF_BACKPOINT = {SF_BACKPOINT_SVR[nSvr][1], SF_BACKPOINT_SVR[nSvr][2], SF_BACKPOINT_SVR[nSvr][3]}
end

if SERVER_INDEX ~= nil then
	Main_Init(SERVER_INDEX)
end

--============================================================================================== MISC UNIT ====
------------------------------------------------------------------------------------------------ FUNCTION ----    			
function SB_GetPNPage(nStage)
	if nStage == nil then
		nStage = 1
	end
	local nStagePre = nStage - 1
	local nStageNext = nStage + 1
	if (nStagePre < 1) or (nStagePre == 9) then
		nStagePre = 10
	end
	if nStageNext == 11 then
		nStageNext = 1
	elseif nStageNext == 10 then
		nStageNext = 9
	end
----------- �˴�Ϊ����δ���ŵĳ�����ҳ����ʾ
	if nStageNext == 6 then
		nStageNext = 8
	elseif nStagePre == 7 then
		nStagePre = 5
	end
----------- --------------------------------
	return nStagePre, nStageNext
end

-- ��ʽ���ַ�����Ϊ sStr ��ӿո����"0"�ﵽ nLen �ĳ���
-- sStr : ԭ����(�������ַ�������)
-- nLen : ��ʽ�󳤶�
-- nMode : 1.�ڴ���ҿո�(��ȱĬ��) 2.�ڴ�ǰ�ӿո� 3.�ڴ�ǰ�ӡ�0��
-- ���ظ�ʽ������ַ���
function SB_FormatStr(sStr, nLen, nMode)
	if sStr == nil then sStr = GetName() end
	if type(sStr) ~= "string" then sStr = tostring(sStr) end
	if nLen == nil then nLen = 16 end
	local nStrLen = strlen(sStr)
	local nSpaceNum = nLen - nStrLen
	for i=1, nSpaceNum do
		if (nMode == nil) or (nMode == 1) then
			sStr = sStr.." "
		elseif (nMode == 2) then
			sStr = " "..sStr
		elseif (nMode == 3) then
			sStr = "0"..sStr
		end
	end
	return sStr
end

-- ���� 
-- num : ����
-- steps : ������
-- ���� �� �� ����
function SB_Div(num, steps)
	if tonumber(num) == nil then
		return 0
	else
		num = tonumber(num)
	end
	if (steps == nil) then
		steps = 10
	end
	if (steps == 0) then
		steps = 1
	end
	return (num - mod(num, steps)) / steps, mod(num, steps)
end

-- ������ֻ�ܳ���10��������
-- num : ����
-- steps : ������
-- ���� ��
function MU_Div(num, steps)
	if tonumber(num) == nil then						-- ���� steps
		return 0
	else
		num = tonumber(num)
	end
--	if (steps == nil) or (mod(steps, 10) ~= 0) then
	if (steps == nil) then
		steps = 10
	end
	return (num - mod(num, steps)) / steps
end

-- ��ת����ת BOOLEAN
-- num : 0 or 1
-- ���� (not num)
function MU_Inverse(num)
	if num == 0 then
		return 1
	else
		return 0
	end
end

-- ������Ϣ����ǰ������ڶ��鷢����Ϣ
-- msg : ��Ҫ���͵���Ϣ
-- msgtype : ������Ϣ�ķ�ʽ: 0.Msg2Player(ȱʡĬ��) 1.Say 2.Talk
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

-- ��������: ȡ�������ľ���
function MU_Distance(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)		-- �ж���������
	if MapID1 ~= MapID2 then
		Msg2Player("Error: Khu v�c kh�ng ph� h�p!")
		return 0
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

-- ������ɫ: �����ֶ���ɫ�󷵻�
-- text : ��Ҫ��ɫ�����ֶ�
-- color : ��Ҫ����ɫ: gray red green blue yellow gold wood metal fire water earth ....
function MU_GetColoredText(text, color)
	return "<color="..color..">"..text.."<color>"
end

function MU_Split(str,splitor)
	if (splitor == nil) then
		splitor = ","
	end
	local strArray = {}
	local strStart = 1
	local splitorLen = strlen(splitor)
	local index = strfind(str, splitor, strStart)
	if (index == nil) then
		strArray[1] = str
		return strArray, 1
	end
	local i = 1
	while (index ~= nil) do
		strArray[i] = strsub(str, strStart, index-1)
		i = i + 1
		strStart = index + splitorLen
		index = strfind(str, splitor, strStart)
	end
	strArray[i] = strsub(str, strStart, strlen(str))
	return strArray, i
end

--============================================================================================== SPAWNER TABLE ====
-- Spawner Table
ST_FILE = new(KTabFile, "\\settings\\�ؽ�ɽׯ\\spawner\\cangjian_spawner.txt")			-- ��¼ÿ���ؿ�ˢ�ֵ���Ϣ�ı��
ST_TYPE = {"SortID","UnitIndex","MapID","MapX","MapY","NpcID",							-- ��ͷ�������ƣ�
		   "NpcName","RandomTable","SpawnPeriod","Amount","Limit","SpawnerCount"}
ST_ROWCOUNT = tonumber(ST_FILE:getRow())												-- ��������
ST_LMD_INIT = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- �����ʼ���ؿ����䣨����λ�ã�
ST_LMD_SPWN = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- ����ˢ�ֵ�ؿ����䣨����λ�ã�

------------------------------------------------------------------------------------------------ FUNCTION ----
-- ����ĳ�ʼ������
-- ��������ÿһ�ص���Ϣ��λ������
function ST_Init()
	for i=2, ST_ROWCOUNT do												-- ����ؿ�����
		local tempdata = tonumber(ST_FILE:getCell(i, ST_TYPE[1]))
		if (tempdata >= 10000) then
			local nStage = (tempdata - mod(tempdata, 10000)) / 10000
			if (ST_LMD_INIT[nStage][1] == 0) then
				ST_LMD_INIT[nStage][1] = i
				ST_LMD_INIT[nStage][2] = i
			else
				ST_LMD_INIT[nStage][2] = i
			end
		else
			local nStage = (tempdata - mod(tempdata, 100)) / 100
			if (ST_LMD_SPWN[nStage][1] == 0) then
				ST_LMD_SPWN[nStage][1] = i
				ST_LMD_SPWN[nStage][2] = i
			else
				ST_LMD_SPWN[nStage][2] = i
			end
		end
	end
end				
ST_Init()	-------------------------------------------------------------- ��ʼ��ִ��

-- ȡ�ù̶�row��datatype�еĵ�Ԫ����
function ST_GetData(row, datatype)
	local tempdata = ST_FILE:getCell(row, ST_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- ͨ��datatype��ȡ��data������
function ST_GetRow(data, datatype)
	for i=2, ST_ROWCOUNT do
		if (data == ST_GetData(i, datatype)) then
			return i
		end
	end
end

-- ȡ��ĳ���ݵ�����������(����������ظ�����,��ȡ�������λ�õ�����)
function ST_GetLoc(data)
	for i=2, ST_ROWCOUNT do
		for j=1, 12 do
			local datax = ST_GetData(i, j)
			if (data == datax) then
				return i, j
			end
		end
	end
end

--============================================================================================== GEARS TABLE ====
-- Gears Table
GT_FILE = new(KTabFile, "\\settings\\�ؽ�ɽׯ\\gears\\cangjian_gears.txt")			-- ��¼ÿ���ؿ�ˢ�ֵ���Ϣ�ı��
GT_TYPE = {"�i","Ng��i b� r�t","S� ki�n","Tr�ng th�i","Lo�i h�nh ��o c�","Lo�i ph� r�i ra","Lo�i nh� ph� thu�c",			-- ��ͷ�������ƣ� 
		   "T� l� r�i30","T� l� r�i40","T� l� r�i50","T� l� r�i60","T� l� r�i70","T� l� r�i80","T� l� r�i90"}
GT_ROWCOUNT = tonumber(GT_FILE:getRow())											-- ��������
GT_GEARSPART = {"��u", "Th�n th�", "Ch�n", "Kim ho�n", "V� kh�"}
GT_GEARFACTION = {"Thi�u L�m t�c gia", "Thi�u L�m t�c gia", "Thi�u L�m thi�n t�ng", "Thi�u L�m v� t�ng", "���ng M�n", "Nga My ph�t gia", "Nga My t�c gia", "C�i Bang T�nh y", "C�i Bang � Y", "V� �ang ��o gia", "V� �ang t�c gia", "D��ng M�n th��ng K�", "D��ng M�n Cung K�", "Hi�p ��c", "T� ��c"}
------------------------------------------------------------------------------------------------ FUNCTION ----
-- ȡ�ù̶�row��datatype�еĵ�Ԫ����
function GT_GetData(row, datatype)
	local tempdata = GT_FILE:getCell(row, GT_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- ͨ��datatype��ȡ��data������
function GT_GetRow(data, datatype)
	for i=2, GT_ROWCOUNT do
		if (data == GT_GetData(i, datatype)) then
			return i
		end
	end
end

-- ȡ��ĳ���ݵ�����������(����������ظ�����,��ȡ�������λ�õ�����)
function GT_GetLoc(data)
	for i=2, GT_ROWCOUNT do
		for j=1, 12 do
			local datax = GT_GetData(i, j)
			if (data == datax) then
				return i, j
			end
		end
	end
end

--�µĸ��������󣬼��������
function GT_BossGiveNew(name)

	-- Խ��2009	���»
	if is_march_09_viet_open() == 1 then
		local tDropBag =
		{
			["C�u Tuy�t Ki�m Ma"] = 80,
		}

		local nItemNum = tDropBag[name]
		if nItemNum == nil then
			nItemNum = 1
			local nRandom = random(1,100)
			if nRandom <= 30 then
				add_bag_march_09_viet(nItemNum, "T�ng Ki�m s�n trang")
			end
		else
			local nOldPlayer = PlayerIndex
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if GetTask(GS_RECORD_CHANCE) > 1 then
						add_bag_march_09_viet(nItemNum, "T�ng Ki�m s�n trang")
					end
				end
			end
			PlayerIndex = nOldPlayer
		end
	end
end

--���ٺ���������ɱ��boss��callһ��NPC����
function GT_NewBossDrop(name)
	local tDrop =
	{
		["T�ng qu�n ngo�i vi�n"] = {"L�nh b�i t�ng qu�n ngo�i vi�n", "L�nh b�i t�ng qu�n ngo�i vi�n", "\\script\\task\\tasklink\\taskitem.lua"},
		["T�ng qu�n n�i vi�n"] = {"L�nh b�i t�ng qu�n n�i vi�n", "L�nh b�i t�ng qu�n n�i vi�n", "\\script\\task\\tasklink\\taskitem.lua"},
		["��i ti�u th�"] = {"Vi�t N� ki�m", "Vi�t N� ki�m", "\\script\\task\\tasklink\\taskitem.lua"},
		["��i trang ch�"] = {"Trang ch� kim �n", "Trang ch� kim �n", "\\script\\task\\tasklink\\taskitem.lua"},
		["Tr��ng l�o T�ng Ki�m C�c"] = {"Tr��ng L�o Ch� Ho�n", "Tr��ng L�o Ch� Ho�n", "\\script\\task\\tasklink\\taskitem.lua"},
	}
	
	if tDrop[name] == nil then
		return
	end
	
	local nMapID, nX, nY = GetNpcWorldPos(TT_TARGET_Index)
	local nChestIndex = CreateNpc(tDrop[name][1], tDrop[name][2], nMapID, nX - 2, nY - 2)
	SetNpcDeathScript(nChestIndex, tDrop[name][3])
	SetNpcLifeTime(nChestIndex, 5 * 60)		-- ͳһNPC���ʱ��Ϊ5����
	WriteLog("[T�ng Ki�m s�n trang] boss : "..name.."Sau khi ��nh b�i CALL ra NPC:"..tDrop[name][1])
end

function GT_GoodDrop(name, level)
	-- boss���µ���
	if tBOSS_GOOD_DROP[name] == nil then
		return 0
	elseif tBOSS_GOOD_DROP[name][level] == nil then
		return 0
	end
	
	local MAX_RANDOM = 25000
	local nArea = random(0, MAX_RANDOM)
	local nItemIndex = 0
	
	for index, value in tBOSS_GOOD_DROP[name][level] do
		if nArea < value[1] then
			nItemIndex = value[2]
			break
		end
	end
	
	if nItemIndex == 0 then
		return 0
	end
	
	local nChestIndex = CreateNpc("R��ng ti�n", "R��ng", GetNpcWorldPos(TT_TARGET_Index))
	SetNpcScript(nChestIndex, SF_FILE)
	
	-- �õ���NPC���ԣ�������
	local tNpcAttr = {3, 5}
	for index, value in tNpcAttr do
		local nState = GetUnitCurStates(nChestIndex, value)
		AddUnitStates(nChestIndex, value, (0 - nState))
	end
	
	AddUnitStates(nChestIndex, 5, nItemIndex)
	
	return 1
end

function GT_Drop(name, count, nStage)
	local nZone = TC_GetTeamZone()
	local nStartRow = 0
	local nEndRow = 999999
	local data = 0
	local nLevelCell = MU_Div(TM_GetMinLevel()) + 5
	local nDropTable = {}				-- ��¼���п��ܵ���ĵ��ߣ������г�ȡһ����������ʵ�ʵ���ĵ��ߣ�
	local nDropTableCount = 0			-- ��¼���п��ܵ���ĵ�������

	local nRet = GT_GoodDrop(name, MU_Div(TM_GetMinLevel()) * 10)
	if nRet > 0 then
		return
	end

	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	for i=2, GT_ROWCOUNT + 1 do
		local stage = GT_GetData(i, 1)
		local data = GT_GetData(i, 2)
--		Msg2Player(i.." - "..data.." / "..name.."   "..nStage.." / "..stage.."   "..nStartRow)
		if (data == name) and (nStage == stage) and (nStartRow == 0) then
			nStartRow = i
			nEndRow = i
		end
		if ((data ~= name) or (nStage ~= stage)) and (nStartRow ~= 0) then
			nEndRow = i - 1
			break; 
		end
	end
 	if nStartRow == 0 then
		return
	end
	for i=nStartRow, nEndRow do
		local nRecordState = GetBit(SB_STAGE_RECORD[nZone], GT_GetData(i, 3))
		local nRecordFlag = GT_GetData(i, 4)
		local nRnd = random(1, 1000)
		local nRndEnd = tonumber(GT_GetData(i, nLevelCell))
		local nBingo = 0	
		if (nRecordState == nRecordFlag) and (nRnd <= nRndEnd) then		-- ����������DROP��+1
			nDropTableCount = nDropTableCount + 1
			nDropTable[nDropTableCount] = i
			nBingo = 1
		end	
	end
	if count > nDropTableCount then
		count = nDropTableCount
	end

	local aGearsLevelTable = {5, 7}
	local nGearsLevelTableLen = 2
	local aGearsSlotTable = {103, 100, 101, 102, -1}
	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10, 6, 4, 0, 7, 11}		-- ��������
	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21}
	local nNpcIndex;
	for i=1, count do
		local nRnd = random(i, nDropTableCount)
		nDropTable[i], nDropTable[nRnd] = nDropTable[nRnd], nDropTable[i]
		local nChestIndex = CreateNpc("R��ng ti�n", "R��ng tinh ch�", GetNpcWorldPos(TT_TARGET_Index))
		nNpcIndex = nChestIndex
--		local nChestIndex = CreateNpc("����Ǯ", "���µ�����", GetWorldPos())
		SetNpcDeathScript(nChestIndex, SF_FILE)
		MC_Add2Group(nChestIndex)
		-- ʹ�� NPC ���������ݼ�¼����������
		-- 1 ����ϸ���
		-- 5 ��������
		-- 6 ��������
		-- 8 ��bit1 - ���� / bit2 - ��ռ
		local nChestState = 0
		local nChestRow = nDropTable[i]
		local nSimData = GT_GetData(nChestRow, 7)
		local aSplitedData, nSplitedDataLen = MU_Split(nSimData, ",")
		local nChestType = aSplitedData[random(1, nSplitedDataLen)]
--		Msg2Player("nSimData: "..nSimData.." nSplitedDataLen: "..nSplitedDataLen.." nChestType: "..nChestType)
		local nGearsFaction = tonumber(nChestType)						-- �������װ����ʾ����
		local aGearsIndex = {0,0,0}							-- ��װ���ı��
		local nIsLocked = 0
		if random(1,100000) <= 10000 then
			nIsLocked = 1
		end			
		------
		local nGearsLevel = tonumber(GT_GetData(nChestRow, 5))		-- �������װ����ʾ�ȼ���
		if nGearsLevel == 0 then									-- ����� 0 ��ʾ���
			nGearsLevel = aGearsLevelTable[random(1, nGearsLevelTableLen)]
		end
		local nGearsSlot = tonumber(GT_GetData(nChestRow, 6))		-- ��ʾװ����װ��λ��
		if nGearsSlot == 0 then
			nGearsSlot = random(1, 5)
		end	
		if tonumber(aSplitedData[1]) == 0 then								-- �������
			nGearsFaction = aGearsFactionTable[random(1, 15)]
		end
		if (nGearsSlot >= 1) and (nGearsSlot <= 4) then				-- ��������
			aGearsIndex[2] = aGearsSlotTable[nGearsSlot]
		elseif (nGearsSlot == 5) then								-- ������
			aGearsIndex[2] = aWeaponsTable[nGearsFaction]
		end
		if nGearsFaction == 1 then									-- �������ֵ������������
			nGearsFaction = 2
		end
		aGearsIndex[3] = nGearsFaction*100 + nGearsLevel*10	
		AddUnitStates(nChestIndex, 5, aGearsIndex[1])
		AddUnitStates(nChestIndex, 6, aGearsIndex[2])
		AddUnitStates(nChestIndex, 1, (aGearsIndex[3]-1))
		AddUnitStates(nChestIndex, 8, nIsLocked)			-- ����
		WriteLog("#"..GetName().." "..GetWorldPos().."M� r��ng"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	end
end

function GT_GetGearPart(nIndex)
	--Msg2Player("GT_GetGearPart: "..nIndex)
	if nIndex == nil then
		nIndex = 103
	end
	local aTable = {}
	aTable[100] = 2
	aTable[101] = 3
	aTable[102] = 4
	aTable[103] = 1
	aTable[0] = 5
	aTable[1] = 5
	aTable[2] = 5
	aTable[3] = 5
	aTable[5] = 5
	aTable[8] = 5
	aTable[9] = 5
	aTable[10] = 5
	aTable[4] = 5
	aTable[6] = 5
	aTable[7] = 5
	aTable[11] = 5
	return GT_GEARSPART[aTable[nIndex]]
end

function GT_GetGearFaction(nIndex)
--	Msg2Player("GT_GetGearFaction: "..nIndex)
	local nIndex = SB_Div(nIndex, 100)
	local aTable = {}
	aTable[1] = 1
	aTable[2] = 2
	aTable[3] = 3
	aTable[4] = 4
	aTable[6] = 5
	aTable[8] = 6
	aTable[9] = 7
	aTable[11] = 8
	aTable[12] = 9
	aTable[14] = 10
	aTable[15] = 11
	aTable[17] = 12
	aTable[18] = 13
	aTable[20] = 14
	aTable[21] = 15
	return GT_GEARFACTION[aTable[nIndex]]
end

--============================================================================================== TASK CONTENTS ====
-- Task Contents
TC_ZONE_MAX	= 5						-- ��¼����������ͬ�ĳ����ῪN�飩
TB_ZONE_TASKTEMP = 10				-- ��ÿ�������ϵļ�¼�Լ����ڳ��ص� TaskTemp ������
TC_STAGE_Index = {0, 0, 0, 0, 0}	-- ��¼��ǰ�ؿ�����0 ��ʾ��û��ɽׯ
TC_STAGE_State = {0, 0, 0, 0, 0}	-- �ؿ�״̬��0~9 ��δ��ʼ / 10~19 �Ѿ���ʼ / 20~29 �Ѿ���� ������ϸ�ڵ�ֵ���ݲ�ͬ������ͣ�
TC_KILL_Total = {0, 0, 0, 0, 0}		-- ���йؿ��ܹ�ɱ������
TC_KILL_Stage = {0, 0, 0, 0, 0}		-- ��ǰ�ؿ��ܹ�ɱ������
TC_KILL_KeyGot = {0, 0, 0, 0, 0}	-- ��ǰ�ؿ��ܻ�õ�Կ������
TC_KILL_Player = {}					-- ���ÿ�ؿ�ɱ��������
TC_TASK_EventCount = {}				-- �����������ͬ�ؿ������в�ͬ�����������ݵļ���ֵ
TC_TASK_Conditions = {}				-- ���������������Ӧ����ļ���ֵ����ͬ�ؿ��в�ͬ�Ľ���
TC_TIMER_Count = {0, 0, 0, 0, 0}	-- �ܿؼ�ʱ��������ÿһ�μ�����ʾһ�����ڣ�14��
TC_TIMER_CountTotal = {0, 0, 0, 0, 0}	-- �ܿؼ�ʱ�����������йؿ�����ʱ��
TC_TIMER_StartDate = {0, 0, 0, 0, 0}	-- �ؿ���ʼʱ��
TC_TIMER_Limit = {128, 128, 128, 128, 128}	-- ��ʱ���������ޣ�һ���ؿ�������ʱ��
TC_TIMER_ALARM = {80, 80, 80, 80, 80, 80, 80, 40, 80}					-- ��ʱ����������������ڿ�ʼÿ10��������һ�ξ���
TC_TIMER_LIMIT_TABLE = {128, 128, 128, 128, 128, 128, 128, 64, 128}		-- ÿ�ؿ���ʱ������
TC_TIMER_LIMIT_TABLE_UI = {"30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "15:00", "30:00"}		-- ÿ�ؿ���ʱ�����Ƶ��û�������ʾʱ�䣨���ӣ�

------------------------------------------------------------------------------------------------ FUNCTION ----
-- һЩ�����ĳ�ʼ��
-- �����������Ѿ�����ʹ����~~�ڹ�����������
--function TC_Init(nZone, nStage)
--	if nZone == nil then
--		nZone = 1
--		TC_SetTeamZone(nZone)
--	else
--		TC_SetTeamZone(nZone)
--	end
--	if (nStage == nil) or (nStage == 1) then
--		nStage = 1
--		TC_KILL_Total[nZone] = 0	
--		TC_KILL_Player = {}	
--	end
	
--	TC_STAGE_Index[nZone] = nStage
--	TC_STAGE_State[nZone] = 0
--	TC_KILL_Stage[nZone] = 0
--	TC_TASK_EventCount[nZone] = {}
--	TC_TASK_Conditions[nZone] = {}
--	TC_TIMER_Count[nZone] = 0
--	TC_TIMER_Limit[nZone] = TC_TIMER_LIMIT_TABLE[nStage]
--end

-- ����������ڵĳ��غ�(����Ϊ��¼,����ʾ���ȷʵ���������)
function TC_SetTeamZone(nZone)
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TB_ZONE_TASKTEMP, nZone)
	end
	PlayerIndex = nOldIndex
end

-- ȡ��������ڳ��غŵļ�¼(����Ϊ��¼,����ʾ���ȷʵ���������)
function TC_GetTeamZone()
	return GetTaskTemp(TB_ZONE_TASKTEMP)
end

-- ˢ��һЩ��ҵ�ɱ����Ϣ,����ɱ�������ļ�¼,���ֻ�õļ�¼��(ֻ����ʱ��¼,ʵ�ʱ�����������ϻ��� TB_AddScore �� TB_StoreScore)
function TC_RefKilledNpc()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	TC_KILL_Total[nZone] = TC_KILL_Total[nZone] + 1
	TC_KILL_Stage[nZone] = TC_KILL_Stage[nZone] + 1
	if TC_KILL_Player[PlayerIndex] == nil then
		TC_KILL_Player[PlayerIndex] = {}
	end
	if TC_KILL_Player[PlayerIndex][nStage] == nil then
		TC_KILL_Player[PlayerIndex][nStage] = 1
	else
		TC_KILL_Player[PlayerIndex][nStage] = TC_KILL_Player[PlayerIndex][nStage] + 1
	end
	if TB_BONUS_MemberTotal[nZone] == nil then
		TB_BONUS_MemberTotal[nZone] = 0
	end
	TB_BONUS_MemberTotal[nZone] = TB_BONUS_MemberTotal[nZone] + GetUnitCurStates(TT_TARGET_Index, 6)
	if TB_BONUS_Total[nZone] == nil then
		TB_BONUS_Total[nZone] = 0
	end
	TB_BONUS_Total[nZone] = TB_BONUS_Total[nZone] + (GetUnitCurStates(TT_TARGET_Index, 6)/10)
--	Msg2Player("ȫ���ۻ����� +"..(GetUnitCurStates(TT_TARGET_Index, 6)/10).." ("..TB_BONUS_Total[nZone]..")")
	return TC_KILL_Player[PlayerIndex][nStage], TC_KILL_Stage[nZone], TC_KILL_Total[nZone], TB_BONUS_MemberTotal[nZone], TB_BONUS_Total[nZone]
end

-- �������ڵ�ǰ�ؿ������ĵ�ʱ���Ƿ���Ҫ��������,�Ѿ��жϳ����ؿ������ʱ�䲢���Խ����ؿ�
function TC_CheckTimer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	if (TC_TIMER_Count[nZone] >= TC_TIMER_ALARM[nStage]) and (mod(TC_TIMER_Count[nZone], 10) == 0) then
		MU_Msg2Team("C�nh b�o h�n ch� th�i gian qua �i:"..TC_TIMER_Count[nZone].."/"..TC_TIMER_LIMIT_TABLE[nStage])
	end
	if TC_TIMER_Count[nZone] >= TC_TIMER_LIMIT_TABLE[nStage] then
		local a,b,c=GetWorldPos()
		--if (a >= 1011 and a <= 1059) or (a >= 2011 and a <= 2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		--	ClearMapNpc(a)
		--end
		TM_LeaveMap()
		return 1
	end
	return 0
end

--============================================================================================== TEAM MEMBER =============
-- Team Member
TM_MEMBER_MAX = 8								-- ����Ķ�Ա����
TM_MEMBER_Index = {}							-- ��¼��ʼ��Ա
TM_MEMBER_MaxLevel = {30, 30, 30, 30, 30}		-- ��¼��Ա��ߵȼ�
------------------------------------------------------------------------------------------------ FUNCTION ----
function TM_Init()
	TM_GetMaxLevel()
end

-- ȡ�õ�ǰ�����е���ߵȼ�,���� nZone ��ʾ����,����ʡ��(�Ժ���û������˵��,nZone����ʾ���غ��Ҷ�����ȱʡ)
function TM_GetMaxLevel(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() > TM_MEMBER_MaxLevel[nZone] then
			TM_MEMBER_MaxLevel[nZone] = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_MaxLevel[nZone]
end

-- ȡ�õ�ǰ�����е���͵ȼ�
function TM_GetMinLevel()
	local nMinLevel = 99
	local nOldIndex = PlayerIndex
	local nTSize = GetTeamSize()
	if nTSize == 0 then
		return GetLevel()
	end
	for i=1, nTSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < nMinLevel then
			nMinLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return nMinLevel
end

-- ��¼�ս�ɽׯʱ��������ĳ�Ա
function TM_SaveOrgMember(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if TM_MEMBER_Index[nZone] == nil then
		TM_MEMBER_Index[nZone] = {}
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		TM_MEMBER_Index[nZone][i] = GetTeamMember(i)
		TM_MEMBER_Index[nZone][9] = i
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_Index[nZone][9]			-- ���س�ʼ��Ա����
end

-- ͨ����������Ż���������(��ǰ��ҵ�������ͨ��ֱ�ӷ���ȫ�ֱ��� PlayerIndex ���)
function TM_GetMemberName(nIndex)
	local nOldIndex = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldIndex
	return sName
end

-- ͨ����ҵ���������� ������ ��ҵ�������(ֻ�Ե�ǰ������Ч��)
function TM_GetMemberIndex(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetName() == nName then
			PlayerIndex = nOldIndex
			return GetTeamMember(i)
		end
	end
	PlayerIndex = nOldIndex
	return 0
end

-- �жϵ�ǰ����Ƿ��Ƕӳ�
function TM_IsCaptain()
	local nIsCaptain = 0								-- �Ƿ��Ƕӳ�
	local nCaptainIndex = GetTeamMember(0)
	if nCaptainIndex == 0 then
		WriteLog("[T�ng Ki�m]Can't find captain!!!"..GetName().." PlayerIndex="..PlayerIndex)
	end
	if nCaptainIndex == PlayerIndex then
		nIsCaptain = 1
	end
	return nIsCaptain
end

-- �жϴ��������Ƿ������,������÷��Ƚ�����,���� �Ի��¼�(��Ŀ���¼�) �� ��TRAP(��Ŀ���¼�) �¼����ǵ��õ� LUA �е� main ����, ���� TM_IsPlayer() Ϊ 1 ��ʾ�� �� TRAP �¼�,Ϊ 0 ��ʾ��һ��Ŀ��,��Ϊ �Ի��¼�
function TM_IsPlayer()
	local nIsPlayer = 0
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	if (TT_TARGET_ModID == "Nam ti�u chu�n") or (TT_TARGET_ModID == "Nam kh�i ng�") or (TT_TARGET_ModID == "N� g�i c�m") or (TT_TARGET_ModID == "Ki�u n�") then
		nIsPlayer = 1
	end
	return nIsPlayer
end

-- ���㲢���ض����е� ���� �� Ů�� ��Ա����
function TM_SexCount()
	local nFemale = 0	-- Ů������
	local nMale = 0		-- ��������
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetSex() == 1 then
			nMale = nMale + 1
		else
			nFemale = nFemale + 1
		end
	end
	PlayerIndex = nOldIndex
	return nMale, nFemale
end

-- ����� �뿪ɽׯ/�뿪��ǰ����nZone ���д���
-- nIndex ��ʾ��ĳ�ض���ҽ��д���,��� �˲���ȱʡ,��ʾ��ȫ�ӽ��в���
function TM_LeaveMap(nZone, nIndex)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	if not (((GetWorldPos() >= 901) and (GetWorldPos() <= 999)) or (GetWorldPos() == 350)) then
--		return
--	end
	if TC_STAGE_State[nZone] < 30 then
		if TM_IsCaptain() == 1 then
			local a,b,c=GetWorldPos()
			if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
				ClearMapNpc(a)
			end
			GM_Rules(1, 1)
			TC_KILL_Total[nZone] = 0
			TC_TIMER_CountTotal[nZone] = 0
			if TM_MEMBER_Index[nZone] == nil then
				TM_MEMBER_Index[nZone] = {}
			end
			if TM_MEMBER_Index[nZone][9] ~= nil then
				for i=1, TM_MEMBER_Index[nZone][9] do
					TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
				end
			else
				TM_MEMBER_Index[nZone] = {}
			end
			TM_MEMBER_Index[nZone] = {}
			
			WriteLog("#Tin t�c s� quan l�nh GS_STAGE_USED["..nZone.."] = "..GS_STAGE_USED[nZone].."; PlayerIndex = "..PlayerIndex);
			
			TC_STAGE_State[nZone] = 0
			TC_KILL_Stage[nZone] = 0
			TC_TASK_EventCount[nZone] = {}
			TC_TASK_Conditions[nZone] = {}
			TC_TIMER_Count[nZone] = 0
			TM_MEMBER_MaxLevel[nZone] = 30
			MC_SPWN_Count[nZone] = {}
			MC_SPWN_Limit[nZone] = 150
			TB_BONUS_MemberTotal[nZone] = 0
			TB_BONUS_Total[nZone] = 0
			GS_IsAllowTrade[nZone] = 0
--------------------------
			MC_ClearGroup(0, nZone)
			TT_RemoveTimer()
			TT_RemoveTriggers()
			SetDeathPunish(1)
			if GS_Team2NextStage(nZone, nStage, -1) > 0 then
				GS_STAGE_USED[nZone] = 0
			end
			TC_STAGE_Index[nZone] = 0
			TC_SetTeamZone(0)
			GS_StartFlag = 0
		else
			GM_Rules(1, 0)
			TT_RemoveTriggers(nIndex)
			SetDeathPunish(1)
			GS_Team2NextStage(nZone, nStage, PlayerIndex)
			LeaveTeam()
			SetTaskTemp(TB_ZONE_TASKTEMP, 0)
		end
	end
end

--============================================================================================== TASK TRIGGER ====
-- Task Trigger
TT_TRIGGER_KILLER = 1101										-- ��ʾ ɱ�ִ����� ������Լ�����������
TT_TRIGGER_TIMER = 1102											-- ��ʾ ʱ�䴥���� ������Լ�����������
TT_TRIGGER_RECT = 1103											-- ��ʾ ���򴥷��� ������Լ�����������
TT_TRIGGER_LOGOUT = 1104										-- ��ʾ �ǳ������� ������Լ�����������

if SERVER_INDEX ~= nil then
	TT_TRIGGER_SortID = 1100 + SERVER_INDEX							-- �õ��ڴ��������ñ��е�����
end

TT_TARGET_Index = 0												-- �¼����������Ŀ��NPC�������ţ�INTEGER
TT_TARGET_ModID = ""											-- �¼����������Ŀ��NPC��ģ��ID��STRING
TT_TARGET_Name = ""												-- �¼����������Ŀ��NPC����ʾ����STRING
TT_TARGET_INDEX = 11											-- �¼����������Ŀ��NPC���������õ��� TASKTEMP ���
TT_TARGET_MODID = 12											-- �¼����������Ŀ��NPC��ģ��ID�õ��� TASKTEMP ���
TT_TARGET_NAME = 13												-- �¼����������Ŀ��NPC����ʾ���õ��� TASKTEMP ���
------------------------------------------------------------------------------------------------ FUNCTION ----
function TT_Init(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
end

-- ���õ�ǰ�����ĳ�¼��������Ŀ��������(�������ֶ�Ŀ��Ĳ������Ǽ�ʱ��������,��� TT_GetTarget() ʹ��)
function TT_SetTarget(nIndex)
	SetTaskTemp(TT_TARGET_INDEX, nIndex)
end

-- ȡ�����һ���� TT_SetTarget ���������Ŀ��������
function TT_GetTarget()
	return GetTaskTemp(TT_TARGET_INDEX)
end

-- ������@��ʼʱ�䴥����, ����������ǹ��ڶӳ����ϵ�,��������Ϊ �����ؿ����� �е�����ʱ�����/���� ,������Ϊ��λ,һ������ 14 ��
function TT_StartTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TC_TIMER_Count[nZone] = 0
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nTimerIndex = CreateTrigger(1, TT_TRIGGER_SortID, TT_TRIGGER_TIMER)
	ContinueTimer(nTimerIndex)
	PlayerIndex = nOldIndex
	return nTimerIndex
end

-- ������@ɾ��ʱ�䴥����
function TT_RemoveTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	RemoveTrigger(GetTrigger(TT_TRIGGER_TIMER))
	PlayerIndex = nOldIndex
end

-- ������@��ʼͨ�ô�������, ���鴥�����ǹ������ж�Ա���ϵ�,ÿ���˵Ĵ�����˽��,����������������: ɱ��/����/��½
function TT_StartTriggers()
	local nZone = TC_GetTeamZone()
	local nTriggerIndex = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nTriggerIndex = CreateTrigger(0,TT_TRIGGER_SortID,TT_TRIGGER_KILLER)
		nTriggerIndex = CreateTrigger(2,TT_TRIGGER_SortID,TT_TRIGGER_RECT)
		nTriggerIndex = CreateTrigger(1,TT_TRIGGER_SortID,TT_TRIGGER_LOGOUT)
	end
	PlayerIndex = nOldIndex
end

-- ������@ɾ��ͨ�ô�������, ���鴥�����ǹ������ж�Ա���ϵ�,ÿ���˵Ĵ�����˽��,����������������: ɱ��/����/��½
function TT_RemoveTriggers(nIndex)
	local nOldIndex = PlayerIndex
	if nIndex == nil then
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
			RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
			RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
		end
	else
		PlayerIndex = nIndex
		RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
		RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
	end
	PlayerIndex = nOldIndex
end

-- �ֵ��ǲ���, ����һ�� Counter ~~����ۼ�����������¼ÿ�ؿ��Ѿ�������ʱ�����ڵ�,�������޺������
function TT_Stepper(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local STEP_MAX = 8									-- Ҫ��֤ 8 STEP ����ǲ����ȱ���Ϊ 1~8 �������ֵ� ���⹫����
	local STEP_LENGTH_MAX = 840							-- �ǲ���������
	if TC_TIMER_Count[nZone] == nil then
		WriteLog("**[T�ng Ki�m b�o l�i]TC_TIMER_Count[nZone]== nil, nZone == "..nZone)
	else
		if TC_TIMER_Count[nZone] < STEP_LENGTH_MAX then
			TC_TIMER_Count[nZone] = TC_TIMER_Count[nZone] + 1
			return TC_TIMER_Count[nZone]
		else
			TC_TIMER_Count[nZone] = 0
			return "Error: V��t m�c t�i �a, reset l�i s� b��c!"
		end
	end
end

-- �ֵ��ǲ��������,�����Ƿ���һ���Ƿ���������Ϣ,���ڿ�����Щ������ִ��һ�εĴ������
-- step : �������Ƿ��ܱ���ǰ��ʱ��������������
function TT_StepperChecker(step, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (type(step) == "number") and (step >= 1) and (step <= 8) then
		return mod(TC_TIMER_Count[nZone], step)
	else
		return "Error: Ki�m tra s� li�u kh�ng chu�n!"
	end
end

--============================================================================================== MONSTER CREATER ====
-- Monster Creater
MC_SPWN_Count = {}							-- ÿ��ˢ�µ��Ѿ�ˢ���Ĺ�������
MC_SPWN_Limit = {150,150,150,150,150}		-- ��ǰ��ͼ������ֵĹ�������
MC_SPWN_LIMIT_TABLE = {150, 150, 150, 150, 150, 150, 150, 150, 150}		-- ÿ�ؿ�����������������
MC_BOSS_POS = {
{"T�ng ngo�i qu�n", "T�ng qu�n ngo�i vi�n", 1, 1587, 3238},		-- 1 - Stage 1 boss
{"T�ng n�i qu�n", "T�ng qu�n n�i vi�n", 2, 1657, 3133},			-- 2 - Stage 2 boss
{"��i ti�u th�", "��i ti�u th�", 3, 1629, 3147},					-- 3 - Stage 3 boss
{"��i trang ch�", "��i trang ch�", 4, 1869, 2895},					-- 4 - Stage 4 boss
{"T�ng qu�n T�ng Ki�m", "Tr��ng l�o T�ng Ki�m C�c", 5, 1602, 3193},			-- 5 - Stage 5 boss
{"", "", 0, 0, 0},										-- 6 - Stage 6 boss
{"", "", 0, 0, 0},										-- 7 - Stage 7 boss
{"", "", 0, 0, 0},										-- 8 - Stage 8 boss
{"Ki�m H�n", "C�u Tuy�t Ki�m Ma", 9, 1567, 3245}}					-- 9 - Stage 9 boss

------------------------------------------------------------------------------------------------ FUNCTION ----
function MC_Init(nZone)
end

-- ��һ����λ��ӽ�һ�� Group ��(Group ��һ��������¼ NPC INDEX �Ķ���,�Ѷ��NPC INDEX ��ӽ����,���Զ�����в���)
function MC_Add2Group(nUnitIndex, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	return AddGroupUnit(nZone, nUnitIndex)
end

-- ��һ��NPC INDEX�� Group ��ɾ��,����ɾ��NPC��ʵ�屾��
-- nLifeTime ��ʾʵ��ɾ��ʵ���ʱ���ӳ�
function MC_Del4Group(nUnitIndex, nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetNpcLifeTime(nUnitIndex, nLifeTime)
	SetNpcDeathScript(nUnitIndex, "")
	return DelGroupUnit(nZone, nUnitIndex)
end

-- ��һ�� Group �е����� NPC INDEX ���,����ɾ������NPCʵ��
function MC_ClearGroup(nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetGroupLifeTime(nZone, nLifeTime)
	SetGroupDeathScript(nZone, "")
	return ClearGroup(nZone)
end

-- ���� cangjian_spawner.txt ����һ����λ
-- data : ���е�����һ��������
-- datatype : ����������ڵ��еı��
-- nlevel : ��ʾ���NPC�ĵȼ�,����ȼ���ȥ����λ������Ϊ�ַ�����ӵ�NPCģ��������
function MC_CreateUnit(data, datatype, nlevel, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nRow = ST_GetRow(data, datatype)
	local nMapID = GetWorldPos()			-- ��ͬ�ĳ���ȷ����ͬ�� ��ͼ ID
	if nlevel == nil then
		return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
		return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	end
end

-- ���� cangjian_spawner.txt ����һ��ָ���еĵ�λ
-- sNpctype : �������ȱ���ʾ�������ĵ�λ�� sNpctype ָ���� NPC ʱ�Żᴴ��
function MC_CreateUnitByRow(nRow, nlevel, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	local nMapID = ST_GetData(nRow, 3) + (nZone * 10) - 10			-- ��ͬ�ĳ���ȷ����ͬ�� ��ͼ ID
--                   ������        ������            �ؿ�
	local nMapID = SF_MAPBASE + (nZone * 10) + ST_GetData(nRow, 3)		-- ��ͬ�ĳ���ȷ����ͬ�� ��ͼ ID
	if nlevel == nil then
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))
		end
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
--		if ST_GetData(nRow, 7) == "����" then
--			sNpcTemp = ST_GetData(nRow, 6)
--		end
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
		end
	end
end

-- ���� cangjian_spawner.txt ����һ�� NPC ,��ЩNPC ���������ԵĴ���,ֻ����ÿ�ιؿ���ʼ����ʱ��Żᴴ��(ST_Init() ������ÿ���ؿ���Ҫ������һ��NPC)
-- stage : ��ʾ��Ҫ�����ĵ�stage�ص�����NPC
-- sNpctype : �������ȱ���ʾ�������ĵ�λ�� sNpctype ָ���� NPC ʱ�Żᴴ��
function MC_NoSpawnNPCs(stage, level, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_INIT[stage][1], ST_LMD_INIT[stage][2] do
		if i ~= 0 then
			MC_Add2Group(MC_CreateUnitByRow(i, level, sNpctype, nZone))
		end
	end
end

-- ���� cangjian_spawner.txt ����һ�� NPC ,��ЩNPC �������ԵĽ��д���(ST_Init() ������ÿ���ؿ���Ҫ������һ��NPC)
-- stage : ��ʾ��Ҫ�����ĵ�stage�ص�����NPC
-- sNpctype : �������ȱ���ʾ�������ĵ�λ�� sNpctype ָ���� NPC ʱ�Żᴴ��
-- nNoCheck : �������ֵΪ 1 ��ʾ���������ڼ��,������ʲô���ڶ��ش���(���ڼ���Ǽ��ĳ��NPC����Ҫ�������ڲű�����һ�ε�)
function MC_BeSpawnNPCs(stage, level, sNpctype, nZone, nNoCheck)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_SPWN[stage][1], ST_LMD_SPWN[stage][2] do
		if i ~= 0 then
			local nSpawnPeriod = ST_GetData(i, 9)
			local nSpawnerCountMax = ST_GetData(i, 12)
			if (TT_StepperChecker(nSpawnPeriod) == 0) or (nNoCheck == 1) then
				if MC_SPWN_Count[nZone][i] == nil then
					MC_SPWN_Count[nZone][i] = 0
				end
				if CountGroupUnit(nZone) < MC_SPWN_Limit[nZone] then
					if MC_SPWN_Count[nZone][i] < nSpawnerCountMax then
						local LastedCreatedUnit = MC_CreateUnitByRow(i, level, sNpctype, nZone)
						MC_Add2Group(LastedCreatedUnit)
						MC_SPWN_Count[nZone][i] = MC_SPWN_Count[nZone][i] + 1
						AddUnitStates(LastedCreatedUnit, 8, 1001)		-- ��Ұ��Χ����Ϊ���� 1000
					else
						return "Error: �i�m Refresh"..i.."S� l��ng v��t qu� t�i �a:"..MC_SPWN_Count[nZone][i].."/"..nSpawnerCountMax
					end
				else
					return "Error: S� qu�i v�t ��t ��n m�c t�i �a:"..MC_SPWN_Limit[nZone]
				end
			else
				return "Error: Ch�a t�i chu k� kh�i ph�c"..TT_StepperChecker(nSpawnPeriod).."/"..nSpawnPeriod
			end
		end
	end
end

-- ����ĳ�ص�BOSS(ͨ�����������������,���ú�ᴴ��������ڹؿ���BOSS)
-- nIndex : ͨ���ǹؿ���
-- nCheck : �Ƿ���ȼ�
function MC_CreateBoss(nIndex, nCheck, nStage, nZone)				-- ����ÿ�ؿ���ˢ�µ����
	if nIndex == nil then
		nIndex = TC_STAGE_Index[nZone]
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nCheck == nil then
		nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	else
		nlevel = ""
	end
	local nMapID = GetWorldPos()				-- ��ȡ��ǰ��ͼID
	local nBossIndex = CreateNpc(MC_BOSS_POS[nIndex][1]..nlevel, MC_BOSS_POS[nIndex][2], nMapID, MC_BOSS_POS[nIndex][4], MC_BOSS_POS[nIndex][5])
	MC_Add2Group(nBossIndex)
	return nBossIndex
end

--============================================================================================== THE BONUS ====
-- The Bonus
TB_BONUS_TABLE =	{--s1	 s2		s3		s4		s5		s6		s7		s8		s9			-- ��ͬ�ȼ�ÿ�ؿ��Ķӳ�������
    				{1500,	3000,	4500,	6000,	7500,	0,		0,		9000,	12000   },	-- level 30
    				{3000,	6000,	9000,	12000,	15000,	0,		0,		18000,	21000   },	-- level 40
    				{25000,	32500,	42250,	54925,	71402,	0,		0,		107100,	160000   },	-- level 50
    				{50000,65000,	85000,	108000,	150000,	0,		0,		220000,	320000   },	-- level 60
    				{100000,130000,	170000,	220000,	320000, 0,		0,		500000,	700000  },	-- level 70
    				{200000,260000,	340000,	440000, 600000, 0,		0,		1000000,	1500000  },	-- level 80
    				{300000,390000,	510000, 660000, 900000, 0,		0,		1500000,	2250000  }}	-- level 90
TB_BONUS_CHANCE	= 14				-- ��¼�ӳ��콱�������õ��� TaskTemp ������
TB_BONUS_LASTEDGOT = 15				-- ��¼�ӳ��ϴ��콱�ؿ������õ��� TaskTemp ������
TB_BONUS_SCORE = 1801				-- Task ������ �ۼƻ��֣���ҪӰ�����أ�ɱ������������ʱ�䡢�ؿ���
TB_BONUS_TIME = 1802				-- Task ������ ����ʱ�䣨��ҪӰ�����أ�����ʱ�䣩
TB_BONUS_RELATION = 1803			-- Task ������ �Ѻó̶ȣ���ҪӰ�����أ�ɱ���������ؿ�����������
TB_BONUS_PLAYED = 1804				-- Task ������ �����������ҪӰ�����أ����������
TB_BONUS_FINISHED = 1805			-- Task ������ ͨ�ش�������ҪӰ�����أ���ȫ��ɴ�����
TB_BONUS_STAGE = 1806				-- Task ������ ������������ҪӰ�����أ��ܹ���ɵĵ����ؿ�������
TB_BONUS_KILLED = 1807				-- Task ������ ɱ����������ҪӰ�����أ�ɱ��������
TB_BONUS_BECAPTAIN = 1808			-- Task ������ �ӳ���������ҪӰ�����أ���Ϊ�ӳ��Ĵ�����
TB_BONUS_CAPTAINLEVEL = 1822		-- Task ������ ͨ�صȼ������ʱ��ͨ��ʱ�Ķӳ��ȼ���
TB_BONUS_CAPTAINTIME = 1823			-- Task ������ ͨ��ʱ��
TB_BONUS_MemberTotal = {0, 0, 0, 0, 0}		-- ��Ա������ֵ
TB_BONUS_Total = {0, 0, 0, 0, 0}			-- ȫ�ؿ�������ֵ
------------------------------------------------------------------------------------------------ FUNCTION ----
-- ��ʼ��
-- ͨ���ڸտ�ʼ��ʱ�����һ��,�����Ǳ�����ʼ���������öӳ����콱�Ĵ���
function TB_Init(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	if nStage == 1 then
		SetTaskTemp(TB_BONUS_CHANCE, 2)
	end
	SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
	PlayerIndex = nOldIndex
end

-- ���öӳ��콱����
-- ÿ���ؿ���ɺ�ӳ���������ȡһ�ν���,�������йؿ�ֻ��N�λ���,��� N �����ô˺�������
function TB_SetBonusChance(nChance, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_CHANCE, nChance)
	PlayerIndex = nOldIndex
end

-- ȡ�öӳ���ʣ����콱����
function TB_GetBonusChance(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	PlayerIndex = nOldIndex
	return nChance
end

-- ���öӳ����һ���ý�Ʒ�Ĺؿ���
function TB_SetLastedGot(nStage, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_LASTEDGOT, nStage)
	PlayerIndex = nOldIndex
end

-- ȡ�öӳ����һ���ý�Ʒ�Ĺؿ���
function TB_GetLastedGot(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local  nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	PlayerIndex = nOldIndex
	return  nStage
end

-- �ӳ��콱����
-- ����Ŀǰ���� ��Ǯ/����
function TB_GetCaptainBonus(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	local nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	if nChance > 0 then
		if TC_STAGE_Index[nZone] > nStage then
			SetTaskTemp(TB_BONUS_CHANCE, (nChance - 1))
			SetTaskTemp(TB_BONUS_LASTEDGOT, TC_STAGE_Index[nZone])
			local nETRow = MU_Div(GetLevel()) - 2					-- ���ݶӳ��ȼ���ȡ TB_BONUS_TABLE ���е��в���
			local nTempBonus = 0
			for i=(nStage + 1), TC_STAGE_Index[nZone] do
				nTempBonus = nTempBonus + TB_BONUS_TABLE[nETRow][i]
			end
			
			local nTeamSize = GetTeamSize()
			local nCaptainExp = floor(nTempBonus / 3)
			local nMemberExp = 0
			if nTeamSize > 1 then
				nMemberExp = floor(nTempBonus / nTeamSize / 3 * 2)
			end
			-- �ӳ���þ����1/3
			ModifyExp(nCaptainExp)
			for i=1, GetTeamSize() do
				--������Ա���ʣ�µ�2/3
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 and PlayerIndex ~= GetTeamMember(0) then
					ModifyExp(nMemberExp)
				end
			end
			PlayerIndex = nOldIndex
			MU_Msg2Team(GetName().."Nh�n ph�n th��ng ��i tr��ng: �i�m kinh nghi�m ["..nCaptainExp.."], ��i vi�n nh�n ���c �i�m kinh nghi�m["..nMemberExp.."]")
		else
			PlayerIndex = nOldIndex
			Msg2Player("�i n�y �� v��t qua!")
		end
	else
		PlayerIndex = nOldIndex
		Msg2Player("�� d�ng h�t c� h�i!")
	end
	PlayerIndex = nOldIndex
	return  nStage
end

-- ȫ�����һ�ؿ���Ļ��ַ��䴦��
-- nBonus : ȫ�Ӵ��������
--function TB_GetMemberBonus(nBonus, nZone)
--	if nZone == nil then
--		nZone = TC_GetTeamZone()
--	end
--	local nStage = TC_STAGE_Index[nZone]
--	if nBonus == nil then
--		nBonus = TB_BONUS_Total[nZone]
--	end
--	local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
--	nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
--	local nOldIndex = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
--		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- ��������
--	end
--	PlayerIndex = nOldIndex
--	return nSigle_Bonus
--end

-- ����ÿ�ض��е����Ч����С����
function TB_OpenCommonChest(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nStage = TC_STAGE_Index[nZone]
	local nLevel = MU_Div(TM_GetMinLevel())
	local nETRow = nLevel - 2
	local nChoice = random(1, 25)
	if nChoice == 1 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T�ng"..nCash.." ng�n l��ng")
	elseif nChoice == 2 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		ModifyExp(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T�ng"..nCash.." kinh nghi�m")
	elseif nChoice == 3 then
		CastState("state_lost_life_per18",(GetLevel()^0.75),270,1)		-- 15 �룬ÿ����۳�һ����HP
		Msg2Player("15 gi�y, m�i n�a gi�y kh�u tr� sinh l�c nh�t ��nh")
	elseif nChoice == 4 then
		CastState("state_lost_mana_per18",(GetLevel()^0.85),270,1)		-- 15 �룬ÿ����۳�һ����MP
		Msg2Player("15 gi�y, m�i n�a gi�y kh�u tr� n�i l�c nh�t ��nh")
	elseif nChoice == 5 then
		CastState("state_perfect_dodge_rate",50,540,1)					-- 30 �룬50%������
		Msg2Player("30 gi�y, 50% t� l� n� tr�nh")
	elseif nChoice == 6 then
		CastState("state_life_max_percent_add",25,1080,1)					-- 60 �룬HP����25%
		Msg2Player("60 gi�y, HP t�ng 25%")
	elseif nChoice == 7 then
		CastState("state_neili_max_percent_add",35,1080,1)				-- 60 �룬MP����35%
		Msg2Player("60 gi�y, MP t�ng 35%")
	elseif nChoice == 8 then
		CastState("state_attack_rate_percent_add",50,1080,1)				-- 60 �룬��������100
		Msg2Player("60 gi�y, ch�nh x�c t�ng 50%")
	elseif nChoice == 9 then
		CastState("state_critical_hit_rate",25,1080,1)					-- 60 �룬��������25
		Msg2Player("60 gi�y, ch�nh x�c t�ng 25")
	elseif nChoice == 10 then
		CastState("state_attack_speed_add",25,1080,1)						-- 60 �룬��������25%
		Msg2Player("60 gi�y, t�c �� ��nh t�ng 25%")
	elseif nChoice == 11 then
		CastState("state_attack_speed_dec",30,1080,1)						-- 60 �룬���ٽ���30%
		Msg2Player("60 gi�y, t�c �� ��nh gi�m 30%")
	elseif nChoice == 12 then
		CastState("state_move_speed_percent_add",50,1080,1)				-- 60 �룬�ƶ��ٶ����� 50%
		Msg2Player("60 gi�y, t�c �� di chuy�n t�ng 50%")
	elseif nChoice == 13 then
		CastState("state_slow",50,1080,1)									-- 60 �룬�ƶ��ٶȽ��� 50%
		Msg2Player("60 gi�y, t�c �� di chuy�n gi�m 50%")
	elseif nChoice == 14 then
--      �˹���δ��Ч����ʱ�滻����������
--		CastState("state_maximumattack",100,180,1)						-- 10 �룬�⹦��ʱ�ﵽ���ֵ
--		Msg2Player("10 �룬�⹦��ʱ�ﵽ���ֵ")
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T�ng"..nCash.." ng�n l��ng")
	elseif nChoice == 15 then
		CastState("state_confusion",100,270,1)							-- 15 �룬��ʱ����
		Msg2Player("15 gi�y, h�n lo�n t�m th�i")
	elseif nChoice == 16 then
		CastState("state_paralysis",100,270,1)							-- 15 �룬��ʱ���
		Msg2Player("15 gi�y, t� li�t t�m th�i")
	elseif nChoice == 17 then
		CastState("state_sleep",100,360,1)								-- 20 �룬��ʱ˯��
		Msg2Player("20 gi�y, h�n m� t�m th�i")
	elseif nChoice == 18 then
		CastState("state_vertigo",100,180,1)								-- 15 �룬��ʱѣ��
		Msg2Player("15 gi�y, cho�ng t�m th�i")
	elseif nChoice == 19 then
		CastState("state_burst_enhance_rate",75,1080,1)					-- 60 �룬�ͷ��ٶ����� 75%
		Msg2Player("60 gi�y, t�c �� ph�ng t�ng 75%")
	elseif nChoice == 20 then
		CastState("state_burst_enhance_rate",-25,1080,1)					-- 60 �룬�ͷ��ٶȽ��� 25%
		Msg2Player("60 gi�y, t�c �� ph�ng gi�m 75%")
	elseif nChoice == 21 then
		CastState("state_p_attack_percent_add",25,1080,1)					-- 60 �룬�⹦�ܹ����������ӳ� 25%
		Msg2Player("60 gi�y, t� l� ��nh ngo�i c�ng t�ng 25%")
	elseif nChoice == 22 then
		CastState("state_p_attack_percent_dec",25,1080,1)					-- 60 �룬�⹦�ܹ������������� 25%
		Msg2Player("60 gi�y, t� l� ��nh ngo�i c�ng gi�m 25%")
	elseif nChoice == 23 then
		CastState("state_m_attack_percent_add",25,1080,1)					-- 60 �룬�ڹ��ܹ����������ӳ� 25%
		Msg2Player("60 gi�y, t� l� ��nh n�i c�ng t�ng 25%")
	elseif nChoice == 24 then
		CastState("state_m_attack_percent_dec",25,1080,1)					-- 60 �룬�ڹ��ܹ������������� 25%
		Msg2Player("60 gi�y, t� l� ��nh n�i c�ng gi�m 25%")
	elseif nChoice == 25 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		DoubleExpCount(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("T�ng"..nCash.." �i�m kinh nghi�m nh�n ��i")
	end
end

-- ������ҵĹؿ��Ƿ���ĳ��Ŀ��ֵ (�Ƿ���Ϣͨ��ʹ�� AddItem(2,0,212,1) ����õĵ������鿴)
function TB_AddScore(nType, nValue, nIndex)
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nIndex ~= nil then
			PlayerIndex = nIndex
		end
--- ���ּ�¼
		if (nType == 1) or (nType == "�i�m t�ch l�y") then
			SetTask(TB_BONUS_SCORE, GetTask(TB_BONUS_SCORE)+nValue)
--- ʱ���¼
		elseif (nType == 2) or (nType == " th�i gian ") then
			SetTask(TB_BONUS_TIME, GetTask(TB_BONUS_TIME)+nValue)
--- �Ѻü�¼
		elseif (nType == 3) or (nType == "H�o h�u") then
			SetTask(TB_BONUS_RELATION, GetTask(TB_BONUS_RELATION)+nValue)
--- �������
		elseif (nType == 4) or (nType == "Tham d�") then
			SetTask(TB_BONUS_PLAYED, GetTask(TB_BONUS_PLAYED)+nValue)
--- ͨ�ش���
		elseif (nType == 5) or (nType == "Qua �i") then
			SetTask(TB_BONUS_FINISHED, GetTask(TB_BONUS_FINISHED)+nValue)
--- ���ش���
		elseif (nType == 6) or (nType == "V��t �i") then
			SetTask(TB_BONUS_STAGE, GetTask(TB_BONUS_STAGE)+nValue)
--- ɱ������
		elseif (nType == 7) or (nType == "Gi�t qu�i") then
			SetTask(TB_BONUS_KILLED, GetTask(TB_BONUS_KILLED)+nValue)
--- �ӳ�����
		elseif (nType == 8) or (nType == "��i tr��ng") then
			SetTask(TB_BONUS_BECAPTAIN, GetTask(TB_BONUS_BECAPTAIN)+nValue)
--- �������
		end
		if nIndex ~= nil then
			PlayerIndex = nOldIndex
			return
		end
	end
	PlayerIndex = nOldIndex
end

-- ����ÿ����ҵļǷ���Ϣ
function TB_StoreScore()									-- ȫ�ӻ�ùؿ�����
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRanInt = random(0,14)
	local nOldIndex = PlayerIndex
	local nCaptain = {"", "��i tr��ng"}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--- ���ּ�¼
		local nBonus = TB_BONUS_Total[nZone]
		local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1.2 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
		nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- ��������
--- ʱ���¼
		local nSigle_Time = GetTask(TB_BONUS_TIME) + (TC_TIMER_Count[nZone]) * 14 - 7 + nRanInt
		SetTask(TB_BONUS_TIME, nSigle_Time)
--- �������
		if nStage == 1 then
			local nSigle_Played = GetTask(TB_BONUS_PLAYED) + 1
			SetTask(TB_BONUS_PLAYED, nSigle_Played)
		end
--- ͨ�ش���
		if nStage == 2 then
			local nSigle_Finished = GetTask(TB_BONUS_FINISHED) + 1
			SetTask(TB_BONUS_FINISHED, nSigle_Finished)
		end
--- ���ش���
		if (nStage >= 1) and (nStage <= 9) then
			local nSigle_Stage = GetTask(TB_BONUS_STAGE) + 1
			SetTask(TB_BONUS_STAGE, nSigle_Stage)
		end
--- ɱ������
		if TC_KILL_Player[PlayerIndex] == nil then
			TC_KILL_Player[PlayerIndex] = {}
		end
		if TC_KILL_Player[PlayerIndex][nStage] == nil then
			TC_KILL_Player[PlayerIndex][nStage] = 0
		end
		local nSigle_Killed = GetTask(TB_BONUS_KILLED) + TC_KILL_Player[PlayerIndex][nStage]
		SetTask(TB_BONUS_KILLED, nSigle_Killed)
--- �ӳ�����
		if (nStage == 1) and (TM_IsCaptain() == 1) then
			local nSigle_Becaptain = GetTask(TB_BONUS_BECAPTAIN) + 1
			SetTask(TB_BONUS_BECAPTAIN, nSigle_Becaptain)
		end
--- �������
	end
	PlayerIndex = nOldIndex
end

--============================================================================================== GAME STAGES ====
-- Game Stages
GS_STAGE_START = {					-- �ؽ�ʹ�߿�ʼ�Ի�������
	MU_GetColoredText("T�ng Ki�m s�n trang. S�n M�n", "gold").."\n ��n T�ng Ki�m s�n trang ��u l� nh�ng anh t�i k� n� trong giang h�, c� g� th�t l� xin l��ng th�. \n Trang ch� mu�n th� t�i c�c v�. \n ��nh b�i 25"..MU_GetColoredText("Gia �inh", "green").."\n. ��nh b�i"..MU_GetColoredText("T�ng qu�n ngo�i vi�n", "green"),
	MU_GetColoredText("��i Vi�n. T�ng Ki�m s�n trang", "gold").."\n ��i vi�n do T�ng qu�n n�i vi�n ph� tr�ch, c� g� c�n xin ch� v� c� t� nhi�n. \n. "..MU_GetColoredText("????", "green").."\n. ��nh b�i"..MU_GetColoredText("T�ng qu�n n�i vi�n", "green"),
	MU_GetColoredText("H�u Hoa Vi�n. T�ng Ki�m s�n trang", "gold").."\n H�u Hoa vi�n kh�ng cho ph�p ng��i ngo�i ra v�o. C�c v� ��ng ch�c gi�n ��i Ti�u Th�. \n ��i ti�u th� xinh ��p nh�ng do t� nh� �� theo cha h�c v� n�n t�nh kh� h�i ng� ng��c. \n. ��nh b�i 8"..MU_GetColoredText("L�o b�c", "green").."\n. ��nh b�i"..MU_GetColoredText("��i ti�u th�", "green"),
	MU_GetColoredText("Li�n Ho�n S�o. T�ng Ki�m s�n trang", "gold").."\n Trong C�u Cung ��t 9 ��nh l� h��ng c� ch�m tr� Tam s�c k� th�ch, tr�i qua nhi�u ��i ���c ng�ng k�t b�i tia l�a v� kh�i ��c ki�m � s�n trang. ��ng nh�n v� ngo�i m� xem th��ng! Ch� c�n c� ng��i ngang nhi�n ��t nh�p v�o, Tam s�c k� th�ch s� ph�t huy ma l�c. \n . L�m b�"..MU_GetColoredText("L� h��ng", "green").."\n. ��nh b�i"..MU_GetColoredText("???", "green"),
	MU_GetColoredText("T�ng Ki�m C�c. T�ng Ki�m s�n trang", "gold").."\n N�i ��y �� t�ng gi� v� s� �ao ki�m c� gi� tr� li�n th�nh. \n ��c bi�t l� c�c lo�i v� kh� thu�c h� ng� h�nh. \n R�t v� kh� ra ��nh b�i"..MU_GetColoredText("B�o v� ng� h�nh", "green").."\n V� huynh �� n�o c� th� th� s�c \n ��nh b�i"..MU_GetColoredText("Tr��ng l�o T�ng Ki�m C�c", "green"),
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Nghe n�i ch�n n�y v�n l� n�i tr� ng� c�a m�t v� ti�n nh�n, t�ng c�ng 16 ph��ng v�, ��u c� Kh�c �n ph�, d� v�o kh� ra. \n N�u c�c v� c� th� ra ���c, l�o phu s� d�n ���ng ��n Ki�m Tr�ng. \n �i t�m v�"..MU_GetColoredText("S� gi� T�ng Ki�m", "green").." ��i tho�i .",
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Nghe n�i ch�n n�y v�n l� n�i tr� ng� c�a m�t v� ti�n nh�n, t�ng c�ng 16 ph��ng v�, ��u c� Kh�c �n ph�, d� v�o kh� ra. \n N�u c�c v� c� th� ra ���c, l�o phu s� d�n ���ng ��n Ki�m Tr�ng. \n �i t�m v�"..MU_GetColoredText("S� gi� T�ng Ki�m", "green").." ��i tho�i .",
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Nghe n�i ch�n n�y v�n l� n�i tr� ng� c�a m�t v� ti�n nh�n, t�ng c�ng 16 ph��ng v�, ��u c� Kh�c �n ph�, d� v�o kh� ra. \n N�u c�c v� c� th� ra ���c, l�o phu s� d�n ���ng ��n Ki�m Tr�ng. \n �i t�m v�"..MU_GetColoredText("S� gi� T�ng Ki�m", "green").." ��i tho�i .",
	MU_GetColoredText("T�ng Ki�m s�n trang. Ki�m Ch�ng", "gold").."\n Ki�m Ch�ng ���c xem l� v�ng c�m m�t c�a T�ng Ki�m S�n Trang, b�i n�i ��y ���c c�t nhi�u thanh ki�m qu�. \n . Th�o 5 c�y"..MU_GetColoredText("Ng� H�nh ki�m", "green").."\n. ��nh b�i"..MU_GetColoredText("C�u Tuy�t Ki�m Ma", "green")}
GS_STAGE_END = {					-- �ؽ�ʹ�߽����Ի�������
	MU_GetColoredText("T�ng Ki�m s�n trang. S�n M�n", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch ��u ti�n, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("��i Vi�n. T�ng Ki�m s�n trang", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 2, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("H�u Hoa Vi�n. T�ng Ki�m s�n trang", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 3, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("Li�n Ho�n S�o. T�ng Ki�m s�n trang", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 4, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("T�ng Ki�m C�c. T�ng Ki�m s�n trang", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 5, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 6, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 7, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("T�ng Ki�m s�n trang. T� Tr�c L�m", "gold").."\n Ch�c m�ng c�c v� �� v��t qua th� th�ch th� 8, xin chu�n b� cho th� th�ch ti�p theo!",
	MU_GetColoredText("T�ng Ki�m s�n trang. Ki�m Ch�ng", "gold").."\n Ch�c m�ng c�c anh h�ng v��t �i th�nh c�ng! X�a nay, nhi�u anh h�ng h�o h�n c�ng kh� l�ng qua n�i. C�c v� xu�t s�c v��t �i, l�p n�n ��i nghi�p, danh ch�n giang h�! L�o phu h�t l�ng k�nh ph�c!!!"}
GS_FORSELECT = {					-- ��ؽ�ʹ�߶Ի���ѡ��
"b�t ��u th� th�ch/GS_StartStage",
"v�o �i k� ti�p./GS_NextStage",
"nh�n ph�n th��ng ��i tr��ng.",
"�i�u ch�nh mua b�n. (C�n 1 anh h�ng thi�p cho c� ��i c�ng mua b�n)/GS_Trade",
"�i�u ki�n mua b�n./GS_Trade",
"ngh� ng�i m�t l�t./GS_ExitSay",
"m� r��ng ch�a ��. ( c�n 1 Anh H�ng thi�p)/GS_OpenBox"}
GS_ERRORMSG = {
"Ch�a �� Anh H�ng thi�p!",
""}

GS_RECORD_DATE = 1820				-- Task ������ ÿ���ܽ���ؽ���ʱ���¼ 
GS_RECORD_CHANCE = 1821				-- Task ������ ÿ���ܽ���ؽ��Ĵ�����¼
GS_STAGE_USED = {0,0,0,0,0}			-- ��¼ĳ��ؿ��Ƿ��Ѿ���ʹ����
GS_USEDNOTE_IMG = {"<color=green>0<color>", "<color=red>X<color>"}
GS_USEDNOTE_TXT = {" (ch�a s� d�ng, nh�p ch�n v�o �i)", " (�ang s� d�ng, nh�p ch�n ki�m tra tr�ng th�i)"}
GS_ENTERTALK = "V� anh h�ng n�y mu�n v�o tr�n ��a n�o? \n".."[Tr�n ��a] Tr�n ��a 1 Tr�n ��a 2 Tr�n ��a 3 Tr�n ��a 4 Tr�n ��a 5 \n".."[Tr�ng th�i]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1]..""
GS_MESSENGER_MID = {"V��ng An Th�ch", "S� gi� T�ng Ki�m"}
GS_MESSENGER_STARTPOS = {			-- �ؽ�ʹ����ÿ�ؿ�ʼ��ʱ����ֵ�λ��
{1529, 3476}, {1613, 3182}, {1605, 3170}, {1697, 3067}, {1698, 3441}, {1,1}, {1,1}, {1477, 3170}, {1567, 3236}}
GS_MESSENGER_ENDPOS = {				-- �ؽ�ʹ����ÿ�ؽ�����ʱ����ֵ�λ��
{1597, 3216}, {1659, 3128}, {1667, 3104}, {1860, 2899}, {1592, 3180}, {1,1}, {1,1}, {9999, 9999}, {1567, 3236}}
GS_PLAYER_STARTPOS = {				-- �����ÿ�ؿ�ʼ��ʱ����ֵ�λ��
{1523, 3481}, {1609, 3188}, {1600, 3177}, {1690, 3073}, {1698, 3451}, {1,1}, {1,1}, {1487, 3169}, {1567, 3246}}

GS_IsAllowTrade = {0, 0, 0, 0, 0}			-- �Ƿ���������ߵı��
GS_HERO_TOKEN = {2, 0, 31}					-- Ӣ����
GS_SALE_INDEX = {1,1,1,1,1,1,1,1,1}			-- ÿ�ؿ����̵���
GS_StartFlag = 0
------------------------------------------------------------------------------------------------ FUNCTION ----
function GS_Init(nZone, nStage)
end

function GS_CheckRoute()
	local RouteTable = {};
	local nCount = 1;
	local nRoute = 0;
	local flagInTable = 0;
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute();
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1;
				break
			end;
		end;
		if flagInTable == 1 then
			flagInTable = 0;
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1;
		end
	end;
	PlayerIndex = nOldIndex
	return nCount - 1
end;
		

-- �ڽ���ɽׯǰ�ж����ж�Ա�Ƿ��� ��������
function GS_AreaCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == SF_TOWNID then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize and GS_SleepCheck() == 1 then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function GS_DateCheck()
	local nTeamSize = 0
	local nDateDay = tonumber(date("%m%d"))
	local nChance = 5	--�����������
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--		Msg2Player(GetTask(GS_RECORD_DATE).." / "..nDateDay)
--		Msg2Player(GetTask(GS_RECORD_CHANCE).." / "..nChance)
		if (GetTask(GS_RECORD_DATE) == nDateDay) then
			if (GetTask(GS_RECORD_CHANCE) < nChance) then
				nTeamSize = nTeamSize + 1
			end
		else
			SetTask(GS_RECORD_DATE, nDateDay)
			SetTask(GS_RECORD_CHANCE, 0)
			if (GetTask(GS_RECORD_DATE) == nDateDay) then
				if (GetTask(GS_RECORD_CHANCE) < nChance) then
					nTeamSize = nTeamSize + 1
				end
			end
		end
		if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= nChance) then
			MU_Msg2Team(GetName().."Kh�ng th� v�o T�ng Ki�m s�n trang (H�m nay �� v�o 5 l�n r�i ). ["..GetTask(GS_RECORD_CHANCE).."/5]")
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

function CalcYingXiongTie(nShowMsg)
	local nNeedCount = 0
	local nDateDay = tonumber(date("%m%d"))
	local nOldIndex = PlayerIndex
	local MaxCount = 7
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then
		MaxCount = 5
	end	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if (GetTask(GS_RECORD_DATE) == nDateDay) then
			if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
				nNeedCount = nNeedCount + 1
			end
		else
			SetTask(GS_RECORD_DATE, nDateDay)
			SetTask(GS_RECORD_CHANCE, 0)
			if (GetTask(GS_RECORD_DATE) == nDateDay) then
				if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
					nNeedCount = nNeedCount + 1
				end
			end
		end
		if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
			if nShowMsg == 1 then
				MU_Msg2Team(GetName().."H�m nay �� v�o S�n Trang ["..GetTask(GS_RECORD_CHANCE).."] l�n")
			end
		end
	end
	PlayerIndex = nOldIndex
	return nNeedCount
end

function GS_SleepCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			MU_Msg2Team(GetName().."Kh�ng th� v�o T�ng Ki�m s�n trang (�ang ngh� ng�i).")
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

-- �������ж�����Ƿ��������ɽׯ������
function GS_EnterCheck()
	local GS_TeamLeaderTxt = ""
	local GS_TeamSizeTxt = ""
	local GS_TeamLevelTxt = ""
	local GS_TeamItemTxt = ""
	local GS_TeamDateTxt = ""
	local nCheckPoint = {0, 0, 0, 0, 0, 0, 0}
-------------------------------------
	if TM_IsCaptain() == 1 then
		nCheckPoint[1] = 1
		GS_TeamLeaderTxt = "<color=green>��i tr��ng<color>"
	else
		GS_TeamLeaderTxt = "<color=red>��i tr��ng<color>"
	end
-------------------------------------
	local nTeamSize = GetTeamSize()
	if ((nTeamSize >= 5) and (GS_AreaCheck() == 1)) and (GS_CheckRoute() >= 5) then
		nCheckPoint[2] = 1
		GS_TeamSizeTxt = "<color=green>5 ng��i tr� l�n (��i vi�n �"..SF_TOWNNAME..")<color> "
	else
		GS_TeamSizeTxt = "<color=red>T�i thi�u c� 5 h� ph�i kh�c nhau c�ng � ("..SF_TOWNNAME..")<color>"
	end
-------------------------------------
	local nLowestLevel = 50
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() <= nLowestLevel then
			nLowestLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	if (nLowestLevel >= 50) and (nTeamSize > 0) then
		nCheckPoint[3] = 1
		GS_TeamLevelTxt = "<color=green>��ng c�p l�n h�n ho�c b�ng c�p 50<color>"
	else
		GS_TeamLevelTxt = "<color=red>��ng c�p l�n h�n ho�c b�ng c�p 50<color>"
	end
-------------------------------------
	local nItemCount = GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3])
	-- ����Ҫ��ȡ������Ӣ����
	local nNeedCount = CalcYingXiongTie(1)

	if (nItemCount >= nNeedCount) then
		nCheckPoint[4] = 1
		GS_TeamItemTxt = "<color=green>"..nNeedCount.."Anh h�ng thi�p <color>"
	else
		GS_TeamItemTxt = "<color=red>"..nNeedCount.."Anh h�ng thi�p <color>"
	end
-------------------------------------
--	if GS_DateCheck() == 1 then
--		nCheckPoint[5] = 1
--		GS_TeamDateTxt = "<color=green>ÿ�����<color>"
--	else
--		GS_TeamDateTxt = "<color=red>ÿ�����<color>"
--	end
-------------------------------------
	if GS_SleepCheck() == 1 then
		nCheckPoint[6] = 1
	end
-------------------------------------

	if (nCheckPoint[1] == 1) and (nCheckPoint[2] == 1) and (nCheckPoint[3] == 1) and (nCheckPoint[4] == 1) then
		return 2
	else
		local GS_COMMONTALK = "Ch� c� t� ch�c"..GS_TeamSizeTxt.."Th�"..GS_TeamLevelTxt.." (c�p) �� l�p t� ��i, do "..GS_TeamLeaderTxt.."G�i �"..GS_TeamItemTxt.."m�i g�p ���c trang ch�"..GS_TeamDateTxt..". \n \n<color=gray>(Ch� �� bi�u th� ��i ch�a �� �i�u ki�n, ch� xanh bi�u th� ��i �� �� �i�u ki�n)<color>"
		Talk(1, "", GS_COMMONTALK)
		return nCheckPoint[1], nCheckPoint[2], nCheckPoint[3], nCheckPoint[4], nCheckPoint[5]
	end
end

function GS_EnterTaskTalk()
	local GS_ENTERTASKTALK = "Ta theo l�nh trang ch� ��n ��y ngh�nh ti�p c�c v� anh h�ng, xin h�i c� c�n tr� gi�p g� kh�ng?"
	if (GetItemCount(2,0,333) == 0) then
		GS_ENTERTASKTALK = GS_ENTERTASKTALK.."Ta c� 1 quy�n <T�ng Ki�m Ch�>."
		Msg2Player("Nh�n ���c 1 quy�n <T�ng Ki�m Ch�>")
		AddItem(2,0,333,1)
	end
	Say(GS_ENTERTASKTALK, 8, "Li�n quan T�ng Ki�m s�n trang/GS_EnterTaskTalk_1", 
				 			 "Li�n quan Anh H�ng thi�p/GS_EnterTaskTalk_2", 
							 "Li�n quan T�ng Ki�m th�t �i/GS_EnterTaskTalk_3", 
							 "Li�n quan �i�u ki�n v��t �i/GS_EnterTaskTalk_4", 
							 "\nTa mu�n ��a ng��i v��t �i \n /GS_EnterTaskTalk_5",  -- DongTinhNang
							 "Nh�n thu�ng tham gia 7 l�n/get_Award7", 
							-- "Ta mu�n mua 1  T�ng Ki�m Anh H�ng Thi�p ( 20 xu v�t ph�m )/GS_ChangeAHL",
							 "Ta mu�n ��i �i�m t�ch l�y T�ng Ki�m l�y ph�n th��ng/GS_EnterTaskTalk_6",
							 "V�n sinh nghe uy danh c�a S� gi� T�ng Ki�m n�n ��c bi�t ��n th�m!/GS_EnterTaskTalk_7")	
end
	function DongTinhNang()
		Talk(1,"","T�nh n�ng V��t �i T�ng Ki�m �ang t�m ��ng, ��i hi�p h�y quay l�i sau !!!")
	end
	function GS_EnterTaskTalk_1()
		Say("T�ng Ki�m s�n trang n�i ti�ng v�i ngh� ��c ki�m nh�ng trong gian h� �t ai bi�t ��n. G�n ��y c� quy�n <Th� Gia Ph�> c�a B�ch Hi�u Sinh c� n�i ��n k� n�ng ��c ki�m c�a b�n trang, nhi�u v� anh h�ng c�ng mu�n ��n t�m hi�u. Nh�ng �� ���c v�o s�n trang c�n ph�i v��t qua 7 c�a �i. Xin h�i ��i hi�p c� c�n ta gi�p g� kh�ng?",2,"Ta mu�n h�i th�m c�i kh�c/GS_EnterTaskTalk","K�t th�c ��i tho�i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_2()
		Say("Anh h�ng thi�p c� th� mua � c�c ti�m t�p h�a trong c�c ��i th�nh th�",2,"Ta mu�n h�i th�m c�i kh�c/GS_EnterTaskTalk","K�t th�c ��i tho�i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_3()
		Say("T�ng Ki�m Th�t �i l� 7 �i l�n ���c x�y theo ��a h�nh c�a S�n Trang, n�i h�p b�t qu�i, �m ch�a ng� h�nh, c�m b�y tr�ng tr�ng. Ng��i ngo�i r�i v�o c�m ch�c c�u t� nh�t sinh. Ta th�y ng��i h�p nh�n n�n c� ch�t h�ng th�. C�n ta gi�p g� n�a kh�ng?",2,"Ta mu�n h�i th�m c�i kh�c/GS_EnterTaskTalk","K�t th�c ��i tho�i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_4()
		Say("X�m nh�p T�ng Ki�m s�n trang c�n 5 chi�n h�u ��ng c�p"..SF_TOWNNAME.."l�n h�n ho�c b�ng c�p 50, ���c ��i tr��ng xu�t tr�nh Anh H�ng thi�p. M�i ng�y, ch� nh�n ���c 5 l�n l�i m�i c�a T�ng Ki�m s�n trang trang ch�!",2,"Ta mu�n h�i th�m c�i kh�c/GS_EnterTaskTalk","K�t th�c ��i tho�i/GS_EnterTaskTalk_7")
	end
	function GS_EnterTaskTalk_5()
	--	local nMap = GetWorldPos()
--		if nMap ~= 350 and nMap ~= 100 then
--			Talk(1,"","C�c h� ch� c� th� v�o T�ng Ki�m S�n Trang t� T��ng D��ng v� Tuy�n Ch�u!")
--			return
--		end
		local nCurDate = tonumber(date("%m%d"))
		local nOldIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			
			if GetTask(GS_RECORD_DATE) ~= nCurDate then
				SetTask(GS_RECORD_CHANCE, 0)
				SetTask(GS_RECORD_DATE, nCurDate)
			end
			
			if GetTask(GS_RECORD_CHANCE) >= 7 then
				gf_Msg2Team("H�m nay "..GetName().." �� �i 7 l�n.")
				return
			end
		end
		PlayerIndex = nOldIndex
		GS_EnterTask()
	end
	function GS_EnterTaskTalk_6()
		local nScore = GetTask(TB_BONUS_SCORE)
		if nScore < 0 then
			Talk(1,"","�i�m t�ch l�y kh�c th��ng, kh�ng th� ��i ph�n th��ng")
			WriteLog("[T�ng Ki�m]"..GetName().."�i�m t�ch l�y kh�c th��ng")
			return
		end
		
		local sTalk = "�i�m t�ch l�y c�a ng��i hi�n l� <color=gold>"..nScore.."<color> �i�m. Xin h�i mu�n ��i ph�n th��ng n�o?"
		Say(sTalk,9,SB_FormatStr("      Trang ph�c c�p 50",30).." 100000 �i�m t�ch l�y/GS_TaskReward_1", 
			    SB_FormatStr("      Trang ph�c c�p 70",30).."500000 �i�m t�ch l�y/GS_TaskReward_2", 
			    --SB_FormatStr("      Ѫ��",30).."7500����/GS_TaskReward_3", 
			    --SB_FormatStr("      ����",30).."8500����/GS_TaskReward_4", 
			    SB_FormatStr("       10000 �i�m kinh nghi�m",30).." 1000 �i�m t�ch l�y/#GS_TaskReward_5(1000)",
			    SB_FormatStr("      50000 �i�m kinh nghi�m",30).."5000 �i�m t�ch l�y/#GS_TaskReward_5(5000)",
			    SB_FormatStr("      100000 �i�m kinh nghi�m",30).." 10000 �i�m t�ch l�y/#GS_TaskReward_5(10000)",
			    SB_FormatStr("     500000 �i�m kinh nghi�m",30).."50000 �i�m t�ch l�y/#GS_TaskReward_5(50000)",
			    SB_FormatStr("��i kinh nghi�m 1 l�n",30).."�i�m t�ch l�y/#GS_TaskReward_5(-1)", 
			    "\nTa mu�n h�i th�m c�i kh�c/GS_EnterTaskTalk",
			    "K�t th�c ��i tho�i/GS_EnterTaskTalk_7")
	end
	
--	local aGearsLevelTable = {3, 5, 7, 10}
--	local nGearsLevelTableLen = 4
--	local aGearsSlotTable = {103, 100, 101, 102, -1}
--	local aWeaponsTable = {3, 5, 8, 0, 1, 1, 3, 2, 10, 8, 0, 5, 9, 2, 9, 10}		-- ��������
--	local aGearsFactionTable = {1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15}	

		function GS_TaskReward_1()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 50 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--���ʧ�����ε�żҲ�ɵú�
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T�i h� h�nh nh� kh�ng th�y l�u ph�i c�c h� �� h�c, n�n kh�ng c� trang b� n�o danh cho c�c h� ��i");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","Ng��ich�a gia nh�p m�n ph�i, kh�ng th� nh�n ph�n th��ng!")
			else
				if nScore >= 100000 then
					SetTask(TB_BONUS_SCORE, (nScore-100000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[T�ng Ki�m] "..GetAccount().. " / "..GetName().." : Trang ph�c c�p 50:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","�i�m t�ch l�y c�a b�n kh�ng ��")
				end
			end
		end
		function GS_TaskReward_2()
			local nGearIndex = {0,102, 0}
			local nFaction = GetPlayerRoute()
			local nBody = GetBody()
			nGearIndex[3] = nFaction*100 + 70 + nBody
			local nScore = GetTask(TB_BONUS_SCORE)
			--���ʧ�����ε�żҲ�ɵú�
			if nFaction == 23 or nFaction == 29 or nFaction == 30 then
				Talk(1,"","T�i h� h�nh nh� kh�ng th�y l�u ph�i c�c h� �� h�c, n�n kh�ng c� trang b� n�o danh cho c�c h� ��i");
				return 0;
			end
			if nFaction == 0 then
				Talk(1,"","Ng��ich�a gia nh�p m�n ph�i, kh�ng th� nh�n ph�n th��ng!")
			else
				if nScore >= 500000 then
					SetTask(TB_BONUS_SCORE, (nScore-500000))
					AddItem(nGearIndex[1], nGearIndex[2], nGearIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
					WriteLog("[T�ng Ki�m] "..GetAccount().. " / "..GetName().." : Trang ph�c c�p 70:"..nGearIndex[1]..nGearIndex[2]..nGearIndex[3]);
				else
					Talk(1,"","�i�m t�ch l�y c�a b�n kh�ng ��")
				end
			end
		end
		function GS_TaskReward_3()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 7500 then
				SetTask(TB_BONUS_SCORE, (nScore-7500))
				AddItem(2, 0, 334, 1)
			else
				Talk(1,"","�i�m t�ch l�y c�a b�n kh�ng ��")
			end
		end
		function GS_TaskReward_4()
			local nScore = GetTask(TB_BONUS_SCORE)
			if nScore >= 8500 then
				SetTask(TB_BONUS_SCORE, (nScore-8500))
				AddItem(2, 0, 335, 1)
			else
				Talk(1,"","�i�m t�ch l�y c�a b�n kh�ng ��")
			end
		end
		function GS_TaskReward_5(nPoint)
			local nScore = GetTask(TB_BONUS_SCORE)
			if nPoint == -1 then
				SetTask(TB_BONUS_SCORE, 0)
				ModifyExp(nScore * 10)
				WriteLog("[T�ng Ki�m] "..GetAccount().. " / "..GetName().."D�ng �i�m t�ch l�y ��i"..(nScore * 10).." �i�m kinh nghi�m")
			elseif nScore >= nPoint then
				SetTask(TB_BONUS_SCORE, (nScore - nPoint))
				ModifyExp(nPoint * 10)
				WriteLog("[T�ng Ki�m] "..GetAccount().. " / "..GetName().."D�ng �i�m t�ch l�y ��i"..(nPoint * 10).." �i�m kinh nghi�m")
			else
				Talk(1,"","�i�m t�ch l�y c�a b�n kh�ng ��")
			end
		end
		
	function GS_EnterTaskTalk_7()
		--Talk(1,"","���������ˣ�")
	end


-- ��������������ѡ�񳡵صĽ���Ϳ��Ʋ���
function GS_EnterTask()
	local sInfo1 = "V� anh h�ng n�y mu�n v�o tr�n ��a n�o? \n"..SF_TOWNNAME..", xin h�i c�c anh h�ng mu�n v�o tr�n ��a n�o? \n".."[Tr�n ��a] Tr�n ��a 1 Tr�n ��a 2 Tr�n ��a 3 Tr�n ��a 4 Tr�n ��a 5 \n"
	local sInfo2 = "[Tr�ng th�i]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1].."\n"
	local GS_USEDNOTE_COT = {}
	for i=1, 5 do
		local sStage = TC_STAGE_Index[i]
		if sStage < 1 then
			sStage = "<color=gold>?<color>"
		else
			sStage = "<color=gold>"..sStage.."<color>"
		end
		local sTurn = TC_TIMER_Count[i]
		if sTurn < 1 then
			sTurn = "???"
		elseif sTurn < 10 then
			sTurn = "00"..sTurn
		elseif sTurn < 100 then
			sTurn = "0"..sTurn
		else
			sTurn = sTurn
		end		
		GS_USEDNOTE_COT[i] = sStage..". "..sTurn
	end
	local sInfo3 = "[Ti�n ��]     "..GS_USEDNOTE_COT[1].."      "..GS_USEDNOTE_COT[2].."      "..GS_USEDNOTE_COT[3].."      "..GS_USEDNOTE_COT[4].."      "..GS_USEDNOTE_COT[5]
	GS_ENTERTALK = sInfo1..sInfo2..sInfo3
	if (GS_EnterCheck() == 2) then
		Say(GS_ENTERTALK, 6, "Tr�n ��a nh�m th� 1"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
					 		 "Tr�n ��a nh�m th� 2"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2", 
							 "Tr�n ��a nh�m th� 3"..GS_USEDNOTE_TXT[GS_STAGE_USED[3]+1].."/GS_ZoneSelect_3", 
							 "Tr�n ��a nh�m th� 4"..GS_USEDNOTE_TXT[GS_STAGE_USED[4]+1].."/GS_ZoneSelect_4", 
							 "Tr�n ��a nh�m th� 5"..GS_USEDNOTE_TXT[GS_STAGE_USED[5]+1].."/GS_ZoneSelect_5",
							 "l�n sau quay l�i nh�!/GS_ExitSay")
--		Say(GS_ENTERTALK, 9, "��һ�س���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
--					 		 "�ڶ��س���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_12", 
--							 "�����س���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_13", 
--							 "���Ĺس���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_14", 
--							 "����س���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_15",
--							 "�ڰ˹س���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_18",
--							 "�ھŹس���"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_19",
--							 "�ڶ��鳡��"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2",
--							 "�´�������/GS_ExitSay")
	end
end
	-- ����5����ѡ��ͬ��ѡ���Ĵ���
	function GS_ZoneSelect_1()
		if (GS_STAGE_USED[1] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(1, 0)
				MU_Msg2Team("��i ng� �ang chuy�n v�o.. [Tr�n ��a 1]")
				GS_StartFlag = 1
			else
				Msg2Player("Kh�ng �� Anh H�ng thi�p, kh�ng th� v�o S�n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(1)
			Msg2Player("Kh�ng �� �i�u ki�n...")
		end
	end
	function GS_ZoneSelect_2()
		if (GS_STAGE_USED[2] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(2, 0)
				MU_Msg2Team("��i ng� �ang chuy�n v�o.. [Tr�n ��a 2]")
			else
				Msg2Player("Kh�ng �� Anh H�ng thi�p, kh�ng th� v�o S�n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(2)
			Msg2Player("Kh�ng �� �i�u ki�n...")
		end
	end
	function GS_ZoneSelect_3()
		if (GS_STAGE_USED[3] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(3, 0)
				MU_Msg2Team("��i ng� �ang chuy�n v�o.. [Tr�n ��a 3]")
			else
				Msg2Player("Kh�ng �� Anh H�ng thi�p, kh�ng th� v�o S�n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(3)
			Msg2Player("Kh�ng �� �i�u ki�n...")
		end
	end
	function GS_ZoneSelect_4()
		if (GS_STAGE_USED[4] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(4, 0)
				MU_Msg2Team("��i ng� �ang chuy�n v�o.. [Tr�n ��a 4]")
			else
				Msg2Player("Kh�ng �� Anh H�ng thi�p, kh�ng th� v�o S�n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(4)
			Msg2Player("Kh�ng �� �i�u ki�n...")
		end
	end
	function GS_ZoneSelect_5()
		if (GS_STAGE_USED[5] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(5, 0)
				MU_Msg2Team("��i ng� �ang chuy�n v�o.. [Tr�n ��a 5]")
			else
				Msg2Player("Kh�ng �� Anh H�ng thi�p, kh�ng th� v�o S�n Trang")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(5)
			Msg2Player("Kh�ng �� �i�u ki�n...")
		end
	end
--	function GS_ZoneSelect_12()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 1)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end
--	function GS_ZoneSelect_13()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 2)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end
--	function GS_ZoneSelect_14()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 3)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end
--	function GS_ZoneSelect_15()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 4)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end
--	function GS_ZoneSelect_18()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 7)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end
--	function GS_ZoneSelect_19()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 8)
--			MU_Msg2Team("���鴫���С��� [����һ�ؿ���]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("��������������...")
--		end
--	end

	-- ��Ҳ鿴�Ѿ���ʹ�õĳ���ʱ�Ľ�����ʾ
	function GS_ViewZone(nZone)
		--local sBNum = {"Ҽ", "��", "��", "��", "��", "½", "��", "��", "��", "��", "??"}
		local sBNum = {"m�t", "hai", "ba", "b�n", "Ng� ", "s�u", "b�y", "t�m", "ch�n", "0", "??"}
		local sSNam = {"S�n m�n", "��i vi�n", "H�u hoa vi�n", "Li�n Ho�n S�o", "T�ng Ki�m c�c", "????", "????", "T� Tr�c l�m", "Ki�m Ch�ng", "????", "????"}
		local Temp = TC_STAGE_Index[nZone]
		local Temp2 = ""
		local Temp3 = 0
		if (Temp == nil) then
			Temp = 11
			Temp2 = "?:??"
		elseif (Temp < 1) then
			Temp = 11
			Temp2 = "?:??"
		else
--			Temp2 = TC_TIMER_LIMIT_TABLE[Temp]*14	-- ʵ��ʱ����ʾ
--			Temp2 = ((Temp2-mod(Temp2, 60))/60)..":"..mod(Temp2, 60)
			Temp2 = TC_TIMER_LIMIT_TABLE_UI[Temp]	-- ��������ʱ����ʾ
		end
		local sLine1 = "                         M� s� tr�n ��a: <color=gold>"..sBNum[nZone].."<color>\n"
		local sLine2 = "                         �i hi�n t�i: <color=gold>"..sSNam[Temp].."<color>("..sBNum[Temp]..")\n"
		Temp = TC_TIMER_Count[nZone]*14
		if (Temp < 1) or (Temp == nil) then
			Temp = "?:??"
		else
			Temp = ((Temp-mod(Temp, 60))/60)..":"..mod(Temp, 60)
		end
		local sLine3 = "                         Th�i gian qua �i: <color=gold>"..Temp.."<color>/"..Temp2.."\n"
		if (TM_MEMBER_Index[nZone] == nil) or (TM_MEMBER_Index[nZone][1] == nil) then
			Temp = "??"
			Temp2 = "?"
		else
			Temp = TM_MEMBER_Index[nZone][1]
			local nOldIndex = PlayerIndex
			PlayerIndex = Temp
			Temp = GetName()
			Temp2 = GetLevel()
			Temp3 = GetTeamSize()
			PlayerIndex = nOldIndex
		end
		if Temp3 < 1 then
			Temp3 = "?"
		elseif Temp3 <= 6 then
			Temp3 = "<color=green>"..Temp3.."<color>"
		elseif Temp3 <= 7 then
			Temp3 = "<color=gold>"..Temp3.."<color>"
		else
			Temp3 = "<color=red>"..Temp3.."<color>"
		end
		local sLine4 = "                         T�n ��i tr��ng: <color=green>"..Temp.."<color> (C�p:"..Temp2..")\n"
		Temp = TM_MEMBER_MaxLevel[nZone]
		Temp = MU_Div(Temp)
		if Temp <= 5 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 7 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"
		end
		local sLine5 = "                         S� l��ng:  "..Temp3.."/<color=red>8<color>\n"
		local sLine6 = "                         �� kh�:  "..Temp.."/<color=red>9<color>\n"
		Temp = TB_BONUS_Total[nZone]
		Temp2 = TC_KILL_Total[nZone]
		if (Temp < 1) or (Temp == nil) then
			Temp = "????"
		elseif Temp <= 25000 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 80000 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"	
		end
		Temp = SB_Div(Temp, 1)
		local sLine7 = "                         �i�m v��t �i:  "..Temp.." (S� l��ng ��nh b�i:"..Temp2..")"
		local sLine8 = ""				
		Say(sLine1..sLine2..sLine3..sLine4..sLine5..sLine6..sLine7, 0)
	end
	
-- ����ÿ�ؿ��Ĳؽ�ʹ��(ͨ����ȱʡ���в���,����������Ϸ�Ľ����Զ�������Ҫ�Ĳؽ�ʹ��)
-- nMode : 0.��ʼNPC 1.����NPC
function GS_CreateMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
--	local nMapID = 890 + (nZone * 10) + nStage		-- ��ͬ�ĳ���\�ؿ�ȷ����ͬ�� ��ͼ ID
--                   ������        ������            �ؿ�
	local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- ��ͬ�ĳ���ȷ����ͬ�� ��ͼ ID
	if nMode == 1 then
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_ENDPOS[nStage][1], GS_MESSENGER_ENDPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(0)
	else
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_STARTPOS[nStage][1], GS_MESSENGER_STARTPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(1)
	end	
end

function GS_InitStage(nZone, nStage)
end

-- ��ؽ�ʹ�߶Ի�@��ʼ�ؿ�ʱ
function GS_Talk4Start(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if TM_IsCaptain() == 1 then							-- �ж��Ƿ��Ƕӳ�
		Say(GS_STAGE_START[nStage], 1, GS_FORSELECT[1])
	else
		Talk(1, "", GS_STAGE_START[nStage])
	end
end

-- ��ؽ�ʹ�߶Ի�@�����ؿ�ʱ,��������ؿ�����
function GS_Talk4End(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local sGCBonus = GS_FORSELECT[3].."("..TB_GetBonusChance()..")"
	sGCBonus = sGCBonus.."/GS_GetCaptainBonus"
	if TM_IsCaptain() == 1 then							-- �ж��Ƿ��Ƕӳ�
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[4], GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[7], GS_FORSELECT[6])

	else
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 1, GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[7], GS_FORSELECT[6])
	end
end

-- ��ؽ�ʹ�߶Ի�@�ж��ǽ��� ��ʼ�Ի� ���ǽ��� �����Ի�(ͨ����ȱʡ���в���,����������Ϸ�Ľ����Զ�ѡ����Ҫ�Ի�����)
function GS_TalkWithMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
	if (nMode == 1) then
		GS_Talk4End(nZone, nStage)
	else
		GS_Talk4Start(nZone, nStage)
	end
end

-- �ؿ�����������,��ʼ��һ�ؿ�(һ�㱻 GM_NextStageInit ����,������ʹ��)
-- nMode : -1.���ж�Ա�������� 0.���ж�Ա����һ�ؿ�(ȱʡĬ��) 1+.��ʾ�ѵ�ǰ����ͻ�����
function GS_Team2NextStage(nZone, nStage, nMode)
	local nNewWorldResult
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		nMode = 0
	end
	if (nStage >= 1) and (nStage < 10) and (nMode == 0) then
--		local nMapID = 890 + nZone * 10 + nStage		-- ��ͬ�ĳ���\�ؿ�ȷ����ͬ�� ��ͼ ID
--  	                 ������        ������            �ؿ�
		local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- ��ͬ�ĳ���ȷ����ͬ�� ��ͼ ID
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if (nStage == 1) and (GetWorldPos() == SF_TOWNID) then
				SetDeathPunish(0)
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
--			elseif (nStage ~= 1) and (GetWorldPos() > 900) and (GetWorldPos() < 999) then
			else
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
			end
		end
		PlayerIndex = nOldIndex
	elseif nMode == -1 then
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
		end
		PlayerIndex = nOldIndex
	elseif nMode > 0 then
		local a,b,c = GetWorldPos()
		nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
	end

	return nNewWorldResult
end

-- ȫ�Ӵ��͵�ָ������
function GS_NewWorldTeam(nMap, nX, nY)
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			local nNewWorldResult = NewWorld(nMap, nX, nY)
		end
		PlayerIndex = nOldIndex
end

-- ������һ�ؿ���ѡ�������õĹ���
function GS_NextStage(nZone)
	local a,b,c=GetWorldPos()
	if a == SF_TOWNID then
		return
	end
	if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		ClearMapNpc(a)
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TB_StoreScore()
	TC_STAGE_State[nZone] = 30
	GM_NextStageInit()
end

-- �ӳ���ȡ������ѡ�������õĹ���
function GS_GetCaptainBonus()
	TB_GetCaptainBonus()
end

-- �Ͳؽ�ʹ�߽��н��׵�ѡ�������õĹ���
function GS_Trade(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if GS_IsAllowTrade[nZone] == 1 then
		Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
	else
		local nST = GetTask(TB_BONUS_RELATION)
		if nST <= 100 then
			nST = 10
		elseif  nST <= 200 then
			nST = 5000
		elseif  nST <= 500 then
			nST = 10000
		elseif  nST <= 1000 then
			nST = 15000
		elseif  nST <= 2000 then
			nST = 20000
		elseif  nST <= 5000 then
			nST = 25000
		else
			nST = 30000
		end
		if random(1, 100000) <= nST then
			-- Stage Event Start
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
			SetTask(SB_EVENT_STAGE[10], nFlag)
			TB_AddScore(3, random(0, 2))
			TaskTip("K�ch ho�t s� ki�n ��c bi�t: Th�ng th��ng. Giao d�ch")
			-- Stage Event End
		elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
		else
			Talk(1, "", GS_ERRORMSG[1])
		end
	end
end

function GS_OpenBox()
	local nST = GetTask(TB_BONUS_RELATION)
	if GetTask(805)==0 then 
		Talk(1,"","Ng��i ch�a m� r��ng, kh�ng th� s� d�ng ch�c n�ng n�y!")
		return
	end
	if nST <= 100 then
		nST = 10
	elseif  nST <= 200 then
		nST = 5000
	elseif  nST <= 500 then
		nST = 10000
	elseif  nST <= 1000 then
		nST = 15000
	elseif  nST <= 2000 then
		nST = 20000
	elseif  nST <= 5000 then
		nST = 25000
	else
		nST = 30000
	end
	if random(1, 100000) <= nST then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
		TB_AddScore(3, random(0, 2))
		TaskTip("K�ch ho�t s� ki�n ��c bi�t: Th�ng th��ng. R��ng ch�a ��")
		OpenBox()
		-- Stage Event End
	elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
		DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
		OpenBox()
	else
		Talk(1, "", GS_ERRORMSG[1])
	end
end

function GS_ExitSay()
end

-- ��ʼһ���ؿ�,�����˹ؿ�����Ҫ�ĳ�ʼ������
function GS_StartStage()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if GetWorldPos() == SF_TOWNID then
		return
	end
	MC_Del4Group(TT_GetTarget(), 0)
	TC_STAGE_State[nZone] = 10
-----------------------------------------------------------------------------------
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "���Ź�")
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "��ͨ����")
--		MC_BeSpawnNPCs(nStage, nMaxLevel, "���Ź�", nZone, 1)
		ACT1_BOSS_Index[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 25	-- ����BOSS��Ҫɱ���Ļ�Ժ�Ҷ�����
		TC_TASK_EventCount[nZone][2] = 0
		TC_TASK_EventCount[nZone][3] = 0
		TC_TASK_Conditions[nZone][3] = random(5, 10)	-- ���� Event����ŭ�ļҶ� ��Ҫɱ���Ĺ�������
		TC_TASK_Conditions[nZone][4] = random(120, 120)	-- ���� Event����ŭ����Ժ�ܹ� ��Ҫɱ��������
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia �inh", nZone, 1)
		ACT2_GotSword[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = random(10, 15)	-- �������������Ҫɱ����ɽׯ��ͷ����
		TC_TASK_Conditions[nZone][2] = TC_TASK_Conditions[nZone][1] + random(15, 20)	-- �ض��������������Ҫɱ����ɽׯ��ͷ����
		local nMapID = GetWorldPos()
		local nBossIndex = CreateNpc("N�i qu�n_��i tho�i", "T�ng qu�n n�i vi�n", nMapID, 1657, 3133)
--		local nBossIndex = CreateNpc("��������", "��Ժ�ܹ�", nMapID, 1657, 3133)
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia �inh", nZone, 1)
		ACT3_CalculateOdderTable()
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 16	-- ˢ��������Ů����Ҫɱ���Ļ�Ժ�Ҷ�������ÿ10��ˢһ��Ů��
		TC_TASK_EventCount[nZone][2] = 0	-- ��¼�Ѿ�ˢ����N����Ů��
		ACT3_Keeper[nZone] = 0				-- ��԰ִ���Ƿ񾪶�
		ACT3_Traped[nZone] = 0				-- �ȵ����ԵĴ���
		ACT3_ContrackSent[nZone] = 0		-- �Ƿ��Ѿ�������������Լ
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, nil, nZone, 1)
		ACT4_SWITCH_Table[nZone] = {}
		ACT4_SWITCH_Count[nZone] = {0,0,0}
		ACT4_SWITCH_DEBUFF[nZone] = {0,0,0}
		ACT4_SWITCH_TimeLim[nZone] = {999,999,999}
		ACT4_SWITCH_Index[nZone] = {{0,0,0},{0,0,0},{0,0,0}}
		ACT4_BOSS_Spwaned[nZone] = 0
		ACT4_CalculateSwitchTable()
		ACT4_CreateSwitch()
		ACT4_Debuff(0)
		MU_Msg2Team("Do c� ng��i l� x�m nh�p, Li�n Ho�n tr�n �� ph�t huy h�t ma l�c m�nh m�.", 1)
		TC_TASK_EventCount[nZone][1] = 0	-- ��¼����Ļ�������
		TC_TASK_Conditions[nZone][1] = 0	-- ��¼������Ļ�������
		TC_TASK_EventCount[nZone][2] = 0	-- ��¼�������������
		TC_TASK_Conditions[nZone][2] = 3	-- ��¼�����������������
		TC_TASK_Conditions[nZone][3] = TC_TIMER_LIMIT_TABLE[nStage]	-- �������ص�ʱ������
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_CreateSword()
		TC_TASK_EventCount[nZone][1] = 0	-- ��¼�ν��ĸ���
		TC_TASK_EventCount[nZone][2] = 1	-- ��¼�彣�ĸ���
		TC_TASK_Conditions[nZone][2] = 6	-- ����BOSS�Ĳ彣����
		ACT5_DROP_ROW[nZone] = 0			-- ��¼�彣�� ��λ����
		ACT5_CHACUOLE[nZone] = {}			-- ��¼����Ĵ���
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		ACT8_CalculatePath()
--		local nMapID = ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][1] - 10 + nZone * 10
		local nMapID = SF_MAPBASE + (nZone * 10) + ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][1]
		local nStartPoint = ACT8_GetSnEIndex(0)
		local nEndPoint = ACT8_GetSnEIndex(1)
--		Msg2Player("��ʼ�㣺"..nStartPoint.."  �����㣺"..nEndPoint)
		GS_NewWorldTeam(nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][3])
		local nEndMessenger = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][3])
		SetNpcDeathScript(nEndMessenger, SF_FILE)
		MC_Add2Group(nEndMessenger)
		TC_STAGE_State[nZone] = 20
		ACT8_CreateLargeChest()
		ACT8_CreateSmallChest()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		local nMapID = GetWorldPos()
		local nLevel = MU_Div(nMaxLevel)*10
		local aSLoca = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
		local aSName = {"Kim Ki�m phong kh�c", "M�c Ki�m phong kh�c", "Th�y Ki�m phong kh�c", "H�a Ki�m phong kh�c", "Th� Ki�m phong kh�c"}
		SWORD_SEALTIME[nZone] = {0,0,0,0,0}
		SWORD_SEALINDEX[nZone] = {0,0,0,0,0}
		SWORD_BOSSSPWANED[nZone] = 0
		for i=1, 5 do
			local nBossIndex = CreateNpc("Ki�m ��i"..nLevel, aSName[i], nMapID, aSLoca[i][1], aSLoca[i][2])
			MC_Add2Group(nBossIndex)
			local nCHP = -1*(GetUnitCurStates(nBossIndex, 1) - 1)
			AddUnitStates(nBossIndex, 1, nCHP)
		end
		local nBossIndex = CreateNpc("B�n Long Tr�", "Ki�m Ma ng� m�", nMapID, 1567, 3240)
		SWORD_SleepOne[nZone] = nBossIndex
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	end
end
--============================================================================================== GAME MAIN ====
------------------------------------------------------------------------------------------------ FUNCTION ----
-- ���ö������
-- nMode : 0.�������� 1.�رչ���
function GM_Rules(nMode, nEffTeam)
	local nTeamSize = GetTeamSize()
	if nTeamSize <= 1 then
		nTeamSize = 1
	end
	if nEffTeam == nil then
		nEffTeam = 0
	end
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		if GetTeamSize() ~= 0 then
			PlayerIndex = GetTeamMember(i)
		end
		if (nTeamSize == 1) or (nEffTeam == 0) then
			PlayerIndex = nOldIndex
		end
		Msg2Player("Trong quy t�c b� tr� �i��")
		CleanInteractive()						-- �������
--		SetLogoutRV(MU_Inverse(nMode))			-- ��;�жϺ�س�
		SetFightState(MU_Inverse(nMode))		-- ����Ϊ��ս��
		SetCreateTeam(MU_Inverse(nMode))		-- �ر���ӹ���
		UseScrollEnable(nMode)					-- ��ֹʹ�ûسǷ�
	    InteractiveEnable(nMode)				-- �������أ�0�رգ�1��
	    StallEnable(nMode)		   				-- ��̯����
		ForbitTrade(MU_Inverse(nMode))			-- ��ֹ����
		--SetDeathScript("")					-- ���õ�ǰ��ҵ������ű�
		TT_SetTarget(0)
		if (nTeamSize == 1) or (nEffTeam == 0) then
			return
		end
	end
	PlayerIndex = nOldIndex	
end

function GM_FightState(nMode)
	local nTeamSize = GetTeamSize()
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		SetFightState(nMode)		-- ����Ϊ��ս��
	end
	PlayerIndex = nOldIndex	
end

function GM_RecordDate()
	local nTeamSize = GetTeamSize()
	local nDate = tonumber(date("%m%d"))
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetTask(GS_RECORD_DATE) == nDate then
			SetTask(GS_RECORD_CHANCE, (GetTask(GS_RECORD_CHANCE)+1))
		else
			SetTask(GS_RECORD_CHANCE, 1)
			SetTask(GS_RECORD_DATE, nDate)
		end
		SetTask(2471, 0)
	end
	PlayerIndex = nOldIndex	
end

-- ���������һ�ؿ�,����ʼ������
function GM_NextStageInit(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	else
		TC_SetTeamZone(nZone)
	end
	if nStage == nil then
		if (TC_STAGE_Index[nZone] == 5) or (TC_STAGE_Index[nZone] == 6) then
			TC_STAGE_Index[nZone] = 8
		else
			TC_STAGE_Index[nZone] = TC_STAGE_Index[nZone] + 1
		end
		nStage = TC_STAGE_Index[nZone]
	else
		nStage = nStage + 1
		TC_STAGE_Index[nZone] = nStage
	end
	SB_STAGE_RECORD[nZone] = 0
	if (nStage == 1) then	
--	if (nStage <= 9) and (GS_StartFlag == 0) then
		GM_Rules(0, 1)
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		TC_TIMER_StartDate[nZone] = tonumber(date("%d%H%M%S"))
		if TM_MEMBER_Index[nZone] ~= nil then
			TM_MEMBER_Index[nZone] = nil
		end
		TM_SaveOrgMember(nZone)
		GS_STAGE_USED[nZone] = 1
		
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 2)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			SCCheckOfflineExp(2)
			if PlayerIndex <= 0 then
				PlayerIndex = nOldIndex
				WriteLog("[T�ng Ki�m] "..GetName().."'s team is somthing wrong.")
			end
		end
		PlayerIndex = nOldIndex
		GM_RecordDate()
	elseif nStage > 9 then
		GM_Rules(1, 1)
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 0)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
		if ((TC_TIMER_CountTotal[nZone]*14) < GetTask(TB_BONUS_CAPTAINTIME)) or (GetTask(TB_BONUS_CAPTAINTIME) == 0) then
			SetTask(TB_BONUS_CAPTAINLEVEL, GetLevel())
			SetTask(TB_BONUS_CAPTAINTIME, (TC_TIMER_CountTotal[nZone]*14+random(-7,7)))
			Msg2Player("��i m�i ghi nh� th�i gian ng�n nh�t: ��ng c�p-"..GetTask(TB_BONUS_CAPTAINLEVEL).." Th�i gian-"..GetTask(TB_BONUS_CAPTAINTIME))
		else
			Msg2Player("Ghi nh� th�i gian ng�n nh�t hi�n t�i: ��ng c�p-"..GetTask(TB_BONUS_CAPTAINLEVEL).." Th�i gian-"..GetTask(TB_BONUS_CAPTAINTIME))
		end
		PlayerIndex = nOldIndex
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		for i=1, TM_MEMBER_Index[nZone][9] do
			TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
		end
		TM_MEMBER_Index[nZone] = {}
		GS_STAGE_USED[nZone] = 0
		
		TC_STAGE_State[nZone] = 0
		TC_KILL_Stage[nZone] = 0
		TC_TASK_EventCount[nZone] = {}
		TC_TASK_Conditions[nZone] = {}
		TC_TIMER_Count[nZone] = 0
		TM_MEMBER_MaxLevel[nZone] = 30
		MC_SPWN_Count[nZone] = {}
		MC_SPWN_Limit[nZone] = 150
		TB_BONUS_MemberTotal[nZone] = 0
		TB_BONUS_Total[nZone] = 0
		GS_IsAllowTrade[nZone] = 0
--------------------------
		MC_ClearGroup(0, nZone)
		TT_RemoveTimer()
		TT_RemoveTriggers()
		if GS_Team2NextStage(nZone, nStage, -1) > 0 then
			GS_STAGE_USED[nZone] = 0
		end
		MU_Msg2Team(" Ho�n th�nh t�t c� c�a �i! T�t c� chi�n h�u quay l�i"..SF_TOWNNAME..".")
		TC_STAGE_Index[nZone] = 0
		TC_SetTeamZone(0)		
		GS_StartFlag = 0
		Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
		return
	end
	TC_KILL_Stage[nZone] = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
	TC_TIMER_Count[nZone] = 0
	TM_MEMBER_MaxLevel[nZone] = TM_GetMaxLevel(nZone)
	MC_SPWN_Limit[nZone] = MC_SPWN_LIMIT_TABLE[TC_STAGE_Index[nZone]]
	MC_SPWN_Count[nZone] = {}
	TB_BONUS_MemberTotal[nZone] = 0
	GS_IsAllowTrade[nZone] = 0
	TC_KILL_KeyGot[nZone] = 1
--------------------------
	MC_ClearGroup(0, nZone)
	GS_Team2NextStage(nZone, nStage)

	add_award_ex_0908(nStage);
	
	TC_STAGE_State[nZone] = 0
	GS_CreateMessenger()
--------------------------
	TT_StartTimer(nZone)
	TT_StartTriggers()
	Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
end

-- ------------------------------------------------------------------------------------------------ <Act III> ----
-- ------------------------------------------------------------------------------------------------ <Act III Function> ----
-- ��������س��ֲ�ͬλ�õ� ��Ů�� �����˳��
function ACT3_CalculateOdderTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT3_ODDER_Table[nZone] = {1,2,3,4,5,6,7,8}
	for i=1, 8 do
		local nTempRND = random(i, 8)
		local nTempEXC = ACT3_ODDER_Table[nZone][nTempRND]
		ACT3_ODDER_Table[nZone][nTempRND] = ACT3_ODDER_Table[nZone][i]
		ACT3_ODDER_Table[nZone][i] = nTempEXC
	end
end

-- ���� ��Ů�� ,���Զ����� �ۼ���
function ACT3_CreateOdder(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
	local nOdderFlag = ACT3_ODDER_Table[nZone][TC_TASK_EventCount[nZone][2]]
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	local nOdderIndex = CreateNpc("L�o b�c"..nlevel, "L�o b�c", nMapID, ACT3_ODDER_POS[nOdderFlag][1], ACT3_ODDER_POS[nOdderFlag][2])
	MC_Add2Group(nOdderIndex)
	return nOdderIndex
end

-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
-- ������Ĺص� ������ʯ ������Ų�
function ACT4_CalculateSwitchTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT4_SWITCH_Table[nZone] = {1,2,3, 2,3,1, 3,1,2}
	for i=1, 9 do
		local nTempRND = random(i, 9)
		ACT4_SWITCH_Table[nZone][nTempRND], ACT4_SWITCH_Table[nZone][i] = ACT4_SWITCH_Table[nZone][i], ACT4_SWITCH_Table[nZone][nTempRND]
	end
--	Msg2Player(ACT4_SWITCH_Table[nZone][1].." "..ACT4_SWITCH_Table[nZone][2].." "..ACT4_SWITCH_Table[nZone][3])
--	Msg2Player(ACT4_SWITCH_Table[nZone][4].." "..ACT4_SWITCH_Table[nZone][5].." "..ACT4_SWITCH_Table[nZone][6])
--	Msg2Player(ACT4_SWITCH_Table[nZone][7].." "..ACT4_SWITCH_Table[nZone][8].." "..ACT4_SWITCH_Table[nZone][9])
end

function ACT4_Debuff(nType)
	local nOldIndex = PlayerIndex
	local nZone = TC_GetTeamZone()
	local aTimes = {ACT4_SWITCH_Count[nZone][1]*60, ACT4_SWITCH_Count[nZone][2]*60, ACT4_SWITCH_Count[nZone][3]*60}
--	Msg2Player(aTimes[1].." "..aTimes[2].." "..aTimes[3])
	if (nType == 0) or (nType == nil) then
		aTimes = {180,180,180}
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRndEnd = 500
		if ACT4_SWITCH_DEBUFF[nZone][1] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_slow",50,aTimes[1],1)								-- �ƶ��ٶȽ��� 50%
		end
		if ACT4_SWITCH_DEBUFF[nZone][2] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_paralysis",100,aTimes[2],1)							-- ��ʱ���
		end
		if ACT4_SWITCH_DEBUFF[nZone][3] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_sleep",100,aTimes[3],1)								-- ��ʱ˯��
		end
	end
	PlayerIndex = nOldIndex
end

-- �������� ��ʯ
function ACT4_CreateSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 9 do
		local nType = ACT4_SWITCH_Table[nZone][i]
		local nSwitchIndex = CreateNpc("Ng��i V� h�nh2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[i][1], ACT4_SWITCH_POS[i][2])
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] + 1			-- �ۼƲ�ͬ�����������
		ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, i)
--		Msg2Player("CreateSwitch: "..nType.." - "..ACT4_SWITCH_Count[nZone][nType].." - "..ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]])
	end
end

-- �������� ��ʯ
function ACT4_RebrithSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	ACT4_SWITCH_Count[nZone][nType] = 3
	local aRS_Loc = {0,0,0}
	local nTempInt = 0
	for i=1, 9 do
		if ACT4_SWITCH_Table[nZone][i] == nType then
			nTempInt = nTempInt + 1
			aRS_Loc[nTempInt] = i
		end
	end
	for i=1, 3 do
		local nSwitch = ACT4_SWITCH_Index[nZone][nType][i]
		--local nLoc = ACT4_GetSwitchFlag(nSwitch)
		local nLoc = aRS_Loc[i]
		if nSwitch ~= 0 then
			MC_Del4Group(nSwitch, 0)
		end
--		Msg2Player("Create Switch: "..nType.." "..ACT4_SWITCH_Name[nType].." "..nLoc)
--		Msg2Player("Loc: "..nMapID.." "..ACT4_SWITCH_POS[nLoc][1].." "..ACT4_SWITCH_POS[nLoc][2])
		local nSwitchIndex = CreateNpc("Ng��i V� h�nh2", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[nLoc][1], ACT4_SWITCH_POS[nLoc][2])
		ACT4_SWITCH_Index[nZone][nType][i] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, nLoc)
	end
end

-- ȡ�� ��ʯ ������
function ACT4_GetSwitchType(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (nName == nil) or (nName == "<T� Thanh L� h��ng >") then 
		return 1
	elseif(nName == "<Thanh Lam L� h��ng >") then 
		return 2
	elseif(nName == "<T� Lam L� h��ng >") then 
		return 3
	end
	return 0
end

-- ȡ�� ��ʯ ��λ�ñ��
function ACT4_GetSwitchFlag(nIndex, nZone)
	return GetUnitCurStates(nIndex, 8)
end

-- �����ػ�ĳλ�õ���ʯ������NPC  ---�Ѿ�����
--function ACT4_CreateDefender(nFlag, nZone)
--	if nZone == nil then
--		nZone = TC_GetTeamZone()
--	end
--	local nMapID = GetWorldPos()
--	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
--	local nSoulIndex = CreateNpc("����"..nlevel, "����", nMapID, ACT4_SWITCH_POS[nFlag][1], ----ACT4_SWITCH_POS[nFlag][2])
--	MC_Add2Group(nSoulIndex)
--	for i=1, 4 do
--		local nDefenderIndex = CreateNpc("����������"..nlevel, "����������", nMapID, --ACT4_SWITCH_DEFENDER[nFlag][i][1], ACT4_SWITCH_DEFENDER[nFlag][i][2])
--		MC_Add2Group(nDefenderIndex)
--	end
--end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_GetSwordFlag(nIndex)
	return GetUnitCurStates(nIndex, 8)
end
function ACT5_Word2Num(nWN)
	if nWN == "Kim ki�m" then
		return 1
	elseif nWN == "M�c ki�m" then
		return 2
	elseif nWN == "Th�y ki�m" then
		return 3
	elseif nWN == "H�a Ki�m" then
		return 4
	elseif nWN == "Th� ki�m" then
		return 5
	elseif nWN == 1 then
		return "Kim ki�m"
	elseif nWN == 2 then
		return "M�c ki�m"
	elseif nWN == 3 then
		return "Th�y ki�m"
	elseif nWN == 4 then
		return "H�a Ki�m"
	elseif nWN == 5 then
		return "Th� ki�m"
	end
	return 0
end
function ACT5_GetDefFlag(nIndex, nZone)
	local nZone = TC_GetTeamZone()
	for i=1, 5 do
		if ACT5_PICKORDER_Table[nZone][i] == nIndex then
			return i
		end
	end
	return 0
end
function ACT5_CreateSword(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	local nOrder_Table = {1,2,3,4,5}
	local nSword_Name = {"Kim ki�m","M�c ki�m","Th�y ki�m","H�a Ki�m","Th� ki�m"}
	for i=1, 5 do
		local nTempRND = random(i, 5)
		local nTempEXC = nOrder_Table[nTempRND]
		nOrder_Table[nTempRND] = nOrder_Table[i]
		nOrder_Table[i] = nTempEXC
	end
--	Msg2Player(nOrder_Table[1].." "..nOrder_Table[2].." "..nOrder_Table[3].." "..nOrder_Table[4].." "..nOrder_Table[5])
	for i=1, 5 do
		local nOrderIndex = nOrder_Table[i]
		local nSwordIndex = CreateNpc("��i tho�i Ki�m ��i", nSword_Name[nOrderIndex], nMapID, ACT5_SWORD_PICKPOS[i][1], ACT5_SWORD_PICKPOS[i][2])
		SetNpcDeathScript(nSwordIndex, SF_FILE)
		MC_Add2Group(nSwordIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nSwordIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDesk(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 5 do
		local nDeskIndex = CreateNpc("Ng��i V� h�nh", "Ki�m ��i", nMapID, ACT5_SWORD_DROPPOS[i][1], ACT5_SWORD_DROPPOS[i][2])
		SetNpcDeathScript(nDeskIndex, SF_FILE)
		MC_Add2Group(nDeskIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nDeskIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDefender(nFlag, sEffc, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nSword_Name = {"Kim ki�m","M�c ki�m","Th�y ki�m","H�a Ki�m","Th� ki�m"}
	local nMapID = GetWorldPos()
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	if TC_STAGE_State[nZone] < 15 then
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(sEffc..nlevel, "B�o v� ng� h�nh", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][1][1], ACT5_SWORD_PICKDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("�� t� cao c�p"..nlevel, "�� t� s�n trang", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][i][1], ACT5_SWORD_PICKDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	else
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(nSword_Name[nFlag]..nlevel, "B�o v� ng� h�nh", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][1][1], ACT5_SWORD_DROPDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("�� t� cao c�p"..nlevel, "�� t� s�n trang", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][i][1], ACT5_SWORD_DROPDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_CalculatePath(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local PATH_Pointer = {}
	local TP_COMMON = {{1, 2, 3},{1, 3, 2},{2, 1, 3},{2, 3, 1},{3, 1, 2},{3, 2, 1}}
	local TP_START = {{3, 2, 1},{2, 3, 1},{3, 1, 2},{1, 3, 2}}
	local TP_END = {{1, 3, 2},{2, 3, 1},{3, 2, 1},{3, 1, 2}}
	local GroupPath = {{1, 2, 3},{1, 2, 3},{1, 2, 3},{1, 2, 3}}
	local GroupPathLink = {1, 2, 3, 4}
	local GroupStart = random(1, 4)
	GroupPathLink[GroupStart] = 1
	local GroupEnd = GroupPathLink[random(2, 4)]
	GroupPathLink = {1, 2, 3, 4}
	for i=1, 4 do
		local nTempRND = random(i, 4)
		local nTempEXC = GroupPathLink[nTempRND]
		GroupPathLink[nTempRND] = GroupPathLink[i]
		GroupPathLink[i] = nTempEXC
	end
	for i=1, 4 do
		if i == GroupStart then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_START[nTempRND][j]
			end
		elseif i == GroupEnd then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_END[nTempRND][j]
			end
		else
			local nTempRND = random(i, 6)
			for j=1, 3 do
				GroupPath[i][j] = TP_COMMON[nTempRND][j]
			end
		end	
	end
	local nCurGroup = 0
	local nPreGroup = 0
	local nNextGroup = 0
	local nTempINT = 0
	for i=1, 4 do
		for j=1, 4 do
			if i == GroupPathLink[j] then
				nCurGroup = j
			end
		end
		nPreGroup = nCurGroup - 1
		nNextGroup = nCurGroup + 1
		if nPreGroup == 0 then
			nPreGroup = 4
		end
		if nNextGroup == 5 then
			nNextGroup = 1
		end
		local nCurGroupIndex = (GroupPathLink[nCurGroup]-1)*3
		local nPreGroupIndex = (GroupPathLink[nPreGroup]-1)*3
		local nNextGroupIndex = (GroupPathLink[nNextGroup]-1)*3
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]] = nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]
		PATH_Pointer[nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]] = nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]
		PATH_Pointer[nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]
		if i == GroupStart then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 0
		elseif i == GroupEnd then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 17
		else
			local nBonusPos = 13 + nTempINT * 2
			nTempINT = nTempINT + 1
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = nBonusPos
			PATH_Pointer[nBonusPos] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
			PATH_Pointer[nBonusPos+1] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
		end
	end
	ACT8_PATH_Pointer[nZone] = {}
	for i=1, 16 do
		ACT8_PATH_Pointer[nZone][i] = PATH_Pointer[i]
--		if PATH_Pointer[i] == nil then
--			if i < 10 then
--				Msg2Player("#0"..i.." TARGET: nil")
--			else
--				Msg2Player("#"..i.." TARGET: nil")
--			end
--		else
--			if i < 10 then
--				Msg2Player("#0"..i.." TARGET: #"..ACT8_PATH_Pointer[nZone][i])
--			else
--				Msg2Player("#"..i.." TARGET: #"..ACT8_PATH_Pointer[nZone][i])
--			end
--		end
	end
end
function ACT8_GetSnEIndex(nMode)
	local nZone = TC_GetTeamZone()
	if nMode == nil then
		nMode = 0
	end
	for i=1,16 do
		if (nMode == 0) and (ACT8_PATH_Pointer[nZone][i] == 0) then
			return i
		elseif (nMode == 1) and (ACT8_PATH_Pointer[nZone][i] == 17) then
			return i
		end
	end
end
function ACT8_GetTPTIndex()
	m,x,y = GetWorldPos()
	for i=1, 16 do
		if MU_Distance(1,x,y,1,ACT8_PATH_PortIn[i][2],ACT8_PATH_PortIn[i][3]) < 6 then
			return i
		end
	end
	return 0
end
function ACT8_CreateLargeChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}
	local nMapID = GetWorldPos()
	for i=1, 10 do
		local nTempRND = random(i, 18)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
	end
	for i=1, 10 do
		local nChestIndex = CreateNpc("R��ng v�t ph�m-cao", "Ho�ng Kim b�o r��ng", nMapID, ACT8_CHEST_L_Pos[nRandomTable[i]][1], ACT8_CHEST_L_Pos[nRandomTable[i]][2])
		MC_Add2Group(nChestIndex)
	end
end
function ACT8_CreateSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
	local nMapID = GetWorldPos()
	if ACT8_CHEST_StoreIndex[nZone] == nil then
		ACT8_CHEST_StoreIndex[nZone] = {}
	end
	for i=1, 8 do
		local nTempRND = random(i, 16)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
		ACT8_CHEST_StoreIndex[nZone][i] = 0
	end
	for i=1, 8 do
		local nChestIndex = CreateNpc("R��ng v�t ph�m-trung", "R��ng b�c", nMapID, ACT8_CHEST_S_Pos[nRandomTable[i]][1], ACT8_CHEST_S_Pos[nRandomTable[i]][2])
		SetNpcLifeTime(nChestIndex, 300)
		ACT8_CHEST_StoreIndex[nZone][i] = nChestIndex
		MC_Add2Group(nChestIndex)
	end
end
function ACT8_DelSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	for i=1, 16 do
		if ACT8_CHEST_StoreIndex[nZone] ~= nil then
			if (ACT8_CHEST_StoreIndex[nZone][i] ~= 0) or (ACT8_CHEST_StoreIndex[nZone][i] ~= nil) then
				SetNpcLifeTime(ACT8_CHEST_StoreIndex[nZone][i], 0)
			end
		end
	end
end

function viet_0909_aword(nStage)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090918 and nDate < 091026 then
		if GetTask(GS_RECORD_CHANCE) <= 1 then return end;
		---�շѽ���
		local szLogTitle = "[Hoat dong trung thu 2009]";
		local nRetCode = 0;
		local nOldPlayer = PlayerIndex;
		if nStage == 1 then										--�����һ�ؿ�
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("��i hi�p nh�n 30 b�t m�");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] thu ���c 30 b�t m� th�t b�i, tr� l�i tr�= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 2 then 							--ͨ�ص�һ�ؿ�
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 30);			
					if nRetCode == 1 then
						Msg2Player("��i hi�p nh�n 30 b�t m�");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] thu ���c 30 b�t m� th�t b�i, tr� l�i tr�= "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		elseif nStage == 5 then 							--ͨ�ص��Ĺؿ�
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex > 0 then
					nRetCode = AddItem(2, 1, 30106, 60);			
					if nRetCode == 1 then
						Msg2Player("��i hi�p nh�n 60 b�t m�");
					else
						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Thu ���c 60 b�t m�, tr� l�i tr� = "..nRetCode);
					end
				end
			end
			PlayerIndex = nOldPlayer;
		end
	end
end

--09��8�²ؽ�������������
function add_award_ex_0908(nStage)
	if nStage <= 1 then--�����һ��û����
		return 0;
	end
	if nStage == 8 then
		nStage = 6;
	end
	if nStage == 9 then
		nStage = 7;
	end
	local nRand = random(1, GetTeamSize());
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then			
			if IsPlayerDeath() == 0 then
				local nRate = 1;
				local nLevel = floor(GetLevel() / 10);
				local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
				if nStage == 66 then nRate = 5 end
				if i == nRand and random(1, 100) <= nRate and GetLevel() >= 70 and (nStage == 6 or nStage == 66) then
					AddItem(2, 1, 30115, 1);--���ؽ���			
					Msg2Player("B�n nh�n ���c 1 T�ng Ki�m L�nh");							
					WriteLogEx("Tang Kiem", "nh�n", 1, "T�ng Ki�m L�nh");
				end
				--Modify by Trungbt
				if nNumVuotAi >= 2 then
					if nStage > 7 then
						local nExp_more = 5000000
						ModifyExp(nExp_more) --ph�n th��ng 5 tri�u khi v��t �i th�nh c�ng thu ph�
						Msg2Player("B�n nh�n ���c "..nExp_more.." �i�m kinh nghi�m");		
						Earn(390000)
					end
				end
				if nStage == 5 then
					gf_WriteLogEx("Tang Kiem", "tham gia v��t �i", 1, "S� l�n v��t �i 4 th�nh c�ng l�n"..nNumVuotAi.."_"..nLevel.."x")
				elseif nStage >= 7 then
					gf_WriteLogEx("Tang Kiem", "tham gia v��t �i", 1, "S� l�n v��t �i 7 th�nh c�ng l�n"..nNumVuotAi.."_"..nLevel.."x")
				end
			
				--
				if nLevel >= 5 then
					local nExp = 0;
					if nStage == 66 then
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nExp = tNEW_AWARD_EX_STAGE_7_2[nLevel];
						else
							nExp = tNEW_AWARD_EX_STAGE_7_NEW[nLevel];	
							Msg2Player("B�n ho�n th�nh xong �i 7 l�n mi�n ph�")						
						end
						-- nhi�m v� l�m gi�u
						if CFG_NhiemVuLamGiau == 1 then	
								if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 3) == 0 then
									gf_SetTaskBit(TSK_LAMGIAU, 3, 1, 0)
									TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Ho�n th�nh nhi�m v� t�ng ki�m.")
								end
						end
					else
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nExp = tNEW_AWARD_EX_2[nStage - 1][nLevel];
						else
							nExp = tNEW_AWARD_EX[nStage - 1][nLevel];
						end
					end
					ModifyExp(nExp);
					Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");					
					WriteLogEx("Tang Kiem", "nh�n", nExp, "�i�m kinh nghi�m");
				end
			end
		end
		--������������
		aw_cjsz_award(nStage);
	end
	PlayerIndex = nOldPlayer;
end

-- Mua anh H�ng Thi�p
function GS_ChangeAHL()
	if gf_Judge_Room_Weight(10,20)~= 1 or GetItemCount(2,1,30230) < 20 then
		Talk(1,"","B�n kh�ng c� 20 xu v�t ph�m ho�c h�nh trang b�n kh�ng �� � tr�ng , �� n�ng ")
		return	
	end
	if DelItem(2,1,30230,20) == 1 then
		gf_AddItemEx2({2,0,31,1}, "T�ng Ki�m Anh H�ng Thi�p", "Tang Kiem Son Trang", "nh�n")
	end
end

function get_Award7()
	-- do
		-- Talk(1,"","Chuc nang tam dong")
		-- return
	-- end

	if gf_Judge_Room_Weight(5,20)~= 1 then
		Talk(1,"","H�nh trang b�n kh�ng �� � tr�ng , �� n�ng ")
		return	
	end
	local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
	if nNumVuotAi == 7 then
		Earn(200000)
		-- AddItem(2,1,30230, 10, 4) --Xu v�t ph�m
		AddItem(2,0,398, 2,4) --B�t nh� l�n
		-- AddItem(2,1,30497, 10, 4) --Ma tinh
		local nExp_more2 = 1000000
		ModifyExp(nExp_more2) --ph�n th��ng 10 tri�u khi v��t �i th�nh c�ng thu ph�
		Msg2Player("B�n nh�n ���c "..nExp_more2.." �i�m kinh nghi�m");		
		gf_WriteLogEx("Tang Kiem", "nh�n th��ng th�nh c�ng", 1, "Ho�n th�nh 7 l�n")
		SetTask(GS_RECORD_CHANCE, 100) --settask cho kh�c gi� tr� 7, qua ng�y t� reset
		--=============== Chu�i nhi�m v� Ph�c Sinh 2 =============
		if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 22 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
		--====================================================
	else
		Talk(1,"","��i hi�p ch�a tham gia �� 7 l�n V��t �i T�ng Ki�m !!!!")
		return
	end
end