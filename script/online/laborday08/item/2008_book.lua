--�ű����ƣ���һ�ָ�Ͻű�
--�ű����ܣ���һ�ָ�϶Ի��ű�
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-20
--�����޸ļ�¼��2008-04-14 by ī��

IS_SHOUFEI = false --�ж����շѻ������
--****************************�Ի�������************************
function OnUse()
	Say("<color=green>H��ng d�n<color>: L�i ��n ho�t ��ng 1-5, cu�c thi tranh b� 1-5 l�i ���c khai m�c, b�n chu�n b� ch�a?",
		6,
		"Ho�t ��ng 1-5 bao g�m n�i dung n�o/context",
		"Nh�n b�i M�t ch��c?/get",
		"B�i M�t ch��c c� th� ��i ph�n th��ng ��/prize",
		"Ng� C�c c� b�n nh�ng g�?/buy",
		"T�n c�ng l�n nh�t c�a v� kh� Thi�n ��a Huy�n Ho�ng/xuanhuang",
		"��ng h��ng d�n/nothing"
		)
end

function nothing()
	
end

function context()
	if IS_SHOUFEI == true then
		Say("<color=green>H��ng d�n<color>: Ho�t ��ng 1-5 c� 2 n�i dung\n  Th� 1 <color=yellow>M�ng 1-5<color>, nh�n ��i �i�m kinh nghi�m. Trong th�i gian ho�t ��ng, t� <color=yellow>12:00-23:00<color> ��n g�p B�ch Hoa s� gi� �� nh�n 4 gi� nh�n ��i �i�m kinh nghi�m.\nTh� 2 <color=yellow>Cu�c thi Th�n b�i tranh b�<color>, m�i ng��i s� nh�n ���c c�c qu�n b�i M�t ch��c, gh�p n� th�nh c�c hoa kh�c nhau �� nh�n c�c ph�n th��ng ��c bi�t.",1,"V� trang tr��c/OnUse")
	else
		Say("<color=green>H��ng d�n<color>: Ho�t ��ng 1-5 c� 2 n�i dung\n  Th� 1 <color=yellow>M�ng 1-5<color> m�i ng��i ���c nh�n ��i �i�m kinh nghi�m. Trong th�i gian ho�t ��ng, t� <color=yellow>12:00-23:00<color> m�i ng��i ��n g�p B�ch Hoa s� gi� �� nh�n 4 gi� nh�n ��i �i�m kinh nghi�m v� nh�n ��i �i�m c�ng hi�n s� m�n trong ng�y h�m nay (kh�ng bao g�m ��i s� ki�n s� m�n).\n  Th� 2 <color=yellow>Cu�c thi Th�n b�i tranh b�<color>, m�i ng��i nh�n ���c c�c qu�n b�i M�t ch��c, gh�p ch�ng th�nh hoa v�n kh�c nhau �� ��i c�c ph�n th��ng ��c bi�t.",1,"V� trang tr��c/OnUse")
	end
end

function get()
	if IS_SHOUFEI == true then
		Say("<color=green>H��ng d�n<color>: Ho�t ��ng 1-5, c�c b�n c� th� nh�n ���c c�c qu�n b�i M�t ch��c sau\n  <color=yellow>B�ch C�u Ho�n<color>: Khi s� d�ng B�ch C�u Ho�n treo m�y c� t� l� r�t th�p nh�n ���c M�t ch��c\n  <color=yellow>T�ng Ki�m s�n trang<color>: Trong b�o r��ng c�a 2 v� T�ng qu�n, ��i ti�u th�, Trang ch� v� Tr��ng l�o c� s� qu�n b�i M�t ch��c nh�t ��nh �� gi�p c�c thi�u hi�p v��t �i th�nh c�ng, n�u ��nh b�i 5 v� n�y c� th� nh�n ���c t�ng c�ng 14 qu�n b�i M�t ch��c, ch� �, m�i boss m�i ng�y ch� c� th� r�i <color=red>1<color> l�n\n  ",1,"Trang k�/get_1")
	else
		Say("<color=green>H��ng d�n<color>: Ho�t ��ng 1-5, c�c b�n c� th� nh�n ���c c�c qu�n b�i M�t ch��c sau\n  <color=yellow>B�ch C�u Ho�n<color> treo m�y: Khi s� d�ng B�ch C�u Ho�n treo m�y c� t� l� r�t th�p nh�n ���c M�t ch��c, ch� � B�ch C�u Ho�n c�ng t�t t� l� nh�n ���c qu�n b�i c�ng cao\n  <color=yellow>T�ng Ki�m s�n trang<color>: Trong b�o r��ng c�a 2 v� T�ng qu�n, ��i ti�u th�, Trang ch� v� Tr��ng l�o c� s� qu�n b�i M�t ch��c nh�t ��nh �� gi�p c�c thi�u hi�p v��t �i th�nh c�ng, n�u ��nh b�i 5 v� n�y c� th� nh�n ���c t�ng c�ng 14 qu�n b�i M�t ch��c, ch� �, m�i boss m�i ng�y ch� c� th� r�i <color=red>1<color> l�n\n  ",1,"Trang k�/get_1")
	end
end

function get_1()
	if IS_SHOUFEI == true then
		Say("  <color=yellow>Th�i H� Huy�n C�nh<color>: Khi v��t qua 8 �i Th�i H� c� th� nh�n ���c 5 qu�n b�i M�t ch��c, m�i ng�y ch� c� th� nh�n 1 l�n\n  <color=yellow>��i h�i t� v�<color>: Tham gia Thi�n h� �� nh�t v� cu�c thi T�n T�, sau m�i tr�n so t�i c� th� nh�n ���c <color=red>1<color> qu�n b�i M�t ch��c, m�i ng�y t�i �a <color=red>15<color> qu�n b�i. Ch� �, h�a kh�ng nh�n ���c\n  T�t c� M�t ch��c nh�n ���c ��u t� ��ng b� v�o trong b�o r��ng, b�o r��ng c� th� nh�n t�i S� gi� ho�t ��ng, ch� � kh�ng �em b�o r��ng b�n m�nh qu�n b�i v�n t� ��ng ���c ��t v�o trong b�o r��ng, ch� c�n l�y ra ho�c nh�n l�i b�o r��ng c� th� th�y ���c s� qu�n b�i c�a m�nh.",1,"tr� l�i/OnUse")
	else
		Say("  <color=yellow>Th�i H� Huy�n C�nh<color>: Khi v��t qua 8 �i Th�i H� c� th� nh�n ���c 5 qu�n b�i M�t ch��c, m�i ng�y ch� c� th� nh�n 1 l�n\n  <color=yellow>��i h�i t� v�<color>: Tham gia Thi�n h� �� nh�t v� cu�c thi T�n T�, sau m�i tr�n so t�i c� th� nh�n ���c <color=red>1<color> qu�n b�i M�t ch��c, m�i ng�y t�i �a <color=red>15<color> qu�n b�i. Ch� �, h�a kh�ng nh�n ���c\n  T�t c� M�t ch��c nh�n ���c ��u t� ��ng b� v�o trong b�o r��ng, b�o r��ng c� th� nh�n t�i S� gi� ho�t ��ng, ch� � kh�ng �em b�o r��ng b�n m�nh qu�n b�i v�n t� ��ng ���c ��t v�o trong b�o r��ng, ch� c�n l�y ra ho�c nh�n l�i b�o r��ng c� th� th�y ���c s� qu�n b�i c�a m�nh.",1,"tr� l�i/OnUse")
	end
end

function prize()
	local tTemp = {"��n Tr��ng/prize_danzhang",
		"B�nh H�/prize_pihu",
		"Thanh Nh�t S�c (��ng)/prize_qingyise_tong",
		"Thanh Nh�t S�c (�i�u)/prize_qingyise_tiao",
		"Thanh Nh�t S�c (V�n)/prize_qingyise_wan",
		"��i T� H�/prize_dasixi",
		"Th�n b�i/prize_paishen",
		"Ta mu�n xem n�i dung kh�c/goback_to_main"
		}
		Say("<color=green>H��ng d�n<color>: C�n c� lo�i b�i b�n ��nh c� th� nh�n ���c c�c lo�i ph�n th��ng kh�c nhau. Sau ��y l� c�c lo�i b�i, nh�n v�o �� xem thuy�t minh",getn(tTemp),tTemp)
end

function goback_to_main()
	OnUse()
end

function goback_to_prize()
	prize()
end

function prize_danzhang()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>��n Tr��ng<color>:\nNh�n ph�i v�o 1 qu�n b�i b�t k� l� c� th� nh�n, s� l�n nh�n t�i �a l� <color=red>1000<color>\n  Cho ��ng c�p b�nh ph��ng*10 �i�m kinh nghi�m, c� th� nh�n ���c 1 vi�n Linh th�ch c�p 1-7, ��t v�o T� Linh ��nh. Ng��i ch�i c�p 99 c� t� l� 100% nh�n ���c 1 vi�n Linh th�ch c�p 1-7, ��t v�o T� Linh ��nh, t� l� gi�ng t�i b�o th�ch.",getn(tTemp),tTemp)
end

function prize_pihu()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>B�nh H�<color>:\n  G�p S� gi� ho�t ��ng nh�n ng�u nhi�n 14 qu�n b�i M�t ch��c, s� l�n nh�n t�i �a l� <color=red>42<color> l�n\n Cho b�nh ph��ng ��ng c�p *140 �i�m kinh nghi�m, ng�u nhi�n nh�n ���c 3 vi�n Linh th�ch c�p 1-7, ��t v�o trong T� Linh ��nh. Ng��i ch�i c�p 99 c� t� l� 100% nh�n ���c 15 vi�n Linh th�ch c�p 1-7, ��t v�o trong T� Linh ��nh, t� l� c�ng v�i t�i b�o th�ch.",getn(tTemp),tTemp)
end

function prize_qingyise_tong()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>Thanh Nh�t S�c (��ng)<color>:\nT�t c� qu�n b�i ��u c�ng 1 hoa v�n, 14 qu�n b�i li�n ti�p t� 1-9, nh�n � ch� S� gi� ho�t ��ng, s� l�n nh�n t�i �a l� <color=red>21<color> l�n\n  5 Nh�t Thi�m Y�u Ho�ng, 1 Linh th�ch c�p 5, c� th� nh�n ���c t�i b� ki�p s� m�n l�u ph�i hi�n t�i v� Thi�n ��a Huy�n Ho�ng Trang",getn(tTemp),tTemp)
end

function prize_qingyise_tiao()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>Thanh Nh�t S�c (�i�u)<color>:\n  T�t c� qu�n b�i ��u c�ng 1 hoa v�n, 14 qu�n b�i li�n ti�p t� 1-9, nh�n � ch� S� gi� ho�t ��ng, s� l�n nh�n t�i �a l� <color=red>14<color> l�n\n  10 Nh�t Thi�m Y�u Ho�ng, 2 Linh th�ch c�p 5, c� th� nh�n Ng� H�nh m�t t�ch, Thi�n ��a Huy�n Ho�ng Trang, Thi�n ��a Huy�n Ho�ng Gi�p",getn(tTemp),tTemp)
end

function prize_qingyise_wan()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>Thanh Nh�t S�c (V�n)<color>: \n  T�t c� qu�n b�i ��u c�ng 1 hoa v�n, 14 qu�n b�i li�n ti�p t� 1-9, nh�n � ch� S� gi� ho�t ��ng, s� l�n nh�n t�i �a l� <color=red>7<color> l�n\n  5 Tam Di�u Long Hi, 1 Linh th�ch c�p 6, c� th� nh�n ���c b� k�p L�ng Ba Vi B�, Thi�n ��a Huy�n Ho�ng Trang, Thi�n ��a Huy�n Ho�ng Gi�p, Thi�n ��a Huy�n Ho�ng Kh�i",getn(tTemp),tTemp)
end

function prize_dasixi()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>��i T� H�<color>:\n  ��ng Phong, Nam Phong, T�y Phong, B�c phong m�i lo�i 3 con, ch�n ng�u nhi�n 1 c�p trong Trung Ph�t B�ch t�ng c�ng 14 con, nh�n � ch� S� gi� ho�t ��ng, s� l�n nh�n t�i �a l� <color=red>2<color> l�n\n  15 Tam Di�u Long Hi, 1 Linh th�ch c�p, c� th� nh�n ���c v� kh� Thi�n ��a Huy�n Ho�ng, Thi�n ��a Huy�n Ho�ng Trang, Thi�n ��a Huy�n Ho�ng Gi�p, Thi�n ��a Huy�n Ho�ng Kh�i.",getn(tTemp),tTemp)
end

function prize_paishen()
	local tTemp = {"V� trang tr��c/goback_to_prize","R�i kh�i/nothing"}
	Say("<color=green>Th�n b�i<color>:\n  Ng�u nhi�n 777 con b�i, nh�n � S� gi� ho�t ��ng, kh�ng gi�i h�n s� l�n nh�n\n  2 Linh th�ch c�p 7, 1 Thanh ��ng ��nh c�p 1",getn(tTemp),tTemp)
end

function buy()
	Say("<color=green>H��ng d�n<color>: B�n mua 1 qu�n b�i M�t ch��c trong Ng� C�c, nguy�n b� c� 14 con, 1 ��ng, 1 �i�u, 1 T�, sau ��y l� thuy�t minh c�c v�t ph�m n�y.\n  <color=yellow>1 qu�n b�i M�t ch��c<color>, ng�u nhi�n nh�n ���c 1 qu�n b�i M�t ch��c\n  <color=yellow>14 qu�n b�i M�t ch��c<color>, ng�u nhi�n nh�n ���c 14 qu�n b�i\n  <color=yellow>1 ��ng<color>, ch� qu�n b�i nh�n ���c c� hoa v�n l� ��ng\n",1,"Trang k�/buy_1")
end

function buy_1()
	Say("  <color=yellow>1 �i�u<color> ch� ��nh qu�n b�i M�t ch��c nh�n ���c c� hoa v�n l� �i�u\n  <color=yellow>1 V�n<color> ch� qu�n b�i M�t ch��c nh�n ���c c� hoa v�n l� V�n\n  <color=yellow>1 T�<color> ch� ��nh nh�n ���c 1 qu�n b�i ng�u nhi�n trong 7 qu�n b�i ��ng Nam T�y B�c Trung Ph�t B�ch",1,"tr� l�i/OnUse")
end

function xuanhuang()
	Say("<color=green>H��ng d�n<color>: Sau ��y l� c�c lo�i v� kh� Thi�n ��a Huy�n Ho�ng, m�i c�c v� ��i hi�p xem qua\n  Thi�n ��a Huy�n Ho�ng Th�, �o�n binh kh� h� th�, th�ch h�p Thi�u L�m v� t�ng, C�i Bang t�nh y, c�ng k�ch ngo�i c�ng 314-529, c�ng k�ch n�i c�ng 273-454\n  Thi�n ��a Huy�n Ho�ng Ki�m, �o�n ki�m, th�ch h�p Nga My Ph�t Gia, V� �ang ��o gia, c�ng k�ch ngo�i c�ng 184-357, c�ng k�ch n�i c�ng 343-594\n  Thi�n ��a Huy�n Ho�ng C�n, tr��ng c�n, th�ch h�p Thi�u L�m t�c gia, C�i Bang � y, c�ng k�ch ngo�i c�ng 251-416\n  Thi�n ��a Huy�n Ho�ng Kh�, K� M�n �m kh�, th�ch h�p ���ng M�n, c�ng k�ch ngo�i c�ng 194-307\n  Thi�n ��a Huy�n Ho�ng �ao, �o�n �ao, th�ch h�p Thi�u L�m t�c gia, c�ng k�ch ngo�i c�ng 306-510\n",1,"Trang k�/xuanhuang_1")
end

function xuanhuang_1()
	Say("  Thi�n ��a Huy�n Ho�ng C�m, K� M�n C�m, th�ch h�p Nga My t�c gia, c�ng k�ch ngo�i c�ng 238-384, c�ng k�ch n�i c�ng 275-446\n  Thi�n ��a Huy�n Ho�ng B�t, K� M�n B�t, th�ch h�p V� �ang t�c gia, c�ng k�ch ngo�i c�ng 21-7-343\n  Thi�n ��a Huy�n Ho�ng Tr��ng, Thi�n Tr��ng, th�ch h�p Thi�u L�m thi�n t�ng, c�ng k�ch ngo�i c�ng 207-403, c�ng k�ch n�i c�ng 316-515\n  Thi�n ��a Huy�n Ho�ng Th��ng, Tr��ng Th��ng, th�ch h�p D��ng M�n th��ng k�, c�ng k�ch ngo�i c�ng 182-406\n  Thi�n ��a Huy�n Ho�ng Cung, K� M�n Cung, th�ch h�p D��ng M�n cung k�, c�ng k�ch ngo�i c�ng 226-347\n  Thi�n ��a Huy�n Ho�ng Tr�o, K� M�n Tr�o, th�ch h�p Ng� ��c c� s�, c�ng k�ch ngo�i c�ng 232-378, c�ng k�ch n�i c�ng 263-454\n  Thi�n ��a Huy�n Ho�ng Nh�n, th�ch h�p Ng� ��c t� hi�p, c�ng k�ch ngo�i c�ng 232-378, c�ng k�ch n�i c�ng 314-529",1,"tr� l�i/OnUse")
end