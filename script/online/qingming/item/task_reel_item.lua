--�ű����ƣ�2007�����ӻ���������ýű���
--�ű����ܣ����ʹ��������ᣬ�����������
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-14
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")					--�峤�Ĺ�������

--========================================Glb����������====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_reel_date_seq = 855			--�������������
tomb_sweep_2007_task_reel_num = 856					--����ɵ���������
tomb_sweep_2007_task_reel_diff = 857				--��ǰ����������
tomb_sweep_2007_task_reel_step = 858				--��ǰ�����裨ɱ�֣�
task_reel_table = {
	--��������(��1��Ϊɱ�֣�2Ϊ�ռ���-��ɱ�־-��������-������ID-�����ٷּ���-��������-�����Ʒ����--˵��
	{1,"C�n ��",1205,5,10,900,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>Nhi�m v�<color>:<color> <color=yellow>C�n �� ngo�i th�nh<color> l�m h�i b� t�nh,  �i ��nh b�i <color=yellow>30<color> t�n sau �� quay v� <color=yellow>H�n gia nh�n<color> ph�c m�nh. \n <color=yellow>Ph�n th��ng: 95% c� h�i nh�n ��i <color> kinh nghi�m ho�c <color=yellow>5%<color> c� h�i g�p <color=yellow>11<color> kinh nghi�m. "},
	--��������-�ռ���Ʒ����-�������ٷּ���-����������-�����Ʒ��-�ռ�����Ʒ����-�ռ�����Ʒ����-����-С��-����--˵��<color>
	{2,1,10,5,2,"H� v�",2,1,19,20,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n    <color=yellow>N�i dung nhi�m v�: �u�i h�<color> l�m thu�c c� th� tr� b�nh hay. H�y thu th�p <color=yellow>20<color> c�i <color=yellow> �u�i h�<color> v� ��n <color=yellow>Th� L�ng Nh�n<color> �� ph�c m�nh. \n  <color=yellow>Ph�n th��ng nhi�m v�: 90%<color> c� h�i nh�n <color=yellow>��i <color>kinh nghi�m ho�c <color=yellow>10%<color> c� h�i nh�n <color=yellow>6<color> kinh nghi�m."},
	{1,"X�u xa",1206,16,3,901,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n   <color=yellow>N�i dung nhi�m v�: D��ng Trung ��ng<color> c� nh�ng t�n <color=yellow>Quan s�<color>,  h� hi�p b� t�nh. H�y �i gi�o hu�n �i gi�o hu�n <color=yellow>30<color> t�n,  sau �� c� th� ��n <color=yellow>Th� l�ng nh�n<color> �� ph�c m�nh.\n    <color=yellow>Ph�n th��ng nhi�m v�: nh�n ���c 84% c� h�i<color> <color=yellow> nh�n ��i <color>kinh nghi�m ho�c <color=yellow>16%<color> c� h�i nh�n <color=yellow>4<color> kinh nghi�m."},
	{2,2,20,2.5,2,"Linh Chu t�",2,2,54,10,"Da g�u",2,2,20,10,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>Nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u,  �i thu th�p 10 <color=yellow>Linh Chu t�<color>,  10 <color=yellow>Da g�u<color> sau �� �� quay v� <color=yellow>H�n gia nh�n<color> ph�c m�nh. \n <color=yellow>Ph�n th��ng:  80% c� h�i nh�n ��i <color> kinh nghi�m ho�c <color=yellow>20%<color> c� h�i g�p <color=yellow>3.5<color> kinh nghi�m. "},
	{2,2,30,1.7,2,"B�u r��u da d�",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>Nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u,  ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>,  ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� H�n gia nh�n<color> ph�c m�nh. \n <color=yellow>Ph�n th��ng: 70% c� h�i nh�n ��i <color> kinh nghi�m ho�c <color=yellow>30%<color> c� h�i g�p <color=yellow>2.7<color> kinh nghi�m. "},
	{2,2,40,1.25,2,"Thi�n Lang y",0,100,15,1,"Minh Quang gi�p",0,100,51,1,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>Nhi�m v�<color>:T�m 1 <color=yellow>Thi�n Lang y<color> v� 1 <color=yellow>Minh Quang gi�p<color> sau �� quay v� <color=yellow>Th� l�ng nh�n<color> ph�c m�nh. \n    <color=yellow>Ph�n th��ng nhi�m v�: 60%<color> c� h�i nh�n ��i<color=yellow> <color> kinh nghi�m ho�c <color=yellow>40%<color> c� h�i g�p <color=yellow>2.25<color> l�n �i�m kinh nghi�m."},
	{2,2,50,1,2,"Gi�p x�c phi�n",2,1,177,10,"Kh� S�n ch�",2,1,98,10,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>Nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u,  �i thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>,  10 <color=yellow>b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color>,  sau �� quay v� <color=yellow>H�n gia nh�n<color> ph�c m�nh. \n    <color=yellow>Ph�n th��ng: 50%<color> c� h�i ���c nh�n ��i<color=yellow> <color> kinh nghi�m v� <color=yellow>50%<color> c� h�i nh�n ���c g�p <color=yellow>1.5<color> l�n �i�m kinh nghi�m."},
	{1,"Xi H�a tr��ng l�o",1207,65,0.75,902,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>N�i dung nhi�m v�: Long Nh�n ��ng<color> c� t�n <color=yellow>Xi H�a tr��ng l�o<color> m� ho�c b� t�nh,  sau khi ��nh b�i <color=yellow>30<color> t�n trong ��,  h�y ��n <color=yellow>Th� L�ng Nh�n<color> �� ph�c m�nh. \n    <color=yellow>Ph�n th��ng nhi�m v�: nh�n ���c 45% c� h�i<color> <color=yellow> nh�n ��i <color>kinh nghi�m ho�c <color=yellow>65%<color> c� h�i nh�n <color=yellow>4<color> kinh nghi�m."},
	{2,2,80,0.65,2,"Huy�n thi�t Tr�ng Ki�m",0,2,26,1,"Ph� Thi�n k�ch",0,6,107,1,"    Ti�t Thanh Minh �� ��n,  ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>N�i dung nhi�m v�: <color>H�y t�m 1 c�i chu�i <color=yellow>Huy�n thi�t tr�ng ki�m 1<color> v� 1 chu�i <color=yellow>Ph� Thi�n K�ch 1<color>,  sau �� ��n g�p Th� l�ng nh�n �� ph�c m�nh. \n    <color=yellow>Ph�n th��ng nhi�m v�: 45%<color> c� h�i nh�n <color=yellow>��i <color>kinh nghi�m ho�c <color=yellow>65%<color> c� h�i nh�n ���c <color=yellow>1.75<color> l�n kinh nghi�m."},
	{1,"Ti�u Ti�n T�",1208,100,0.5,903,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i. \n <color=yellow>N�i dung nhi�m v�: Ti�u Ti�n T�<color> � <color=yellow>Thanh �m ��ng<color> m� ho�c kh�ng �t nh�n s� v� l�m, �i ��nh b�i m�t trong <color=yellow>30<color> ng��i sau �� quay v� <color=yellow>H�n gia nh�n<color> ph�c m�nh. \n <color=yellow>Ph�n th��ng: 100%<color> c� h�i g�p <color=yellow>1.5<color> kinh nghi�m."}
	}
--========================================�������߼���=====================================
--***********************************����ʹ��������****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh�c nh�<color>:"..Zgc_pub_sex_name().."c�n r�n luy�n th�m m�t th�i gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2007_task_reel_diff)
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
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--*********************************������ϸ��Ϣ��ѯ****************************
function reel_inf_print(reel_diff,inq_flag)
	if tomb_sweep_2007_date_chk() ~= 1 then				--�ڻ�ڼ���Ч
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	Say(task_reel_table[reel_diff][getn(task_reel_table[reel_diff])],
	1,
	"Ta bi�t r�i/end_dialog")
end
--************************************��������********************************
function reel_task_accept(task_diff)
	--�ڻ�ڼ���Ч
	if tomb_sweep_2007_date_chk() ~= 1 then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	--
	--���ݻ�ȡ
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--������ɵ�����������
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","M�t �� nhi�m v� Ti�t Thanh Minh m�i ng�y ch� l�m ���c <color=yellow>1<color> l�n, b�n c� th� d�o ph� mua <color=yellow>gi�y c�ng t�<color> �� t�ng s� l�n ho�n th�nh nhi�m v�!")
		return
	end
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_num,1)
	end
	SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)		--������������д��
	SetTask(tomb_sweep_2007_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2007_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--���Ϊɱ�������򴴽�ɱ�ִ�����
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B�n �� nh�n nhi�m v� th� <color=yellow>"..task_diff.."<color> c� th� ��n <color=yellow>th� l�ng nh�n<color> h�y nhi�m v� ho�c nh�n th��ng! \n Nh�n chu�t ph�i xem n�i dung nhi�m v�!")
end
