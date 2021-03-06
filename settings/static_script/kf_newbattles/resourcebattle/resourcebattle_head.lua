Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\position.lua");
		
MAX_RESOURCE_COUNT = 110;
		
BATTLE_TYPE = RESOURCE_ID;	--战场类型

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1572,3555},
	[LIAO_ID] = {MAPID_LIAO,1766,3182},
};

DIGGING_ACTION_ID = 890;	--挖粮草动作ID

DEATH_SCRIPT = "\\settings\\static_script\\kf_newbattles\\resourcebattle\\playerdeath.lua";

CATERAN_GROUP_SONG = 23;	--山贼NPC任务组
CATERAN_GROUP_LIAO = 24;

CATERAN_COUNT = getn(tCateranSong);

TOE_MAX_USE_TIMES = 45;	--锄头最大使用次数

--得到随机资源
function Get_Random_Resource(nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	local nCamp = BT_GetCamp();
	local nRandomNum = random(1,100);
	if nRandomNum <= 60 then
		Get_Resource(1,nMultiple);	--初级粮草
	elseif nRandomNum <= 80 then
		Get_Resource(2,nMultiple);	--中级粮草
	elseif nRandomNum <= 90 then
		Msg2MSGroup(MISSION_ID,"Ngi ch琲"..GetName().."t筰 Nh筺 M玭 Quan-Th秓 c鑓 chi課 o b韎 b鮝 b穒 秐h hng n m玦 trng n猲 b? th? d﹏ truy 畊鎖, ch? tng s? n gi秈 c鴘.",nCamp);
		local npcIndex = CreateNpc("Ho祅 trng Th? d﹏","Th? d﹏ h? r鮪g",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\environmentalist_death.lua");
	else
		Msg2Player("Ngi v蕋 v? o b韎 v蒼 kh玭g t譵 頲 g?");
	end;
end;
--得到某种固定资源
function Get_Resource(nType,nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	AddItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nMultiple);
	Msg2Player("B筺 nh薾 頲 "..nMultiple.." ph莕"..tBattleItem[nType][1]);
end;
--粮草增加
function Add_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)+nResNum);
end;
--粮草减少
function Dec_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)-nResNum);
	if GetMissionV(MV_RESOURCE_SONG+nCamp-1) < 0 then
		SetMissionV(MV_RESOURCE_SONG+nCamp-1,0);
	end;
end;
--得到粮草的数量
function Get_ResCount(nCamp)
	return GetMissionV(MV_RESOURCE_SONG+nCamp-1);
end;
--由粮草NPC坐标得到粮草NPC的位置索引
--function Get_ResIndex_ByPos2(nMapX,nMapY)	
--	local nX = ceil(floor(abs((abs(nMapX-1605)-1))/7)/2);	--这就是没有好好分析问题所导致的复杂公式
--	local nY = ceil(floor(abs((abs(nMapY-3240)-1))/13)/2);
--	return 11*nX+nY+1;
--end;
--由粮草NPC坐标得到粮草NPC的位置索引
function Get_ResIndex_ByPos(nMapX,nMapY)
	local nX = floor((nMapX-1598)/14);	--这个公式简单明了
	local nY = floor((nMapY-3227)/26);
	return 11*nX+nY+1;
end;
--由粮草NPC的位置索引得到粮草NPC的坐标
function Get_ResPos_ByIndex(nIndex)
	local nMapX,nMapY = 0,0;	
	nMapX = floor((nIndex-1)/10)*14+1605;
	nMapY = mod((nIndex-1),10)*26+3240;
	return nMapX,nMapY;
end;
--刷新粮草区域
function Reflash_Res()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return
	end;
	local nGroup,nBit = 0,0;
	for i=1,MAX_RESOURCE_COUNT do
		nGroup = floor(i/32);
		nBit = mod((i-1),32)+1;
		if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,0));
		end;
	end;
end;
--创建粮草NPC
function Create_Res_Npc(nCount)
	if nCount <= 0 then
		return
	end;
	if nCount == nil then
		nCount = 1;
	end;
	for i=1,nCount do
		local nRandPos = random(1,MAX_RESOURCE_COUNT);	
		local nMapX,nMapY = Get_ResPos_ByIndex(nRandPos);
		local npcIndex = CreateNpc("Khu v鵦 lng th秓 cao c蕄","Lng th秓",MAPID,nMapX,nMapY,-1,1,1,20);
		SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\resource_npc.lua");
	end;
end;
--创建军需官
function Create_QuarterMaster()
	local sCampName1,sCampName2 = "M? Lng Quan-T鑞g","M? lng quan phe Li猽";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "M? lng quan phe Li猽";
		sCampName2 = "M? Lng Quan-T鑞g";
	end;
	local npcIndex = CreateNpc("Vng An Th筩h",sCampName1,MAPID,1607,3494);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\quartermaster_npc.lua");
 	npcIndex = CreateNpc("Vng An Th筩h",sCampName2,MAPID,1720,3248);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\quartermaster_npc.lua");
end;
--触发一次山贼劫后营事件
function Create_Cateran_Even()
	local nSongStone = GetMissionV(MV_STONE_COUNT_SONG);
	local nLiaoStone = GetMissionV(MV_STONE_COUNT_LIAO);
	if nSongStone > nLiaoStone then
		Msg2MSAll(MISSION_ID,"Huy襫 thi誸 kho竛g th筩h i b猲 giao n閜 v遪g n祔 l?: T鑞g"..nSongStone.." , Li猽 "..nLiaoStone..", h藆 doanh Li猽 xu蕋 hi謓 m s琻 t芻 產ng cp b鉩 lng th秓.");
		Create_Cateran(SONG_ID,CATERAN_COUNT);
	elseif nSongStone < nLiaoStone then
		Msg2MSAll(MISSION_ID,"Huy襫 thi誸 kho竛g th筩h i b猲 giao n閜 v遪g n祔 l?: T鑞g"..nSongStone.." , Li猽 "..nLiaoStone..", h藆 doanh T鑞g xu蕋 hi謓 m s琻 t芻 產ng cp b鉩 lng th秓.");
		Create_Cateran(LIAO_ID,CATERAN_COUNT);
	else
		Msg2MSAll(MISSION_ID,"Huy襫 thi誸 kho竛g th筩h i b猲 giao n閜 v遪g n祔 u l?"..nSongStone..", m s琻 t芻 dng nh? ch璦 c? ng t躰h");
	end;
	SetMissionV(MV_STONE_COUNT_SONG,0);
	SetMissionV(MV_STONE_COUNT_LIAO,0);
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--初始化战鼓数量
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--初始化战鼓数量
end;
--创建后营山贼
function Create_Cateran(nCamp,nCount)
	local tPosTable = {tCateranSong,tCateranLiao};
	local nEnemyCamp = 3 - nCamp;
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = tPosTable[3-nCampPlace];
	if nCount > getn(tPos) then
		BT_ShowDebugInfor("Create_Cateran b竜 l鏸, tham s? nCount phi ph竝");
		return 0;
	end;
	local nNpcIndex = 0;
	for i=1,nCount do
		nNpcIndex = CreateNpc("S琻 t芻 l﹗ la","S琻 t芻 ("..tCampNameZ[nCamp]..")",MAPID,tPos[i][1],tPos[i][2]);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\cateran_death.lua");
		AddGroupUnit(CATERAN_GROUP_SONG+nCamp-1,nNpcIndex);
	end;
	SetMissionV(MV_SP_TIMER_LOOP,CATERAN_TIMER_LOOP);	--60秒特殊事件
	SetMissionV(MV_SP_TIMER_STATE,TM_STATE_CATERAN_SONG+nCamp-1);
	StartMissionTimer(MISSION_ID,CATERAN_TIMER_ID,CATERAN_TIME);
	Msg2MSGroup(MISSION_ID,"T譶h hu鑞g kh萵 c蕄: H藆 doanh phe ta xu蕋 hi謓 nhi襲 s琻 t芻, n誹 kh玭g k辮 th阨 ng╪ ch苙, 15 gi﹜ sau kho lng s? b? t鎛 th蕋 nghi猰 tr鋘g.",nEnemyCamp);
end;

function Use_Hoe()
	BT_SetData(PTNC_USE_HOE_TIMES,BT_GetData(PTNC_USE_HOE_TIMES)+1);
	if BT_GetData(PTNC_USE_HOE_TIMES) >= TOE_MAX_USE_TIMES then
		DelItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1);
		Msg2Player("Cu鑓 c馻 b筺  h醤g!");
		return 1;	--已损坏
	end;
	Msg2Player("Cu鑓 c馻 b筺 c遪 s? d鬾g 頲 "..(TOE_MAX_USE_TIMES-BT_GetData(PTNC_USE_HOE_TIMES)).." l莕");
	return 0;	--还可以用
end;