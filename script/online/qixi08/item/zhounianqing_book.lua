--��ʮ������˵��
--by vivi
--2008/11/06

IB_VERSION = 1		--1��ʾ���������0��ʾ�շ���

g_nHeadInfo = "<color=green>H��ng d�n ho�t ��ng 20 n�m<color>: "

function OnUse()
	local strtab = {
				"Th�i gian ho�t ��ng/know_time",
				"�i�u ki�n tham gia /know_condition",
				"H��ng d�n quy t�c ho�t ��ng/know_rule",
				"Thuy�t minh ph�n th��ng/know_award",
--				"����Ʒ˵��/know_new",
				"H��ng d�n ��ng/nothing"
				};
	Say(g_nHeadInfo.."��y l� n�i h��ng d�n ho�t ��ng K� ni�m 20 n�m th�nh l�p Kingsoft, ng��i mu�n t�m hi�u ph�n n�o?",getn(strtab),strtab);
end

function know_time()
	Talk(1,"OnUse",g_nHeadInfo.."Th�i gian m� ho�t ��ng l�n n�y l� 13/11/2008 sau khi b�o tr�, ��n 23h 7/1/2009.\n    Th�i gian ��i ph�n th��ng l� 13/11/2008 sau khi b�o tr� ��n 23 gi� 14/1/2009.");
end

function know_condition()
	Talk(1,"OnUse",g_nHeadInfo.."Ch� c�n b�n h�n c�p 30 l� c� th� tham gia t�t c� ho�t ��ng (kh�ng bao g�m c�p 30).");
end

function know_rule()
	Say(g_nHeadInfo.."Ho�t ��ng c� hai ph�n, thi ��u v� thu th�p v�t ph�m, ng��i mu�n xem h��ng d�n ph�n n�o?",
			3,
			"Thi ��u/know_rule_1",
			"Thu th�p v�t ph�m/know_rule_2",
			"Xem h��ng d�n kh�c/OnUse");
end

function know_rule_1()
	Talk(3,"know_rule",g_nHeadInfo.."Thi ��u c� 3 ph�n: \n    �o�n s�, sau khi tr� ch�i b�t ��u h� th�ng s� t� ��ng ��a ra ch� s� (ph�m vi t� 0-100). S� c� khung nh�p hi�n ra, �i�n s� b�n �� �o�n v�o, sau khi x�c nh�n, h� th�ng s� th�ng b�o cho b�n bi�t s� c�a b�n ��a ra c� kh�p v�i s� h� th�ng kh�ng, n�u �o�n tr�ng trong v�ng 5 l�n, xem nh� th�ng.",g_nHeadInfo.."�o�t B�o K� Binh, sau khi tr� ch�i b�t ��u, h� th�ng s� refresh b�o r��ng v� c� quan theo th�i gian nh�t ��nh, nh�n v�o c� quan c� th� g�y c�n tr� cho ��i th� v� t�ng c��ng b�n th�n. Khi refresh b�o r��ng, n�u b�n kh�ng l�y ���c b�o r��ng, th� s� b� tho�t ra, xem nh� th�t b�i, ng��i c�n l�i sau c�ng s� l� ng��i th�ng cu�c.",g_nHeadInfo.."�i�m ��ng H�i, sau khi tr� ch�i b�t ��u, Th�nh H�a ��i s� l�n l��t ���c th�p s�ng trong m�t th�i gian nh�t ��nh, 1 kho�ng th�i gian sau s� t� ��ng t�t, sau khi Th�nh H�a ��i t�t , b�n ch� c�n nh�m l�a theo tr�nh t�, �� n� s�ng tr� l�i, th� s� th�ng.");
end

function know_rule_2()
	Talk(1,"know_rule",g_nHeadInfo.."S� gi� V� L�m s� y�u c�u ng��i thu th�p m�t s� v�t ph�m cho h�, t�y v�o s� l��ng v�t ph�m ng��i thu th�p ���c nhi�u hay �t m� ng��i c� th� ��i ���c ph�n th��ng, n�u ng��i mu�n c� ���c nhi�u ph�n th��ng h�n n�a, th� ng��i c� th� ti�p t�c thu th�p �� ��i. Ch� �, c� h�n ch� v� s� l�n ��i ph�n th��ng m�i tu�n.");
end

function know_award()
	if IB_VERSION == 1 then
		Talk(2,"OnUse",g_nHeadInfo.."N�u tham gia tr� ch�i thi ��u b�n c� th� nh�n ���c kinh nghi�m v� r�t �t �i�m, tham gia ho�t ��ng thu th�p nh�n ���c t��ng ��i nhi�u �i�m. D�ng �i�m c� th� ��i kinh nghi�m, R��ng k� ni�m 20 n�m v� M�t t�ch h�p th�nh. \n\nKhi m� R��ng k� ni�m 20 n�m c� th� nh�n ���c nh�ng v�t ph�m sau: \nNg�a 120% di chuy�n, �� b�n 200 �i�m (D��ng M�n l� chi�n m� 35% di chuy�n, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ch�a gia nh�p l�u ph�i ng�u nhi�n nh�n ���c 1 quy�n m�t t�ch c�a b�t c� l�u ph�i n�o) \n 100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\nThi�n Qu�i Th�ch (d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)",g_nHeadInfo.."\n��nh H�n Thi�n Th�ch Th�n Th�ch (c��ng h�a v�t ph�m, khi �� c��ng h�a l� 7 th� kh�ng th� c��ng h�a n�a)\nM�nh Thi�n Th�ch (trang b� c��ng h�a c�p 1-4 ti�u hao v�t ph�m)\nThi�n Th�ch Tinh Th�ch (trang b� c��ng h�a c�p 8-15 ti�u hao v�t ph�m)\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	else
		Talk(2,"OnUse",g_nHeadInfo.."N�u tham gia tr� ch�i thi ��u b�n c� th� nh�n ���c kinh nghi�m v� r�t �t �i�m, tham gia ho�t ��ng thu th�p nh�n ���c t��ng ��i nhi�u �i�m. D�ng �i�m c� th� ��i kinh nghi�m, R��ng k� ni�m 20 n�m v� M�t t�ch h�p th�nh. \n\nKhi m� R��ng k� ni�m 20 n�m c� th� nh�n ���c nh�ng v�t ph�m sau: \nNg�a 120% di chuy�n, �� b�n 200 �i�m (D��ng M�n l� chi�n m� 35% di chuy�n, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ch�a gia nh�p l�u ph�i ng�u nhi�n nh�n ���c 1 quy�n m�t t�ch c�a b�t c� l�u ph�i n�o) \n 100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\nThi�n Qu�i Th�ch (d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)",g_nHeadInfo.."\nThi�n Th�ch Linh Th�ch (c��ng h�a trang b� tr�c ti�p ��t ��n c�p 7)\nNguy�t Hoa ho�c N� Oa Tinh Th�ch\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	end
end

function know_new()
	Talk(1,"OnUse",g_nHeadInfo.."Th�m Thi�n Qu�i Th�ch, sau khi nh�n ph�m ph�i s� d�ng, c� th� chuy�n trang b� Thi�n ��i Huy�n Ho�ng ��nh qu� th�nh Thi�n Qu�i.\n  Trang b� Thi�n Qu�i c� th� k�ch ho�t c�ng v�i trang b� b�t qu�i c�a ho�t ��ng K� ni�m 20 n�m (trang b� b�t qu�i c� th� d�ng l�u d�i, sau ho�t ��ng c� th� k�ch ho�t), ch� �, thu�c t�nh k�ch ho�t trang b� b�t qu�i n�y kh�ng c�n ��ng c�p ��nh qu�, b�t k� trang b� b�t qu�i ��ng c�p n�o ��u k�ch ho�t thu�c t�nh t��ng ��ng.");
end

function nothing()

end
