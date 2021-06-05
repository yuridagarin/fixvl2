------------------------------------------------------------------
--   ��q��r��q��r��q��r��q��r�� 
-- /���Ũ�\/���Ũ�\/���Ũ�\/���Ũ��Ũ�\ 
--   ��     ��    ��     ��    ��     ��    ��     ��    ��
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
File_name = "\\script\\online\\zgc_goods_use.lua"
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

--=================================ϵͳ������========================
function OnUse(goods_index)
	if GetTask(960) ~= 1226 then			--���ݳ�ʼ��
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--�������
		SetTask(960,1226)					--���־
	end
	local goods_id = GetItemParticular(goods_index)
	local i = 1
	local find_flag = 0
	for i = 1,getn(Goods_Use_Table) do
		if getn(Goods_Use_Table[i]) == 2 and goods_id == Goods_Use_Table[i][1] then
			find_flag = 1
			dostring(Goods_Use_Table[i][2]..goods_index..")")
			break
		elseif getn(Goods_Use_Table[i]) == 3 and goods_id >= Goods_Use_Table[i][1] and goods_id <= Goods_Use_Table[i][2] then
			find_flag = 1
			dostring(Goods_Use_Table[i][3])
			break
		end
	end	
	if find_flag == 0 then
		DelItemByIndex(goods_index,1)
	end
end
--====================================================================ʥ���============================================================================
--*******************************����ʥ�����Ĵ���***************************
function Xmas_tree(tree_diff,goods_index)
	local map_min = 700
	local MapID,Att_X,Att_Y = GetWorldPos()
	--����ȼ��ж�
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--��ͼ�ж�
	if MapID >= map_min then
		Talk(1,"end_dialog","    N�i ��y kh�ng c� linh kh�, n�n t�m m�t ch� t�t h�n!")
		return
	end
	--ʱ���ж�
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	--ÿ�����������ж�
	if tree_diff == 1 and GetTask(965) == zgc_pub_day_turn(1) then												--ʥ���������ж�
		Talk(1,"end_dialog","    M�i ng�y ch� tr�ng ���c m�t c�y Gi�ng sinh t�p th�!")
		return
	end
	if GetTask(966) >= zgc_pub_day_turn(1) and GetTask(967) >= 4 then						--�����������ж�
		Talk(1,"end_dialog","    gi�i h�n m�i ng�y tr�ng ���c 4 c�y!")
		return
	end
	--�Ƿ��������Լ��������ж�
	if Xmas_tree_create_time_con() ~= 1 then
		Talk(1,"end_dialog","    B�n �� tr�ng ���c 1 c�y Gi�ng sinh!")
		return
	end
	
	local SFX_seq = 0			--��Ч��ţ�������local������������������������
	if tree_diff == 1 then		--��Ч����
		SFX_seq = 1
	else
		SFX_seq = random(1,4)
	end
	
	local Xmas_tree_name = GetName().." tr�ng "..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."c�y Gi�ng sinh (nh�)"
	local Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][tree_diff],Xmas_tree_name,MapID,Att_X,Att_Y,6,1,1,0)
	SetNpcScript(Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--�ڴ˼�����Ч

	tree_diff_save = (tree_diff * 100) + 10 + SFX_seq						--�������ͼ���
	SetCurrentNpcSFX(Xmas_tree_index,Xmas_tree_SFX_table[tree_diff][1][SFX_seq],1,1)				--��Ч����
	
	SetUnitCurStates(Xmas_tree_index,4,tree_diff_save) 						--д����������
	SetUnitCurStates(Xmas_tree_index,1,GetTime()) 							--д��������ʱ��
	SetUnitCurStates(Xmas_tree_index,0,1) 									--д����������
	SetUnitCurStates(Xmas_tree_index,8,strlen(GetName())) 					--д����������
	SetTask(962,GetTime())
	SetTask(963,Xmas_tree_index)
	if tree_diff == 1 then													--�̻�ʥ���������Ĵ����ͱ��ֵ�ʱ���¼
		SetTask(964,(GetTask(964) + 1))
		SetTask(965,zgc_pub_day_turn(1))
	end
	if GetTask(966) ~= zgc_pub_day_turn(1) then
		SetTask(966,zgc_pub_day_turn(1))
		SetTask(967,1)
	else
		SetTask(967,(GetTask(967) + 1))
	end
	SetNpcLifeTime(Xmas_tree_index,900)										--���ʱ��15����
	DelItemByIndex(goods_index,1)
	if GetTask(966) < zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","    H�m nay, ��y l� l�n th� <color=yellow>1<color> b�n tr�ng c�y, b�n c� th� tr�ng <color=yellow>3<color> c�y Gi�ng sinh t�p th� ho�c c�y Gi�ng sinh c� nh�n!")
	else
		local Xmas_tree_times_total = ""
		local Xmas_tree_times_remain = ""
		if GetTask(967) == 1 then
			Xmas_tree_times_total = "<color=yellow>l�n 1<color>"
			Xmas_tree_times_remain = ", h�m nay b�n c� th� tr�ng <color=yellow>3<color> l�n c�y Gi�ng sinh t�p th� ho�c l�m nhi�m v� kh�c �� nh�n c�y Gi�ng sinh!"
		elseif GetTask(967) == 2 then
			Xmas_tree_times_total = "<color=yellow>l�n 2<color>"
			Xmas_tree_times_remain = ", h�m nay b�n c� th� tr�ng <color=yellow>2<color> l�n c�y Gi�ng sinh t�p th� ho�c l�m nhi�m v� kh�c �� nh�n c�y Gi�ng sinh!"
		elseif GetTask(967) == 3 then
			Xmas_tree_times_total = "<color=yellow>l�n 3<color>"
			Xmas_tree_times_remain = ", h�m nay b�n c� th� tr�ng <color=yellow>1<color> l�n c�y Gi�ng sinh t�p th� ho�c l�m nhi�m v� kh�c �� nh�n c�y Gi�ng sinh!"
		elseif GetTask(967) == 4 then
			Xmas_tree_times_total = "<color=yellow>l�n cu�i c�ng<color>"
			Xmas_tree_times_remain = "!"
		end
		Talk(1,"end_dialog","    ��y l� l�n th� "..Xmas_tree_times_total.." l�n tr�ng c�y"..Xmas_tree_times_remain)
	end
end
--********************************�ְ��ʥ����**********************************
function conf_Xmas_tree(tree_index)
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","    Ch� c� bang ch� m�i c� th� tr�ng c�y Gi�ng sinh bang h�i.")
		return
	end
	--�ȼ��ж�
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--ʱ���ж�
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local map_chk_flag = 0
	local tree_map_dialog = ""
	for i = 1,getn(Conf_Xmas_tree_map) do
		tree_map_dialog = "<color=yellow>"..tree_map_dialog..Conf_Xmas_tree_map[i][2].."<color> ,"
		if map_ID == Conf_Xmas_tree_map[i][1] then
			map_chk_flag = 1
			break
		end
	end
	tree_map_dialog = strsub(tree_map_dialog,1,(strlen(tree_map_dialog)-1))
	if map_chk_flag == 0 then
		Talk(1,"end_dialog",
		"    C�y Gi�ng sinh bang h�i ch� c� th� tr�ng � nh�ng khu v�c sau ��y:"..tree_map_dialog
		)
		return
	end

	if tonumber(date("%H%M")) <2100 or tonumber(date("%H%M")) > 2130 then
		Talk(1,"end_dialog",
		"    C�y gi�ng sinh bang h�i m�i ng�y ch� c� th� tr�ng t� <color=yellow>21:00<color> ��n <color=yellow>21:30<color>."
		)
		return
	end
	SetTaskTemp(161,tree_index)
	Zgc_pub_getconftask(2,2)				--λ�á��������
end
function ConfDataGetReturn_2(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",
			"    h�m nay �� tr�ng c�y Gi�ng sinh, ng�y mai l�i ��n nh�!"
		)
		return 		--test
	end
	local del_flag = DelItemByIndex(GetTaskTemp(161),1)
	if del_flag ~= 1 then
		Talk(1,"end_dialog",
			"    X�c nh�n trong h�nh trang c�a b�n c� c�y Gi�ng sinh bang h�i!"
		)
		return
	else
		local SFC_seq = floor(random(10,49)/10)					--��ЧID
		local conf_tree_diff = 10 + SFC_seq			--���ʥ����������
		local map_ID,att_X,att_Y = GetWorldPos()
		local conf_Xmas_tree_name = GetTongName().." tr�ng "..Conf_Xmas_tree_SQF_name[1][SFC_seq +1 ].."-".."C�y Gi�ng Sinh (nh�)"
		local conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
		SetNpcScript(conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
		--��ʥ������2��3λ�������
		SetUnitCurStates(conf_Xmas_tree_index,2,0)
		SetUnitCurStates(conf_Xmas_tree_index,3,0)
		SetUnitCurStates(conf_Xmas_tree_index,6,0)
		SetUnitCurStates(conf_Xmas_tree_index,8,strlen(GetTongName()))
		--trip�����
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),Conf_Xmas_trap_way)
			end
		end
		--��ṫ��
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("T�i"..map_name.."C�y Gi�ng sinh bang h�i �� tr�ng, mong c�c v� bang ch�ng ��n trang tr�!")
		end
		--��Ч����
		SetCurrentNpcSFX(conf_Xmas_tree_index,Xmas_tree_SFX_table[4][1][SFC_seq],1,1)					--��Ч����
		SetUnitCurStates(conf_Xmas_tree_index,4,conf_tree_diff) 						--д����������
		SetUnitCurStates(conf_Xmas_tree_index,1,GetTime()) 								--д��������ʱ��	
		SetUnitCurStates(conf_Xmas_tree_index,0,2) 										--д����������
		SetNpcLifeTime(conf_Xmas_tree_index,600)										--���ʱ��10����
	end
	Zgc_pub_setconftask(2,zgc_pub_day_turn(1),2)		--λ�á�ֵ���������
end
function ConfDataSetReturn_2()
end
--====================================================================����============================================================================
