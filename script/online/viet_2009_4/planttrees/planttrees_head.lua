Include("\\script\\lib\\writelog.lua")

--=============================================
--create by baiyun 2009.4.9
--describe:Խ�ϰ�4�·������
--=============================================

PLANT_TREE_LIMIT = 24;					--ÿ���������������
PLANT_TREE_INTERVAL = 2 * 60;		--�������������ļ��
PLANT_TREE_ROLE_LEVEL_LIMIT = 10;					--���������Ľ�ɫ�ȼ�����
PLANT_TREE_REWARD_ITEM_TIME_LIMIT = 7 * 24 * 60 * 60; --������Ʒ��ʹ������

--ʹ�õ��������
TASK_TREE_INDEX       = 2132;				--��¼����ֵ�����NPC����
TASK_TREE_GROW        = 2133;				--��¼�������ɳ̶�
TASK_WATER_TREE_TIME  = 2134;				--��¼������ˮ��ʱ��㣬�����»�δ��ˮʱ��Ϊ���µ�ʱ��
TASK_PLANT_TREE_COUNT = 2135;		    --��¼��ҵ��������Ĵ���
TASK_PLANT_TREE_DATE  = 2136;				--��¼���������������
TASK_PLANT_TREE_TIME  = 2137;				--��¼����ϴ�������ʱ��,(ÿ����������Ҫ���´�ֵ,��������������������)
TASK_PLANT_TREE_TYPE  = 2138;				--������������ 1 - 5


TREE_TYPE = {									--ģ������NPC���֣����ָ���
				{"M�m hoa h�ng", "C�y H�o �a",  9},
				{"M�m Hoa h�ng", "C�y B�t T�", 16},
				{" nh�nh hoa h�ng", "C�y B�ch Ng�n", 70},
				{"c�y �a M�t Hoa Qu� nh�", "C�y Ho�ng Kim", 4},
				{"c�y �a M�t Hoa Qu� l�n", "C�y B�ch Kim", 1},
			}
			
--�������ԣ��ɳ��ȣ����ʱ�䣬 �������������ʱ���ٹ����������Խ�ˮ�� ����¶ˮ
--�ڵ����׶�Ϊ��ȡ����
TREE_PARAM = {
				{1, 90, 45, 1},
				{2, 130, 90, 1},
				{3, 170, 130, 1},
				{4, 210, 170, 1},
				{5, 240, 210, 1},
				{6, 300, 240, 1},
}

--��������ID
CITY_NAME_ID =
				{
					[100] = "Tuy�n Ch�u",
					[150] = "D��ng Ch�u",
					[200] = "Bi�n Kinh",
					[300] = "Th�nh ��",
					[350] = "T��ng D��ng",
					[400] = "��i L�"
				}

--�ƽ���������Ʒ����Ʒ�������ָ��ʣ������ͣ������ͣ���ϸ���ͣ�ʹ�����ޣ���������
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Ti�u Ki�p t�n", 50, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Th�n h�nh b� ph�", 10, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tu Ch�n Y�u Quy�t", 40, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};

--�׽���������Ʒ����Ʒ�������ָ��ʣ������ͣ������ͣ���ϸ���ͣ�ʹ�����ޣ���������
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"B� C�nh", 5, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"H�t L�i B�c", 5, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"X�ch Th�", 5, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Tr�o Ho�ng Phi �i�n", 5, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"Phi�u V�", 5, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"B�n Long b�ch", 10, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"V� Ng�n Th�y", 5, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"S� tay s�ng", 5, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"B�ng Lai Ti�n ��n", 50, 2, 1, 1013, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1},
									{"T�y T�y linh ��n", 5, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1}
	};
--�������ľ��齱��������ֵ������
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{200000, 50},
									{250000, 25},
									{300000, 25}
};

--�ƽ����ľ��齱��������ֵ������
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{1000000, 80},
									{1500000, 15},
									{2000000, 5}
};

--�׽����ľ��齱��������ֵ������
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{5000000, 50},
									{7500000, 25},
									{10000000, 25}
};
	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--����Ƿ���ָ���ص��������������ǣ��꾩���ɶ���Ȫ�ݡ���������������
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400 then
		return 1;
	else
		return 0;
	end
end

function checkEventTime()		--���ʱ��00:00 �C 12:00 �͡�17:00 �C 00:00����ʱ���
	local nHour = getLocalTime();
	if nHour >= 12 and nHour < 17 then
		return 0;
	else
		return 1;
	end
end

function checkEventDate()		--�������2009��04��24�ա�-- 2009��05��24��24��
	if getCurYear() ~= 2009 then
		return 0;
	end
	if getCurMonth() == 4 then
		if getCurDate() >= 24 then
			return 1;
		end
	end
	if getCurMonth() == 5 then
		if getCurDate() <= 31 then
			return 1;
		end
	end
	return 0;
end

function getLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function getCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function getCurMonth()
	nMonth = date("%m");
	return tonumber(nMonth);
end

function getCurYear()
	nYear = date("%Y");
	return tonumber(nYear);
end

function getDateTimeString(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond / (60 * 60 * 24));
	nHour = floor(mod(nSecond / (60 * 60),  24));
	nMin = floor(mod(nSecond / 60 , 60));
	nSec = mod(nSecond , 60);
	if nDay > 0 then
		sTime = sTime..nDay.."Thi�n";
	end
	if nHour > 0 then
		sTime = sTime .. nHour .. "h ";
	end
	if nMin > 0 then
		sTime = sTime .. nMin .. " ph�t ";
	end
	if nSec >= 0 then
		sTime = sTime .. nSec .. " Gi�y ";
	end
	return sTime;
end

function doNothing()
end

--------------------------------------
--JQ_GetRandItem()
--ȡ�������Ʒ
--------------------------------------
function PlantTree_GetRandItem(ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 100);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end