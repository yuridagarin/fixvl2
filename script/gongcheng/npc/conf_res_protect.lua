--�ű����ƣ���ṥ��ս_��Դ��������_��Դ���䳵�Ի�����
--�ű����ܣ��Ի���������������Դ�����⡣
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-11
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=================================������������======================================
	--�ǽ���Ӧ�ĳ���
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
	--����NPC��¼λ��
	--1����¼�Ƿ�ռ��
	box_belong_ID = 2				--��ֵ��ʼ��Ϊ0
	--2��������
	box_open_week_ID = 4			--��ֵ��ʼ��Ϊ0
	--��ʼ�򿪵�ʱ��
	box_open_time_ID = 5				--��ʼ��Ϊ0
	--NPC������¼ID
	TasktempID_npc_index = 166
function main()
	Talk(1,"","<color=green>Ch� �<color>: R��ng �� ���c kh�a, ��i hi�p kh�ng th� m� r��ng ���c n�a !!!!")
	do return end

	local npc_index = GetTargetNpc()
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	--�жϱ����Ƿ�ռ��
	if city_belog_name == "" or city_belog_name == nil then
		Talk(1,"","<color=green>Ch� �<color>: Ch�a c� bang ph�i chi�m l�nh th�nh th� n�y, kh�ng th� m� nhi�m v� b�o h� T�i nguy�n tu�n n�y!")
		return
	end
	--��ǰ�Ƿ��ǿ����ӵ�ʱ�䣿
	if Zgc_pub_week_day() ~= 3 or (Zgc_pub_week_day() == 3 and (Zgc_pub_today_sec_num_rtn() < 72000 or Zgc_pub_today_sec_num_rtn() > 75600))then
		Talk(1,"","<color=green>Ch� �<color>: Th�i gian B�o h� T�i nguy�n bang h�i chi�n: m�i t�i <color=yellow>th� T� <color> t� <color=yellow>19 gi�<color> ��n <color=yellow>20 gi�<color>!")
		return
	end
	if GetLevel() < 73 then
		Talk(1,"","<color=green>Ch� �<color>: ��ng c�p d��i 73 kh�ng th� tham gia ho�t ��ng n�y")
		return	
	end
	--��ս��״̬�޷���
	if GetFightState() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Tr�ng th�i phi chi�n ��u kh�ng th� tham gia ho�t ��ng n�y")
		return
	end
	--�����ڱ����Ƿ��Ѿ�����
	if GetUnitCurStates(npc_index,box_open_week_ID) >= zgc_pub_day_turn(7) then
		Talk(1,"","<color=green>Ch� �<color>: T�i nguy�n c�a r��ng n�y �� b� c��p �o�t!")
		return
	end
	--С�ײ����Կ�����
	if GetPlayerFaction() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Ng��i ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng n�y")
		return
	end
	--����ģʽ�����Բμ�
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","<color=green>Ch� �<color>: D�ng th�c luy�n c�ng kh�ng th� nh�n ���c T�i nguy�n n�y")
		return
	end
	--������ʿ���ÿ������������
	if IsTongMember() ~= 0 and GetTongName() == city_belog_name then
		Talk(1,"","<color=green>Ch� �<color>: Nh�n s� c�a b�n bang kh�ng th� tham gia trang �o�t t�i nguy�n n�y")
		return
	end
	--����̫Զ�޷�����
	if Zgc_pub_npc_distance() > 10 then
		Talk(1,"","<color=green>Ch� �<color>: C� ly qu� xa, kh�ng th� m� B�o r��ng")
		return
	end
	--����ռ��״̬�ж�
	if GetUnitCurStates(npc_index,box_belong_ID) ~= 1 and (GetTime() - GetUnitCurStates(npc_index,box_open_time_ID)) < 46 then
		Talk(1,"","<color=green>Ch� �<color>: �� c� ng��i kh�c �ang s� d�ng r��ng n�y")
		return
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>Ch� �<color>: h�nh trang kh�ng �� 1 � tr�ng")
		return
	end
	
	--�������ϣ����Կ�������
		--��־״̬Ϊ����״̬
		if SetUnitCurStates(npc_index,box_belong_ID,2) ~= 1 then
			return
		end
		SetUnitCurStates(npc_index,box_open_time_ID,GetTime())
		--����NPC����
		SetTaskTemp(TasktempID_npc_index,npc_index)
		--�����������ȡ
		DoWait(7,8,45)		
end
	--��Դ����ʱ��Ϊ������
	task_week_seq = 3
	--��Դ������ʼʱ��Ϊ20��00-21��00
	task_start_sec_seq = 72000
	task_end_sec_seq = 75600
function conf_res_protect_date_chk()
	--�Ƿ���������
	local week_seq_now = 0
	week_seq_now = floor((GetTime() - 57600)/86400)
	week_seq_now = num_return - (floor(num_return/7) * 7)
	if week_seq_now >= 2 then
		week_seq_now = week_seq_now - 2
	else
		week_seq_now = week_seq_now + 5
	end
	if week_seq_now ~= task_week_seq then
		return 0
	else
	--�Ƿ�����Դ����ʱ��
		local sec_seq_now = ((GetTime() - 57600) - (floor(sec_num/86400))*86400)
		if sec_seq_now >= task_start_sec_seq and sec_seq_now <= task_end_sec_seq then
			return 1
		else
			return 0
		end		
	end
end