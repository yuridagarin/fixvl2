--create date:07-04-10
--author:yanjun
--describe:����ս�ű�ͷ�ļ���������صĽű�����
Include("\\script\\gongcheng\\position.lua");
DEBUG_VERSION = 1;	--���԰汾��
FREE_VERSION = 0;	--��Ѱ汾��
LIMIT_IGNORE = 0;	--����һЩ����

TRUE = 1;
FALSE = 0;
NONE_ID = -1;		--������
ALL_ID = 0;			--������
GONG_ID = 1;		--���Ƿ�ID
SHOU_ID = 2;		--�سǷ�ID
GONG_RFM_ID = 3;	--���Ƿ���ԮID
SHOU_RFM_ID = 4;	--�سǷ���ԮID
GONGSHOU_ID = GONG_ID+SHOU_ID;	--��������ж���ӪID��
--=======������table����================================================================
tCampNameP = 					--��Ӫ���֣�ƴ������������Ӫ��ʱ���õ�
{
	[GONG_ID] = "gongcheng",
	[SHOU_ID] = "shoucheng",
}
tCampNameZ =					--��Ӫ���֣����ģ�����ʾ�Ի���ʱ���õ�
{
	[GONG_ID] = "phe C�ng",
	[SHOU_ID] = "Phe Th� th�nh",
}
tCityInfo = 			--���ǵ�ͼ������
{
	[1] = {"Tuy�n Ch�u",100,886},
	[2] = {"Th�nh ��",300,887},
	[3] = {"T��ng D��ng",350,888},
}
tItemInfo = 			--����ս��Ʒ�����Ϣ
{
	[1] = {"C�ng th�nh Ti�n phong l�nh",2,1,1203},
	[2] = {"Th� V� l�nh",2,1,1202},
	[3] = {"D�ng S� l�nh",2,1,1201},
	[4] = {"Chi�n b�o ti�n tuy�n",2,1,1206},
	[5] = {"P_th��ng C�ng Th�nh (th�ng)",2,1,1208},
	[6] = {"P_th��ng  C�ng Th�nh(b�i)",2,1,1209},
}
tCityChannel = 			--����ս����Ƶ��
{
	[1] = {"Tuy�n Ch�u th�nh ",27},
	[2] = {"Th�nh �� th�nh ",28},
	[3] = {"T��ng D��ng th�nh ",29},
}
tCampChannel = 			--����ս��ӪƵ��
{
	[1] = {"Phe c�ng Tuy�n Ch�u",30},
	[2] = {"Phe th� Tuy�n Ch�u th�nh",31},
	[3] = {"Phe c�ng Th�nh �� th�nh",32},
	[4] = {"Phe th� Th�nh �� th�nh",33},
	[5] = {"Phe c�ng T��ng D��ng th�nh",34},
	[6] = {"Phe th� T��ng D��ng th�nh",35},
}
tDoorName = {"��ng th�nh m�n","Th�nh m�n trung khu","T�y th�nh m�n"};
--��Ч���ֽṹ
tWavFileName = 
{
	[1] = {"��ô���.wav","ʧȥ����.wav"},
	[2] = {"���С��.wav","ʧȥС��.wav"},
	[3] = {"��û���.wav","ʧȥ����.wav"},
}
MUSIC_DEFAULT = 0;
MUSIC_JIANG = 1;
MUSIC_WEIJI = 2;
MUSIC_YOUSHI = 3;
--��������
tMusicFileName = 
{
	[MUSIC_DEFAULT] = "����ս_����.mp3",
	[MUSIC_JIANG] = "����ս_����.mp3",
	[MUSIC_WEIJI] = "����ս_����.mp3",	--������ˣ�ֻ�������ļ���д����
	[MUSIC_YOUSHI] = "����ս_Σ��.mp3",
}
--����ϵͳ�ű�ȫ�ֱ����趨==============================================================
RELAY_DATA_BATTLE = "gongcheng_result";	--�������ݿ���ַ�����ʶ
RELAY_CALLBACK_SCRIPT = "";	--Relay�������ݿ�ص��ű�·��

FLAG_COUNT_WIN = 8;			--����ռ��8�����Ӿ�Ӯ��
FLAG_COUNT_END_WIN = 6;		--�ڹ���ս������ʱ�򹥷�ռ��6�����Ӿ�Ӯ��
LEAST_STAY_DAY = 7;			--Ҫ����ڰ�����������
MAX_REGULAR_ARMY = 150;		--������������
MAX_REINFORCEMENT = 150;	--�����Ԯ��
MAX_TOTAL_PLAYER = 150;		--�������
INVINCIBILITY_TIME = 5;		--����Ӫ�޵�ʱ��
--======================================================================================

--������ȫ�ֱ���========================================================================
--700~710
GLB_GONGCHENG_FORBIDEN = 700	--�Ƿ�����������ս��1Ϊ��ֹ��0Ϊ����
--�̶��������==========================================================================
--450~499
TASK_LIZHI = 450;		--����־��ȥ��
TASK_AWARD_WIN = 451;	--��¼��ǰ��һ�û��ȡ�Ĺ���ս��л���������
TASK_AWARD_LOST = 452;	--��¼��ǰ��һ�û��ȡ�Ĺ���ս��лС�������
--�ڼ����µ�ս��ʱ�ᱻ������������====================================================
TNC_BEGIN = 490;
TNC_MUID = 490;			--��¼��Ҽ����ս������Ӧ��MUID
TNC_KILL = 491;			--��¼��ҵ���PK����
TNC_CAMP = 492;			--��¼�μӵ���Ӫ������Ӫ��Mission��Ӫ��ָ���ǹ�����Ӫ
TNC_END = 499;
--��ʱ�������80~100====================================================================
TEMP_BEGIN = 80;
TEMP_CAMP = 81;				--��¼����ǹ��Ƿ������سǷ�
TEMP_GURAD_ID = 82;			--��¼����Ƿ�Ϊ����������ֵ����Ϊ1,2,3,�ֱ��Ӧ������������������
TEMP_ARENA_FIGHTING = 83;	--�Ƿ����ڵ�����1��2��ʾ�ǣ�1��ʾ������2��ʾ�ط�����0��ʾ�����ڵ���������£�TEMP_GURAD_ID��Ӧ�ı�����ֵ����Ϊ0
TEMP_FIGHT_STATE = 84;		--��¼����״̬����Ӧ�ڵ���״̬��
TEMP_CITY_INDEX = 85;		--��¼���μ�ս�۶�Ӧ�ĳ�������
TEMP_AUDIENCE = 86;			--��ʶ����ǲ��ǵ������ڣ�ֵ����Ϊ1,2,3,�ֱ��Ӧ������������������
TEMP_CHALLENGER = 87;		--��ʶ����ڵ�����ʱ���ǲ�����ս��
TEMP_REINFORCEMENT = 88;	--��ʶ����ǲ�����Ԯ��ֵΪ1��ʾ������Ԯ��2��ʾ�ط���Ԯ
TEMP_LOCK = 89;				--��ұ�������ʶ��Ϊ1ʱ��ʾ��������ڻ�Ӧ��������
TEMP_FIGHT_TIMER_LOOP = 90;	--��¼��ǰ������ʱ����ѭ������
TEMP_END = 90;
--======================================================================================

--======================================================================================
--��������Mission������صĳ�������
--======================================================================================
MISSION_ID = 35;									--Mission��ID
TIMER_ID = 63;										--��ʱ����ID
LOG_ID = 207;										--��½������ID
LOG_CUSTOM_ID = 3015;								--��½�������Զ�����
FIGHT_TIMER_ID = 4;									--����ʱ�䴥����ID
FIGHT_TRIGGER_ID = 3014;							--����ʱ�䴥�����Զ�����
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬ֻ�����0������==================================================
READY_TIME = 30;									--׼��ʱ�䣬30����
GONGMEN_TIME = 40;									--����ʱ�䣬40����
GONGCHENG_TIME = 60;								--����ʱ�䣬60����
ENDING_TIME = 5;									--�ȴ�����ʱ�䣬5����
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 5;							--��ʱ��������ʱ��������λ����
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
GONGMEN_TIMER_INTERVAL = 5;					
GONGMEN_TIMER_COUNT = (GONGMEN_TIME/GONGMEN_TIMER_INTERVAL)-1;	
GONGCHENG_TIMER_INTERVAL = 5;					
GONGCHENG_TIMER_COUNT = (GONGCHENG_TIME/GONGCHENG_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS����=============================================================================
MS_GONG_TONG_NAME = 1;								--��¼���Ƿ���������			
MS_SHOU_TONG_NAME = 2;								--��¼�سǷ���������
MS_CITY_NAME = 3;									--��������		
--MissionV����=============================================================================
MV_MISSION_STATE		= 1;						--��¼Mission״̬
MV_TIMER_LOOP 			= 2;						--��¼��ʱ���ļ���
MV_MISSION_UID 			= 3;						--��¼Mission��ΨһID
MV_CUR_MUSIC_GONG		= 4;						--������ǰ������������
MV_CUR_MUSIC_SHOU		= 5;						--�ط���ǰ������������
MV_WAR_RESULT			= 6;						--��¼ս�������ս����0��ʾս��δ��ʼ��δ������1��ʾ����Ӯ��2��ʾ�ط�Ӯ
MV_DEATH_GONG			= 7;						--������������
MV_DEATH_SHOU			= 8;						--�ط���������

MV_FLAG_OWN_COUNT 		= 11;						--��¼����ռ���˶���������
MV_DESTROY_EAST_DOOR	= 12;						--��¼���Ż���1�Ƿ񱻴ݻ٣��൱�ڳ����Ƿ����ô�
MV_DESTROY_SOUTH_DOOR	= 13;						--��¼���Ż���2�Ƿ񱻴ݻ�
MV_DESTROY_WEST_DOOR	= 14;						--��¼���Ż���3�Ƿ񱻴ݻ�
MV_DESTROY_FLAG1		= 15;						--��¼����1�Ƿ񱻴ݻ�
MV_DESTROY_FLAG2		= 16;						--��¼����2�Ƿ񱻴ݻ�
MV_DESTROY_FLAG3		= 17;						--��¼����3�Ƿ񱻴ݻ�
MV_TRAP_EAST_DOOR		= 18;						--����TRAP�㣬1��ʾ�������ã�2��ʾ�ط����ã�0��ʾ����˫�������ã�-1��ʾ����˫����������
MV_TRAP_SOUTH_DOOR		= 19;						--����TRAP��
MV_TRAP_WEST_DOOR		= 20;						--����TRAP��
MV_GRAVEYARD_A1 		= 21;						--��¼10��Ĺ�ص�״̬
MV_GRAVEYARD_A2			= 22;						--1��ʾ��������
MV_GRAVEYARD_B1			= 23;						--2��ʾ�ط�����
MV_GRAVEYARD_B2			= 24;						--0��ʾ����˫��������
MV_GRAVEYARD_C1			= 25;						-- -1��ʾ����˫����������
MV_GRAVEYARD_C2			= 26;
MV_GRAVEYARD_11			= 27;
MV_GRAVEYARD_12			= 28;
MV_GRAVEYARD_21			= 29;
MV_GRAVEYARD_22 		= 30;
MV_EAST_DOOR_DRAW		= 31;						--��¼��������������������ƽ�ֵĴ���
MV_SOUTH_DOOR_DRAW		= 32;						--��¼��������������������ƽ�ֵĴ���
MV_WEST_DOOR_DRAW		= 33;						--��¼��������������������ƽ�ֵĴ���
MV_GPIDX_EAST_DOOR		= 34;						--��������������������������������Լ��������MissionV�ı����ţ���ʽMV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1
MV_SPIDX_EAST_DOOR		= 35;						--�ط���������������
MV_GPIDX_SOUTH_DOOR		= 36;						--������������������
MV_SPIDX_SOUTH_DOOR		= 37;						--�ط���������������
MV_GPIDX_WEST_DOOR		= 38;						--������������������
MV_SPIDX_WEST_DOOR		= 39;						--�ط���������������
MV_GET_GONG_TOKEN 		= 40;						--�����Ƿ���ȡ��������			
MV_GET_SHOU_TOKEN		= 41;						--�ط��Ƿ���ȡ���س���
MV_EAST_JIGUAN_INDEX	= 42;						--���Ż���NPC����
MV_SOUTH_JIGUAN_INDEX	= 43;						--���Ż���NPC����
MV_WEST_JIGUAN_INDEX	= 44;						--���Ż���NPC����
MV_REVIVI_FLAG1_OWNER	= 45;						--������¼7�����������ӱ�ռ������
MV_REVIVI_FLAG2_OWNER	= 46;						--1��ʾ����ռ�죬2��ʾ�ط�ռ��
MV_REVIVI_FLAG3_OWNER	= 47;
MV_REVIVI_FLAG4_OWNER	= 48;
MV_REVIVI_FLAG5_OWNER	= 49;
MV_REVIVI_FLAG6_OWNER	= 50;
MV_REVIVI_FLAG7_OWNER	= 51;
MV_NORMAL_FLAG1_OWNER	= 52;						--������¼3�������������ӱ�ռ������
MV_NORMAL_FLAG2_OWNER	= 53;
MV_NORMAL_FLAG3_OWNER	= 54;
--Mission״̬��============================================================================
MS_STATE_IDEL 		= 0;							--���ؿ���
MS_STATE_READY 		= 1;							--׼���׶�
MS_STATE_GONGMEN 	= 2;							--���Ž׶�
MS_STATE_GONGCHENG 	= 3;							--���ǽ׶�
MS_STATE_ENDING 	= 4;							--�ȴ������׶�
--����״̬��===============================================================================
ROOM_STATE_IDLE = 0;								--��������״̬������
ROOM_STATE_READY = 1;								--��������״̬��׼��
ROOM_STATE_FIGHT = 2;								--��������״̬��ս��
ROOM_STATE_END = 3;									--��������״̬���ȴ�����
--=========================================================================================