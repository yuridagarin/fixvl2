--��diaoָ��
--by vivi
--2009-04-09

g_NpcName = "<color=green>D��ng �i�u Ch� Nam<color>: "

function OnUse()
	local strtab = {
		"B� quy�t cho Ti�u �i�u �n no/yangdiao_talk_1",
		"Hu�n luy�n 1 Ti�u �i�u th�ng minh/yangdiao_talk_2",
		"Cho Ti�u �i�u h�c m�t k� n�ng ��c bi�t/yangdiao_talk_3",
		"D�ng/nothing"
	};
	Say(g_NpcName.."��y l� th� t�ch ghi ch�p c�ch nu�i �i�u c�a �� t� Th�y Y�n M�n, r�t c� �ch.",
		getn(strtab),
		strtab)
end

function yangdiao_talk_1()
	Talk(1,"OnUse",g_NpcName.."�� ��i kh�t s� �nh h��ng l�c c�ng c�a �i�u, c�ng ��i l�c c�ng c�ng th�p, khi �� l�c c�ng c�a ch� nh�n c�ng gi�m. Cho Ti�u �i�u �n nh� sau:\n    1. ��n Th��ng Nh�n Th�y Y�n mua H�ng S�n Qu� ho�c Qu� Hoa Ng�\n    2. S� d�ng v� c�ng �Nu�i Ti�u �i�u�\n    3. Nh�p chu�t ph�i v�o Ti�u �i�u r�i ch�n H�ng S�n Qu� ho�c Qu� Hoa Ng� trong t�i\n    4. L�p l�i b��c 2 v� 3 cho ��n khi �n no");
end

function yangdiao_talk_2()
	Talk(1,"OnUse",g_NpcName.."Linh t�nh c�a �i�u s� t�ng m�t t� l� nh�t ��nh theo c�p hu�n luy�n c�a �i�u. Linh t�nh c� th� t�ng t�c �� v� l�c c�ng c�a �i�u. Hu�n luy�n Ti�u �i�u c�n c� Hu�n Luy�n Ti�u v� M�t Qu�. M�i khi t�ng 1 �i�m hu�n luy�n ph�i th��ng cho Ti�u �i�u 1 M�t Qu�, M�t Qu� kh�ng th� t�ng �� no c�a �i�u. N�u �i�u qu� ��i s� d�ng hu�n luy�n. Hu�n luy�n Ti�u �i�u nh� sau:\n    1. ��n Th��ng Nh�n Th�y Y�n mua 1 Hu�n Luy�n Ti�u v� M�t Qu�\n    2. D�ng Hu�n Luy�n Ti�u b�t ��u hu�n luy�n\n    3. N�u hu�n luy�n b� d�ng th� c� th� do h�t M�t Qu� ho�c Ti�u �i�u b� ��i");	
end

function yangdiao_talk_3()
	Talk(1,"OnUse",g_NpcName.."�i�u c� th� �n th�c v�t ch� ��nh �� h�c k� n�ng ��c bi�t, k� n�ng n�y th�ng qua �B�ch Hoa T�m Kinh� c�a ch� nh�n �� thi tri�n. K� n�ng h�c sau s� thay th� cho k� n�ng tr��c. �i�u h�c k� n�ng nh� sau:\n    1. ��n Th��ng Nh�n Th�y Y�n mua m�t trong c�c lo�i Tri�u Thi�n Ti�u, Thanh L��ng Th�o, Thi�n H��ng Hoa\n    Nh�p chu�t ph�i s� d�ng\n    Ti�u �i�u s� h�c ���c k� n�ng ��c bi�t t��ng �ng\n    Ch� nh�n khi chi�n ��u d�ng B�ch Hoa T�m Kinh �� l�nh cho Ti�u �i�u s� d�ng k� n�ng n�y");
end

function nothing()

end