--�ű����ƣ��������ʹ�ýű�
--�ű����ܣ�ʹ�ý���С����������С��������������ȡ��صĻ����
--�߻��ˣ�����
--�����д�ˣ��Թ�
--�����дʱ�䣺2007-01-31
--�޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=========================��������������========================
prize_list = {
	{627,"T�i ti�u ph�c Kim Tr�",1180000,180000,18,120},
	{628,"Ti�u H�ng Bao Kim Tr�",0.01,5,10,1},
	{629,"��i H�ng Bao Kim Tr�",0.015,8,15,1,240,1,50}
}
--==========================�ű����߼���=========================
--**************************��Ʒʹ��������********************
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1, getn(prize_list) do
		if prize_list[i][1] == goods_id then
			goods_diff = i
			break
		end
	end
	Say("D�ng <color=green>"..prize_list[goods_diff][2].."<color> c� th� ��i ph�n th��ng t��ng �ng, ��ng � ch�?",
		2,
		"��i"..prize_list[goods_diff][2].."/#goods_use_det("..goods_diff..")",
		"�� ta suy ngh� l�i/end_dialog")
end
--******************************��������**********************
function goods_use_det(goods_diff)
	if GetItemCount(2,0,prize_list[goods_diff][1]) == 0 then		--��Ʒ���
		Talk(1,"","Xin x�c nh�n trong t�i h�nh lang c�a b�n c� <color=green>"..prize_list[goods_diff][2].."<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(3,100) ~= 1 then						--��������/�ռ���
		return
	end
	if DelItem(2,0,prize_list[goods_diff][1],1) ~= 1 then			--ɾ����Ʒ���
		Talk(1,"","Xin x�c nh�n trong t�i h�nh lang c�a b�n c� <color=green>"..prize_list[goods_diff][2].."<color>!")
		return		
	end
	if goods_diff == 1 then
		--��������ת����
		local player_level = GetLevel()
		local exp_num = player_level * player_level * player_level
		ModifyExp(exp_num)
		Msg2Player("Ch�c m�ng b�n s� d�ng"..prize_list[goods_diff][2].."Nh�n ���c "..exp_num.." �i�m kinh nghi�m!")
		--��������
		ModifyReputation(prize_list[1][5],0)
		--���Ӱ׾�ʹ��ʱ��
		SetTask(2501,(GetTask(2501)+prize_list[1][6]))
		Msg2Player("B�n nh�n ���c 2 gi� s� d�ng B�ch c�u!")
	else
		if goods_diff == 3 then
			--���Ӱ׾�ʹ��ʱ��
			SetTask(2501,(GetTask(2501)+prize_list[goods_diff][7]))
			Msg2Player("B�n nh�n ���c 4 gi� s� d�ng B�ch c�u!")
			--�ؼ�����
			local ran_num = random(1,100)
			if ran_num == 37 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c ng� h�nh m�t t�ch!")
					Msg2SubWorld("Ng��i ch�i:"..GetName().."S� d�ng "..prize_list[goods_diff][2].."Nh�n ���c M�t t�ch ng� h�nh!")
				else
					WriteLog("Ho�t ��ng t�n ni�n s� d�ng Kim Tr� ��i H�ng Bao: Ng��i ch�i:"..GetName().."T�ng [M�t t�ch ng� h�nh] th�t b�i, t�a �� th�t b�i:"..add_flag)
				end
			elseif ran_num <= 50 then
				Faction_book_add(goods_diff)
			end
		elseif goods_diff == 2 then
			Earn(80000)
		end
		local exp_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * prize_list[goods_diff][3])
		ModifyExp(exp_num)
		Msg2Player("Ch�c m�ng b�n s� d�ng"..prize_list[goods_diff][2].."Nh�n ���c "..exp_num.." �i�m kinh nghi�m!")
		local iron_num = random(prize_list[goods_diff][4],prize_list[goods_diff][5])
		local add_flag = AddItem(2,2,8,iron_num)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..iron_num.." s�t!")
		end
		local weapon_id =random(375,(375+11))
		add_flag = AddItem(2,1,weapon_id,prize_list[goods_diff][6])
		if add_flag == 1 then
			Msg2Player("B�n nh�n ���c m�n v� kh�!")
		end
		spring2007_spring_goods_add()
	end
end
--**********************ʦ���ؼ�����**************************
function Faction_book_add(goods_diff)
	local book_name = {"Kim Cang Ph�c Ma kinh","Ti�m Long M�t t�ch","V� Tr�n M�t t�ch","Thi�n La M�t T�ch","Nh� � M�t T�ch","B�ch H�i Ph�","H�n ��n M�t t�ch",
						"Qu� Thi�n M�t t�ch","Huy�n �nh M�t t�ch","Qu�n T� M�t t�ch","Tr�n Qu�n M�t t�ch","Xuy�n V�n M�t t�ch","U Minh Qu� L�c","Linh C� M�t t�ch"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..book_name[book_seq].."!")
		Msg2SubWorld("Ng��i ch�i:"..GetName().."S� d�ng "..prize_list[goods_diff][2].."Nh�n ���c "..book_name[book_seq].."!")
	else
		WriteLog("Ho�t ��ng t�n ni�n s� d�ng Kim Tr� ��i H�ng Bao: Ng��i ch�i:"..GetName().."T�ng"..book_name[book_seq].." th�t b�i, k� hi�u:"..add_flag)
	end
	return
end
