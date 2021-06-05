------------------------------------------------------------------
--�峤˵������Ϸ��������������㲻���ģ�-------
--�����ˬ��ֻ�����Լ���--2006-12-04
--                    ��
--              �����   
--          ���������
--      �嗀������������
--  �����������������
--                   ��
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\lib\\writelog.lua");

Include("\\script\\online\\newyear08\\newyear08_head.lua");--07ʥ���

--2010��Խ��ʥ����������װ�Ի�����ʱЧ��20100109
Include("\\script\\online_activites\\2010_12\\activites_02\\head.lua");

--======================================================������ݷ�װ=================================================================================
--�������ƣ��������get
--��        �ܣ���λȡ�ð������
File_name = "\\script\\online\\zgc_npc_dialog.lua"
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--�������ƣ��������get
--��        �ܣ���λ���ð������
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--�����λ��
													--ȡֵ]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=========================================================������====================================================================================
function main() 
        --by xiongyizhi ʥ������װ�Ի�
        if gf_CheckEventDateEx(VET_201012_02_EVENT_NUMBER) == 1 then
            VET_Buy_Xmas_Clothes()
            return 0;
        end

	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	-----------------ʥ�������ʼ��
	if GetTask(960) ~= 1226 then			--���ݳ�ʼ��
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--�������
		SetTask(960,1226)					--���־
	end
	-------------------����
	-------------------NPC��������
	SetTaskTemp(164,npc_index)
	-------------------����


	local npc_name = GetNpcName(npc_index)
	local i = 1
	for i = 1, getn(Npc_Dialog_Table) do
		if npc_name == Npc_Dialog_Table[i][1] then
			if getn(Npc_Dialog_Table[i]) == 2 then
				dostring(Npc_Dialog_Table[i][2])
			end
		end
	end
	local Xmas_tree_diff = GetUnitCurStates(npc_index,0)
	if Xmas_tree_diff == 1 then
		Xmas_Tree_A()
	elseif Xmas_tree_diff == 2 then
		conf_Xmas_tree(npc_index)
	end
end
--=============================================================��ɫɾ������=====================================================================================
function actor_deldialog()
	do return end
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Th� gi�i giang h� c�ng c� ng��i mu�n tung ho�nh, l�i c�ng c� ng��i mu�n �n c�,"..Zgc_pub_sex_name()..", c� l� c�ng hi�u ���c �i�u n�y?",
	2,
	"��ng v�y, ta ch�n c�nh b�n ba n�y r�i!/actor_del_con_chk",
	"Ch� l� nh�n ti�n gh� qua th�i!/end_dialog")
end
function actor_del_con_chk()
	if IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3 then
		local conf_att = ""
		if IsTongMember() == 1 then
			conf_att = "Bang ch�"
		elseif IsTongMember() == 2 then
			conf_att = "Ph� bang"
		else
			conf_att = "Tr��ng l�o"
		end
		Talk(1,"end_dialog","Ng��i th�t s� ���c bang ch�ng ng��ng m�"..conf_att..", chuy�n ��i s� nh� th� n�y sao kh�ng c�ng bang ch�ng th��ng l��ng. �i h�i � bang ch�ng r�i h�y quay l�i.")
		return
	elseif (GetYinPiao(1) + GetYinPiao(2) + GetItemCount(2,1,198)) ~= 0 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: V� "..Zgc_pub_sex_name().." �em nhi�u ng�n l��ng nh� th� n�y (<color=red>Ng�n phi�u l�n, Ng�n phi�u nh�, b�c l�<color>), l� n�o kh�ng d�ng sao?",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(3)",
		"Ta mu�n suy ngh� l�i/end_dialog"
		)
	elseif (GetTime() - GetCreateTime()) < 604800 and GetLevel() < 30  then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Anh h�ng nh� ng��i l�i mau th�i ch� v�y sao? C� g�ng l�n n�o!",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(1)",
		"Ta mu�n suy ngh� l�i/end_dialog")
	elseif GetReputation() >= 3000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ng��i, m�t anh h�ng hi�n h�ch nh� v�y ch�ng l� l�i th�i ch� r�i �?",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(3)",
		"Ta mu�n suy ngh� l�i/end_dialog")
	elseif GetTask(336) >= 4000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: V� cao th� n�y �� c�ng hi�n nhi�u cho qu� m�n ph�i b�y gi� r�i kh�i kh�ng th�y ti�c nu�i g� sao?",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(3)",
		"Ta mu�n suy ngh� l�i/end_dialog")		
	elseif (GetTime() - GetCreateTime()) >= 604800 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Nh�ng th�ng ng�y vui bu�n h�nh t�u giang h� ch�ng l� c�ng ch�ng �� l�i m�t �n t��ng n�o khi�n ng��i ph�i l�u luy�n sao?",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(2)",
		"Ta mu�n suy ngh� l�i/end_dialog")
	elseif GetLevel() >= 30 then 
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ng��i quy�t ��nh nh� v�y kh�ng c�m th�y h�i h�n �?",
		2,
		"Ta �� c� quy�t ��nh r�i/#actor_del_dem_1(2)",
		"Ta mu�n suy ngh� l�i/end_dialog")
	end
end
function actor_del_dem_1(actor_flag)
	local actor_dialog = {
		"B�n ��ng � x�a nh�n v�t n�y?",
		"Nh�n v�t c�a b�n ���c b�o l�u 7 ng�y (168 gi� ). B�n x�c nh�n x�a nh�n v�t n�y ch�?",
		"Nh�n v�t c�a b�n ���c b�o l�u 7 ng�y (168 gi� ). B�n x�c nh�n x�a nh�n v�t n�y ch�?"
	}
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag],
		2,
		"��ng � x�a/#actor_del_dem_2("..actor_flag..")",
		"Ta mu�n suy ngh� l�i/end_dialog"
	)	
end
function actor_del_dem_2(actor_flag)
	local actor_dialog = {
		"Th�t ��ng ti�c, th� gi�i giang h� l�i m�t �i m�t ng��i!",
		"Giang h� l�i m�t �i m�t v� cao th�, nh�ng n�i trong 7 ng�y b�ng h�u quay l�i v�n c�n k�p!",
		"Ng��i r�i kh�i th� gi�i giang h� c�c huynh �� t� mu�i ��u ti�c nu�i, n�u mu�n quay l�i n�i trong 7 ng�y v�n c�n k�p."
	}
	actor_del(actor_flag)
	Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag])
end
function actor_del(del_flag)
	if del_flag == 1 then
		--���ɾ����ɫ����
		EnableDeleteWaitFlag(1)
		EnableDeleteImmedFlag(1)
		ExitGame()		--t
		WriteLog(GetName().."X�a tr�ng.")
	else
		--����ɾ����ɫ��־
		EnableDeleteWaitFlag(1)
		ExitGame()  --t
		WriteLog(GetName().."L�u v�o danh s�ch x�a.")
	end
	return
end
--========================================================ʥ���==================================================================================
--------------------------------------------------------------���Ի�------------------------------------------------------
function Xmas_bishop_dialog()
	if zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() ~= 1 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi�ng sinh vui v�!!",
		3,
		"nh�n qu� Gi�ng sinh/get_Xmas_goods",
		"T�m hi�u ho�t ��ng Gi�ng sinh/about_Xmas_feast",
		"K�t th�c ��i tho�i/end_dialog"
		)
		return
	elseif zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() == 1 then
		conf_Xmas_tree_dialog()
	else
		if get_chrims_state() == 1 then --07��ʥ���
			local strtab = {
				"Ta mu�n nh�n Th�ng gi�ng sinh/get_chrims_tree",
				"Thuy�t minh ho�t ��ng Gi�ng Sinh Nguy�n ��n/about_chrims_detail",
				"Th�i, ta kh�ng c�n/nothing"
				};
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>Gi�ng sinh l�i ��n, ta ph�ng m�nh th��ng �� chu�n b� c�y Gi�ng sinh n�m nay, b�n c� mu�n nh�n kh�ng? L�u �, trong th�i gian t� <color=yellow>22/12/2008 ��n 23h 4/1/2009<color>, t� 1h s�ng ��n 23h m�i ng�y c� th� ��n ch� ta �� nh�n c�y Gi�ng sinh, nh�ng m�i ng�y ch� c� th� nh�n 1 c�y th�i. <color=yellow>Ng��i ch�i c�p 99, l�n ��u ti�n nh�n c�y Gi�ng sinh, c� th� nh�n ���c th�m 1 c�y.<color>",
				getn(strtab),
				strtab);
		else
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Tr�i ph� h� cho ng��i!",
				1,
				"K�t th�c ��i tho�i/end_dialog")
		end
	end
end
--****************************************����ʥ����********************************
-------------------------------------------------------------���Ʒ���----------------------------------------------
function get_Xmas_goods()
	if Zgc_pub_action_level_chk() ==0 then
		return
	end
	local get_turn = GetTask(961)
	if get_turn >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin l�i, h�m nay ng��i �� nh�n r�i. Ng�y mai l�i ��n nh�!")
		return
	else
		if Zgc_pub_goods_add_chk(getn(Xmas_goods),10) == 1 then
			local i = 0
			for i = 1, getn(Xmas_goods) do
				local add_flag = AddItem(Xmas_goods[i][1],Xmas_goods[i][2],Xmas_goods[i][3],Xmas_goods[i][4])
				if add_flag ==  1 then
					Msg2Player("B�n nh�n ���c "..Xmas_goods[i][4]..Xmas_goods[i][5]..Xmas_goods[i][6].."!")
				else
					WriteLog ("Ng��i ch�i:"..GetName().."T�ng"..Xmas_goods[i][6].." th�t b�i, tr� quay v�:"..add_flag..".")
				end
			end
			SetTask(961,zgc_pub_day_turn(1))
			Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin nh�n qu�, ch�c m�i s� t�t l�nh!")
		else
			return
		end
	end
end
-------------------------------------------------------------ʥ�������----------------------------------------------
function about_Xmas_feast()
	Talk(3,"#about_Xmas_feast_1(1)",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi�ng sinh_ Ch�c m�i ng��i an b�nh vui v�!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Ng��i m�i ng�y ��n ch� ta nh�n m�t <color=yellow>C�y Gi�ng sinh t�p th�<color> v� 3 <color=yellow>V�t ph�m trang tr� <color>. Th�ng qua vi�c tr�ng <color=yellow>C�y Gi�ng sinh<color> v� <color=yellow>trang tr� c�y Gi�ng <color> �� nh�n ph�n th��ng!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Th�ng qua l�m c�c nhi�m v�: Th��ng h�i, S�t Th�, Chi�n tr��ng, s� m�n c� th� nh�n ���c <color=yellow>C�y Gi�ng sinh ki�u di�m<color>, <color=yellow>C�y Gi�ng sinh l�ng l�y<color> v� <color=yellow>V�t ph�m trang tr�<color>. C�ch tr�ng 2 c�y n�y c�ng gi�ng nh� c�ch tr�ng c�a <color=yellow>C�y Gi�ng sinh t�p th�<color>. Nh�ng nh� r�ng n�u trang tr� nhi�u qu� s� l�m cho c�y <color=red>ng�<color> v� nh� th� s� kh�ng c� ph�n th��ng."
	)
end
function about_Xmas_feast_1()
	Talk(2,"end_dialog",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>M�i ng�y bang ch� c� th� nh�n <color=yellow>C�y Gi�ng sinh bang h�i<color>, <color=yellow>C�y Gi�ng sinh t�p th�<color>, <color=yellow>C�y Gi�ng sinh ki�u di�m<color> ho�c <color=yellow>C�y Gi�ng sinh l�ng l�y<color> v� <color=yellow>V�t ph�m trang tr�<color> t��ng �ng.",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Trong th�i gian di�n ra ho�t ��ng, m�i ng�y t� <color=red>21:00<color> ��n <color=red>21:30<color> t�i 3 th�nh th� ch�nh bang ch� c� th� tr�ng <color=yellow>C�y Gi�ng sinh <color>, ��ng th�i m�i th�nh vi�n trong bang h�i d�ng <color=red>khinh c�ng<color> �� treo <color=yellow>v�t ph�m trang tr�<color>. Bang ch� t��i <color=red>L� Th�y<color>�� <color=yellow>C�y Gi�ng sinh<color> mau t�ng c�p. Khi <color=yellow>C�y Gi�ng sinh <color> tr��ng th�nh s� nh�n ���c v� s� qu�!"
	)
end
-------------------------------------------------------------ʥ�����ĶԻ�----------------------------------------------
function Xmas_Tree_A()
	local Xmas_tree_index = GetTargetNpc()
	--�ж��Ƿ��Ǹ���ҵ���--
		local index_save = GetTask(963)
		if Xmas_tree_name_chk(Xmas_tree_index) ~= 1 then
			Msg2Player("��y kh�ng ph�i c�y Gi�ng sinh c�a b�n!")
			return
		end
	--����--
	local Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	local hang_time_remain = 300 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))	--300
	local tree_time_remian = 600 + hang_time_remain
	local hang_time_remain_str = "<color=yellow>"..Zgc_pub_time_sec_change(hang_time_remain,0).."<color>"
	local tree_time_remian_str = "<color=yellow>"..Zgc_pub_time_sec_change(tree_time_remian,0).."<color>"
	if hang_time_remain > 0 then
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Talk(1,"end_dialog","C�y Gi�ng sinh c�a ng��i ch�a �� tr��ng th�nh, c�n"..hang_time_remain_str.." m�i c� th� trang tr�. N�u nh� ng��i "..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!")
			return
		else
			Talk(1,"end_dialog","C�y Gi�ng sinh c�a ng��i ch�a �� tr��ng th�nh, c�n"..hang_time_remain_str.." m�i c� th� nh�n th��ng, n�u ng��i"..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!")
			return
		end
	elseif Zgc_pub_num_apart(Tree_diff,3) == 1 then			--����Ҫ�������ݣ����������Ѿ�����TaskID
		if Tree_diff < 140 then
			Say("N�u b�n �ang"..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!",
				3,
				"Ta ph�i trang tr�/#Xmas_acc_select_A()",
				"Ta s� nh�n th��ng/Xmas_prize_get",
				"R�i kh�i/end_dialog"
			)
		else
			Say("N�u b�n �ang"..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!",
				2,
				"Ta s� nh�n th��ng/Xmas_prize_get",
				"R�i kh�i/end_dialog"
			)			
		end
	else
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Say("N�u b�n �ang"..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!",
				3,
				"Ta ph�i trang tr�/#Xmas_acc_select(0)",
				"Ta s� nh�n th��ng/Xmas_prize_get",
				"R�i kh�i/end_dialog"
			)
		else
			Say("N�u b�n �ang"..tree_time_remian_str.."kh�ng ti�p t�c ch�m s�c, c�y s� bi�n m�t!",
				2,
				"Ta s� nh�n th��ng/Xmas_prize_get",
				"R�i kh�i/end_dialog"
			)
			
		end
	end

end
--------------------------------------------------------------����ѡ��---------------------------------------------------
function Xmas_acc_select_A()
	local dialog_table = {}
	local goods_num = 0
		if GetItemCount(2,0,577) ~= 0 then
			Xmas_acc_hang(1,1)
		else
			Talk(1,"end_dialog","B�n kh�ng c� v�t ph�m trang tr� ph� h�p!")
			return			
		end
end
-------------------------------------------------------------��������----------------------------------------------------
function Xmas_acc_select (page_num)
	local dialog_table = {}
	local goods_num = 0
	for i = 1,getn(Xmas_acc_table) do
		if GetItemCount(Xmas_acc_table[i][1],Xmas_acc_table[i][2],Xmas_acc_table[i][3]) ~= 0 then
			goods_num = goods_num +1
			dialog_table[goods_num] = Xmas_acc_table[i][4].."/#Xmas_acc_hang(0,"..i..")"
		end
	end
	if goods_num == 0 then
		Talk(1,"end_dialog","B�n kh�ng c� v�t ph�m trang tr� c�y Gi�ng sinh")
		return
	else
		dialog_table[goods_num + 1] = "�� ta ngh� xem/end_dialog"
		Say("    Treo th�m v�t ph�m trang tr� s� gi�p c�y Gi�ng sinh mau t�ng c�p, <color=red>nh�ng treo nhi�u qu� s� l�m c�y b� ng�<color>. Ng��i mu�n ch�n v�t ph�m trang tr� lo�i n�o?",--
			getn(dialog_table),
			dialog_table
		)
	end
end
----------------------------------------------����ɾ��������ʥ������������------------------------------------
function Xmas_acc_hang(tree_flag,acc_seq)
	local del_flag = 0
	local goods_name = ""
	if tree_flag == 1 then
		del_flag = DelItem(2,0,577,1)
		goods_name = "V�t tr.tr� th�ng GH"
	else
		del_flag = DelItem(Xmas_acc_table[acc_seq][1],Xmas_acc_table[acc_seq][2],Xmas_acc_table[acc_seq][3],1)
		goods_name = Xmas_acc_table[acc_seq][4]
	end
	if del_flag ~= 1 then
		Talk(1,"","X�c nh�n c�"..goods_name.."!")
		return
	else
		local Xmas_tree_index = GetTask(963)
		local tree_diff = GetUnitCurStates(Xmas_tree_index,4)
		if Zgc_pub_num_apart(tree_diff,3) == 1 then
			Xmas_tree_grow_A()
		else
			Xmas_tree_grow_other(Xmas_acc_table[acc_seq][3])
		end
	end
end
-----------------------------------------------------------ʥ��A��������---------------------------------------------
function Xmas_tree_grow_A()
	local Xmas_tree_index = GetTask(963)
	local tree_grow_way = {
		{121,111,122,"C�y Gi�ng sinh 1c",1},
		{131,121,132,"C�y Gi�ng sinh 1b",2},
		{133,122,134,"C�y Gi�ng sinh 1b",2},
		{141,131,142,"C�y Gi�ng sinh 1a",3},
		{142,132,143,"C�y Gi�ng sinh 1a",3},
		{143,133,144,"C�y Gi�ng sinh 1a",3},
		{144,134,141,"C�y Gi�ng sinh 1a",3},
	}
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))
	if hang_time_remain <= 0 then			--�ж����Ƿ񻹴���
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(Xmas_tree_index)
	local Xmas_Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	SetNpcLifeTime(Xmas_tree_index,0)
	for i = 1 ,getn(tree_grow_way) do
		if Xmas_Tree_diff == tree_grow_way[i][2] then
			local random_num = random(1,2)					--�����֧
			if random_num == 2 then
				random_num = -1
			end
			local SFX_seq = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],1)
			local tree_level = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],2)
			
			local Xmas_tree_name = GetName().." tr�ng "..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."-"..Conf_Xmas_tree_SQF_name[2][tree_grow_way[i][5]+1].."C�y th�ng gi�o h�i"
			local new_tree_index = CreateNpc(tree_grow_way[i][4],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
			SetNpcLifeTime(new_tree_index,900)
			--�ڴ˼�����Ч
				SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[1][tree_level][SFX_seq],1,1)
			--��Ч����
			SetUnitCurStates(new_tree_index,4,tree_grow_way[i][2 + random_num]) 	--д����������
			SetUnitCurStates(new_tree_index,1,GetTime()) 							--д��������ʱ��
			SetUnitCurStates(new_tree_index,0,1	) 									--д����������
			SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--д����������

			SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
			SetTask(962,GetTime())
			SetTask(963,new_tree_index)
		end
	end	
	Msg2Player("B�n �� trang tr� c�y Gi�ng sinh th�nh c�ng!")
end
---------------------------------------------------------ʥ����BC������-------------------------------------------
function Xmas_tree_grow_other(acc_id)
	local tree_grow_way = {
		{211,212,213,214,311,312,313,314},
		{221,321,222,322,223,323,224,324,221},
		{334,234,333,233,332,331,234,232,334},
		{344,241,341,242,342,243,343,244,344},
		}
	local tree_index = GetTask(963)
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(tree_index,1))
	if hang_time_remain <= 0 then			--�ж����Ƿ񻹴���
		return
	end
	SetNpcLifeTime(tree_index,0)
	if random(1,10) == 3 then				--����������������ԧ������
		Talk(1,"end_dialog","Xin l�i, v� treo nhi�u v�t ph�m, c�y gi�ng sinh c�a b�n �� b� ng�!")
		SetTask(963,0)
		SetTask(962,0)
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(tree_index)
	local tree_diff = GetUnitCurStates(tree_index,4)
	local tree_level = Zgc_pub_num_apart(tree_diff,2)
	local even_flag = 0					--�Ƿ�ż���жϱ�־
	if acc_id == floor(acc_id/2) * 2 then
		even_flag = 1
	end
	local new_tree_diff = 0
	for i = 1, 8 do
		if tree_diff == tree_grow_way[tree_level][i] then
			new_tree_diff = tree_grow_way[tree_level+1][i+even_flag]
		end
	end
	local new_tree_SFC = Zgc_pub_num_apart(new_tree_diff,1)					--��Ч
	local new_tree_level = Zgc_pub_num_apart(new_tree_diff,2)				--���ĵȼ�
	local new_tree_sign = Zgc_pub_num_apart(new_tree_diff,3)				--��������
	local Xmas_tree_name = GetName().." tr�ng "..Conf_Xmas_tree_SQF_name[1][new_tree_SFC + 1].."-"..Conf_Xmas_tree_SQF_name[2][new_tree_level].."C�y th�ng gi�o h�i"
	local new_tree_index = CreateNpc(Xms_tree_npc_name[new_tree_level][new_tree_sign],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
	SetNpcLifeTime(new_tree_index,900)
	--�ڴ˼�����Ч
	SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[new_tree_sign][new_tree_level][new_tree_SFC],1,1)
	--��Ч����
	SetUnitCurStates(new_tree_index,4,new_tree_diff) 
	SetUnitCurStates(new_tree_index,1,GetTime()) 			--д��������ʱ��
	SetUnitCurStates(new_tree_index,0,1) 
	SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--д����������
	SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	SetTask(962,GetTime())
	SetTask(963,new_tree_index)
	Msg2Player("B�n �� trang tr� c�y Gi�ng sinh th�nh c�ng!")
end
--------------------------------------------------------------ʥ��������-----------------------------------------------
function Xmas_prize_get()
	local tree_index = GetTask(963)
	SetNpcLifeTime(tree_index,0)
	local Tree_diff = GetUnitCurStates(tree_index,4)
	local Xmas_tree_prize = {
						{{1000,5000,10000,15000},{200000,300000,400000,500000}},
						{{300000,600000,900000,1000000},{200000,300000,400000,500000},"ModifyGoldenExp(","�i�m s�c kh�e"},
						{{10,20,40,40,},{5,10,15,20},"ModifyReputation("," �i�m danh v�ng!"},
						{2000,4000,6000,8000},					
						}
	local prize_seq_1 = Zgc_pub_num_apart(Tree_diff,3)
	local prize_seq_2 = Zgc_pub_num_apart(Tree_diff,2)
	local prize_seq_3 = Zgc_pub_num_apart(Tree_diff,1)
	if prize_seq_1 < 1 or prize_seq_1 > 4 or prize_seq_2 < 1 or prize_seq_2 > 4 or prize_seq_3 < 1 or prize_seq_3 > 4 then
		WriteLog ("Ng��i ch�i:"..GetName().."Tham s� ph�n th��ng l�i:["..prize_seq_1.."]: ["..Tree_diff.."]")
		return	
	end
	--��ȡ�����������¼������0
	SetTask(963,0)
	SetTask(962,0)
	local num = 0
	if prize_seq_1 == 1 then			--�̻�ʥ����
		num = (GetLevel() - 10) * Xmas_tree_prize[1][1][prize_seq_2]
		ModifyExp(num)
		Msg2Player("B�n nh�n ���c "..num.." �i�m kinh nghi�m!")
		----------------------------------------�̻�ʥ�������⽱��---------------------------------------
		local Xmas_tree_prize_A = {
			{{0,108,109,"N�n gi�ng sinh chu�n"},{0,108,139,"Tu� Th� qu�n"},{0,109,109,"Th��ng y gi�ng sinh chu�n"},{0,109,185,"Tu� Th� b�o"},{0,110,73,"H� y Gi�ng sinh chu�n"},{0,110,81,"Tu� Th� ngoa"}},  
			{{0,108,110,"N�n gi�ng sinh kh�i ng�"},{0,108,140,"Ch�nh S�c m�o"},{0,109,110,"Gi�ng sinh kh�i ng�"},{0,109,186,"Ch�nh S�c gi�p"},{0,110,74,"Trang ph�c gi�ng sinh kh�i ng�"},{0,110,82,"Ch�nh S�c ngoa"}},
			{{0,108,112,"N�n gi�ng sinh g�i c�m"},{0,108,141,"T�n Ch�nh k�t"},{0,109,112,"Th��ng y gi�ng sinh g�i c�m"},{0,109,187,"T�n Ch�nh th��ng"},{0,110,76,"H� y gi�ng sinh n� g�i c�m"},{0,110,83,"T�n Ch�nh qu�n"}},
			{{0,108,111,"N�n gi�ng sinh nh�"},{0,108,142,"Nguy�n Ch�nh tr�m"},{0,109,111,"Th��ng y gi�ng sinh Ki�u n�"},{0,109,188,"Nguy�n Ch�nh th��ng"},{0,110,75,"Gi�ng sinh Ki�u n�"},{0,110,84,"Nguy�n Ch�nh qu�n"}}	
			}
		local player_model = GetBody()
		if GetTask(968) ~= 0 and random(1,10) == 7 then
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			local prize_num_save = 0
			local prize_seq = 0
			if strlen(prize_str) == 1 then
				prize_seq = prize_num
			else
				local ran_num = random(1,strlen(prize_str))
				prize_seq = Zgc_pub_num_apart(prize_num,ran_num)				--ȡ���ڼ�λ��ֵ
				ran_num = strlen(prize_str) - ran_num + 1
				prize_num_save = Zgc_pub_num_peel(prize_num,ran_num)			--�Ѹ�λֵ����
				end
			local add_flag = AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
			if add_flag ==  1 then
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,prize_num_save)
		end
		if GetTask(964) == 4 then				--���Ŀý̻�ʥ�������ɰ�ñ��
			AddItem(Xmas_tree_prize_A[player_model][1][1],Xmas_tree_prize_A[player_model][1][2],Xmas_tree_prize_A[player_model][1][3],1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..Xmas_tree_prize_A[player_model][1][4])
		end
		if GetTask(964) == 8 then				--�ڰ˿�ʥ�������°�ñ��
			AddItem(Xmas_tree_prize_A[player_model][2][1],Xmas_tree_prize_A[player_model][2][2],Xmas_tree_prize_A[player_model][2][3],1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..Xmas_tree_prize_A[player_model][2][4])
		end
		if GetTask(964) == 10 and GetTask(968) ~= 0 then		--�ֵ�ʮ�ΰ�����δ����װ�����ˡ�
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			for i = 1,strlen(prize_str) do
				local prize_seq = Zgc_pub_num_apart(prize_num,i)
				AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1"..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,0)
		end
		--���ʥ��������Ľ���
		if prize_seq_2 == 4 then
			AddItem(Conf_acc_table[1][1],Conf_acc_table[1][2],Conf_acc_table[1][3],1)
			Msg2Player("B�n nh�n ���c 1"..Conf_acc_table[1][4]..", b�n c� th� d�ng nh�ng v�t ph�m n�y trang tr� l�n c�y Gi�ng sinh bang h�i ho�c t�ng l�i cho ng��i kh�c.")
		end
		--------------------------------------------------����--------------------------------------------------
	else
		if prize_seq_1 == 2 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			if num > GetGoldenExp() then
				num = GetGoldenExp()
			end
			ModifyGoldenExp(-num)
			ModifyExp(num)
			if num ~= 0 then
				Msg2Player("B�n d�ng"..num.."�i�m s�c kh�e ��i �i�m kinh nghi�m.")
			end
		elseif prize_seq_1 == 3 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			ModifyReputation(num,0)
			Talk(1,"end_dialog","B�n nh�n ���c "..num.." �i�m danh v�ng!")
			local exp_num = (GetLevel()-10) * Xmas_tree_prize[4][prize_seq_3]
			ModifyExp(exp_num)
			Msg2Player("B�n nh�n ���c "..exp_num.." �i�m kinh nghi�m!")	
		end
		
		if prize_seq_2 == 4 then
			local conf_acc_seq_table = random(2,getn(Conf_acc_table))
			AddItem(Conf_acc_table[conf_acc_seq_table][1],Conf_acc_table[conf_acc_seq_table][2],Conf_acc_table[conf_acc_seq_table][3],1)
			Msg2Player("B�n nh�n ���c 1"..Conf_acc_table[conf_acc_seq_table][4]..", b�n c� th� d�ng nh�ng v�t ph�m n�y trang tr� l�n c�y Gi�ng sinh bang h�i ho�c t�ng l�i cho ng��i kh�c.")	
		end
	end
	Xmas_SFX_prize(prize_seq_3,prize_seq_2)
end
----------------------------------------------��Ч�Ľ���--------------------------------------------
function Xmas_SFX_prize(SFX_diff,SFX_level)
	local Xmas_SFX_prize_table = {
		{200000,300000,400000,500000},
		{200000,300000,400000,500000},
		{5,10,15,20},
		{2500,3000,3500,4000}
	}
	local num = Xmas_SFX_prize_table[SFX_diff][SFX_level]
	if SFX_diff == 1 then			--����
		ModifyExp(num)
		Msg2Player("B�n nh�n ���c "..num.." �i�m kinh nghi�m!")			
	elseif SFX_diff == 2 then		--��������
		ModifyGoldenExp(num)
		Msg2Player("B�n nh�n ���c "..num.."�i�m s�c kh�e")
	elseif SFX_diff == 3 then		--��Ϊ
		ModifyReputation(num,0)
		Talk(1,"end_dialog","B�n nh�n ���c "..num.." �i�m danh v�ng!")	
	else
		ModifyPopur(num)
		Msg2Player("B�n nh�n ���c "..num.." �i�m tu luy�n!")	
	end
end
--***************************************���ʥ����*********************************
----------------------------------------------------------����ʿ�Ի�---------------------------------------------
function conf_Xmas_tree_dialog()
	Zgc_pub_getconftask(1,1)				--λ�á��������
end
function ConfDataGetReturn_1(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi�ng sinh vui v�!!",
			3,
			"nh�n qu� Gi�ng sinh/get_Xmas_goods",
			"T�m hi�u ho�t ��ng Gi�ng sinh/about_Xmas_feast",
			--"ʲô��ʥ��ѽ��/about_Xmas",
			"R�i kh�i/end_dialog"
		)
	else
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi�ng sinh vui v�!!",
			4,
			"Nh�n c�y Gi�ng sinh bang h�i/get_conf_Xmas_tree",
			"nh�n qu� Gi�ng sinh/get_Xmas_goods",
			"T�m hi�u ho�t ��ng Gi�ng sinh/about_Xmas_feast",
			--"ʲô��ʥ��ѽ��/about_Xmas",
			"R�i kh�i/end_dialog"
			)
	end
end
-----------------------------------------------------���ʥ��������-------------------------------------------------
function get_conf_Xmas_tree()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","Ch� c� bang ch� m�i c� th� nh�n ���c c�y Gi�ng sinh bang h�i!")
		return
	elseif Zgc_pub_action_level_chk () ~= 1 then
			return
	else
		if Zgc_pub_goods_add_chk(1,10) == 1 then
			Zgc_pub_setconftask(1,zgc_pub_day_turn(1),1)		--λ�á�ֵ���������
		else
			return
		end
	end
end
function ConfDataSetReturn_1()
	local add_flag = AddItem(2,0,576,1)
	Msg2Player("B�n �� nh�n ���c c�y Gi�ng sinh bang h�i")
end
------------------------------------------------���ʥ�����Ի�------------------------------------------
function conf_Xmas_tree(conf_Xmas_tree_index)
	if IsTongMember() == 0 then
		Talk(1,"end_dialog","    Gia nh�p bang h�i m�i c� th� trang tr� c�y Gi�ng sinh.")
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","     ��y ch�ng ph�i l� c�y Gi�ng sinh c�a qu� bang sao?")
		return
	end
	--����ȼ��ж�
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_tree_level =  Zgc_pub_num_apart(conf_Xmas_tree_diff,2)
	local conf_tree_build_time = GetUnitCurStates(conf_Xmas_tree_index,1)
	local conf_tree_acc_A = GetUnitCurStates(conf_Xmas_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_Xmas_tree_index,3)
	local conf_tree_acc_total = (conf_tree_acc_A + conf_tree_acc_B)

	local conf_Xmas_time_distance = GetTime() - conf_tree_build_time
	SetTaskTemp(163,conf_Xmas_tree_index)			--д����������
	
	if conf_Xmas_tree_diff < 40 then
		local wt_than_max = ""					-- �Ƿ��صľ��棬ֻ����1-3���Ϳ����ˡ�
		if (conf_tree_acc_A + conf_tree_acc_B) > Conf_Xmas_acc_wt_max[conf_tree_level] then
			wt_than_max = "<color=red>V�t ph�m trang tr� qu� n�ng c� th� s� r�i xu�ng!<color>"
		end
		local conf_Xmas_tree_life_time = 600 - conf_Xmas_time_distance
		local conf_Xmas_tree_update_time = 300 - conf_Xmas_time_distance
		
		local conf_Xmas_update_dialog = ""
		if conf_Xmas_tree_update_time < 0 then
			conf_Xmas_update_dialog = "    C�y gi�ng sinh c�a qu� bang �� t�ng c�p, c� th� ti�p t�c trang tr� nh�ng n�u <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh�ng t�ng c�p c�y s� bi�n m�t."..wt_than_max
		else
			conf_Xmas_update_dialog = "    C�y Gi�ng sinh c�a qu� bang c�n ph�i ��i <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_update_time,0).."<color> m�i c� th� t�ng c�p, c� th� ti�p t�c trang tr�, n�u nh� <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh�ng t�ng c�p c�y s� bi�n m�t."..wt_than_max
		end
		if IsTongMaster() == 1 and (GetTime() - conf_tree_build_time) > 300 then
			Say(conf_Xmas_update_dialog,
			3,
			"Ta c�n ph�i gi�p c�y Gi�ng sinh c�a bang h�i t�ng c�p (c�n m�t ph�n L� th�y)/cong_Xmas_tree_up",
			"Ta ph�i trang tr�/conf_Xmas_tree_hang_acc",
			"R�i kh�i/end_dialog")
		else
			Say(conf_Xmas_update_dialog,
			2,
			"Ta ph�i trang tr�/conf_Xmas_tree_hang_acc",
			"R�i kh�i/end_dialog")		
		end
	else
		local conf_Xmas_tree_life_time_lv4 = 1800 - conf_Xmas_time_distance
		
		Say("C�y Gi�ng sinh c�a qu� bang �� ��t ��n ��ng c�p cao nh�t, c� th� ��n <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_life_time_lv4,0).."<color> nh�n ph�n th��ng.",
		2,
		"Ta s� nh�n th��ng/conf_Xmas_tree_get_prize",
		"R�i kh�i/end_dialog")
	end	
end
----------------------------------------------���ʥ��������ѡ��---------------------------------------------
function conf_Xmas_tree_hang_acc()
	local dialog_table = {}
	local acc_num = 0
	for i = 1 ,getn(Conf_acc_table) do
		if GetItemCount(Conf_acc_table[i][1],Conf_acc_table[i][2],Conf_acc_table[i][3]) ~= 0 then
			acc_num = acc_num + 1
			dialog_table[acc_num] = Conf_acc_table[i][4].."/#conf_acc_select("..Conf_acc_table[i][3]..")"
		end
	end	
	dialog_table[acc_num + 1] = "�� ta ngh� xem/end_dialog"
	if acc_num == 0 then
		Talk(1,"end_dialog","B�n kh�ng c� v�t ph�m trang tr� ph� h�p!")
		return
	end
	Say("Ch�n v�t trang tr� cho c�y Gi�ng sinh c�a bang h�i b�n:",
		getn(dialog_table),
		dialog_table
	)
end
function conf_acc_select(acc_id)
	SetTaskTemp(162,acc_id)
	Talk(1,"end_dialog","Ng��i c� th� d�ng khinh c�ng �� treo v�t trang tr� l�n c�y Gi�ng sinh.")
end
--------------------------------------------���ʥ������������------------------------------------
function cong_Xmas_tree_up()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dilog","    Ch� c� bang ch� m�i c� th� t�ng c�p c�y Gi�ng sinh bang h�i.")
		return
	end
	local conf_tree_index = GetTaskTemp(163)
	if Conf_Xmas_tree_name_chk(conf_tree_index) ~= 1 then
		Talk(1,"end_dialog","    ��y ch�ng ph�i l� c�y Gi�ng sinh c�a qu� bang sao?")
		return
	end
	local conf_tree_build_time = GetUnitCurStates(conf_tree_index,1)
	if GetTime() - conf_tree_build_time > 600 then			--�ж����Ƿ񻹴���
		Talk(1,"end_dialog","    c�y Gi�ng sinh c�a qu� bang �� bi�n m�t!")	
		return
	end
	--¶ˮ
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"end_dialog","    T�ng c�p cho c�y Gi�ng sinh bang h�i c�n ph�i c� {L� Th�y}")
		return
	end
	--¶ˮɾ��
	if DelItem(2,0,351,1) ~= 1 then
		Talk(1,"end_dialog","    X�c nh�n trong h�nh trang c�a b�n c� �em theo {L� th�y} �� t�ng c�p c�y Gi�ng sinh.")
		return	
	end
	--�����ݵĶ�ȡ
	local conf_tree_diff = GetUnitCurStates(conf_tree_index,4)
	local conf_tree_SQF_seq = Zgc_pub_num_apart(conf_tree_diff,1)
	local conf_tree_level = Zgc_pub_num_apart(conf_tree_diff,2)
	local conf_tree_acc_A = GetUnitCurStates(conf_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_tree_index,3)
	local conf_player_num = GetUnitCurStates(conf_tree_index,6)
	--�����ݵĶ���
	local New_conf_tree_level = conf_tree_level + 1					--�����ȼ�
	local New_conf_tree_SQF_seq = 0									--������Ч
	if conf_tree_acc_A >= 10 then									--A���������롵10��
		local num_step_distance = 0 
		if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][4][3] then
			if New_conf_tree_level ~= 2 then
				num_step_distance = (4 - conf_tree_SQF_seq) * 7
			end
			if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][5] - num_step_distance) then
				New_conf_tree_SQF_seq = 4
			else
				New_conf_tree_SQF_seq = 3
			end
		else
			for i = 1,4 do
				if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][i][2] and conf_tree_acc_B < Conf_Xmas_grow_way[New_conf_tree_level][i][3] then
					if New_conf_tree_level ~= 2 then
						num_step_distance = (i - conf_tree_SQF_seq) * 7
					end
					if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][i][1] - num_step_distance) then
						New_conf_tree_SQF_seq = i
					else
						New_conf_tree_SQF_seq = i - 1
					end
					break
				end
			end
		end
	end
	local map_ID,att_X,att_Y = GetNpcWorldPos(conf_tree_index)
	local conf_Xmas_tree_name = GetTongName().." tr�ng "..Conf_Xmas_tree_SQF_name[1][New_conf_tree_SQF_seq+1].."-"..Conf_Xmas_tree_SQF_name[2][New_conf_tree_level].."C�y th�ng gi�o h�i"
	local new_conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[New_conf_tree_level][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
	SetNpcLifeTime(conf_tree_index,0)
	SetNpcScript(new_conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--�ļ�����ֻ����ȡ������Ӧ�ð�trap��ȥ��
	if New_conf_tree_level == 4 then
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),0)
			end
		end
		SetNpcLifeTime(new_conf_Xmas_tree_index,1800)												--���ʱ��30����
		--��ṫ��
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("T�i"..map_name.."C�y Gi�ng sinh c�a qu� bang �� th�ng l�n c�p 4, c� th� nh�n ph�n th��ng.")
		end
	else
		SetNpcLifeTime(new_conf_Xmas_tree_index,600)													--���ʱ��10����
	end
	--��ʥ������2��3λ�������
	SetUnitCurStates(new_conf_Xmas_tree_index,2,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,3,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,0,2)
	SetUnitCurStates(new_conf_Xmas_tree_index,6,conf_player_num)
	SetUnitCurStates(new_conf_Xmas_tree_index,8,strlen(GetTongName()))
	--��Ч����
	if New_conf_tree_SQF_seq ~= 0 then
		SetCurrentNpcSFX(new_conf_Xmas_tree_index,Xmas_tree_SFX_table[4][New_conf_tree_level][New_conf_tree_SQF_seq],1,1)
	end
	local new_conf_tree_diff = (New_conf_tree_level * 10) + New_conf_tree_SQF_seq
	SetUnitCurStates(new_conf_Xmas_tree_index,4, new_conf_tree_diff)					--д����������
	SetUnitCurStates(new_conf_Xmas_tree_index,1, GetTime())								--д��������ʱ��		
	WriteLog ("Bang h�i"..GetTongName().."C�p:"..New_conf_tree_level.."��ng c�p hi�u qu� ��c bi�t:"..New_conf_tree_SQF_seq)
end
--------------------------------------------------------���ʥ�����������-------------------------------------------------------------
function conf_Xmas_tree_get_prize()
	local conf_Xmas_tree_index = GetTaskTemp(163)
	if conf_Xmas_tree_index == 0 then
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","��y ch�ng ph�i l� c�y Gi�ng sinh c�a qu� bang sao?")
		return
	end
	--ÿ����ÿ��ֻ�ܻ��һ�ΰ�ά����ע�����Ҫzgc_pub_day_turn(1)д��
	if GetTask(975) >= zgc_pub_day_turn(1) then					
		Talk(1,"end_dialog","H�m nay ng��i �� nh�n ph�n th��ng c�a bang h�i, ng�y mai l�i ��n nh�!")
		return
	end
	local conf_Xmas_tree_prize = {
		{1000,1000,1},
		{2000,2000,5},
		{5000,3000,8},
		{10000,5000,10},
		{20000,10000,20}
	}
	if Zgc_pub_goods_add_chk(1,10) == 0 then
		return
	end
	--�����Ͻ����������
	local conf_Xmas_acc_up_flag = 0				
	if GetTask(973) == zgc_pub_day_turn(1) then
		conf_Xmas_acc_up_flag = 1					
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_Xmas_tree_SQF = Zgc_pub_num_apart(conf_Xmas_tree_diff,1) + 1
	local Player_level_diff = (GetLevel() - 10)
	if conf_Xmas_acc_up_flag == 1 then
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2])*Player_level_diff).." �i�m kinh nghi�m!")
		WriteLog (GetName().."��ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff).." �i�m kinh nghi�m!")
	else
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." �i�m kinh nghi�m!")
		WriteLog (GetName().."��ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." �i�m kinh nghi�m!")
	end
	SetTask(975,zgc_pub_day_turn(1))
	if IsTongMaster() == 1 and GetUnitCurStates(conf_Xmas_tree_index,5) ~= 37 then
		local player_num = GetUnitCurStates(conf_Xmas_tree_index,6)
		local goods_num = floor((GetUnitCurStates(conf_Xmas_tree_index,6)/50) * conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]) + 1
		if goods_num > conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3] then
			goods_num = conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]
		end
		SetUnitCurStates(conf_Xmas_tree_index,5,37)
		AddItem(2,0,545,goods_num)
		SendTongMessage("Nh�n ph�n th��ng c�y Gi�ng sinh bang h�i:"..goods_num.." Sinh Th�n Cang!")
		WriteLog ("Bang h�i"..GetTongName().."�� nh�n "..goods_num.." Sinh Th�n Cang!")
	end
end
--=============================================================end=====================================================================================

--===============================07��ʥ���==========================
function get_chrims_tree()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>��ng c�p c�a b�n qu� th�p, t� c�p 40 tr� l�n m�i c� th� tham gia ho�t ��ng n�y.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_TREE) >= nDate then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> H�m nay ng��i �� nh�n 1 c�y Th�ng gi�ng sinh r�i, ng�y mai h�y ��n.");
		return
	end 
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return 
	end
	local Add_flag = AddItem(2,0,574,1); --ʥ����id
	if Add_flag == 1 then
		SetTask(TASK_GET_TREE,nDate);
		if GetTask(TASK_TAIYI_TUPU) == 0 and GetLevel() == 99 then
			SetTask(TASK_TAIYI_TUPU,1);
			AddItem(2,0,574,1);
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>�a t� b�n �� �ng h� V� L�m 2 trong th�i gian qua. Gi�ng sinh l�i v�, xin t�ng b�n l� v�t Gi�ng Sinh! B�n �� nh�n ���c th�m m�t <color=yellow>c�y Gi�ng Sinh<color> n�a, ch�c b�n ch�i vui v�!");
		else
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> c�m �i, Th�ng gi�ng sinh c�a ng��i ��y, n�u mu�n bi�t c�ch trang tr� Th�ng gi�ng sinh, v� Th�ng gi�ng sinh c� nh�ng ph�n th��ng n�o, c� th� xem thuy�t minh.");
		end
	else
		WriteLog("[07 ho�t ��ng Gi�ng Sinh nh�n Th�ng gi�ng sinh]"..GetName().."Nh�n Th�ng gi�ng sinh th�t b�i, ti�u ch� th�t b�i:"..Add_flag);
	end
end

function about_chrims_detail()
	local strtab = {			
					"Trang tr� Th�ng gi�ng sinh th� n�o/how_strew_tree",
					"Trang tr� Th�ng gi�ng sinh nh�n ���c ph�n th��ng n�o/about_tree_award",
					"T�m hi�u ho�t ��ng b�i s�/about_newyear08_bai",
					"Ta ch� ��n xem th�/nothing"
					}	
	Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> B�n mu�n t�m hi�u ph��ng di�n n�o?",
		getn(strtab),
		strtab)
end

function how_strew_tree()
	Talk(1,"how_strew_tree2","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> c� ���c Th�ng gi�ng sinh xong, c� th� s� d�ng � m�i n�i (nh�p chu�t tr�i s� d�ng). C� hai l�a ch�n\nM�t, ��t Th�ng gi�ng sinh\nHai, kh�ng, ��t sau\nCh�n ��t Th�ng gi�ng sinh xong, tr�n m�t ��t s� xu�t hi�n Th�ng gi�ng sinh, b�n c� th� trang tr� Th�ng gi�ng sinh v� nh�n ph�n th��ng.\nCh�n 'Kh�ng, ��t sau', s� tho�t kh�i l�a ch�n. \nM�i l�n ��t Th�ng gi�ng sinh k�o d�i nhi�u nh�t 30 ph�t, sau 30 ph�t t� ��ng thu l�i, mu�n trang tr� ph�i ��t l�i.");
end

function how_strew_tree2()
	Talk(1,"how_strew_tree3","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Khi b�n ��t Th�ng gi�ng sinh xong, c� th� thao t�c tr�n Th�ng gi�ng sinh\n C� th� t�m ki�m n�i dung tr�n Th�ng gi�ng sinh nh� sau\nM�t, trang tr� Th�ng gi�ng sinh\nHai, nh�n ph�n th��ng trang tr� Th�ng gi�ng sinh\nBa, nh�n qu� Gi�ng Sinh\nB�n, thu l�i Th�ng gi�ng sinh");
end

function how_strew_tree3()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Trang tr� Th�ng gi�ng sinh c� th� l�m Th�ng gi�ng sinh ��p h�n, c�n c� th� nh�n ph�n th��ng trang tr� Th�ng gi�ng sinh, m�i l�n trang tr� Th�ng gi�ng sinh xong, ph�n th��ng nh�n ���c l�n sau s� �u�c nh�n ��i cho ��n khi ho�n t�t trang tr� Th�ng gi�ng sinh. \nN�u b�n h�i l�ng v�i Th�ng gi�ng sinh m�nh trang tr� c� th� nh�n qu� Gi�ng sinh cu�i c�ng, c�n ch� �, nh�n qu� xong, Th�ng gi�ng sinh s� bi�n m�t. N�u kh�ng h�i l�ng, suy ngh� xem m�nh c� mu�n nh�n qu� kh�ng. \nNgo�i qu� trang tr� Th�ng gi�ng sinh ph� th�ng, c�n c� m�t s� thi�p ch�c do c�c gi�o s� l�m �� t�ng cho c�c ��i m�n ph�i. B�n c� c�ng hi�n cho s� m�n s� nh�n ���c thi�p ch�c n�y.");	
end

function about_tree_award() --�����Ϊ����
	Talk(1,"about_tree_award2","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>M�i l�n trang tr� c�y Gi�ng Sinh b�n ��u c� c� h�i nh�n ���c ph�n th��ng, v� ph�n th��ng kinh nghi�m. Khi c�y Gi�ng Sinh c�a b�n �� ��t ��n m�c cao nh�t th� c� th� nh�n ���c ph�n th��ng cu�i c�ng. Ph�n th��ng cu�i c�ng, ngo�i �i�m kinh nghi�m phong ph�, c�n c� c� h�i nh�n ���c Linh th�ch qu� hi�m.\nD�a v�o ��ng c�p m� b�n s� nh�n ���c nh�ng ph�n th��ng kh�c nhau. ��ng c�p c�ng cao th� ph�n th��ng nh�n ���c c�ng nhi�u.<color=yellow> L�u �, n�u b�n �� �� kinh nghi�m c�a c�p 99, th� s� kh�ng th� nh�n th�m kinh nghi�m.<color>\nNgo�i ra, l�c b�n nh�n ���c ph�n th��ng cu�i c�ng, d�a v�o tr�nh �� trang tr� c�y Gi�ng Sinh, c�n c� x�c su�t nh�n ���c tu�n l�c Gi�ng Sinh, T�n Nguy�n Ngo�i Trang v� Tri�u Hoa Ngo�i Trang.\nM�i ng�y, b�n c�n c� c� h�i tr� th�nh ng�i sao Gi�ng Sinh, nh�n ���c g�p ��i ph�n th��ng kinh nghi�m trong l�c nh�n ph�n th��ng cu�i c�ng.");
end

function about_tree_award2()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>3 V� l�m cao th� c�a Trung Nguy�n, Th��ng Th�n Doanh Thi�n, b�c L�c l�m minh ch� v� L�nh H��ng L�ng c��p ���c r�t nhi�u Th�ng gi�ng sinh c�a t�n ��, ch�ng ta l� Qu� ��, n�u ng��i mu�n �o�t l�i Th�ng gi�ng sinh, t�y ng��i. \nNh�ng ph�n l�n Th�ng gi�ng sinh ��u kh�ng d�ng ���c. \nM�i ng��i ch� ���c trang tr� 2 c�y Th�ng gi�ng sinh m�t ng�y.");
end

function about_newyear08_bai()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>N�m m�i l�i ��n, xin ch�c trong n�m m�i b�n s� nh�n ���c nhi�u ni�m vui h�n n�m qua. C� nh�n n�i, trong ba ng��i �i tr�n ���ng �t c� ng��i l�m th�y ta, v� v�y b�n h�y ��n g�p nh�ng ng��i m�nh h�n m�nh �� th�nh gi�o kinh nghi�m giang h�.\n��u ti�n b�n h�y t� ��i v�i ng��i b�n mu�n th�nh gi�o, ��ng c�p c�a ��i ph��ng ph�i cao h�n b�n, th�c hi�n ��ng t�c 'b�i' �� th� hi�n th�nh � c�a b�n th�n, ��i ph��ng s� ��p l�i � nguy�n c�a b�n. N�u hai ng��i t�m ��u � h�p, c� th� s� nh�n ���c ph�n th��ng g�p ��i.\nL�u �, m�i ng�y m�i ng��i ch� c� th� th�nh gi�o kinh nghi�m giang h� m�t l�n, cho n�n ph�i ch�n cho m�nh l�o s� th�t t�t. Ng��i ch�i c�p 99 ph�i t�m ng��i ch�i c�ng ��ng c�p �� t� ��i. N�u kinh nghi�m �� ��y th� kh�ng th� nh�n th�m kinh nghi�m n�a.");
end
