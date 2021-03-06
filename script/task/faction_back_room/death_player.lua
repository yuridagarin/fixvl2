--作者：严军
--创建日期：07年11月21日14:34
--玩家死亡脚本

g_szThisFile = "\\script\\task\\faction_back_room\\death_player.lua";

Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	WantTo1v1(PlayerIndex,"B筺 b? nh ng?, b筺 c? mu鑞 ti誴 t鬰 kh玭g? C莕 "..NEED_NUM_JIEGUAN.."c竔"..TB_ITEM[1][1]..". дm ngc %d gi﹜...",30,g_szThisFile);
end;

function OnWant(nPIdx, nType)
	if BR_CheckMissionName() ~= 1 then
		return 0;
	end;
	RevivePlayer(0);
	if nType == 0 then	--选择取消或操作超时
		Say("Vt 秈 th蕋 b筰, 產ng a b筺 tr? v?, xin h穣 i......",0);
		process_failure();
		return 0;
	end;
	if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < NEED_NUM_JIEGUAN then
		Say("C莕 c? "..NEED_NUM_JIEGUAN.."c竔"..TB_ITEM[1][1].." m韎 c? th? ti誴 t鬰, vt 秈 th蕋 b筰! ng a b筺 tr? v?, xin h穣 i......",0);
		process_failure();
		return 0;
	end;
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	--成功接关
	Say("Ti誴 t鬰 th祅h c玭g !",0);
	Msg2MSAll(MISSION_ID,"Ti誴 t鬰 th祅h c玭g !");
	BR_RestorePlayer();
	DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],NEED_NUM_JIEGUAN);
	BR_UnInitStageEven(nDiff,nStage);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then	--当前要接的关是1,5,9关
		BR_PauseStage();	--补给阶段
	else	--进入短暂休息期
		--以结束某一关卡作为关卡之间的分界点
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;

function process_failure()
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	Msg2MSAll(MISSION_ID,"Vt 秈 th蕋 b筰 ......");
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
	WriteLog(LOG_HEADER.."Vt 秈 th蕋 b筰. ч kh?: "..nCurDiff..", 秈  "..nCurStage..". T猲: "..GetName()..", c蕄:"..GetLevel()..","..GetMissionV(MV_ROUTE)..", nguy猲 nh﹏: t? vong n猲 kh玭g th? ti誴 t鬰");
end;
