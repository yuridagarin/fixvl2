--�ű����ƣ�2007�����ӻ���������ýű���
--�ű����ܣ����ʹ��������ᣬ�����������
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-14
--�����޸ļ�¼��2008-3-19 2008��������
Include("\\script\\online\\zgc_public_fun.lua")					--�峤�Ĺ�������
Include("\\script\\lib\\lingshi_head.lua")
Include("\\script\\online\\qingming08\\head_qingming.lua")

--========================================Glb����������====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_date_seq = 1852			--�������������
tomb_sweep_2008_task_reel_num = 1853					--����ɵ���������
tomb_sweep_2008_task_reel_diff = 1854				--��ǰ����������
tomb_sweep_2008_task_reel_step = 1855				--��ǰ�����裨ɱ�֣�
if IS_SHOUFEI == TRUE then
	task_reel_table = {
		--��������(��1��Ϊɱ�֣�2Ϊ�ռ���3Ϊ��ʯ��-��������-������ID-�����ٷּ���-��������-���صĴ���������--˵��
		{1,"C�n ��",1205,5,11,900,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>Nhi�m v�<color>: <color=yellow>C�n �� ngo�i th�nh<color> l�m h�i b� t�nh, �i ��nh b�i <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng: 95%<color> x�c su�t <color=yellow>nh�n ��i kinh nghi�m<color> ho�c <color=yellow>5%<color> x�c su�t g�p <color=yellow>11<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow> 2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����Ʒ����-�ռ�����Ʒ����-����-С��-����--˵��<color>
		{2,1,10,6,2,"H� v�",2,1,19,20,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: �u�i h�<color> l�m thu�c c� th� �i�u tr� c�c b�nh t�t, thu th�p <color=yellow>20<color> <color=yellow>�u�i h�<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng: x�c su�t 90%<color> nh�n ��i <color=yellow>kinh nghi�m<color> ho�c <color=yellow>10%<color> x�c su�t g�p <color=yellow>6<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{1,"Quan s�",1206,16,4,901,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: Quan s� <color>�<color=yellow> D��ng Trung ��ng <color> h� hi�p b� t�nh, gi�o hu�n <color=yellow>30<color> t�n m�t b�i h�c sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 84%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>16%<color> x�c su�t g�p <color=yellow>4<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����ʯ����-�ռ�����ʯ����-�ռ�����ʯ�������������-˵��
		{3,1,20,3.5,2,"Linh th�ch c�p 1",4,SYS_TSK_LINGSHI_ONE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u. Thu th�p <color=yellow> 4 Linh th�ch c�p 1<color>, sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 80%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>20%<color> x�c su�t g�p <color=yellow>3.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{2,2,30,2.7,2,"B�u r��u da d�",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u. ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>, ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� Th� l�ng m� <color>ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 70% <color>nh�n ��i<color=yellow> �i�m s�c kh�e chuy�n th�nh kinh nghi�m <color>ho�c<color=yellow>30%<color> x�c su�t g�p <color=yellow>2.7<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{3,2,40,2.25,2,"Linh th�ch c�p 2",2,SYS_TSK_LINGSHI_TWO,"Linh th�ch c�p 3",2,SYS_TSK_LINGSHI_THREE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 2<color>, <color=yellow>2 Linh th�ch c�p 3<color> ��t v�o T� Linh ��nh xong, ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 60%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>40%<color> x�c su�t g�p <color=yellow>2.25<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{2,2,50,2,2,"Gi�p x�c phi�n",2,1,177,10,"Kh� S�n ch�",2,1,98,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u. Thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>, <color=yellow>10 b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 50%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m <color> ho�c <color=yellow>50%<color> x�c su�t g�p <color=yellow>2<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i,1 Linh th�ch ng�u nhi�n 1-7<color>."},
		{1,"Cao th� quan ngo�i",1207,65,1.75,902,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: � Long M�n tr�n c� <color=yellow>Cao th� quan ngo�i<color> h� hi�p b� t�nh, �i ��nh <color=yellow>30<color> t�n trong s� ch�ng, sau �� ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 35%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.75<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{3,1,80,1.65,2,"Linh th�ch c�p 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 4<color> ��t v�o trong T� Linh ��nh xong, ��n Th� l�ng m� ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 45%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.65<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{1,"T�m B�o Nh�n",1208,100,1.5,903,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Sa m�c m� cung c� <color=yellow>T�m b�o nh�n<color> �� th��ng kh�ng �t nh�n s� giang h�, h�y ��nh b�i <color=yellow>30<color> t�n sau �� ��n g�p <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: 100%<color> x�c su�t g�p <color=yellow>1.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."}
		}
else
	task_reel_table = {
		--��������(��1��Ϊɱ�֣�2Ϊ�ռ���3Ϊ��ʯ��-��������-������ID-�����ٷּ���-��������-���صĴ���������--˵��
		{1,"C�n ��",1205,5,11,900,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Ngo�i th�nh c� nh�ng t�n <color=yellow>C�n ��<color> l�m h�i b� t�nh, ��nh <color=yellow>30<color> t�n sau �� ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 95%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>5%<color> x�c su�t g�p <color=yellow>11<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����Ʒ����-�ռ�����Ʒ����-����-С��-����--˵��<color>
		{2,1,10,6,2,"H� v�",2,1,19,20,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: �u�i h�<color> l�m thu�c c� th� �i�u tr� c�c b�nh t�t, thu th�p <color=yellow>20<color> <color=yellow>�u�i h�<color> sau �� ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 90%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>10%<color> x�c su�t g�p <color=yellow>6<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{1,"Quan s�",1206,16,4,901,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: Quan s�<color> � <color=yellow>D��ng Trung ��ng<color> h� hi�p b� t�nh, gi�o hu�n <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 84%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>16%<color> x�c su�t g�p <color=yellow>4<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����ʯ����-�ռ�����ʯ����-�ռ�����ʯ�������������-˵��
		{3,1,20,3.5,2,"Linh th�ch c�p 1",4,SYS_TSK_LINGSHI_ONE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n thu th�p <color=yellow>4 Linh th�ch c�p 1<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 80%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>20%<color> x�c su�t g�p <color=yellow>3.5<color> l�n �i�m s�c kh�e chuy�n kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{2,2,30,2.7,2,"B�u r��u da d�",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>, ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� Th� l�ng m� <color>ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 70%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>30%<color> x�c su�t g�p <color=yellow>2.7<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{3,2,40,2.25,2,"Linh th�ch c�p 2",2,SYS_TSK_LINGSHI_TWO,"Linh th�ch c�p 3",2,SYS_TSK_LINGSHI_THREE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 2<color>, <color=yellow>2 Linh th�ch c�p 3<color> ��t v�o T� Linh ��nh xong ��n <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 60%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>40%<color> x�c su�t g�p <color=yellow>2.25<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{2,2,50,2,2,"Gi�p x�c phi�n",2,1,177,10,"Kh� S�n ch�",2,1,98,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>, 10 <color=yellow>b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 50%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>50%<color> x�c su�t g�p <color=yellow>2<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{1,"Cao th� quan ngo�i",1207,65,1.75,902,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: <color=yellow>Cao th� quan ngo�i<color> � Long M�n tr�n �� th��ng b� t�nh, h�y ��nh b�i <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 35%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.75<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{3,1,80,1.65,2,"Linh th�ch c�p 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 4<color> ��t v�o T� Linh ��nh xong ��n t�m Th� l�ng m� ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 45%<color> nh�n ��i <color=yellow> �i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.65<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."},
		{1,"T�m B�o Nh�n",1208,100,1.5,903,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: � Sa m�c m� cung<color> c� <color=yellow>T�m b�o nh�n<color> �� th��ng kh�ng �t nh�n s� giang h�, ��nh b�i <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: 100%<color> x�c su�t g�p <color=yellow>1.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m. N�u c�p 99, th� nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p 1-7<color>."}
		}
end
--========================================�������߼���=====================================
--***********************************����ʹ��������****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh�c nh�<color>:"..Zgc_pub_sex_name().."c�n r�n luy�n th�m m�t th�i gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_step_now == 0 or task_step_now == nil then
		Say("B�n mu�n th�c hi�n b��c n�o?",
		3,
		"Nh�n nhi�m v� trong m�t ��/#reel_task_accept("..task_reel_diff..")",
		"Xem n�i dung nhi�m v�/#reel_inf_print("..task_reel_diff..",1)",
		"��ng nhi�m v�/end_dialog"
		)
	elseif task_step_now >= 1 and task_step_now <= 10 then
		Say("B�n mu�n th�c hi�n b��c n�o?",
		3,
		"Xem nhi�m v� �ang l�m/#reel_inf_print("..task_step_now..",2)",
		"Xem n�i dung nhi�m v�/#reel_inf_print("..task_reel_diff..")",
		"��ng nhi�m v�/end_dialog"
		)
	else										--��ֹ���ݳ���
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--*********************************������ϸ��Ϣ��ѯ****************************
function reel_inf_print(reel_diff,inq_flag)
	if is_qingming_opened() ~= 1 then				--�ڻ�ڼ���Ч
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	Talk(1,"",task_reel_table[reel_diff][getn(task_reel_table[reel_diff])])
end
--************************************��������********************************
function reel_task_accept(task_diff)
	--�ڻ�ڼ���Ч
	if is_qingming_opened() ~= 1 then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	--
	--���ݻ�ȡ
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--������ɵ�����������
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		if IS_SHOUFEI == TRUE then
			Talk(1,"","<color=green>Nh�c nh�<color>: V�o ti�t Thanh Minh m�i ng�y ng��i ch� c� th� ho�n th�nh m�t �� nhi�m v� <color=yellow>2<color> l�n! Ng��i c� th� d�o ph� mua gi�y c�ng t� t�ng s� l�n nhi�m v� m�t ��.")
		else
			Talk(1,"","<color=green>Nh�c nh�<color>: V�o ti�t Thanh Minh m�i ng�y ng��i ch� c� th� ho�n th�nh m�t �� nhi�m v� <color=yellow>1<color> l�n! Ng��i c� th� d�o ph� mua gi�y c�ng t� t�ng s� l�n nhi�m v� m�t ��.")
		end
		return
	end
	if reel_task_date_seq_save < date_seq_now then--����һ�죬�����������
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,2)--�շ���ÿ����Խ�����������
		else
			SetTask(tomb_sweep_2008_task_reel_num,1)
		end
	end
	SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)		--������������д��
	SetTask(tomb_sweep_2008_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2008_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--���Ϊɱ�������򴴽�ɱ�ִ�����
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B�n �� nh�n nhi�m v� th� <color=yellow>"..task_diff.."<color> c� th� ��n <color=yellow>th� l�ng nh�n<color> h�y nhi�m v� ho�c nh�n th��ng! \n Nh�n chu�t ph�i xem n�i dung nhi�m v�!")
end
