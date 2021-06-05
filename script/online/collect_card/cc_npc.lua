Include("\\script\\lib\\talktmp.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")

CC_TITLE = format("M�n ph�i m�i �� s�p ra m�t r�i, c�c ch� v� ��i hi�p �� l�a ch�n gia nh�p v�o m�n ph�i n�o hay ch�a? Nhanh nhanh ��n thu th�p Th� K� N�ng M�n Ph�i M�i, nh�n ph�n th��ng nh�. %d c�p tr� l�n �� gia nh�p m�n ph�i v� h�c h�t to�n b� k� n�ng c�p 55 th� c� th� tham gia",CC_PLAYER_LEVEL_MIN);

CC_MAIN_DIALOG = {
	"Gi�i thi�u ho�t ��ng/cc_introduce",	
	"Ki�n th�c v�n ��p/cc_knowledge",
	"Giao n�p Th� T�/cc_reveive_award",
}

function cc_introduce()
	local strTitle = "Th� T� ph�n bi�t l� Th� L�i T�, Th� L�c Hoa Quy�t, Th� Linh Mi�u V�n, k�nh ch�c c�c ��i hi�p c� nh�ng tr�i nghi�m vui v�.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		{"Ch�ng lo�i v� ngu�n g�c Th� T�", "cc_introduce_card"},
		{"T�c d�ng Th� T�", "cc_card_uesd"},
		{"Khi�u chi�n BOSS hoang d�", "cc_fight_boss"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_introduce_card()
	local strTitle = "Th� T� ph�n bi�t l� Th� L�i T�, Th� L�c Hoa Quy�t, Th� Linh Mi�u V�n, k�nh ch�c c�c ��i hi�p c� nh�ng tr�i nghi�m vui v�.";
	local strInfo = "\nCh�ng lo�i Th� T�: Th� L�i T�, Th� L�c Hoa Quy�t, Th� Linh Mi�u V�n \n Ngu�n g�c Th� T�: Ch� � tham gia chi�n tr��ng Thi�n M�n Tr�n, L��ng S�n, V�n Ki�m Tr�ng, Th�ng Thi�n Huy�n C�nh, ��p �n v�n �� v� tham gia khi�u chi�n BOSS hoang d� ��u c� th� nh�n ���c Th� T�.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Tr� l�i trang tr��c", "cc_introduce"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_card_uesd()
	local strTitle = "Th� T� ph�n bi�t l� Th� L�i T�, Th� L�c Hoa Quy�t, Th� Linh Mi�u V�n, k�nh ch�c c�c ��i hi�p c� nh�ng tr�i nghi�m vui v�.";
	local strInfo = "\nT�c d�ng: Thu th�p �� nh�m Th� T� t��ng �ng s� ��i ���c ph�n th��ng t��ng �ng, nh�n ph�i v�o Th� L�i T� s� nh�n ���c ph�n th��ng kinh nghi�m, giao n�p t� h�p thΑTh� L�i T� + Th� L�c Hoa Quy�t� v�  t� h�p th� �Th� L�i T� + Th� Linh Mi�u V�n� s� c� c� h�i nh�n ���c ph�n th��ng l� bao.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Tr� l�i trang tr��c", "cc_introduce"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_fight_boss()
	local strTitle = "Th� T� ph�n bi�t l�: Th� L�i T�, Th� L�c Hoa Quy�t, Th� Linh Mi�u V�n, k�nh ch�c c�c ��i hi�p c� nh�ng tr�i nghi�m vui v�.";
	local strInfo = format("\nTh�i gian xu�t hi�n BOSS: quy t�c ph�n th��ng m�i ng�y %s\n ti�u di�t boss: ng��i ch�i ti�u di�t boss sau c�ng s� nh�n ���c 1 t�m th� 'Linh Mi�u V�n', t�t c� nh�n v�t  sau khi k�ch s�t boss c� th� nh�n chu�t v�o b�o r��ng nh�n ph�n th��ng, b�o r��ng s� xu�t hi�n trong v�ng 10 ph�t sau �� s� bi�n m�t.", "8:30;12:30;17:30;22:30");
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Tr� l�i trang tr��c", "cc_introduce"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end


function cc_knowledge()
	local strTitle = "C�c ��i hi�p ��ng qu�n xem quy t�c tr� l�i nh�, ch�c c�c ��i hi�p ho�n th�nh ��p �n.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		{"Quy t�c ��p �n", "cc_knowledge_info"},
		{"Ph�n th��ng ��p �n", "cc_knowledge_award"},
		{"B�t ��u ��p �n", "cc_knowledge_start"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_info()
	local strTitle = "C�c ��i hi�p ��ng qu�n xem quy t�c tr� l�i nh�, ch�c c�c ��i hi�p ho�n th�nh ��p �n.";
	local strInfo = "\nQuy t�c: M�i m�t nh�n v�t 1 ng�y nhi�u nh�t ch� ���c tr� l�i 3 v�n ��, ch� c�n tr� l�i ���c c�u h�i th� s� nh�n ���c ph�n th��ng."
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Tr� l�i trang tr��c", "cc_knowledge"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_award()
	local strTitle = "C�c ��i hi�p ��ng qu�n xem quy t�c tr� l�i nh�, ch�c c�c ��i hi�p ho�n th�nh ��p �n.";
	local strInfo = "\n ph�n th��ng: Tr� l�i ��ng 1 c�u s� nh�n ���c 1 t�m Th� T� v� ph�n th��ng kinh nghi�m; tr� l�i sai th� ch� nh�n ���c ph�n th��ng kinh nghi�m"
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Tr� l�i trang tr��c", "cc_knowledge"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_start()
	cc_answer_question();
end

function cc_reveive_award()
	local strTitle = "Nh�m Th� T� l� �Th� L�i T� + Th� L�c Hoa Quy�t�, �Th� L�i T� + Th� Linh Mi�u V�n�, ��i hi�p nhanh nhanh nh�n l�y ph�n th��ng.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		--{"�Ͻ��׼����콱", "cc_reveive_award_1"},
		{"Giao n�p Th� L�i T� + Th� L�c Hoa Quy�t", "cc_reveive_award_2"},
		{"Giao n�p Th� L�i T� + Th� Linh Mi�u V�n ", "cc_reveive_award_3"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function cc_reveive_award_1()
	local nItemCount = GetItemCount(2, 1, 30505);
	AskClientForNumber("cc_reveive_award_1_deal", 0, min(nItemCount, 200),"Xin h�y nh�p s� l��ng c�n giao n�p","")
end

function cc_reveive_award_2()
	local nCard2Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES);
	if nCard2Times >= CC_CARD2_MAX then
		Talk(1,"",format("Ng��i �� giao n�p s� l��ng Th� T� v��t qu� %d l�n, kh�ng th� ti�p t�c giao n�p n�a.", CC_CARD2_MAX));
		return 0;
	end
	local nSpace = min(GetFreeItemRoom(), CC_CARD2_MAX - nCard2Times);
	local nItemCount = min(GetItemCount(2, 1, 30505), GetItemCount(2, 1, 30506));
	AskClientForNumber("cc_reveive_award_2_deal", 0, min(nSpace, nItemCount),"Xin h�y nh�p s� l��ng c�n giao n�p","")
end

function cc_reveive_award_3()
	local nSpace = GetFreeItemRoom();
	local nItemCount = min(GetItemCount(2, 1, 30505), GetItemCount(2, 1, 30507));
	AskClientForNumber("cc_reveive_award_3_deal", 0, min(nSpace, nItemCount),"Xin h�y nh�p s� l��ng c�n giao n�p","")
end


function cc_reveive_award_1_deal(nNum)
	for i = 1, nNum do
		cc_get_award(1);
	end
end

function cc_reveive_award_2_deal(nNum)
	for i = 1, nNum do
		cc_get_award(2);
	end
end

function cc_reveive_award_3_deal(nNum)
	for i = 1, nNum do
		cc_get_award(3);
	end
end

