--�ű����ƣ�07�����ڽű�
--�ű����ܣ�����ʹ�ö�Ӧ�ű�
--�߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-05-25
--�����޸ļ�¼��
	Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
	happy_zong_zi_num_TaskID = 1229
	aixiang_eat_num_TaskID = 1243
	happy_zong_zi_date_TaskID = 1244
--==============================================��������������====================================
	TB_zongzi_use_fun = {}
	TB_zongzi_use_fun[1123] = {"b�nh �t ng�i h��ng","C� th� nh�n ���c <color=yellow>10 v�n*��ng c�p*��ng c�p/6400<color> �i�m kinh nghi�m.","return zong_zi_exp_chg(100000)"}
	TB_zongzi_use_fun[1124] = {"b�nh �t ch�n g�","C� th� t�ng Sinh l�c t�i �a <color=yellow>30%<color>, duy tr� <color=yellow>10<color> ph�t!","return zong_zi_life_add(30,10800)"}
	TB_zongzi_use_fun[1125] = {"b�nh �t B�c B�o","T�ng to�n b� n�ng l�c<color=yellow>60<color> �i�m, duy tr� <color=yellow>3<color> ph�t.","return zong_zi_all_add(60,3240)"}
--==============================================�������߼���======================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>G�i � <color>: S� d�ng <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>"..TB_zongzi_use_fun[goods_id][2].."B�n c� mu�n s� d�ng kh�ng?",
	2,
	"��i/#use_dtm("..goods_id..")",
	"�� suy ngh�/end_dialog"
	)
end
function use_dtm(goods_id)
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
	dostring(TB_zongzi_use_fun[goods_id][3])
end
--��������
function zong_zi_exp_chg(exp_chg_num)
	local player_level = GetLevel()
	exp_chg_num = floor(exp_chg_num * player_level * player_level /6400)
	--�����ж�
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save >= date_now and num_save >= 5 then
		Talk(1,"","<color=green>G�i � <color>: <color=yellow>b�nh �t ng�i h��ng<color> m�i ng�y ch� ���c �n <color=red>5<color> c�i!")
		return
	end
	if DelItem(2,1,1123,1) == 1 then
		ModifyExp(exp_chg_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_chg_num.." �i�m kinh nghi�m!")
		ai_xiang_update()
		return
	else
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
end
function ai_xiang_update()
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save < date_now then
		SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
		SetTask(aixiang_eat_num_TaskID,1)
		SetTask(happy_zong_zi_num_TaskID,0)
		num_save = 0
	else
		SetTask(aixiang_eat_num_TaskID,(num_save + 1))
	end
	Talk(1,"","<color=green>G�i � <color>: <color=yellow>b�nh �t ng�i h��ng<color> m�i ng�y ch� ���c s� d�ng <color=yellow>5<color> l�n, ��y l� l�n th� <color=yellow>"..(num_save+1).." <color> s� d�ng <color=yellow>b�nh �t ng�i h��ng<color>!")
	return
end
--��������
function zong_zi_life_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1124,1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>B�nh �t th�t n��ng <color>!")
		return
	end
	CastState("state_life_max_percent_add",add_num,abidance_time,1,1124)
end
--�˱�����
function zong_zi_all_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1125,1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>b�nh �t B�t B�o<color>!")
		return
	end
	CastState("state_add_strength",add_num,abidance_time,1,11251)
	CastState("state_add_energy",add_num,abidance_time,1,11252)
	CastState("state_add_vitality",add_num,abidance_time,1,11253)
	CastState("state_add_dexterity",add_num,abidance_time,1,11254)
	CastState("state_add_observe",add_num,abidance_time,1,11255)
end
--��̨���ܳ�
function leitai_chk()
	local player_map = GetWorldPos()
	if (player_map >= 801 and player_map <= 805) or (player_map >= 810 and player_map <= 838) then
		Talk(1,"","<color=yellow>G�i � <color>: L�i ��i kh�ng th� s� d�ng nh�ng v�t n�y!")
		return 0
	else
		return 1
	end
end
