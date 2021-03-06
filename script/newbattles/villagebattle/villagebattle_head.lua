--filename:villagebattle_head.lua
--create date:2006-05-31
--describe:村落争夺战场头文件。包含所需一切头文件。村落战的其它脚本只需包含这个头文件就行了
Include("\\script\\newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\villagebattle\\position.lua");

MAX_TASK_STEP = 99;	--最大任务步数

SICK_NPC = 1;	--NPC情绪类型，仇恨
ANGRY_NPC = 2;	--愤怒
RAGING_NPC = 3;	--狂暴

BATTLE_TYPE = VILLAGE_ID;	--战场类型

SELECT_COUNT = 3;	--被选中去寻找目标NPC的玩家的数量。只能设置1或2或3或4
KNOWMAN_COUNT = 10;	--知情人数量。不能改动。如需改动，请先看懂脚本。

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1553,3618},
	[LIAO_ID] = {MAPID_LIAO,1783,3152},
};

DEATH_SCRIPT = "\\script\\newbattles\\villagebattle\\playerdeath.lua";

--以table形式返回nPlayerCount个随机玩家的索引
function Get_Random_Player(nCamp,nPlayerCount)
	local tPlayer = {};
	local tSelectedPlayer = {};
	local nMSPlayerCount = GetMSPlayerCount(MISSION_ID,nCamp);
	if nMSPlayerCount == 0 then
		WriteLog("[Chi課 trng b竜 l鏸]: H祄 s? Get_Random_Player nh薾 頲 s? ngi c馻 phe MS n祇  l? 0");
		return 0;
	end;
	tPlayer = BT_GetMSPlayerIndex(nCamp);
	if nPlayerCount > nMSPlayerCount then	--如果要求得到的玩家数量大于目前玩家数量
		--那么就返回当前所有的玩家
		for i=1,nMSPlayerCount do	
			tSelectedPlayer[i] = tPlayer[i];
		end;
		return tSelectedPlayer;
	end;
	if getn(tPlayer) ~= nMSPlayerCount then
		WriteLog("[Chi課 trng b竜 l鏸]: H祄 s? Get_Random_Player trong tPlayer("..getn(tPlayer)..") l韓 nh? so v韎 nMSPlayerCount("..nMSPlayerCount..") kh玭g ng nh蕋");
	end;
	for i=1,nPlayerCount do
		local nSel = random(1,getn(tPlayer));
		tSelectedPlayer[i] = tPlayer[nSel];
		tremove(tPlayer,nSel);
	end;
	if getn(tSelectedPlayer) ~= nPlayerCount then
		WriteLog("[Chi課 trng b竜 l鏸]: H祄 s? Get_Random_Player tr? ph秐 h錳 tSelectedPlayer("..getn(tSelectedPlayer)..") l韓 nh? so v韎 nPlayerCount("..nPlayerCount..") kh玭g ng nh蕋");
	end;
	return tSelectedPlayer;
end;
--产生目标NPC和知情人
function Create_Task_NPC(nCamp,sName)
	local tPosition = {};
	local nNpcCount = KNOWMAN_COUNT+1;	--１１个知情人加一个目标NPC
	tPosition = Get_Position_Index(nCamp);	--tPosition最后一个元素是目标NPC的位置索引，即第nNpcCount个元素
	if getn(tPosition) ~= nNpcCount then
		WriteLog("[Chi課 trng b竜 l鏸]: H祄 s? Create_Task_NPC trong Get_Position_Index ph秐 h錳 table l韓 nh? kh玭g ph秈"..nNpcCount..",ng:"..getn(tPosition))
		for i=1,nNpcCount do	--容错处理，有可能在同一个位置创建多个NPC
			tPosition[i] = random(1,g_PosCount);	
		end;
	end;
	local npcIndex = CreateNpc("Vng An Th筩h",sName,MAPID,tNpcPos[tPosition[nNpcCount]][1],tNpcPos[tPosition[nNpcCount]][2],6,1,1,20);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);	--记录目标NPC的索引
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\targetnpc_npc.lua");
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,sName);	--记录目标NPC的名字
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	for i=0,9 do
		npcIndex = CreateNpc("Ho祅 trng Th? d﹏",sName.."B竎h S? T玭g",MAPID,tNpcPos[tPosition[i+1]][1],tNpcPos[tPosition[i+1]][2]);
		SetMissionV(nIndexBase+i,npcIndex);
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\villagebattle\\knowmandeath.lua");
	end;
end;
--清除任务NPC
function Clear_Task_NPC(nCamp)
	SetNpcLifeTime(GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp),0);	--删除目标NPC
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,0);
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	local npcIndex = 0;
	for i=0,9 do
		npcIndex = GetMissionV(nIndexBase+i);
		if npcIndex ~= 0 then
			SetNpcDeathScript(npcIndex,"");	--置空死亡脚本
			SetNpcLifeTime(npcIndex,0);	--删除知情人
			SetMissionV(nIndexBase+i,0);
		end;
	end;
end;	
--修改阵营的任务步数
function Modify_Task_Step(nCamp,nStep)
	local nCurStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	nCurStep = nCurStep + nStep;
	if nCurStep < 0 then
		nCurStep = 0;
	elseif nCurStep > MAX_TASK_STEP then
		nCurStep = MAX_TASK_STEP;
	end;
	SetMissionV(MV_SONG_TASKSTEP+nCamp-1,nCurStep);
	if nCurStep == MAX_TASK_STEP then
		return 1;	--表示完成寻找任务，这时应该生成首领
	end;
	return 0;
end;
--随机产生一个不与敌方目标NPC同名字的本方目标NPC名字
function Create_Target_Name()
	local sName = "i phng NPC";
	for i=1,20 do
		sName = Create_Name();
		if sName ~= GetMissionS(MSTR_SONG_TARGETNAME) and sName ~= GetMissionS(MSTR_LIAO_TARGETNAME) then
			return sName;
		end;
	end;
	WriteLog("[Chi課 trng b竜 l鏸]: Tu莕 ho祅 20 l莕 v蒼 ch璦 t譵 ra t猲 th輈h h頿");
	return sName;
end;
--选择三个（或三个以下）幸运儿
function Select_Task_Player(nCamp)
	local OldPlayerIndex = PlayerIndex;
	local tSelPlayer = Get_Random_Player(nCamp,SELECT_COUNT);
	if tSelPlayer == 0 then
		PlayerIndex = OldPlayerIndex;
		return 0;	--nCamp方人数为0
	end;
	local nSelPlayerCount = getn(tSelPlayer);
	if nSelPlayerCount > SELECT_COUNT then
		WriteLog("[Chi課 trng b竜 l鏸]: Select_Task_Player h祄 s? Get_Random_Player(nCamp,SELECT_COUNT) ph秐 h錳 sai, tSelPlayer l韓 nh? l?:"..nSelPlayerCount);
	end;
	Clear_Task_Player(nCamp);
	for i=1,nSelPlayerCount do
		PlayerIndex = tSelPlayer[i];
		if PlayerIndex > 0 then
			local sName = GetName();
			BT_SetTempData(PTT_SELECTED,1);
			SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sName);	--记录他们的名字
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--清空记录玩家名字的MS变量
function Clear_Task_Player(nCamp)
	for i=1,SELECT_COUNT do
		SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,"");	--先清空
	end;
end;
--创建首领NPC
function Create_Header(nCamp)
	local nPosIndex = random(1,g_PosCount);
	local npcIndex = CreateNpc("Vng An Th筩h","Th? l躰h th? d﹏",MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2]);
	SetMissionV(MV_HEADER_APPEAR,npcIndex);
	SetNpcScript(npcIndex,"\\script\\newbattles\\villagebattle\\header_npc.lua");
end;
--得到NPC位置的索引数组，一共有11个，其中第11个是目标NPC的位置索引
function Get_Position_Index(nCamp)
	local tResult = {};
	local nPosIndex = 0;
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_POS_INDEX_SONG_BEGIN;
	else
		nIndexBase = MV_POS_INDEX_LIAO_BEGIN;
	end;
	for i=0,10 do
		nPosIndex = Get_Right_Pos();
		SetMissionV(nIndexBase+i,nPosIndex);
		tResult[i+1] = nPosIndex;
	end;
	return tResult;
end;
--获得一个可用的位置索引。如果循环了10次还找不到一个合适的位置索引，即将返回最后一次循环的位置索引
function Get_Right_Pos()
	local nPosIndex = random(1,g_PosCount);
	for j=1,10 do
		nPosIndex = random(1,g_PosCount);
		if Check_Position(nPosIndex) == 1 then
			return nPosIndex;
		end;
	end;
	WriteLog("[Chi課 trng b竜 l鏸]: Tu莕 ho祅 10 l莕 v蒼 ch璦 t譵 ra v? tr? th輈h h頿");
	return nPosIndex;
end;
--根据位置索引来检查这个位置是否可用，即有没有别的NPC占用了这个位置
function Check_Position(nPosIndex)
	for i=MV_POS_INDEX_SONG_BEGIN,MV_POS_INDEX_LIAO_END do
		if nPosIndex == GetMissionV(i) then
			return 0;
		end;
	end;
	return 1;
end;

tFirstName = {"L?","Vng","Trng","L璾","Tr莕","Dng","Tri謚","Ho祅g","Chu",
			  "Chu","Cao","L﹎","H?","Qu竎h","M?","La ","Lng","T鑞g","Tr辬h",
			  "T?","H祅","Л阯g","Ph飊g","Vu","фng","Ti猽","Tr譶h","T祇","Vi猲",
			  "ng","H鴄","Ph?","Th萴","T╪g","B祅h","L?","T?","L?"," Tng",
			  "Th竔","Gi?","nh","Ng魕","Ti誸 ","Di謕","Di猰","Xa","Phan","Чt ",
			  "Цi","H?","Chung","U玭g","襫","Nhi謒","Khng","Ph祅 ","Phng ","Th筩h",
			  "Di猽","Уm","Li猽","Tr﹗","G蕌"," Kim ","L鬰","H竎h","Kh鎛g","B筩h",
			  "Th玦","khang","Mao","Kh璾","T莕","Giang","S?","C?","H莡","Thi謚",
			  "M穘h","Long","V筺 ","祅","Chng","Ti襫","Thang","Do穘","L?"," D辌h ",
			  "Thng","V? ","","H?","L筰","Cung","T﹏","Ng?","T?","T玭",
			  "B? ",
			 };
nFirstNameSize = getn(tFirstName);
tSecondName = {"ba","b鑞","Ng? ","L﹎","襫","Th筩h","B筩h","khang","Qu鷑h","Giang",
				"Minh","Chng","V? ","Ki襲","T﹏","C竧","Tr?","Ch? ","Dng","t","Thanh",
				"To祅","Huy","B﹏","Si猽","phi","V?","Lng","Ki謓","Ho籲g","?","H筼",
				"Khanh","Quy襫","Qu?","D鬾g","Phong","h秈","B籲g","T飊g","Thi猲","V筺 ","Xu﹏",
				"Anh","c秐h","S鰑","Ti謒","Hng","Th﹎","Ho祅 ","Ch﹏","B?","Tr竎","Nguy猲",
				"Xung","To竛","Hy","Ch飝","Ti課","","Nhu薾","Ki謒","hai"

			  };
ntSecondNameSize = getn(tSecondName);
--根据tFirstName和tSecondName随机生成一个名字
function Create_Name()
	local sName = "";
	sName = tFirstName[random(1,nFirstNameSize)]..tSecondName[random(1,ntSecondNameSize)];
	return sName;
end;
--转到下一步寻人任务
function Go_To_Next_Step(nCamp)
	local sName = "";
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,0);	--设置NPC类型
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,0);		--设置NPC状态为和平状态
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,0);	
	
	BT_SetCampTempValue(nCamp,PTT_SELECTED,0);	--清空阵营所有玩家的“幸运”标记
	
	if nCamp == SONG_ID then
		SetMissionV(MV_SONG_KILL_SONG,0);
		SetMissionV(MV_LIAO_KILL_SONG,0);		
	else
		SetMissionV(MV_SONG_KILL_LIAO,0);
		SetMissionV(MV_LIAO_KILL_LIAO,0);
	end;
	Clear_Task_NPC(nCamp);
	if Select_Task_Player(nCamp) == 0 then	--之前本方人数为0
		Clear_Task_Player(nCamp);	
		SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--名字置空，以便后来进入的玩家可以重新开始。
		return "";
	end;
	sName = Create_Target_Name();
	Create_Task_NPC(nCamp,sName);
	local sContent = "";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	Msg2MSGroup(MISSION_ID,"Doanh tr筰 c蕄 b竜: Nghe n鉯 "..sName.."  c? th? bi誸 tung t輈h th? l躰h. M阨 "..sContent.." nhanh ch鉵g ph﹏ t竛 甶 t譵 B竎h S? Th玭g. Hi謓 phe ta nh薾 頲 s? t輓 nhi謒 c馻 Th? d﹏ l? "..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"Tng s? nh薾 nhi謒 v? phe T鑞g l?: "..sContent)
	else
		Msg2MSAll(MISSION_ID,"Tng s? nh薾 nhi謒 v? phe Li猽 l?: "..sContent)
	end;
	Tips_To_Selected_Player(nCamp);
	return sName;
end;
--向被选中的人发TIPS
function Tips_To_Selected_Player(nCamp)
	local nOldPlayerIndex = PlayerIndex;
	local tPlayer = BT_GetMSPlayerIndex(nCamp);
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if BT_GetTempData(PTT_SELECTED) == 1 then
			TaskTip("Nguy猲 so竔 c? l謓h, ngi mau t譵"..GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1));
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--到达最后一步寻人任务
function Reach_Final_Step(nCamp)
	if GetMissionV(MV_HEADER_APPEAR) == 0 then
		Msg2MSAll(MISSION_ID,"Th竚 m? h錳 b竜: Th? l躰h  xu蕋 hi謓, c竎 v? tng s? mau ch鉵g t譵 ra!");
		Create_Header();
	end;
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"Phe T鑞g  ho祅 th祅h c竎 bc, c? th? i tho筰 v韎 th? l躰h.");
	else
		Msg2MSAll(MISSION_ID,"Phe Li猽  ho祅 th祅h c竎 bc, c? th? i tho筰 v韎 th? l躰h.");
	end;
	Say("<color=green>"..GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp).."<color>: Nghe n鉯 th? l躰h  xu蕋 hi謓, ngi t譵 trong th玭 xem!",0);
	Clear_Task_NPC(nCamp);
end;
--是不是被选择的那几个人
function Is_The_Selected(nCamp)
	if BT_GetCamp() == nCamp and BT_GetTempData(PTT_SELECTED) == 1 then
		return 1;
	else
		return 0;
	end;
end;
