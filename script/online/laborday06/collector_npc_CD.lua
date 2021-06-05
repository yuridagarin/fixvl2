--File name:collector_npc_CD.lua
--Describe:�ɶ��۱�ի���˽ű�
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local selTab = {
			"��i l�y ph�n th��ng./handin",
			"L�m sao �� b�n v�t ph�m?/knowhow",
			"Xem n�i dung ho�t ��ng./#knowdetail(1)",
			"tra xem v�t li�u �� n�p./#queryinfor(1)",
			"Nh�n s�ch c�ng lao T� B�o Trai./#getbook(1)",
			"K�t th�c ��i tho�i/nothing",
			};
	local nState = Get_Laborday_State();
	if nState == 0 then
		Talk(1,"","Ho�t ��ng ch�a b�t ��u");
	elseif nState == 3 then
		Talk(1,"","Ho�t ��ng �� k�t th�c!");
	elseif nState == 2 then
		Talk(1,"","B�ng h�u �� n�p v�t li�u r�i m�, h�y mau ��n l�nh th��ng!");
	elseif nState == 1 then
		Say("Hi�n gi� b�n ti�m s�u t�m nh�ng v�t qu� gi� l�u truy�n trong giang h�, n�u b�ng h�u thu th�p ���c s� c� nh�ng ph�n th��ng tr�ng h�u.",getn(selTab),selTab);
	else
		Talk(1,"","Tr�ng th�i b� sai s�t, h�y li�n h� v�i b� ph�n qu�n l�");
		Write_Log("Ho�t ��ng t�t lao ��ng c� sai s�t","Ho�t ��ng sai s�t:"..nState);
	end
end;

function handin()
	local selTab = {
			"��ng �/confirm",
			"thuy�t minh ph�n th��ng./#knowrule(1)",
			"�� ta s�p x�p l�i./nothing",
			}
	local selTab2 = {
		"��ng �/confirm",
		"Ta v�n ch�a hi�u./knowmore",
		"thuy�t minh ph�n th��ng./#knowrule(1)",
		"Ta hi�u r�i!/donotnoteme",
		"�� ta s�p x�p l�i./nothing",
		}
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1);
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2);
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);
	local nTag = Get_Task_Byte(BIG_PRIZE,4);
	if nTag == 0 then
		local sContent = "Ch� �! B�ng h�u hi�n �� ";
		if GetThreePrize >= 3 then
			sContent = sContent.."<color=yellow>�� nh�n 3 l�n ph�n th��ng lo�i 3<color>,";
		end;
		if GetTwoPrize >= 1 then
			sContent = sContent.."<color=yellow>1 l�n ph�n th��ng lo�i 2<color>,";
		end;
		if GetOnePrize >= 1 then
			sContent = sContent.."<color=yellow>1 l�n ph�n th��ng lo�i 1<color>,";
		end;
		sContent = sContent.."cho d� c� n�p �� v�t thu th�p c�ng ch� nh�n ���c ph�n th��ng lo�i 4 (t�c gi�m 1 c�p). S� l��ng v�t ph�m hi�n t�i B�ng h�u �� n�p l�: <color=yellow>"..GetTask(ITEMNUM).."<color>. H�y ch�n lo�i ph�n th��ng. B�ng h�u c� ��ng � giao n�p s� l��ng v�t thu th�p trong h�nh trang kh�ng?";
		if GetOnePrize >= 1 or GetTwoPrize >= 3 or GetThreePrize >= 3 then
			Say(sContent,getn(selTab2),selTab2);
			return TRUE;
		end;
	end;
	Say("B�ng h�u c� ��ng � giao n�p to�n b� s� l��ng v�t thu th�p c� trong h�nh trang kh�ng? S� l��ng v�t li�u c�n thi�t xin h�y tra trong <color=yellow>S�ch c�ng lao T� B�o Trai<color>.",getn(selTab),selTab);
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
	Talk(1,"handin","Trong th�i gian di�n ra ho�t ��ng, ph�n th��ng lo�i 1 v� lo�i 2 ch� c� th� nh�n 1 l�n. Ph�n th��ng lo�i 3 t�i �a nh�n 3 l�n, ph�n th��ng kh�c m�i ng�y c� th� nh�n 3 l�n. N�u nh� s� l�n ��i l�y ph�n th��ng �� ��y, th� ��ng c�p ph�n th��ng s� gi�m 1 c�p. V� d�: n�u ng��i ch�i thu th�p 203 lo�i v�t ph�m, �� ��i ph�n th��ng lo�i 1, khi �y ch� c� th� ��i ph�n th��ng lo�i 2, n�u �� ��i l�y ph�n th��ng lo�i 2 th� ch� c� th� ��i l�y ph�n th��ng lo�i 3. N�u s� l�n ��i l�y ph�n th��ng lo�i 3 �� ��y th� ch� c� th� ��i l�y ph�n th��ng lo�i 4.");
end;
