--========================================================================================--
--create by baiyun 2010.1.7                                                               --
--describe     :Խ�ϰ������������ ͷ�ļ�                                                 --
--related files: �뾡���Ѵ��ļ�������ʹ����������Ľű��У�����������������ڴ��ļ���     --
--========================================================================================--

--===============�������������=========================
TASKID_TMZ_PLAY_DATE = 366;  --��¼�μ����������ڣ���ʽ��20090715
TASKID_TMZ_PLAY_NUM = 367;	 --��¼��ҽ���������������
TASKID_TMZ_PLAY_RESULT = 368;   --��¼��ҽ�����ȡ�����Ĵ���
TASKID_TMZ_AWARD_MARK = 369; --��¼��ҵ����������
TASKID_TMZ_JOIN_TIME = 370;	 --��¼��ҡ����衱״̬ʱ�䣬����GetTime()���޸���������ǵ��޸�playerloginin.lua
TASKID_TMZ_GET_DAMAGE = 371; --��¼���һ�ζ�����˺��������ȡ����������
TASKID_TMZ_GET_CURE = 372;	 --��¼���һ�ζ������Ч���ƣ���ȡ����������
TASKID_TMZ_KILL_PLAYER = 373;	 	--��¼���һ�ζ����ɱ����������ȡ����������
TASKID_TMZ_KILL_NUMS = 374;			--��¼���һ�ζ�������ɱ��������ȡ����������
TASKID_TMZ_PLAYER_KILLED = 375;	--��¼���һ�ζ���ɱ��������ȡ����������
TASKID_TMZ_PLAY_CAMP = 376;   	--��¼���һ�ζ������Ӫ����ȡ����������
TASKID_TMZ_KILL_NPC = 377;			--��¼���һ�ζ���ɱ����npc��������ȡ����������
TASKID_TMZ_KILL_EYE = 378;			--��¼���һ�ζ������ƻ������۸�������ȡ����������
TASKID_TMZ_KILL_FLAG = 379;			--��¼���һ�ζ������ƻ��������������ȡ����������
TASKID_TMZ_PLAY_POINT = 380;    --��¼���һ�ζ����л�õĻ��֣���Ӫ���֣�����ȡ���������գ�����������ж��Ƿ���ȡ���ϴ�ս���Ľ����Լ��Ƿ�ȡ����ʤ��
TASKID_TMZ_DOUBLE_EXP = 381;    --��¼����Ƿ���˫�������ʱ����볡��
TASKID_TMZ_ENROLL_MAPID = 400	--��¼��ұ���������ĵ�ͼID
--������������ǳ���ʹ�ã�һ�㲻��
GLB_TASK_BAIJUXIANDAN = 2508;    --��Ű׾��ɵ������������λ�� ����
GLB_TASK_BAIJUWAN_LARGE = 2507;    --��Ŵ�׾�������������λ�� ����
GLB_TASK_BAIJUWAN_SMALL = 2501;    --���С�׾�������������λ�� ����
GLB_TASK_SHENGNONGDAN = 2502;    --�����ũ�����������λ�� ����
GLB_TASK_FACTION_GET_DATE = 2190;    --���ʦ����������� ��ÿ�λ���������ã�
GLB_TASK_FACTION_GET_COUNT = 2191;    --�������ʦ������Ĵ��� ��ÿ�λ���������ã�
GLB_200912_TEAM_TASK_NUM = 1030;    --ת��-��4λ ÿһλ��¼ÿ���Żἤ�������������� �Ӹ�λ����λ�ֱ��ʾ���ﻢӥ
GLB_200912_TEAM_TASK_DATE = 1031;    --ת��-��¼�ϴμ���ʱ��
GLB_TASK_ZIGUANGGE = 652;    --�Ϲ����
VET_201001_TASK_FACTION_DATE = 2190;    --���ʦ����������� ��ÿ�λ���������ã�
VET_201001_TASK_FACTION_COUNT = 2191;    --�������ʦ������Ĵ��� ��ÿ�λ���������ã�
VET_201001_TASK_USE_ZONGZI_COUNT = 2192;    --���ڻ�ڼ�ʹ�����ӵ�����
VET_201001_TASK_HAS_GET_LIMIT_AWARD = 2193;    --�Ƿ���ȡ�˾������޽���1Ϊ���ʸ���ȡ��2Ϊ�Ѿ���ȡ���
VET_201001_TASK_GIVE_ZONGZI_COUNT = 2194;    --�������ͼ�Ʒ���ӵ�����
VET_201001_TASK_GIVE_ZONGZI_DATE = 2195;    --���ͼ�Ʒ���ӵ�����
VET_201001_TASK_GET_HONGBAO_DATE = 2196;    --��ȡ���������
VET_201001_TASK_GET_HONGBAO_COUNT = 2197;    --������ȡ���������
VET_201001_TEMP_TASK_HONGBAO_INDEX = 152;    --��ź����������ʱ�������
VET_201003_01_TASK_USE_WUSESHI_COUNT = 2251;    --�Ѿ�ʹ������ɫʯ������
VET_201003_01_TASK_HAND_WUSESHI_DATE = 2157;    --�Ͻ���ɫʯ������
VET_201003_01_TASK_HAND_WUSESHI_COUNT = 2158;    --�����Ͻ���ɫʯ�Ĵ���
VET_201003_01_TASK_GET_BAOHE_DATE = 2159;    --�һ�Ů洱��е�����
VET_201003_01_TASK_GET_BAOHE_COUNT = 2160;    --����һ���Ů洱��е�����
VET_201003_01_TASK_USE_BAOHE_COUNT = 2156;    --����һ���Ů洱��е�����
VET_201004_01_TASK_TIMES_OPEN_VICBOX = 2579;    --��ʤ����еĴ���
VET_201004_01_TASK_MAX_TIMES_AWARD = 2580;    --�ﵽ���޾��齱���Ƿ���ȡ
VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR = 2581;    --ÿ��һ������ǵĴ���
VET_201004_01_TASK_DATE_LUCKYSTAR = 2582;    --�һ������ǵ�����
VET_201004_01_TASK_DATE_USE_LUCKYSTAR = 2585;    --ʹ�������ǵ�����
VET_201004_01_TASK_TIMES_USE_LUCKYSTAR = 2586;    --ÿ��ʹ�������ǵĴ���
VET_201004_01_TASK_DATE_DONATE_VICBOX = 2583;    --����ʤ����е�����
VET_201004_01_TASK_TIMES_DONATE_VICBOX = 2584;    --ÿ����Զһ�ʤ����еĴ���
VET_201004_02_TASK_DATE_HANDIN_FRUIT = 2575;    --�Ͻ�ˮ��������
VET_201004_02_TASK_NUM_HANDIN_FRUIT = 2576;    --�Ͻ�ˮ������
VET_201004_02_TASK_FLAG_MULTI_REWARD = 2577;    --����Ͻ�ˮ���Ŀ�����
VET_201004_02_TASK_FLAG_ISHANDED = 2578;    --ÿ��ˮ��ÿ���Ƿ��Ѿ��Ͻ���
VET_201006_01_TASK_USETECHAN_COUNT = 2587;    --ˮ���ز�ʹ�ô���
VET_201006_01_TASK_FLAG_GET_UP_AWARD = 2588;    --��¼�Ƿ���ȡ�����޽���
VET_201006_01_TASK_FLAG_EAT = 2131;    --��¼������û�����͸�����������
VET_201006_01_TASK_FLAG_GIVETOSON = 2287;    --��¼���͸�����������ÿһλ�ֱ��ʾˮ������ˮ������ˮ������ˮ��֭
VET_201006_01_TASK_DATE_MIYIN = 2198;    --��¼ʹ������������ӡʱ��
VET_201006_01_TASK_USEMIYIN_COUNT = 2199;    --һ��ʹ����ӡ����
VET_200912_TASK_JUNGONG = 701;    --ת��-��¼����ֵ���������
VET_200912_TASK_ZS_STATE = 2569;    --ת��-�����Ѿ�����ڼ���
VET_200912_TASK_ZISHI_TYPE = 2570;    --ת��-����״̬01234�ֱ��ʾû���������ﻢӥ
VET_200912_TASK_MENHUI_TYPE = 2571;    --ת��-��¼�ý�ɫת��ʱ����Ż�1234��ʾ���ﻢӥ
VET_200912_TASK_JIUNAN_TYPE = 2572;    --ת��-��¼����������Ҫ������Ʒ
VET_200912_TASK_ZS_DATE = 2573;    --ת��-��¼��һ��ת������
VET_200912_TASK_TEAM_TASK_DATE = 2574;    --ת��-��¼������ϴμ������������ʱ��
VET_200912_TASK_JIHUO_FLAG = 2575;    --ת��-��ʮ����λ�Ӹ�λ����λ��ʾ������Ƿ񼤻��˱���ͬ�顢����������������װ����������װ������
VET_201003_TONGBAN_TASK_HEALTHY_POINT = 2560;    --Խ��2010��ת��ϵͳͬ��ϵͳ ������
VET_201003_TONGBAN_TASK_UPGRADE_POINT = 2561;    --Խ��2010��ת��ϵͳͬ��ϵͳ ������
VET_201003_TONGBAN_TASK_TONGBAN_LEVEL = 2562;    --Խ��2010��ת��ϵͳͬ��ϵͳ ͬ��ȼ���¼
VET_201003_TONGBAN_TASK_DAILY_ITEM = 2563;    --Խ��2010��ת��ϵͳͬ��ϵͳ ͬ���ճ���������Ʒ 1:�׾��� 2:������ 3:������ 4:������ 0��û������
VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT = 2564;    --Խ��2010��ת��ϵͳͬ��ϵͳ ͬ���ճ�������ܴ���
VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK = 2565;    --Խ��2010��ת��ϵͳͬ��ϵͳ ͬ���ճ�����ʱ���� ��ȷ����
VET_201003_TONGBAN_DATE_HAND_DAILY_TASK = 2566;    --Խ��2010��ת��ϵͳͬ��ϵͳ ͬ���ճ�������ʱ�� ��ȷ������
VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY = 2567;    --Խ��2010��ת��ϵͳͬ��ϵͳ ���Ի��ʱ����
VET_201003_TONGBAN_TASK_HEALTHY_POINT_DEDUCT = 2568;    --Խ��2010��ת��ϵͳͬ��ϵͳ �۳��������ۼ�
VET_201003_TONGBAN_TASK_TRIGGER_ID_DEFINE = 2515;    --Խ��2010��ת��ϵͳͬ��ϵͳ �������Զ���ID ��ʱ������
VET_201006_03_TASK_GET_CHONGWU_DATE = 2111;    --Խ��6�»֮����ڻ  �ٻ����籭����ʱ��
VET_201006_03_TASK_GET_BAOBEI_DATE = 2112;    --Խ��6�»֮����ڻ  �ٻ����򱦱�ʱ��
VET_201006_03_TASK_TMP_CHOICE = 109
VET_201007_01_TASK_HUNYUANGONG_NUM = 2589;    --Խ��7�» ��ǻ�Ԫ��2��4��6��8��10���Ƿ�ʹ�ù��������5λ���λ��ʾ��Ԫ��10����������
VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM = 2590;    --Խ��7�» ��¼ʹ������һǧ�����
VET_201007_01_TASK_SILINGBAOSHI_NUM = 2591;    --Խ��7�» ��¼���鱦ʯʹ�ô���
VET_201007_01_TASK_SILINGFUYUANDAN_NUM = 2592;    --Խ��7�» ��¼���鸴ԭ��ʹ�ô���
VET_201007_01_TASK_FLAG_LIMITED_AWARD = 2593;    --Խ��7�» ������鸴ԭ�����޽���
VET_201007_01_TASK_GET_CHONGWU_DATE = 2594;    --Խ��7�» ��¼�����ٻ�ʱ��

VET_201008_01_TASK_EAT_QIAOKELIDANGAO = 2595 --Խ��8�» ��¼�Ѿ����˶��ٸ��ɿ�������
VET_201008_01_TASK_FLAG_LIMITED_AWARD = 2596 --Խ��8�» ����Ƿ���ȡ���޽���
VET_201008_02_TASK_NUM_TANXIANGMU = 2599   --��ս����boss ��¼ÿ�����ҽ���̴��ľ����
VET_201008_02_TASK_DATE_TANXIANGMU = 2600   --��ս����boss ��¼��һ����ҽ�̴��ľ��ʱ��
VET_201008_02_TASK_NUM_QINGGONGYAN = 2601   --��ս����boss ��¼ÿ������ʹ���칦�����
VET_201008_02_TASK_DATE_QINGGONGYAN = 2602  --��ս����boss ��¼��һ��ʹ���칦���ʱ��
VET_201008_02_TASK_TIME_QINGGONGYAN = 2603  --��ս����boss ��¼��һ��ʹ���칦���ʱ��

VET_201009_01_TASK_NUM_MOONCAKES = 2604--Խ��9������ڻ ��¼ʹ���±�����
VET_201009_01_TASK_FLAG_KAOLU = 2605--Խ��9������ڻ ��¼��ǰ�Ƿ��Ѿ�������һ����¯
VET_201009_01_TASK_LIMITE_EXP_MOONCAKE = 2606--Խ��9������ڻ ��¼��ǰ�Ѿ�ͨ��ʹ���±���õľ�����
VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP = 2607--Խ��9������ڻ ��¼��ǰ�Ѿ�ͨ��ʹ�ÿ�����±���δ������±���õľ�����
VET_201009_01_TAKS_TIME_LAST_KAOLU = 2608--Խ��9������ڻ ��¼��һ���ٻ���¯ʱ��
VET_201009_01_TASK_KAOLU_PHASE = 2609--Խ��9������ڻ ��¼��¯�׶�
VET_201009_01_TASK_KAOLU_TIME = 2610--Խ��9������ڻ ��¼��¯�׶ζ�Ӧ�Ŀ�ʼʱ��
VET_201009_01_TASK_MUCAI_NUM = 2611--Խ��9������ڻ ��¼�ɹ����뿾¯��ľ����
VET_201009_02_TASK_DATE_GOUMAILAZHU = 2612--Խ��9������ƻ� ��¼�ϴι���������ʱ��
VET_201009_02_TASK_TIME_END_HUADENG = 2613--Խ��9������ƻ� ��¼���ƽ�������ʱ��
VET_201009_02_TASK_DATE_JIHUOHUADENG = 2614--Խ��9������ƻ� ��¼�ϴμ���Ƶ�ʱ��
VET_201009_00_TASK_GET_LOGIN_AWARD = 2615--����ָ������ ��¼��¼���� �ӵ�λ����λ�ֱ��ʾһ��,����,������¼����,5��10��15��20��40�ֽ���
VET_201009_00_TASK_GET_LEVEL_AWARD = 2616 --����ָ������ ��¼�ȼ����� �ӵ�λ����λ�ֱ��ʾ�ͼ����߼��Ľ�����ȡ���
VET_201009_00_TASK_GET_TASK_AWARD = 2617 --����ָ������ ��¼������ �ӵ�λ����λ�ֱ��ʾ�������Ľ�����ȡ���
VET_201009_00_TASK_NUM_FACTION = 2618 --����ָ������ ��¼ʦ������ 3λ�ӵ�λ����λ��ʾ�ͼ��м��߼�
VET_201009_00_TASK_TONGGUAN_CANGJIAN = 2619 --����ָ������ ��¼�Ƿ�ͨ�زؽ�
VET_201009_00_TASK_TONGGUAN_TAIXU = 2620 --����ָ������ ��¼�Ƿ�ͨ��̫��
VET_201009_00_TASK_RICHANG = 2621 --����ָ������ ��¼����ճ�������� ʮλ��ʾ�Ŷ� ��λ��ʾ����
VET_201009_00_TASK_SHANGHUI_TIMES = 356 --����ָ������ ��¼����ϻ��������
VET_201009_00_TASK_TONGGUAN_ZIGUANG = 2622 --����ָ������ ��¼�Ƿ�ͨ���Ϲ�
VET_201009_00_TASK_CHENGZHANG = 2623 --����ָ������ ��¼�Ƿ���ȡ���ɳ�����,ÿһλ 0 1 2 3 �ֱ��ʾû����ȡ�� ��һ���Ѿ���ȡ �ڶ����Ѿ���ȡ ����Ѿ���ȡ
VET_201009_00_TASK_FLAG_ADDLOGIN_AWARD = 2624 --����ָ������ ��¼�Ƿ���ӹ���¼����
VET_201011_02_TASK_MODE = 2625
VET_201011_02_TASK_USED_COUNT = 2626
VET_201011_02_TASK_USED_COUNT_MODE1 = 2627
VET_201011_02_TASK_USED_COUNT_MODE2 = 2628
VET_201011_02_IF_GET_REWARD = 2629
VET_201011_03_TASK_GATHERED_COUNT1 = 2630
VET_201011_03_TASK_GATHERED_COUNT2 = 2631
VET_201011_03_TASK_GATHERED_COUNT3 = 2632
VET_201011_03_TASK_GATHERED_COUNT4 = 2633
VET_201011_03_TASK_EXCHANGED1 = 2634
VET_201011_03_TASK_EXCHANGED2 = 2635
VET_201011_03_TASK_EXCHANGED3 = 2636
VET_201011_03_TASK_EXCHANGED4 = 2637
VET_201011_HB_TASK_USED_COUNT = 2638
VET_201011_CM_TASK_LAST_DAILY_RESET_TIME = 2639
VET_201011_05_TASK_ENTERED_COUNT = 2640;
VET_201012_05_TASK_ENTRANCE_MAP_INDEX = 2641;
VET_201012_01_USE_XMAS_BOX_COUNT = 2642;        --2010ʥ�������ʥ����еĸ���
VET_201012_XMAS_BOX_MODE = 2643;                --2010ʥ�����ʹ��ʥ����еĽ���ģʽ��1�ǻ����Ʒ��2�ǲ�Ҫ��Ʒ���õ����ྭ��
VET_201012_01_GET_FINAL_AWARD_FLAG = 2644;      --2010ʥ������Ƿ���ȡ����ʥ�������޵Ľ�����1Ϊ��ȡ��0Ϊδ��ȡ
VET_201012_BUY_XMAS_CLOTHES_FLAG = 2645;        --2010ʥ������Ƿ����ʥ����װ��1Ϊ�����0Ϊû���
VET_201012_03_NPCIDX = 2646;                    --2010�꣬��ȡůʱ���ٻ���NPCIDX��¼��������ϼ����ʱ����
VET_201012_03_TASK_TIME_END_HUOCHAI = 2647;     --��ȡů������������ʱ��¼��������ֹʱ��
VET_201012_04_PLANT_4_SOUL_TREE_TIME = 2648;    --����������¼��������ʱ���
VET_201012_05_TASK_ENTRANCE_MAP_INDEX = 2641;   --ѩ��
VET_201012_05_TASK_EXP_GAINED = 2649;						--ѩ��
VET_201212_05_TASK_ZHENQI_GAINED = 3110;				--ѩ��
--====����TaskIDʹ����reset���ƣ���ϸ��\script\online_activites\daily_taskids_reset.lua ====
VET_201012_03_FIRE_TIMES = 2650;                --��ȡů����¼��ҵ����������
VET_201012_04_PLANT_4_SOUL_TREE_COUNT = 2651;   --����������¼����������������
VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT = 2652;  --����������¼�����Ͻ���ˮ������
-->

VET_201101_01_TASK_MODE = 2653;
VET_201101_01_TASK_USED_COUNT = 2654;
VET_201101_01_TASK_USED_COUNT_MODE1 = 2655;
VET_201101_01_TASK_USED_COUNT_MODE2 = 2656;
VET_201101_01_IF_GET_REWARD = 2657;

--DailyTask ��\script\online_activites\everyday_do.lua ����ÿ�յĳ�ʼֵ
VET_TSK_IPBONUS_ONLINE_AWARD =  2658		--ÿ���ۼ�����ʱ���콱
VET_TSK_IPBONUS_BUFF_TYPE =  2659			--ÿ��buff����
--��ɽ���:�峤-2011-3-7����
VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY = 2686	--��ɽ��Ʒ����ʹ�ô���
VET_MS_TASKID_JUYILING = 2689;					--��ɽ������ʹ�ô���
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1 = 2694	--������ս
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2 = 2695	--������ս
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3 = 2696	--�����ս
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3_BOSS = 2697	--���BOSS
VET_MS_LS_TASKID_LIANGSHAN_DAILY_BOSS_KILL = 2859	--�ɵ�BOSS���������ʯ����
--================��������ս������-2011-8-30����==================
VET_LZZ_PLAYER_RESULT = 2920  --��һ�βμӺ�������ս�����1��ʾʤ����2��ʾʧ�ܣ�0��ʾδ�μ�
VET_LZZ_PLAYER_AWARD = 2921 --��¼һ���ڻ�õľ���
VET_LZZ_PLAYER_AWARD_DAY = 2922 --��¼���
VET_LZZ_ENROLL_MAPID = 2923 --��¼��ұ�����ͼ�ģɣ�
VET_LZZ_PLAYER_CAMP = 2924   	--��¼���һ�ζ������Ӫ����ȡ����������
VET_LZZ_PLAYER_POINT = 2925    --��¼���һ�ζ����л�õĻ��֣���Ӫ���֣�����ȡ���������գ�����������ж��Ƿ���ȡ���ϴ�ս���Ľ����Լ��Ƿ�ȡ����ʤ��
VET_LZZ_PLAYER_DATE = 2926  --��¼�μӺ�������ս���ڣ���ʽ��20090715
VET_LZZ_PLAYER_DRAG = 2927 -- ��¼�Ƿ��Ѿ���ȡ���ۣ�0δ��ȡ������ֵΪ�������� (�޸Ĵ�ֵ����ͬʱ�޸�playerloginin.lua)
VET_LZZ_PLAYER_TAG = 2928 --��¼һ���Ƿ���й�.0δ�μӣ�1�μ�
VET_LZZ_PLAYER_1715 = 2929 --ͬ��1715�������(�޸Ĵ�ֵ����ͬʱ�޸�playerloginin.lua)
VET_LZZ_PLAYER_TAG2 = 2930 --��¼һ���Ƿ���е������Ϊ��ȡ������ƾ��.0δ�μӣ�1�μ�
VET_LZZ_DRAGBOAT_KIND = 2931 --���۵�����
VET_LZZ_MISSION_MAPID = 2932 --mission id
--===============������========================================
VET_TREASURE_BOX_PNUM = 2953 --�������ͨ���ۼ�ʱ���õ�ľ�������
VET_TREASURE_BOX_MNUM = 2954 --���챦�����˳���ľ�������
VET_TREASURE_BOX_CNUM = 2955 --���챦�����˳��۲ر��������
--==========ͨ��þ�=============================================
VET_TDD_DALIY_TASK_CROSS = 3070 --ͨ��һ��ͨ��þ�
VET_TDD_WEEK_TASK_CROSS = 3071 --ͨ��4��ͨ��þ�
--==========��ڣ=============================================
VET_WJZ_DALIY_TASK_CROSS = 3072 --ͨ��һ����ڣ
VET_WJZ_WEEK_TASK_CROSS = 3073 --ͨ��7����ڣ
--=========ͨ��þ�����ڣ�շѷ���===========================
VET_DALIY_TASK_FANPAI = 3074 --�շѷ���
VET_WEEK_TASK_FANPAI = 3075 --�շѷ���15��
--=========ͨ�����ڣ�ճ����ܳ���ǽ�ȡ���===========
VET_TTD_WJZ_TASK_FLAG = 3076 --��1��2λ��ʶͨ��ͨ�أ�3��4λ��ʶ��ڣͨ�أ�5��6Ϊ����
--===============��ɽboss�=======================================
VET_LSB_DAY_SEQ = 3077 --���¼
VET_LSB_MAIL_NUM = 3078 --��һ�ֽڱ�ʾ��ɽ����ʹ�ô�����2������89��3��90��4��91
VET_LSB_GETBOX = 3079 --ʰȡ�ƽ�����¼
VET_LSB_CALLBOSS = 3087 --�ٻ�5����ɽboss
VET_LSB_OPENBOX = 3088 --��һ����ɽ�ܱ���
--===============����ʥ��========================================
VET_OLY_TASK = 3091 --��һ�ֽڱ�ʾ���յ�����,�ڶ��ֽڼ�¼������Ϸ���ɵ�����,3,��ʾ�����ֵĴ���,4��ʾ�ݹ�Ĵ���
VET_OLY_TASK1 = 3092 --��һ�ֽڱ�ʾ�������콱����,2-3�ֽڱ�ʾ��������,4�ֽڱ�ʾ�Ƿ�Ǽ��콱
VET_OLY_TASK2 = 3093 --1-2�ۼƵ�����,3-4��ȡ�����Ƭ����
VET_OLY_TASK3 = 3094 --1�ֽ�8λ�ֱ��ʾ6�����н����Ƿ���,2�ֽڼ�¼����ڤ������¼�����
--==========���¼�¼GlobalValue��ʹ�ã��������TaskID���ַ�ֹ����==========

-- temp task value key
VET_201011_03_TASK_TEMP_GATHER_INDEX = 247;
VET_201011_03_TASK_TEMP_TRIGGER_INDEX = 248;
VET_201011_HB_TASK_TEMP_ITEM_INDEX = 249;
VET_201011_CM_TASK_TEMP_TRIGGER_INDEX = 250;
VET_201012_06_TASK_TEMP_ZONE_INDEX = 251;
VET_201012_06_TASK_TEMP_TREE_INDEX = 252;
VET_201012_06_TASK_TEMP_TRIGGER_INDEX = 253;
