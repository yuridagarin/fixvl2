Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")

--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 1842;
CS_RevData = 3571;

--�᳡���λ��
CS_OuterPos = {};
CS_OuterPos[1] = {801, 1600, 3238};

--����˫����Ӫʱ��λ��
CS_CampPos0 = {};
CS_CampPos1 = {};
CS_CampPos2 = {};
CS_CampPos0[1] = {801, 1600, 3238};   --��ɫ
CS_CampPos1[1] = {801, 1600, 3238};   --��ɫ
CS_CampPos2[1] = {801, 1600, 3238};   --��ɫ
CS_CampPos0[2] = {805, 1637, 3166};   --��ɫ
CS_CampPos1[2] = {805, 1637, 3166};   --��ɫ
CS_CampPos2[2] = {805, 1637, 3166};   --��ɫ
CS_CampPos0[3] = {803, 1598, 3186};   --��ɫ
CS_CampPos1[3] = {803, 1598, 3186};   --��ɫ
CS_CampPos2[3] = {803, 1598, 3186};   --��ɫ
CS_CampPos0[4] = {810, 1607, 3227};   --��ɫ
CS_CampPos1[4] = {810, 1607, 3227};   --��ɫ
CS_CampPos2[4] = {810, 1607, 3227};   --��ɫ
CS_CampPos0[5] = {811, 1598, 3237};   --��ɫ
CS_CampPos1[5] = {811, 1598, 3237};   --��ɫ
CS_CampPos2[5] = {811, 1598, 3237};   --��ɫ
CS_CampPos0[6] = {802, 1600, 3238};   --��ɫ
CS_CampPos1[6] = {802, 1600, 3238};   --��ɫ
CS_CampPos2[6] = {802, 1600, 3238};   --��ɫ
CS_CampPos0[7] = {835, 1600, 3238};   --��ɫ
CS_CampPos1[7] = {835, 1600, 3238};   --��ɫ
CS_CampPos2[7] = {835, 1600, 3238};   --��ɫ
CS_CampPos0[8] = {836, 1600, 3238};   --��ɫ
CS_CampPos1[8] = {836, 1600, 3238};   --��ɫ
CS_CampPos2[8] = {836, 1600, 3238};   --��ɫ
CS_CampPos0[9] = {837, 1600, 3238};   --��ɫ
CS_CampPos1[9] = {837, 1600, 3238};   --��ɫ
CS_CampPos2[9] = {837, 1600, 3238};   --��ɫ
CS_CampPos0[10] = {838, 1600, 3238};   --��ɫ
CS_CampPos1[10] = {838, 1600, 3238};   --��ɫ
CS_CampPos2[10] = {838, 1600, 3238};   --��ɫ

--ͨ����� 801 �ɶ�
--Ϫ���ٲ� 810 Ȫ��
--������� 811 Ȫ��
--�ŵ��ջ 803 �ɶ�
--ɽ������ 805 �ɶ�
--����˷� 802 Ȫ��
--���ִ��� 835 ����
--��˫���� 836 ����
--Ӣ�۴��� 837 ����
--������� 838 ����

MapTab = {};
MapTab[1]= {801, 300, "Th�ng Thi�n ��i L�i"};
MapTab[2]= {805, 300, "S�n gian s�ch ki�u"};
MapTab[3]= {803, 300, "C��c �i�m kh�ch s�n"};
MapTab[4]= {810, 100, "Kh� l�u b�c b�"};
MapTab[5]= {811, 100, "Thi�n ngo�i phi ti�n"};
MapTab[6]= {802, 100, "L�i Ch�n B�t Ph��ng"};                    
MapTab[7]= {835, 350, "V� L�m ��i L�i ��i"};
MapTab[8]= {836, 350, "V� Song ��i L�i ��i"};
MapTab[9]= {837, 150, "Anh h�ng ��i L�i ��i"};
MapTab[10]= {838, 150, "Th�n binh L�i ��i"};

---------------------------һ�㳣��
FRAME2TIME = 18;
--��Ϸ���������
MAX_MEMBER_COUNT = 100;

MAX_ROOM_COUNT = 6;     --ÿ��������ӵ�е������̨����

TIME_NO1 = 10; --��ʱ������
TIME_NO2 = 11;

TIMER_1 = 20 * FRAME2TIME; -- 20�빫��һ��ս��
TIMER_2 = 33 * TIMER_1 ; -- 20 * 33 = 60 * 11 ��ս��ʱ��Ϊ11����
GO_TIME = 3 ; -- 180 ����ʱ��Ϊ1����

---------------------------���س���
MS_STATE = 1;
BW_SIGN_MONEY = 2; --�����Ѵ��
BW_MONEY1 = 3; --˫����ע�ܺ�
BW_MONEY2 = 4;
BW_TEMPMONEY = 5; --��ע��ʱ���
CITYID = 6; --����ID

BW_KEY = 7; -- 1-100000001�������

MS_NEWSVALUE = 9; --�����д�����ű����ĵط�

MS_PLAYER1ID = 10;-- ˫��ID
MS_PLAYER2ID = 11;

MS_ROOMINDEX = 12;

GLOBAL_NEWS_SHOW = 20;   --��Ϸ�����Ƿ���ʾ

--Ѻ����̨���-------------------missionv---------
MS_YAJING_NUM = 99;  --Ѻ����Ŀ��¼
MS_WIN_CAMP = 98; --��¼ʤ����һ��

MISSIONID = 4;

---------------------------������
MS_POS = 1900;--3��

DUZHU = 1903;	--3�������������Ŷ�עѡ��ע�KEY
SKILLENABLE = 1906;		--�Ƿ��ܹ�ʹ���书

---------------------------��ʱ������
JOINSTATE = 242;
JOINROOMINDEX = 243; --ѡ��ĳ��ر��

----------------------------------------------������̨-------------------------------------------
--���˵�ͼ��Ϣ
--��ͼID�����ڳ��е�ͼID����ͼ���ƣ��������꣬����Npc����
MultiMapTab = {
	[1]= {821, 300, "B�ch nh�n l�i ��i",1604,3244,1600,3238,"Qu�n h�ng chi�n","Th�nh ��"},--����ͨ�����
	[2]= {826, 300, "B�ch nh�n l�i ��i",1637,3166,1630,3174,"Qu�n h�ng chi�n","Th�nh ��"},--����ɽ������
	[3]= {823, 300, "B�ch nh�n l�i ��i",1602,3192,1598,3186,"Qu�n h�ng chi�n","Th�nh ��"},--���˽ŵ��ջ
	[4]= {822, 100, "B�ch nh�n l�i ��i",1604,3244,1600,3238,"Qu�n h�ng chi�n","Tuy�n Ch�u"},--��������˷�
	[5]= {825, 100, "B�ch nh�n l�i ��i",1598,3237,1591,3229,"Qu�n h�ng chi�n","Tuy�n Ch�u"},--�����������
	[6]= {824, 100, "B�ch nh�n l�i ��i",1607,3227,1602,3222,"Qu�n h�ng chi�n","Tuy�n Ch�u"},--����Ϫ���ٲ�
	}

--������Ϣ
MAX_MULTIMAP_NUM 						= 1;      --���������Ŷ�����̨������(������֤���ڵ���MultiMapTab��ͬһ��ͼ�����������������)
MAX_MULTIMAP_FIGTHER_NUM 		= 100;    --�μӱ����Ľ�ɫ��������
MAX_MULTIMAP_AUDIENCE_NUM 	= 50;     --�μӹ����Ľ�ɫ��������
HUNDRED_MONEY 							= 20000;  --�볡��Ϊ2j
MULIT_MISSION_ID 						= 23;     --������̨MissionID��
MULIT_AUDIENCE_CAMP 				= 2;      --�������ʹ���
MULIT_FIGTHER_CAMP 					= 1;      --���������ʹ���
READY_TIME 									= 9;      --һ�������̨׼��ʱ��Ϊ3���� 20(MULTI_TIMER_1)*3*3=180
GAME_TIME  									= 54;     --һ�������̨����ʱ��Ϊ15���� 20(MULTI_TIMER_1)*3*(15+3)=1080
HUNDRED_READY_TIME 					= 30;     --���˴��ޱ���׼��ʱ��Ϊ10���� 20(MULTI_TIMER_1)*3*10=600
HUNDRED_GAME_TIME  					= 75;     --���˴��ޱ���ʱ��Ϊ15���� 20(MULTI_TIMER_1)*3*(15+10)=1500
BONUS_RATE 									= 0.4;    --������Ӣ�۴��޵�ʤ�����佱��ı���

--���ر���
MULTIMAP_STATE 							= 1; 			--����Ԥ��״�� 1Ϊ�Ѿ���������Ԥ�� 2Ϊ�Ѿ�����
MULTIMAP_NEWS_STATE   			= 2; 			--������Ϣ�������̿���
TOP_KILLER_INDEX      			= 3; 			--��¼��ǰ�������ɱ����������
MULTIMAP_NPC_INDEX    			= 4; 			--��¼��̨Npc������
MULTIMAP_BONUS   						= 5; 			--���ؽ����ܶ�
GAME_TYPE										= 6; 			--�������ͱ�ʶ 0��һ�������̨ 1�����˴���
START_TIME									= 7;			--��¼����Ӣ�۴��޿��ų��ص�ʱ��
OVER_TIME										= 8;			--��¼����Ӣ�۴��޹رճ��ص�ʱ��
DECEDEND_NUM								= 9;			--��¼�����н�ɫ��������	

--��ʱ����
TOTAL_KILL_NUM 							= 150;		--����ɱ�����������ı���
PLAYER_CAMP 								= 151;		--������ҵ�ǰ��Ӫ

--��ʱ������ID
MULTI_TIME_ID1 							= 46;			--һ�������̨��ʱ��
MULTI_TIME_ID2 							= 47;			--����Ӣ�۴��޼�ʱ�� 

--��ʱ����������ʱ��
MULTI_TIMER_1 							= 20 * FRAME2TIME; -- һ�������̨20�빫��һ��ս��
MULTI_TIMER_2 							= 20 * FRAME2TIME; -- ����Ӣ�۴���20�빫��һ��ս��  
                                                      
--��ұ���
MULTIMAP_PLAYER_STATE 			= 1151;		--��¼����Ƿ���������̨��־��������ҵ�¼��Ϸʱ���״̬
AWARD_DATE_HUNDRED					= 1153;		--��¼�����һ�λ�ȡ������̨���潱��������
AWARD_DATE_TEAM							= 1154;		--��¼�����һ�λ�ȡ�Ŷ���̨���潱��������

----------------------------------------------���������̨-------------------------------------

--���˵�ͼ��Ϣ
--��ͼID�����ڳ��е�ͼID����ͼ���ƣ��������꣬����Npc����
SingleTeamMapTab = {
	[1]= {829, 300, "Th�ng Thi�n ��i L�i",1604,3244,1600,3238,"T� ��i ��u v�i Th�ng Thi�n ��i L�i","Th�nh ��"},--�������ͨ�����
	[2]= {834, 300, "S�n gian s�ch ki�u",1637,3166,1630,3174,"T� ��i ��u v�i S�n Gian S�ch Ki�u","Th�nh ��"},--�������ɽ������
	[3]= {831, 300, "C��c �i�m kh�ch s�n",1602,3192,1598,3186,"T� ��i ��u v�i C��c �i�m kh�ch s�n","Th�nh ��"},--������ӽŵ��ջ
	[4]= {830, 100, "L�i Ch�n B�t Ph��ng",1604,3244,1600,3238,"T� ��i ��u v�i L�i Ch�n B�t Ph��ng","Tuy�n Ch�u"},--�����������˷�
	[5]= {833, 100, "Thi�n ngo�i phi ti�n",1598,3237,1591,3229,"T� ��i ��u v�i Thi�n Ngo�i Phi Ti�n","Tuy�n Ch�u"},--��������������
	[6]= {832, 100, "Kh� l�u b�c b�",1607,3227,1602,3222,"T� ��i ��u v�i Kh� L�u B�c B�","Tuy�n Ch�u"},--�������Ϫ���ٲ�
	}

TeamMapTab = {
	[1]= {827, 300, "T� ��i h�n chi�n l�i ��i",1604,3244,1600,3238,"��i chi�n","Th�nh ��"},--�������ͨ�����
	[2]= {828, 100, "T� ��i h�n chi�n l�i ��i",1604,3244,1600,3238,"��i chi�n","Tuy�n Ch�u"},--�����������˷�
	}

--������Ϣ
TEAM_MISSION_ID 						= 29;     --��Ӷ�����̨MissionID��
SINGLE_TEAM_MISSION_ID      = 30;			--��ӵ�����̨MissionID�� 
MAX_TEAM_NUM 								= 10;    	--�μӱ����Ķ�����������
MIN_TEAMER_NUM							= 2;			--�μӱ����Ķ����Ա��������
TEAM_GAME_MONEY 						= 100000; --�볡��Ϊ10j
TEAM_READY_TIME 						= 9;      --һ����������̨׼��ʱ��Ϊ3���� 20(MULTI_TIMER_1)*3*3=180
TEAM_GAME_TIME  						= 54;     --һ����������̨����ʱ��Ϊ15���� 20(MULTI_TIMER_1)*3*(15+3)=1080
TEAM_READY_TIME_AWARD 			= 30;     --�������������̨����׼��ʱ��Ϊ10���� 20(MULTI_TIMER_1)*3*10=600
TEAM_GAME_TIME_AWARD  			= 75;     --�������������̨����ʱ��Ϊ15���� 20(MULTI_TIMER_1)*3*(15+10)=1500
TEAM_BONUS_RATE 						= 0.9;    --���Ŷ�Ӣ�۴��޵�ʤ�����佱��ı���

--���ر���
TEAM_GAME_STATE 						= 1; 			--����Ԥ��״�� 1Ϊ�Ѿ���������Ԥ�� 2Ϊ�Ѿ����� 3Ϊ��������
TEAM_NEWS_STATE   					= 2; 			--������Ϣ�������̿���
TOP_TEAM_INDEX      				= 3; 			--��¼��ǰ�������ɱ����������
NPC_INDEX    								= 4; 			--��¼��̨Npc������
TEAM_GAME_BONUS   					= 5; 			--���ؽ����ܶ�
TEAM_GAME_TYPE							= 6; 			--�������ͱ�ʶ 0��һ����������̨ 1������������Ӵ��� 3:��ӵ�����̨
CAPTAIN_STATE								= 7;			--��ʶ�������������Ƿ��ڳ�����
DECEDEND_NUM								= 9;			--��¼�����н�ɫ��������
CAPTAIN_ID									= 10;			--ʹ��10�������ֱ��¼10���ӳ���PlayerIndex
DELAY_STATE 								= 21;			--׼��ʱ����ʱ�˳���־
READY_STATE 								= 22;			--��սʱ����ʱ�˳���־

--�ַ�������
CAPTAIN_NAME								= 1;			--ʹ��10���ַ����ֱ��¼10���ӳ�����

--��ʱ������ID
TEAM_TIME_ID1 							= 54;			--һ����������̨��ʱ��
TEAM_TIME_ID2 							= 55;			--�������������̨��ʱ��
SINGLE_TEAM_TIME_ID 				= 56;			--��ӵ�����̨��ʱ��

--��ʱ����������ʱ��
TEAM_TIMER_1 								= 20 * FRAME2TIME; -- һ����������̨20�빫��һ��ս��
TEAM_TIMER_2 								= 20 * FRAME2TIME; -- �������������̨20�빫��һ��ս��
SINGLE_TEAM_TIMER						= 20 * FRAME2TIME; -- ��ӵ�����̨20�빫��һ��ս��					

---------------------------------------��һ�ڻ1v1��̨����----------------------------------------------------------
PLAYERAWARD_DATE            = 1204;      --��Ϊѡ����ȡ��������
PLAYERAWARD_TIMES           = 1205;      --��Ϊѡ����ȡ��������
AUDIENCEAWARD_DATE          = 1206;      --��Ϊ������ȡ��������
AUDIENCEAWARD_TIMES         = 1207;      --��Ϊ������ȡ��������

function GetLeavePos()
	    if GetTask(MS_POS) == 300 then--�ɶ�
        return 300,1825,3588;
	elseif GetTask(MS_POS) == 350 then--����
        return 350,1582,2979;
	elseif GetTask(MS_POS) == 150 then--����
        return 150,1753,3120;
    elseif GetTask(MS_POS) == 100 then--Ȫ��
        return 100,1324,2968;
	else
	    return GetTask(MS_POS), GetTask(MS_POS+1), GetTask(MS_POS+2);
	end;	
end;

function BW_SetRev()
    if (GetTask(MS_POS) == 300) then--�ɶ�
	    SetPlayerRevivalPos(CS_RevId, CS_RevData)
    --elseif (GetTask(MS_POS) == 78) then 
	--    SetPlayerRevivalPos(29);--xy
    --else
	--    SetPlayerRevivalPos(6);--cd
    end;
end;

-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame(leavetype)
--leavetype = 0��ʾ����λ�����ڵ�ͼ�ĳ������򣨷�ս������
--leavetype = 1��ʾ����λ��������һ����ͼ���������뿪ս��
	--camp = GetCamp();--�ָ�ԭʼ��Ӫ
--	SetRevPos(CS_RevId, CS_RevData)
	--BW_SetRev()
	
	RestorePKCamp();
	
	if (leavetype == 0) then 
		--SetCurCamp(camp)
		SetPKFlag(1,camp);
		SetPos(CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][2], CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][3]);
	else
		--SetCurCamp(camp);
		--SetLogoutRV(0);--����������
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	if (PCount>0) then
	    for i  = 1, PCount do 
		    PlayerIndex = PTab[i]
		    LeaveGame(1)
	    end;
	end;
	PlayerIndex = OldPlayer;
	--Msg2Fighters("GameOver "..GetName());
end;
-------------------------------------------------------------------------
function SetPKCamp()
	
	LeaveTeam();
	
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);

	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);

	--�������ͷ�
	SetDeathPunish(0);
	
	--�ر���ӹ���
	SetCreateTeam(1);
	
	ForbitTrade(1);
	
	SetTaskTemp(JOINSTATE, 1);
	
	SetFightState(0);

	--�������أ�0�رգ�1��
    InteractiveEnable(0);
    
    --��̯����
    StallEnable(0);
    
    --���𿪹�
    if (GetName() == GetMissionS(1)) then
        ExercisePK(1,GetMissionV(MS_PLAYER1ID+1));
    end;
    if (GetName() == GetMissionS(2)) then
        ExercisePK(1,GetMissionV(MS_PLAYER1ID));
    end;
end;

function RestorePKCamp()

    SetLogoutRV(0);
    
	SetFightState(0);
	
	SetDeathPunish(1);--����PK�ͷ�
	
	ForbidChangePK(0);
	
	ForbitTrade(0);
	
	SetCreateTeam(0);
	
	SetDeathScript("");--���������ű�Ϊ��
	
	SetTaskTemp(JOINROOMINDEX,0);
	
	SetTaskTemp(JOINSTATE, 0);
	
	SetPKFlag(0,0)--�ر�PK����
	
	DesaltPlayer(0);
	
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1����ʹ���书��0��ֹʹ���书)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1����ʹ���书��0��ֹʹ���书)
		SetTask(SKILLENABLE, 0);
	end;

	--�������أ�0�رգ�1��
    InteractiveEnable(1);
    
    --��̯����
    StallEnable(1);
    
    --���𿪹�
    ExercisePK(0,0);
end;

function JoinCamp(Camp)

	--�жϽ�ɫ�����Ƿ��ܹ�ʹ���书
	if GetUseSkillEnable() == -1 then		--player index ������
		print("bwhead.lua 247 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--���ܹ�ʹ���书
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--�ܹ�ʹ���书
		SetTask(SKILLENABLE, 0);
	end;

	AddMSPlayer(MISSIONID, Camp);
	
    SetPKCamp();
    
	--��PK���� ��׼����
	if (Camp == 3) then
		SetPKFlag(0,0)
		DesaltPlayer(1);
		UseSkillEnable(0);--  (1����ʹ���书��0��ֹʹ���书)
		--ChangeOwnFeature(0, 0, -1, -1, -1, -1, -1)
		--Msg2Player("ϵͳ��Ϣ������ʱ��Ϊ����״̬��");
	else
	    SetDeathScript("\\script\\missions\\bw\\bwdeath.lua");
		SetPKFlag(1,Camp)
		DesaltPlayer(0);
	end;
	ForbidChangePK(1);
	
    CleanInteractive();
	if (Camp == 1) then
		NewWorld(CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][3])
	elseif (Camp == 2) then
		NewWorld(CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][3])
	else 
		NewWorld(CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][3])
		CreateTrigger(2,2,556);--�����뿪��ͼ������
		CastState("state_dispear",1,18*60*15);--Ϊ���ڼ��Ϻ����κμ���Ч����״̬
	end;

--	str = GetName().."�Ѿ������˱���������������Χ��ҵĶ�ע��"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
	str = GetName().."�� v�o ��u tr��ng thi ��u."
	Msg2MSAll(MISSIONID, str);
end;


---------------------------------------------------------------------------
--
function WinBonus(camp)

	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]

		if (camp == 1) then
			if (GetName() == GetMissionS(1)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(2)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY2) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY1) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		elseif (camp == 2) then
			if (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(1)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY1) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY2) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		else
			if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 10)
				Earn(V)
			else
				V = GetTask(DUZHU + 1)
				Earn(V)
			end;
		end;
		SetTask(DUZHU + 2, 0);
	end;
	PlayerIndex = OldPlayer;

end;

function RecordBWCount_Win(winidx, failidx)
	orgindex = PlayerIndex
	PlayerIndex = winidx
	AddSucess();
	--nt_setTask(1070, nt_getTask(1070) + 1)
	--Ladder_NewLadder(10117, GetName(), nt_getTask(1070), 1)
	PlayerIndex = failidx
	--nt_setTask(1071, nt_getTask(1071) + 1)
	AddFail();
	PlayerIndex = orgindex
end

-- ��������״̬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	--SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function Msg2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
            Msg2Player(str);
    	end
	end;
	PlayerIndex = OldPlayer;
end

function Talk2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
            Talk(1,"",str);
        end
	end;
	PlayerIndex = OldPlayer;
end

function Tip2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
		    if (GetName() == GetMissionS(i)) then
                TaskTip(str);
            end
        end
	end;
	PlayerIndex = OldPlayer;
end

function GetPlayerInfo(player_index)
    playerinfo = "";
    
    if (player_index == 0) then
        playerinfo = "Tin t�c ch�a bi�t"
        return playerinfo
    end
    
	OldPlayer = PlayerIndex;
	PlayerIndex = player_index;
	playerinfo = playerinfo..GetLevel().." c�p ";
	local route = GetPlayerRoute();
	if (route == 0) then
		playerinfo = playerinfo.."V� m�n ph�i";
	elseif (route == 1) then
		playerinfo = playerinfo.."Thi�u L�m";
	elseif (route == 2) then
		playerinfo = playerinfo.."Thi�u L�m t�c gia";
	elseif (route == 3) then
		playerinfo = playerinfo.."Thi�u L�m thi�n t�ng";
	elseif (route == 4) then
		playerinfo = playerinfo.."Thi�u L�m v� t�ng";
	elseif (route == 5) then
		playerinfo = playerinfo.."���ng M�n";
	elseif (route == 6) then
		playerinfo = playerinfo.."���ng M�n";
	elseif (route == 7) then
		playerinfo = playerinfo.."Nga My";
	elseif (route == 8) then
		playerinfo = playerinfo.."Nga My Ph�t gia";
	elseif (route == 9) then
		playerinfo = playerinfo.."Nga My t�c gia";
	elseif (route == 10) then
		playerinfo = playerinfo.."C�i Bang";
	elseif (route == 11) then
		playerinfo = playerinfo.."C�i Bang T�nh y";
	elseif (route == 12) then
		playerinfo = playerinfo.."C�i Bang � Y";
	elseif (route == 13) then
		playerinfo = playerinfo.."V� �ang";
	elseif (route == 14) then
		playerinfo = playerinfo.."V� �ang ��o gia";
	elseif (route == 15) then
		playerinfo = playerinfo.."V� �ang t�c gia";
	elseif route == 16 then
		playerinfo = playerinfo.."D��ng M�n";
	elseif route == 17 then
		playerinfo = playerinfo.."D��ng M�n th��ng K�";
	elseif route == 18 then
		playerinfo = playerinfo.."D��ng M�n Cung K�";
	elseif route == 19 then
		playerinfo = playerinfo.."Ng� ��c"
	elseif route == 20  then
		playerinfo = playerinfo.."Hi�p ��c"
	elseif route == 21 then
		playerinfo = playerinfo.."T� ��c"
	end
	PlayerIndex = OldPlayer;
	return playerinfo
end

-----------------------------------------������̨����-------------------------------------

--������Ҳ�ͬ�����µ�״̬
--���� nType  1:׼���׶�  2����ս�׶�  3�������׶�
--���� nCamp  2������     1��ѡ��
--���� nTeam  ��Ϊnil��Ϊ���ս�� 2Ϊս����Ӫ1 3Ϊս������2
function SetPlayerState(nType,nCamp,nTeam)

local i=0;
local news_str = "";
	
	--׼���׶ν�ɫ״̬����
	if nType == 1 then
		if nTeam == nil then
			LeaveTeam();
		end
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(1);
		--�������ͷ�
		SetDeathPunish(0);
		--�ر���ӹ���
		SetCreateTeam(1);
		ForbitTrade(1);
		SetFightState(0);
		--�������أ�0�رգ�1��
  	InteractiveEnable(0);
  	CleanInteractive();
  	--��̯����
  	StallEnable(0);
  	--RemvoeTempEffect();
  	--�������ʹ���		
  	if nCamp == 2 then
  		SetPKFlag(0,0)
			DesaltPlayer(1);
			UseSkillEnable(0);--(1����ʹ���书��0��ֹʹ���书)
			CreateTrigger(2,2,556);--�����뿪��ͼ������
			CastState("state_dispear",1,18*60*15);--Ϊ���ڼ��Ϻ����κμ���Ч����״̬
		--ѡ�����ʹ���	 			  
		elseif nCamp == 1 then
			UseScrollEnable(0);--�س̷�����			
			if nTeam == nil then
				SetPKFlag(2,0);
				SetDeathScript("\\script\\missions\\bw\\multi_death.lua");
			else
				if nTeam == 2 or nTeam == 3 then
					nTeam = nTeam - 2;
					SetPKFlag(1,nTeam);
					SetDeathScript("\\script\\missions\\bw\\single_team_death.lua");
				else
					SetPKFlag(2,0);
					SetDeathScript("\\script\\missions\\bw\\team_death.lua");
				end			
			end
		end
		ForbidChangePK(1);
	end
			
	--ս���׶ν�ɫ״̬����
	if nType == 2 then
		if nCamp == 1 then
			SetFightState(1);
		end
	end
	
	--���������׶ν�ɫ״̬����	
	if nType == 3 then
		SetLogoutRV(0);    
		SetFightState(0);			
		SetDeathPunish(1);
		ForbidChangePK(0);			
		ForbitTrade(0);			
		SetCreateTeam(0);			
		SetDeathScript("");
		SetPKFlag(0,0)--�ر�PK����
		DesaltPlayer(0);
  	InteractiveEnable(1);
  	StallEnable(1);
  	UseScrollEnable(1);--�س̷�����
  	UseSkillEnable(1);
		for i=1,10 do
			RemoveTitle(21,i);
		end
	end
end

--��ս
function View_Game(nMapIndex)

local nTotalAudicnceNum = 0;

	OldSubworld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[Qu�n h�ng chi�n]Tham gia xem thi ��u ��c SubWorld b�o l�i, l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubworld;
		return 0
	end 
	
	nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP)
	
	if nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--���ù�ս״̬
		AddMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);--��������
		SetTaskTemp(PLAYER_CAMP,MULIT_AUDIENCE_CAMP);--��¼�������
	else
		Say("Xin l�i! Chi�n ��a s� ng��i �� ��! L�n sau h�y ��n s�m!",0);
	end
	
	SubWorld = OldSubworld
	
end

--��ȡĿǰɱ��������ǰN���Ľ�ɫ��PlayerIndex
--����ֵ��tab{Player[1],Player[2]����Player[N]}
function GetMurderIndexTab(nNum)

local nMurderNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local PlayerMSIndex = 0;
local i,j,k,n = 0,0,0,0;
local MurderTab = {}
local PlayerIndexTab = {}
local MaxTab = {}
local nMaxPlace = {}
local nPlayerIndex = 0;
	
	--��������ҵ�index�Ž�PlayerIndexTab
	OldPlayer = PlayerIndex
	for i=1,nMurderNum do
		PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,MULIT_FIGTHER_CAMP);
		if nPlayerIndex > 0 then
			tinsert(PlayerIndexTab,nPlayerIndex)
		end
	end
	
	PlayerIndex = OldPlayer

	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(PlayerIndexTab) do			
			if i==1 then
				tinsert(MaxTab,PlayerIndexTab[i])  
	  		tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex
				PlayerIndex = MaxTab[1]
				nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = PlayerIndexTab[i]
				nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = OldPlayer
				 
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
	
		n = getn(nMaxPlace)

		if n>1 then
			for i=1,n do
				tremove(PlayerIndexTab,nMaxPlace[i]-i+1)
			end
		end
			
		tinsert(MurderTab,MaxTab)
		
		if getn(PlayerIndexTab) == 0 then
			break
		end
		
	end

	return MurderTab

end


--��ʾɱ���������(��PK��Ӫ1��ʾ)
function ShowTopKillNumPlayer()

local PlayerIndexTab = GetMurderIndexTab(1)
local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= PlayerIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and PlayerIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			ForbidChangePK(0);
			SetPKFlag(2,0);
			ForbidChangePK(1);
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		end
	end
end

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--�ж��Ƿ�Ϊ���˴���״̬
function IsHundredBattleState()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	
--	if nHour == 11 or nHour == 17 or nHour == 21 then
--			return 1
--	end
--		
--	if nHour == 10 and nMin >= 30 and nMin <= 59 or nHour == 16 and nMin >= 30 and nMin <= 59 or nHour == 20 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--ת����Ǯ��ʽ
--��������ͭǮΪ��λ������
--����ֵ���ַ��� XX��XX��XXͭ
function TurnMoneyFormat(nMoney)

local nGold,nSilver,nCuprum = 0,0,0;
local nBonus = ""
	
	nCuprum 	= mod(nMoney,100);
	nSilver = mod(((nMoney - nCuprum)/100),100);
	nGold = (nMoney - nCuprum - nSilver*100)/10000;
	
	if nGold ~= 0 then
		nBonus = "<color=yellow>"..nGold.."<color> v�ng";
	end
	
	if nSilver ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nSilver.."<color> b�c";
	end
	
	if nCuprum ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nCuprum.."<color> ��ng";
	end
	
	return nBonus
	
end

------------------���������̨���ֺ���--------------------------
function GetGameTeamNum()

local nNum = 0;

	for i=1,10 do
		if GetMissionS(i) ~= "" then
			nNum = nNum + 1;
		end
	end

	return nNum	

end

function GetGameTeamNumByLife()

local i = 0;
local nNum = 0;
local OldPlayerIndex = 0;

	for i=1,10 do
		if GetMissionS(i) ~= "" then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					OldPlayerIndex = PlayerIndex;
					PlayerIndex = gf_GetTeamMember(i);
					if PlayerIndex > 0 then
						if IsPlayerDeath() == 0 then 
							nNum = nNum + 1;
							break;
						end
					end
					PlayerIndex = OldPlayerIndex;
				end
			end
			PlayerIndex = OldPlayer;
		end
	end
	
	return nNum

end

--�ж�ָ����Ӫ�Ķ���״̬
--���� nCamp:��ӪID
function GetTeamState(nCamp)

local i = 0;
local nPlayerMSIndex = 0;

	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) <= 0 then
		return 0
	end
	
	OldPlayer = PlayerIndex;
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,nCamp);
		if PlayerIndex > 0 then
			if IsPlayerDeath() == 0 then	
				return 1
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	return 0

end

--�ж��Ƿ������ӵ��������ʸ�
function HaveSingleTemaGameTitle()

	local nMapID, nX, nY = GetWorldPos();
	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"S� ng��i trong ��i kh�ng �� ("..MIN_TEAMER_NUM.."ng��i tr� l�n), kh�ng th� tham gia thi ��u nhi�u ng��i."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Ng��i kh�ng ph�i ��i tr��ng, kh�ng th� tham gia thi ��u!"});
		return 0
	else
		OldPlayer = PlayerIndex;
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� t�n th�, kh�ng th� tham gia thi ��u!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n �ang b�y b�n, kh�ng th� tham gia thi ��u!"});
					return 0
				end
				local nTempMaoID,nTempX, nTempY = GetWorldPos();
				if nTempMaoID ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n kh�ng � khu v�c hi�n t�i, kh�ng th� tham gia thi ��u!"});
					return 0
				end
			end	
		end
		PlayerIndex = OldPlayer;
	end
	
	return 1
	
end

--Ѻ����̨�����ж�
function HaveSingleTemaGameTitleYJ()
	local nMapID = GetWorldPos();
	if gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Ch� l�i ��i: c�n ��i tr��ng ��n khi�u chi�n"});
		return 0
	end
	local OldPlayer = PlayerIndex;
	for i=1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex > 0 then
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"��i ng��i c� t�n th�, kh�ng th� tham gia thi ��u!"});
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"��i ng��i c� ��i vi�n �ang b�y b�n, kh�ng th� tham gia thi ��u!"});
				return 0
			end
			local nTempMaoID, nTempX, nTempY = GetWorldPos();
			if nTempMaoID ~= nMapID then
				PlayerIndex = OldPlayer;
				TalkEx("",{"��i ng��i c� ��i vi�n kh�ng � khu v�c hi�n t�i, kh�ng th� tham gia thi ��u!"});
				return 0
			end
		end	
	end	
	PlayerIndex = OldPlayer;
	
	return 1;
end
--�ж��Ƿ������ӱ����ʸ�

function HaveTemaGameTitle(nType)
local nMapID = GetWorldPos();

	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"S� ng��i trong ��i kh�ng �� ("..MIN_TEAMER_NUM.."ng��i ho�c nhi�u h�n }, kh�ng th� tham gia thi ��u."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Ng��i kh�ng ph�i l� ��i tr��ng, kh�ng th� tham gia thi ��u."});
		return 0
	end
	
	if IsTeamAwardTime() == 1 then
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <60 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� t�n th� ho�c ��u th� d��i c�p 60, kh�ng th� tham gia thi ��u!"});
					return 0 
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n �ang b�y b�n, kh�ng th� tham gia thi ��u!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n kh�ng � khu v�c hi�n t�i, kh�ng th� tham gia thi ��u!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;
		end
		
		if nType == 4 then
			if Pay(TEAM_GAME_MONEY) ~= 1 then
				TalkEx("",{"M�i ��i tham gia tr�n th� 2 ��i chi�n ��u c�n ��i tr��ng giao n�p"..TurnMoneyFormat(TEAM_GAME_MONEY).."_m�i c� th� x�m nh�p ��u tr��ng!"});
				return 0
			else
				SetMissionV(TEAM_GAME_BONUS,GetMissionV(TEAM_GAME_BONUS)+TEAM_GAME_MONEY);
			end
		end
		
	else
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <10 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� t�n th�, kh�ng th� tham gia thi ��u!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n �ang b�y b�n, kh�ng th� tham gia thi ��u!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"��i ng��i c� ��i vi�n kh�ng � khu v�c hi�n t�i, kh�ng th� tham gia thi ��u!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;		
		end
		
	end
	
	return 1

end

--�ж��Ƿ�Ϊ��������ӱ���ʱ��
function IsTeamAwardTime()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	if nHour == 12 or nHour == 18 or nHour == 23 then
--			return 1
--	end
--	
--	if nHour == 11 and nMin >= 30 and nMin <= 59 or nHour == 17 and nMin >= 30 and nMin <= 59 or nHour == 22 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--��ȡĿǰɱ��������ǰN������Ķӳ���PlayerIndex
--����ֵ��tab{Captain[1],Captain[2]����Captain[N]}
function GetMurderCaptainIDTab(nNum)

local nTeamNum = GetGameTeamNumByLife();
local i,j,k,m,n = 0,0,0,0,0;
local nKillNum_1 = 0;
local nKillNum_2 = 0;
local CaptainTab = {}
local CaptainIndexTab = {}
local MaxTab = {}
local nMaxPlace = {}
local nPlayerIndex = 0;
	
	--�����жӳ���index�Ž�CaptainIndexTab
	OldPlayer = PlayerIndex
	
	for i=1,10 do
		nPlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if nPlayerIndex > 0 then
			tinsert(CaptainIndexTab,nPlayerIndex)
		end
	end
	
	PlayerIndex = OldPlayer

	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(CaptainIndexTab) do			
			if i==1 then
				tinsert(MaxTab,CaptainIndexTab[i])  
	  		tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex;
				
				PlayerIndex = MaxTab[1];
				nKillNum_1 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_1;
					end
				end
				
				PlayerIndex = CaptainIndexTab[i];
				nKillNum_2 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_2;
					end
				end

				PlayerIndex = OldPlayer
				 
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
	
		n = getn(nMaxPlace)

		if n>1 then
			for i=1,n do
				tremove(CaptainIndexTab,nMaxPlace[i]-i+1)
			end
		end
			
		tinsert(CaptainTab,MaxTab)
		
		if getn(CaptainIndexTab) == 0 then
			break
		end
		
	end

	return CaptainTab

end


--��ʾɱ�����Ķ���Ľ�ɫ(��PK��Ӫ1��ʾ)
function ShowTopKillTeamPlayer()

local CaptainIndexTab = GetMurderCaptainIDTab(1)
local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= CaptainIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and CaptainIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex;
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,PlayerIndex);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex
			
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(2,0);
					ForbidChangePK(1);
				end
			end
			
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,CaptainIndexTab[1][1]);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			
			PlayerIndex = OldPlayer
			
		end
	end
end

function LeaveGameMap()
	
local i=0;
	
	if GetTrigger(556) ~= 0 then
		RemvoeTempEffect();
		for i=1,10 do
			RemoveTitle(21,i);
		end
		RemoveTrigger(GetTrigger(556));
	end
	
end

--����������1���˻�սʧ���߳��潱����2���˻�սʤ���߳��潱����3��ӻ�սʧ���߳��潱����4��ӻ�սʤ���߳��潱����
function PayAward(nType)

local	nDate = date("%y")..date("%m")..date("%d");

	if nType == 1 or nType == 2 then
		if nDate ~= GetTask(AWARD_DATE_HUNDRED) then
			ModifyReputation(10,0);
			Earn(50000);
			if nType == 1 then	
				ModifyExp(25000);
				Msg2Player("B�n nh�n ���c 25000 �i�m kinh nghi�m.");
				if random(1,100) <= 5 then
					AddItem(2,0,504,1,1);
					Msg2Player("B�n nh�n ���c 1 c�y B�t Nh� nh�.");
				end
			elseif nType == 2 then	
				if random(1,100) <= 20 then
					ModifyExp(150000);
					Msg2Player("B�n nh�n ���c 15 v�n kinh nghi�m.");
				else
					ModifyExp(50000);
					Msg2Player("B�n nh�n ���c 5 v�n kinh nghi�m.");
				end 
				if random(1,100) <= 20 then
					AddItem(2,0,504,1,1);
					Msg2Player("B�n nh�n ���c 1 c�y B�t Nh� nh�.");
				end 
			end
			SetTask(AWARD_DATE_HUNDRED,nDate);
		else
			Msg2Player("B�n �� nh�n ph�n th��ng Qu�n h�ng chi�n, kh�ng th� nh�n n�a!");
		end
		return
	end
	
	if nType == 3 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(40000);
			Msg2Player("B�n nh�n ���c 4 v�n kinh nghi�m.")
			ModifyReputation(10,0);
			if random(1,100) <= 10 then
				AddItem(2,0,398,1,1);
				Msg2Player("B�n nh�n ���c 1 m�m c�y B�t Nh�.");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("B�n �� nh�n ph�n th��ng ��i chi�n, kh�ng th� nh�n n�a!");		
		end
		return
	end
			
	if nType == 4 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(80000);
			Msg2Player("B�n nh�n ���c 8 v�n kinh nghi�m.");
			ModifyReputation(10,0);
			if random(1,100) <= 30 then
				ModifyExp(300000);
				Msg2Player("B�n nh�n ���c 300000 �i�m kinh nghi�m.");
			end
			if random(1,100) <= 20 then
				AddItem(2,2,8,3,1);
				Msg2Player("B�n nh�n ���c 3 mi�ng Thi�n th�ch.");
			end
			if random(1,100) <= 20 then
				AddItem(2,0,398,1,1);
				Msg2Player("B�n nh�n ���c 1 m�m c�y B�t Nh�.");
			end
			if random(1,100) <= 10 then
				ModifyExp(500000);
				Msg2Player("B�n nh�n ���c 50 v�n kinh nghi�m.");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("B�n �� nh�n ph�n th��ng ��i chi�n, kh�ng th� nh�n n�a!");		
		end
	end
end

-------------------------------------------��һ����Ӳ���-----------------------------

--�ж�1v1��̨����˫���Ƿ���75�����ϣ����ҵȼ�����5��֮��
--����ֵ��1Ϊ����������0Ϊ����������

function Is2PlayerLevelOK()

local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
local Player_1_Level = 0;
local Player_2_Level = 0;

	OldPlayer = PlayerIndex;
	PlayerIndex = PlayerIndex_1;
	if PlayerIndex_1 > 0 then
		Player_1_Level = GetLevel();
		if Player_1_Level < 75 then
			PlayerIndex = OldPlayer;
			return 0
		else
			PlayerIndex = PlayerIndex_2;
			if PlayerIndex_2 > 0 then
				Player_2_Level = GetLevel();
				--�ж�˫���ȼ����Ƿ���5��֮��
				if (Player_2_Level - Player_1_Level <= 5) and (Player_2_Level - Player_1_Level >= -5) and Player_2_Level >= 75 then 
					PlayerIndex = OldPlayer;
					return 1
				else
					PlayerIndex = OldPlayer;
					return 0
				end
			else
				--player2��index���Ϸ��򲻴���
			end
		end
	else
		--player1��index���Ϸ��򲻴���
	end
end

--�жϽ�ɫ�Ƿ����ʸ���ȡ����
--����nType 1Ϊѡ�֣�2Ϊ����
function IsGetAward(nType)

	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == GetDateNum() then
			if GetTask(PLAYERAWARD_TIMES) < 2 then
				return 1
			else
				Msg2Player("Th�c Chi�n m�t ki�p h�m nay ng��i �� nh�n ��, kh�ng th� nh�n th�m.");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end

	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == GetDateNum() then
			if GetTask(AUDIENCEAWARD_TIMES) < 4 then
				return 1
			else
				Msg2Player("Quan chi�n m�t ki�p h�m nay ng��i �� nh�n ��, kh�ng th� nh�n th�m.");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
end

--�жϽ�ɫ�����Ƿ����ʸ��ý���
--����nType 1Ϊѡ�֣�2Ϊ����
function IsGetAwardWeek(nType)

local nThisWeekTimes = Zgc_pub_week_seq();

	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == nThisWeekTimes then
			if GetTask(PLAYERAWARD_TIMES) < 20 then
				return 1
			else
				Msg2Player("Th�c chi�n m�t ki�p tu�n n�y ng��i �� nh�n ��, kh�ng th� nh�n th�m.");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end

	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == nThisWeekTimes then
			if GetTask(AUDIENCEAWARD_TIMES) < 40 then
				return 1
			else
				Msg2Player("Quan chi�n m�t ki�p tu�n n�y ng��i �� nh�n ��, kh�ng th� nh�n th�m.");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
	
end

-- ʦͽ����
function process_master_task()
	local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
	local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);

	local nOldPlayer
	if PlayerIndex_1 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_1
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("Nhi�m v� S� ��-t�nh h�nh ho�n th�nh L�i ��i:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
	
	if PlayerIndex_2 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_2
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("Nhi�m v� S� ��-t�nh h�nh ho�n th�nh L�i ��i:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
end

--����1v1��̨����
function Award2Player()

local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};
local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
	--���ű��������̨ѡ�־Ͳ�����ʵս�ĵ���
	
	--���ڲ��ַ���
	--����Ҳ������ս�ĵ���
	
end

--51���Ч�����ж�
--����ֵ1Ϊ��ڼ䣬0Ϊ�ǻ�ڼ�
--Ŀǰ��Ϊ����״̬��һֱ��
function Is51PartyTime()

--	if GetDateNum() >= 20070426 and GetDateNum() <= 20070507 then
		return 0
--	else
--		return 0
--	end

end

--��ȡ����������
function GetDateNum()

local nYear = date("%Y");
local nMonth = date("%m");
local nDay = date("%d");
local nDate = tonumber(nYear..nMonth..nDay);
	
	return nDate

end

------------------------------���㱾���ܴ�----------------------------
--�������ƣ��ִη��غ���
--�������ܣ����ص�ǰ���ִ�
function zgc_pub_day_turn(day_num)
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end

--�������ƣ����������㺯��
--�������ܣ������ܵ�����
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--Ѻ����̨�����֧��Ѻ��
function yajin_leitai_pay(nNum)
	if nNum < 100 or nNum > 10000 then
		return 
	end
	--��ý�Ǯ
	Earn(nNum * 10000);
	gf_WriteLogEx("L�i ��i ��t c��c","Ti�n c��c tr� l�i",nNum," Kim ","",GetTongName(),"","","","");
end