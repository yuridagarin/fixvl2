--File name:collector_npc_CD.lua
--Describe:�꾩�۱�ի���˽ű�
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20090107 then
		Talk(1,"","<color=green>Nh� bu�n T� B�o Trai: <color>Ho�t ��ng �� k�t th�c.");
		return 0;
	end
	local selTab = {
			"��i l�y ph�n th��ng./handin",
			"L�m sao �� b�n v�t ph�m?/knowhow",
			"Xem n�i dung ho�t ��ng./#knowdetail(1)",
			"tra xem v�t li�u �� n�p./#queryinfor(1)",
			"Nh�n s�ch c�ng lao T� B�o Trai./#getbook(1)",
			"K�t th�c ��i tho�i/nothing",
			};
--	local nState = Get_Laborday_State();
--	if nState == 0 then
--		Talk(1,"","<color=green>�۱�ի���ˣ�<color>���û��ʼ�ء�");
--	elseif nState == 3 then
--		Talk(1,"","<color=green>�۱�ի���ˣ�<color>��Ѿ������ˡ�");
--	elseif nState == 2 then
--		Talk(1,"","<color=green>�۱�ի���ˣ�<color>�����Ѿ������Ͻ������ˣ���쵽�콱�����ﻻ�����ɡ�");
--	elseif nState == 1 then
		Say("<color=green>Nh� bu�n T� B�o Trai: <color>B�n ti�m s� thu nh�ng th� thu th�p ���c tr�n giang h�, ng��i c� th� giao v�t thu th�p cho ta �� ��i �i�m.",getn(selTab),selTab);
--	else
--		Talk(1,"","״̬��������ϵGM��");
--		Write_Log("��һ�����","����״̬��������״̬Ϊ"..nState);
--	end
end;

function handin()
	local selTab = {
			"��ng �/confirm",
			"Thuy�t minh vi�c ��i v�t ph�m/#knowrule(1)",
			"�� ta s�p x�p l�i./nothing",
			}
	local selTab2 = {
		"��ng �/confirm",
		"Ta v�n ch�a hi�u./knowmore",
		"Thuy�t minh vi�c ��i v�t ph�m/#knowrule(1)",
--		"֪���ˣ��Ժ���Ҫ����������/donotnoteme",
		"�� ta s�p x�p l�i./nothing",
		}
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
	local nPrizeNum = 0;
	local nTotalNum = 0;
	local nTag = Get_Task_Byte(BIG_PRIZE,4);
	for i=1,getn(tPrizeJifen) do
		nTotalNum = nTotalNum+tPrizeJifen[i][1];
	end
	nPrizeNum = GetOnePrize+GetTwoPrize+GetThreePrize+GetFourPrize+GetFivePrize+GetSixPrize+GetSevenPrize+GetEightPrize+GetNightPrize+GetTenPrize;
	if nPrizeNum >= nTotalNum then
		Talk(1,"","<color=green>Nh� bu�n T� B�o Trai<color>: Tu�n n�y ng��i �� ��i t�t c� ph�n th��ng, tu�n sau l�i ��n.");
		return
	elseif nPrizeNum == 0 then
		Say("B�ng h�u c� ��ng � giao n�p to�n b� s� l��ng v�t thu th�p c� trong h�nh trang kh�ng? S� l��ng v�t li�u c�n thi�t xin h�y tra trong <color=yellow>S�ch c�ng lao T� B�o Trai<color>.",getn(selTab),selTab);
	else
		local sContent = "<color=green>Nh� bu�n T� B�o Trai<color>: Ch� �, tu�n n�y ng��i �� ��i ";
		if GetOnePrize >= tPrizeJifen[1][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 1 "..tPrizeJifen[1][1].." l�n<color>,";
		end;		
		if GetTwoPrize >= tPrizeJifen[2][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 2 "..tPrizeJifen[2][1].." l�n<color>,";
		end;
		if GetThreePrize >= tPrizeJifen[3][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 3"..tPrizeJifen[3][1].." l�n<color>,";
		end;			
		if GetFourPrize >= tPrizeJifen[4][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 4"..tPrizeJifen[4][1].." l�n<color>,";
		end;
		if GetFivePrize >= tPrizeJifen[5][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 5"..tPrizeJifen[5][1].." l�n<color>,";
		end;
		if GetSixPrize >= tPrizeJifen[6][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 6"..tPrizeJifen[6][1].." l�n<color>,";
		end;
		if GetSevenPrize >= tPrizeJifen[7][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 7"..tPrizeJifen[7][1].." l�n<color>,";
		end;
		if GetEightPrize >= tPrizeJifen[8][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 8"..tPrizeJifen[8][1].." l�n<color>,";
		end;
		if GetNightPrize >= tPrizeJifen[9][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 9"..tPrizeJifen[9][1].." l�n<color>,";
		end;
		if GetTenPrize >= tPrizeJifen[10][1] then
			sContent = sContent.."<color=yellow>Ph�n th��ng lo�i 10"..tPrizeJifen[10][1].." l�n<color>,";
		end;	
		sContent = sContent.."Tu�n n�y b�n kh�ng th� nh�n ph�n th��ng n�y n�a, ch� c� th� nh�n ph�n th��ng kh�c. S� l��ng v�t ph�m b�n �� n�p l� <color=yellow>"..GetTask(ITEMNUM).."<color>. H�y ch�n lo�i ph�n th��ng. B�ng h�u c� ��ng � giao n�p s� l��ng v�t thu th�p trong h�nh trang kh�ng?";
		Say(sContent,getn(selTab2),selTab2);
	end;
end;

function donotnoteme()
	Set_Task_Byte(BIG_PRIZE,4,1);
	main();
end;

function confirm()
	local nHandInNum = 0;
	for i=1,g_TotalItemNum do
		if Hand_In_Item(i) == TRUE then
			nHandInNum = nHandInNum + 1;
			Msg2Player("�� n�p s� hi�u l�:"..i.."v�t ph�m: "..ItemTab[i][5]);
		end;
	end;
	if nHandInNum == 0 then
		Talk(1,"","L�n n�y b�ng h�u v�n ch�a n�p v�t ph�m n�o c�, h�y x�c nh�n c� �� v�t li�u v� ch�a n�p qua v�t ph�m n�y.");
		return FALSE;
	else
		Talk(1,"","L�n n�y t�ng c�ng �� n�p <color=yellow>"..nHandInNum.."<color> lo�i v�t thu th�p, h�y tra xem tin t�c h� th�ng �� bi�t th�m chi ti�t.");
		Write_Log("N�p v�t ph�m.","�� n�p"..nHandInNum.."lo�i v�t ph�m");
		return TRUE;
	end;		
end;

function knowhow()
	Talk(1,"main","B�ng h�u ch� c�n �� v�t mu�n n�p trong h�nh trang, ta s� gi�p s�p x�p l�i. N�u s� l��ng kh�ng �� ta s� kh�ng l�y!");
end;

function knowmore()
	Talk(1,"handin","Trong th�i gian di�n ra ho�t ��ng, ph�n th��ng lo�i 1 v� lo�i 2 ch� c� th� nh�n 1 l�n. Ph�n th��ng lo�i 3 t�i �a nh�n 3 l�n, ph�n th��ng kh�c m�i ng�y c� th� nh�n 3 l�n. N�u nh� s� l�n ��i ph�n th��ng �� ��y, th� ��ng c�p ph�n th��ng s� gi�m 1 c�p. V� d�: n�u ng��i ch�i thu th�p 203 lo�i v�t ph�m, �� ��i ph�n th��ng lo�i 1, khi �y ch� c� th� ��i ph�n th��ng lo�i 2, n�u �� ��i ph�n th��ng lo�i 2 th� ch� c� th� ��i ph�n th��ng lo�i 3. N�u s� l�n ��i ph�n th��ng lo�i 3 �� ��y th� ch� c� th� ��i ph�n th��ng lo�i 4");
end;
