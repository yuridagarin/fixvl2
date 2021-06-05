--��ٽű�
--append by lizhi
--2005-10-14 22:52

Include("\\script\\global\\qingzhu_switch.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
Include("\\script\\online\\march08\\march08_head.lua");
Include("\\script\\online\\ngoahotanglong\\nhtl.lua");
Include("\\script\\online\\promotionhe\\vuihe.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\award\\traothuong3ty.lua")
Include("\\script\\voz\\xacthuc\\xacthuc.lua");
TASK_BUCHANG = 1781

compensate_taskID = 1225

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local SayTable = {};
	local nCount = 0;
-- Trao gi�i nh� 3 t�
	if nDate >= 20140318 and nDate <= 20140319 then
		tinsert(SayTable, "Trao gi�i nh� 3 t�/TraoThuong2Ty_Menu")
	end
--	if nDate >= 2010102900 and nDate <= 2010121524 and GetGlbValue(GLB_TSK_SERVER_ID) == 2 then
--		tinsert(SayTable, "Ta ��n nh�n th��ng bang h�i �o�t gi�i tu�n Cu�c Chi�n Hoa H�ng/GiveRoseWarWeeklyAward")		
--	end

	if nDate >= 20131227 and nDate <= 20131231 then
		tinsert(SayTable, "Nh�n ph�n th��ng vinh danh game th� tham gia ��i H�i Vi�t Trung/Viet_Trung_2013")	
	end
	tinsert(SayTable, "Nh�n ph�n th��ng ch�ng gi�c Man/RequestWeekEnd")	
	tinsert(SayTable, "K�t th�c ��i tho�i/no")
	local szXacThuc ="T�i kho�n c�a b�n ch�a x�c th�c";
	
	if CheckXacThuc() == 1 then
		szXacThuc="T�i kho�n c�a b�n �� x�c th�c";
	end
	Say("N�m m�i ��n ch��ng m�n Kim S�n quy�t ��nh ban ph�t m�t s� qu� �� m�i ng��i �n T�t vui v�!\n".. szXacThuc,
		getn(SayTable),
		SayTable
	);
end;
function Viet_Trung_2013()
	local nExtPoint = GetExtPoint(6)
	local nAccount = GetAccount()
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang c�a ng��i kh�ng ��!");
		return 0;
	end;
	if nExtPoint < 1 then
		Talk(1, "", "��i hi�p kh�ng c� t�n trong danh s�ch nh�n gi�i")
	end
	if nExtPoint > 1 then
		Talk(1, "", "��i hi�p �� nh�n gi�i r�i !!!!!")
	end
	if nExtPoint == 1 then
		if nAccount == "duyxitin123" then
			AddItem(1,6,150,300,4)
			WriteLogEx("NHAN THUONG GIAI DAU VT", "nh�n th��ng th�nh c�ng ", 1, "�� nh�n ph�")
		end
		AddItem(0,105,10108,1,4,-1,-1,-1,-1,-1,-1);
		WriteLogEx("NHAN THUONG GIAI DAU VT", "nh�n th��ng th�nh c�ng ", 1, "�� nh�n th��ng")
		VNG_AddExtPoint(6,2)
	else
		WriteLogEx("NHAN THUONG GIAI DAU VT", "nh�n th��ng th�nh c�ng ", 1, "�� x�y ra l�i kh�ng nh�n th��ng ���c")
	end
end

tTongList = {
					{"�heroic",2,1},
}

tTongAward = {
		[1] = {
					[1] = {60000000,3},
					[2] = {50000000,2},
					[3] = {40000000,1},
					[4] = {30000000,0},
					[5] = {20000000,0},
					[6] = {15000000,0},
				},
				
		[2] = {
					[1] = {30000000,1},
					[2] = {25000000,0},
					[3] = {20000000,0},
					[4] = {15000000,0},
					[5] = {10000000,0},
					[6] = {7500000,  0},		
				},
}

function GiveRoseWarWeeklyAward()
	local szTong = GetTongName() or  ""
	local nCheck = 0
	for i=1,getn(tTongList) do
		if szTong == tTongList[i][1] and GetGlbValue(GLB_TSK_SERVER_ID) == tTongList[i][2] then
			nCheck = i
			break		
		end	
	end	
	if nCheck <= 0 then
		Talk(1,"","C�c h� kh�ng thu�c danh s�ch bang h�i �o�t gi�i th��ng tu�n n�y!")
		return
	end	
	if GetLevel() < 73 then
		Talk(1,"","��ng c�p 73 tr� l�n m�i ���c nh�n th��ng!")
		return
	end
	if GetTask(TASK_ROSE_WAR) == 1 then
		Talk(1,"","C�c h� �� nh�n th��ng tu�n n�y!")
		return
	end	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  7 then
		Talk(1,"","Th�i gian gia nh�p c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng tu�n n�y!")
		return 0
	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng tu�n n�y!")
		return 0
	end
	if gf_JudgeRoomWeight(4,100," ") == 0 then
		return		
	end
	local nLevel = IsTongMember()
	local nAwardType = tTongList[nCheck][3]
	SetTask(TASK_ROSE_WAR,1)
	ModifyExp(tTongAward[nAwardType][nLevel][1])
	if tTongAward[nAwardType][nLevel][2] > 0 then
		AddItem(2,0,1084,tTongAward[nAwardType][nLevel][2])
		Msg2Player("B�n nh�n ���c "..tTongAward[nAwardType][nLevel][2].." Thi�n Qu�i Th�ch.")
		WriteLogEx("Cuoc Chien Hoa Hong","nh�n th��ng bang h�i",tTongAward[nAwardType][nLevel][2],"Thi�n Qu�i Th�ch")
	end
	Say("Ch�c m�ng b�n �� nh�n th��ng th�nh c�ng!",0)
	Msg2Player("B�n nh�n ���c "..tTongAward[nAwardType][nLevel][1].." �i�m kinh nghi�m")	
	WriteLogEx("Cuoc Chien Hoa Hong","nh�n th��ng bang h�i",tTongAward[nAwardType][nLevel][1],"�i�m kinh nghi�m")
end

tRole ={
}

function CheckRole(szName)
	for i=1,getn(tRole) do
		if tRole[i][2] == szName then
			return i
		end
	end
	return 0
end

function RequestBHTA()
	local nDate = tonumber(date("%Y%m%d"))	
	if nDate >= 20100507 and nDate <= 20100509 then				
		local nExtVal = GetExtPoint(6)
		if nExtVal ~= 1 then
			Say("C�c h� kh�ng c� trong danh s�ch tr�ng th��ng ho�c �� nh�n th��ng r�i!",0)
			return
		end			
		if GetFreeItemRoom() < 2  then
			Say("H�nh trang c�a c�c h� kh�ng �� � tr�ng. H�y s�p x�p l�i!",0)
			return
		end		
		if GetMaxItemWeight() - GetCurItemWeight() < 200 then
			Say("H�nh trang c�a c�c h� qu� n�ng. H�y s�p x�p l�i!",0)
			return
		end	
		if nExtVal == 1 then
			PayExtPoint(6,nExtVal)
		end	
	end
end

function no()
end;
--*********************070516����������***********************
function Requestcompensate()
	if GetTask(compensate_taskID) == 70516 then
		Talk(1,"","Ng��i �� nh�n th��ng 1 l�n r�i. ��ng tham lam th�!")
		return
	end
	local playerlevel = GetLevel()
	local exp_num = (playerlevel * playerlevel * playerlevel * playerlevel  / 4) +( GetPlayerGoldCoin() * 100)
	if exp_num < 10000 then
		exp_num = 10000
	elseif exp_num > 500000000 then
		exp_num = 500000000
	end
	ModifyExp(exp_num)
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_num.." �i�m kinh nghi�m!")
	ModifyReputation(200,0)
	SetTask(336,(GetTask(336) + 100))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 100 �i�m c�ng hi�n s� m�n!")
	SetTask(compensate_taskID,70516)
	local jun_gong = GetTask(701)
	local jun_gong_song = (jun_gong+1000)
	local jun_gong_liao = (jun_gong-1000)
	Say("Ng��i c� th� nh�n ���c <color=yellow>1000<color> �i�m qu�n c�ng. Mu�n ch�n qu�n c�ng b�n n�o?",
	2,
	"Ta mu�n t�ng qu�n c�ng phe T�ng/#SetTask(701,"..jun_gong_song..")",
	"Ta mu�n t�ng qu�n c�ng phe Li�u/#SetTask(701,"..jun_gong_liao..")"
	)
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1000 �i�m qu�n c�ng!")
	WriteLog("B�i th��ng: 70516"..GetName().."Nh�n ���c b�i th��ng, �i�m kinh nghi�m l�:"..exp_num)
end
function RequestWeekEnd()

local szSay = {
			"��i T�ng s� ghi nh� c�ng tr�ng ��nh �u�i gi�c Man c�a <sex>, gi� mu�n xem m�c g�?",
			"Ta mu�n nh�n th� lao/get_award",
			"Ta mu�n xem c�ng lao/query_offer"};
			
	if CheckTime(5) == 1 or CheckTime(6) == 1 or CheckTime(0) == 1 then	--��ĩ��ʱ����л
		SelectSay(szSay);
	else
		Talk(1,"","Xin l�i! Trong th�i gian di�n ra ho�t ��ng m�i c� th� nh�n th��ng!");
	end;
end;
--���׽��ʺ�
function RequestSuperAccountAward()
	local selTab = {
				"Ta mu�n nh�n ph�n th��ng Si�u b�ch kim/get_sa_bag_award",
				"Ta mu�n nh�n ph�n th��ng t�ng c�p/get_sa_uplevel_award",
				"L�m th� n�o �� c� t�i kho�n nh�n ph�n th��ng?/know_super_account",
				"Ta kh�ng ph�i l� ch� nh�n c�a t�i kho�n/no",
				}
	Say("Ng��i mu�n ph�n th��ng n�o?",getn(selTab),selTab);
end;

function know_super_account()
	Talk(2,"RequestSuperAccountAward","<color=yellow>T� 15/04-15/07<color>, ng��i ch�i c� th� tham gia nhi�u ho�t ��ng �� nh�n ph�n th��ng Si�u b�ch kim. T� <color=yellow>15/04-15/07<color> tham gia nhi�u ho�t ��ng �� nh�n ph�n th��ng gi� tr�. Tham kh�o website <color=yellow>volam2.zing.vn<color>","Khi ��t ��n c�p 40 v� 70 nh� ��n ch� ta �� nh�n ph�n th��ng t�ng c�p. M�i 1 t�i kho�n ch� nh�n ph�n th��ng 1 l�n. Ch�c ch�i vui v�!");
end;

function get_sa_bag_award()
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","Phi�n b�ng h�u bu�i s�ng t� <color=yellow>7:00-11:00<color> ��n nh�n th��ng nh�!");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate < 2007041512 then
		Talk(1,"RequestSuperAccountAward","Xin c�c v� <color=yellow>sau 12:00 tr�a ng�y 15/04 4<color> l�i ��n nh�n th��ng nh�!");
		return 0;
	end;
	if nDate >= 2007081523 then
		Talk(1,"RequestSuperAccountAward","Xin l�i �� qu� th�i gian nh�n qu� Si�u B�ch Kim, th�i gian nh�n th��ng l�: <color=yellow>15/04/2007 ��n 15/08/2007<color>.");
		return 0;
	end;
	local nExtPt = GetExtPoint(4);
	if is_super_account() == 0 then
		Talk(1,"RequestSuperAccountAward","Xin l�i, ng��i kh�ng ph�i l� ch� nh�n c�a t�i kho�n n�y!");
		return 0;
	end;
	if nExtPt ~= 0 then
		Talk(1,"RequestSuperAccountAward","Ng��i �� nh�n qu� Si�u B�ch Kim, <color=yellow>m�i m�t t�i kho�n ch� c� th� nh�n ���c 1 l�n<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang c�a ng��i kh�ng ��.");
		return 0;
	end;
	WriteLog("[L� bao b�ch kim]:"..GetName().."Nh�n qu� Si�u B�ch Kim");
	AddExtPoint(4,1);	--��extpoint4��Ϊ1
end;

function get_sa_uplevel_award()
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","Phi�n b�ng h�u bu�i s�ng t� <color=yellow>7:00-11:00 gi�<color> ��n nh�n qu� nh�!");
		return 0;
	end;
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"RequestSuperAccountAward","Ng��i ph�i <color=yellow>gia nh�p l�u ph�i<color> m�i c� th� nh�n ph�n th��ng t�ng c�p.");
		return 0;
	end;
	if GetTask(501) == 0 then
		Talk(1,"RequestSuperAccountAward","Nh�n ph�n th��ng <color=yellow>Si�u B�ch Kim<color> tr��c, sau �� nh�n <color=yellow>ph�n th��ng t�ng c�p<color>.");
		return 0;
	end;
	local nExtPt = GetExtPoint(4);
	if is_super_account() == 0 then
		Talk(1,"RequestSuperAccountAward","Xin l�i, ng��i kh�ng ph�i l� ch� nh�n c�a t�i kho�n n�y!");
		return 0;
	end;
	local nLevel = GetLevel()
	if nLevel < 40 then
		Talk(1,"RequestSuperAccountAward","Ng��i ch�a ��t <color=yellow>c�p 40<color>, ��i ��n c�p 40 m�i c� th� nh�n ph�n th��ng l� <color=yellow>b� trang ph�c s� m�n s� c�p<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(6,500) == 0 then
		Talk(1,"RequestSuperAccountAward","Kho�ng tr�ng trong h�nh trang c�a ng��i kh�ng ��!");
		return 0;
	end;
	local nTaskValue = GetTask(502);
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	if nTaskValue < 40 and nLevel < 70 then
		SetTask(502,40);
		Add_Faction_Equipment(nRoute,nBody,40,4);
		Msg2Player("B�n nh�n ���c b� trang ph�c s� m�n s� c�p");
		WriteLog("[L� bao b�ch kim]:"..GetName().."nh�n trang ph�c s� m�n c�p 40");
	elseif nTaskValue <= 40 then
		if nLevel < 70 then
			Talk(1,"","Ng��i ch�a ��t <color=yellow>c�p 70<color>. ��i ��n c�p 70 m�i c� th� nh�n ph�n th��ng <color=yellow>500 �i�m c�ng hi�n, 1 b�o r��ng v� trang ph�c s� m�n cao c�p t��ng �ng<color>.");
		else
			SetTask(502,70);
			SetTask(336,GetTask(336)+500)
			Msg2Player("B�n nh�n ���c 500 �i�m c�ng hi�n s� m�n");
			AddItem(2,0,606,1);
			Msg2Player("B�n nh�n ���c 1 b�o r��ng");
			Add_Faction_Equipment(nRoute,nBody,63,4);
			Msg2Player("B�n nh�n ���c 1 trang ph�c s� m�n cao c�p");
			WriteLog("[L� bao b�ch kim]:"..GetName().."Nh�n ���c trang ph�c s� m�n c�p 60");
		end;
	elseif nTaskValue == 70 then
		Talk(1,"RequestSuperAccountAward","Xin l�i, ng��i �� nh�n h�t ph�n th��ng t�ng c�p r�i, kh�ng th� nh�n th�m n�a.");
	end;
end;

tAwardInfo = 	--extpointfunc.lua�ű�����Ҳ����Ӧ�ı�
{			--��Ʒ��		�������  ��Чʱ��
	[1] =  {"C�y B�t Nh�",			1,7*24*3600,	{2,0,398}},
	[2] =  {"Th�n N�ng ��n",			2,7*24*3600,	{2,1,343}},
	[3] =  {"C�u chuy�n h�i h�n ��n",		3,30*24*3600,	{1,0,32}},
	[4] =  {"Th�n h�nh b� ph�",			4,30*24*3600,	{0,200,39}},
	[5] =  {"T� nh�",			6,7*24*3600,	{2,1,1069}},
	[6] =  {"Bao l�n-gi�m ��nh ph� c�p 7",	10,7*24*3600,	{2,1,1058}},
	[7] =  {"��ng V�",				20,30*24*3600,	{0,105,20}},
	[8] =  {"Th�n h�nh b�o �i�n",			40,90*24*3600,	{0,200,40}},
	[9] =  {"H�a Th� B�ch",			80,7*24*3600,	{2,1,1001}},
	[10] = {"H�i Minh L�nh B�i",			100,7*24*3600,	{2,0,125}},
	[11] = {"N�ng Tang ph�",			200,7*24*3600,	{2,1,1056}},
	[12] = {"Thi�n Th�ch linh th�ch",			400,7*24*3600,	{2,1,1068}},
	[13] = {"Chi�n Th�n ho�n",			1000,7*24*3600,	{2,1,1005}},
	[14] = {"T�i chi�n giang h�-��i l� bao",	2000,7*24*3600,	{2,1,1105}},
	[15] = {"T�i chi�n giang h�-H�o hoa l� bao",	10000,7*24*3600,{2,1,1106}},
	[16] = {"T�i chi�n giang h�-Ch� t�n l� bao",	20000,7*24*3600,{2,1,1107}},
}

function RequestChongZhiAward()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate < 2007051712 then
		Talk(1,"","Ho�t ��ng v�n ch�a ch�nh th�c b�t ��u, <color=yellow>Sau 12 gi� tr�a 17/5<color> quay l�i t�m ta!");
		return 0;
	end;
	local selTab = {
				format("Ta mu�n d�ng �i�m t�ch l�y ��i ph�n th��ng/#list_chongzhi_award(%d,%d)",1,getn(tAwardInfo)),
				"Ta mu�n xem thuy�t minh ho�t ��ng/chong_zhi_introduce",
				"Kh�ng c� vi�c g�/no",
				}
	Say("Hoan ngh�nh anh h�ng tham gia ho�t ��ng l�n n�y",getn(selTab),selTab);
end;

function chong_zhi_introduce()
	Talk(1,"RequestChongZhiAward","Ho�t ��ng T�m c�u chi�n h�u t� 12 gi� 17/5 ch�nh th�c b�t ��u, hoan ngh�nh c�c b�n ��n ch� ta t�m chi�n h�u ho�c k�o nhi�u b�ng h�u ��n, ch� c�n h� n�p th� v� b�n xem b�n nh� ng��i gi�i thi�u, c�n c� v�o s� l��ng th� h� n�p b�n s� nh�n �i�m t�ch l�y t��ng �ng, ��i c�c ph�n th��ng. Th�i gian n�p th� l�: <color=yellow>12 gi� 17/5/2007 ��n 12 gi� 17/6/2007, th�i gian ch�m d�t nh�n ph�n th��ng l�: 24h 15/7/2007<color>. Chi ti�t xin xem trang ch�.");
end;

function get_chongzhi_award_list()
	local tSelTab = {};
	for i=1,getn(tAwardInfo) do
		tinsert(tSelTab,format(tAwardInfo[i][1].."(c�n %d �i�m t�ch l�y)/#give_chongzhi_award(%d)",tAwardInfo[i][2],i));
	end;
	return tSelTab;
end;

function list_chongzhi_award(nPageNum,nCount)
	local tList = get_chongzhi_award_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr��c \n /#list_chongzhi_award(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_chongzhi_award(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ph�n h�i/main");
	tinsert(selTab,"�� ta ngh� l�i/no");
	local nCurPt = GetExtPoint(6);
	Say("Ng��i hi�n c� <color=yellow>"..nCurPt.."<color> �i�m t�ch l�y, mu�n ��i ph�n th��ng g�?",getn(selTab),selTab);
end;

function give_chongzhi_award(nAwardIdx)
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","<color=green>L� quan<color>: M�i b�n �� nh�n l� v�t t� <color=yellow>7 gi� s�ng ��n 11 gi� tr�a<color>");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang c�a ng��i kh�ng ��.");
		return 0;
	end;
	local nCurPt = GetExtPoint(6);
	local nNeedPt = tAwardInfo[nAwardIdx][2];
	if nCurPt < nNeedPt then
		Talk(1,"RequestChongZhiAward","Th�t ��ng ti�c, �i�m t�ch l�y c�a ng��i kh�ng ��!");
		return 0;
	end;
	SetTaskTemp(16,nAwardIdx);
	WriteLog("[�i�m n�p th� ��i ph�n th��ng]:"..GetName().."�i�m t�ch ph�n hi�n t�i l�"..nCurPt..", hi�n t�i mu�n d�ng"..nNeedPt.."�i�m t�ch l�y ��i"..nAwardIdx.."ph�n th��ng");
	PayExtPoint(6,nNeedPt);
end;

function is_super_account()
	local szAccount = GetAccount();
	if strlen(szAccount) < 4 then
		return 0;
	end;
	local cChar1 = strsub(szAccount,1,1);
	local cChar2 = strsub(szAccount,2,2);
	local cChar3 = strsub(szAccount,3,3);
	local cChar4 = strsub(szAccount,4,4);
	if (cChar1 == "K" or cChar1 == "k") and (cChar2 == "S" or cChar2 == "s") then
		if ((cChar3 == "Q" or cChar3 == "q") and (cChar4 == "D" or cChar4 == "d")) or
			((cChar3 == "J" or cChar3 == "j") and (cChar4 == "X" or cChar4 == "x")) or 
			((cChar3 == "W" or cChar3 == "w") and (cChar4 == "Z" or cChar4 == "z")) or
			((cChar3 == "G" or cChar3 == "g") and (cChar4 == "W" or cChar4 == "w")) then
				return 1;
		else
			return 0;
		end;
	else
		return 0;
	end;
end;

function GiveLuckyAward_201009()
	if gf_GetExtPointBit(2, 1) == 0 then
		Talk(1,"","��ng ti�c l� ng��i kh�ng tr�ng th��ng ho�c �� nh�n th��ng r�i n�n kh�ng th� nh�n ti�p!")
		return
	end 
	if gf_SetExtPointBit(2, 1, 0) == 1 then
		gf_AddItemEx2({2, 1, 1068, 1}, "Thi�n Th�ch linh th�ch", "Nhan thuong may man thang 9 nam 2010", "nh�n", 30 * 24 * 3600)
		Msg2Player("Nh�n ���c 1 Thi�n Th�ch Linh Th�ch")
	end
end