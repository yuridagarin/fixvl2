Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--村长的公共函数
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")

--活动开启的人数限制
Box_player_min = 4
Box_player_max = 10
Map_num_max = 10
Npc_name = "<color=green>c s? Чi H閕 V? l﹎<color>:"
Box_map_id = 802		--活动地图ID
--TaskID记录情况
Box_prize_date_seq = 1960
Box_prize_step = 1961
Box_best_prize = 1962
Box_prize_9_times = 1963
Box_prize_get_flag = 1964
Log_in_mapID = 1965
--当前加载的地图数量
Box_map_loaded = 0

-----------mission相关
MS_ID = 44
Time_trigger_ID = 73
Timer_interval = 18 * 1
--MissionID占用情况
MS_LOOP_NUM = 1
MS_BOX_STEP = 2
--npc记录位置
Npc_unit_attitude = 2
--buff列表
Tb_jiguan_buff = {
	--晕   
	"state_vertigo",
	--乱   
	"state_confusion",
	--睡   
	"state_sleep",
	--加速100%   
	"state_move_speed_percent_add",
	--减速50%   
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
--传出坐标
Tb_log_out_att = {
	[100] = {1445,2950},
	[200] = {1412,2853},
	[300] = {1776,3541}
}
