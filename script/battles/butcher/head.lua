Include("\\script\\battles\\battlehead.lua")
Include("\\script\\shinynight_head.lua")
Include("\\script\\online\\zgc_temp_fun.lua")
IncludeLib("SETTING");
MISSIONID = 20
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
sf_aryItems = {
	{ "Ti猲 Th秓 L?", {6,1,71,1,0,0}, 20 },
	{ "Gia B祇 ho祅", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung ho祅", {6,0,5,1,0,0}, 5 },
	{ "Cao Thi觤 ho祅", {6,0,4,1,0,0}, 5 },
	{ "Trng M謓h ho祅", {6,0,1,1,0,0}, 5 },
	{ "Phi T鑓 ho祅", {6,0,6,1,0,0}, 5 },
	{ "чc Ph遪g ho祅", {6,0,10,1,0,0}, 5 },
	{ "B╪g Ph遪g ho祅", {6,0,7,1,0,0}, 5 },
	{ "H醓 Ph遪g ho祅", {6,0,9,1,0,0}, 5 },
	{ "L玦 Ph遪g ho祅", {6,0,8,1,0,0}, 5 },
	{ "Чi L鵦 ho祅", {6,0,3,1,0,0}, 30 },
	{ "Ph竜 hoa", {6,0,11,1,0,0}, 1 },
	{ "Hoa H錸g", {6,0,20,1,0,0}, 2 },
	{ "T﹎ T﹎ Tng 竛h ph?", {6,1,18,1,0,0}, 5 },
	}

SL_AWARDITEM = {
			{2,1,196,1},	--宋方战旗
			{2,1,197,1},	--金方战旗
}

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 45 * 60  * FRAME2TIME; -- 战场时间为45分钟，其中报名15分钟，开战时间30分钟
RUNGAME_TIME = 15 * 60 * FRAME2TIME / TIMER_1; --报名15分钟之后，自动进入战斗阶段
CLOSE_SIGNUP_TIME = 25 * 60 * FRAME2TIME / TIMER_1	--开战后10分钟关闭报名
MAX_MEMBERCOUNT = 100--100
TIME_PLAYER_REV = 10--10 ; -- 玩家死亡或退出游戏再进入时，必须3分钟之后才能离开后营到大营
TIME_PLAYER_STAY = 120	--GetGameTime() 以秒为单位
--以下是某些值记录在MissionValue中的索引位置，通过GetMissionV(MS_XXX)来获得实际的值
MS_butcher = 2;--记录当前产生的是宋军元帅：1；还是辽军元帅：2；还是都产生了：3；

MS_CENTER_X1 = 4;   --区域1：当报名阶段时，禁止玩家离开大营时，将玩家扔回大营的坐标
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--区域2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --区域1：后营内坐标
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --后营外坐标
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--区域2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --记录Timer1执行的次数

MS_MOSTDEATH = 18	--如果一方大将死亡，则为：1（宋）获2（辽）；否则为：0

MS_TOTALPOINT_S = 19		--本次战役结束时请零，记录本次战役宋方总战功
MS_TOTALPOINT_J = 20		--本次战役结束时请零，记录本次战役辽方总战功


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"
--后营到前营的trap脚本
FILE_HOME2CENTERTRAP1 = "\\script\\battles\\butcher\\home2fronttrap1.lua"
FILE_HOME2CENTERTRAP2 = "\\script\\battles\\butcher\\home2fronttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"

--Npc的模板号ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--最小允许的某一阵营的玩家数量，如果在战斗中阵营的玩家数量少于该数目则该阵营判输，无论战功情况如何
MIN_PLAYER_COUNT_LIMIT = 10--10
MIN_PLAYER_COUNT_ING = 1--5
AVERAGE_PLAYERCOUNT = 5--20

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

--MS_NEWSVALUE = 10; --任务中存放新闻变量的地方

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns( wincamp )
	oldPlayerIndex = PlayerIndex
	
	local idx = 0;
	local pidx = 0;
	local tbPlayer = {}
	local tbFailPlayer = {}
	local nCount = 1;
	
	if wincamp == 3 then	--平局
		for i = 1, 500 do
			idx, pidx = GetNextPlayer(MISSIONID, idx, 0);
			if pidx > 0 then
				PlayerIndex = pidx;
				bt_addtotalpoint(350);
				local point = multiple_reward(SYS_BATTLE, 350)
				Say("Tr薾 n祔 2 b猲 h遖 nhau. B筺 nh薾 頲 <color=yellow>"..point.."<color> 甶觤 chi課 c玭g.", 0)
			end;
			
			if idx == 0 then
				break;
			end;
		end;
		PlayerIndex = oldPlayerIndex;
		return
	end;
	
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
		if( pidx > 0 ) then
			tbPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
	 	if (idx == 0) then 
			break
		end;
	end
		--如果结束对方阵营没有玩家，则胜方不给奖励
	local failcamp = 0
	if (wincamp == 1) then
		failcamp = 2
	else
		failcamp = 1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b筰 kh玭g c? ngi ch琲 n猲 phe th緉g kh玭g 頲 ph莕 thng","Nh藅 k? T鑞g Li猽")
		return
	end
	
	nCount = 1;
	for i = 1, 500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp);
		if pidx > 0 then
			tbFailPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
		if idx == 0 then
			break
		end;
	end;
	
	--结束后，所给得战功奖励根据两方玩家的比例送给胜方
--	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
--	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
--	local AVRCUN = (wincamp_count + failcamp_count) / 2
--	local bonuscff1 = 0
--	if (AVRCUN == 0) then
--		bonuscff1 = 1
--		bonuscff2 = 1
--	else
--		bonuscff1 = 1 - ( ( wincamp_count - AVRCUN ) / AVRCUN )
--		bonuscff2 = 1 - ( ( failcamp_count - AVRCUN ) / AVRCUN )
--	end
--	bonuscff1 = floor(1000 * bonuscff1)	--最终所给的奖励几分
--	if( bonuscff1 < 500 ) then
--		bonuscff1 = 500
--	end
--	WriteLog("胜利方送给的奖励战功为\t"..bonuscff1,"宋辽日志")

	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
	local bonus_s = GetMissionV(MS_TOTALPOINT_S);
	local bonus_j = GetMissionV(MS_TOTALPOINT_J);
	local nMax = 0;
	local nMin = 0;
	
	if bonus_s > bonus_j then
		nMax = bonus_s
		nMin = bonus_j
	else
		nMax = bonus_j
		nMin = bonus_s
	end
	
	local nWinBouns = floor(1000 + nMax / wincamp_count)
	local nFailBouns = floor(350 + nMin / failcamp_count)
	local nLevel = 0;
	local nGoldenExp = 0;
	local nExp = 0;
	local nDate = tonumber(date("%y%m%d"));
	for i = 1, getn(tbPlayer) do
		PlayerIndex = tbPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nWinBouns)
		SetTask(763,GetTask(763)+1);	--次数＋１
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 1500000 then
			nGoldenExp = 1500000
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(1000000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(1000000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(1000000*0.8);
			else
				nExp = 1000000;
			end;
			if IsPlayerDeath() == 0 then	--不是死亡状态
				ModifyExp(nExp);
				sExpString = "B筺 nh薾 頲 th猰"..nExp.."甶觤 kinh nghi謒. M鏸 ngi m鏸 ng祔 ch? nh薾 頲 th猰 2 l莕 甶觤 kinh nghi謒.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			Msg2Player("Do phe b筺 gi祅h 頲 th緉g l頸, nh薾 頲 ban thng c馻 nguy猲 so竔,"..nGoldenExp.."甶觤 s鴆 kh醗 nhanh ch鉵g i th祅h kinh nghi謒."..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nWinBouns)
		--AddItem(SL_AWARDITEM[wincamp][1], SL_AWARDITEM[wincamp][2], SL_AWARDITEM[wincamp][3], SL_AWARDITEM[wincamp][4])
		Say("Phe ta i th緉g tr薾 n祔. B筺 nh薾 頲 <color=yellow>"..point.."<color> 甶觤 chi課 c玭g.", 0)
	end
	sExpString = "";
	for i = 1, getn(tbFailPlayer) do
		PlayerIndex = tbFailPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nFailBouns)
		SetTask(763,GetTask(763)+1);	--次数＋１
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 500000 then
			nGoldenExp = 500000
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(300000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(300000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(300000*0.8);
			else
				nExp = 300000;
			end;
			if IsPlayerDeath() == 0 then	--不是死亡状态
				ModifyExp(nExp);
				sExpString = "B筺 nh薾 頲 th猰"..nExp.."甶觤 kinh nghi謒. M鏸 ngi m鏸 ng祔 ch? nh薾 頲 th猰 2 l莕 甶觤 kinh nghi謒.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			Msg2Player("Do phe b筺 thua cu閏, nguy猲 so竔 ch th﹏ ch? o,"..nGoldenExp.."甶觤 s鴆 kh醗 nhanh ch鉵g i th祅h kinh nghi謒. Hy v鋘g n? l鵦 h琻!"..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nFailBouns)
		Say("B筺  anh d騨g chi課 u, l藀 nhi襲 c玭g tr筺g. в kh輈h l? tng s?, Th竛h Thng anh minh ban thng <color=yellow>"..point.."<color> 甶觤 chi課 c玭g.", 0);
	end;
	
	PlayerIndex = oldPlayerIndex
end

function sf_winbouns_old(wincamp)	--作废
	--如果结束对方阵营没有玩家，则胜方不给奖励
	if (wincamp == 1) then
		failcamp =2
	else
		failcamp =1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b筰 kh玭g c? ngi ch琲 n猲 phe th緉g kh玭g 頲 ph莕 thng","Nh藅 k? T鑞g Li猽")
		return
	end
	
	--结束后，所给得战功奖励根据两方玩家的比例送给胜方
	local CAMP1CUN = GetMSPlayerCount(MISSIONID, wincamp)
	local CAMP2CUN = GetMSPlayerCount(MISSIONID, failcamp)
	local AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	bonuscff1 = floor(1000 * bonuscff1)	--最终所给的奖励几分
	WriteLog("Ph莕 thng chi課 c玭g phe th緉g nh薾 頲 l?:"..bonuscff1,"Nh藅 k? T鑞g Li猽")
	
	sf_itemcount = getn(sf_aryItems)
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
	 	if (idx == 0) then 
			break
		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
	   		AddRepute(3);			
	   		Msg2Player("B筺 頲 th猰 3 甶觤 danh v鋘g!")
			bt_addtotalpoint(bonuscff1)
			Msg2Player("B筺 nh薾 頲 "..bonuscff1.."甶觤 chi課 c玭g!")
			Say("Ch骳 m鮪g b筺 gi祅h 頲 chi課 th緉g trong tr薾 chi課 n祔, b筺 頲 th猰 <color=yellow>3<color> 甶觤 danh v鋘g v? <color=yellow>"..bonuscff1.."<color> 甶觤 chi課 c玭g + <color=yellow>Huy襫 Tinh Kho竛g Th筩h<color>!", 0)
				if (GetLevel() >= 40 and GetLevel() < 60) then
					AddItem(6,1,147,1,0,0);
				end
				if (GetLevel() >= 60 and GetLevel() < 90) then
					AddItem(6,1,147,2,0,0);
				end
				if (GetLevel() >= 90 ) then
					AddItem(6,1,147,3,0,0);
				end
				randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#> Ch骳 m鮪g b筺 nh薾 頲 ph莕 thng"..szItemName);
			end;
 		end;
	end
end;

function but_addmissionpoint(totalpoint)
print( "but_addmissionpoint=="..totalpoint )
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_S)=="..GetMissionV(MS_TOTALPOINT_S))
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_J)=="..GetMissionV(MS_TOTALPOINT_J))
	end
end

function GameOver()
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	WriteLog(szGAME_GAMELEVEL[ lsf_level ].."battle is ending\tsongmemcount\t"..GetMSPlayerCount(MISSIONID, 1).."\tliaomemcount\t"..GetMSPlayerCount(MISSIONID, 2).."\tsongpoint\t"..bonus_s.."\tliaopoint\t"..bonus_j,"Nh藅 k? T鑞g Li猽")
	
	--更新宋辽相关的世界排名榜

--	--模式总排行榜

		BT_SortWorldLadder(PL_TOTALPOINT, 10147)
		BT_SortWorldLadder(PL_KILLPLAYER, 10148)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10149)
		BT_SortWorldLadder(PL_GETITEM, 10150)

	--模式加等级排行榜
--		if (lsf_level == 3) then
--			BT_SortWorldLadder(PL_KILLPLAYER, 10151)
--			BT_SortWorldLadder(PL_MAXSERIESKILL, 10152)
--			BT_SortWorldLadder(PL_GETITEM, 10153)
--			BT_SortWorldLadder(PL_TOTALPOINT, 10154)
		if (lsf_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10155)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10156)
			BT_SortWorldLadder(PL_GETITEM, 10157)
			BT_SortWorldLadder(PL_TOTALPOINT, 10158)
		elseif (lsf_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10159)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10160)
			BT_SortWorldLadder(PL_GETITEM, 10161)
			BT_SortWorldLadder(PL_TOTALPOINT, 10162)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (lsf_level == 1) then
		resultstr = "Khu v鵦 s? c蕄"
	elseif (lsf_level == 2) then
		resultstr = "Khu v鵦 cao c蕄"
	end
	
	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."Chi課 u k誸 th骳, t鎛g chi課 c玭g hai phe T鑞g Li猽 nh薾 頲 l?"..bonus_s..":"..bonus_j..", phe T鑞g gi祅h chi課 th緉g!";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
			BT_ReportResult(1)
			RecordBTCount_Win(1)		--在每个人任务变量里记录它此次宋辽战场胜负状况
			sf_winbouns(1)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."Chi課 u k誸 th骳, t鎛g chi課 c玭g hai phe T鑞g Li猽 nh薾 頲 l?"..bonus_s..":"..bonus_j..", phe Li猽 gi祅h chi課 th緉g!"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
			BT_ReportResult(2)
			RecordBTCount_Win(2)	--在每个人任务变量里记录它此次宋辽战场胜负状况
			sf_winbouns(2)
		else
			resultstr = resultstr.."Chi課 u k誸 th骳, t鎛g chi課 c玭g hai phe T鑞g Li猽 nh薾 頲 l?"..bonus_s..":"..bonus_j..", chi課 d辌h l莕 n祔 b蕋 ph﹏ th緉g b筰"
			Msg2MSAll(MISSIONID, resultstr)
			sf_winbouns(3);	--平局
			WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
		end;

		AddGlobalNews(resultstr)

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."Th阨 gian khai chi課  n, nh璶g s? ngi hai phe kh玭g t y猽 c莡. H駓 tr薾 chi課!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
		AddGlobalNews(resultstr)
	elseif( GetMissionV(MS_MOSTDEATH) == 2 ) then
		resultstr = resultstr.."Do qu﹏ s? phe Li猽 o ng? trong chi課 d辌h n猲 phe T鑞g gi祅h chi課 th緉g!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
		AddGlobalNews(resultstr)
		BT_ReportResult(1)
		RecordBTCount_Win(1)	--在每个人任务变量里记录它此次宋辽战场胜负状况
		sf_winbouns(1)
	elseif( GetMissionV(MS_MOSTDEATH) == 3 ) then
		resultstr = resultstr.."Do qu﹏ s? phe T鑞g o ng? trong chi課 d辌h n猲 phe Li猽 gi祅h chi課 th緉g!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh藅 k? T鑞g Li猽")
		AddGlobalNews(resultstr)
		BT_ReportResult(2)
		RecordBTCount_Win(2)	--在每个人任务变量里记录它此次宋辽战场胜负状况
		sf_winbouns(2)
	end
	Msg2Global(resultstr)
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[getn(tbPlayer)+1] = pidx
		end
		if (idx <= 0) then
	 		break
	 	end
	end 	

 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	Xmas_prize_get(1)	--圣诞奖励
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetCreateTeam(0);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0, 0)
		level = BT_GetGameData(GAME_LEVEL);
		UseScrollEnable(1);
		local temp_mapid,temp_posx, temp_posy = bt_getsignpos(l_curcamp)
		local campname = ""	
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[lsf_level], tbGAME_SIGNMAP[lsf_level])
			NewWorld(bt_getsignpos(1))
			campname = "T鑞g\t"
		else	
			SetRevPos(tbGAME_SIGNMAP[lsf_level], (tbGAME_SIGNMAP[lsf_level] + 1))
			NewWorld(bt_getsignpos(2))
			campname = "Li猽\t"
		end;
		WriteLog( campname..GetName().."\tЪng c蕄\t"..GetLevel().."\tM玭 ph竔\t"..GetPlayerRoute().."\t觤 t輈h l騳 v遪g n祔\t"..BT_GetData( PL_KILLPLAYER ),"Nh藅 k? T鑞g Li猽" )
		SetTempRevPos( temp_mapid, temp_posx * 32, temp_posy * 32 )
		SetLogoutRV(0);
	end;
end;

-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Binh l鵦 qu﹏ ta hi謓   ti猽 di謙 gi芻 Li猽, v蒼 c遪 nhi襲 c? h閕 l藀 c玭g! Anh h飊g! Xin i l莕 sau!")
		elseif (camp==2) then
			Msg2Player("Binh l鵦 qu﹏ ta hi謓   ti猽 di謙 gi芻 T鑞g, v蒼 c遪 nhi襲 c? h閕 l藀 c玭g! Anh h飊g! Xin i l莕 sau!")
			return
		end
	end
	
	local ownmscount = GetMSPlayerCount(MISSIONID, camp)
	local countstr = ""
	if( camp == 1 ) then
		emymscount = GetMSPlayerCount(MISSIONID, 2)
		countstr = "S? ngi b竜 danh hai phe vt qu?"..AVERAGE_PLAYERCOUNT..", hi謓 s? ngi phe T鑞g qu? nhi襲. B筺 kh玭g gia nh藀 頲!"
	else
		emymscount = GetMSPlayerCount(MISSIONID, 1)
		countstr = "S? ngi b竜 danh hai phe vt qu?"..AVERAGE_PLAYERCOUNT..", hi謓 s? ngi phe Li猽 qu? nhi襲. B筺 kh玭g gia nh藀 頲!"
	end
	
	if( (ownmscount - emymscount) >= AVERAGE_PLAYERCOUNT ) then
		Talk(1, "", countstr)
		return
	end
	
	local timer1 = BT_GetTimer1()
	if (timer1 >= CLOSE_SIGNUP_TIME and BT_GetData(PL_KEYNUMBER) ~= BT_GetGameData(GAME_KEY)) then
		Talk(1, "", "Ti襫 phng Nh筺 M玭 quan 產ng trong h錳 k辌h li謙, 阯g v祇 chi課 trng c馻 m鏸 b猲  b? phong t醓. Vi謓 qu﹏ ch? c? th? l璾 l筰 n琲 n祔 i tin chi課 b竜!")
		Msg2Player("Khai chi課 頲 10 ph髏, 阯g n chi課 trng Nh筺 M玭 Quan  b? phong t醓.")
		return
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","B鋘 Li猽 c萿 c竎 ngi x﹎ ph筸 b? c鈏 ta, gi誸 h筰 ng b祇 ta, h薾 cao nh? n骾! Ta th? s? quy誸 chi課 n c飊g r鯽 h薾 cho Чi T鑞g!")
		else
			Talk(1,"","Li猽 Qu鑓 ch髇g ta tng s? ngi ngi u thi謓 chi課. B鋘 T鑞g Qu鑓 th鑙 n竧 kia sao  s鴆 ch鑞g tr?! Ha! Ha! Ha!")
			return
		end
	end

if (result == 0) then
--	if (GetCash() >= 3000) then
--		Pay(3000)
		BT_LeaveBattle() -- 清除玩家客户端当前的排名数据
		BT_ClearPlayerData()
--		Msg2Player("战场提示：战场中可以按键盘左上角的～键切换显示当前战斗的情况");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	else
--		Say("对不起，参加本次宋辽大战，你必须付报名费3000两", 0)
--		return 
--	end
	if( camp == 1 ) then
		Msg2Player("Hoan ngh猲h hi謕 kh竎h gia nh藀 T鑞g qu﹏. Hi謓 Li猽 binh ch璦 xu蕋 hi謓, tng s? h穣 t筸 ngh? ng琲. ьi hi謚 l謓h c飊g x玭g l猲 gi誸 gi苩!")
	else
		Msg2Player("Hoan ngh猲h hi謕 kh竎h gia nh藀 Li猽 qu﹏. Hi謓 Li猽 binh ch璦 xu蕋 hi謓, tng s? h穣 t筸 ngh? ng琲. ьi hi謚 l謓h c飊g x玭g l猲 gi誸 gi苩!")
	end
end

if( result == 1 and GetMissionV(MS_STATE) == 1 ) then
	if( camp == 1 ) then
		Msg2Player("Hoan ngh猲h hi謕 kh竎h gia nh藀 T鑞g qu﹏. Hi謓 Li猽 binh ch璦 xu蕋 hi謓, tng s? h穣 t筸 ngh? ng琲. ьi hi謚 l謓h c飊g x玭g l猲 gi誸 gi苩!")
	else
		Msg2Player("Hoan ngh猲h hi謕 kh竎h gia nh藀 Li猽 qu﹏. Hi謓 Li猽 binh ch璦 xu蕋 hi謓, tng s? h穣 t筸 ngh? ng琲. ьi hi謚 l謓h c飊g x玭g l猲 gi誸 gi苩!")
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)
if (BT_GetData(PL_CURRANK) > 0) then
	Title_AddTitle(BT_GetData(PL_CURRANK), 0, 399999)
	Title_ActiveTitle(BT_GetData(PL_CURRANK))
end

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().."  gia nh藀 phe T鑞g."
	EnterChannel(PlayerIndex, "T鑞g"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."  gia nh藀 phe Li猽."
	EnterChannel(PlayerIndex, "Li猽"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] )
else
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] + 1)
end

NewWorld(sf_mapid, posx, posy);
UseScrollEnable(0);	--禁止使用回城符
SetLogoutRV(1);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(1);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))
BT_SetData( PL_MAXSERIESKILL, 0 )
--BT_SetData( PL_SERIESKILL, 0 )  --不要清0,加入新战场的时候才清
--BT_SetData( PL_KILLPLAYER, 0 )  --同上
BT_SetData( PL_TOTALPOINT, 0 )
BT_SetData( PL_LEAVETIME, 0 )

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf();
BT_BroadBattleDesc();
BT_ViewBattleStart();
SetFightState(0)
Msg2MSAll(MISSIONID,str);
SetPKFlag(1, camp)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");

Say( "Чi chi課 Nh筺 M玭 quan: <enter>M鏸 l莕 nh b筰 m鏸 i phng s? nh薾 頲 甶觤 chi課 c玭g nh蕋 nh. Cu鑙 c飊g, c╪ c? v祇 t鎛g chi課 c玭g c馻 hai b猲  ph﹏ nh th緉g b筰. N誹 h遖 甶觤 nhau th? phe n祇 c? s? ngi tham chi課 (bao g錷 ? h藆 doanh) 輙 h琻 1 ngi s? b? x? thua. <enter> Hi謓 phe T鑞g c遪:"..GetMSPlayerCount(MISSIONID, 1).." ngi; Phe Li猽 c遪:"..GetMSPlayerCount(MISSIONID, 2).." ngi", 0 )

end;
------------------------------------------------------------------

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--在每个人任务变量里记录它此次宋辽战场胜负状况
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: T鑞g Li猽 k誸 th骳, Log th緉g thua b? l鏸!")
		return
	end
	idx = 0
	pidx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	else
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	end
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	pidx = 0
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
			PlayerIndex = pidx
			if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
			elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
			end
		end
		if (idx == 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local temprevposx = 0
	local temprevposy = 0
	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X1) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y1) * 32
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X2) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y2) * 32
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
			print("but_pop2home  but_pop2home  but_pop2home  but_pop2home")
			SetPos(floor(x/32), floor(y/32))
			SetTempRevPos(SubWorldIdx2ID(SubWorld) , temprevposx, temprevposy);
			SetFightState(1)
			Msg2Player("B筺 kh玭g th? ti誴 t鬰 l璾 l筰 ? H藆 doanh.")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("B筺 c? th? l璾 l筰 ? H藆 doanh"..remain_time.." Gi﹜ ")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end

function sj_getfrontpos( camp )
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area = 0
	if( camp == 1 ) then
		area = BT_GetGameData( GAME_CAMP1AREA )
	else
		area = BT_GetGameData( GAME_CAMP2AREA )
	end
	local area_section = "Area_"..area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    frontpos = GetIniFileData(mapfile, area_section , "frontpos")
    x,y =bt_str2xydata(frontpos)
    return x, y
end

--战役进行中，如果一方人数不满足最小人数限制，则判输
function wl_search_memcount()
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)
	
	if( group1count >= MIN_PLAYER_COUNT_ING and group2count >= MIN_PLAYER_COUNT_ING ) then
		return
	end
	
	if( group1count > group2count ) then
		SetMissionV(MS_MOSTDEATH, 2)
	elseif( group1count < group2count ) then
		SetMissionV(MS_MOSTDEATH, 3)
	end
	return 1
end

function sl_clearbattledata()	--本次战斗结束后，清除战场信息
	for i = 1, 14 do
		BT_SetGameData( i, 0 )
	end
end