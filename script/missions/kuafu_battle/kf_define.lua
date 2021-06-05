Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
--���ÿ����Դ��������Ҫ�޸�-----------------
--KF_NPC_POS = {6028, 1620, 3145} --������������꣨�����
--KF_NPC_POS_SRC = {300, 1855, 3556}  --���ս���콱������(Դ��)
KF_MAP_TASK_TEMP_ID = 428 --���¹���ͼ��¼������Ϣ
--�˳�ս���ĵ�
KF_OUT_POS = {
	{428, 1310, 2693},
	{428, 1405, 2800},
	{428, 1490, 2743},
	{428, 1366, 2608},
}
---------------------------------------------
KF_CURR_OPEN_COUNT = 1; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT, x)
KF_LAST_OPEN_MAPID = 2; --SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID, x)

KF_EXP_EXT_RATE = min(VNG_CFG_KFB_EXP_EXT_ADD_RATE or 0, 2)--���齱���ӳ�ϵ��
KF_JUNGONG_EXT_RATE = min(VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE or 0, 2) --�����ӳ�ϵ��

KF_ENTRY_FEE = 1;  --������

KF_JOIN_TIMES_MAX = 2; --һ�����μӵĴ���

KF_TEAM_SIZE_MAX = 3; --���������������

KF_REVIVE_BUFF_TIME = 15; --s

KF_LOGTITEL = "Ph�n th��ng chi�n tr��ng li�n ��u";

---���ս��ʹ�õ��������--------------------------------
---�贫��Դ���������������------------------------------
KF_BATTLE_TASK = 3132; --��1��5λ��ʾ�۽�ĵ�λ��������6,16��¼��Ծ�ȣ���3�ֽڼ�¼�μӵĴ���,25,26��ʾ��Ӫ,27������Ѫ��ǣ�28�Ƿ��ǵ����һ���콱,��29-31λ��¼ս����ʤ����1δ������2ʤ����3ʧ�ܣ�4ƽ�֣�

KF_TMULTIPLE = {
		[1] = {1, 1, {0, 0}, "Nh�n th��ng tr�c ti�p"},
		[2] = {1.5, 2, {1, 1}, "Qu�n c�ng ch��ng nh�n th��ng"},
		[3] = {2, 5, {2, 1}, "Qu�n c�ng ��i nh�n th��ng"},
		[4] = {2.5, 10, {3, 1}, "Qu�n c�ng huy ho�ng nh�n th��ng"},
		[5] = {3, 14, {3, 2}, "Vinh D� Qu�n C�ng Ch��ng nh�n th��ng"},
}

---MISSION----------------------------
KF_MAP_ID = 6027;
KF_MISSION_ID = 62;
KF_TIMER_ID = 92;

CampOne_Name = "Qu�n T�ng";
CampTwo_Name = "Qu�n Li�u";

ALL_ID = 0;
CampOne_ID = 1;	--����������mission����Ӫ
CampTwo_ID = 2;	--������ͽ��mission����Ӫ

tCampName = {"Qu�n T�ng","Qu�n Li�u"};

CampOne_Type = "camp_player"; --����������Ӫ���ͣ�����npc
CampTwo_Type = "camp_enemy";  --������ͽ��Ӫ���ͣ�����npc
Neutral_Type = "camp_evil";		--����npc��Ӫ����

tCampType = {
	[ALL_ID] = "camp_evil",
	[CampOne_ID] = "camp_player",
	[CampTwo_ID] = "camp_enemy",
};

--Ƶ��
KF_BATTLE_CHANNEL = {
	[ALL_ID] = {"K�nh chi�n tr��ng", 39},
	[CampOne_ID] = {"K�nh T�ng", 40},
	[CampTwo_ID] = {"K�nh Li�u", 41},
}

PLAYER_MAX_NUM = 120; --һ�������������
PLAYER_ALLOW_NUM = 10; --����������Ҫ������

MISSION_COUTN_MAX = 1; --һ��ʱ����࿪���ĳ���

MISSION_OPEN_FAIL_FLAG = 1234; --ս��δ������־

JOIN_MISSION_POS = {
	[CampOne_ID] = {1582, 3792},
	[CampTwo_ID] = {1905, 3288},
}

KF_ITEM_LINGPAI = {
	[CampOne_ID] = {2, 1, 30478, "T�ng Qu�n Truy�n L�nh K�"},
	[CampTwo_ID] = {2, 1, 30479, "Li�u Qu�n Truy�n L�nh K�"},	
}

PLAYER_DEATH_SCRIPT = "\\script\\missions\\kuafu_battle\\kf_player_death.lua";

KF_ZHENQI_INC = 10; --����ÿ15��

--==============������ս����״̬===================
MS_STATE_PEACE = 0;				--�ȴ������׶�
MS_STATE_READY = 1;				--׼��״̬��������ȴ���ս�׶�
MS_STATE_FIGHT = 2;				--��ս״̬
MS_STATE_COMPLETE = 3;		--ս������״̬

--==============����missionV����===================
MV_BATTLE_LOAD = 1;   --�Ƿ��Ѿ����ؿ���
MV_BATTLE_STATE = 2;  --��¼ս����״̬
MV_BATTLE_MAP_ID = 3;        --����ս����MAPID
MV_BATTLE_MAP_INDEX = 4;    --����ս����MAP����
MV_BATTLE_TIMER_LOOP = 5;		--����timer����
MV_BATTLE_GAME_FRAMETIME = 6; --��ǰ��Ϸ֡��
MV_BATTLE_SONG_SCORE = 7; --�ξ�������
MV_BATTLE_LIAO_SCORE = 8; --�ɾ�������
MV_BATTLE_WINNER = 9; --��ʤ��(0,1,2)
MV_BATTLE_FLAG_JM = 10; --����0������1�Σ�2��
MV_BATTLE_FLAG_MM = 11; --����0������1�Σ�2��
MV_BATTLE_FLAG_SM = 12;	--����0������1�Σ�2��
MV_BATTLE_FLAG_SI = 13;	--����0������1�Σ�2��
MV_BATTLE_FLAG_DA = 14;	--����0������1�Σ�2��
MV_BATTLE_SONG_ACTIVITY = 15; --���ۼƻ�Ծ��
MV_BATTLE_LIAO_ACTIVITY = 16; --���ۼƻ�Ծ��
MV_BATTLE_DUWEI_TAG_SONG = 17; --0Ϊδ��ǲ��1����ǲ��2������
MV_BATTLE_DUWEI_DEATHTIME_SONG = 18; --��ξ����ʱ��
MV_BATTLE_XIANFENG_TAG_SONG = 19; --0Ϊδ��ǲ��1����ǲ��2������
MV_BATTLE_XIANFENG_DEATHTIME_SONG = 20; --�ȷ�����ʱ��
MV_BATTLE_DUWEI_TAG_LIAO = 21; --0Ϊδ��ǲ��1����ǲ��2������
MV_BATTLE_DUWEI_DEATHTIME_LIAO = 22; --��ξ����ʱ��
MV_BATTLE_XIANFENG_TAG_LIAO = 23; --0Ϊδ��ǲ��1����ǲ��2������
MV_BATTLE_XIANFENG_DEATHTIME_LIAO = 24; --�ȷ�����ʱ��
MV_BATTLE_JIANGJUN_TAG = 25; --�Ƿ�ˢ��������
MV_BATTLE_IS_OPEN_SUCC = 26; --�Ƿ����ɹ���־
MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG = 27; --����ʱ�ӻ���
MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO = 28; --����ʱ�ӻ���

KF_SCORE_MAX = 30; --��������ֵ
KF_JIANGJUN_SCORE = 31; --ʲôʱ�򽫾�����
KF_SCORE_JIANGJUN = 32; --��������ֵ
--===============missionʱ�����===================
FRAME_PER_SECOND = 18;
FRAME_PER_MIN = 60*FRAME_PER_SECOND;

PEACE_TIME = 5*FRAME_PER_SECOND;--�ȴ��������������ʱ���ı�ʱ�����5��
PEACE_TIMER_LOOP = (5*FRAME_PER_MIN/PEACE_TIME)-1;--�ȴ��������������ʱ����ʱ������5���ӣ�
READY_TIME = 5*FRAME_PER_SECOND;--��ս׼��ʱ���ʱ���ı�ʱ�����5��
READY_TIMER_LOOP = (1*FRAME_PER_MIN/(6*READY_TIME))-1;--��ս׼��ʱ���ʱ����ʱ������10s��
FIGHT_TIME = 3*FRAME_PER_SECOND;			--����ʱ���ʱ���ı�ʱ�����3��
FIGHT_TIMER_LOOP = (90*FRAME_PER_MIN/FIGHT_TIME)-1;	--����ʱ���ʱ���ı�ʱ������90���ӣ�
WAITOUT_TIME = 15*FRAME_PER_SECOND;		--�ȴ�����ʱ���ʱ���ı�ʱ���
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --�ȴ�����ʱ���ʱ���ı�ʱ����������ӣ�


--==============Npc��===================
KF_TALK_NPC = {
	{"KFZC_songqianxian", "Ti�n tuy�n qu�n T�ng", 1623, 3734, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_songqianxian", "Ti�n tuy�n qu�n T�ng", 1630, 3813, "\\script\\missions\\kuafu_battle\\npc\\ms_song_qxsb.lua"},
	{"KFZC_liaoqianxian", "Ti�n tuy�n qu�n Li�u", 1864, 3331, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_liaoqianxian", "Ti�n tuy�n qu�n Li�u", 1853, 3261, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_qxsb.lua"},
	{"KFZC_songyuansuan", "T�ng Nguy�n So�i", 1572, 3800, "\\script\\missions\\kuafu_battle\\npc\\ms_song_ys.lua"},
	{"KFZC_shenyou", "Th�n Du Ch�n Nh�n", 1540, 3772, "\\script\\missions\\kuafu_battle\\npc\\ms_song_syzr.lua"},
	{"KFZC_songjunxu", "T�ng Qu�n Nhu Quan", 1592, 3827, "\\script\\missions\\kuafu_battle\\npc\\ms_song_jxg.lua"},
	{"KFZC_songshangren", "T�ng Th��ng Nh�n", 1532, 3756, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sr.lua"},
	{"KFZC_songshangbing", "T�ng Th��ng Binh", 1644, 3765, "\\script\\missions\\kuafu_battle\\npc\\ms_song_sb.lua"},
	{"KFZC_liaoyuansuan", "Li�u Nguy�n So�i", 1912, 3282, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_ys.lua"},
	{"KFZC_jinglun", "Kim Lu�n Ph�p V��ng", 1885, 3250, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jlfw.lua"},
	{"KFZC_liaojunxu", "Li�u Qu�n Nhu Quan", 1961, 3314, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_jxg.lua"},
	{"KFZC_liaoshangren", "Li�u Th��ng Nh�n", 1953, 3306, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sr.lua"},
	{"KFZC_liaoshangbing", "Li�u Th��ng Binh", 1837, 3295, "\\script\\missions\\kuafu_battle\\npc\\ms_liao_sb.lua"},
	
	
}

--�˸����λ��
tPositionFo = {
	{"Nga Mi ti�u s� t� 1", "Nga Mi ti�u s� t� ", 1582, 3711, CampOne_Type},
	{"Nga Mi ti�u s� t� 2", "Nga Mi ti�u s� t� ", 1592, 3711, CampOne_Type},
	{"Nga Mi ti�u s� t� 3", "Nga Mi ti�u s� t� ", 1588, 3725, CampOne_Type},
	{"Nga Mi ti�u s� t� 4", "Nga Mi ti�u s� t� ", 1573, 3718, CampOne_Type},
	
	{"Nga Mi ti�u s� t� 1", "Nga Mi ti�u s� t� ", 1901, 3356, CampTwo_Type},
	{"Nga Mi ti�u s� t� 2", "Nga Mi ti�u s� t� ", 1910, 3350, CampTwo_Type},
	{"Nga Mi ti�u s� t� 3", "Nga Mi ti�u s� t� ", 1919, 3360, CampTwo_Type},
	{"Nga Mi ti�u s� t� 4", "Nga Mi ti�u s� t� ", 1907, 3371, CampTwo_Type},
}

KF_MONSTER_NPC = {
	{"KFZC_yeguai1", "Th� Qu�i", 1682, 3316},
	{"KFZC_yeguai2", "Th�ch Nh�n", 1733, 3215},
	{"KFZC_yeguai3", "Tr�ng Qu�i", 1890, 3446},
	{"KFZC_yeguai4", "Th��ng t��ng", 1825, 3715},
	{"KFZC_yeguai5", "Ki�m t��ng", 1760, 3731},
	{"KFZC_yeguai6", "�m H�n", 1553, 3606},
	{"KFZC_yeguai7", "Cung t��ng", 1663, 3543},
	{"KFZC_yeguai8", "O�n Qu�", 1810, 3555},
	{"KFZC_boss1", "C� D��ng Th�", 1525, 3482},
	{"KFZC_boss2", "Tr�n M� Th�", 1902, 3547},
}

KF_FLAG_NPC = {
	{"KFZC_jingmen", "C�nh M�n Tr�n K�", 1606, 3309, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua"},
	{"KFZC_miemen", "Di�t M�n Tr�n K�", 1827, 3370, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua"},
	{"KFZC_shengmen", "Sinh M�n Tr�n K�", 1888, 3754, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua"},
	{"KFZC_simen", "T� M�n Tr�n K�", 1656, 3676, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua"},
	{"KFZC_dazhenqi", "��i Tr�n K�", 1736, 3537, "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua"},
}

KF_FLAG_NPCLIST = {
		[1] = {
			[ALL_ID] = {"KFZC_jingmen", "C�nh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", MV_BATTLE_FLAG_JM},
			[CampOne_ID] = {"KFZC_songjingmen", "T�ng C�nh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", MV_BATTLE_FLAG_JM},
			[CampTwo_ID] = {"KFZC_liaojingmen", "Li�u C�nh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_jinmen.lua", MV_BATTLE_FLAG_JM},
		},
		[2] = {
			[ALL_ID] = {"KFZC_miemen", "Di�t M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", MV_BATTLE_FLAG_MM},
			[CampOne_ID] = {"KFZC_songmiemen", "T�ng Di�t M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", MV_BATTLE_FLAG_MM},
			[CampTwo_ID] = {"KFZC_liaomiemen", "Li�u Di�t M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_miemen.lua", MV_BATTLE_FLAG_MM},
		},
		[3] = {
			[ALL_ID] = {"KFZC_shengmen", "Sinh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", MV_BATTLE_FLAG_SM},
			[CampOne_ID] = {"KFZC_songshengmen", "T�ng Sinh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", MV_BATTLE_FLAG_SM},
			[CampTwo_ID] = {"KFZC_liaoshengmen", "Li�u Sinh M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_shengmen.lua", MV_BATTLE_FLAG_SM},
		},
		[4] = {
			[ALL_ID] = {"KFZC_simen", "T� M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", MV_BATTLE_FLAG_SI},
			[CampOne_ID] = {"KFZC_songsimen", "T�ng T� M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", MV_BATTLE_FLAG_SI},
			[CampTwo_ID] = {"KFZC_liaosimen", "Li�u T� M�n Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_simen.lua", MV_BATTLE_FLAG_SI},
		},
		[5] = {
			[ALL_ID] = {"KFZC_dazhenqi", "��i Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", MV_BATTLE_FLAG_DA},
			[CampOne_ID] = {"KFZC_songdazhenqi", "T�ng ��i Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", MV_BATTLE_FLAG_DA},
			[CampTwo_ID] = {"KFZC_liaodazhenqi", "Li�u ��i Tr�n K�", "\\script\\missions\\kuafu_battle\\npc\\zhenqi_da.lua", MV_BATTLE_FLAG_DA},
		},
	}

KF_SHIBINF_NPC = {
	[1] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng C�nh M�n S� Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng C�nh M�n S� Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng C�nh M�n S� Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng C�nh M�n S� Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u C�nh M�n S� Binh",1602, 3313, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u C�nh M�n S� Binh",1610, 3302, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u C�nh M�n S� Binh",1601, 3305, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u C�nh M�n S� Binh",1604, 3301, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[2] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng Di�t M�n S� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Di�t M�n S� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Di�t M�n S� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Di�t M�n S� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u Di�t M�n S� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Di�t M�n S� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Di�t M�n S� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Di�t M�n S� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[3] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng Sinh M�n S� Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Sinh M�n S� Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Sinh M�n S� Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng Sinh M�n S� Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u Sinh M�n S� Binh",1883, 3757, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Sinh M�n S� Binh",1887, 3761, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Sinh M�n S� Binh",1892, 3754, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u Sinh M�n S� Binh",1890, 3747, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[4] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng T� M�n S� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T� M�n S� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T� M�n S� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T� M�n S� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u T� M�n S� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T� M�n S� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T� M�n S� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T� M�n S� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[5] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng ��i Tr�n K� S� Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng ��i Tr�n K� S� Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng ��i Tr�n K� S� Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng ��i Tr�n K� S� Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u ��i Tr�n K� S� Binh",1731, 3531, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u ��i Tr�n K� S� Binh",1739, 3530, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u ��i Tr�n K� S� Binh",1738, 3543, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u ��i Tr�n K� S� Binh",1732, 3542, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
	[6] = {
		[CampOne_ID] = {
			{"KFZC_songshibing","T�ng T��ng Qu�n V� Binh",1659, 3680, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T��ng Qu�n V� Binh",1654, 3682, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T��ng Qu�n V� Binh",1650, 3679, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
			{"KFZC_songshibing","T�ng T��ng Qu�n V� Binh",1650, 3670, "\\script\\missions\\kuafu_battle\\npc\\death_song_shibing.lua"},
		},
		[CampTwo_ID] = {
			{"KFZC_liaoshibing","Li�u T��ng Qu�n V� Binh",1823, 3364, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T��ng Qu�n V� Binh",1828, 3362, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T��ng Qu�n V� Binh",1831, 3368, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
			{"KFZC_liaoshibing","Li�u T��ng Qu�n V� Binh",1830, 3375, "\\script\\missions\\kuafu_battle\\npc\\death_liao_shibing.lua"},
		},
	},
}

--����ֵ
KF_SCORE_PLAYER = 1;
KF_SCORE_SHIBING = 1;
KF_SCORE_DUWEI = 20;
KF_SCORE_XIANFENG = 40;
KF_SCORE_ZHENQI = 10;
KF_SCORE_XIAOYG = 2;
KF_SCORE_DAYG = 4;

--��Ծ��
KF_ACTIVITY_PLAYER = 3;
KF_ACTIVITY_SHIBING = 2;
KF_ACTIVITY_DUWEI = 10;
KF_ACTIVITY_XIANFENG = 20;
KF_ACTIVITY_JIANGJUN = 40;
KF_ACTIVITY_XIAOYG = 2;
KF_ACTIVITY_DAYG = 6;
KF_ACTIVITY_ZHENQI = 10;
KF_ACTIVITY_PLAYERDEATH = 1;

--��������ͷ��
KF_TITIL_JIANGJUN = 5;

--��ǲ�ȷ��CDʱ��
KF_ORDER_XF_CD = 20 * 60; --10min
KF_ORDER_DW_CD = 10 * 60; --20min

KF_ORDER_POS = {
	[1] = {1609, 3312, "C�nh M�n Tr�n K�"},
	[2] = {1823, 3373, "Di�t M�n Tr�n K�"},
	[3] = {1885, 3749, "Sinh M�n Tr�n K�"},
	[4] = {1660, 3671, "T� M�n Tr�n K�"},
	[5] = {1735, 3543, "��i Tr�n K�"},
}


--ѩ��BUFF
KF_XUEHEN = {--����� ���������ֵ �������������ֵ ���߸������
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

KF_TSTATEMAGICATTR = {
		[1] = {
			{"state_p_attack_percent_add", 20, 5 * 60 * 18, 20101, 2, "Ngo�i c�ng c�ng k�ch t�ng%d%%", "BUFF1"},
			{"state_m_attack_percent_add", 20, 5 * 60 * 18, 20102, 2, "N�i c�ng c�ng k�ch t�ng%d%%", "BUFF1"},
		},
		[2] = {
			{"state_life_max_percent_add", 50, 5 * 60 * 18, 20103, 3, "Sinh l�c t�ng %d%%", "BUFF2"},
		},
		[3] = {
			{"state_physical_parmor_poi_add", 10, 5 * 60 * 18, 20104, 4, "Ngo�i ph�ng t�ng %d%%", "BUFF3"},
			{"state_magic_parmor_poi_add", 10, 5 * 60 * 18, 20105, 4, "N�i  ph�ng t�ng %d%%", "BUFF3"},
		},
		[4] = {
			{"state_buff_resist", 5, 5 * 60 * 18, 20106, 5, "Mi�n d�ch tr�ng th�i ph� %d l�n", "BUFF4"},
		},
		[5] = {
			{"state_p_attack_percent_add", 40, 3 * 60 * 18, 20101, 6, "Ngo�i c�ng c�ng k�ch t�ng%d%%", "BUFF5"},
			{"state_m_attack_percent_add", 40, 3 * 60 * 18, 20102, 6, "N�i c�ng c�ng k�ch t�ng%d%%", "BUFF5"},
			{"state_life_max_percent_add", 100, 3 * 60 * 18, 20103, 6, "Sinh l�c t�ng %d%%", "BUFF5"},
			{"state_physical_parmor_poi_add", 20, 3 * 60 * 18, 20104, 6, "Ngo�i ph�ng t�ng %d%%", "BUFF5"},
			{"state_magic_parmor_poi_add", 20, 3 * 60 * 18, 20105, 6, "N�i  ph�ng t�ng %d%%", "BUFF5"},
			{"state_buff_resist", 5, 3 * 60 * 18, 20106, 6, "Mi�n d�ch tr�ng th�i ph� %d l�n", "BUFF5"},
		},
}

---����-----------------------------------------
KF_ACTIVITY_LEVEL = {0, 1, 10, 40, 200};

KF_BATTLE_AWARD = {
		--δ����
		[1] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {300000, 0}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {300000, 0}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {300000, 0}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {300000, 0}, 1600, {1, 1}},
		},
		--ʤ��
		[2] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {16000000, 10000}, 300, {2, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {16000000, 10000}, 800, {2, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {16000000, 10000}, 1200, {2, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {36000000, 0}, 1600, {2, 1}},
		},
		--ʧ��
		[3] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
		--ƽ��
		[4] = {
			[1] = {KF_ACTIVITY_LEVEL[1], {300000, 0}, 200, {1, 1}},
			[2] = {KF_ACTIVITY_LEVEL[2], {8000000, 10000}, 300, {1, 1}},
			[3] = {KF_ACTIVITY_LEVEL[3], {8000000, 10000}, 800, {1, 1}},
			[4] = {KF_ACTIVITY_LEVEL[4], {8000000, 10000}, 1200, {1, 1}},
			[5] = {KF_ACTIVITY_LEVEL[5], {20000000, 0}, 1600, {1, 1}},
		},
}

KF_PARK_AWARD_PT = {
	{3, 100, 30000, 1},
	{3, 40, 60000, 1},
	{3, 10, 100000, 1},
	{27, 150, 300, 1},
	{27, 100, 600, 1},
	{27, 100, 1000, 1},
	{34, 75, 60, 1},
	{35, 25, 60, 1},
	{1, 150, "V� Ti�u Y ��ng", {2, 1, 30493, 1}, 0},
	{1, 100, "V� Ti�u Y ��ng", {2, 1, 30493, 2}, 0},
	{1, 50, "V� Ti�u Y ��ng", {2, 1, 30493, 4}, 0},
	{1, 100, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
}

KF_PARK_AWARD_PT_ADD = {
	{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1}, 0},
	{28, 300, 1},--����
}

KF_PARK_AWARD_GJ = {
	{3, 50, 100000, 1},
	{3, 20, 150000, 1},
	{3, 10, 300000, 1},	
	{27, 100, 600, 1},
	{27, 100, 1200, 1},
	{27, 100, 1500, 1},
	{34, 40, 60, 1},
	{35, 10, 60, 1},
	{1, 200, "V� Ti�u Y ��ng", {2, 1, 30493, 2}, 0},
	{1, 100, "V� Ti�u Y ��ng", {2, 1, 30493, 4}, 0},
	{1, 50, "V� Ti�u Y B�c", {2, 1, 30492, 1}, 0},
	
	{1, 120, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
	{1, 100, "Thi�t Tinh c�p 2", {2, 1, 30534, 4}, 0},
}

KF_PARK_AWARD_GJ_ADD = {
	{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 2}, 0},
	{28, 400, 1},--����
}

KF_PARK_AWARD_JY = {
	{3, 100, 150000, 1},
	{3, 100, 300000, 1},
	{3, 10, 600000, 1},	
	{27, 100, 1500, 1},
	{27, 100, 2000, 1},
	{27, 100, 2500, 1},
	{35, 75, 60, 1},
	{36, 25, 60, 1},
	{1, 100, "V� Ti�u Y B�c", {2, 1, 30493, 1}, 0},
	{1, 100, "V� Ti�u Y B�c", {2, 1, 30493, 2}, 0},
	{1, 50, "V� Ti�u Y B�c", {2, 1, 30492, 4}, 0},
	
	{1, 50, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
	{1, 50, "Thi�t Tinh c�p 2", {2, 1, 30534, 4}, 0},
	{1, 40, "Thi�t Tinh c�p 3", {2, 1, 30535, 4}, 0},
}

KF_PARK_AWARD_JY_ADD = {
	{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 6}, 0},
	{28, 500, 1},--����
}

KF_NB_WEAPON_TABLE = {
	--����={����}
	[2] = {0,	3,	30052, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma �ao"},
	[4] = {0,	0,	30053, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Tr��ng"},
	[3] = {0,	8,	30054, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Th�"},
	[6] = {0,	1,	30055, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Ch�m"},
	[8] = {0,	2,	30056, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Ki�m"},
	[9] = {0,	10,	30057, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma C�m"},
	[11] = {0,	0,	30058, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Th�"},
	[12] = {0,	5,	30059, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma C�n"},
	[14] = {0,	2,	30060, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Ki�m"},
	[15] = {0,	9,	30061, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma B�t"},
	[17] = {0,	6,	30062, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Th��ng"},
	[18] = {0,	4,	30063, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Cung"},
	[20] = {0,	7,	30064, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Nh�n"},
	[21] = {0,	11,	30065, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Tr�o"},
	[23] = {0,	2,	30066, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Ki�m"},
	[25] = {0,	3,	30067, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma �ao"},
	[26] = {0,	9,	30068, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma B�t"},
	[27] = {0,	11,	30069, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Tr�o"},
	[29] = {0,	13,	30070, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Phi�n"},
	[30] = {0,	12,	30071, 1, 1, -1, -1, -1, -1, -1, -1, 0, 15, "Ch�n Ma Ti�u"},
}

KF_WEAPON_EXIST_TIME = 10 * 60;

--��ʱ���͵�
KF_TEMP_SAFE_POS = {
	[CampOne_ID] = {
		{1671, 3334},
		{1564, 3651},
		{1736, 3626},
	},
	[CampTwo_ID] = {
		{1881, 3676},
		{1895, 3436},
		{1740, 3440},
	},	
}

--������ʱ��ȫ��������
KF_TEMP_SAFE_POS_CONDITION = 100;