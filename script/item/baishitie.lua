-- ��ʦ��

function OnUse(idx)
	Say("Thi�p B�i S� c� th� gi�p b�n b�i s� ho�c thu nh�n �� t�!",
	5,
	"Ph�t tin b�i s�/bai_shi", 
	"Nh�n th� ti�n c�/thutiencu", 
--	"��n Qu�c T� gi�m t�m hi�u li�n quan s� ��./shou_tu",
	"Thuy�t minh H� th�ng S� ��/see_info2", 
	"�� t� c� th� l�m nhi�m v� S� �� n�o?/renwuchaxun", 
	"Kh�ng l�m g� h�t!/no_say"
	)
end

function bai_shi()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] ~= 0 then
		Say("B�n �� tr� th�nh s� ph�, kh�ng th� g�i tin b�i s�.", 0)
		return
	end
	if tInfo["master"] ~= "" then
		Say("B�n c� s� ph� r�i, kh�ng th� g�i tin b�i s�.", 0)
		return
	end
	
	local nTime = CustomDataRead("mp_p_want_take_on_a_master")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	else
		local nDiffTime = 600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 10���Ӳ�����һ��
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("B�n c�n c�n "..nMin.." Ph�t "..nSec.." gi�y m�i c� th� g�i ti�p tin b�i s�.", 0)
			return
		end
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	end
	
	Want2TakeOnAMaster()
	Say("     B�n �� g�i tin b�i s�, c�c cao th� l�n c�n ��u nh�n ���c, n�u c� ng��i mu�n thu �� ��, s� ch� ��ng li�n h� v�i b�n. \n <color=yellow>N�u th�y c� ng��i n�i chuy�n v�i b�n, ch� c�n �n Ctrl+chu�t ph�i ngay c�u n�i �� �� tr� l�i. <color>\n Tin b�i s� c� th� duy tr� trong 10 ph�t, c�c s� ph� v� h�c c� th� th�y ���c tin b�i s� c�a b�n trong 10 ph�t, trong th�i gian �� b�n c� th� l�m v�c kh�c. <color=yellow>n�u b�n l� t�n th�, �� ngh� b�n t�i D� Song g�n n�i b�n xu�t th�n �� nh�n nhi�m v� c�a t�n th� . <color>\n N�u sau 10 ph�t v�n ch�a c� ai nh�n b�n l�m �� t�, b�n c� th� g�i l�i tin b�i s� l�n n�a.\n Hi v�ng b�n c� th� t�m ���c s� ph� t�i ��c.",1,"��ng �/no_say")
end
function thutiencu()
AddItem(2,1,1200,3)
--AddItem(2,1,15,10)
--AddItem(2,1,199,1)
--AddItem(2,1,30609,1)
--AddItem(2,1,585,1)
end

function shou_tu()
	Say("N�u b�n mu�n nh�n �� t�, c� th� ��n <color=yellow>Qu�c T� gi�m<color> � Bi�n Kinh, c� vi�n quan tri�u ��nh ph� tr�ch v� vi�c li�n quan ��n s� ��. Truy�n tin �i ph�i c�n 10 b�c ( c�p 20 tr� l�n mi�n ph�)!", 2, "��ng �/yes_shou_tu", "H�y b�/no_say")
end

function yes_shou_tu()
	if GetFightState() == 1 then
		Say("Ch� s� d�ng ���c trong th�nh", 0)
		return
	end
	if GetLevel() >= 20 then
		if GetCash() < 1000 then
			Say("B�n kh�ng c� �� 10 b�c, kh�ng th� g�i", 0)
			return
		end
		Pay(1000)
	end
	NewWorld(200,1458,2755)
end


function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("B�n mu�n bi�t th�ng tin s� ph� hay �� t�? Xin nh�c nh� 1 ch�t, H� th�ng S� �� c� r�t nhi�u thao t�c, m� <color=yellow>giao di�n th�ng tin s� ��<color>, sau �� nh�p chu�t ph�i v�o t�n ng��i mu�n thao t�c �� xu�t hi�n <color=yellow>giao di�n thao t�c<color>.",
		3,
		"Ta mu�n xem n�i dung v� s� ph�/shifu",
		"Ta mu�n xem n�i dung v� �� t�/tudi",
		"Kh�ng vi�c g�, ch� xem th�i./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("Th�ng tin s� ph� nh� sau, b�n mu�n bi�t n�i dung n�o. H� Th�ng S� M�n c� r�t nhi�u ch�c n�ng, m� <color=yellow>giao di�n th�ng tin s� ��<color>, sau �� nh�p chu�t ph�i v�o t�n ng��i mu�n thao t�c �� xu�t hi�n <color=yellow>giao di�n thao t�c<color>.",
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
	Talk(4,"shifu","N�u b�n mu�n nh�n �� t�, ph�i ��n <color=yellow>Qu�c T� gi�m <color> ��ng k�, sau �� c� th� m� giao di�n <color=yellow>'Th�ng Tin S� ��'<color> ","��ng k� xong, nh�n F3 s� xu�t hi�n <color=yellow>'Trang B� Thu�c T�nh'<color> Trong giao di�n s� c� th�m <color=yellow>'Th�ng Tin S� ��<color>, c� th� xem ���c t�nh h�nh k� nghi�p th�y c�a b�n. N�u ch�n m�c d��i g�c tr�i <color=yellow>'M� ra nh�n �� t�'<color>, c� th� th�y ���c ng��i n�o � g�n c�n b�i s�, �� t�m ��n h�.","N�u b�n th�y ���c ��ng c�p ng��i n�o th�p h�n m�nh, �n <color=yellow> Ctrl+Chu�t ph�i<color> v�o ng��i ��, ch�n <color=yellow>'Thu �� ��\'<color>. N�u ng��i �� ��ng �, s� tr� th�nh <color=green>�� t� t�m th�i<color> c�a b�n.","Khi ��ng c�p <color=green>�� t� t�m th�i<color> ��t t�i <color=yellow>10<color>, s� tr� th�nh �� t� ch�nh th�c. Ch� c�n c� ly gi�a b�n v� t� �� t� g�n nhau, �� t� <color=yellow>'B�i'<color> 1 l�n, s� th�nh <color=green>�� t� ch�nh th�c<color>!")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Khi �� l� s� ph�, m�i ng�y c� th� t�i <color=yellow> Qu�c T� gi�m<color> �� truy�n <color=yellow>Nhi�m v� S� ��<color>, t�ng c�ng c� 7 nhi�m v� �� ch�n. Sau khi truy�n nhi�m v�, l�nh �� c� th� nh�n nhi�m v� <color=yellow>trong giao di�n th�ng tin S� ��<color>.","K� h�n sau khi truy�n l�nh l� <color=yellow>24 ti�ng<color>, ngh�a l� ph�i ho�n th�nh xong nhi�m v� trong v�ng 24 ti�ng. ��ng th�i ch� ���c truy�n 1 nhi�m v� trong v�ng 24 ti�ng �� m� th�i.","Khi �� ho�n th�nh nhi�m v�, l�nh �� nh�n ���c ph�n th��ng nhi�m v�, c�n b�n l� s� ph�, s� c� ���c <color=yellow>�i�m S� ��<color>. Nhi�m v� m� 1 �� t� ho�n th�nh trong ng�y c� th� �em cho s� ph� <color=green>10<color>�i�m S� ��. <color=yellow>�� t� c�ng nhi�u, s� �i�m S� �� c�a b�n c�ng cao<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>�i�m S� ��<color> l� ph�n th��ng m� s� ph� nh�n ���c sau khi �� t� ho�n th�nh Nhi�m v� S� ��. 1 �� t� ho�n th�nh xong nhi�m v� trong th�i gian qui ��nh s� t�ng cho s� ph� <color=green>10<color> �i�m S� ��. T�c d�ng c�a �i�m S� �� <color=yellow> chuy�n th�nh ph�n th��ng c�a s� ph�<color> ho�c <color=yellow>chuy�n th�nh �i�m S� ��c<color>.","S� ph� c� th� ��n <color=yellow> Qu�c T� gi�m <color> l�y �i�m S� �� chuy�n th�nh ph�n th��ng, <color=yellow>m�i �i�m chuy�n th�nh 1 ph�n th��ng<color>. Chuy�n th�nh �i�m s� ph�i ti�u hao <color=yellow>S� �� ph� ch�<color> m�i l�n chuy�n 1 �i�m S� �� ph�i ti�u hao 1 t� S� ��. <color=green>nh�ng c�n c� ��ng c�p th� nghi�p cao th�p c�a s� ph� m� tr�c ti�p chuy�n ��i 1 b� ph�n ph�n th��ng<color>.","S� ph� c�ng c� th� l�y �i�m S� �� chuy�n th�nh <color=yellow>�i�m S� ��c<color>, c�ng ph�i ti�u hao<color=yellow>S� �� ph� ch�<color> m�i l�n chuy�n 1 �i�m S� �� ph�i m�t 1 t� s� ��. Xin l�u �, <color=green>L�c chuy�n �i�m S� �� c�n c� S� �� ph� ch�, kh�ng th� c�n c� ��ng c�p th� nghi�p c�a s� ph� m� chuy�n ��i<color>.","T� khi t�nh Nhi�m v� S� �� c�a s� ph� giao cho , <color=green>�i�m S� �� s� b�ng 0 sau 24 ti�ng<color>. Ngh�a l� �i�m s� �� ��t ���c sau m�i nhi�m v� s� kh�ng l�u l�i trong nhi�m v� l�n sau.","��ng c�p th� nghi�p c�ng cao, �i�m s� �� nh�n ���c c�ng nhi�u.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"�i�m S� �� l� tr� s� <color=yellow>Th� Nghi�p ��ng C�p<color> ���c x�c ��nh, do �i�m S� �� c�ng th�m S� �� ph� ch�, ���c ti�n h�nh chuy�n ��i t�i <color=yellow>Qu�c T� gi�m<color>.","�i�m S� �� m�i ng�y s� gi�m �i <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"Th� Nghi�p ��ng C�p th� hi�n ��ng c�p c�a b�n khi l� s� ph�, do s� s� l��ng �i�m S� ��c quy�t ��nh. <color=yellow>�i�m S� ��c c�ng nhi�u , th� nghi�p ��ng c�p c�ng cao, b�n c� th� thu nh�n �� t� c�ng nhi�u <color>. Hi�n t�i c�p cao nh�t c�a Th� Nghi�p ��ng C�p l� 10, �� t� thu nh�n c� th� l�n ��n 15 ng��i.","D��i ��y l� thuy�t minh c�a 10 Th� Nghi�p ��ng C�p c� b�n: \n\nC�p 1 �i�m S� ��c <color=yellow>0<color> d�n ���c <color=yellow>3<color> �� ��. C�p 6 �i�m S� ��c <color=yellow>1200<color> d�n ���c <color=yellow>8<color> �� ��\nC�p 2 �i�m S� ��c <color=yellow>100<color> d�n ���c <color=yellow>4<color> �� ��. C�p 7 �i�m S� ��c <color=yellow>1600<color> d�n ���c <color=yellow>9<color> �� ��\n C�p 3 �i�m S� ��c <color=yellow>300<color> d�n ���c <color=yellow>5<color> �� ��. C�p 8 �i�m S� ��c <color=yellow>2000<color> d�n ���c <color=yellow>10<color> �� ��\n�cp 4 �i�m S� ��c <color=yellow>550<color> d�n ���c <color=yellow>6<color> �� ��. C�p 9 �i�m S� ��c <color=yellow>2500<color> d�n ���c <color=yellow>12<color> �� ��\nC�p 5 �i�m S� ��c <color=yellow>850<color> d�n ���c <color=yellow>7<color> �� ��. C�p 10 �i�m S� ��c <color=yellow>3000<color> d�n ���c <color=yellow>15<color> �� ��")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa H�ng Qu�c T� Gi�m<color>l� tri�u ��nh x�y d�ng �� khen th��ng cho v� h�c. B�n c� th� k�u l�nh �� ��n <color=yellow> Qu�c T� gi�m<color><color=yellow>mua Hoa H�ng<color>, khi l�nh �� ng�y m�t tr��ng th�nh, b�n c� th� nh�n ���c <color=yellow>b�ng l�c t��ng �ng<color>. N�u l�nh �� xu�t s� v� ��t y�u c�u, b�n c� th� nh�n ���c h�n g�p <color=green>6 l�n<color> b�ng l�c Hoa H�ng.","Xin l�u �, <color=yellow>t� khi b�i s� tr� th�nh �� t� ch�nh th�c, nh�ng b�ng l�c tr��c ��y s� ph� kh�ng nh�n ���c<color>. N�u nh� �� t� c�p 65 ch�nh th�c b�i s� tr� th�nh �� t� ch�nh th�c, b�ng l�c tr��c c�p 65 nh� c�p 30, 40, 50 v� 60, s� ph� s� kh�ng nh�n ���c.","<color=yellow>M�i s� ph� ch� nh�n b�ng b�c m� hi�n t�i �� t� ch�a nh�n<color>. N�u �� t� n�o ��t �i�u ki�n th� s� ph� tr��c s� nh�n b�ng l�c, s� ph� sau kh�ng nh�n ���c. Sau khi 2 ng��i ch�i k�t l�m s� �� t�m th�i, s� ph� c� th� xem ���c s� ph� tr��c c�a �� t� �� nh�n ���c b�ng l�c n�o tr�n giao di�n s� �� b�ng c�ch nh�p chu�t ph�i m�c 'Tra xem Hoa h�ng'")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>B�ng l�c Qu�c T� gi�m <color> l� n�i h�i b�o c�a tri�u ��nh v� vi�c b�n mua Hoa H�ng b�i d��ng �� t�, mua nh�ng v�t ph�m qu� hi�m � <color=yellow>Qu�c T� gi�m<color>.","Hi�n t�i � <color=yellow>Qu�c T� gi�m<color> c� b�n r�t nhi�u v�t ph�m, b�ng l�c Qu�c T� gi�m.","Nh�n b�ng l�c Qu�c T� gi�m kh�ng ���c ��n <color=yellow> Qu�c T� gi�m <color>, tr�c ti�p l�m tr�n <color=yellow>giao di�n s� ��<color>. Tr�n chu�t ph�i ch� t�n �� t�, ch�n Hoa H�ng tr�n <color=yellow>giao di�n Hoa H�ng<color>. C� th� tra xem t�nh h�nh tr��ng th�nh c�a �� t� tr�n giao di�n Hoa H�ng, c� th� <color=yellow>nh�n b�ng l�c<color> trong giao di�n n�y.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 lo�i ch�m d�t quan h� th�y tr�: xu�t s�, tr�c xu�t s� m�n v� ph�n b�i s� m�n.",
		4,
		"L�m th� n�o �� xu�t s�/shichushi1",
		"L�m th� n�o �� tr�c xu�t s� m�n/shichushi2",
		"Ph�n b�i s� m�n l� nh� th� n�o/shichushi3",
		"Kh�ng vi�c g�, ch� xem th�i./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi l�nh �� ��t ��n<color=green>73<color> c�p, b�n c� th� ��n <color=yellow>Qu�c T� gi�m<color> nh�n nhi�m v� xu�t s�. Nh�n ���c <color=yellow>'Xu�t S� Ti�u'<color>, t� ��i v�i �� �� ra ngo�i th�nh, d�ng Xu�t S� Ti�u g�i ra <color=yellow>Tu�n kh�o Qu�c T� gi�m<color>, l� ng��i c�a tri�u ��nh ph�i ��n �� ki�m tra xu�t s�.","Sau khi g�i tu�n kh�o Qu�c T� Gi�m ra, ph�i <color=yellow>��nh b�i<color> h�n. Xin l�u �, <color=green> b��c cu�i c�ng ph�i do l�nh �� ho�n th�nh<color>.","Sau khi ��nh b�i tu�n kh�o Qu�c T� Gi�m, b�n v� nh�m l�nh �� d�ng ��ng t�c <color=yellow>'B�i'<color> � c� li g�n �� xu�t s�.","N�u <color=yellow>Hoa H�ng Qu�c T� Gi�m<color> m� �� t� b�n mua khi <color=green>xu�t s� ���c100% b�ng l�c<color>; <color=green>sau 15 ng�y<color>, <color=green>c� th� l�i nh�n ���c 100% b�ng l�c<color>; <color=green>h�n 15 ng�y<color>, <color=green>c�n nh�n th�m 100% b�ng l�c<color>, <color=green> t�ng c�ng l� 300% b�ng l�c<color>. Xin nh�n th��ng tr�n giao di�n th�ng tin s� ��.")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi �� t� kh�ng ��t th� <color=yellow>Tr�c xu�t s� m�n<color>. C�ch tr�c xu�t s� m�n: trong <color=yellow>giao di�n s� ��<color>, ch� v�o <color=yellow>chu�t ph�i<color> t�n �� t� mu�n tr�c xu�t, r�i tr�c xu�t ti�p �� t� kh�c.","L�c tr�c xu�t �� t� ph�i ti�u hao <color=yellow>99 t� s� ��<color>, ��ng th�i kh�ng ���c nh�n �� t� trong v�ng <color=yellow>24 ti�ng<color>. \n Tr�c xu�t �� t� t�m th�i kh�ng c� m�t h�n ch� n�y. <color=yellow>�� t� ch�nh th�c r�i m�ng t� 7 ng�y tr� l�n c�ng kh�ng c� h�n ch� ��<color>.","N�u �� �� t� n�y mua <color=yellow>Hoa H�ng Qu�c T� Gi�m<color>, sau khi b� tr�c xu�t<color=green>nh�ng b�ng l�c li�n quan m� �� t� �� ch�a nh�n s� b� h�y b�<color>. \n �� ��n b�, <color=green>sau khi b� tr�c xu�t 15 ng�y, �� t� n�y nh�n ���c 80% b�ng l�c<color>, <color=green>h�n 15 ng�y<color>, <color=green>nh�n th�m 80% b�ng l�c<color>, <color=green>t�ng c�ng 160% b�ng l�c<color>. Xin l�u � ch� ���c nh�n trong giao di�n th�ng tin s� ��.")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"�� t� c� th� s� <color=yellow>ph�n b�i s� m�n<color>. Xin ch� � �i�m n�y, ph�i ngh� ��n c�m nh�n c�a �� t�.","N�u �� �� t� n�y mua<color=yellow>Hoa H�ng Qu�c T� Gi�m<color>, sau khi ph�n b�i s� m�n, <color=green>nh�ng b�ng l�c m� �� t� n�y ch�a nh�n s� b� h�y b�<color>. \n �� ��n b�, <color=green>15 ng�y sau khi ph�n b�i s� m�n ���c nh�n 100% b�ng l�c<color>, <color=green>h�n 15 ng�y<color>, <color=green>nh�n ���c 100% b�ng l�c<color>,<color=green>t�ng c�ng 200% b�ng l�c<color>. Ch� ���c nh�n trong giao di�n th�ng tin s� ��.")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("Th�ng tin �� t� nh� sau, b�n mu�n bi�t v� ph�n n�o. Xin nh�c nh� 1 ch�t, nhi�u thao t�c c�a H� th�ng S� ��, l� nh�ng <color=yellow>chu�t ph�i ch� t�n ng��i xu�t hi�n tr�n menu<color> sau khi <color=yellow>giao di�n th�ng tin s� ��<color> ���c m� ra.",
		5,
		"L�m c�ch n�o �� b�i s�/baishi",
		"Nhi�m v� S� �� sau khi b�i s� l� g�/turenwu",
		"Sau khi b�i s� c� th� nh�n ���c ph�n th��ng n�o/jiangli",
		"L�m sao ch�m d�t quan h� S� ��/tuchushi",
		"Kh�ng vi�c g�, ch� xem th�i./no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Ki�m tra l�i h�nh trang c�a b�n, b�n trong c� 1 t�m <color=yellow>thi�p b�i s�<color>. nh�p chu�t ph�i �� s� d�ng thi�p b�i s�, m�i g�i ���c thi�p b�i s�, c�c s� ph� l�n c�n ��u nh�n ���c. <color=green>N�u ch�n ra ng��i mu�n nh�n b�n l�m �� t�<color>, ch� c�n x�c nh�n ch�n l� tr� th�nh <color=green>�� t� t�m th�i<color>. ","Sau khi th�nh �� t� t�m th�i, trong F3 giao di�n s� c� nhi�u <color=yellow>giao di�n th�ng tin s� ��<color>. Xin ch� �!","L�c b�n ��t ���c <color=green> c�p 10<color>, s� th�nh �� t� ch�nh th�c. C� th�: h�p th�nh ��i v�i s� ph�, sau �� d�ng ��ng t�c <color=yellow>'B�i'<color> � c� li g�n l� tr� th�nh <color=green>�� t� ch�nh th�c<color>.","N�u b�n �� ��ng k� l�m s� ph� th� kh�ng th� b�i s� ���c n�a.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Sau khi b�i s�, s� ph� ��u truy�n <color=yellow>Nhi�m v� S� ��<color> m�i ng�y, t�ng c�ng c� 7 nhi�m v� �� ch�n. B�n c� th� trao ��i v�i s� ph� v� ch�n nhi�m v� l�m. Sau khi truy�n l�nh, b�n c� th� th�y ���c c�c nhi�m v� trong<color=yellow>giao di�n th�ng tin s� ��<color>, sau �� ch�n <color=yellow>nhi�m v�<color>.","K� h�n sau khi truy�n l�nh l� <color=green>24 ti�ng<color>, ph�i ho�n th�nh nhi�m v� trong v�ng 24 ti�ng, trong th�i h�n �� kh�ng ���c giao nhi�m v� kh�c.","Sau khi ho�n th�nh nhi�m v�, b�n s� nh�n ���c <color=yellow>khen th��ng nhi�m v�<color>. Nhi�m v� kh�ng gi�ng nhau, ph�n th��ng c�ng kh�ng gi�ng nhau.","Ch� �: khi ��t ���c <color=green>c�p 73<color>, ph�n th��ng b�n nh�n ���c s� gi�m c�n m�t n�a, khi ��t ��n <color=green>c�p 80<color>, b�n s� kh�ng c�n ���c nh�n th��ng n�a.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","L�i �ch l�n nh�t c�a b�n l� c� ���c s� ph�, s� ph� s� gi�p �ch r�t nhi�u trong cu�c ��i giang h� c�a b�n, s� ��, s� huynh, s� mu�i, s� t� ��u l� nh�ng ng��i b�n ��ng h�nh tr�n giang h� c�a b�n.","C� th�: ngay khi b�n tr� th�nh <color=green>�� t� ch�nh t�c<color>, b�n c� th� t�i <color=yellow>Qu�c T� gi�m <color> nh�n bao <color=green>'H�u Sinh Kh� �y'<color>, ��y l� qu� g�p m�t c�a s� ph� ��i v�i b�n, trang b� b�n trong ��u l� nh�ng m�n th�c d�ng ��i v�i t�n th� l� b�n.","Khi ��t <color=green>c�p 45<color>, c� th� t�i <color=yellow>Qu�c T� gi�m<color> nh�n bao <color=green>'Ti�n Tr�nh T� C�m'<color>.","Khi ��t <color=green>c�p 60<color>, ��n <color=yellow>Qu�c T� gi�m<color> nh�n bao <color=green>'S� �� T�nh Th�m'<color>.","Khi ��t <color=green>c�p 73<color> c� th� xu�t s�, b�n c� th� c�ng s� ph� ho�n th�nh <color=yellow>nhi�m v� xu�t s�<color>. Sau khi xong nhi�m v� ���c nh�n bao <color=green>'S� �n kh� qu�n'<color>, ��y l� ph�n th��ng c�a s� ph� ��i v�i s� tr��ng th�nh c�a b�n.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("C� 3 lo�i ch�m d�t quan h� th�y tr�: xu�t s�, tr�c xu�t s� m�n v� ph�n b�i s� m�n.",
	4,
		"L�m th� n�o �� xu�t s�/tuchushi1",
		"L�m th� n�o �� tr�c xu�t s� m�n/tuchushi2",
		"Ph�n b�i s� m�n l� nh� th� n�o/tuchushi3",
		"Kh�ng vi�c g�, ch� xem th�i./no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi ��t <color=green>c�p 73<color>, ��n <color=yellow>Qu�c T� gi�m<color> t�m s� ph� �� nh�n nhi�m v� xu�t s�. Nh�n ���c <color=yellow>'Xu�t S� Ti�u'<color>, t� ��i v�i �� �� ra ngo�i th�nh, d�ng Xu�t S� Ti�u g�i ra <color=yellow>Tu�n kh�o Qu�c T� gi�m<color>, l� ng��i c�a tri�u ��nh ph�i ��n �� ki�m tra xu�t s�.","Sau khi g�i tu�n kh�o Qu�c T� gi�m ra, ph�i <color=yellow>��nh b�i<color> h�n. Ch� �<color=green>b��c cu�i c�ng ph�i ch�nh b�n ho�n th�nh<color>.","Sau khi ��nh b�i tu�n kh�o Qu�c T� gi�m, b�n v� s� ph� t� ��i, l�m ��ng t�c <color=yellow>'B�i'<color> s� ph� �� xu�t s�.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S� ph� c� th�<color=yellow>tr�c xu�t s� m�n<color> �� t�, ph�i ch� � ��u n�y. \n N�u b� tr�c xu�t s� m�n, b�n ph�i b�i ng��i kh�c l�m s� ph�.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"N�u b�n b�t m�n v�i s� ph�, c� th�<color=yellow>ph�n b�i s� m�n<color>. C�ch l�m: trong <color=yellow>giao di�n s� ��<color>, nh�p <color=yellow>chu�t ph�i<color> v�o t�n s� ph� �� ch�n ph�n b�i s� m�n.","Ph�n b�i s� m�n ph�i ti�u hao<color=yellow>99 s� �� ph� ch�<color>, ��ng th�i sau khi ph�n b�i s� m�n trong v�ng <color=yellow>24 ti�ng<color> kh�ng th� b�i s�. \n N�u b�n l� �� t� t�m th�i, kh�ng c� h�n ch� n�y. <color=yellow>s� ph� r�i m�ng t� 7 gnay2 tr� l�n c�ng kh�ng c� h�n ch� nh� v�y<color>.")
end



function no_say()
end


	
function renwuchaxun()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"no_say","    Khi tr� th�nh �� t� ch�nh th�c c�a ng��i kh�c, m�i ng�y ��u ho�n th�nh 1 Nhi�m v� S� �� do s� ph� truy�n <color=yellow> khi sau khi ho�n th�nh nhi�m v�, s� nh�n th��ng t�y theo nhi�m v�, s� ph� ���c �i�m S� ��. <color>\n M�t khi �� t� ��t c�p 73, ph�n th��ng gi�m �i m�t n�a; c�p 80 s� kh�ng c� th��ng. \n Nhi�m v� S� �� t�ng c�ng c� 7 lo�i, m�i ng�y ch�n 1 trong �� �� giao nhi�m v�<color=yellow>sau khi b�i s� d�a theo y�u c�u v� trao ��i c�a b�n v�i s� ph� �� ch�n nhi�m v�<color>.","Gi�i th�u Nhi�m v� S� ��: \n1 Ho�n th�nh 2 l�n nhi�m v� S� c�p s� m�n ho�c 20 th��ng h�i, m�c �� ��ng g�p s� m�n 15 �i�m, <color=white>Danh v�ng 50 �i�m<color>\n2 Ho�n th�nh 5 l�n nhi�m v� s�t th� ho�c 20 l�n th��ng h�i, danh v�ng: 50 �i�m\n3 1 l�n ��nh tr�n ho�c ho�n th�nh 20 l�n th��ng h�i, ghi c�ng 150 ��m <color=white>kinh nghi�m (��ng c�p* ��ng c�p*110)<color>\n4 T�ng ki�m 2 l�n ho�c 20 l�n th��ng h�i, kinh nghi�m (��ng c�p*��ng c�p*110)\n5 Th�i H� qu� 4 ph� qu�i ho�c ho�n th�nh 20 l�n th��ng h�i, kinh nghi�m (��ng c�p*��ng c�p*120)\n6 ch�y xong 4 l�n thuy�n r�ng ho�c 20 l�n th��ng h�i, kinh nghi�m (��ng c�p*��ng c�p*110)\n7 ��nh v� ��i 1 m�nh: 5 l�n ho�c 20 l�n th��ng h�i, kinh nghi�m (��ng c�p*��ng c�p*100)\n<color=white>Ch� m�u tr�ng l� th��ng cho �� t� kh�ng thu�c m�n ph�i n�o, ph�n th��ng c�a m�i nhi�m v� kh�ng gi�ng nhau<color>.")
end

