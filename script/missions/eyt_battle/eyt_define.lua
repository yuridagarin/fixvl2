Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DebugOutput = nothing
EYT_MAP_ID = 6076;
EYT_MISSION_ID = 71;
EYT_TIMER_ID = 101;
EYT_JOIN_TIME_LIMIT = 4;
EYT_PLAYER_MAX = 8;
EYT_MISSION_MAX = 100;
EYT_KILL_PLAYER = 1;
EYT_OPEN_FLAG = 40;
EYT_COUNTDOWN_REVIVE = 2;
EYT_COUNTDOWN_TIME = 15;
EYT_SCROE_MAX = 150;
EYT_FLAG_REFLESH_TIME = 3 * 60;
EYT_PUNISH_TIME = 15 * 60;
EYT_AWARD_COEFFICIENT = VNG_CFG_EXTRA_EYT_ADD_RATE or 0;    --�����ӳ�ϵ��

--==============˫����Ӫ========================
EYT_CAMP_RED = 1;
EYT_CAMP_BLUE = 2;
EYT_CAMP_STRING = {
	["camp_player"] = EYT_CAMP_RED,
	["camp_enemy"] = EYT_CAMP_BLUE,
}
EYT_CAMP_NAME = {
	[EYT_CAMP_RED] = "��i ��",
	[EYT_CAMP_BLUE] = "��i xanh",
}
--==============������ս����״̬===================
EYT_STATE_PEACE = 1;				--�ȴ������׶�
EYT_STATE_FIGHT = 2;				--��ս״̬
EYT_STATE_COMPLETE = 3;		  --ս������״̬

EYT_REV_POS = {
	[EYT_CAMP_RED] = {
		{1644, 3178},
		{1640, 3175},
		{1635, 3169},
		{1632, 3163},
	},
	[EYT_CAMP_BLUE] = {
		{1587, 3253},
		{1583, 3251},
		{1579, 3244},
		{1579, 3251},
	},
}

EYT_NPC_FLAG = "Chi�n K� �n O�n ��i";

--TASK-==========================
EYT_TASK_1 = 3271; --1,2byteδʹ��,3byteʤ����4byte�ܳ�
EYT_TASK_2 = 3272; --1byte���������2byte��ɱ����3byte��ɱ����4���˹��׻���
EYT_TASK_3 = 3274; --����ʱ��

--ѩ��BUFF
EYT_XUEHEN = {--����� ���������ֵ �������������ֵ ���߸������
	{21,150,300,15,format("Tuy�t h�n c�p %d", 11),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{19,150,300,14,format("Tuy�t h�n c�p %d", 10),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{17,135,270,14,format("Tuy�t h�n c�p %d", 9),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{15,120,240,13,format("Tuy�t h�n c�p %d", 8),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{13,105,210,13,format("Tuy�t h�n c�p %d", 7),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{11,90 ,180,12,format("Tuy�t h�n c�p %d", 6),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{9 ,75 ,150,12,format("Tuy�t h�n c�p %d", 5),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{7 ,60 ,120,10,format("Tuy�t h�n c�p %d", 4),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{5 ,45 ,90 , 5,format("Tuy�t h�n c�p %d", 3),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{3 ,30 ,60 , 3,format("Tuy�t h�n c�p %d", 2),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
	{1 ,15 ,30 , 1,format("Tuy�t h�n c�p %d", 1),"C�ng k�ch t�ng %d%%, gi�i h�n sinh l�c t�ng %d%%, mi�n d�ch tr�ng th�i ph� %d l�n"},
};

--�˸����λ��
EYT_FO_POS = {
	{"Nga Mi ti�u s� t� 1", "Nga Mi ti�u s� t� ", 1634, 3163, "camp_player"},
	{"Nga Mi ti�u s� t� 2", "Nga Mi ti�u s� t� ", 1630, 3167, "camp_player"},
	{"Nga Mi ti�u s� t� 3", "Nga Mi ti�u s� t� ", 1645, 3173, "camp_player"},
	{"Nga Mi ti�u s� t� 4", "Nga Mi ti�u s� t� ", 1642, 3180, "camp_player"},
	{"Nga Mi ti�u s� t� 1", "Nga Mi ti�u s� mu�i", 1572, 3247, "camp_enemy"},
	{"Nga Mi ti�u s� t� 2", "Nga Mi ti�u s� mu�i", 1575, 3243, "camp_enemy"},
	{"Nga Mi ti�u s� t� 3", "Nga Mi ti�u s� mu�i", 1588, 3256, "camp_enemy"},
	{"Nga Mi ti�u s� t� 4", "Nga Mi ti�u s� mu�i", 1590, 3252, "camp_enemy"},
}