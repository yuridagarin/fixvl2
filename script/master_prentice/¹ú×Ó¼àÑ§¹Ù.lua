-- ���Ӽ�ѧ��

Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������

function main()
	do return end
	if MPUpdate("\\script\\master_prentice\\���Ӽ�ѧ��.lua", "main_cb", 0) == 0 then
		main_cb()
	end
end

function main_cb()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("S� ph� c� m�t ch�t qu� cho b�n. Mu�n nh�n ch�?",
			6,
			"T�i H�u sinh kh� �y (c� th� nh�n khi tr� th�nh �� t� ch�nh th�c)/#lin_bao(10)",
			"T�i Ti�n tr�nh t� c�m ( c� th� nh�n sau khi �� t� ch�nh th�c ��t c�p 45)/#lin_bao(45)",
			"T�i S� �� t�nh th�m (c� th� nh�n sau khi �� t� ch�nh th�c ��t c�p 60)/#lin_bao(60)",
			"Thuy�t minh H� th�ng S� ��/see_info2",
			"Nh�n 1 Thi�p b�i s�/baishitie",
			"Kh�ng vi�c g�, ch� xem th�i./no_say")
	elseif tInfo["ismaster"] == 0 then
		Say("Qu�c T� gi�m ch�nh l� n�i �� d�y h�c c�a tri�u ��nh�Ch� c�n ��ng c�p ��t ��n <color=yellow>75<color>, ��n Qu�c T� gi�m -Th�n V� vi�n ��ng k� l� c� th� thu nh�n �� ��",
			5,
			"Ta mu�n th�nh s� ph�/yes_make_master",
			"T�i mu�n l�m �� ��/yes_be_prentice",
			"Thuy�t minh H� th�ng S� ��/see_info2",
			"Nh�n 1 Thi�p b�i s�/baishitie",
			"Kh�ng vi�c g�, ch� xem th�i./no_say")
	elseif tInfo["ismaster"] > 0 then
		Say("C�c h� �� ��ng k� trong h� s� l� S� ph� v� h�c Qu�c T� gi�m Th�n v� vi�n, mu�n gi�p g� c� n�i ",
			9,
			"c�ng b� Nhi�m v� S� ��/create_task",
			"D�ng �i�m S� �� nh�n ph�n th��ng/use_point",
			"Mua hoa h�ng cho �� �� n�y/buy_fund",
			"D�ng b�ng l�c mua v�t ph�m Qu�c T� gi�m/#use_fenglu(1)",
			"Nh�n 1 nhi�m v� xu�t s�/get_graduate_item",
			"Ta mu�n b�i �ng ta l�m s� ph�, Ta ph�i h�y b� ��ng k� � Qu�c T� gi�m/disband_master",
			"Thuy�t minh H� th�ng S� ��/see_info2",
			"Nh�n 1 Thi�p b�i s�/baishitie",
			"Kh�ng vi�c g�, ch� xem th�i./no_say")
	end
end

function lin_bao(nLevel)
	local tInfo = GetMPBaseInfo()
	if GetLevel() < nLevel then
		Say("��t ��n c�p "..nLevel.." r�i h�y t�i.", 0)
		return
	end
	
	if tInfo["istemp"] == 0 then
		Say("Tr� th�nh �� �� ch�nh th�c tr��c r�i h�y t�i.", 0)
		return
	end
	local n1, n2, n3 = CustomDataRead("mp_p_award")
	local tLeveltoIdx =
	{
		[10] = {n1, " t�i H�u Sinh Kh� �y"},
		[45] = {n2, "Ti�n Tr�nh T� C�m B�o"},
		[60] = {n3, "T�i S� �� T�nh Th�m"},
	}
	for index, value in tLeveltoIdx do
		if value[1] == nil then
			value[1] = 0
		end
	end
	
	if tLeveltoIdx[nLevel][1] == 1 then
		Say("Ng��i �� nh�n "..tLeveltoIdx[nLevel][2].."1 l�n r�i.", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,1) == 0 then
		return
	end
	
	local tItem =
	{
		[10] = {2,1,591," t�i H�u Sinh Kh� �y"},
		[45] = {2,1,592,"Ti�n Tr�nh T� C�m B�o"},
		[60] = {2,1,597,"T�i S� �� T�nh Th�m"},
	}
	
	AddItem(tItem[nLevel][1], tItem[nLevel][2], tItem[nLevel][3], 1, 1)
	tLeveltoIdx[nLevel][1] = 1
	CustomDataSave("mp_p_award", "ddd", tLeveltoIdx[10][1], tLeveltoIdx[45][1], tLeveltoIdx[60][1])
	WriteLog("[S� ��-hoa h�ng �� ��]:"..GetName().."Nh�n ���c 1 "..tItem[nLevel][4])
end

function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("C�c h� mu�n bi�t thuy�t minh v� ph�n s� ph� hay �� ��? R�t nhi�u thao t�c c�a H� th�ng S� �� ��u ph�i m� <color=yellow>B�ng th�ng tin s� ��<color>, sau �� <color=yellow>nh�p ph�i v�o t�n m�t ng��i trong danh s�ch<color> s� xu�t hi�n giao di�n �� thao t�c.",
		3,
		"N�i dung v� m�t s� ph�/shifu",
		"N�i dung v� m�t �� ��/tudi",
		"Kh�ng vi�c g�, ch� xem th�i./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("V� m�t s� ph� c� nh�ng n�i dung b�n d��i. R�t nhi�u thao t�c c�a H� th�ng S� �� ��u ph�i m� <color=yellow>B�ng th�ng tin s� ��<color>, sau �� <color=yellow>nh�p ph�i v�o t�n m�t ng��i trong danh s�ch<color> s� xu�t hi�n giao di�n �� thao t�c.",
		9,
		"L�m sao �� nh�n �� t�/shoutu",
		"Nhi�m V� S� �� sau khi nh�n �� t� l� g�/shirenwu",
		"�i�m S� �� l� g�/shitudianshu",
		"�i�m S� ��c l� g�/shidedianshu",
		"Th� Nghi�p ��ng C�p l� g�/shouyedengji",
		"Hoa H�ng Qu�c T� Gi�m l� g�?/huahong",
		"B�ng L�c Qu�c T� gi�m l� g�, c� th� mua ���c nh�ng g�/fenglu",
		"L�m sao ch�m d�t quan h� S� ��/shichushi",
		"Kh�ng vi�c g�, ch� xem th�i./no_say"
		)
end
	
function shoutu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"shifu","N�u C�c h� mu�n nh�n �� ��, ph�i ��n ch� ta ��ng k�, sau �� m� b�ng <color=yellow>'th�ng tin s� ��'<color>","��ng k� xong, nh�n F3 s� xu�t hi�n b�ng <color=yellow>'trang b� thu�c t�nh'<color>trong giao di�n s� c� <color=yellow>'th�ng tin s� ��'<color>, c� th� ki�m tra t�nh tr�ng s� �� hi�n t�i c�a b�n. Ch�n m� <color=white>'Nh�n �� ��'<color> �� xem v� t�m ��n nh�ng ai mu�n b�i s�.","Khi b�n g�p <color=white>ng��i ch�i c� ��ng c�p th�p h�n<color>, nh�n <color=white>Ctrl<color> v� nh�p chu�t ph�i ch�n 'Nh�n l�m �� ��'. N�u ��i ph��ng ��ng � th� s� tr� th�nh <color=white>�� t� t�m th�i<color> c�a b�n.","Khi <color=green>�� �� t�m th�i<color>��t ��n <color=yellow>c�p 10<color>, c� th� ch�nh th�c b�i s�. Ch� c�n hai ng��i h�p th�nh t�, anh ta s� <color=white>'B�i'<color> b�n � c� ly g�n �� xin tr� th�nh <color=white>�� �� ch�nh th�c<color>.")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Sau khi C�c h� tr� th�nh s� ph�, m�i ng�y c� th� ��n ch� ta c�ng b� <color=yellow>Nhi�m v� S� ��<color>, c� 7 nhi�m v� �� ch�n. Sau khi c�ng b� nhi�m v�, l�nh �� c� th� ti�p nh�n nhi�m v� trong <color=yellow>b�ng th�ng tin s� ��<color>.","K� h�n sau khi truy�n l�nh l� <color=yellow>24 ti�ng<color>, ngh�a l� ph�i ho�n th�nh xong nhi�m v� trong v�ng 24 ti�ng. ��ng th�i ch� ���c truy�n 1 nhi�m v� trong v�ng 24 ti�ng �� m� th�i.","Nhi�m v� ho�n th�nh xong, l�nh �� s� nh�n ���c ph�n th��ng nhi�m v�, n�u l� s� ph� s� nh�n ���c <color=yellow>�i�m S� ��<color>. 1 �� �� ho�n th�nh nhi�m v� trong ng�y c� th� gi�p s� ph� c� <color=green>10 �i�m<color> S� ��. <color=yellow>�� �� c�ng nhi�u, b�n c�ng ���c nhi�u �i�m S� ��<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>�i�m S� ��<color> l� ph�n th��ng m� s� ph� nh�n ���c sau khi �� t� ho�n th�nh Nhi�m v� S� ��. 1 �� t� ho�n th�nh xong nhi�m v� trong th�i gian qui ��nh s� t�ng cho s� ph� <color=green>10<color> �i�m S� ��. T�c d�ng c�a �i�m S� �� <color=yellow> chuy�n th�nh ph�n th��ng c�a s� ph�<color> ho�c <color=yellow>chuy�n th�nh �i�m S� ��c<color>.","S� ph� c� th� ��n ch� ta ��i �i�m S� �� th�nh ph�n th��ng<color=yellow>M�i 1 �i�m ��i m�t ph�n th��ng<color>. ��i �i�m s� ph�i ti�u hao <color=yellow>S� �� ph� ch�<color>, m�i 1 �i�m S� �� s� ti�u hao 1 S� �� ph� ch�. <color=green>C�n c� v�o ��ng c�p th� nghi�p c�a s� ph� cao hay th�p m� c� th� tr�c ti�p ��i m�t ph�n gi�i th��ng<color>.","S� ph� c�ng c� th� l�y �i�m S� �� chuy�n th�nh <color=yellow>�i�m S� ��c<color>, c�ng ph�i ti�u hao<color=yellow>S� �� ph� ch�<color> m�i l�n chuy�n 1 �i�m S� �� ph�i m�t 1 t� s� ��. Xin l�u �, <color=green>L�c chuy�n �i�m S� �� c�n c� S� �� ph� ch�, kh�ng th� c�n c� ��ng c�p th� nghi�p c�a s� ph� m� chuy�n ��i<color>.","T� khi t�nh Nhi�m v� S� �� c�a s� ph� giao cho , <color=green>�i�m S� �� s� b�ng 0 sau 24 ti�ng<color>. Ngh�a l� �i�m s� �� ��t ���c sau m�i nhi�m v� s� kh�ng l�u l�i trong nhi�m v� l�n sau.","��ng c�p th� nghi�p c�ng cao, �i�m s� �� nh�n ���c c�ng nhi�u.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"�i�m s� ��c quy�t ��nh tr� s� <color=yellow>��ng c�p th� nghi�p<color>, do �i�m S� �� c�ng S� �� ph� ch�.","�i�m S� �� m�i ng�y s� gi�m �i <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"��ng c�p th� nghi�p bi�u th� ��ng c�p b�n l� s� ph� v� h�c, do tr� s� �i�m s� ��c quy�t ��nh <color=yellow>�i�m s� ��c c�ng cao, ��ng c�p th� nghi�p c�ng cao, b�n c�ng thu nh�n ���c nhi�u �� ��<color>. ��ng c�p th� nghi�p cao nh�t hi�n nay l� c�p 10, c� th� thu nh�n ���c 15 �� ��.","D��i ��y l� thuy�t minh c�a 10 Th� Nghi�p ��ng C�p c� b�n: \n\nC�p 1 �i�m S� ��c <color=yellow>0<color> d�n ���c <color=yellow>3<color> �� ��. C�p 6 �i�m S� ��c <color=yellow>1200<color> d�n ���c <color=yellow>8<color> �� ��\nC�p 2 �i�m S� ��c <color=yellow>100<color> d�n ���c <color=yellow>4<color> �� ��. C�p 7 �i�m S� ��c <color=yellow>1600<color> d�n ���c <color=yellow>9<color> �� ��\n C�p 3 �i�m S� ��c <color=yellow>300<color> d�n ���c <color=yellow>5<color> �� ��. C�p 8 �i�m S� ��c <color=yellow>2000<color> d�n ���c <color=yellow>10<color> �� ��\n�cp 4 �i�m S� ��c <color=yellow>550<color> d�n ���c <color=yellow>6<color> �� ��. C�p 9 �i�m S� ��c <color=yellow>2500<color> d�n ���c <color=yellow>12<color> �� ��\nC�p 5 �i�m S� ��c <color=yellow>850<color> d�n ���c <color=yellow>7<color> �� ��. C�p 10 �i�m S� ��c <color=yellow>3000<color> d�n ���c <color=yellow>15<color> �� ��")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa h�ng Qu�c T� gi�m<color> l� do tri�u ��nh x�y d�ng nh�m kh�ch l� tinh th�n v� h�c. C�c h� c� th� ��n ch� ta mua <color=yellow>hoa h�ng<color> cho l�nh ��, khi �� �� tr��ng th�nh, c�c h� c� th� nh�n <color=yellow>b�ng l�c<color> t��ng �ng. N�u �� �� xu�t s� v� ��t ���c m�i y�u c�u, c�c h� c� th� nh�n ���c b�ng l�c nhi�u h�n hoa h�ng g�p <color=green>6 l�n<color>.","Xin l�u �, <color=yellow>t� khi b�i s� tr� th�nh �� t� ch�nh th�c, nh�ng b�ng l�c tr��c ��y s� ph� kh�ng nh�n ���c<color>. N�u nh� �� t� c�p 65 ch�nh th�c b�i s� tr� th�nh �� t� ch�nh th�c, b�ng l�c tr��c c�p 65 nh� c�p 30, 40, 50 v� 60, s� ph� s� kh�ng nh�n ���c.","<color=yellow>M�i s� ph� ch� c� th� l�nh b�ng l�c ch�a b� l�nh c�a �� �� hi�n t�i<color>. V� s� ph� sau kh�ng th� l�nh b�ng l�c c�a �� �� n�u s� ph� tr��c ��y �� l�nh. Sau khi 2 ng��i ch�i k�t h�p m�i quan h� s� ��, s� ph� c� th� nh�p v�o 'ki�m ta hoa h�ng' trong b�ng s� �� �� ki�m tra nh�ng b�ng l�c m� s� ph� tr��c c�a �� �� n�y �� l�nh.")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=white>B�ng l�c Qu�c T� gi�m <color> l� ph�n th��ng sau khi b�n mua hoa h�ng �� hu�n luy�n cho �� t�, d�ng �� mua nh�ng v�t ph�m qu� hi�m","Ch� ta c� b�n r�t nhi�u lo�i v�t ph�m, nh�ng ph�i d�ng B�ng l�c Qu�c T� gi�m m�i c� th� mua.","<color=yellow>B�ng l�c Qu�c T� gi�m<color> nh�n tr�c ti�p trong <color=yellow> giao di�n s� ��<color>. Nh�p chu�t ph�i t�n �� t� ch�n <color=yellow>Ki�m tra hoa h�ng<color> v�o <color=yellow>giao di�n hoa h�ng<color> xem t�nh h�nh tr��ng th�nh c�a �� t� ho�c <color=yellow>Nh�n b�ng l�c<color>.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 c�ch k�t th�c quan h� s� ��, xu�t s�, tr�c xu�t s� m�n v� ph�n b�i s� m�n",
		4,
		"L�m th� n�o �� xu�t s�/shichushi1",
		"L�m th� n�o �� tr�c xu�t s� m�n/shichushi2",
		"Ph�n b�i s� m�n l� nh� th� n�o/shichushi3",
		"Kh�ng vi�c g�, ch� xem th�i./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi l�nh �� ��t <color=green>c�p 73<color>, ng��i c� th� ��n g�p ta nh�n nhi�m v� xu�t s�. Nh�n ���c <color=yellow>'Xu�t S� Ti�u'<color>, t� ��i v�i �� �� ra ngo�i th�nh, d�ng Xu�t S� Ti�u g�i ra <color=yellow>Tu�n kh�o Qu�c T� gi�m<color>, l� ng��i c�a tri�u ��nh ph�i ��n �� ki�m tra xu�t s�.","Sau khi g�i tu�n kh�o Qu�c T� Gi�m ra, ph�i <color=yellow>��nh b�i<color> h�n. Xin l�u �, <color=green> b��c cu�i c�ng ph�i do l�nh �� ho�n th�nh<color>.","Sau khi ��nh b�i tu�n kh�o Qu�c T� Gi�m, b�n v� nh�m l�nh �� d�ng ��ng t�c <color=yellow>'B�i'<color> � c� li g�n �� xu�t s�.","N�u c�c h� mua <color=yellow>Qu�c T� gi�m hoa h�ng<color> cho l�nh ��, <color=green>b�ng l�c s� ��t 100% khi �� �� xu�t s�<color>; <color=green>qua 15 ng�y sau<color>, <color=green>ti�p t�c l�nh 100% b�ng l�c<color>; <color=green>15 ng�y ti�p theo<color>, <color=green>v�n c� th� nh�n 100% b�ng l�c<color>. <color=green>t�ng c�ng l� 300% b�ng l�c<color>. Xin ch� � nh�n b�ng l�c trong b�ng th�ng tin s� ��.")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi c�c h� kh�ng h�i l�ng v�i �� �� c� th�<color=yellow>tr�c xu�t s� m�n<color>, nh�p <color=yellow>chu�t ph�i<color> l�n t�n c�a �� �� mu�n tr�c xu�t trong <color=yellow>b�ng s� ��<color>, �� l� c�ch tr�c xu�t s� m�n.","L�c tr�c xu�t �� t� ph�i ti�u hao <color=yellow>99 t� s� ��<color>, ��ng th�i kh�ng ���c nh�n �� t� trong v�ng <color=yellow>24 ti�ng<color>. \n Tr�c xu�t �� t� t�m th�i kh�ng c� m�t h�n ch� n�y. <color=yellow>�� t� ch�nh th�c r�i m�ng t� 7 ng�y tr� l�n c�ng kh�ng c� h�n ch� ��<color>.","N�u �� �� t� n�y mua <color=yellow>Hoa H�ng Qu�c T� Gi�m<color>, sau khi b� tr�c xu�t<color=green>nh�ng b�ng l�c li�n quan m� �� t� �� ch�a nh�n s� b� h�y b�<color>. \n �� ��n b�, <color=green>sau khi b� tr�c xu�t 15 ng�y, �� t� n�y nh�n ���c 80% b�ng l�c<color>, <color=green>h�n 15 ng�y<color>, <color=green>nh�n th�m 80% b�ng l�c<color>, <color=green>t�ng c�ng 160% b�ng l�c<color>. Xin l�u � ch� ���c nh�n trong giao di�n th�ng tin s� ��.")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"�� �� c� th� s� <color=yellow>ph�n b�i s� m�n<color>, c�c h� c�n ch� � �i�m n�y, n�n suy ngh� nhi�u ��n c�m nh�n c�a �� ��.","N�u �� �� t� n�y mua<color=yellow>Hoa H�ng Qu�c T� Gi�m<color>, sau khi ph�n b�i s� m�n, <color=green>nh�ng b�ng l�c m� �� t� n�y ch�a nh�n s� b� h�y b�<color>. \n �� ��n b�, <color=green>15 ng�y sau khi ph�n b�i s� m�n ���c nh�n 100% b�ng l�c<color>, <color=green>h�n 15 ng�y<color>, <color=green>nh�n ���c 100% b�ng l�c<color>,<color=green>t�ng c�ng 200% b�ng l�c<color>. Ch� ���c nh�n trong giao di�n th�ng tin s� ��.")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("N�i dung li�n quan ��n �� ��, R�t nhi�u thao t�c c�a H� th�ng S� �� ��u ph�i m� <color=yellow>B�ng th�ng tin s� ��<color>, sau �� <color=yellow>nh�p ph�i v�o t�n m�t ng��i trong danh s�ch<color> s� xu�t hi�n giao di�n �� thao t�c.",
		5,
		"L�m c�ch n�o �� b�i s�/baishi",
		"Nhi�m v� S� �� sau khi b�i s� l� g�/turenwu",
		"Sau khi b�i s� c� th� nh�n ���c ph�n th��ng n�o/jiangli",
		"L�m sao ch�m d�t quan h� S� ��/tuchushi",
		"Kh�ng vi�c g�, ch� xem th�i./no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Xem l�i h�nh trang c�a b�n: 1 <color=white>Thi�p b�i s�<color>. nh�p chu�t ph�i �� s� d�ng, c� th� g�i tin t�c b�i s�, c�c cao th� l�n c�n s� nh�n ���c. N�u c� ng��i mu�n nh�n b�n l�m �� t�, ch� c�n x�c nh�n �� tr� th�nh <color=white>�� t� t�m th�i<color>.","Sau khi th�nh �� t� t�m th�i, trong F3 giao di�n s� c� nhi�u <color=yellow>giao di�n th�ng tin s� ��<color>. Xin ch� �!","Khi ��ng c�p c�a b�n ��t <color=green>c�p 10<color>, c� th� chuy�n th�nh �� t� ch�nh th�c. T� ��i v�i s� ph�, sau �� l�m ��ng t�c <color=yellow>'b�i'<color> � kho�ng c�ch g�n, s� tr� th�nh <color=green>�� t� ch�nh th�c<color>.","N�u b�n �� ��ng k� l�m s� ph�, b�n kh�ng ���c b�i ng��i kh�c l�m s� ph�, ph�i h�y b� ��ng k� tr��c.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","B�i s� xong, m�i ng�y s� ph� c�ng b� 1 <color=yellow>Nhi�m v� S� ��<color>, t�ng c�ng c� 7 nhi�m v� �� ch�n, b�n c� th� th��ng l��ng v�i s� ph� s� c�ng b� nhi�m v� n�o. C�ng b� nhi�m v� xong, b�n c� th� nh�n th�y nhi�m v� ���c c�ng b� trong <color=yellow>B�ng tin t�c s� ��<color>, sau �� ch�n <color=yellow>ti�p nh�n nhi�m v�<color>.","K� h�n sau khi truy�n l�nh l� <color=green>24 ti�ng<color>, ph�i ho�n th�nh nhi�m v� trong v�ng 24 ti�ng, trong th�i h�n �� kh�ng ���c giao nhi�m v� kh�c.","Nhi�m v� ho�n th�nh xong, b�n s� nh�n ���c <color=yellow>Ph�n th��ng nhi�m v�<color>. Ph�n th��ng kh�c nhau t�y theo nhi�m v� s� ��.","Ch� �: khi ��t ���c <color=green>c�p 73<color>, ph�n th��ng b�n nh�n ���c s� gi�m c�n m�t n�a, khi ��t ��n <color=green>c�p 80<color>, b�n s� kh�ng c�n ���c nh�n th��ng n�a.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","L�i �ch l�n nh�t l� c� s� ph�, gi�p b�n r�t nhi�u trong ��i s�ng giang h�, c�c s� mu�i, s� ��, s� huynh, s� t� c�ng l� b�n ��ng h�nh tr�n b��c ���ng h�nh t�u giang h� c�a b�n.","Ngay khi tr� th�nh <color=white>�� t� ch�nh th�c<color>, b�n s� nh�n ���c t�i <color=white>'H�u Sinh Kh� �y'<color> � <color=white>Qu�c T� gi�m<color>, ��y l� qu� g�p m�t r�t th�c d�ng c�a s� ph� t�ng b�n.","Khi b�n ��t c�p<color=green>45<color>, ��n <color=green>Qu�c T� gi�m<color> nh�n t�i <color=green>'Ti�n Tr�nh T� C�m'<color>.","Khi b�n ��t c�p<color=green>60<color>, ��n <color=green>Qu�c T� gi�m<color> nh�n t�i <color=green>'S� �� t�nh th�m'<color>.","Khi b�n ��t c�p <color=green>73<color>, c� th� xu�t s�, s� ph� c� th� c�ng b�n ho�n th�nh <color=green>Nhi�m v� xu�t s�<color>. Sau khi ho�n th�nh nhi�m v� s� nh�n ���c t�i <color=green>'S� �n kh� qu�n'<color> l� ph�n th��ng khi xu�t s�.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 c�ch k�t th�c quan h� s� ��, xu�t s�, tr�c xu�t s� m�n v� ph�n b�i s� m�n",
	4,
		"L�m th� n�o �� xu�t s�/tuchushi1",
		"L�m th� n�o �� tr�c xu�t s� m�n/tuchushi2",
		"Ph�n b�i s� m�n l� nh� th� n�o/tuchushi3",
		"Kh�ng vi�c g�, ch� xem th�i./no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi ��t c�p<color=green>73<color>, b�n ��n<color=green>Qu�c T� gi�m<color> t�m s� ph� nh�n nhi�m v� xu�t s�. Nh�n ���c <color=yellow>'Xu�t S� Ti�u'<color>, t� ��i v�i �� �� ra ngo�i th�nh, d�ng Xu�t S� Ti�u g�i ra <color=yellow>Tu�n kh�o Qu�c T� gi�m<color>, l� ng��i c�a tri�u ��nh ph�i ��n �� ki�m tra xu�t s�.","Sau khi g�i tu�n kh�o Qu�c T� gi�m ra, ph�i <color=yellow>��nh b�i h�n<color>. <color=green> Chi�u cu�i c�ng ph�i do b�n ho�n th�nh<color>!","Sau khi ��nh b�i tu�n kh�o Qu�c T� gi�m, b�n v� s� ph� t� ��i, l�m ��ng t�c <color=yellow>'B�i'<color> s� ph� �� xu�t s�.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S� ph� c� th� <color=yellow>tr�c xu�t �� ��<color> ra kh�i s� m�n. \nN�u b� tr�c xu�t s� m�n, b�n c� th� b�i s� kh�c.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"N�u b�n b�t m�n v�i s� ph�, c� th� <color=yellow>Ph�n b�i s� m�n<color>. Trong<color=yellow>Giao di�n s� ��<color>, nh�p <color=yellow>chu�t ph�i<color> ngay t�n s� ph� �� ch�n Ph�n b�i s� m�n.","Ph�n b�i s� m�n ph�i ti�u hao <color=yellow>99 S� �� ph� ch�<color>, ��ng th�i trong <color=yellow>24 gi�<color> sau khi ph�n b�i kh�ng ���c b�i s�. \n N�u b�n l� �� �� t�m th�i, kh�ng c� h�n ch� n�y. <color=yellow>S� ph� kh�ng l�n m�ng t� 7 ng�y tr� l�n c�ng kh�ng b� h�n ch� n�y<color>.")
end



function baishitie()
	if BigGetItemCount(2,1,587) == 0 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		else
			AddItem(2,1,587,1)
		end
	else
		Talk(1,"","C�c h� �� c� 1 thi�p b�i s� r�i , kh�ng c�n l�nh n�a.")	
		return
	end	
end
		