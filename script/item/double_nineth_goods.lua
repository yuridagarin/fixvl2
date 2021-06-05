--******************************************************
--********************��ɽ�������2�ű�*****************
--���ܣ�2006�����
--������Ա���Թ�
--����ʱ�䣺2006-10-12
--******************************************************
prize_table = {
	{"Ho�ng C�c",546,"R��u hoa c�c",549,"� r��u","b�nh"},
	{"T� C�c",547,"B�nh hoa c�c",550," ch� th�nh "," ph�n"},
	{"Th� du",548,"B� th� du",551," ch� th�nh ","Th�c"},
}
change_num = 9			--�һ���Ҫ��ԭ������
map_id_min = 969
map_id_max = 971
use_att_Y = 2954
exp_num_1 = 500000
exp_num_2 = 200000
healthy_exp_need = 500000
prize_use_start_time = 13447
prize_use_end_time = 13463

function main()
	local palyer_sex = "��i hi�p"
	if GetSex() == 2 then
		palyer_sex = "N� hi�p "
	end
	if GetLevel() < 11 then
		Say("V� "..palyer_sex.."N�u mu�n x�ng b� v� l�m th� c�n ph�i r�n luy�n th�m.",
		1,
		"Ta bi�t r�i/end_dialog")
		return
	end
	local plant_talble = {
	{"Ho�ng C�c",546},
	{"T� C�c",547},
	{"Th� du",548},	
	}
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	
	local num_save = GetUnitCurStates(npc_index,2)
	if num_save == 0 then
		return
	else
		AddUnitStates(npc_index,2,( - num_save))
	end
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Msg2Player("Kho�ng tr�ng trong h�nh trang ho�c s�c l�c c�a b�n kh�ng ��, xin ki�m tra l�i!")
		AddUnitStates(npc_index,2,1)
		return
	end
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(plant_talble) do
		if npc_name == plant_talble[i][1] then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,0,plant_talble[i][2],1)
			if add_flag == 0 then
				WriteLog("Ho�t ��ng Tr�ng C�u:"..npc_name.."Th�m th�t b�i, k� hi�u:"..add_flag)
			end
		end
	end	
end
function OnUse(id)
	local palyer_sex = "��i hi�p"
	if GetSex() == 2 then
		palyer_sex = "N� hi�p "
	end
	if GetLevel() < 11 then
		Say("V� "..palyer_sex.."N�u mu�n x�ng b� v� l�m th� c�n ph�i r�n luy�n th�m.",
		1,
		"Ta bi�t r�i/end_dialog")
		return
	end
	if prze_use_date_chk() == 0 then
		Say("Ho�t ��ng �� k�t th�c! Xem chi ti�t tr�n trang ch�!",
		1,
		"Ta bi�t r�i/end_dialog")
		return
	end
	--��ʼ��������
	local goods_ID = GetItemParticular(id)
	--���߼�
	if goods_ID >= prize_table[1][2] and goods_ID <= prize_table[3][2] then					--�ж����ʹ�õ���ʲô����
		for i = 1, getn(prize_table) do
			if goods_ID == prize_table[i][2] then			--�ҵ���Ӧ���ߣ����Ӷ�Ӧ��Ʒ
				if GetItemCount(2,0,prize_table[i][2]) < change_num then
					Say(change_num.."��a"..prize_table[i][1].." m�i c� th� "..prize_table[i][5].."m�t"..prize_table[i][6]..prize_table[i][3]..". Tr�n ng��i b�n h�nh nh� kh�ng ��"..prize_table[i][1].." H�nh nh� kh�ng ��!",
					1,
					"Ta bi�t r�i/end_dialog"
					)
				else
					Say("B�n ��ng � d�ng"..change_num.."��a"..prize_table[i][1]..prize_table[i][5].."m�t"..prize_table[i][6]..prize_table[i][3].."?",
					2,
					"Ch� t�c /#plant_use("..i..")",
					"�� ta ngh� l�i/end_dialog"
					)
				end
			end
		end
	elseif goods_ID >= prize_table[1][4] and goods_ID <= prize_table[3][4] then
		local map_ID,att_X,att_Y = GetWorldPos()
		if map_ID < map_id_min or map_ID > map_id_max then
			Say("Tr�n ��nh Hoa s�n m�i s� d�ng ���c v�t ph�m n�y. B�n c� th� ��n g�p V� L�m Minh truy�n nh�n ��a �i!",
			1,
			"Ta bi�t r�i/end_dialog")
			return
		elseif att_Y >= use_att_Y  then
			Say("L�n t�i ��nh m�i s� d�ng v�t ph�m n�y!",
			1,
			"Ta bi�t r�i/end_dialog")
			return
		end
		if GetTask(962) >= 42 then
			Say("Xin l�i! T�ng s� ph�n th��ng b�n nh�n ���c �� qu� 42 l�n, m�i b�n tham gia ho�t ��ng l�n sau!",
			    1,
				"Ta bi�t r�i/end_dialog")
			return			
		end	
		if GetTask(960) >= 6 and GetTask(961) >= day_num_return() then
			Say("Xin l�i! S� ph�n th��ng h�m nay �� qu� 6 l�n, ng�y mai h�y quay l�i!",
			    1,
				"Ta bi�t r�i/end_dialog")
			return			
		end
		for i = 1 ,getn(prize_table) do
			if goods_ID == prize_table[i][4] then			--�ҵ���Ӧ���ߣ����Ӷ�Ӧ��Ʒ
				Say(" B�n ��ng � d�ng "..prize_table[i][3].."?",
					2,
					"��ng � d�ng/#Prize_use("..i..")",
					"�� ta ngh� l�i/end_dialog"
				)
			end
		end
	end
end
--*******************************�һ���������**********************************
function plant_use(goods_seq)
	if GetFreeItemRoom() < 1 then
		Say("Kho�ng tr�ng h�nh trang kh�ng ��, xin xem l�i!",
		    1,
			"Ta bi�t r�i/end_dialog")
		return		
	end
	if GetItemCount(2,0,prize_table[goods_seq][2]) < change_num then
		Msg2Player("Xin x�c nh�n h�nh trang �� v�t ph�m �� ��i th��ng!")
		return
	end
	local deal_flag = DelItem(2,0,prize_table[goods_seq][2],change_num)
	if deal_flag == 0 then
		Msg2Player("Xin x�c nh�n h�nh trang �� v�t ph�m �� ��i th��ng!")
	else
		local add_flag = AddItem(2,0,prize_table[goods_seq][4],1)
		if add_flag ~= 0 then
			Msg2Player("Ch�c m�ng b�n d�ng "..change_num.."��a"..prize_table[goods_seq][1]..prize_table[goods_seq][5].."�� d�ng 1 "..prize_table[goods_seq][6]..prize_table[goods_seq][3].."!")
		else
			WriteLog ("Ng��i ch�i:"..GetName().."T�ng"..prize_table[goods_seq][3].." th�t b�i, tr� quay v�:"..add_flag..".")
		end
	end
end
--*******************************ʹ�ý�������**********************************
function Prize_use(goods_seq)
	if goods_seq == 1 then
		local healthy_exp = GetGoldenExp() 							--��ȡ��ҽ�������
		if healthy_exp == 0 then
			Say("Hi�n b�n kh�ng c� �i�m s�c kh�e kh�ng th� d�ng r��u hoa c�c!",
			1,
			"Ta bi�t r�i/end_dialog")
		elseif healthy_exp < exp_num_1 then
			Say("�i�m s�c kh�e c�a b�n l�:"..healthy_exp..", kh�ng �� 50 v�n, b�n mu�n ��i �i�m s�c kh�e l�y kinh nghi�m kh�ng?",
			2,
			"Ta mu�n ��i �i�m s�c kh�e th�nh kinh nghi�m/#exp_change(1)",
			"�� khi kh�c/end_dialog")
		else
			exp_change(1)
		end
	elseif goods_seq == 2 or goods_seq == 3 then
		if goods_seq == 2 then
			local healthy_exp = GetGoldenExp() 							--��ȡ��ҽ�������
			if healthy_exp == 0 then
				Say("Hi�n b�n kh�ng c� �i�m s�c kh�e kh�ng th� d�ng b�nh hoa c�c!",
				1,
				"Ta bi�t r�i/end_dialog")
			elseif healthy_exp < exp_num_2 then
				Say("�i�m s�c kh�e c�a b�n l�:"..healthy_exp..", kh�ng �� 20 v�n, b�n mu�n ��i �i�m s�c kh�e l�y kinh nghi�m kh�ng?",
				2,
				"Ta mu�n ��i �i�m s�c kh�e th�nh kinh nghi�m/#exp_change(2)",
				"�� khi kh�c/end_dialog")
			else
				exp_change(2)
			end
		elseif goods_seq == 3 then
			local del_flag = DelItem(2,0,prize_table[3][4],1)
			if del_flag == 1 then
				ModifyGoldenExp(healthy_exp_need)
				Msg2Player("B�n �� s� d�ng "..prize_table[goods_seq][3]..", nh�n ���c 50 v�n �i�m s�c kh�e!")
				use_times_save()
				prize_end_dialog()
			else
				Msg2Player("Xin x�c nh�n h�nh trang c�n "..prize_table[goods_seq][4].."!")
			end
		end
	end
end
--****************************��������ת��Ϊ����***********************************
function exp_change(change_flag)											--��������תΪ����
	local healthy_exp = GetGoldenExp() 										--��ȡ��ҽ�������
	local del_flag = DelItem(2,0,prize_table[change_flag][4],1)
	if del_flag == 1 and change_flag == 1 then
		if healthy_exp >= exp_num_1 then
			ModifyGoldenExp(-exp_num_1)
			ModifyExp(exp_num_1)
			Msg2Player("B�n s� d�ng "..prize_table[change_flag][3]..", �em"..exp_num_1.."�i�m s�c kh�e ��i"..exp_num_1.." �i�m kinh nghi�m!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B�n s� d�ng "..prize_table[change_flag][3]..", �em"..healthy_exp.."�i�m s�c kh�e ��i"..healthy_exp.." �i�m kinh nghi�m!")
		end
		use_times_save()
		prize_end_dialog()
	elseif del_flag == 1 and change_flag == 2 then
		if healthy_exp >= exp_num_2 then
			ModifyGoldenExp(-exp_num_2)
			ModifyExp(exp_num_2)
			Msg2Player("B�n s� d�ng "..prize_table[change_flag][3]..", �em"..exp_num_2.."�i�m s�c kh�e ��i"..exp_num_2.." �i�m kinh nghi�m!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B�n s� d�ng "..prize_table[change_flag][3]..", �em"..healthy_exp.."�i�m s�c kh�e ��i"..healthy_exp.." �i�m kinh nghi�m!")
		end
		ModifyReputation(10,0)
		Msg2Player("B�n s� d�ng "..prize_table[change_flag][3].."nh�n ���c 10 �i�m danh v�ng!")
		use_times_save()
		prize_end_dialog()
	else
		Msg2Player("Xin x�c nh�n h�nh trang c�n "..plant_talble[1][4].."!")
	end
end
--**********************************ʹ��ʱ���ж�**********************************
function prze_use_date_chk()
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		return 0 
	else
		return 1
	end
end
--**********************************ʹ�ô�����¼**********************************
function use_times_save()
	local use_times = GetTask(960)
	local use_date_seq = GetTask(961)
	local use_time_total = GetTask(962)
	if use_date_seq == day_num_return() then
		SetTask(960,use_times + 1)
	else
		SetTask(961,day_num_return())
		SetTask(960,1)
	end
	SetTask(962,use_time_total + 1)
end
--*******************************ʹ�ô�����ʾ************************************
function prize_end_dialog()
	local use_times = GetTask(960)
	local use_num_today = 6 - use_times
	local use_num_total = GetTask(962)
	if use_times < 6 and use_num_total < 42 then
		Msg2Player("H�m nay l�n th� "..use_times.."b�n nh�n ���c ph�n th��ng, c�n"..use_num_today.."l�n c� h�i nh�n th��ng. ��y l� l�n t�ch l�y th�"..use_num_total.." l�n ��i ph�n th��ng, c�n ��i ���c"..(42-use_num_total).." l�n.")
	elseif use_times == 6 and use_num_total < 42 then
		Msg2Player("H�m n�y b�n �� nh�n th��ng 6 l�n cho ph�p, ng�y mai h�y quay l�i! ��y l� l�n t�ch l�y th�"..use_num_total.." l�n ��i ph�n th��ng, c�n ��i ���c"..(42-use_num_total).." l�n.")
	elseif use_num_total == 42 then
		Msg2Player("B�n �� ��i 42 ph�n th��ng kh�ng th� ti�p t�c ��i, m�i tham gia ho�t ��ng l�n sau!")
	end
end
function end_dialog()
end
--**************************�ִμ��㺯��******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end
