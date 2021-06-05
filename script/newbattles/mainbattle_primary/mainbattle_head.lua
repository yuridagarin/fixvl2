--filename:mainbattle_head.lua
--create date:2006-06-23
--describe:��ս��ͷ�ļ�����������һ��ͷ�ļ��������ű�ֻ��������ͷ�ļ�������
Include("\\script\\newbattles\\mainbattle_primary\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle_primary\\position.lua");

BATTLE_TYPE = PRIMARY_MAINBATTLE_ID;	--ս������

ENTRANCE_POINT = 	--�����
{
	[SONG_ID] = {MAPID_SONG,1550,3753},
	[LIAO_ID] = {MAPID_LIAO,1939,3743},
};

SOLDIER_COUNT = getn(tSoldierSong);
ARROWBUILDING_COUNT = getn(tArrowBuildingSong);
LOOEY_COUNT = getn(tLooeySong);
CAPTAIN_COUNT = getn(tCaptainSong);
PIONEER_COUNT = getn(tPioneerSong);
GENERAL_COUNT = getn(tGeneralSong);
MARSHAL_COUNT = getn(tMarshalSong);
HEADER_COUNT = getn(tVillagerHeaderPos);
REFUGEE_COUNT =	getn(tVillagerPos); 
EMPLACEMENT_COUNT = getn(tEmplacementPos);
HERO_COUNT = getn(tNonalignedHeroPos);

REFUGEE_COUNT = getn(tSongRefugee);

TYPE_SOLDIER = 1;		--ʿ��
TYPE_ARROWBUILDING = 2;	--����
TYPE_LOOEY = 3;			--��ξ
TYPE_CAPTAIN = 4;		--��ͳ
TYPE_PIONEER = 5;		--�ȷ�
TYPE_GENERAL = 6;		--����
TYPE_MARSHAL = 7;		--Ԫ˧
TYPE_HEADER = 8;		--��������
TYPE_REFUGEE = 9;		--����
TYPE_EMPLACEMENT = 10;	--��̨
TYPE_HERO = 11;			--������ʿ

--ע��,NPC�����ֲ����������,�������,���ȿ���npc_death.lua�ű�
--��д��ʽ��{�η�λ��table,�ɷ�λ��table,{{�η�NPC����,�η�ģ����},...},{{�ɷ�NPC����,�ɷ�ģ����}},...}
tNpcInfo = {									--NPC���֡���ģ����
	[TYPE_SOLDIER] = {tSoldierSong,tSoldierLiao,{{"T�ng qu�n tinh binh","T�ng tinh binh (Ng�c M�n)"},{"T�ng qu�n c��ng n� binh","T�ng c��ng n� binh (Ng�c M�n)"}},{{"Li�u qu�n d�ng s�","Li�u d�ng s� (Ng�c M�n)"},{"Li�u qu�n ng�nh ti�n binh","Li�u ng�nh ti�n binh (Ng�c M�n)"}}},
	[TYPE_ARROWBUILDING] = {tArrowBuildingSong,tArrowBuildingLiao,{{"Ti�n th�p-T�ng","Ti�n th�p"}},{{"Ti�n th�p-Li�u","Ti�n th�p"}}},
	[TYPE_LOOEY] = {tLooeySong,tLooeyLiao,{{"T�ng hi�u �y","T�ng �� �y (Ng�c M�n)"}},{{"Li�u hi�u �y","Li�u �� �y (Ng�c M�n)"}}},
	[TYPE_CAPTAIN] = {tCaptainSong,tCaptainLiao,{{"T�ng �� th�ng","T�ng �� th�ng (Ng�c M�n)"}},{{"Li�u �� th�ng","Li�u �� th�ng (Ng�c M�n)"}}},
	[TYPE_PIONEER] = {tPioneerSong,tPioneerLiao,{{"T�ng ti�n phong","T�ng ti�n phong (Ng�c M�n)"}},{{"Li�u ti�n phong","Li�u ti�n phong (Ng�c M�n)"}}},
	[TYPE_GENERAL] = {tGeneralSong,tGeneralLiao,{{"T��ng qu�n (T�ng)","T�ng t��ng qu�n (Ng�c M�n)"}},{{"T��ng qu�n (Li�u) ","Li�u t��ng qu�n (Ng�c M�n)"}}},
	[TYPE_MARSHAL] = {tMarshalSong,tMarshalLiao,{{"T�ng nguy�n so�i","T�ng nguy�n so�i (Ng�c M�n)"}},{{"Li�u nguy�n so�i","Li�u nguy�n so�i (Ng�c M�n)"}}},
	[TYPE_HEADER] = {tVillagerHeaderPos,tVillagerHeaderPos,{{"Th� l�nh th� d�n","Th� l�nh th� d�n (Ng�c M�n)"}},{{"Th� l�nh th� d�n","Th� l�nh th� d�n (Ng�c M�n)"}}},
	[TYPE_REFUGEE] = {tVillagerPos,tVillagerPos,{{"Th� d�n","Th� d�n (Ng�c M�n)"},{"Th� d�n","Th� d�n cung ti�n th�(Ng�c M�n)"}},{{"Th� d�n","Th� d�n (Ng�c M�n)"},{"Th� d�n","Th� d�n cung ti�n th�(Ng�c M�n)"}}},
	[TYPE_EMPLACEMENT] = {tEmplacementPos,tEmplacementPos,{{"Ph�o ��i","H�a ph�o trung qu�n (Ng�c M�n)"}},{{"Ph�o ��i","H�a ph�o trung qu�n (Ng�c M�n)"}}},
	[TYPE_HERO] = {tNonalignedHeroPos,tNonalignedHeroPos,{{"V� t��ng trung l�p","K� nh�n d� s�"}},{{"V� t��ng trung l�p","K� nh�n d� s�"}}}
	}

FIGHT_TIMER_ID = 1110;
FIGHT_TRIGGER_ID = 3124;

KILL_VILLAGER_POINT_LIMITED = 100;	--ɱ�����������������
KILL_SOLDIER_POINT_LIMITED = 200;	--ɱ��ʿ�������������

OPERATE_TIME = 30;	--���������ʱ��
--ɱ����Һ�õ��ʵۼ��͵ĸ��ʣ��Ծ�������
tKillPlayerEAP = {1,1,2,3,10,30};
--ɱ��NPC��õ��ʵۼ��͵ĸ���
tKillNpcEAP = {
			[TYPE_SOLDIER] = 1,	--soldier
			[TYPE_ARROWBUILDING] = 10,	--arrowbuilding
			[TYPE_LOOEY] = 1,	--looey
			[TYPE_CAPTAIN] = 2,	--captain
			[TYPE_PIONEER] = 10,	--pioneer
			[TYPE_GENERAL] = 20,	--general
			[TYPE_MARSHAL] = 30,	--marshal
			[TYPE_HEADER] = 2,	--header
			[TYPE_REFUGEE] = 0,	--refugee
			[TYPE_EMPLACEMENT] = 10,	--emplacement
			[TYPE_HERO] = 2,
			}
--ɱ����Һ�õ��ĸ��˻��֣��Ծ�������
tKillPlayerPoint = 
{
	[1] = tBPEven[BP_MAIN_KILL_SOLDIER],	--ɱ��ʿ��
	[2] = tBPEven[BP_MAIN_KILL_LOOEY],		--ɱ��Уξ
	[3] = tBPEven[BP_MAIN_KILL_CAPTAIN],	--ɱ����ͳ
	[4] = tBPEven[BP_MAIN_KILL_PIONEER],	--ɱ���ȷ�
	[5] = tBPEven[BP_MAIN_KILL_GENERAL],	--ɱ����
	[6] = tBPEven[BP_MAIN_KILL_MARSHAL],	--ɱ��Ԫ˧
};
--ɱ��NPC��õ��ĸ��˻���
tKillNpcPoint = {
			[TYPE_SOLDIER] = tBPEven[BP_MAIN_KILL_NPC_SOLDIER],	--soldier
			[TYPE_ARROWBUILDING] = 1,	--ɱ�����������⴦��
			[TYPE_LOOEY] = tBPEven[BP_MAIN_KILL_NPC_LOOEY],	--looey
			[TYPE_CAPTAIN] = tBPEven[BP_MAIN_KILL_NPC_CAPTAIN],	--captain
			[TYPE_PIONEER] = tBPEven[BP_MAIN_KILL_NPC_PIONEER],	--pioneer
			[TYPE_GENERAL] = tBPEven[BP_MAIN_KILL_NPC_GENERAL],	--general
			[TYPE_MARSHAL] = tBPEven[BP_MAIN_KILL_NPC_MARSHAL],	--marshal
			[TYPE_HEADER] = tBPEven[BP_MAIN_KILL_HEADER],	--��������
			[TYPE_REFUGEE] = tBPEven[BP_MAIN_KILL_NATIVE],	--����
			[TYPE_EMPLACEMENT] = tBPEven[BP_MAIN_KILL_EMPLACEMENT],	--��̨
			[TYPE_HERO] = tBPEven[BP_MAIN_KILL_HERO],
			}
			
EMPLACEMENT0RANGE = 80;	--������̨�Ĺ�����Χ
EMPLACEMENT1RANGE = 60;
EMPLACEMENT2RANGE = 60;

tRouteHurt = --��̨�˺�{���˸���,�˺�����}
{
	[0] = {0,0},		--����
	[1] = {100,1000},	--����
	[2] = {100,1000},	--�׼�
	[3] = {100,600},	--��ɮ
	[4] = {100,600},	--��ɮ
	[5] = {100,1000},	--����
	[6] = {30,1000},	--����
	[7] = {100,1000},	--����
	[8] = {100,600},	--���ҷ��
	[9] = {100,600},	--�����׼�
	[10] = {100,1000},	--ؤ��
	[11] = {100,1000},	--ؤ�ﾻ��
	[12] = {30,1000},	--ؤ������
	[13] = {100,1000},	--�䵱
	[14] = {50,800},	--�䵱����
	[15] = {30,1000},	--�䵱�׼�
	[16] = {100,1000},	--����
	[17] = {100,1000},	--����ǹ��
	[18] = {100,1000},	--���Ź���
	[19] = {100,1000},	--�嶾
	[20] = {30,1000},	--�嶾а��
	[21] = {50,800},	--�嶾��ʦ
	[22] = {50,800},	--"����",
	[23] = {50,800},	--"������ʦ",
	[24] = {50,800},	--"����",
	[25] = {50,800},	--"����ʥս",
	[26] = {50,800},	--"�������",
	[27] = {50,800},	--"����Ѫ��",
	[28] = {50,800},	--"����",
	[29] = {50,800},	--"��������",
	[30] = {50,800},	--"������Ů",
	[31] = {50,800},	--"��������",
	[32] = {50,800},	--"���ؽ���",
}

ARROWBUILDING_GROUP_SONG = 23;	--NPC������
ARROWBUILDING_GROUP_LIAO = 24;

DEATH_SCRIPT = "\\script\\newbattles\\mainbattle_primary\\playerdeath.lua";
--==============================================================================
--==============================================================================
--===========================��������ս����غ���===============================
--==============================================================================
--==============================================================================
--==============================================================================
--����ս��NPC
function Create_Fight_NPC(nNpcType,nNum,nCamp)
	if nNum <= 0 then
		return 0;
	end;
	local tNpcPos = {};
	local sName = "";
	local sModelName = "";
	local nNpcIndex = 0;
	local nPosIndex = 0;
	local nRandomNpcType = 0;
	local nCampPlace = nCamp;
	tNpcPos = tNpcInfo[nNpcType][nCampPlace];
	for i=1,nNum do
		nRandomNpcType = random(1,getn(tNpcInfo[nNpcType][nCamp+2]));
		sName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][1];
		sModelName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][2];
		nPosIndex = mod(i,getn(tNpcPos))+1;
		nNpcIndex = CreateNpc(sModelName,sName,MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2])
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		if nNpcType == TYPE_MARSHAL then
			SetMissionV(MV_MARSHAL_SONG+nCamp-1,nNpcIndex);
		end;
	end;
	if nNpcType == TYPE_SOLDIER then
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+nCamp-1,0);
	end;
end
--������̨����һ��������ʾ��̨��λ�ã���ʼ��ʱ��λ�ã����εģ������ɵģ����ǹ����ģ��ڶ���������ʾ��̨������Ӫ����Ϊ��������Ϊ�Σ���Ϊ��
function Create_Emplacement(nPosition,nCamp)
	local nNpcIndex = 0;
	local sNpcName = "";
	if nCamp == ALL_ID then
		sNpcName = "Ph�o ��i trung l�p";
	else
		sNpcName = tCampNameZ[nCamp].."_ph�o ��i";
	end;
	nNpcIndex = CreateNpc("H�a ph�o trung qu�n (Ng�c M�n)",sNpcName,MAPID,tEmplacementPos[nPosition][1],tEmplacementPos[nPosition][2]);
	SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	if nPosition == 0 and nCamp == SONG_ID then	--���м����̨���Է�ռ�죬��ҿ���ֱ�ӴӺ�Ӫ���͵�ǰӪ������
		SetMissionV(MV_FRONT_TRAP_SONG,0);
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nPosition == 0 and nCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
		SetMissionV(MV_FRONT_TRAP_LIAO,0);
	end;
	SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
	SetMissionV(MV_EMPLACEMENT0_POSSESSION+nPosition,nCamp);
end;
--�����������죬���ڼ������������ƣ�������ʱֻ֧��һ������
function Create_VillagerHeader(nCamp)
	if GetMissionV(MV_HEADER_DEATH) == 1 then
		for i=1,getn(tVillagerHeaderPos) do 
			local nNpcIndex = CreateNpc("Th� l�nh th� d�n (Ng�c M�n)","Th� l�nh th� d�n",MAPID,tVillagerHeaderPos[i][1],tVillagerHeaderPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		end;
		SetMissionV(MV_HEADER_DEATH,0);
	end;
end;
--��������
function Create_Villager(nCamp)
	for i=1,getn(tVillagerPos) do 
		local nNpcIndex = CreateNpc("Th� d�n (Ng�c M�n)","Th� d�n",MAPID,tVillagerPos[i][1],tVillagerPos[i][2])
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
end;
--��N�����λ�ô���N������
function Create_Random_Pos_Villager(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	for i=1,nCount do
		local nRanPos = random(1,getn(tVillagerPos));
		local nNpcIndex = CreateNpc("Th� d�n (Ng�c M�n)","Th� d�n",MAPID,tVillagerPos[nRanPos][1],tVillagerPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
	SetMissionV(MV_KILL_VILLAGER_COUNT,0);
end;
--����������ʿ�����ڼ������������ƣ�������ʱֻ֧��һ��������ʿ
function Create_Nonaligned_Hero()
	if GetMissionV(MV_HERO_DEATH) == 1 then
		for i=1,getn(tNonalignedHeroPos) do 
			local nNpcIndex = CreateNpc("V� t��ng trung l�p (Ng�c M�n)","K� nh�n d� s�",MAPID,tNonalignedHeroPos[i][1],tNonalignedHeroPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[ALL_ID]);
		end;
		SetMissionV(MV_HERO_DEATH,0);
	end;
end;
--����������䣬ս����ʼ��ʱ�á�
function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B�o r��ng chi�n tr��ng","B�o r��ng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\box_death.lua");
	end;
end;
--��N�����λ�ô���N������
function Create_Random_Pos_Box(nNum)
	if nNum <= 0 then
		return 0;
	end;
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B�o r��ng chi�n tr��ng","B�o r��ng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
--��������
function Create_Refugee(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nRefugeeIndex = 0;
	local tPos = {tSongRefugee,tLiaoRefugee};
	local nCampPlace = nCamp;
	local tRefugeeModel = {"N�n d�n T�ng","N�n d�n Li�u"};
	for i=1,nCount do
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		nRefugeeIndex = CreateNpc(tRefugeeModel[nCamp],tCampNameZ[nCamp].." _n�n d�n",MAPID,tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2],-1,1,1,20);
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
end;
--�������������
function Create_Refugee_Receiver(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("L�o n�ng d�n",tCampNameZ[nCamp].."_th� v�",MAPID,tRefugeeReceiver[nCampPlace][1],tRefugeeReceiver[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_receive_npc.lua")
end;
--������Ӷ�����ų�
function Create_Assistant_Hirer(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("Thi�n V��ng Bang Ch�",tCampNameZ[nCamp].."_��i tr��ng ��nh thu� ",MAPID,tAssistantHirer[nCampPlace][1],tAssistantHirer[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\assistant_hirer_npc.lua")
end;
--����С·�ϵ�������
function Create_ArrowBuilding()
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("Ti�n th�p-T�ng","Ti�n th�p",MAPID,tArrowBuildingSong[i][1],tArrowBuildingSong[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_SONG,nNpcIndex);
	end;
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("Ti�n th�p-Li�u","Ti�n th�p",MAPID,tArrowBuildingLiao[i][1],tArrowBuildingLiao[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_LIAO,nNpcIndex);
	end;
end;
--�ݻ�С·�ϵ�������
function Destroy_ArrowBuilding(nCamp)
	local nCampPlace = nCamp;
	SetGroupLifeTime(ARROWBUILDING_GROUP_SONG+nCampPlace-1,0);
	ClearGroup(ARROWBUILDING_GROUP_SONG+nCampPlace-1);
end;

--����ȥ�����ȷ桢�󽫺�Ԫ˧����������ȷ�ɹ��򷵻أ��������󽫳ɹ��򷵻أ�������Ԫ˧�ɹ��򷵻أ�
function Try_To_Create_FightNPC(sName,nEnemyCamp)
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	local nPlayerCamp = 3 - nEnemyCamp;
	BT_ShowDebugInfor("sName:"..sName);

	if sName == "Ti�n phong" then
		if nEnemyNpcType == 0 then	--�ȷ������
			Create_Fight_NPC(TYPE_PIONEER,PIONEER_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_Ti�n phong xu�t hi�n");
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,1);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Уξ����
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--��ͳ����
			return 1;
		end;	
	elseif sName == "T��ng qu�n" then
		if nEnemyNpcType == 1 then	--�󽫳�����
			Create_Fight_NPC(TYPE_GENERAL,GENERAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_T��ng qu�n xu�t hi�n, hi�n h�u doanh ��i ph��ng kh�ng ai tr�n gi�, ta c� th� t�n c�ng v�o ��!");
			local fTaskTip = function(tArg)
				TaskTip("T��ng qu�n phe ta hi�n ra tr� gi�p");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,2);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Уξ����
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--�ȷ�����
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--��ͳ����
			Destroy_ArrowBuilding(nEnemyCamp);	--�������
			return 2;
		end;		
	elseif sName == "Nguy�n So�i" then
		if nEnemyNpcType == 2  then	--Ԫ˧������
			Create_Fight_NPC(TYPE_MARSHAL,MARSHAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,"Sau cu�c chi�n ��u kh�c li�t,"..tCampNameZ[nPlayerCamp].."_�� b�c "..tCampNameZ[nEnemyCamp].."_Nguy�n So�i xu�t hi�n!");
			local fTaskTip = function(tArg)
				TaskTip("Nguy�n so�i phe ta hi�n ra tr� gi�p");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,3);
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--�ȷ�����
			Create_Fight_NPC(TYPE_GENERAL,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,0);	--��������
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--��ͳ����
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Уξ����
			return 3;
		end;
	end;
	return 0;
end;
--���ݹ����������ж��Ƿ񴴽�ĳ��NPC������������������������
function Judge_State_By_Point(nCamp)
	local nPlayerCamp = nCamp;
	local nEnemyCamp = 3 - nPlayerCamp;
	local nMissionPoint = BT_GetMissionPoint(nPlayerCamp);
	local nEnemyCount = GetMSPlayerCount(MISSION_ID,nEnemyCamp);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	BT_ShowDebugInfor("nEnemyNpcType:"..nEnemyNpcType)
	BT_ShowDebugInfor("nMissionPoint:"..nMissionPoint)
	BT_ShowDebugInfor("nEnemyCount:"..nEnemyCount)
	if nEnemyNpcType == 0 and nMissionPoint >= nEnemyCount*100 then
		BT_ShowDebugInfor("L�p ti�n phong");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t�ch l�y c�ng c�ng v��t "..(nEnemyCount*100)..", �� b�c "..tCampNameZ[nEnemyCamp].."_Ti�n phong xu�t hi�n");
		Try_To_Create_FightNPC("Ti�n phong",nEnemyCamp);		--�з��������ֳ���һ����ֵ������������*100���Է��ȷ��
	elseif nEnemyNpcType == 1 and nMissionPoint >= nEnemyCount*200 then
		BT_ShowDebugInfor("L�p t��ng qu�n");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t�ch l�y c�ng c�ng v��t "..(nEnemyCount*200)..", �� b�c "..tCampNameZ[nEnemyCamp].."_��i t��ng xu�t hi�n");
		Try_To_Create_FightNPC("T��ng qu�n",nEnemyCamp);	--�з��������ֳ���һ����ֵ������������*200���Է��󽫳�
	elseif nEnemyNpcType == 2 and nMissionPoint >= nEnemyCount*400 then
		BT_ShowDebugInfor("L�p nguy�n so�i");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t�ch l�y c�ng c�ng v��t "..(nEnemyCount*400)..", �� b�c "..tCampNameZ[nEnemyCamp].."_Nguy�n So�i xu�t hi�n");
		Try_To_Create_FightNPC("Nguy�n So�i",nEnemyCamp);	--�з��������ֳ���һ����ֵ������������*400���Է�Ԫ˧��
	else
		BT_ShowDebugInfor("Kh�ng c� g� �� l�p");
	end;
end;
