--*************************
-- Cay bat nha lon / nho --
--*************************

Include("\\script\\lib\\lingshi_head.lua");
TREELIFETIME = 5*60;	--����������5����
PLANT_SMALL_TREE_LIMIT = 5;	--ÿ����С������������ -- 20101122
PLANT_BIG_TREE_LIMIT = 2;	--ÿ���ִ�������������

TASK_GET_AWARD_DATE = 418;	--��¼��ȡ����������
TASK_GET_AWARD_COUNT = 419;	--��¼������ȡ�����Ĵ���
TASK_TREEINDEX = 420;	--��¼����ֵ�����NPC����
TASK_TREEGROW = 421;	--��¼�������ɳ̶�
TASK_PLANTTIME = 422;	--��¼��������ʱ�䣬��λΪ��
TASK_GETSEEDCOUNT = 423;	--��¼��ҵ�������ӵĴ���
TASK_GETSEEDDATE = 424;	--��¼����ϴε����ӵ�����
TASK_GETSEEDHOUR = 425;	--��¼����ϴε����ӵľ���ʱ�䣨Сʱ��
TASK_TREEINDEX_SMALL = 426;	--��¼����ֵ�С����NPC����
TASK_TREEGROW_SMALL = 427;	--��¼С�������ɳ̶�
TASK_PLANTTIME_SMALL = 428;	--��¼����С����ʱ�䣬��λΪ��
TASK_PLAN_SMALLTREE_COUNT = 429	--��¼��ҵ�����С���Ĵ���
TASK_PLAN_SMALLTREE_DATE = 430	--��¼�������С��������
TASK_PLAN_BIGTREE_COUNT = 431	--��¼��ҵ����ִ����Ĵ���
TASK_PLAN_BIGTREE_DATE = 432	--��¼������´���������

TREETYPE = {	--ģ������NPC���֣����ʱ�䣬����¶ˮ
		{"M�m hoa h�ng","M�m c�y Th�i H� B�t Nh� ",45,1},
		{"M�m Hoa h�ng","M�m c�y Th�i H� B�t Nh� ",45,1},
		{" nh�nh hoa h�ng","C�y Th�i H� B�t Nh� nh� ",45,1},
		{"c�y �a M�t Hoa Qu� nh�","C�y Th�i H� B�t Nh� l�n ",45,1},
		{"c�y �a M�t Hoa Qu� trung","C�y hoa Th�i H� B�t Nh� ",45,2},
		{"c�y �a M�t Hoa Qu� l�n","C�y Th�i H� B�t Nh� ",45,2},
		};
SMALLTREETYPE = {	--ģ������NPC���֣����ʱ�䣬����¶ˮ
		{"M�m hoa h�ng","M�m c�y Th�i H� nh� ",120,1},
		{"M�m Hoa h�ng","M�m c�y Th�i H� nh� ",120,1},
		{" nh�nh hoa h�ng","C�y Th�i H� nh� ",120,1},
		}

function Create_Map_Trigger()
	local bCreateFailed = 0;	
	for i=1,5 do	
		Tid = 1107 + i
		Tidx = 3113 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--���������뿪������ͼ������
				bCreateFailed = 1	--ĳһ������������ʧ����
			end
		end;
	end;
	if bCreateFailed == 1 then
		WriteLog("[Ho�t ��ng Th�i H� Qu� Th� (K�t n�i th�t b�i)]:"..GetName().."K�t n�i server (3113~3118) th�t b�i.")
	end
end;

function checktime()
	local nHour = tonumber(date("%H"));
	if nHour == 13 or nHour == 17 or nHour == 21 then	--ֻ��13��17���21��������Сʱ�ڿ���
		return 1;
	else
		return 1;	--07��2��9�գ�IB��������Ϊ�κ�ʱ�䶼����
	end;
end;

function checkplace()	--�Ƿ���ָ���ص㡣�ɶ�����
	local nMapID = GetWorldPos();
	local nValidMapID = 0;
	local nValidMapID1 = 108;--���������ͼ��Ȫ�ݸ���
	if Check_YuanXiao08_Date() == 1 then
		nValidMapID = 504;
	else
		nValidMapID = 301;
	end;
	if nMapID == nValidMapID or nMapID == nValidMapID1 then
		return 1;
	else
		return 0;
	end;
end;

function checkplace_maincity()	--��С�����Ƿ���ָ���ص㣺�Ĵ�����
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 or (Check_YuanXiao08_Date() == 1 and nMapID == 500) then
		return 1;
	else
		return 0;
	end;
end;

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."Thi�n";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."h ";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.." ph�t ";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.." Gi�y ";
	end;
	return sTime;
end;
--�ж��ǲ����ڣ�����Ԫ���ڻ�ڼ�
function Check_YuanXiao08_Date()
	local nTime = tonumber(date("%Y%m%d%H"));
	if nTime >= 2008031200 and nTime <= 2008031623 then
		return 1;
	else
		return 0;
	end;
end;
--�����⽱����nTypeΪ1ʱ��С����Ϊ2ʱ�Ǵ���
function Give_YuanXiao_Award(nType)
	if Check_YuanXiao08_Date() ~= 1 then
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > GetTask(TASK_GET_AWARD_DATE) then
		SetTask(TASK_GET_AWARD_COUNT,0);
	end;
	local nTimes = GetTask(TASK_GET_AWARD_COUNT)+1;
	if nTimes <= 0 or nTimes > 4 then
		return 0;
	end;
	SetTask(TASK_GET_AWARD_COUNT,nTimes);
	SetTask(TASK_GET_AWARD_DATE,nDate);
	local tbPercent = {100,50,30,20};
	local tbLSCount = {};
	local nLevel = GetLevel();
	local nExpBase = 0;
	local nRand = 0;
	if nType == 1 then
		nExpBase = 200;
		tbLSCount = {4,3,2,1};
	elseif nType == 2 then
		nExpBase = 400;
		tbLSCount = {5,4,3,2};
	end;
	if nLevel >= 10 and nLevel <= 98 then
		local nExp = ((nExpBase*10000*nLevel^3)/(80^3))*(tbPercent[nTimes]/100);
		nRand = random(1,100);
		if nRand <= 5 then
			nExp = nExp*2;
			Msg2Global("Ch�c m�ng "..GetName().."Trong d�p T�t tr�ng c�y tham gia ho�t ��ng tr�ng c�y nh�n ���c ph�n th��ng g�p 2 l�n!");
		elseif nRand <= 7 then
			nExp = nExp*3;
			Msg2Global("Ch�c m�ng "..GetName().."Trong d�p T�t tr�ng c�y tham gia ho�t ��ng tr�ng c�y nh�n ���c ph�n th��ng g�p 3 l�n!");
		end;
		nExp = floor(nExp*0.8);	--�������0.8
		ModifyExp(nExp);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.." �i�m kinh nghi�m, ��y l� l�n ��i �i�m kinh nghi�m th� "..nTimes.." (l�n) nh�n th�m ph�n th��ng,m�i ng��i m�t ng�y ���c nh�n th�m ph�n th��ng 4 l�n");
		WriteLog("[08T�t tr�ng c�y]:"..GetName().."th�"..nTimes.." (l�n) nh�n th�m ph�n th��ng, tr� kinh nghi�m:"..nExp..". ��ng c�p ng��i ch�i:"..nLevel);
	elseif nLevel == 99 then	--99�����5��1��6���������ʯ
		local nLSLevel = 0;
		for i=1,tbLSCount[nTimes] do
			nLSLevel = random(1,6);
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B�n nh�n ���c 1 "..nLSLevel.." (c�p) Linh th�ch, �� cho v�o T� Linh ��nh");
		end;
		Msg2Player("H�m nay b�n ��ng th�"..nTimes.." (l�n) nh�n th�m ph�n th��ng,m�i ng��i m�t ng�y ���c nh�n th�m ph�n th��ng 4 l�n")
		WriteLog("[08T�t tr�ng c�y]:"..GetName().."th�"..nTimes.." (l�n) nh�n th�m ph�n th��ng, ���c"..tbLSCount[nTimes].." Linh th�ch");
	end;
end;

function nothing()

end;