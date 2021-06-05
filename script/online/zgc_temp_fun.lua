---------------------------------------------------------
--�峤˵�����Ӻ�ɫ��Ȣ֮�е� --2006-12-04
---------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
--*********************��������********************************
function Xmas_prize_get(prize_flag)
	local prize_get_date_start = 13502
	local prize_get_date_end = 13518
	if zgc_pub_day_turn(1) < prize_get_date_start or zgc_pub_day_turn(1)> prize_get_date_end then
		return
	end
	local add_num = 0
	if prize_flag == 1 then				--ս��
		if random(1,2) == 1 then
			add_num = 2
		else
			add_num = 1
		end
	elseif prize_flag == 2 then			--ʦ��
		if random(1,5) <= 2 then
			add_num = 1
		end
	elseif random(1,4) == 2 and Xmas_prize_chk(prize_flag) == 1 then	--ɱ�ֺ��̻�
		add_num = 1
	end
	if add_num == 0 then
		return
	end 
	for i = 1 ,add_num do
		if random(1,4) == 1 then
			local Xmas_tree_B_C = {
				{2,0,574,"Nh�nh th�ng m� l�"},
				{2,0,575,"Nh�nh th�ng ��p"}
			}
			local prize_seq = random(1,2)
			AddItem(Xmas_tree_B_C[prize_seq][1],Xmas_tree_B_C[prize_seq][2],Xmas_tree_B_C[prize_seq][3],1)
			Msg2Player("Ho�t ��ng Gi�ng sinh: B�n nh�n ���c ph�n th��ng ho�t ��ng Gi�ng sinh"..Xmas_tree_B_C[prize_seq][4])
		else
			local random_seq = random(1,getn(Xmas_acc_table))
			AddItem(Xmas_acc_table[random_seq][1],Xmas_acc_table[random_seq][2],Xmas_acc_table[random_seq][3],1)
			Msg2Player("Ho�t ��ng Gi�ng sinh: B�n nh�n ���c ph�n th��ng ho�t ��ng Gi�ng sinh"..Xmas_acc_table[random_seq][4])
		end
	end
	return
end
--********************�Ƿ���轱�����ж�***********************
function Xmas_prize_chk(prize_flag)
	local Xmas_prize_num_data = {
	{},	{},
	{3,969,970},		--�̻��ɱ������ÿ���������/ʱ���ִ�/������¼
	{2,971,972},
	}
	if GetTask(Xmas_prize_num_data[prize_flag][2]) < floor((GetTime()-57600)/86400) or (GetTask(Xmas_prize_num_data[prize_flag][3]) < Xmas_prize_num_data[prize_flag][1]) then
		if GetTask(Xmas_prize_num_data[prize_flag][2]) ~= floor((GetTime()-57600)/86400) then
			SetTask(Xmas_prize_num_data[prize_flag][2],floor((GetTime()-57600)/86400))
			SetTask(Xmas_prize_num_data[prize_flag][3],1)
		else
			SetTask(Xmas_prize_num_data[prize_flag][3],(GetTask(Xmas_prize_num_data[prize_flag][3]) + 1))
		end
		return 1 
	else
		return 0		
	end
end
--*********************trip��ĵ��ú���**************************
function main()
	if IsTongMember() == 0 then
		return
	end
	local tree_index = GetTaskTemp(163)
	local goods_id = GetTaskTemp(162)
	if QueryCurrentSkill(20) == 1 then
		if tree_index == 0 or goods_id == 0 then
			Talk(1,"","    Tr��c khi trang tr�, xin ��i tho�i v�i c�y Gi�ng sinh!")
			return
		end
		local Tree_name = GetNpcName(tree_index)
		if Conf_Xmas_tree_name_chk(tree_index) ~= 1 then
			Msg2Player(	"Ch� c� th� trang tr� cho c�y Gi�ng sinh c�a bang h�i m�nh!")
			return
		end
		local del_flag = DelItem(2,0,goods_id,1)
		if del_flag ~= 1 then
			Talk(1,"end_dialog","")
		else
			if goods_id == 582 then
				conf_Xmas_tree_hang("A")
			else
				conf_Xmas_tree_hang("B")
			end
		end
	end
end
------------------------------------------------���������Ĵ���----------------------------------------------
function conf_Xmas_tree_hang(Xmas_acc_diff)
	local conf_tree_index = GetTaskTemp(163)
	local num_save = 0
	local conf_tree_acc_num_A = GetUnitCurStates(conf_tree_index,2)
	local conf_tree_acc_num_B = GetUnitCurStates(conf_tree_index,3)
	local conf_tree_diff = GetUnitCurStates(conf_tree_index,4)
	local conf_tree_level = Zgc_pub_num_apart(conf_tree_diff,2)
	if (conf_tree_acc_num_A + conf_tree_acc_num_B) > Conf_Xmas_acc_wt_max[conf_tree_level] and random(1,100) < 7 then
		SendTongMessage("N�ng qu�, v�t ph�m trang tr� tr�n c�y Gi�ng sinh b� r�i r�i!")
		SetUnitCurStates(conf_tree_index,2,0)
		SetUnitCurStates(conf_tree_index,3,0)
	else
		if Xmas_acc_diff == "A" then
			AddUnitStates(conf_tree_index,2,1)
		elseif Xmas_acc_diff == "B" then
			AddUnitStates(conf_tree_index,3,1)
		end
		Msg2Player("B�n �� trang tr� th�nh c�ng c�y Gi�ng sinh bang h�i!")
	end
	if GetTask(973) < zgc_pub_day_turn(1) then
		AddUnitStates(conf_tree_index,6,1)
	end
	SetTask(973,zgc_pub_day_turn(1))
	SetTaskTemp(162,0)									--�����Ժ�������0
	SetTaskTemp(163,0)
end
