--�ű����ƣ�������������ʹ�ýű�
--�ű����ܣ������ڵĸ������ӵ�ʹ�ã���Ϊ��������һ��������ͬ��ֵ��һ����صļ��ܵ�ѧϰ������
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-27
--�����޸ļ�¼��
	Same_heart_value_TaskID = 2015			--ͬ��ֵ
	Same_heart_value_max = 5000				--ͬ��ֵ����
	Same_heart_value_max_TaskID = 2023		--ͬ��ֵ����id
	Ma_skill_level_max = 5					--������������
	--�����Ӧ������Ϣ
	Tb_ma_skill = {}
	Tb_ma_skill[581] = {867,5,"�i�p Luy�n"}		--���ܴ��š����ƣ���ʱ���
	Tb_ma_skill[582] = {867,5,"�i�p Luy�n"}		--���ܴ��š����ƣ���ʱ���
	Tb_ma_skill[577] = {865,4,"T��ng T�"}			--���ܴ��š����ƣ���ʱ���
	Tb_ma_skill[578] = {865,4,"T��ng T�"}			--���ܴ��š����ƣ���ʱ���
	Tb_ma_skill[579] = {866,5,"H�a �i�p"}			--���ܴ��š����ƣ���ʱ���
	Tb_ma_skill[580] = {866,5,"H�a �i�p"}			--���ܴ��š����ƣ���ʱ���
	--������Ϣ
	Tb_goods_compose = {}
	Tb_goods_compose[573] = {"��ng T�m Ho�n","S� d�ng tr� ��ng t�m t�ng <color=yellow>125<color> �i�m!"}
	Tb_goods_compose[574] = {"��i ��ng T�m Ho�n","S� d�ng tr� ��ng t�m t�ng <color=yellow>300<color> �i�m!"}
	Tb_goods_compose[575] = {"��ng T�m ��n","Ng��i s� d�ng Tr� s� ��ng t�m t�i �a t�ng <color=yellow>125<color> �i�m!"}
	Tb_goods_compose[576] = {"��i ��ng T�m ��n","Ng��i s� d�ng Tr� s� ��ng t�m t�i �a t�ng <color=yellow>300<color> �i�m!"}
	Tb_goods_compose[577] = {"T� t��ng b�n quy�n","Ng��i s� d�ng c� th� <color=yellow>h�c h�i: k� n�ng truy�n t�ng<color>!"}
	Tb_goods_compose[578] = {"T� t��ng t�n quy�n","Ng��i s� d�ng c� th� <color=yellow>t�ng c�p: k� n�ng truy�n t�ng<color>!"}
	Tb_goods_compose[579] = {"H�a �i�p b�n quy�n","M�t �� L�u tinh"}
	Tb_goods_compose[580] = {"H�a �i�p t�n quy�n","Ng��i s� d�ng c� th� <color=yellow>t�ng c�p k� n�ng h�i sinh<color>!"}
	Tb_goods_compose[581] = {"�i�p Luy�n b�n quy�n","Ng��i s� d�ng c� th� <color=yellow>h�c h�i k� n�ng gi�p ��<color>!"}
	Tb_goods_compose[582] = {"�i�p Luy�n t�n quy�n","Ng��i s� d�ng c� th� <color=yellow>th�ng c�p k� n�ng gi�p ��<color>!"}

--==================================�������߼�����==================================
function OnUse(goods_index)
	--�ж��Ƿ���
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch� �<color>: Ch�a k�t h�n ch�a th� s� d�ng v�t ph�m n�y!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>G�i � <color>: S� d�ng <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> c� th� ��"..Tb_goods_compose[goods_id][2],
	2,
	"��i/#use_deal("..goods_id..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--*******************************ȷ��ʹ��*************************
function use_deal(goods_id)
	--����Я�����
	if GetItemCount(2,1,goods_id) < 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--ͬ��ֵ���ӵ��ߵ�ʹ��
	if goods_id == 573 or goods_id == 574 then
		local same_heart_value_add_num = 0			--���������ӵ�ͬ��ֵ
		if goods_id == 573 then
			same_heart_value_add_num = 125
		elseif goods_id == 574 then
			same_heart_value_add_num = 300
		end
		--ͬ��ֵ�������޻�ȡ
		local same_heart_value_max = GetTask(Same_heart_value_max_TaskID)
		local same_heart_value_now = GetTask(Same_heart_value_TaskID)
		local same_heart_value_dis = same_heart_value_max - same_heart_value_now
		--ͬ��ֵ�������޴���
		if same_heart_value_dis < 0 then
			SetTask(Same_heart_value_TaskID,same_heart_value_max)
			same_heart_value_dis = 0
		end
		--��ʼ����
			--ͬ��ֵ���޲���ֱ�Ӽ�
		if 	same_heart_value_dis >= same_heart_value_add_num then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value = (same_heart_value_now + same_heart_value_add_num)
				SetTask(Same_heart_value_TaskID,Same_heart_value)
				Talk(1,"","<color=green>G�i �<color>: Ch�c m�ng b�n �� s� d�ng "..Tb_goods_compose[goods_id][1].."�� t�ng"..same_heart_value_add_num.." (�i�m) Tr� s� ��ng t�m, ��t ���c <color=yellow>"..Same_heart_value.."<color> �i�m!")
			end
		--ͬ��ֵ�ﵽ����ֱ�ӷ���
		elseif same_heart_value_dis == 0 then
			Talk(1,"","<color=green>G�i �<color>: Tr� s� ��ng t�m �� ��t t�i : <color=red>"..same_heart_value_max.."<color>�i�m, kh�ng th� s� d�ng<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>G�i �<color>: Gi�i h�n Tr� s� ��ng t�m hi�n t�i l� <color=red>"..same_heart_value_max.."<color> �i�m, s� d�ng <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> ch� t�ng <color=yellow>"..same_heart_value_dis.."<color> �i�m, s� d�ng ch�?",
			2,
			"��i/#use_dtm("..goods_id..","..same_heart_value_dis..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
		end
	--ͬ��ֵ�������ӵ��ߵ�ʹ��
	elseif goods_id == 575 or goods_id == 576 then
		local same_heart_value_max_add_num = 0			--���������ӵ�ͬ��ֵ
		if goods_id == 575 then
			same_heart_value_max_add_num = 125
		elseif goods_id == 576 then
			same_heart_value_max_add_num = 300
		end
		--ͬ��ֵ�������޴���
		local same_heart_max_value_now = GetTask(Same_heart_value_max_TaskID)
		local same_heart_max_dis_value = Same_heart_value_max - same_heart_max_value_now
			--ͬ��ֵ���޲�������ֱ�Ӽ�
		if same_heart_value_max_add_num <= same_heart_max_dis_value then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value_max = (same_heart_max_value_now + same_heart_value_max_add_num)
				SetTask(Same_heart_value_max_TaskID,(same_heart_max_value_now + same_heart_value_max_add_num))
				Talk(1,"","<color=green>G�i �<color>: Ch�c m�ng b�n �� s� d�ng "..Tb_goods_compose[goods_id][1].."�� t�ng"..same_heart_value_max_add_num.."(�i�m) gi�i h�n Tr� s� ��ng t�m, �� ��t ���c <color=yellow>"..Same_heart_value_max.."<color> �i�m!")
			end
			--ͬ��ֵ�Ѿ��������޲���ɾ��ֱ�ӷ���
		elseif same_heart_max_dis_value == 0 then
			Talk(1,"","<color=green>G�i �<color>: Gi�i h�n Tr� s� ��ng t�m �� ��t t�i tr� cao nh�t: <color=red>"..same_heart_max_value_now.."<color>�i�m, kh�ng th� s� d�ng<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>G�i �<color>: gi�i h�n Tr� s� ��ng t�m hi�n t�i, tr� cao nh�t l� <color=red>"..same_heart_max_value_now.."<color> �i�m, s� d�ng <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> ch� t�ng <color=yellow>"..same_heart_max_dis_value.."<color> �i�m Tr� s� ��ng t�m, s� d�ng ch�?",
			2,
			"��i/#use_dtm("..goods_id..","..same_heart_max_dis_value..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
		end
	--����ѧϰ��Ʒ
	elseif goods_id == 577 or goods_id == 579 or goods_id == 581 then
		if HaveLearnedSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Talk(1,"","<color=green>G�i �<color>: b�n �� h�c ���c: <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh�ng th� s� d�ng m�t �� n�y!")
			return
		else
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			end
			if LearnSkill(Tb_ma_skill[goods_id][1]) == 1 then
				Talk(1,"","<color=green>G�i �<color>: Ch�c m�ng b�n h�c ���c '<color=yellow>"..Tb_ma_skill[goods_id][3].."<color>', nh�n' <color=yellow>F3<color>' m� giao di�n<color=yellow>H�n Nh�n<color> m�i c� th� s� d�ng k� n�ng n�y!")
			else
				WriteLog("K� n�ng H�n Nh�n: ng��i ch�i ("..GetName()..") s� d�ng "..Tb_goods_compose[goods_id][1].."h�c h�i th�t b�i!")
			end
		end
	--����������Ʒ
	else
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) == 0 then
			Talk(1,"","<color=green>G�i �<color>: B�n ch�a h�c ���c <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh�ng th� s� d�ng m�t �� n�y!")
			return
		end
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) >= Tb_ma_skill[goods_id][2] then
			Talk(1,"","<color=green>G�i �<color>: Hi�n t�i ��ng c�p k� n�ng <color=yellow>"..Tb_ma_skill[goods_id][3].."<color> �� cao nh�t, kh�ng th� th�ng c�p!")
			return
		end
		if DelItem(2,1,goods_id,1) ~= 1 then
			Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		end
		if LevelUpSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Msg2Player("Ch�c m�ng b�n th�ng c�p!"..Tb_ma_skill[goods_id][3].. " !")
		else
			WriteLog("K� n�ng H�n Nh�n: ng��i ch�i ("..GetName()..") s� d�ng "..Tb_goods_compose[goods_id][1].."th�ng c�p th�t b�i!")
		end
	end
end
--******************************ͬ��ֵ�����ʱ��Ĵ���******************************
function use_dtm(goods_id,add_num)
	--��ƷЯ�����
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--��Ʒɾ�����
	if DelItem(2,1,goods_id,1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--ͨ������ͬ��ֵ��ͬ��ֵ��������
	if goods_id == 573 or goods_id == 574 then
		local Same_heart_value = (GetTask(Same_heart_value_TaskID) + add_num)
		SetTask(Same_heart_value_TaskID,Same_heart_value)
		Talk(1,"","<color=green>G�i �<color>: Ch�c m�ng b�n �� s� d�ng "..Tb_goods_compose[goods_id][1].."�� t�ng"..add_num.." (�i�m) Tr� s� ��ng t�m, ��t ���c <color=yellow>"..Same_heart_value.."<color> �i�m!")
	else
		local Same_heart_value_max = (GetTask(Same_heart_value_max_TaskID) + add_num)
		SetTask(Same_heart_value_max_TaskID,Same_heart_value_max)
		Talk(1,"","<color=green>G�i �<color>: Ch�c m�ng b�n �� s� d�ng "..Tb_goods_compose[goods_id][1].."�� t�ng"..add_num.."(�i�m) gi�i h�n Tr� s� ��ng t�m, �� ��t ���c <color=yellow>"..Same_heart_value_max.."<color> �i�m!")
	end
end
