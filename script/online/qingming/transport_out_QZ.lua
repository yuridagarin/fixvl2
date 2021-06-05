--File name:transport_out_BJ.lua
--Describe:ɨĹ�����ˣ�������
--Create Date:2006-3-16
--Author:yanjun
--�ű��޸ļ�¼��
--2007�������ڻ�޸ġ�
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
LeavePointTab = {	--��¼����Ĺ����ʱ������
			[1] = {100,1453,2812},	--Ȫ�ݡ�����ڣ
			[2] = {200,1170,2834},	--�꾩������ڣ
			[3] = {300,1640,3531},	--�ɶ�����ԯ��ڣ
			}
--================================������ȫ�ֱ���=======================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_finish_count = 853
tomb_sweep_2007_task_reel_date_seq = 855			--�������������
tomb_sweep_2007_task_reel_num = 856					--����ɵ���������
tomb_sweep_2007_task_reel_diff = 857				--��ǰ����������
tomb_sweep_2007_task_reel_step = 858				--��ǰ�����裨ɱ�֣�
task_reel_table = {
	--��������(��1��Ϊɱ�֣�2Ϊ�ռ���-��ɱ�־-��������-��������-�����ٷּ���-��������-�����Ʒ����--˵��
	{1,"C�n ��",1205,5,10,900,""},
	--��������-�ռ���Ʒ����-�������ٷּ���-����������-�����Ʒ��-�ռ�����Ʒ����-�ռ�����Ʒ����-����-С��-����--˵��
	{2,1,10,5,2,"H� v�",2,1,19,20,""},
	{1,"X�u xa",1206,16,3,901,""},
	{2,2,20,2.5,2,"Linh Chu t�",2,2,54,10,"Da g�u",2,2,20,10,""},
	{2,2,30,1.7,2,"B�u r��u da d�",2,1,60,10,"Kim Thoa",2,1,41,10,""},
	{2,2,40,1.25,2,"Thi�n Lang y",0,100,15,1,"Minh Quang gi�p",0,100,51,1,""},
	{2,2,50,1,2,"Gi�p x�c phi�n",2,1,177,10,"Kh� S�n ch�",2,1,98,10,""},
	{1,"Xi H�a tr��ng l�o",1207,65,0.75,902,""},
	{2,2,80,0.65,2,"Huy�n thi�t Tr�ng Ki�m",0,2,26,1,"Ph� Thi�n k�ch",0,6,107,1,""},
	{1,"Ti�u Ti�n T�",1208,100,0.5,903,""}
	}
--========================================�������߼���=====================================
--***********************************�Ի�������****************************
function main()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin ��a ta v�!/#gohome(1)",
				"T�m hi�u ho�t ��ng Ti�t Thanh Minh./tomb_sweep_2007_inf",
				"M�t qu�! Cho ng�i ngh� ch�t ��!/end_dialog",
				}
	else
		selTab = {
				"Xin ��a ta v�!/#gohome(1)",
				"Nh�n ph�n th��ng./get_teel_task_prize",
				"H�y nhi�m v�./teel_task_release",
				"T�m hi�u ho�t ��ng Ti�t Thanh Minh./tomb_sweep_2007_inf",
				"Ngh� m�t l�t./end_dialog",
				}
	end
	Say("�a t�"..Zgc_pub_sex_name().."��n b�i t� m� ch� nh�n, c� c�n ti�u nh�n ��a ng�i v� kh�ng?",getn(selTab),selTab);
end
--*******************************������������*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************��������ȡ****************************
function get_teel_task_prize()
	--�ڻ�ڼ���Ч
	if tomb_sweep_2007_date_chk() ~= 1 then				
		Talk(1,"","Ti�t Thanh Minh �� qua,"..Zgc_pub_sex_name().."N�u c� l�ng n�m sau nh� ��n c�ng b�i!")
		return
	end
	--��Ҹ��ؼ��
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--����������
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","M�t �� Thanh Minh m�i ng�y ch� l�m ���c <color=yellow>1<color> l�n, b�n c� th� d�o ph� mua <color=yellow>gi�y c�ng t�<color> t�ng s� l�n ho�n th�nh!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	--������
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Tr��c m� ti�n nh�n kh�ng ���c n�i b�y!"..Zgc_pub_sex_name().."B�ng h�u nh�n nhi�m v� khi n�o?")
		return
	end
	--���������
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","Ng��i kh�ng mang theo s� ghi ch�p nhi�m v� �?")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--ɱ������
		if GetTask(tomb_sweep_2007_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>Chu gia nh�n<color>:"..Zgc_pub_sex_name().."kh�ng ���c n�i b�y tr��c m� ti�n nh�n, l�m xong nhi�m v� m�i ��n ��y!")
			return
		end
	else
		--��Ʒӵ�м��
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin x�c nh�n ng��i c� mang theo �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin x�c nh�n ng��i c� mang theo �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--��װ��ʱΪ�˷�ֹ�մ������յļ���һ�ɲ��ա�
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Ng��i c� mang"..task_reel_table[task_diff][6+add_num].."d� ra <color=yellow>1<color> c�i, l�o phu kh�ng th� nh�n.")
					return
				end
			end
		end
	end
	local player_level = GetLevel()
	local exp_chg_num = floor(player_level*player_level*player_level*player_level/100)
	prize_exp_add()
end
--*******************************��������ת����***************************
function prize_exp_add()
	local task_finish_count = GetTask(tomb_sweep_2007_task_finish_count)
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--��Ʒɾ�����
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","Xin x�c nh�n ng��i c� mang theo �� <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	end
	--�������ɾ�����
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","Nh� mang theo s� ghi ch�p nhi�m v� nh�!")
		return
	end
	--��������ת����
	local player_level = GetLevel()
	local exp_num = floor(player_level*player_level*player_level*player_level/100)
	local prize_times = 1
	if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--ɱ������
		prize_times =(1+ task_reel_table[task_diff][5])
	elseif task_reel_table[task_diff][1] == 2 and random(1,100) <= task_reel_table[task_diff][3] then
		prize_times = (1+ task_reel_table[task_diff][4])
	end
	if task_finish_count == 14 then
		prize_times = (prize_times +9)
		Talk(1,"","��y l� l�n "..Zgc_pub_sex_name().."th� <color=yellow>15<color> ho�n th�nh nhi�m v� m�t ��,"..Zgc_pub_sex_name().." nh�n ���c ph�n th��ng kinh nghi�m g�p 10 l�n.")
	end
		exp_num = floor(exp_num*prize_times)
		ModifyExp(exp_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_num.." �i�m kinh nghi�m!")	
	--������ɴ���
		--���ݻ�ȡ
	if task_reel_table[task_diff][1] == 1 then				--�����ɱ��������ɾ��ɱ�ִ�����
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--���ݱ���
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	elseif reel_task_date_seq_save == date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2007_task_reel_num,(reel_task_num_save-1))
	elseif reel_task_date_seq_save > date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	end
	--��ɴ���
	if task_finish_count == nil then
		SetTask(tomb_sweep_2007_task_finish_count,1)
	else
		SetTask(tomb_sweep_2007_task_finish_count,(task_finish_count+1))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	SetTask(tomb_sweep_2007_task_reel_step,0)
end
--**********************************����ȡ��******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Tr��c m� ti�n nh�n kh�ng ���c n�i b�y!"..Zgc_pub_sex_name().."Ng��i ch�a nh�n qua nhi�m v� n�n kh�ng th� h�y!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("Quy�n s� n�y ch�nh l�"..Zgc_pub_sex_name().."ng��i h�u duy�n m�i c�, ng��i th�t s� mu�n h�y kh�ng?",
		2,
		"��ng/task_release_dtm",
		"�� ta suy ngh� l�i/end_dialog"
		)
	else			--���ݳ�������
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--********************************�����������*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--�����ɱ��������ɾ��ɱ�ִ�����
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	Msg2Player("B�n �� h�y nhi�m v� Thanh Minh!")
end
--********************************���������*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"\n Th�i gian ho�t ��ng t� <color=yellow>30/3 - 8/4<color>. \n Trong Ti�t Thanh Minh vi�c t�o m� l� ch� y�u, ta c�n ��n c�ng b�i <color=yellow>Chu ��i hi�p, H�n ��i hi�p, Hi�n Vi�n ��i hi�p<color>.",
	"\n Trong Ti�t Thanh Minh m�i ng�y ��n b�t k� m� ph�n c�ng b�i <color=yellow>1<color> l�n b�ng c�ch <color=yellow>v�i l�y<color>"..Zgc_pub_sex_name().."th�nh t�m nh�n ���c m�t �� nhi�m v� c�a th� l�ng nh�n."
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","\n Ho�n th�nh nhi�m v� <color=yellow>H�n gia nh�n<color>. Mang <color=yellow>m�t ��<color> ��n <color=yellow>H�n gia nh�n<color> nh�n <color=yellow>ph�n th��ng kinh nghi�m<color>.",
		"\n Ho�n th�nh <color=yellow>15<color> l�n nhi�m v� <color=yellow>t�o m�<color> s� nh�n ���c g�p <color=yellow>10 l�n<color> ph�n th��ng."
)
end