--=============================================
--create by baiyun 2009.5.29
--describe:Խ�ϰ�7�·ݻ֮������
--=============================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

g_viet0908_event_title = "Hoat dong trong cay thang 8 (viet nam):";

TREE_TYPE = {									--ģ������NPC���֣����ָ���
				{"M�m hoa h�ng", "C�y H�o �a",  5, "C�y H�o �a"},
				{"M�m Hoa h�ng", "C�y B�t T�", 10, "C�y B�t T�"},
				{" nh�nh hoa h�ng", "C�y B�ch Ng�n", 80, "C�y B�ch Ng�n"},
				{"c�y �a M�t Hoa Qu� nh�", "C�y Ho�ng Kim", 4, "C�y Ho�ng Kim"},
				{"c�y �a M�t Hoa Qu� l�n", "C�y B�ch Kim", 1, "C�y B�ch Kim"},
			}
			
--TREE_TYPE = {									
--				{"M�m hoa h�ng", "C�y H�o �a",  5, "C�y H�o �a"},
--				{"Tr�ng D��ng hoa 1", "C�y B�t T�", 10, "C�y B�t T�"},
--				{"Tr�ng D��ng hoa 2", "C�y B�ch Ng�n", 80, "C�y B�ch Ng�n"},
--				{"Hoa h�ng v�ng", "C�y Ho�ng Kim", 4, "C�y Ho�ng Kim"},
--				{"Hoa h�ng ��", "C�y B�ch Kim", 1, "C�y B�ch Kim"},
--			}
			
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
					[400] = "��i L�",
					[500] = "Ph��ng T��ng"
				}

SMALLEST_TREE_REWARD_ITEM_PARAM = {
									{"��c C�", 300,2, 17, 2, 0*24*60*60,20,0},
									{"M�nh ��c C�", 50,2, 17, 3, 0*24*60*60,10,0},
									{"��c Y�u C�", 20, 2, 17, 4, 0*24*60*60,5,0},
									{"Huy�t C�", 300, 2, 17, 5, 0*24*60*60,20,0},
									{"Thi Huy�t C�", 50, 2, 17, 6, 0*24*60*60,10,0},
									{"Huy�t Tinh C�", 20, 2, 17, 7, 0*24*60*60,5,0},
									{"H��ng C�", 1500, 2, 17, 8, 0*24*60*60,20,0},
									{"M� H��ng C�", 200, 2, 17, 9, 0*24*60*60,10,0},
									{"�� H� C�", 20, 2, 17, 10, 0*24*60*60,5,0},
									{"Thi C�", 300, 2, 17, 11, 0*24*60*60,20,0},
									{"Tam Thi C�", 50,2, 17, 12, 0*24*60*60,10,0},
									{"Qu� V��ng C�", 20,2, 17, 13, 0*24*60*60,5,0},
									{"Y�u C�", 3800,2, 17, 14, 0*24*60*60,20,0},
									{"Th�c Y�u C�", 1000,2, 17, 15, 0*24*60*60,10,0},
									{"Y�u Ho�ng C�", 20,2, 17, 16, 0*24*60*60,5,0},
									{"T�m C�", 300, 2, 17, 17, 0*24*60*60,20,0},
									{"Th�c T�m C�", 50,2, 17, 18, 0*24*60*60,10,0},
									{"T�m S�t C�", 20,2, 17, 19, 0*24*60*60,5,0},
									{"Huy�n C�", 1000,2, 17, 20, 0*24*60*60,20,0},
									{"B�ng Huy�n C�", 50,2, 17, 21, 0*24*60*60,10,0},
									{"Vong Ti�n C�", 20,2, 17, 22, 0*24*60*60,5,0},
									{"T�m C�", 300,2, 17, 23, 0*24*60*60,20,0},
									{"Huy�t T�m C�", 50,2, 17, 24, 0*24*60*60,10,0},
									{"Kim T�m C�", 20,2, 17, 25, 0*24*60*60,5,0},
									{"Linh C�", 300,2, 17, 26, 0*24*60*60,20,0},
									{"Linh Lung C�", 50,2, 17, 27, 0*24*60*60,10,0},
									{"Th�t Th�i Ti�u Thi�n C�", 20,2, 17, 28,0*24*60*60,5,0},
									{"Ma C�", 100,2, 17, 29, 0*24*60*60,20,0},
									{"U �nh C�", 50,2, 17, 30, 0*24*60*60,10,0},
									{"V� �nh Ma C�", 20,2, 17, 31, 0*24*60*60,5,0},
	};

ETERNAL_TREE_REWARD_ITEM_PARAM = {
									{"��ng Ti�n V�ng", 160, 2,1,30094, 0, 1,0},									
									{"V�n Nh�n (ch�a gi�m ��nh)", 820, 2,1,375, 0, 1,0},
									{"H�a Tinh (ch�a gi�m ��nh)", 820, 2,1,376, 0, 1,0},
									{"Li�t Di�m (ch�a gi�m ��nh)", 820, 2,1,377, 0, 1,0},
									{"M�n Thi�n Hoa V� (ch�a gi�m ��nh)", 820, 2,1,378, 0, 1,0},
									{"C� ��nh (ch�a gi�m ��nh)", 820, 2,1,379, 0, 1,0},
									{"Hi Nh�n C�m (ch�a gi�m ��nh)", 820, 2,1,380, 0, 1,0},
									{"Th�n H�nh (ch�a gi�m ��nh)", 820, 2,1,381, 0, 1,0},
									{"A La H�n Tr��ng (ch�a gi�m ��nh)", 820, 2,1,382, 0, 1,0},
									{"��i H�o L�i Th��ng (ch�a gi�m ��nh)", 820, 2,1,383, 0, 1,0},
									{"Th�n Cung (ch�a gi�m ��nh)", 820, 2,1,384, 0, 1,0},
									{"M�nh H� (ch�a gi�m ��nh)", 820, 2,1,385, 0, 1,0},
									{"L�ng Phong (ch�a gi�m ��nh)", 820, 2,1,386, 0, 1,0}
	};
--�ƽ���������Ʒ����Ʒ�������ָ��ʣ������ͣ������ͣ���ϸ���ͣ�ʹ�����ޣ���������
GOLDEN_TREE_REWARD_ITEM_PARAM = {
									{"Ti�u Ki�p t�n", 5000, 2, 0, 141, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Th�n h�nh b� ph�", 2295, 0, 200, 39, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"Tu Ch�n Y�u Quy�t", 2500, 2, 0, 554, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"T� Kim H�ng Bao", 200, 2, 1, 537, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0},
									{"��i h�ng bao ho�ng kim", 5, 2, 1, 539, PLANT_TREE_REWARD_ITEM_TIME_LIMIT, 1,0}
	};

--�׽���������Ʒ����Ʒ�������ָ��ʣ������ͣ������ͣ���ϸ���ͣ�ʹ�����ޣ���������
WHITE_TREE_REWARD_ITEM_PARAM = {
									{"B� C�nh", 500, 0, 105, 13, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"H�t L�i B�c", 500, 0, 105, 12, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"X�ch Th�", 500, 0, 105, 9, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Tr�o Ho�ng Phi �i�n", 500, 0, 105, 11, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"Phi�u V�", 500, 0, 105, 15, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,1},
									{"B�n Long b�ch", 5499, 2, 1, 1000, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"V� Ng�n Th�y", 500, 2, 1, 503, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"S� tay s�ng", 700, 2, 19, 1, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Nh�n S�m V�n N�m", 699, 2, 1, 30071, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"T�y T�y linh ��n", 100, 2, 0, 137, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"B�o R��ng ��c Bi�t", 1, 2, 1, 30091, PLANT_TREE_REWARD_ITEM_TIME_LIMIT1, 1,0},
									{"Ng� H�nh M�t t�ch", 1, 0, 107, 155, 0, 1,0},
	};
	
--������������Ʒ����Ʒ�������ָ��ʣ������ͣ������ͣ���ϸ���ͣ�ʹ�����ޣ���������
SILVER_TREE_REWARD_ITEM_PARAM = {
									{"B�ng Th�ch", 6000, 2, 1, 149, 0*24*60*60, 1,0},
									{"Th� Th�n Ph�", 200, 2, 0, 556, 15*24*60*60, 1,0},
									{"B�t Nh� L�n", 190, 2, 0, 398, 15*24*60*60, 1,0},
									{"Th�i D�ch H�n Nguy�n C�ng ��", 10, 2, 0, 1082,  0*24*60*60, 1,0},
									{"Kh�ng tr�ng g�", 3600, 0, 0, 0, 0, 0, 0},
	};

--�������ľ��齱��������ֵ������
WHITE_SILVER_TREE_EXP_REWARD_PARAM = {
									{500000, 2500},
									{600000, 7000},
									{700000, 500}
};

--�ƽ����ľ��齱��������ֵ������
YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{2000000, 8000},
									{3000000, 1500},
									{4000000, 500}
};

--�׽����ľ��齱��������ֵ������
WHITE_GOLDEN_TREE_EXP_REWARD_PARAM = {
									{10000000, 5000},
									{15000000, 2500},
									{20000000, 2500}
};

SEED_AWARD_COUNT = {
									{"B�t Nh� Ch�ng Th�", 2, 1, 30114, 15 * 24 * 3600, 1,0},
									{"��u H�n", 2, 1, 1157, 15 * 24 * 3600, 1,0},									
									{"Qu�n C�ng Ch��ng", 2, 1, 9999, 15 * 24 * 3600, 1,0},
									{"Qu�n C�ng ��i", 2, 1, 9998, 15 * 24 * 3600, 1,0},
									{"T�ng Ki�m Anh H�ng Thi�p", 2, 0, 31, 7 * 24 * 3600, 1,0},
									
	};

	
-----------------------------------------------------------------------
--checkPlaceMainCity()
--����Ƿ���ָ���ص��������������ǣ��꾩���ɶ���Ȫ�ݡ���������������
-----------------------------------------------------------------------
function checkPlaceMainCity()	
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 150 or nMapID == 200 or nMapID == 300 or nMapID == 350 or nMapID == 400  or nMapID == 500 then
		return 1;
	else
		return 0;
	end
end

--function checkEventTime()		--���ʱ��00:00 �C 12:00 �͡�17:00 �C 00:00����ʱ���
--	local nHour = getLocalTime();
--	if nHour >= 12 and nHour < 17 then
--		return 0;
--	else
--		return 1;
--	end
--end

function checkEventDate()		--�������2009��04��24�ա�-- 2009��05��31��24��
                                        --�������2010��09��17�ա�-- 2009��10��24��24�� --10������֮����ƻ�
	local nDate = tonumber(date("%y%m%d%H"));
	if nDate >= 09091800 and nDate < 09102524 then
		return 1;
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
	local nRand = random(1, 10000);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end

function PlantTree_GetRandItem_new(ITEM_PARAM, nMax)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return 1;
end
