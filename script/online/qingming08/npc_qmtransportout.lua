--File name:npc_qmtransportout.lua
--Describe:ɨĹ�����ˣ�������
--Create Date:2006-3-16
--Author:yanjun
--�ű��޸ļ�¼��
--2007�������ڻ�޸ġ�
--2008�������ڻ�޸ġ�byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\qingming08\\head_qingming.lua")
Include("\\script\\lib\\lingshi_head.lua")
--================================������ȫ�ֱ���=======================================

tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_completed = 1849		--����ɵ�������
tomb_sweep_2008_task_reel_date_seq = 1852			--�������������
--tomb_sweep_2008_task_reel_date_seq���Ǽ�¼ÿ����������Ƿ�����õ�
tomb_sweep_2008_task_reel_num = 1853					--����ɵ���������
tomb_sweep_2008_task_reel_diff = 1854				--��ǰ����������
tomb_sweep_2008_task_reel_step = 1855				--��ǰ�����裨ɱ�֣�
task_reel_table = {
	--��������(��1��Ϊɱ�֣�2Ϊ�ռ���3Ϊ��ʯ��-��������-������ID-�����ٷּ���-��������-���صĴ���������--˵��
	{1,"C�n ��",1205,5,11,900,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Ngo�i th�nh c� nh�ng t�n <color=yellow>C�n ��<color> l�m h�i b� t�nh, gi�t <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 95%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>5%<color> x�c su�t g�p <color=yellow>11<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����Ʒ����-�ռ�����Ʒ����-����-С��-����--˵��<color>
	{2,1,10,6,2,"H� v�",2,1,19,20,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: �u�i h�<color> l�m thu�c c� th� �i�u tr� c�c b�nh t�t, thu th�p <color=yellow>20<color> <color=yellow>�u�i h�<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 90%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>10%<color> x�c su�t g�p <color=yellow>6<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{1,"Quan s�",1206,16,4,901,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: Quan s�<color> � <color=yellow>D��ng Trung ��ng<color> h� hi�p b� t�nh, gi�o hu�n <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 84%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>16%<color> x�c su�t g�p <color=yellow>4<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	--��������-�ռ���Ʒ�������-�������ٷּ���-����������-�����Ʒ��-�ռ�����ʯ����-�ռ�����ʯ����-�ռ�����ʯ�������������-˵��
	{3,1,20,3.5,2,"Linh th�ch c�p 1",4,SYS_TSK_LINGSHI_ONE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, thu th�p <color=yellow>4 Linh th�ch c�p 1<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 80%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>20%<color> x�c su�t g�p <color=yellow>3.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{2,2,30,2.7,2,"B�u r��u da d�",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, ��n <color=yellow>Ki�m M�n Quan<color> thu th�p 10 <color=yellow>b�u r��u da d�<color>, ��n <color=yellow>Ki�m C�c th�c ��o<color> thu th�p 10 <color=yellow>Kim Thoa<color> sau �� quay v� Th� l�ng m� <color>ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 70%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>30%<color> x�c su�t g�p <color=yellow>2.7<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{3,2,40,2.25,2,"Linh th�ch c�p 2",2,SYS_TSK_LINGSHI_TWO,"Linh th�ch c�p 3",2,SYS_TSK_LINGSHI_THREE,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>Ph�n th��ng nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 2<color>, <color=yellow>2 Linh th�ch c�p 3<color> ��t v�o T� Linh ��nh sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 60%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>40%<color> x�c su�t g�p <color=yellow>2.25<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{2,2,50,2,2,"Gi�p x�c phi�n",2,1,177,10,"Kh� S�n ch�",2,1,98,10,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Hi�n tri�u ��nh c�n m�t s� v�t li�u, thu th�p 10 <color=yellow>Gi�p x�c phi�n � ��o Hoa ��o<color>, 10 <color=yellow>b�n �� r�ng n�i g�c � ��i Th�o Nguy�n<color> sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 50%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>50%<color> x�c su�t g�p <color=yellow>2<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{1,"Cao th� quan ngo�i",1207,65,1.75,902,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: Cao th� quan ngo�i <color=yellow>�<color> Long M�n tr�n �� th��ng b� t�nh, gi�t <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 35%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.75<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{3,1,80,1.65,2,"Linh th�ch c�p 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�<color>: T�m <color=yellow>2 Linh th�ch c�p 4<color> ��t v�o T� Linh ��nh sau �� quay v� Th� l�ng m� ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: x�c su�t 45%<color> nh�n ��i <color=yellow>�i�m s�c kh�e chuy�n th�nh kinh nghi�m<color> ho�c <color=yellow>65%<color> x�c su�t g�p <color=yellow>1.65<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."},
	{1,"T�m B�o Nh�n",1208,100,1.5,903,"    Ti�t Thanh Minh �� ��n, ch� ta c� m�t s� m�t �� nhi�m v� d�nh cho nh�ng ai th�nh t�m c�ng b�i.\n    <color=yellow>N�i dung nhi�m v�: � Sa m�c m� cung<color> c� <color=yellow>T�m b�o nh�n<color> �� th��ng kh�ng �t nh�n s� giang h�, gi�t <color=yellow>30<color> t�n sau �� quay v� <color=yellow>Th� l�ng m�<color> ph�c m�nh.\n   <color=yellow>Ph�n th��ng nhi�m v�: 100%<color> x�c su�t g�p <color=yellow>1.5<color> l�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m."}
	}
--========================================�������߼���=====================================
--***********************************�Ի�������****************************
function main()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin ��a ta v�!/#gohome("..get_type()..")",
				"T�m hi�u ho�t ��ng Ti�t Thanh Minh./tomb_sweep_2007_inf",
				"M�t qu�! Cho ng�i ngh� ch�t ��!/end_dialog",
				}
	else
		selTab = {
				"Xin ��a ta v�!/#gohome("..get_type()..")",
				"Nh�n ph�n th��ng./get_teel_task_prize",
				"H�y nhi�m v�./teel_task_release",
				"T�m hi�u ho�t ��ng Ti�t Thanh Minh./tomb_sweep_2007_inf",
				"M�t qu�! Cho ng�i ngh� ch�t ��!/end_dialog",
				}
	end
	Say("<color=green>"..get_transport_name().."<color>: �a t�"..Zgc_pub_sex_name().."��n b�i t� m� ch� nh�n, c� c�n ti�u nh�n ��a ng�i v� kh�ng?",getn(selTab),selTab);
end
--*******************************������������*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************��������ȡ****************************
function get_teel_task_prize()
	--�ڻ�ڼ���Ч
	if is_qingming_opened() ~= 1 then				
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Ti�t Thanh Minh �� qua, "..Zgc_pub_sex_name().."N�u c� l�ng n�m sau nh� ��n c�ng b�i!")
		return
	end
	--��Ҹ��ؼ��
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--����������
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		--�շ�������
		local nTemp = 0
		if IS_SHOUFEI == TRUE then
			nTemp = 2
		else
			nTemp = 1
		end
		Talk(1,"","<color=green>"..get_transport_name().."<color>: V�o ti�t Thanh Minh, m�t �� nhi�m v� m�i ng�y ch� c� th� ho�n th�nh <color=yellow>"..nTemp.."<color> l�n, Ng��i c� th� v�o Ng� C�c mua <color=yellow>gi�y c�ng t�<color> t�ng s� l�n ho�n th�nh!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	--������
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Tr��c m� ti�n nh�n kh�ng ���c n�i b�y"..Zgc_pub_sex_name().."B�ng h�u nh�n nhi�m v� khi n�o?")
		return
	end
	--���������
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Ng��i kh�ng mang theo m�t �� nhi�m v�!")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--ɱ������
		if GetTask(tomb_sweep_2008_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>"..get_transport_name().."<color>: "..Zgc_pub_sex_name().."kh�ng ���c n�i b�y tr��c m� ti�n nh�n, l�m xong nhi�m v� m�i ��n ��y!")
			return
		end
	elseif task_reel_table[task_diff][1] == 2 then    --��ͨ��Ʒ����
		--��Ʒӵ�м��
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X�c nh�n ng��i �� mang �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X�c nh�n ng��i �� mang �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--��װ��ʱΪ�˷�ֹ�մ������յļ���һ�ɲ��ա�
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: "..task_reel_table[task_diff][6+add_num].."d� ra <color=yellow>1<color> c�i, l�o phu kh�ng th� nh�n.")
					return
				end
			end
		end
	else --��ʯ����
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X�c nh�n trong T� Linh ��nh c� �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
			end;--if
		end;--for
			
	end
	local player_level = GetLevel()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then--�ж��շ����
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end;
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local szProbability = "0%"
	local nExpChgTimes = 0
	local nExpAddTimes = 0
	local n99Lingshi = 1
	local n99Book = 2
	if task_reel_table[task_diff][1] == 1  then			--ɱ������
		szProbability = task_reel_table[task_diff][4].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][5]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][5]))
		n99Lingshi = floor(task_reel_table[task_diff][5])
		n99Book = floor(2 * task_reel_table[task_diff][5])
	elseif  task_reel_table[task_diff][1] == 2 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	elseif	task_reel_table[task_diff][1] == 3 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	end
	--�շ���100�򽡿�*�ȼ�˥��+150����*�ȼ�˥��
	if IS_SHOUFEI == TRUE then
		local golden_exp = GetGoldenExp()
		if GetLevel() ~= 99 then
			if golden_exp < exp_chg_num then
				Say("<color=green>"..get_transport_name().."<color>: �i�m s�c kh�e hi�n t�i c�a ng��i l� <color=yellow>"..golden_exp.."<color> �i�m, kh�ng �� ��i <color=yellow>"..exp_chg_num.."<color> �i�m, ��ng th�i nh�n ���c <color=yellow>"..exp_add_num.."<color> kinh nghi�m. C� <color=yellow>"..szProbability.."<color> nh�n ���c <color=yellow>"..nExpAddTimes.."<color> kinh nghi�m. C� mu�n ��i kh�ng?",
				2,
				"Ta x�c nh�n/golden_exp_chg",
				"�� ta suy ngh� l�i/end_dialog")
			else
				Say("<color=green>"..get_transport_name().."<color>: �i�m s�c kh�e hi�n t�i c�a ng��i l� <color=yellow>"..golden_exp.."<color> �i�m. Theo ��ng c�p hi�n t�i c�a ng��i, ng��i c� th� l�y <color=yellow>"..exp_chg_num.."<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m, ��ng th�i nh�n ���c <color=yellow>"..exp_add_num.."<color> kinh nghi�m. C�ng c� <color=yellow>"..szProbability.."<color> l�y <color=yellow>"..nExpChgTimes.."<color> �i�m s�c kh�e chuy�n th�nh kinh nghi�m, ��ng th�i nh�n ���c <color=yellow>"..nExpAddTimes.."<color> kinh nghi�m. C� mu�n ��i kh�ng?",
				2,
				"Ta x�c nh�n/golden_exp_chg",
				"�� ta suy ngh� l�i/end_dialog")
			end	
		else
			Say("<color=green>"..get_transport_name().."<color>: Ng��i nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p c�p 1-7, <color>ho�c<color=yellow>"..szProbability.."<color> x�c su�t nh�n <color=yellow>"..n99Book.."<color> cu�n Thi�n Th�i Ch� Gi�i, <color=yellow>"..n99Lingshi.."<color> Linh th�ch ng�u nhi�n c�p 1~7. C� mu�n ��i kh�ng?",
				2,
				"Ta x�c nh�n/golden_exp_chg",
				"�� ta suy ngh� l�i/end_dialog")
		end
	else
		if GetLevel() ~= 99 then
			Say("<color=green>"..get_transport_name().."<color>: Hi�n t�i kinh nghi�m nh�n ���c c�a ng��i l� <color=yellow>"..exp_add_num.."<color> �i�m, c� <color=yellow>"..szProbability.."<color> nh�n ���c <color=yellow>"..nExpAddTimes.."<color> kinh nghi�m. C� mu�n ��i kh�ng?",
				2,
				"Ta x�c nh�n/golden_exp_chg",
				"�� ta suy ngh� l�i/end_dialog")
		else
			Say("<color=green>"..get_transport_name().."<color>: Ng��i nh�n ���c <color=yellow>2 cu�n Thi�n Th�i Ch� Gi�i, 1 Linh th�ch c�p c�p 1-7, <color>ho�c<color=yellow>"..szProbability.."<color> x�c su�t nh�n <color=yellow>"..n99Book.."<color> cu�n Thi�n Th�i Ch� Gi�i, <color=yellow>"..n99Lingshi.."<color> Linh th�ch ng�u nhi�n c�p 1~7. C� mu�n ��i kh�ng?",
				2,
				"Ta x�c nh�n/golden_exp_chg",
				"�� ta suy ngh� l�i/end_dialog")
		end
	end
end
--*******************************��������ת����***************************
function golden_exp_chg()
	--99�����ؼ��
	if GetLevel() == 99 then
		if Zgc_pub_goods_add_chk(4,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--��Ʒɾ�����
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X�c nh�n ng��i �� mang �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	elseif task_reel_table[task_diff][1] == 3 then
		--��ʯɾ��
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X�c nh�n trong T� Linh ��nh c� �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
				return
			else
				SetTask(task_reel_table[task_diff][8+add_num],GetTask(task_reel_table[task_diff][8+add_num])-task_reel_table[task_diff][7+add_num]);
			end;--if
		end;--for
	end
	--�������ɾ�����
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Nh� mang theo m�t �� Thanh Minh t��ng �ng v�i nhi�m v� ng��i �� l�m, n�u kh�ng l�o phu r�t kh� x�!")
		return
	end
	--��Ʒ����
	Talk(1,"","<color=green>"..get_transport_name().."<color>: R�t c�m k�ch s� c�ng hi�n c�a ng��i, m�t ch�t l� v�t b�y t� t�m �.")
	if tonumber(date("%y%m%d")) ~= 20080412 then			--���һ�첻���Ӽ�Ʒ
		for i = 1,2 do
			AddItem(2,0,random(387,389),1)
		end
	end
	--��������ת����
	local player_level = GetLevel()
	local golden_exp = GetGoldenExp()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end
	if player_level ~= 99 then
		--�շ���100�򽡿�*�ȼ�˥��+150����*�ȼ�˥��
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--ɱ������
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][5])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][5])
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		end
		if GetTask(tomb_sweep_2008_task_reel_completed) == 7 then--���8�ξ�������õ�����e
			exp_chg_num = exp_chg_num * 5
			exp_add_num = exp_add_num * 5
		end --ifGetTask
		exp_chg_num = floor(exp_chg_num)--����ȡ��
		if exp_chg_num > golden_exp then
			exp_chg_num = golden_exp
		end
		if IS_SHOUFEI == TRUE then
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Ch�c m�ng b�n chuy�n"..exp_chg_num.." �i�m s�c kh�e chuy�n th�nh kinh nghi�m!")
			end
		end
		exp_add_num = floor(exp_add_num)
		ModifyExp(exp_add_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_add_num.." �i�m kinh nghi�m!")
	else
		local n99Times = 1
		local n99Book = 2
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--ɱ������
			n99Times = task_reel_table[task_diff][5]
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		end
		if mod(GetTask(tomb_sweep_2008_task_reel_completed),8) == 7 then--���8�ξ�������õ�����e
			n99Times = 5
			Msg2Player("Do ng��i �� ho�n th�nh 8 l�n nhi�m v�, cho n�n nh�n ���c ph�n th��ng g�p 5 l�n!")
		end --ifGetTask
		n99Book = floor(n99Book * n99Times)
		if Zgc_pub_goods_add_chk(2,50) == 1 then--��ʱע����Ե���999��
			AddItem(2,1,3210,n99Book)--�����ʱע��n99Book��
			Msg2Player("B�n nh�n ���c Thi�n Th�i Ch� Gi�i "..n99Book.." quy�n!")
		end --if zgc_pub_gooods_add_chk
		n99Times = floor(n99Times)
		local nTemp = 1
		for nTemp = 1,n99Times,1 do
			--======������1-7��ʯ1��,���7����ʯ�ļ��ʵ�����1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4����ʯ
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6����ʯ
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B�n nh�n ���c "..lvLingShi.."(c�p) Linh Th�ch!")
		end--for
	end -- lv99
	--������ɴ���
		--���ݻ�ȡ
	if task_reel_table[task_diff][1] == 1 then				--�����ɱ��������ɾ��ɱ�ִ�����
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))--�ظ�ɾ����������
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--���ݱ���
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,1)
			--������յ����������>.<�շ���ÿ�����Σ�����һ�Σ���ʣһ��
		else
			SetTask(tomb_sweep_2008_task_reel_num,0)
		end
		--tomb_sweep_2008_task_reel_date_seq���Ǽ�¼ÿ����������Ƿ�����õ�
	elseif reel_task_date_seq_save >= date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2008_task_reel_num,(reel_task_num_save-1))
	else
		SetTask(tomb_sweep_2008_task_reel_num,0)
	end;
	SetTask(tomb_sweep_2008_task_reel_completed,GetTask(tomb_sweep_2008_task_reel_completed)+1)
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	SetTask(tomb_sweep_2008_task_reel_step,0)
end
--**********************************����ȡ��******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Tr��c m� ti�n nh�n kh�ng ���c n�i b�y"..Zgc_pub_sex_name().."Ng��i ch�a nh�n qua nhi�m v� n�n kh�ng th� h�y!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("<color=green>"..get_transport_name().."<color>: M�t �� n�y l� "..Zgc_pub_sex_name().."ng��i h�u duy�n m�i c�, ng��i th�t s� mu�n h�y kh�ng?",
		2,
		"��ng/task_release_dtm",
		"�� ta suy ngh� l�i/end_dialog"
		)
	else			--���ݳ�������
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--********************************�����������*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--�����ɱ��������ɾ��ɱ�ִ�����
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	Msg2Player("B�n �� h�y nhi�m v� Thanh Minh!")
end
--********************************���������*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"<color=green>"..get_transport_name().."<color>:\n    Th�i gian ho�t ��ng: <color=yellow>3/4-12/4<color>. \n    Trong Ti�t Thanh Minh vi�c t�o m� l� ch� y�u, ta c�n c�ng b�i c�c v� nh� <color=yellow>Ho�ng ��i hi�p, H�n ��i hi�p, Hi�n Vi�n ��i hi�p<color>.",
	"<color=green>"..get_transport_name().."<color>:\n    Trong Ti�t Thanh Minh m�i ng�y ��n b�t k� m� ph�n c�ng b�i <color=yellow>1<color> l�n b�ng c�ch '<color=yellow>v�i l�y<color>' l� ���c. B� ��i hi�p kh�ch l�, s� khi�n cho kinh nghi�m giang h� c�a ng��i t�ng kh�ng �t. C�n c� c� h�i t�ng kinh nghi�m giang h�. N�u trong th�i gian di�n ra ho�t ��ng, th�nh t�m c�ng b�i <color=yellow>8<color> ng�y, s� nh�n ���c kh�ch l� l�n"
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","<color=green>"..get_transport_name().."<color>:\n    C�ng b�i m�i ng�y c�n nh�n ���c nhi�m v� do <color=yellow>Th� L�ng M�<color> giao. Ho�n th�nh nhi�m v� mang <color=yellow>m�t ��<color> giao tr� <color=yellow>Th� L�ng M�<color> s� nh�n ���c ph�n th��ng <color=yellow>nh�t ��nh<color> v� <color=yellow>v�t ph�m c�ng b�i<color>.",
		"<color=green>"..get_transport_name().."<color>:\n    V�t ph�m c�ng b�i s� d�ng tr��c khi c�ng m�i ng�y x�c su�t t�ng kinh nghi�m giang h� nh�n ���c r�t cao. H�m nay �� c�ng r�i kh�ng th� s� d�ng l�i."
)
end
