Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--�峤�Ĺ�������
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")

--���������������
Box_player_min = 4
Box_player_max = 10
Map_num_max = 10
Npc_name = "<color=green>��c s� ��i H�i V� l�m<color>:"
Box_map_id = 802		--���ͼID
--TaskID��¼���
Box_prize_date_seq = 1960
Box_prize_step = 1961
Box_best_prize = 1962
Box_prize_9_times = 1963
Box_prize_get_flag = 1964
Log_in_mapID = 1965
--��ǰ���صĵ�ͼ����
Box_map_loaded = 0

-----------mission���
MS_ID = 44
Time_trigger_ID = 73
Timer_interval = 18 * 1
--MissionIDռ�����
MS_LOOP_NUM = 1
MS_BOX_STEP = 2
--npc��¼λ��
Npc_unit_attitude = 2
--buff�б�
Tb_jiguan_buff = {
	--��   
	"state_vertigo",
	--��   
	"state_confusion",
	--˯   
	"state_sleep",
	--����100%   
	"state_move_speed_percent_add",
	--����50%   
	"state_slow",
}
Tb_box_num_prize = {
	[1] = 5,
	[2] = 5,
	[3] = 5,
	[4] = 4,
	[5] = 4,
	[6] = 4,
	[7] = 3,
	[8] = 2,
	[9] = 1
}
--��������
Tb_log_out_att = {
	[100] = {1445,2950},
	[200] = {1412,2853},
	[300] = {1776,3541}
}
