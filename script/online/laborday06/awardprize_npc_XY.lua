--File name:awardprize_npc_XY.lua
--Describe:�����۱�ի�ƹ�ű�
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

g_nJifenMax = 200;

function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20090107 then
		Talk(1,"","Ho�t ��ng �� k�t th�c!");
		return 0;
	end
	local selTab = {
				"��i �i�m t�ch l�y/askforaward",
				"Thuy�t minh vi�c ��i �i�m/#knowrule(2)",
				"tra xem n�i dung ho�t ��ng./#knowdetail(2)",
				"tra xem v�t li�u �� n�p./#queryinfor(2)",
				"Nh�n s�ch c�ng lao T� B�o Trai./#getbook(2)",
				"K�t th�c ��i tho�i/nothing",
				};
--	local nState = Get_Laborday_State();
--	if nState == 0 then
--		Talk(1,"","<color=green>�۱�ի�ƹ�<color>���û��ʼ�ء�");
--	elseif nState == 3 then
--		Talk(1,"","<color=green>�۱�ի�ƹ�<color>��Ѿ�������Ŷ��");
--	elseif nState == 2 or nState == 1 then
		Say("Hi�n gi� b�n ti�m s�u t�m nh�ng v�t qu� gi� l�u truy�n trong giang h�, n�u b�ng h�u thu th�p ���c, s� c� nh�ng ph�n th��ng tr�ng h�u.",getn(selTab),selTab);
--	else
--		Talk(1,"","<color=red>[ϵͳ]:<color>״̬��������ϵGM��");
--		Write_Log("��һ�����","����״̬��������״̬Ϊ"..nState);
--	end;
end;

function askforaward()	--ѯ��Ҫ��Ҫ�ý�
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_LABORDAY_WEEK) < nWeek then
		SetTask(TSK_LABORDAY_WEEK,nWeek);
		Set_Task_Byte(GET_PRIZE,2,0);
		Set_Task_Byte(GET_PRIZE,3,0);
		Set_Task_Byte(GET_PRIZE,4,0);
		Set_Task_Byte(GET_PRIZE2,1,0);
		Set_Task_Byte(GET_PRIZE2,2,0);
		Set_Task_Byte(GET_PRIZE2,3,0);
		Set_Task_Byte(GET_PRIZE2,4,0);
		Set_Task_Byte(BIG_PRIZE,1,0);
		Set_Task_Byte(BIG_PRIZE,2,0);
		Set_Task_Byte(BIG_PRIZE,3,0);
	end 
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1); --1
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2); --2
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);--3
	local GetFourPrize = Get_Task_Byte(GET_PRIZE,2); --4
	local GetFivePrize = Get_Task_Byte(GET_PRIZE,3); --5
	local GetSixPrize = Get_Task_Byte(GET_PRIZE,4); --6
	local GetSevenPrize = Get_Task_Byte(GET_PRIZE2,1); --7
	local GetEightPrize = Get_Task_Byte(GET_PRIZE2,2); --8
	local GetNightPrize = Get_Task_Byte(GET_PRIZE2,3); --9
	local GetTenPrize = Get_Task_Byte(GET_PRIZE2,4); --10
	
	local nPrizeType;
	local nItemNum = GetTask(ITEMNUM);
	local nPrizeNum = 0;
	local nTotalNum = 0;
	for i=1,getn(tPrizeJifen) do
		nTotalNum = nTotalNum+tPrizeJifen[i][1];
	end
	nPrizeNum = GetOnePrize+GetTwoPrize+GetThreePrize+GetFourPrize+GetFivePrize+GetSixPrize+GetSevenPrize+GetEightPrize+GetNightPrize+GetTenPrize;	
	if nItemNum < 7 then	
		Talk(1,"","S� l��ng v�n ch�a ��, h�y thu th�p ti�p r�i quay l�i l�nh th��ng.");
		return FALSE;
	elseif nItemNum >= 7 and nItemNum < 17 then
		nPrizeType = 1;
	elseif nItemNum >= 17 and nItemNum < 31 then
		nPrizeType = 2;
	elseif nItemNum >= 31 and nItemNum < 60 then
		nPrizeType = 3;
	elseif nItemNum >= 60 and nItemNum < 90 then
		nPrizeType = 4;
	elseif nItemNum >= 90 and nItemNum < 106 then
		nPrizeType = 5;
	elseif nItemNum >= 106 and nItemNum < 125 then
		nPrizeType = 6;
	elseif nItemNum >= 125 and nItemNum < 144 then
		nPrizeType = 7;
	elseif nItemNum >= 144 and nItemNum < 185 then
		nPrizeType = 8;
	elseif nItemNum >= 185 and nItemNum < 203 then
		nPrizeType = 9;
	elseif nItemNum == 203 then
		nPrizeType = 10;
	else
		Talk(1,"","[h� th�ng]: s� li�u b� sai, xin li�n h� v�i GM.");
		Write_Log("Ho�t ��ng t�t lao ��ng c� sai s�t","s� l��ng thu th�p sai:"..nItemNum);
	end;
	if nPrizeNum >= nTotalNum then
		Talk(1,"","<color=green>�ng ch� T� B�o Trai<color>: Tu�n n�y ng��i �� ��i ph�n th��ng, tu�n sau h�n ��n.");
		return
	else	
		if nPrizeType == 10 and GetOnePrize >= tPrizeJifen[1][1] then
			nPrizeType = 9;
		end;
		if nPrizeType == 9 and GetTwoPrize >= tPrizeJifen[2][1] then
			nPrizeType = 8;
		end;
		if nPrizeType == 8 and GetThreePrize >= tPrizeJifen[3][1] then
			nPrizeType = 7;
		end;
		if nPrizeType == 7 and GetFourPrize >= tPrizeJifen[4][1] then
			nPrizeType = 6;
		end;
		if nPrizeType == 6 and GetFivePrize >= tPrizeJifen[5][1] then
			nPrizeType = 5;
		end;
		if nPrizeType == 5 and GetSixPrize >= tPrizeJifen[6][1] then
			nPrizeType = 4;
		end;
		if nPrizeType == 4 and GetSevenPrize >= tPrizeJifen[7][1] then
			nPrizeType = 3;
		end;
		if nPrizeType == 3 and GetEightPrize >= tPrizeJifen[8][1] then
			nPrizeType = 2;
		end;
		if nPrizeType == 2 and GetNightPrize >= tPrizeJifen[9][1] then
			nPrizeType = 1;
		end;
		if nPrizeType == 1 and GetTenPrize >= tPrizeJifen[10][1] then
			Talk(1,"","<color=green>�ng ch� T� B�o Trai<color>: S� l��ng v�t ph�m ng��i giao kh�ng th� ��i th�m ph�n th��ng, h�y xem ch� th�ch li�n quan.");
			return
		end;				
	end
	local selTab = {
			"Ta mu�n ��i ph�n th��ng n�y./#getjifen("..nPrizeType..")",
			"Ta mu�n tra xem ph�n th��ng./#knowrule(2)",
			"Th�i, �� l�n sau./nothing",
			};
	Say("Hi�n gi� �� thu th�p <color=yellow>"..nItemNum.."<color> lo�i v�t ph�m, b�ng h�u c� th� ��i l�y <color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng: <color=yellow>"..tPrizeJifen[11-nPrizeType][2].." �i�m<color>. Sau khi ��i ph�n th��ng, s� l��ng v�t ph�m �� giao s� b� x�a, ng��i c� th� b�t ��u giao l�i. Ng��i x�c nh�n mu�n ��i ph�n th��ng ch�?",getn(selTab),selTab);
end;

function getaward(nPrizeType)	--NPC����
	local nDate = tonumber(date("%d"));	--����п�����ǰһ���ѯ�ʶԻ��򣬵��ڽ�����콱�������������Щ����Ļ������п��ܵ�������ڽ���ֻ��һ�ξͲ�����������
	if Get_Task_Byte(GET_PRIZE,1) ~= nDate then
		SetTask(GET_PRIZE,0);
		SetTask(GET_PRIZE2,0);
	end;
	if nPrizeType <= 7 then
		if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= 3 then
			Talk(1,"","M�i ng�y ng��i ch�i ch� ��i 3 <color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng.");
			return FALSE;
		end;
	end;
	local nItemNum = GetTask(ITEMNUM);
	Write_Log("��i ph�n th��ng t�t lao ��ng","Ta mu�n s� d�ng"..nItemNum.." v�t thu th�p ��i ph�n th��ng");
	local nGetNum = Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]);
	Set_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2],nGetNum+1);	--��¼�����ȡ�����������1�ֽڼ�¼��ȡ���ڣ�2�ֽڼ�¼��ȡ����
	Set_Task_Byte(GET_PRIZE,1,nDate);
	Clear_HandIn_State();
	giveprize(nPrizeType);
end;

function getjifen(nPrizeType)
	if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= tPrizeJifen[11-nPrizeType][1] then
		Talk(1,"","<color=green>�ng ch� T� B�o Trai: <color>M�i ng��i m�i tu�n ch� c� th� ��i "..tPrizeJifen[11-nPrizeType][1].." l�n<color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng.");
		return FALSE;
	end;
	Set_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2],Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2])+1);
	SetTask(1351,GetTask(1351)+tPrizeJifen[11-nPrizeType][2]);
	if GetTask(1351) > g_nJifenMax then
		SetTask(1351,g_nJifenMax);
		Msg2Player("B�n nh�n ���c "..tPrizeJifen[11-nPrizeType][2].." �i�m");
		Msg2Player("�i�m c�a ng��i �� ��t ��n "..g_nJifenMax.." �i�m, m�i ng��i nhi�u nh�t c� th� t�ch l�y "..g_nJifenMax.." �i�m.");
	else	
		Msg2Player("B�n nh�n ���c "..tPrizeJifen[11-nPrizeType][2].." �i�m");
	end
	Clear_HandIn_State();
end