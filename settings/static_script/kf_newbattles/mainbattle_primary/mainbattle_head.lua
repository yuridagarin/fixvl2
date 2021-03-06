--filename:mainbattle_head.lua
--create date:2006-06-23
--describe:主战场头文件。包含所需一切头文件。其它脚本只需包含这个头文件就行了
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mission\\mission_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\position.lua");

BATTLE_TYPE = PRIMARY_MAINBATTLE_ID;	--战场类型

ENTRANCE_POINT = 	--进入点
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

TYPE_SOLDIER = 1;		--士兵
TYPE_ARROWBUILDING = 2;	--箭塔
TYPE_LOOEY = 3;			--都尉
TYPE_CAPTAIN = 4;		--都统
TYPE_PIONEER = 5;		--先锋
TYPE_GENERAL = 6;		--将军
TYPE_MARSHAL = 7;		--元帅
TYPE_HEADER = 8;		--土民首领
TYPE_REFUGEE = 9;		--土民
TYPE_EMPLACEMENT = 10;	--炮台
TYPE_HERO = 11;			--奇人异士

--注意,NPC的名字不可随意更改,如须更改,请先看懂npc_death.lua脚本
--填写格式：{宋方位置table,辽方位置table,{{宋方NPC名字,宋方模块名},...},{{辽方NPC名字,辽方模块名}},...}
tNpcInfo = {									--NPC名字　　模板名
	[TYPE_SOLDIER] = {tSoldierSong,tSoldierLiao,{{"T鑞g qu﹏ tinh binh","T鑞g tinh binh (Ng鋍 M玭)"},{"T鑞g qu﹏ cng n? binh","T鑞g cng n? binh (Ng鋍 M玭)"}},{{"Li猽 qu﹏ d騨g s?","Li猽 d騨g s? (Ng鋍 M玭)"},{"Li猽 qu﹏ ng筺h ti詎 binh","Li猽 ng筺h ti詎 binh (Ng鋍 M玭)"}}},
	[TYPE_ARROWBUILDING] = {tArrowBuildingSong,tArrowBuildingLiao,{{"Ti詎 th竝-T鑞g","Ti詎 th竝"}},{{"Ti詎 th竝-Li猽","Ti詎 th竝"}}},
	[TYPE_LOOEY] = {tLooeySong,tLooeyLiao,{{"T鑞g hi謚 髖","T鑞g  髖 (Ng鋍 M玭)"}},{{"Li猽 hi謚 髖","Li猽  髖 (Ng鋍 M玭)"}}},
	[TYPE_CAPTAIN] = {tCaptainSong,tCaptainLiao,{{"T鑞g Й th鑞g","T鑞g  th鑞g (Ng鋍 M玭)"}},{{"Li猽 Й th鑞g","Li猽  th鑞g (Ng鋍 M玭)"}}},
	[TYPE_PIONEER] = {tPioneerSong,tPioneerLiao,{{"T鑞g ti猲 phong","T鑞g ti猲 phong (Ng鋍 M玭)"}},{{"Li猽 ti猲 phong","Li猽 ti猲 phong (Ng鋍 M玭)"}}},
	[TYPE_GENERAL] = {tGeneralSong,tGeneralLiao,{{"Tng qu﹏ (T鑞g)","T鑞g tng qu﹏ (Ng鋍 M玭)"}},{{"Tng qu﹏ (Li猽) ","Li猽 tng qu﹏ (Ng鋍 M玭)"}}},
	[TYPE_MARSHAL] = {tMarshalSong,tMarshalLiao,{{"T鑞g nguy猲 so竔","T鑞g nguy猲 so竔 (Ng鋍 M玭)"}},{{"Li猽 nguy猲 so竔","Li猽 nguy猲 so竔 (Ng鋍 M玭)"}}},
	[TYPE_HEADER] = {tVillagerHeaderPos,tVillagerHeaderPos,{{"Th? l躰h th? d﹏","Th? l躰h th? d﹏ (Ng鋍 M玭)"}},{{"Th? l躰h th? d﹏","Th? l躰h th? d﹏ (Ng鋍 M玭)"}}},
	[TYPE_REFUGEE] = {tVillagerPos,tVillagerPos,{{"Th? d﹏","Th? d﹏ (Ng鋍 M玭)"},{"Th? d﹏","Th? d﹏ cung ti詎 th?(Ng鋍 M玭)"}},{{"Th? d﹏","Th? d﹏ (Ng鋍 M玭)"},{"Th? d﹏","Th? d﹏ cung ti詎 th?(Ng鋍 M玭)"}}},
	[TYPE_EMPLACEMENT] = {tEmplacementPos,tEmplacementPos,{{"Ph竜 i","H醓 ph竜 trung qu﹏ (Ng鋍 M玭)"}},{{"Ph竜 i","H醓 ph竜 trung qu﹏ (Ng鋍 M玭)"}}},
	[TYPE_HERO] = {tNonalignedHeroPos,tNonalignedHeroPos,{{"V? tng trung l藀","K? nh﹏ d? s?"}},{{"V? tng trung l藀","K? nh﹏ d? s?"}}}
	}

FIGHT_TIMER_ID = 1110;
FIGHT_TRIGGER_ID = 3124;

KILL_VILLAGER_POINT_LIMITED = 100;	--杀死土民所获积分上限
KILL_SOLDIER_POINT_LIMITED = 200;	--杀死士兵所获积分上限

OPERATE_TIME = 30;	--单挑最长操作时间
--杀死玩家后得到皇帝嘉赏的概率（以军衔排序）
tKillPlayerEAP = {1,1,2,3,10,30};
--杀死NPC后得到皇帝嘉赏的概率
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
--杀死玩家后得到的个人积分（以军衔排序）
tKillPlayerPoint = 
{
	[1] = tBPEven[BP_MAIN_KILL_SOLDIER],	--杀死士兵
	[2] = tBPEven[BP_MAIN_KILL_LOOEY],		--杀死校尉
	[3] = tBPEven[BP_MAIN_KILL_CAPTAIN],	--杀死都统
	[4] = tBPEven[BP_MAIN_KILL_PIONEER],	--杀死先锋
	[5] = tBPEven[BP_MAIN_KILL_GENERAL],	--杀死大将
	[6] = tBPEven[BP_MAIN_KILL_MARSHAL],	--杀死元帅
};
--杀死NPC后得到的个人积分
tKillNpcPoint = {
			[TYPE_SOLDIER] = tBPEven[BP_MAIN_KILL_NPC_SOLDIER],	--soldier
			[TYPE_ARROWBUILDING] = 1,	--杀死箭塔，特殊处理
			[TYPE_LOOEY] = tBPEven[BP_MAIN_KILL_NPC_LOOEY],	--looey
			[TYPE_CAPTAIN] = tBPEven[BP_MAIN_KILL_NPC_CAPTAIN],	--captain
			[TYPE_PIONEER] = tBPEven[BP_MAIN_KILL_NPC_PIONEER],	--pioneer
			[TYPE_GENERAL] = tBPEven[BP_MAIN_KILL_NPC_GENERAL],	--general
			[TYPE_MARSHAL] = tBPEven[BP_MAIN_KILL_NPC_MARSHAL],	--marshal
			[TYPE_HEADER] = tBPEven[BP_MAIN_KILL_HEADER],	--土民首领
			[TYPE_REFUGEE] = tBPEven[BP_MAIN_KILL_NATIVE],	--土民
			[TYPE_EMPLACEMENT] = tBPEven[BP_MAIN_KILL_EMPLACEMENT],	--炮台
			[TYPE_HERO] = tBPEven[BP_MAIN_KILL_HERO],
			}
			
EMPLACEMENT0RANGE = 80;	--三个炮台的攻击范围
EMPLACEMENT1RANGE = 60;
EMPLACEMENT2RANGE = 60;

tRouteHurt = --炮台伤害{受伤概率,伤害点数}
{
	[0] = {0,0},		--白名
	[1] = {100,1000},	--少林
	[2] = {100,1000},	--俗家
	[3] = {100,600},	--禅僧
	[4] = {100,600},	--武僧
	[5] = {100,1000},	--唐门
	[6] = {30,1000},	--唐门
	[7] = {100,1000},	--峨嵋
	[8] = {100,600},	--峨嵋佛家
	[9] = {100,600},	--峨嵋俗家
	[10] = {100,1000},	--丐帮
	[11] = {100,1000},	--丐帮净衣
	[12] = {30,1000},	--丐帮污衣
	[13] = {100,1000},	--武当
	[14] = {50,800},	--武当道家
	[15] = {30,1000},	--武当俗家
	[16] = {100,1000},	--杨门
	[17] = {100,1000},	--杨门枪骑
	[18] = {100,1000},	--杨门弓骑
	[19] = {100,1000},	--五毒
	[20] = {30,1000},	--五毒邪侠
	[21] = {50,800},	--五毒蛊师
	[22] = {50,800},	--"昆仑",
	[23] = {50,800},	--"昆仑天师",
	[24] = {50,800},	--"明教",
	[25] = {50,800},	--"明教圣战",
	[26] = {50,800},	--"明教阵兵",
	[27] = {50,800},	--"明教血人",
	[28] = {50,800},	--"翠烟",
	[29] = {50,800},	--"翠烟舞仙",
	[30] = {50,800},	--"翠烟灵女",
	[31] = {50,800},	--"唐门任侠",
	[32] = {50,800},	--"昆仑剑尊",
}

ARROWBUILDING_GROUP_SONG = 23;	--NPC任务组
ARROWBUILDING_GROUP_LIAO = 24;

DEATH_SCRIPT = "\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\playerdeath.lua";
--==============================================================================
--==============================================================================
--===========================以下是主战场相关函数===============================
--==============================================================================
--==============================================================================
--==============================================================================
--创建战斗NPC
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
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
		if nNpcType == TYPE_MARSHAL then
			SetMissionV(MV_MARSHAL_SONG+nCamp-1,nNpcIndex);
		end;
	end;
	if nNpcType == TYPE_SOLDIER then
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+nCamp-1,0);
	end;
end
--创建炮台。第一个参数表示炮台的位置，开始的时候位置１是宋的，２是辽的，０是公共的，第二个参数表示炮台所属阵营，０为公共，１为宋，２为辽
function Create_Emplacement(nPosition,nCamp)
	local nNpcIndex = 0;
	local sNpcName = "";
	if nCamp == ALL_ID then
		sNpcName = "Ph竜 i trung l藀";
	else
		sNpcName = tCampNameZ[nCamp].."_ph竜 i";
	end;
	nNpcIndex = CreateNpc("H醓 ph竜 trung qu﹏ (Ng鋍 M玭)",sNpcName,MAPID,tEmplacementPos[nPosition][1],tEmplacementPos[nPosition][2]);
	SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	if nPosition == 0 and nCamp == SONG_ID then	--若中间的炮台被对方占领，玩家可以直接从后营传送到前营出生点
		SetMissionV(MV_FRONT_TRAP_SONG,0);
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nPosition == 0 and nCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
		SetMissionV(MV_FRONT_TRAP_LIAO,0);
	end;
	SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
	SetMissionV(MV_EMPLACEMENT0_POSSESSION+nPosition,nCamp);
end;
--创建土民首领，由于加入了重生机制，这里暂时只支持一个首领
function Create_VillagerHeader(nCamp)
	if GetMissionV(MV_HEADER_DEATH) == 1 then
		for i=1,getn(tVillagerHeaderPos) do 
			local nNpcIndex = CreateNpc("Th? l躰h th? d﹏ (Ng鋍 M玭)","Th? l躰h th? d﹏",MAPID,tVillagerHeaderPos[i][1],tVillagerHeaderPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		end;
		SetMissionV(MV_HEADER_DEATH,0);
	end;
end;
--创建土民
function Create_Villager(nCamp)
	for i=1,getn(tVillagerPos) do 
		local nNpcIndex = CreateNpc("Th? d﹏ (Ng鋍 M玭)","Th? d﹏",MAPID,tVillagerPos[i][1],tVillagerPos[i][2])
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
end;
--在N个随机位置创建N个土民
function Create_Random_Pos_Villager(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	for i=1,nCount do
		local nRanPos = random(1,getn(tVillagerPos));
		local nNpcIndex = CreateNpc("Th? d﹏ (Ng鋍 M玭)","Th? d﹏",MAPID,tVillagerPos[nRanPos][1],tVillagerPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
	SetMissionV(MV_KILL_VILLAGER_COUNT,0);
end;
--创建奇人异士，由于加入了重生机制，这里暂时只支持一个奇人异士
function Create_Nonaligned_Hero()
	if GetMissionV(MV_HERO_DEATH) == 1 then
		for i=1,getn(tNonalignedHeroPos) do 
			local nNpcIndex = CreateNpc("V? tng trung l藀 (Ng鋍 M玭)","K? nh﹏ d? s?",MAPID,tNonalignedHeroPos[i][1],tNonalignedHeroPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[ALL_ID]);
		end;
		SetMissionV(MV_HERO_DEATH,0);
	end;
end;
--创建随机宝箱，战场初始化时用。
function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B秓 rng chi課 trng","B秓 rng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\box_death.lua");
	end;
end;
--在N个随机位置创建N个宝箱
function Create_Random_Pos_Box(nNum)
	if nNum <= 0 then
		return 0;
	end;
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B秓 rng chi課 trng","B秓 rng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
--创建难民
function Create_Refugee(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nRefugeeIndex = 0;
	local tPos = {tSongRefugee,tLiaoRefugee};
	local nCampPlace = nCamp;
	local tRefugeeModel = {"N筺 d﹏ T鑞g","N筺 d﹏ Li猽"};
	for i=1,nCount do
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		nRefugeeIndex = CreateNpc(tRefugeeModel[nCamp],tCampNameZ[nCamp].." _n筺 d﹏",MAPID,tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2],-1,1,1,20);
		SetNpcScript(nRefugeeIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
end;
--创建难民接收人
function Create_Refugee_Receiver(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("L穙 n玭g d﹏",tCampNameZ[nCamp].."_th? v?",MAPID,tRefugeeReceiver[nCampPlace][1],tRefugeeReceiver[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\refugee_receive_npc.lua")
end;
--创建雇佣兵团团长
function Create_Assistant_Hirer(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("Thi猲 Vng Bang Ch?",tCampNameZ[nCamp].."_i trng nh thu? ",MAPID,tAssistantHirer[nCampPlace][1],tAssistantHirer[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\assistant_hirer_npc.lua")
end;
--创建小路上的俩箭塔
function Create_ArrowBuilding()
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("Ti詎 th竝-T鑞g","Ti詎 th竝",MAPID,tArrowBuildingSong[i][1],tArrowBuildingSong[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_SONG,nNpcIndex);
	end;
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("Ti詎 th竝-Li猽","Ti詎 th竝",MAPID,tArrowBuildingLiao[i][1],tArrowBuildingLiao[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_LIAO,nNpcIndex);
	end;
end;
--摧毁小路上的俩箭塔
function Destroy_ArrowBuilding(nCamp)
	local nCampPlace = nCamp;
	SetGroupLifeTime(ARROWBUILDING_GROUP_SONG+nCampPlace-1,0);
	ClearGroup(ARROWBUILDING_GROUP_SONG+nCampPlace-1);
end;

--尝试去创建先锋、大将和元帅。如果创建先锋成功则返回１，创建大将成功则返回２，创建元帅成功则返回３
function Try_To_Create_FightNPC(sName,nEnemyCamp)
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	local nPlayerCamp = 3 - nEnemyCamp;
	BT_ShowDebugInfor("sName:"..sName);

	if sName == "Ti猲 phong" then
		if nEnemyNpcType == 0 then	--先锋出来啦
			Create_Fight_NPC(TYPE_PIONEER,PIONEER_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_Ti猲 phong xu蕋 hi謓");
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,1);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			return 1;
		end;	
	elseif sName == "Tng qu﹏" then
		if nEnemyNpcType == 1 then	--大将出来啦
			Create_Fight_NPC(TYPE_GENERAL,GENERAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_Tng qu﹏ xu蕋 hi謓, hi謓 h藆 doanh i phng kh玭g ai tr蕁 gi?, ta c? th? t蕁 c玭g v祇 !");
			local fTaskTip = function(tArg)
				TaskTip("Tng qu﹏ phe ta hi謓 ra tr? gi髉");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,2);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--先锋重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			Destroy_ArrowBuilding(nEnemyCamp);	--清除箭塔
			return 2;
		end;		
	elseif sName == "Nguy猲 So竔" then
		if nEnemyNpcType == 2  then	--元帅出来啦
			Create_Fight_NPC(TYPE_MARSHAL,MARSHAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,"Sau cu閏 chi課 u kh鑓 li謙,"..tCampNameZ[nPlayerCamp].."_ b鴆 "..tCampNameZ[nEnemyCamp].."_Nguy猲 So竔 xu蕋 hi謓!");
			local fTaskTip = function(tArg)
				TaskTip("Nguy猲 so竔 phe ta hi謓 ra tr? gi髉");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,3);
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--先锋重生
			Create_Fight_NPC(TYPE_GENERAL,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,0);	--将军重生
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--都统重生
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--校尉重生
			return 3;
		end;
	end;
	return 0;
end;
--根据公共积分来判断是否创建某个NPC；这个函数是由玩家来触发的
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
		BT_ShowDebugInfor("L藀 ti猲 phong");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t輈h l騳 c玭g c閚g vt "..(nEnemyCount*100)..",  b鴆 "..tCampNameZ[nEnemyCamp].."_Ti猲 phong xu蕋 hi謓");
		Try_To_Create_FightNPC("Ti猲 phong",nEnemyCamp);		--敌方公共积分超过一定数值：本方总人数*100，对方先锋出
	elseif nEnemyNpcType == 1 and nMissionPoint >= nEnemyCount*200 then
		BT_ShowDebugInfor("L藀 tng qu﹏");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t輈h l騳 c玭g c閚g vt "..(nEnemyCount*200)..",  b鴆 "..tCampNameZ[nEnemyCamp].."_Чi tng xu蕋 hi謓");
		Try_To_Create_FightNPC("Tng qu﹏",nEnemyCamp);	--敌方公共积分超过一定数值：本方总人数*200，对方大将出
	elseif nEnemyNpcType == 2 and nMissionPoint >= nEnemyCount*400 then
		BT_ShowDebugInfor("L藀 nguy猲 so竔");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_t輈h l騳 c玭g c閚g vt "..(nEnemyCount*400)..",  b鴆 "..tCampNameZ[nEnemyCamp].."_Nguy猲 So竔 xu蕋 hi謓");
		Try_To_Create_FightNPC("Nguy猲 So竔",nEnemyCamp);	--敌方公共积分超过一定数值：本方总人数*400，对方元帅出
	else
		BT_ShowDebugInfor("Kh玭g c? g?  l藀");
	end;
end;
