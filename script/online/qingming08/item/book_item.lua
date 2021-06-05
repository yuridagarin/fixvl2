--�ű����ƣ������ڻָ��ʹ�ýű�
--�ű����ܣ��������ڻ�Ľ���
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-14
--�����޸ļ�¼��2008-03-20byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\qingming08\\head_qingming.lua")

tomb_sweep_2008_task_reel_completed = 1849		--����ɵ�������
tomb_sweep_2008_times_count = 1851					--�ݼ��Ĵ���ͳ��
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_goods_use_diff = 1859
tomb_sweep_2007_task_reel_diff = 1854
function OnUse()
	Say("� ��y ghi r� ho�t ��ng <color=yellow>Ti�t Thanh Minh<color>, b�n mu�n t�m hi�u m�c n�o?",
	4,
	"Xem ti�n tri�n ho�t ��ng/player_step_inq",
	"Xem n�i dung ho�t ��ng./tomb_sweep_2007_inf",
	"Ti�t Thanh Minh/tomb_sweep_story",
	"��ng h��ng d�n/end_dialog"
	)
end
--************************���չ��ѯ***************************
function player_step_inq()
	local kotowl_today_chk = "Ch�a b�i t�!"
	if GetTask(tomb_sweep_2008_date_seq) >= zgc_pub_day_turn(1) then
		kotowl_today_chk = "�� b�i t�"
	end
	local totowl_times_count = GetTask(tomb_sweep_2008_times_count)
	if totowl_times_count == nil then
		totowl_times_count = 0
	end
	local task_inf = ""
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	local task_reel_table = {}
	if task_diff ~= 0 and task_diff ~= nil then
		if IS_SHOUFEI == TRUE then
			task_reel_table = {
				"<color=yellow>N�i dung<color>: Ngo�i th�nh c� m�y t�n <color=yellow>C�n ��<color> l�m h�i b� t�nh, �i ��nh b�i <color=yellow>30<color> t�n, sau �� ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng: 95%<color> x�c su�t <color=yellow>nh�n ��i<color> kinh nghi�m ho�c <color=yellow>5%<color> x�c su�t g�p <color=yellow>11<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung nhi�m v�: �u�i h�<color> L�m thu�c c� th� �i�u tr� c�c b�nh t�t, thu th�p <color=yellow>20<color> <color=yellow>�u�i h�<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: x�c su�t 90% nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>10%<color> x�c su�t g�p <color=yellow>6<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung: Quan s�<color> � <color=yellow>D��ng Trung ��ng<color> h� hi�p b� t�nh, gi�o hu�n <color=yellow>30<color> t�n m�t b�i h�c sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: x�c su�t 84% nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>16%<color> x�c su�t g�p <color=yellow>4<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, �i thu th�p 10 <color=yellow>Linh Chu t�<color>, 10 <color=yellow>Da g�u<color> sau �� �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: 80% x�c su�t nh�n ��i <color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>20%<color> x�c su�t g�p <color=yellow>3.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>, ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: 70% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>30%<color> g�p <color=yellow>2.7<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: T�m <color=yellow>2 Linh th�ch c�p 2<color>, <color=yellow>2 Linh th�ch c�p 3<color> ��t v�o T� Linh ��nh xong, ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: 60% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>40%<color> x�c su�t g�p <color=yellow>2.25<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>:Hi�n tri�u ��nh c�n m�t s� v�t li�u, �i thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>, 10 <color=yellow>b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: 50% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>50%<color> x�c su�t g�p <color=yellow>2<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: � Long M�n tr�n c� <color=yellow>Cao th� quan ngo�i<color> h� hi�p b� t�nh, h�y �i ��nh <color=yellow>30<color> t�n trong b�n ch�ng, sau �� ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: 35% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>65% x�c su�t<color> g�p <color=yellow>1.75<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: T�m <color=yellow>2 Linh th�ch c�p 4<color> ��t v�o T� Linh ��nh xong ��n g�p Th� l�ng m� ph�c m�nh.\n    <color=yellow>Ph�n th��ng: x�c su�t 45%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.65<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung <color>: Sa m�c m� cung c� <color=yellow>T�m b�o nh�n<color> t�n c�ng nhi�u nh�n s� giang h�, h�y ��nh b�i <color=yellow>30<color> t�n trong b�n ch�ng, ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: Ph�n th��ng: 100%<color> g�p <color=yellow>1.5<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."
			}
		else
			task_reel_table = {
				"<color=yellow>N�i dung<color>: Ngo�i th�nh c� nh�ng t�n <color=yellow>C�n ��<color> l�m h�i b� t�nh, �i ��nh b�i <color=yellow>30<color> t�n, sau �� ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng: 95%<color> x�c su�t <color=yellow>nh�n ��i<color> kinh nghi�m ho�c <color=yellow>5%<color> x�c su�t g�p <color=yellow>11<color>l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>",
				"<color=yellow>N�i dung: �u�i h�<color> l�m thu�c c� th� �i�u tr� c�c b�nh t�t, thu th�p <color=yellow>20<color> <color=yellow>�u�i h�<color> sau �� quay v� <color=yellow>Th� l�ng m�<color>ph�c m�nh.\n<color=yellow>Ph�n th��ng: x�c su�t 90% nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>10%<color> x�c su�t g�p <color=yellow>6<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung: Quan s�<color> � <color=yellow>D��ng Trung ��ng<color> h� hi�p b� t�nh,  gi�o hu�n <color=yellow>30<color> t�n m�t b�i h�c sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: x�c su�t 84% nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>16%<color> x�c su�t g�p <color=yellow>4<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: Hi�n tri�u ��nh c�n thu th�p <color=yellow>4 Linh th�ch c�p 1<color>, ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: 80% x�c su�t nh�n ��i <color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>20%<color> x�c su�t g�p <color=yellow>3.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>",
				"<color=yellow>N�i dung<color>:Nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>, ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� Th� l�ng m�<color> ph�c m�nh.\n<color=yellow>Ph�n th��ng: 70% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>30%<color> g�p <color=yellow>2.7<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: T�m <color=yellow>2 Linh th�ch c�p 2<color>, <color=yellow>2 Linh th�ch c�p 3<color> ��t v�o T� Linh ��nh, ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: Ph�n th��ng: 60% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>40%<color> x�c su�t g�p <color=yellow>2.25<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>Nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, �i thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>, 10 <color=yellow>b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n <color=yellow>Ph�n th��ng: 50% x�c su�t nh�n ��i<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m ho�c <color=yellow>50%<color> x�c su�t g�p <color=yellow>2<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color>: <color=yellow>Cao th� quan ngo�i<color> � Long M�n tr�n �� th��ng nhi�u b� t�nh, h�y ��nh b�i <color=yellow>30<color> t�n sau �� t�m <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: 35%<color> x�c su�t <color=yellow>nh�n ��i<color> kinh nghi�m ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.75<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung<color: T�m <color=yellow>2 Linh th�ch c�p 4<color> ��t v�o T� Linh ��nh xong ��n ph�c m�nh Th� l�ng m�.\n    <color=yellow>Ph�n th��ng: 45% x�c su�t <color>  <color=yellow>g�p ��i<color> ho�c <color=yellow>65%<color> g�p <color=yellow>1.65 l�n<color> �i�m s�c kh�e chuy�n �i�m kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>.",
				"<color=yellow>N�i dung: � Sa m�c m� cung <color> c� <color=yellow>T�m b�o nh�n<color> �� th��ng kh�ng �t nh�n s� giang h�, sau khi ��nh b�i <color=yellow>30<color> ng��i, ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng: 100%<color> x�c su�t g�p <color=yellow>1.5 l�n<color> �i�m s�c kh�e ��i �i�m kinh nghi�m. N�u ng��i ch�i c�p 99 s� nh�n ���c  <color=yellow>2 quy�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."
			}
		end
		Talk(1,"","Nhi�m v� hi�n t�i:\n    T�ng c�ng b�n b�i t� <color=yellow>"..totowl_times_count.." <color> l�n, h�m nay "..kotowl_today_chk.."Hi�p Ch�ng. \nHi�n b�n nh�n m�t �� nhi�m v� th� <color=yellow>"..task_diff.."<color>, tin t�c: \n"..task_reel_table[task_diff].."\nS� l�n ho�n th�nh nhi�m v� c�a b�n hi�n l�: <color=yellow>"..GetTask(tomb_sweep_2008_task_reel_completed).."<color>!")
	else
		Talk(1,"","Nhi�m v� hi�n t�i:\n    T�ng c�ng b�n b�i t� <color=yellow>"..totowl_times_count.." <color> l�n, h�m nay "..kotowl_today_chk.."Hi�p Ch�ng. \nHi�n b�n ch�a nh�n m�t �� nhi�m v� Ti�t Thanh Minh!".."\nS� l�n ho�n th�nh nhi�m v� c�a b�n hi�n l�: <color=yellow>"..GetTask(tomb_sweep_2008_task_reel_completed).."<color>!")
	end
end
--***************************�����****************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"    Th�i gian ho�t ��ng: <color=yellow>3-4 ��n 12-4<color>.\n    Th�n l� n� nhi giang h� ph�i n�n b�i t� t�o m� c�c v� anh h�ng v�o d�p t�t Thanh Minh, trong �� m� ph�n c�a <color=yellow>Ho�ng ��i hi�p, H�n ��i hi�p, Hi�n Vi�n ��i hi�p<color> l� n�n �i b�i t� nh�t.",
	"     Trong th�i gian ho�t ��ng Thanh Minh, m�i ng�y ��n m� b�i t� c�c ��i hi�p <color=yellow>1<color> l�n, c�ng l� d�ng ��ng t�c '<color=yellow>b�i<color>'. Nh�n ph�n th��ng c�a c�c ��i hi�p s� gi�p kinh nghi�m giang h� c�a b�n t�ng l�n, t�ch l�y th�nh t�m b�i t� <color=yellow>8<color> ng�y c� th� nh�n ���c ph�n th��ng l�n h�n."
	)
end
function tomb_sweep_2007_inf_1()
	local nTemp = 0
	if IS_SHOUFEI == TRUE then
		nTemp = 2
	else
		nTemp = 1
	end
	Talk(2,"","     M�i ng�y khi b�i t� c� th� nh�n ���c nhi�m v� t� <color=yellow>Th� L�ng M�<color>. Sau khi ho�n th�nh nhi�m v� �em <color=yellow>m�t t�ch n�y<color> ��n <color=yellow>Th� L�ng M�<color> ph�c m�nh �� nh�n <color=yellow>Ph�n th��ng<color> v� <color=yellow>v�t ph�m b�i t�<color>, m�i ng�y m�i ng��i c� th� l�m"..nTemp.." l�n nhi�m v� m�t t�ch, t�ch l�y ho�n th�nh <color=yellow>8<color> l�n, c� th� nh�n nhi�u ph�n th��ng h�n",
		"    Tr��c khi s� d�ng v�t ph�m b�i t� s� d�ng ch�ng c� th� t�ng t� l� nh�n ���c kinh nghi�m giang h�, n�u �� b�i t� r�i kh�ng th� t�i s� d�ng. T�ch l�y �� 8 l�n nhi�m v� m�t t�ch c� th� ���c ph�n th��ng c�a Th� L�ng M� c�c v� ��i hi�p. Nghe n�i <color=yellow>Ng� C�c<color> c� b�n <color=yellow>Gi�y c�ng t�<color> �� t�ng s� l�n nhi�m v� m�t t�ch trong ng�y v� <color=yellow>h�p m�t t�ch nhi�m v�<color>."
)
end
--**************************����������***************************
function tomb_sweep_story()
	Talk(2,"tomb_sweep_story_1",
	"    T��ng truy�n v�o th�i chi�n qu�c phi t� c�a <color=green>T�n Hi�n C�ng<color> l� <color=green>Li C�<color> v� mu�n con m�nh <color=green>H� T�<color> k� v� n�n �m m�u gi�t h�i th�i t� <color=green>Th�n Sanh<color>, <color=green>Th�n Sanh<color> b� �p t� s�t. L�c n�y �� �� c�a <color=green>Th�n Sanh<color> l� <color=green>Tr�ng Nh�<color> nh�m tr�nh s� truy gi�t n�n �� b� tr�n, trong th�i gian n�y ch�u m�i u u�t, t�y t�ng �i theo ch� c� m�y ng��i, trong s� �� c� ng��i th�n t�n t�n <color=green>Gi�i T� Th�i<color>. C� l�n <color=green>Tr�ng Nh�<color> ng�t x�u v� ��i. <color=green>Gi�i T� Th�i<color> m�t l�ng c�u <color=green>ch�<color> �� l�n c�t mi�ng th�t c�a m�nh, n��ng ch�n d�ng cho Tr�ng Nh�. 19 n�m sau <color=green>Tr�ng Nh�<color> v� n��c l�m vua tr� th�nh 1 trong ng� b� th�i Xu�n Thu hi�u <color=green>T�n V�n C�ng<color>.",
	"    <color=green>T�n V�n C�ng<color> sau khi n�m quy�n �� ban th��ng h�u h�nh cho nh�ng ai �� c�ng �ng l�u vong ch�u kh� duy ch� c� <color=green>Gi�i T� Th�i<color> l� kh�ng c�. V� r�i c� ng��i t�u v�i <color=green>T�n V�n C�ng<color> c�u chuy�n tr��c kia m� <color=green>Gi�i T� Th�i<color> �� l�m. <color=green>T�n V�n C�ng<color> ch�nh l�ng nh� l�i chuy�n c�, l�p t�c cho ng��i m�i <color=green>Gi�i T� Th�i<color> v� tri�u th� phong. ��ng ti�c ng��i c� �i m�i m�y l�n m� <color=green>Gi�i T� Th�i<color> v�n t� ch�i."
	)
end
function tomb_sweep_story_1()
	Talk(2,"tomb_sweep_story_2",
	"    <color=green>T�n V�n C�ng<color> ��ch th�n �i m�i cho b�ng ���c nh�ng khi <color=green>T�n V�n C�ng<color> ��n n�i <color=green>Gi�i T� Th�i<color> th� th�y c�a ��ng. �n nh�n kh�ng l�i t� bi�t d�n m� tr�n v�o <color=yellow>C�m s�n<color>. <color=green>T�n V�n C�ng<color> cho Ng� L�m qu�n t�m kh�p <color=yellow>C�m s�n<color> v�n kh�ng th�y, c� ng��i ��a ra ch� � ��t r�ng, �� l�i m�t ���ng s�ng, khi l�a l�n <color=green>Gi�i T� Th�i<color> �t ph�i ch�y ra.",
	"    <color=green>T�n V�n C�ng<color> h� l�nh ��t r�ng, l�a ch�y ba ng�y ba ��m v�n kh�ng th�y <color=green>Gi�i T� Th�i<color> xu�t hi�n. ��n khi l�a t�t ph�t hi�n tr�n n�i x�c ch�t ch�y c�a hai m� con <color=green>Gi�i T� Th�i<color> �ang �m ch�t g�c c�y. <color=green>T�n V�n C�ng<color> nh�n thi th� <color=green>Gi�i T� Th�i<color> b�t kh�c, sau �� cho ng��i an t�ng t� t�, nh�ng ng��i an t�ng thi th� <color=green>Gi�i T� Th�i<color> ph�t hi�n m�t c�i hang b�n trong c� r�t nhi�u ��, trong �� c� t� �o tr�n ghi m�y d�ng huy�t th�: "
	)
end
function tomb_sweep_story_2()
	Talk(2,"",
	"    C�t nh�c ph�ng qu�n t�n �an t�m, ��n nguy�n ch� c�ng th��ng Thanh Minh. \n Li�u h� t�c qu� chung b�t ki�n, c��ng t� b�n qu�n t�c gi�n th�n. \nTh��ng nh��c ch� c�ng t�m h�u ng�, �c ng� chi th�i th��ng t� t�nh. \n Th�n t�i c�u tuy�n t�m v� qu�, c�n ch�nh thanh minh ph�c thanh minh.",
	"    <color=green>T�n V�n C�ng<color> cho ng��i an t�ng hai m� con <color=green>Gi�i T� Th�i<color> d��i g�c c�y li�u. V� �� t��ng nh� <color=green>�n nh�n<color> b�n ra l�nh ��i <color=yellow>C�m s�n<color> th�nh <color=yellow>Gi�i s�n<color>, tr�n n�i x�y d�ng am mi�u th� c�ng ��ng th�i ng�y ��t r�ng ���c xem l� T�t H�n Th�c, ng��i d�n trong ng�y n�y kh�ng ���c ��t l�a, ch� �n �� ngu�i. \n N�m th� hai <color=green>T�n V�n C�ng<color> c�ng ��m qu�n th�n l�n n�i c�ng b�i �� t� l�ng bi�t �n. Sau khi c�ng b�i b�n ��nh ng�y n�y l� <color=yellow>Ti�t Thanh Minh<color>."
	)
end
