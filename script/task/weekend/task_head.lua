--��ĩ�ͷ�ļ�
--created by lizhi
--2005-9-9 11:22

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");

TASK_IB_BOOK1 = 1737			-- ���������ʵ���
TASK_IB_BOOK2 = 1738			-- �������������ܣ���¼��Ч��ʼʱ��ͳ���ʱ��
TASK_WK_ISDISCONNECT = 1741;		--�ж�ɱ����ʱ�Ƿ����
TASK_WHICH_MAP = 1742;			--�жϽ������Ǹ���ͼ
TASK_GQ_DELIVER = 1750;         --�ͻ�����������
TASK_GQ_KILLWK_START = 1751;    --��¼�Ƿ���Խ�ɱ��������
TASK_GQ_KILLWK = 1752;          --ɱ�����������ڼ���
TASK_GQ_KILLWK_TIMES = 1753;	--��¼ɱ�˼������ܣ�ɱһ�ֿ��Ի�һ��boss�ٻ���
TASK_NPC_INDEX = 1754;          --���ڼ�¼call������NPC index
TASK_POINT = 1755;              --���ڼ�¼��ҵ�ǰ��"���׶�"
TASK_BOSS_INDEX = 1756;			--��¼��ǰ�ٻ����ǵڼ���boss
TASK_POINT_TIME = 1757;			--��¼���һ�����"���׶�"��ʱ�䣬��ֵ��һ���еĵڼ���
TASK_COOLDOWN = 1758;			--��¼ɱ�������Ժ�Ҫ����ʱ����ܽ�����һ��
TASK_240_TIMES = 1759;			--��¼һ��֮�ڻ�ȡ�����Ĵ���
TASK_240_DAYS = 1760;			--��¼�ϴλ�ȡ����������
TASK_POSITION = 1761;           --���ڼ�¼������꣬����1761,1762,1763
TASK_GET_ITEM_FLAG = 1770;		--���ڼ�¼����Ƿ���ȡ�˽���
TASK_ITEM = 1771;				--���ڼ�¼����ҵĶ�������TASK_ITEM��TASK_ITEM + 6

--------------------------------------------------------
--��¼�ͻ���·��
PATH_BJ2QZ = 1;
PATH_XY2YZ = 2;
PATH_YZ2XY = 3;
--------------------------------------------------------

MAXNUM_KILLWK = 50;
POINT_PER_MATERIALS = 1;	--ÿ�Ͻ�һ�����ϻ�1��
POINT_PER_ONCE_DELIVER = 25;	--����һ��
--------------------------------------------------------
szNpcScript = "\\script\\task\\WeekEnd\\boss_script.lua";
ErrorMsg = "Xin l�i! Ng��i kh�ng �i ��ng tuy�n ���ng, gi�p ��i T�ng chuy�n h�ng th�t b�i."

--ɱ���йֶ��������Ĳ����б�
material_table = {
    {2,0,307,"Kho�ng th�ch qu�n d�ng"},
    {2,0,308,"G� qu�n d�ng"},
    {2,0,309,"L�a m�ch qu�n d�ng"},
    {2,0,310,"Thu�c da qu�n d�ng"},
    {2,0,311,"T� t�m qu�n d�ng"},
    {2,0,312,"D��c th�o qu�n d�ng"},
    {2,0,313,"Linh huy�t qu�n d�ng"}
};

--��Ʒϵ�е����б�
finished_product_table = {
    {2,0,314,"Gi�o qu�n d�ng"},
    {2,0,315,"Ki�m d�i qu�n d�ng"},
    {2,0,316,"T�i t�n qu�n d�ng"},
    {2,0,317,"Kh�i gi�p qu�n d�ng"},
    {2,0,318,"Gi�y b�a qu�n d�ng"},
    {2,0,319,"Y d��c qu�n d�ng"},
    {2,0,320,"L��ng th�c qu�n d�ng"}
};

boss_drop_table = {
    {2,0,321},      --��һ������İ���ͼ�͵ڶ���һ��
    {2,0,321},
    {2,0,322},
    {2,0,323},
    {2,0,324},
    {2,0,325},
    {2,0,326},
    {2,0,327},
    {2,0,328}
};

--������
armament_table = {
    {2,0,329},  --����������
    {2,0,330},  --����ҽҩ��
    {2,0,331},  --����װ����
    {2,0,332}   --���ò�����
};

life_item_table = {
	{"Cu�c C�ng C�ng", 0, 200, 23},
	{"L�i Th�n �ao", 0, 200, 24},
	{"Cu�c Vi�m ��", 0, 200, 25},
	{"B�n C� ph�", 0, 200, 26},
	{"Ch�c N� thoa", 0, 200, 27},
	{"Cu�c Th�n N�ng", 0, 200, 28}
};

--��������ʱ���뾭���ĵ�ͼID��
--�꾩��Ȫ��
--�꾩���ϣ��ӻ��壬���ݣ���Ȫ�壬Ȫ�ݸ�����Ȫ��
--��ͼID�����table�����ӦΪ��¼�߹���ͼ���������
path_table_index = {201, 202, 150, 106, 108, 100};
path_table = {1730, 1731, 1732, 1733, 1734, 1735};

--�����ͼ����ʾ
map_message = {
	[1] = {},
	[2] = {},
	[3] = {}
}
map_message[1][201] = "�� v�o Nam Bi�n Kinh, xin chuy�n v�t t� ��n H�nh Hoa Th�n!";
map_message[1][202] = "�� v�o H�nh Hoa Th�n, xin chuy�n v�t t� ��n D��ng Ch�u!";
map_message[1][150] = "�� v�o D��ng Ch�u, xin chuy�n v�t t� ��n Long Tuy�n Th�n!";
map_message[1][106] = "�� v�o Long Tuy�n Th�n, xin chuy�n v�t t� ��n B�c Tuy�n Ch�u!";
map_message[1][108] = "�� v�o B�c Tuy�n Ch�u, xin chuy�n v�t t� ��n Tuy�n Ch�u!";
map_message[1][100] = "�� v�o Tuy�n Ch�u, xin chuy�n v�t t� ��n Ch� huy s�!";

map_message[2][218] = "�� v�o Linh B�o s�n, xin chuy�n v�t t� ��n Thi�u L�m!";
map_message[2][204] = "�� v�o Thi�u L�m, xin chuy�n v�t t� ��n T�y Bi�n Kinh!";
map_message[2][203] = "�� v�o T�y Bi�n Kinh, xin chuy�n v�t t� ��n Bi�n Kinh!";
map_message[2][200] = "�� v�o Bi�n Kinh, xin chuy�n v�t t� ��n Nam Bi�n Kinh!";
map_message[2][201] = "�� v�o Nam Bi�n Kinh, xin chuy�n v�t t� ��n H�nh Hoa Th�n!";
map_message[2][202] = "�� v�o H�nh Hoa Th�n, xin chuy�n v�t t� ��n D��ng Ch�u!";
map_message[2][150] = "�� v�o D��ng Ch�u, xin chuy�n v�t t� ��n Ch� huy s�!";

map_message[3][218] = "�� v�o Linh B�o s�n, xin chuy�n v�t t� ��n T��ng D��ng!";
map_message[3][204] = "�� v�o Thi�u L�m, xin chuy�n v�t t� ��n Linh B�o s�n!";
map_message[3][203] = "�� v�o T�y Bi�n Kinh, xin chuy�n v�t t� ��n Thi�u L�m!";
map_message[3][200] = "�� v�o Bi�n Kinh, xin chuy�n v�t t� ��n T�y Bi�n Kinh!";
map_message[3][201] = "�� v�o Nam Bi�n Kinh, xin chuy�n v�t t� ��n Bi�n Kinh!";
map_message[3][202] = "�� v�o H�nh Hoa Th�n, xin chuy�n v�t t� ��n Nam Bi�n Kinh!";
map_message[3][350] = "�� v�o T��ng D��ng, xin chuy�n v�t t� ��n Ch� huy s�!";

--��Ҫ������rect���ʹ������б�
--���ڵ����ݽṹ��ǰ�������ļ����ID�����Ǵ�������ID
rect_trigger_table = {
    {1400, 2001},
    {1401, 2002},
    {1402, 2003},
    {1403, 2004},
    {1404, 2005},
    {1405, 2006}
};

--�������ʵ�����������
--�鱦ɽ�����֣��꾩�������꾩���꾩���ϣ��ӻ��壬����
path_table_2_index = {218, 204, 203, 200, 201, 202, 150};
path_table_2 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--��Ҫ������rect���ʹ������б�
--���ڵ����ݽṹ��ǰ�������ļ����ID�����Ǵ�������ID
rect_trigger_table_2 = {
    {1430, 2001},
    {1431, 2002},
    {1432, 2003},
    {1433, 2004},
    {1434, 2005},
    {1435, 2006},
    {1436, 2007}
};

--�������ʴ����ݵ�����
--�ӻ��壬�꾩���ϣ��꾩���꾩���������֣��鱦ɽ������
path_table_3_index = {202, 201, 200, 203, 204, 218, 350};
path_table_3 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--��Ҫ������rect���ʹ������б�
--���ڵ����ݽṹ��ǰ�������ļ����ID�����Ǵ�������ID
rect_trigger_table_3 = {
    {1430, 2001},
    {1431, 2002},
    {1432, 2003},
    {1433, 2004},
    {1434, 2005},
    {1435, 2006},
    {1437, 2007}
};

--wk
rect_wk_table = {
    ["wk_20"] = {1420, 2003},
    ["wk_30"] = {1421, 2003},
    ["wk_40"] = {1422, 2003},
    ["wk_41"] = {1425, 2003},
    ["wk_50"] = {1423, 2003},
    ["wk_51"] = {1427, 2003},
    ["wk_60"] = {1424, 2003},
    ["wk_61"] = {1428, 2003},
    ["wk_70"] = {1429, 2003},
    ["wk_80"] = {1438, 2003}
};

log_wk_table = {400, 2004};

--boss
rect_boss_table = {
    {1426, 2015}    --����ͼ
};

log_boss_table = {401, 2016};
time_boss_table = {1001, 2017}

--ɱ���ʹ������б�
kill_trigger_table = {
    ["all"] = {1000, 2000}, --ɱ���йֶ�����ĳ����Ʒ�Ĵ�����
    ["wk_20"] = {1001, 2002},   --ɱ����
    ["wk_30"] = {1002, 2002},
    ["wk_40"] = {1003, 2002},
    ["wk_41"] = {1006, 2002},
    ["wk_50"] = {1004, 2002},
    ["wk_51"] = {1007, 2002},
    ["wk_60"] = {1005, 2002},
    ["wk_61"] = {1008, 2002},
    ["wk_70"] = {1009, 2002},
    ["wk_80"] = {1010, 2002}
};

--ʱ���ʹ������б�
time_trigger_table = {
    ["wk"] = {1000, 2001}   --ɱ���ܼ�ʱ
};

--��Ҵ���λ��
maps_table = {
    ["wk_20"] = {951, 1341, 2849},       --ɱ���ܵ�ͼ
    ["wk_30"] = {952, 1341, 2849},
    ["wk_40"] = {953, 1341, 2849},
    ["wk_41"] = {956, 1341, 2849},
    ["wk_50"] = {954, 1341, 2849},
    ["wk_51"] = {957, 1341, 2849},
    ["wk_60"] = {955, 1341, 2849},
    ["wk_61"] = {958, 1341, 2849},
    ["wk_70"] = {959, 1341, 2849},
    ["wk_80"] = {960, 1341, 2849},
};

--��¼û��bossˢ�µĵ�ͼ
no_boss_map_list = 
{
	100, 150, 200, 300, 350, 400
};

--callboss�ĵ�����boss��Ӧ��
boss_item_table = {
	[1] = {2,	0,	340},
	[2] = {2,	0,	341},
	[3] = {2,	0,	342},
	[4] = {2,	0,	343},
	[5] = {2,	0,	344},
	[6] = {2,	0,	345},
	[7] = {2,	0,	346},
	[8] = {2,	0,	347},
	[9] = {2,	0,	348}
};

--boss�����б�
boss_data_table = {
    [1] = {
        ["name"] = "V� s� �ng Qua",  --boss ����
        ["template"] = "V� s� �ng Qua",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [2] = {
        ["name"] = "V� s� ��c Di",  --boss ����
        ["template"] = "V� s� ��c Di",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [3] = {
        ["name"] = "V� s� Y ��t",  --boss ����
        ["template"] = "V� s� Y ��t",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [4] = {
        ["name"] = "V� s� b� l�c Ngao Hung",  --boss ����
        ["template"] = "V� s� Ngao ��ch",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [5] = {
        ["name"] = "V� s� Ng�c La",  --boss ����
        ["template"] = "V� s� Ng�c La",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [6] = {
        ["name"] = "V� s� Ph�p Lam",  --boss ����
        ["template"] = "V� s� Ph�p Lam",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [7] = {
        ["name"] = "V� s� Mai L�i",  --boss ����
        ["template"] = "V� s� Mai L�i",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [8] = {
        ["name"] = "V� s� Y B�n",  --boss ����
        ["template"] = "V� s� Y B�n",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    [9] = {
        ["name"] = "T�y Ma",          --boss ����
        ["template"] = "T�y Ma",  --boss ģ��
        ["script"] = "",            --boss �ű�
        ["index"] = 0,              --boss index
    },
    ["MAXCOUNT"] = 9
};

--�ƺŶ�Ӧ��
title_table = {
	{7200, 2, 10},		--������Ԫ˧
	{6000, 2, 9},		--�����󽫾�
	{4800, 2, 8},		--����ָ��ʹ
	{3600, 2, 7},		--��������
	{2400, 2, 6},		--����Ӣ��
	{1200, 2, 5},		--������Ӣ
	{600 , 2, 4},		--������ʿ
	{400 , 2, 3},		--�����ȷ�
	{200 , 2, 2},		--����Ů��
	{200 , 2, 1}		--������ʿ
};

--�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23��59��
function CheckTime(day)

	--�����
	if WEEKEND_SWITCH == 0 then
		return 0
	end;

	if day ~= GetWeekDay() then
		return 0
	end;
	
	local nBegin;
	local nEnd;
	if day == 0 then	--����������2��00 - ����10��00
		nBegin = 14 * 60;
		nEnd = 22 * 60;
	else
		nBegin = 19 * 60;	--��������������7��00������12��00
		nEnd = 24 * 60;
	end;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function InitBoss()
    --time trigger
    CreateTrigger(1, time_boss_table[1], time_boss_table[2]);
    ContinueTimer(GetTrigger(time_boss_table[2]));
    --��ʼ��boss��rect������
    CreateTrigger(2, rect_boss_table[1][1], rect_boss_table[1][2]);
    --logout
    CreateTrigger(3, log_boss_table[1], log_boss_table[2]);
    SetLogType(1);
end;

function CreateBoss(bossIndex, nMapId, nX, nY) --CreateBoss�����ر�����������boss������ʧ�ܷ���0
	InitBoss();
    local npcIndex = CreateNpc(
                        boss_data_table[bossIndex]["template"],
                        boss_data_table[bossIndex]["name"],
                        nMapId, nX, nY
                     );
    SetNpcScript(npcIndex, szNpcScript);
    SetNpcLifeTime(npcIndex, 600);		  --10����
    SetTask(TASK_NPC_INDEX, npcIndex);    --��¼�ٻ�������boss����
    SetTask(TASK_BOSS_INDEX, bossIndex);
    return npcIndex
end;


function CallBoss(bossIndex)
	
	if (CheckTime(0) == 0 and CheckTime(6) == 0) then	--����������Ҳ���������� 
		Msg2Player("Ho�t ��ng ch� m� th� 7 v� Ch� Nh�t");
		return
	end;

	if GetFightState() == 0 then
		Msg2Player("V� s� ngo�i t�c kh�ng xu�t hi�n � ��y");
		return
	end;

    local nMapId, nX, nY = GetWorldPos();
    if nMapId >= 700 then
		Msg2Player("V� s� ngo�i t�c kh�ng xu�t hi�n � ��y");
        return
    end;
    for index, value in no_boss_map_list do
        if nMapId == value then
        	Msg2Player("V� s� ngo�i t�c kh�ng xu�t hi�n � ��y");
        	return
        end;
    end;
    
    --�޸���������ʧ��ɵĲ����ٻ�boss�����
    if GetTask(TASK_NPC_INDEX) ~= 0 and GetTrigger(time_boss_table[2]) == 0 then
    	SetTask(TASK_NPC_INDEX, 0);
    end;
   	--ͬһʱ��ֻ���ٻ�һ��
	if GetTask(TASK_NPC_INDEX) ~= 0 then
		Msg2Player("��nh b�i v� s� ngo�i t�c �i!");
		return
	end;
	
	local IsEixst = DelItem(boss_item_table[bossIndex][1], boss_item_table[bossIndex][2], boss_item_table[bossIndex][3], 1);
	if IsEixst ~= 1 then
		return
	end;
	CreateBoss(bossIndex, nMapId, nX, nY);
	--�ɹ��ٻ�boss��ɾ������
	
	Msg2Player("V� s� ngo�i t�c �� xu�t hi�n, mau �i ��nh b�i ch�ng!");
	TaskTip("V� s� ngo�i t�c �� xu�t hi�n, mau �i ��nh b�i ch�ng!");
end;

--���ص�ǰ�Ǿ���2005��1��һ�ŵĵڼ���
function GetDay()
	local nYear = date("%Y");
	local nDay = tonumber(date("%j"));
	return nDay + (nYear - 2005) * 365
end;

function AddPlayerPoint(nPoint)	--����player�����ֵ
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	
	if (nTime - nLastTime) > 2 then		--����������ڱ䶯��
		local nVv = GetTask(TASK_POINT)
		SetTask(TASK_POINT, 0)
		if GetTask(TASK_IB_BOOK2) == 1 then	-- ���ʹ����ί����
			SetTask(TASK_POINT, nVv)
			SetTask(TASK_IB_BOOK2, 0)
		end
		
		if nPoint <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_POINT, GetTask(TASK_POINT) + nPoint);
	
	--������ҳƺ�
	n = GetTask(TASK_POINT);
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
end;

function RemoveAllTitle()
	for index, value in title_table do
		RemoveTitle(value[2], value[3]);
	end;
end;

function AddKillWkTimes(nTimes)
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--����������ڱ䶯��
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
		if nTimes <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_GQ_KILLWK_TIMES, GetTask(TASK_GQ_KILLWK_TIMES) + nTimes);
end;

function QueryTimes()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--����������ڱ䶯��
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
	end;
	return GetTask(TASK_GQ_KILLWK_TIMES);
end;

function QueryPoint()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	local nVv = GetTask(TASK_POINT)
	if (nTime - nLastTime) > 2 then		--����������ڱ䶯��
		nVv = 0
		if GetTask(TASK_IB_BOOK2) == 1 then
			nVv = GetTask(TASK_POINT)
		end
	end
	--������ҳƺ�
	n = nVv
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
	
	return nVv
end;

function SetLaskEnterTime()
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	local nCoolDown = nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec;
	SetTask(TASK_COOLDOWN, nCoolDown);
end;

function GetCooldownTime(nCDTime)
	local nTime = GetTask(TASK_COOLDOWN);
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	return nCDTime - (nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec - nTime)
end;

function Add240Times()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--����ͬһ�죬��0
		SetTask(TASK_240_DAYS, nNow);
	end;
	if GetTask(TASK_240_TIMES) >= 3 then
		return 0
	else
		SetTask(TASK_240_TIMES, GetTask(TASK_240_TIMES) + 1);
		return 1
	end;
end;

function Check240Time()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--����ͬһ�죬��0
	end;
end;

function is_exist(t)
    local nExist = 0;
    for index, value in t do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            nExist = 1;
            break
        end;
    end;
    return nExist
end;