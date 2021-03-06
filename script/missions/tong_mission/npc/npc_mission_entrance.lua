--create date:2007-07-06
--author:yanjun
--describe:帮会关卡入口NPC，每个城市各对应一个，功能是一样的，只是进入的场地不一样
Include("\\script\\missions\\tong_mission\\main_function.lua");
Include("\\script\\missions\\tong_mission\\award.lua");
Include("\\script\\lib\\writelog.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua";
g_szInfoHeader = "<color=green>T? Quang C竎 L穙 Nh﹏<color>: ";
g_nSvrPlayerCount = 0;	--保存服务器人数
g_nLastCheckTime = 0;	--保存上次检测服务器人数的时间点
g_CHECKINTERVAL = 10*60;	--检测服务器人数的最小间隔
MAX_SEL_PER_PAGE = 4;
function main()
	if GetGlbValue(GLB_CLEAR_FIELD) == 0 then
		CloseMissionEx(TONG_MISSIONEX);	--先关
		OpenMissionEx(TONG_MISSIONEX,1);	--再开
		TM_ClearAllFieldState();	--再清除
		SetGlbValue(GLB_CLEAR_FIELD,1);
	end;
	local selTab = {
			"Ch鋘 chi課 trng T? Quang C竎/select_area",
			"Ta mu鑞 i 甶觤 t輈h l騳 l蕐 甶觤 kinh nghi謒/get_exchange_exp",
			"фi ph莕 thng T? Quang C竎/get_award",
			"B鑙 c秐h/know_background",
			"Gi韎 thi謚 quy t綾 T? Quang C竎/know_stage_reflash",
			"H筺 ch? c馻 T? Quang C竎/know_stage_restriction",
			"Gi韎 thi謚 萵 s? T? Quang C竎/know_boss_info",
			"Nh鱪g 甶襲 ch豱h c馻 T? Quang C竎/know_new_rule",
			"Ta ch? ti謓 th? gh? ngang qua th玦./nothing"
			}
	if DEBUG_VERSION == 1 then
		tinsert(selTab,5,"X鉧 d? li謚 Relay c馻 b鎛 bang (Test)/clear_relay_data");
		tinsert(selTab,5,"дn th祅h kh竎 xem th? (Test)/go_to_another_city");
	end;
	Say(g_szInfoHeader.."T? Quang C竎 l? c? a th莕 b?, theo truy襫 thuy誸 l? n琲 萵 n竨 c馻 K? L﹏.",getn(selTab),selTab);
end;

function know_new_rule()
	Talk(1,"main",g_szInfoHeader.."Nh鱪g ngi ngo筰 bang c? th? gia nh藀 v韎 t? c竎h ti誴 vi謓  gi髉  b鎛 bang vt 秈, ch? c莕 頲 s? ng ? c馻 阯g ch? tr? l猲 l? c? th? vt 秈 \n    Trong m閠 tu莕 ngi ch琲 vt 秈 l莕 u ti猲 s? 頲 to祅 b? 甶觤 t輈h l騳, l莕 th? hai s? gi秏 2/5, l莕 th? 3 gi秏 c遪 1/5, l莕 th? 4 s? gi秏 c遪 1/10, sau l莕 th? 5 tr? 甶 s? c遪 1/10.\n    Khi th鵦 l鵦 bang h閕 kh玭g  c? th? ch鋘 th? c玭g b? 甶 2 b鉵g h? v? m玭 ph竔. Ch鴆 n╪g n祔 ch? hi謚 l鵦 ? 秈 1 n 4.");
end;

function know_background()
	Talk(1,"know_background2",g_szInfoHeader.."L骳 tr阨 t m韎 s? khai, t蕋 c? m鋓 tinh hoa c馻 ﹎ dng t輈h t? th祅h th莕 th? Nguy謙 K? L﹏ tr蕁 gi? Th竔 H?. \nCho n l骳 b秐  s琻 h? x? t綾 hi謓 th﹏ ti誸 l? thi猲 c?, th莕 minh n鎖 gi薾 x? n竧 b秐 , v? vua T鑞g cao t? b筼 b謓h m? ch誸. Nh﹏ d辮 T? 萵 T? Quang 甶 ngang n猲 nhi襲 l莕 Чi T鑞g c莡 vi謓 m? kh玭g th祅h.");
end;
function know_background2()
	Talk(1,"know_background3",g_szInfoHeader.."M閠 l莕 n鱝 T? 萵 l筰 thay i quy誸 nh v? g緉 l筰 b秐  s琻 h? x? t綾, kh玭g ng? r籲g vi謈 n祔 gi髉  cho K? L﹏ ? Th竔 H? h錳 sinh. T? 萵 th蕐 kh玭g n? gi誸 甶 th莕 th? n猲  甧m K? L﹏ v? T? Quang C竎 c鴘 ch鱝, nh璶g vi謈 c鴘 ch鱝 l筰 gi髉 cho th? t輓h c馻 K? L﹏ n鎖 l猲. Bi誸 m譶h kh玭g ch鑞g  n鎖 ma thu藅 c馻 K? L﹏. Ch? c遪 m閠 c竎h l? nh? s? gi髉  c馻 v? l﹎ tr猲 thi猲 h? kh綾 ch? K? L﹏ v? a n? v? Th竔 H?");
end;
function know_background3()
	Talk(1,"main",g_szInfoHeader.."K? L﹏ thu閏 linh th? c馻 tr阨 t, s鴆 m筺h v? song. в t譵 ra 頲 v? v? s? ch﹏ ch輓h, T? Quang T? 萵  t c竎 秈 th? th竎h ng th阨 tuy猲 b? v韎 c竎 v? v? l﹎ r籲g s? c? ph莕 thng p t? ? m鏸 c鯽 秈.");
end;

function know_stage_reflash()
	Talk(1,"main",g_szInfoHeader.."M鏸 bang h閕 c? th? nhi襲 l莕 chi課 u v韎 c鯽 秈 , nh璶g ch? c? 1 c? h閕 vt 秈 duy nh蕋. V? d?: Sau khi th祅h c玭g vt 秈 xong, l莕 sau ti誴 t鬰 vt 秈 s? b総 u ? 秈 th? 3 cho n l骳 c鯽 秈 thay lt. \nC鯽 秈 s? thay lt v祇 l骳 12 gi? ng祔 ch? nh藅, m鏸 tu莕 v祇 11:55 ch? nh藅 t蕋 c? ngi ch琲 trong 秈 s? b? cng ch? y ra ngo礽. Th阨 gian i lt s? l? 10 ph髏, sau khi i lt xong ngi ch琲 ti課 v祇 s? b総 u t? 秈 th? 1.");
end;

function know_stage_restriction()
	Talk(1,"know_stage_restriction2",g_szInfoHeader.."	K輈h ho箃 khu v鵦 秈: M閠 bang h閕 ch? c? th? k輈h ho箃 頲 1 khu v鵦 秈, k輈h ho箃 ph秈 do bang ch? ph? bang ch? ho芻 trng l穙 t? i  8 ngi c蕄 75, sau  nh鱪g ngi trong bang c? c蕄 75 tr? l猲 s? v祇 theo sau. \n H筺 ch?: N閕 阯g v? ngo筰 阯g c馻 秈 t鑙 產 60 ngi. N閕 阯g (khu v鵦 BOSS) t鑙 產 ch? 頲 16 ngi, h? ph竔 kh玭g 頲 qu? 3 ngi. Th阨 gian chu萵 b? xong n誹 trong 秈 c? 輙 h琻 8 ngi th? 秈 s? t? ng ng c鯽.");
end;
function know_stage_restriction2()
	Talk(1,"main",g_szInfoHeader.."H筺 ch? i ngi: Khi th阨 gian BOSS ch璦 頲 k輈h ho箃 th? ngi ch琲 ? n閕 阯g c? th? i t飝 th輈h, nh璶g c莕 ph秈 ph? h頿 甶襲 ki謓 s? ngi v? h? ph竔. Sau khi BOSS 頲 k輈h ho箃 th? m鏸 2 ph髏 m韎 c? th? i 頲 ngi t? ngo筰 阯g v祇 n閕 阯g (ph秈 ph? h頿 甶襲 ki謓 s? ngi v? h? ph竔), v? v藋 xin h穣 c萵 tr鋘g i ngi.");
end;

function know_boss_info()
	local selTab = {
				"B鉵g h? v?/#know_boss_detail_info(0)",
				"秈 1: Li Y猲/#know_boss_detail_info(1)",
				"秈 2: B? Ki襲/#know_boss_detail_info(2)",
				"秈 3: Phong Dng, V﹏ Th飝/#know_boss_detail_info(3)",
				"秈 4: мa Huy襫/#know_boss_detail_info(4)",
				"秈 5: Ti誸 Ho祅h Th?/#know_boss_detail_info(5)",
				"秈 6: Thng C? H醓 K? L﹏ H醓 V?, Thng C? H醓 K? L﹏ L璾 Quang/#know_boss_detail_info(6)",
				"Ta ch? ti謓 阯g h醝 ch琲!/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;

function select_area()
	local selTab = {};
	for i=1,MAX_AREA do
		tinsert(selTab,format("Khu v鵦 %d/#select_field(%d)",i,i));
	end;
	tinsert(selTab,"Tr? l筰/main");
	local nSvrPlayerCount = 0;
	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = gf_GetServerPlayerCount();
	end;
	local szSvrState = "";
	if nSvrPlayerCount <= 300 then
		szSvrState = " <color=green>nh?<color>";
	elseif nSvrPlayerCount <= 800 then
		szSvrState = " <color=yellow>v鮝<color>";
	else
		szSvrState = " <color=red>l韓<color>";
	end;
	Say(g_szInfoHeader.."Hi謓 t筰 nh﹏ kh萿 th祅h th? n祔 c? 竝 l鵦:"..szSvrState..",  cho qu? i hi謕 ti課 h祅h vt 秈 ? tr筺g th竔 t鑤 nh蕋, ki課 ngh? n猲 ch鋘 nh鱪g th祅h ph? c? lng ngi 輙. Xin m阨 ch鋘 khu v鵦 mu鑞 ti課 v祇: ",getn(selTab),selTab);
end;

function select_field(nAreaIdx)
	local selTab = {};
	local szFieldState = "";
	local nCurStage = 0;
	for i=1,MAX_FIELD do
		nMisstionState,nCurStage,szFieldState = TM_GetFieldInfo(nAreaIdx,i);
		szFieldState = sf_Replace(szFieldState,"/","-");
		szFieldState = sf_Replace(szFieldState,"|","-");
		szFieldState = sf_Replace(szFieldState,":","-");
		nCurStage = max(nCurStage,1);
		if nMisstionState == MS_STATE_IDEL then
			tinsert(selTab,format("Khu v鵦 %d: 產ng tr鑞g/#enter_field(%d,%d)",i,nAreaIdx,i));
		else
			tinsert(selTab,format("Khu v鵦 %d: %s(秈 %d)/#enter_field(%d,%d)",i,szFieldState,nCurStage,nAreaIdx,i));
		end;
	end;
	tinsert(selTab,"Xin m阨 ch鋘 khu v鵦 kh竎/select_area");
	Say(g_szInfoHeader.."Xin m阨 ch鋘 khu v鵦 m? i hi謕 mu鑞 v祇:",getn(selTab),selTab);
end;
--进入流程已经改得乱七八糟了！！！！
function enter_field(nAreaIdx,nFieldIdx)
	if GetLevel() < MIN_LEVEL then
		Talk(1,"",g_szInfoHeader.."Чi hi謕 ph秈 t n c蕄 <color=yellow>"..MIN_LEVEL.."<color> tr? l猲 m韎 c? th? vt 秈.");
		return 0;
	end;
	if GetTime() - GetJoinTongTime() <= MIN_JOIN_TONG_DAY*24*3600 then
		Talk(1,"",g_szInfoHeader.."Th阨 gian i hi謕 nh藀 bang 輙 h琻 <color=yellow>"..MIN_JOIN_TONG_DAY.."<color> ng祔, v? v藋 kh玭g th? vt 秈 頲.");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_CAMP,nFieldMapID);
	if nPlayerCount >= MAX_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰 s? ngi ? khu v鵦 n祔  vt qu? s? lng t鑙 產 l? <color=yellow>"..MAX_PLAYER_COUNT.."<color> ngi, xin m阨 i m閠 l竧 r錳 h穣 v祇!");
		return 0;
	end;
	if nCurFieldState == MS_STATE_IDEL then	--如果场地未被开启
		open_mission_enter(nAreaIdx,nFieldIdx);
	else
		member_enter(nAreaIdx,nFieldIdx);
	end;	
end;
--成员进入关卡
function member_enter(nAreaIdx,nFieldIdx)
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName then
		Talk(1,"",g_szInfoHeader.."Чi hi謕 kh玭g ph秈 l? th祅h vi猲 c馻 <color=yellow>"..szTongName.."<color>, v? v藋 kh玭g th? t飝 ? v祇 khu v鵦 n祔 頲. Ngi c? th? t譵 阯g ch? ho芻 阯g ch? tr? l猲 c馻 bang n祔  t? i r錳 ti課 v祇.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 0 then	--带外援进入
		if GetName() ~= GetCaptainName() then
			Talk(1,"",g_szInfoHeader.."B総 bu閏 ph秈 i trng ch鋘 khu v鵦 ti課 v祇.");
			return 0;
		end;
		local nCurJob = IsTongMember();
		if nCurJob == 0 or nCurJob > 4 then
			Talk(1,"",g_szInfoHeader.."Ch? c? 阯g ch? ho芻 ch鴆 v? tr? l猲 m韎 c? th? d蒼 t? i ti課 v祇 秈.");
			return 0;
		end;
		local bCheckSuccess = 1;
		for i=1,nTeamSize do	--检查等级
			PlayerIndex = GetTeamMember(i);
			if GetLevel() < MIN_LEVEL then
				gf_Msg2Team(GetName().."Ъng c蕄 kh玭g ");
				bCheckSuccess = 0;
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
		if bCheckSuccess == 0 then
			Talk(1,"",g_szInfoHeader.."T蕋 c? ngi ch琲 trong t? i u ph秈 c? ng c蕄 y猽 c莡 <color=yellow>"..MIN_LEVEL.." tr? l猲<color>.");
			return 0;
		end;
		transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
	else
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
end;
--开启关卡
function open_mission_enter(nAreaIdx,nFieldIdx)
	if check_tong(nAreaIdx,nFieldIdx) ~= 1 then
		return 0;
	end;
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	if nCurFieldState == MS_STATE_IDEL then
		if check_player_right() ~= 1 then
			return 0;
		end;
		if check_team() ~= 1 then
			Talk(1,"",g_szInfoHeader.."Trong t? i ph秈 c? ng c蕄 輙 nh蕋 <color=yellow>"..MIN_TEAM_MEMBER.."c竔"..MIN_LEVEL.." m韎 c? th? ti課 h祅h vt 秈.");
			return 0;
		end;
	end;
	SetTaskTemp(TSK_TEMP_AREA_IDX,nAreaIdx);
	SetTaskTemp(TSK_TEMP_FIELD_IDX,nFieldIdx);
	check_week(GetTongName());
end;

--检查玩家权限:是否为队长，队伍是否有８人，帮中职位是否为长老以上
function check_player_right()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	if GetTeamSize() < MIN_TEAM_MEMBER then	--检查队员人数
		Talk(1,"",g_szInfoHeader.."C莕 ph秈 c? <color=yellow>"..MIN_TEAM_MEMBER.."<color> ngi t? i v韎 nhau ti課 h祅h k輈h ho箃 khu v鵦.");
		return 0;
	end;
	if GetName() ~= GetCaptainName() then	--判断是否是队长
		Talk(1,"",g_szInfoHeader.."Y猽 c莡 c莕 ph秈 <color=yellow>i trng<color> ch鋘 k輈h ho箃 khu v鵦 n祇.");
		return 0;
	end;
	local nCurJob = IsTongMember();	--判断是否是帮主、副帮主、长老
	--nTongJob:0：未入帮 1：帮主 2：副帮主 3：长老 4：堂主 5：香主 6：普通成员
	if nCurJob == 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Y猽 c莡 c莕 ph秈 <color=yellow>bang ch? ho芻 ph? bang ch? ho芻 trng l穙<color> d蒼 t? i m韎 c? th? k輈h ho箃 khu v鵦 vt 秈.");
		return 0;
	end;
	return 1;
end;
--检查队伍里面各个玩家的情况，一级一级地检查
--先检查队伍人数，再检查玩家等级，再检查玩家的帮会名，再检查入帮时间
--Midyfy:修改为只检查队伍人数与玩家等级  by yanjun 07年10月21日
function check_team()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < MIN_TEAM_MEMBER then	--检查队员人数
		gf_Msg2Team("T? i c? s? ngi kh玭g .");
		return 0;
	end;
	local szTongName = GetTongName();	--获取队长的帮会名
	local nOldPlayerIdx = PlayerIndex;
	local bCheckSuccess = 1;
	for i=1,nTeamSize do	--检查等级
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < MIN_LEVEL then
			gf_Msg2Team(GetName().."Ъng c蕄 kh玭g ");
			bCheckSuccess = 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if bCheckSuccess == 0 then
		return 0;
	end;
	return 1;
end;
--检查帮会当前可不可以激活场地
function check_tong(nAreaIdx,nFieldIdx)
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local tbCity = 
	{
		[100] = "Tuy襫 Ch﹗",
		[150] = "Dng Ch﹗",
		[200] = "Bi謓 Kinh",
		[300] = "Th祅h Й",
		[350] = "Tng Dng",
	}
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName and szTongName ~= "" then	--检查目标场地帮会是否为自己的帮会
		Talk(1,"",g_szInfoHeader.."Hi謓 t筰 khu v鵦 n祔  頲 bang "..szTongName.." k輈h ho箃, xin m阨 h穣 ch鋘 khu v鵦 kh竎.");
		return 0;
	end;
	local nMapID,nTongAreaIdx,nTongFieldIdx = TM_GetTongFieldState(GetTongName());
	if nMapID == nCurMapID and nTongAreaIdx == nAreaIdx and nTongFieldIdx == nFieldIdx then
		return 1;	--如果选择的是本帮会的场地
	end;
	if nMapID ~= 0 then	--检查帮会当前是否已激活关卡
		if nCurMapID == nMapID then
			Talk(1,"",g_szInfoHeader.."Qu? bang 產ng ? t筰 <color=yellow>"..tbCity[nMapID].."c馻 th祅h c? s? hi謚 "..nTongAreaIdx.."c馻 khu v鵦 c? s? hi謚 "..nTongFieldIdx.."<color>  頲 k輈h ho箃, xin m阨 t譵 khu v鵦 kh竎  vt 秈.");
			return 0;
		end;
		local selTab = {
					"L祄 phi襫 ngi qu?./#go_to_the_city("..nMapID..")",
					"C竚 琻,  ta t? l祄./nothing",
					}
		Say(g_szInfoHeader.."Qu? bang 產ng ? t筰 <color=yellow>"..tbCity[nMapID].."c馻 th祅h c? s? hi謚 "..nTongAreaIdx.."c馻 khu v鵦 c? s? hi謚 "..nTongFieldIdx.."s? hi謚 khu v鵦<color> k輈h ho箃 vt 秈, c? c莕 ta d蒼 阯g kh玭g? Ta ch? thu ph? <color=yellow>5<color> lng b筩 th玦.",getn(selTab),selTab);
		return 0;
	end;
	return 1;
end;

function go_to_the_city(nMapID)
	if GetCash() < 500 then
		Talk(1,"",g_szInfoHeader.."Чi hi謕 kh玭g  s? ng﹏ lng c莕 thi誸!");
	else
		PrePay(500);
		NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	end;
end;
--传送一个玩家
function transmit_single(nCurMapID,nAreaIdx,nFieldIdx)
	SetTaskTemp(TSK_TEMP_MAP_ID,nCurMapID);
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	WriteLogEx("Tu Quang Cac","tham gia");
	mf_JoinMission(MISSION_ID,ALL_CAMP,nFieldMapID);
end;
--传送一个队伍
function transmit_team(nCurMapID,nAreaIdx,nFieldIdx)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex
	local tbTeamMember = {};
	for i=1,nTeamSize do
		tbTeamMember[i] = GetTeamMember(i);
	end;
	for i=1,getn(tbTeamMember) do
		PlayerIndex = tbTeamMember[i];
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
	PlayerIndex = nOldPlayerIndex
end;

function check_week(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"check_week_callback");
end;

function check_week_callback(szKey, nKey1, nKey2, nCount)
	local nCurWeek = tonumber(date("%y%W"));
	local szTongName = GetTongName();
	local nMapID = TM_GetTongFieldState(szTongName);
	--if nMapID ~= 0 then	--回调的时候再检查一次，不作提示了
		--return 0;
	--end;
	local nAreaIdx,nFieldIdx = GetTaskTemp(TSK_TEMP_AREA_IDX),GetTaskTemp(TSK_TEMP_FIELD_IDX);
	local nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_WEEK);
	local nAttendWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_ATTEND);
	if nWeek == nil then
		nWeek = 0;
	end;
	if nAttendWeek == nil then
		nAttendWeek = 0;
	end;
	gf_ShowDebugInfor("nAttendWeek:"..nAttendWeek);
	if nCurWeek > nAttendWeek then	--新的一周，清除进度
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",0);
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nWeekTime = tonumber(date("%w"));
	local nTime = tonumber(date("%H%M"));
	gf_ShowDebugInfor("nFieldMapID:"..nFieldMapID);
	if nCount == 0 or nCurWeek > nWeek then
		if nCurFieldState == MS_STATE_IDEL then
			--星期天晚上11点5至星期一凌晨0点05分
			if (nWeekTime == 0 and nTime > 2355) or (nWeekTime == 1 and nTime < 0001) then
				Talk(1,"",g_szInfoHeader.."秈 產ng ? qu? tr譶h i lt, t筸 th阨 kh玭g th? ti課 h祅h vt 秈, xin m阨 sau <color=yellow> 0 gi? 01 ph髏<color> ti課 h祅h vt 秈.");
				return 0;
			end; 
			mf_SetMissionS(MISSION_ID,MS_TONG_NAME,szTongName,nFieldMapID);
			if mf_OpenMission(MISSION_ID,nFieldMapID) == 1 then
				mf_SetMissionV(MISSION_ID,MV_CITY_MAP_ID,nCurMapID,nFieldMapID);
				TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nCurWeek);
				TM_SetTongFieldState(nFieldMapID,szTongName);
				transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
			end;
		else
			transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
		end;	
	else
		Talk(1,"",g_szInfoHeader.."Tu莕 n祔 qu? bang  vt 秈 r錳, xin h穣 i tu莕 k? ti誴!");
	end;
end;

function clear_relay_data()
	local selTab = {
				"th藅/clear_relay_data_confirm",
				"Gi?/nothing",
				}
	Say(g_szInfoHeader.."Th藅? ",getn(selTab),selTab);
end;

function clear_relay_data_confirm()
	local szTongName = GetTongName();
	if szTongName == "" then
		Talk(1,"",g_szInfoHeader.."Ngi v蒼 ch璦 gia nh藀 bang h閕!");
		return 0;
	end;
	ClearRelayShareData(szTongName,0,0,"","");
	DelRelayShareDataCopy(szTongName,0,0);
	Talk(1,"",g_szInfoHeader.."D? li謚  d鋘 s筩h!	");
end;

function get_award()
	local selTab = {
				"фi 甶觤/get_award_use_point",
				"фi v藅 ph萴 c th?/get_award_use_item",
				"Ta ch? ti謓 阯g h醝 ch琲!/nothing",
				}
	Say(g_szInfoHeader.."T? Quang C竎 c? m閠 lng l韓 ch? t竎 c竎 trang ph鬰, v? kh?; ch? c莕  甶觤 y猽 c蕌 c? th? thu 頲 c竎 trang b? ( c ng h鉧 n 6, kh玭g k? trang s鴆), n誹 nh? c? gi? m閠 s? v藅 ph萴 c th? c馻 T? Quang T? 萵, 玭g ta c遪 c? th? cng h鉧 cho c竎 trang b? v? v? kh? m筺h h琻.",getn(selTab),selTab);
end;

function get_award_use_point()
	local selTab = {
				"T? Quang H? Gi竝/get_equip_award",
				"T? Quang Ng鋍/get_jewelry_award",
				"Ta ch? n xem/nothing",
				}
	Say(g_szInfoHeader.."Ngi 產ng c? <color=yellow>"..GetTask(TSK_POINT).."<color> 甶觤, i hi謕 mu鑞 lo筰 trang b? n祇 di y?",getn(selTab),selTab);
end;

function get_equip_award()
	local selTab = {
				"T? Quang M筼/#get_equip(1)",
				"T? Quang H? Gi竝/#get_equip(2)",
				"T? Quang H? Trang/#get_equip(3)",
				"T? Quang Th筩h/#get_equip(4)",
				"Xem trang b? kh竎/get_award_use_point",
				"Ta ch? n xem/nothing",
				}
	Say(g_szInfoHeader.."Ph? th玭g h? gi竝 T? Quang C竎  cng h鉧 n 6. M鏸 m鉵 c莕 <color=yellow>500<color> 甶觤. Ngi hi謓 t筰 c? <color=yellow>"..GetTask(TSK_POINT).."<color> 甶觤, ngi mu鑞 lo筰 trang b? n祇 di y?",getn(selTab),selTab);
end;

function get_equip(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 500 then
		Talk(1,"",g_szInfoHeader.."觤 T? Quang C竎 c馻 c竎 h? kh玭g , ph秈  <color=yellow>500<color> 甶觤 T? Quang C竎 m韎 c? th? i lo筰  trang b? n祔.");
		return 0;
	end;
	local tbEquipName = {"T? Quang M筼","T? Quang H? Gi竝","T? Quang H? Trang","T? Quang Th筩h"};
	local selTab = {
				"уng ?/#get_equip_confirm("..nType..")",
				"Xem trang b? kh竎/get_equip_award",
				"Ta suy ngh? l筰!/nothing",
				}
	Say(g_szInfoHeader.."Чi hi謕 c? ch綾 d飊g <color=yellow>500<color> 甶觤 i l蕐 <color=yellow>"..tbEquipName[nType].."<color> ch??",getn(selTab),selTab);
end;

function get_equip_confirm(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 500 then
		Talk(1,"",g_szInfoHeader.."觤 T? Quang C竎 c馻 c竎 h? kh玭g , ph秈  <color=yellow>500<color> 甶觤 T? Quang C竎 m韎 c? th? i lo筰  trang b? n祔.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"",g_szInfoHeader.."H祅h trang ho芻 s鴆 l鵦 kh玭g , xin m阨 h穣 s緋 x誴 l筰 h祅h trang r錳 ti誴 t鬰 i ph莕 thng.");
		return 0;
	end;
	local tbEquipName = {"T? Quang M筼","T? Quang H? Gi竝","T? Quang H? Trang","T? Quang Th筩h"};
	local nBody = GetBody(); 
	local nRetCode = 0;
	SetTask(TSK_POINT,nPoint-500);
	if nType == 1 then
		nRetCode = AddItem(0,103,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	elseif nType == 2 then
		nRetCode = AddItem(0,100,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	elseif nType == 3 then
		nRetCode = AddItem(0,101,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	else
		nRetCode = AddItem(0,102,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	end;
	if nRetCode == 1 then
		Msg2Player("B筺  nh薾 頲 1 "..tbEquipName[nType]);
		WriteLogEx("Tu Quang Cac","i","1",tbEquipName[nType]);
	else
		WriteLog("[Bang h閕 秈 l鏸]"..GetName().."фi 頲 1 "..tbEquipName[nType].."AddItem g苝 l鏸, nRetCode:"..nRetCode);
	end;
end;
function get_jewelry_award()
	local selTab = {
				"S鴆 m筺h t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18/#get_jewelry(1)",
				"Linh ho箃 t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18/#get_jewelry(2)",
				"N閕 c玭g t╪g 18, g﹏ c鑤 t╪g 18, linh ho箃 t╪g 18/#get_jewelry(3)",
				"N閕 c玭g t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18/#get_jewelry(4)",
				"S鴆 m筺h t╪g 18, g﹏ c鑤 t╪g 18, linh ho箃 t╪g 18/#get_jewelry(5)",
				"Xem trang b? kh竎/get_award_use_point",
				"Ta ch? n xem/nothing",
				}
	Say(g_szInfoHeader.."Ng鋍 ph? th玭g 頲 t tr猲 10 n╩ ? s祇 huy謙 T? Quang C竎 th莕 th?, h髏  c竎 khi ﹎ dng. M鏸 m鉵 c莕 <color=yellow>3500<color> 甶觤. Xin m阨 ch鋘 thu閏 t輓h cho trang b?:",getn(selTab),selTab);
end;

function get_jewelry(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 3500 then
		Talk(1,"",g_szInfoHeader.."觤 T? Quang C竎 kh玭g , i hi謕 c莕 <color=yellow>3500<color> 甶觤 m韎 c? th? i 頲 lo筰 trang b? n祔.");
		return 0;
	end;
	local tbJewelryName = {
					"S鴆 m筺h t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18",
					"Linh ho箃 t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18",
					"N閕 c玭g t╪g 18, g﹏ c鑤 t╪g 18, linh ho箃 t╪g 18",
					"N閕 c玭g t╪g 18, g﹏ c鑤 t╪g 18, th﹏ ph竝 t╪g 18",
					"S鴆 m筺h t╪g 18, g﹏ c鑤 t╪g 18, linh ho箃 t╪g 18",
					};
	local selTab = {
				"уng ?/#get_jewelry_confirm("..nType..")",
				"Xem trang b? kh竎/get_jewelry_award",
				"Ta suy ngh? l筰!/nothing",
				}
	Say(g_szInfoHeader.."Чi hi謕 c? ch綾 ch緉 d飊g <color=yellow>3500<color> 甶觤 i <color=yellow>T? Quang Ng鋍<color>? Thu閏 t輓h: <color=yellow> "..tbJewelryName[nType].."<color>",getn(selTab),selTab);

end;

function get_jewelry_confirm(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 3500 then
		Talk(1,"",g_szInfoHeader.."觤 T? Quang C竎 kh玭g , i hi謕 c莕 <color=yellow>3500<color> 甶觤 m韎 c? th? i 頲 lo筰 trang b? n祔.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,50) == 0 then
		Talk(1,"",g_szInfoHeader.."H祅h trang ho芻 s鴆 l鵦 kh玭g , xin m阨 h穣 s緋 x誴 l筰 h祅h trang r錳 ti誴 t鬰 i ph莕 thng.");
		return 0;
	end;
	SetTask(TSK_POINT,nPoint-3500);
	nRetCode = AddItem(0,102,2355+nType-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("Чi hi謕  thu 頲 1 T? Quang Ng鋍");
		WriteLogEx("Tu Quang Cac","i","1","T? Quang Th筩h");
	else
		WriteLog("[Bang h閕 秈 l鏸]"..GetName().."L骳 i 1 T? Quang Ng鋍 xu蕋 hi謓 l鏸, lo筰 h譶h: "..nType..",nRetCode:"..nRetCode);
	end;
end;
--==================================================================================
function get_award_use_item()
	local selTab = {
		"T? Quang Chi課 Kh玦/#list_special_equip(1,1)",
		"T? Quang Chi課 B祇/#list_special_equip(2,1)",
		"T? Quang Chi課 Trang/#list_special_equip(3,1)",
		"T? Quang Ti猲 Ng鋍/#list_special_equip(4,1)",
		"T? Quang Th莕 Binh/#list_special_equip(5,1)",
		"Ta ch? ti謓 阯g h醝 ch琲!/nothing",
		}
	Say(g_szInfoHeader.."Чi hi謕 mu鑞 i trang b? n祇 di y? Ch? ?: <color=yellow>Nh鱪g trang b? di y u l? trang b? kh鉧, kh玭g th? d飊g  giao d辌h v韎 ngi ch琲 kh竎<color>.",getn(selTab),selTab);
end;

function list_special_equip(nEquipType,nPageNum)
	local tbItemTab = get_special_equip_list(nEquipType);
	local nRecordCount = getn(tbItemTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,1,format("Trang trc/#list_special_equip(%d,%d)",nEquipType,nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("Trang k?/#list_special_equip(%d,%d)",nEquipType,nPageNum+1));	
	end;
	tinsert(selTab,"\nXem trang b? kh竎./get_award_use_item");
	tinsert(selTab,"Ta ch? gh? ch琲/nothing");
	local nPoint = GetTask(TSK_POINT);
	Say(g_szInfoHeader.."Ngi mu鑞 i <color=yellow>"..TB_AWARD[nEquipType][2].."<color>? C莕 ph秈 c? <color=yellow>"..TB_AWARD[nEquipType][1][1][2][4].."c竔"..TB_AWARD[nEquipType][1][1][2][5].." v?"..TB_AWARD[nEquipType][1][1][3].." 甶觤 T? Quang C竎.<color>. Hi謓 t筰 ngi c? <color=yellow>"..nPoint.."<color> 甶觤 T? Quang C竎. Xin m阨 c╪ c? v祇 t譶h tr筺g hi謓 t筰 c馻 i hi謕  ch鋘 thu閏 t輓h trang b? c莕 thi誸:",getn(selTab),selTab);
end;

function get_special_equip_list(nEquipType)
	local tSelTab = {};
	for i=1,getn(TB_AWARD[nEquipType][1]) do
		tinsert(tSelTab, "@ "..TB_AWARD[nEquipType][1][i][4].." /#get_special_equip_affirm("..nEquipType..","..i..")");
	end;
	return tSelTab;
end;

function get_special_equip_affirm(nEquipType,nEquipIdx)
	local selTab = {
				format("уng ?/#get_special_equip_confirm(%d,%d)",nEquipType,nEquipIdx),
				"Ta mu鑞 xem trang b? kh竎/get_award_use_item",
				"T筸 th阨 kh玭g 頲 i/nothing",
				}
	local szInfor = TB_AWARD[nEquipType][1][nEquipIdx][4];
	Say(g_szInfoHeader.."Чi hi謕 ch鋘 <color=yellow>"..TB_AWARD[nEquipType][2].."<color> c? thu閏 t輓h l?: <color=yellow>"..szInfor.."<color>. Ngi c? ch綾 ch緉 i m鉵 trang b? n祔 kh玭g?",getn(selTab),selTab);
end;

function get_special_equip_confirm(nEquipType,nEquipIdx)
	local nPoint = GetTask(TSK_POINT);
	local nBody = GetBody();
	local tbItemInfo = TB_AWARD[nEquipType][1][nEquipIdx];
	local nNeedPoint = tbItemInfo[3];
	local nNeedItemID1,nNeedItemID2,nNeedItemID3,nNeedItemCount,szNeedItemName = tbItemInfo[2][1],tbItemInfo[2][2],tbItemInfo[2][3],tbItemInfo[2][4],tbItemInfo[2][5];
	local nEquipID1,nEquipID2,nEquipID3,szEquipName = tbItemInfo[1][1],tbItemInfo[1][2],tbItemInfo[1][3],TB_AWARD[nEquipType][2];
	if nPoint < nNeedPoint then
		Talk(1,"",g_szInfoHeader.."觤 T? Quang C竎 c馻 i hi謕 kh玭g , ph秈 c莕 c? <color=yellow>"..nNeedPoint.."<color> 甶觤 T? Quang C竎 m韎 c? th? i m鉵 trang b? n祔.");
		return 0;
	end;
	if GetItemCount(nNeedItemID1,nNeedItemID2,nNeedItemID3) < nNeedItemCount then
		Talk(1,"",g_szInfoHeader.."Чi hi謕 c莕 c? "..nNeedItemCount.."c竔"..szNeedItemName.." m韎 c? th? i m鉵 trang b? n祔 頲.")
		return 0;
	end;
	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"",g_szInfoHeader.."H祅h trang ho芻 s鴆 l鵦 kh玭g , xin m阨 h穣 s緋 x誴 l筰 h祅h trang r錳 ti誴 t鬰 i ph莕 thng.");
		return 0;
	end;
	if DelItem(nNeedItemID1,nNeedItemID2,nNeedItemID3,nNeedItemCount) == 1 then
		SetTask(TSK_POINT,nPoint-nNeedPoint);
		if nEquipType == 4 or nEquipType == 5 then	--如果是首饰或武器
			nRetCode = AddItem(nEquipID1,nEquipID2,nEquipID3,1,1,-1,-1,-1,-1,-1,-1);
		else
			nRetCode = AddItem(nEquipID1,nEquipID2,nEquipID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
		end;
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..szEquipName);
			if nEquipType == 5 then
				local szWeaponName = tbItemInfo[5] or  ""
				WriteLogEx("Tu Quang Cac","i","1",szWeaponName);
			else
				WriteLogEx("Tu Quang Cac","i","1",szEquipName);
			end			
		else
			WriteLog("[Bang h閕 秈 l鏸]"..GetName().."фi "..szEquipName.."(nEquipIdx:"..nEquipIdx..") AddItem g苝 l鏸, nRetCode:"..nRetCode);
		end;
	end;
end;

function go_to_another_city()
	local selTab = {
				[1] = "Tuy襫 Ch﹗/#go_to_the_city_test(1)",
				[2] = "Dng Ch﹗/#go_to_the_city_test(2)",
				[3] = "Bi謓 Kinh/#go_to_the_city_test(3)",
				[4] = "Th祅h Й/#go_to_the_city_test(4)",
				[5] = "Tng Dng/#go_to_the_city_test(5)",
				[6] = "Kh玭g c莕 甶 n鱝/nothing",
				}
	Say(g_szInfoHeader.."Mu鑞 n th祅h th? n祇?",getn(selTab),selTab);
end;

function go_to_the_city_test(nCityIdx)
	local tCityPos = 
	{
		[1] = {100,1426,3014},
		[2] = {150,1651,3174},
		[3] = {200,1381,2917},
		[4] = {300,1764,3594},
		[5] = {350,1449,3013},
	}
	NewWorld(tCityPos[nCityIdx][1],tCityPos[nCityIdx][2],tCityPos[nCityIdx][3]);
end;

function get_award_use_xiakehuizhang()
	local selTab = {
				"фi b? T? Vi猰/get_yandi_suit",
				"фi b? T? Vi猲/get_huangdi_suit",
				"Xem ph莕 thng kh竎/get_award",
				"Ta ch? gh? ch琲/nothing",
				}
	Say(g_szInfoHeader.."Trong T? Quang C竎 kh玭g nh鱪g nh薾 頲 甶觤 t輈h l騳, m? c遪 nh薾 頲 Hi謕 kh竎h chng d飊g  trao i trang b? cao c蕄 h琻, hi謓 Hi謕 kh竎h chng t鑙 產 l? <color=yellow>"..MAX_XIEKEHUIZHANG.."<color>.",getn(selTab),selTab);
end;

g_tbYanDiSuitAward = 
{
	[1] = {"T? Quang Vi猰 д Kh玦",180,6750,{0,103,8051}},
	[2] = {"T? Quang Vi猰 д Trang",180,6750,{0,101,8051}},
	[3] = {"T? Quang Vi猰 д Gi竝",252,9450,{0,100,8051}},
}

g_tbHuangDiSuitAward = 
{
	[1] = {"T? Vi猲 Chi課",252,9450},
	[2] = {"T? Vi猲 u",252,9450},
	[3] = {"T? Vi猲 V? Kh?",324,12150},
}

function get_yandi_suit()
	local nItemName = "";
	local nNum = 0;
	local nPoint = 0;
	local selTab = {};
	local nCurPoint = GetTask(TSK_POINT);
	local nCurNum = GetItemCount(2,0,1091);
	for i=1,getn(g_tbYanDiSuitAward) do
		nItemName = g_tbYanDiSuitAward[i][1];
		nNum = g_tbYanDiSuitAward[i][2];
		nPoint = g_tbYanDiSuitAward[i][3];
		tinsert(selTab,nItemName.." (C莕 "..nNum.." Hi謕 kh竎h chng, 甶觤 t輈h l騳 T? Quang "..nPoint..")/#get_yandi_suit_1("..i..")");
	end;
	tinsert(selTab,"Ta xem trang b? kh竎/get_award_use_xiakehuizhang");
	tinsert(selTab,"Ta ch? gh? ch琲/nothing");
	Say(g_szInfoHeader.."Ngi mu鑞 i trang b? g?? Hi謓 ngi c? <color=yellow>"..nCurNum.."<color> Hi謕 kh竎h chng v? <color=yellow>"..nCurPoint.."<color> 甶觤 t輈h l騳 T? Quang.",getn(selTab),selTab);
end;

function get_yandi_suit_1(nIdx)
	local selTab = {
				"уng ?/#get_yandi_suit_2("..nIdx..")",
				"H駓 b?/nothing",
				}
	local nItemName = g_tbYanDiSuitAward[nIdx][1];
	local nNum = g_tbYanDiSuitAward[nIdx][2];
	local nPoint = g_tbYanDiSuitAward[nIdx][3];
	Say(g_szInfoHeader.."Ngi mu鑞 d飊g <color=yellow>"..nNum.."<color> Hi謕 kh竎h chng v? <color=yellow>"..nPoint.."<color> 甶觤 t輈h l騳 T? Quang фi <color=yellow>"..nItemName.."<color> ch??",getn(selTab),selTab);
end;

function get_yandi_suit_2(nIdx)
	if gf_JudgeRoomWeight(1,100,g_szInfoHeader) == 0 then
		return 0;
	end;
	local nBody = GetBody();
	local nID1,nID2,nID3 = 0,0,0;
	nID1 = g_tbYanDiSuitAward[nIdx][4][1];
	nID2 = g_tbYanDiSuitAward[nIdx][4][2];
	nID3 = g_tbYanDiSuitAward[nIdx][4][3];
	local nItemName = g_tbYanDiSuitAward[nIdx][1];
	local nNum = g_tbYanDiSuitAward[nIdx][2];
	local nPoint = g_tbYanDiSuitAward[nIdx][3];
	if GetItemCount(2,0,1091) < nNum then
		Talk(1,"",g_szInfoHeader.."Hi謕 kh竎h chng kh玭g  <color=yellow>"..nNum.."<color> c竔, c? ph秈  trong Rng ch鴄  kh玭g?");
		return 0;
	end;
	local nCurPoint = GetTask(TSK_POINT);
	if nCurPoint < nPoint then
		Talk(1,"",g_szInfoHeader.."觤 t輈h l騳 T? Quang kh玭g  <color=yellow>"..nPoint.."<color>, kh玭g th? i trang b? n祔.");
		return 0;	
	end;
	if DelItem(2,0,1091,nNum) == 1 then
		SetTask(TSK_POINT,nCurPoint-nPoint);
		AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B筺 i "..nNum.." Hi謕 kh竎h chng v? "..nPoint.." 甶觤 t輈h l騳 T? Quang i 1  "..nItemName);
		gf_WriteLog("T? Quang C竎","D飊g th?"..nNum.." Hi謕 kh竎h chng v? "..nPoint.." 甶觤 t輈h l騳 i 1  "..nItemName);
	else
		gf_WriteLog("T? Quang C竎 b? l鏸","H駓 b?"..nNum.." Hi謕 kh竎h chng DelItem b? l鏸 ");
	end;
end;
--=======================================================================================
function get_huangdi_suit()
	local nItemName = "";
	local nNum = 0;
	local nPoint = 0;
	local selTab = {};
	local nCurPoint = GetTask(TSK_POINT);
	local nCurNum = GetItemCount(2,0,1091);
	for i=1,getn(g_tbHuangDiSuitAward) do
		nItemName = g_tbHuangDiSuitAward[i][1];
		nNum = g_tbHuangDiSuitAward[i][2];
		nPoint = g_tbHuangDiSuitAward[i][3];
		tinsert(selTab,nItemName.." (C莕 "..nNum.." Hi謕 kh竎h chng, 甶觤 t輈h l騳 T? Quang "..nPoint..")/#get_huangdi_suit_1("..i..")");
	end;
	tinsert(selTab,"Ta xem trang b? kh竎/get_award_use_xiakehuizhang");
	tinsert(selTab,"Ta ch? gh? ch琲/nothing");
	Say(g_szInfoHeader.."Ngi mu鑞 i trang b? g?? Hi謓 ngi c? <color=yellow>"..nCurNum.."<color> Hi謕 kh竎h chng v? <color=yellow>"..nCurPoint.."<color> 甶觤 t輈h l騳 T? Quang.",getn(selTab),selTab);		
end;

function get_huangdi_suit_1(nIdx)
	local selTab = {
				"уng ?/#get_huangdi_suit_2("..nIdx..")",
				"H駓 b?/nothing",
				}
	local nItemName = g_tbHuangDiSuitAward[nIdx][1];
	local nNum = g_tbHuangDiSuitAward[nIdx][2];
	local nPoint = g_tbHuangDiSuitAward[nIdx][3];
	Say(g_szInfoHeader.."Ngi mu鑞 d飊g <color=yellow>"..nNum.."<color> Hi謕 kh竎h chng v? <color=yellow>"..nPoint.."<color> 甶觤 t輈h l騳 T? Quang фi <color=yellow>"..nItemName.."<color> ch??",getn(selTab),selTab);
end;

function get_huangdi_suit_2(nIdx)
	if gf_JudgeRoomWeight(2,150,g_szInfoHeader) == 0 then
		return 0;
	end;
	local nRetCode,nRouteIdx = gf_CheckPlayerRoute();
	if nRetCode == 0 then
		Talk(1,"",g_szInfoHeader.."B筺 ph秈 v祇 l璾 ph竔 m韎 c? th? i ph莕 thng n祔.");
		return 0;
	end;
	local nItemName = g_tbHuangDiSuitAward[nIdx][1];
	local nNum = g_tbHuangDiSuitAward[nIdx][2];
	local nPoint = g_tbHuangDiSuitAward[nIdx][3];
	if GetItemCount(2,0,1091) < nNum then
		Talk(1,"",g_szInfoHeader.."Hi謕 kh竎h chng kh玭g  <color=yellow>"..nNum.."<color> c竔, c? ph秈  trong Rng ch鴄  kh玭g?");
		return 0;
	end;
	local nCurPoint = GetTask(TSK_POINT);
	if nCurPoint < nPoint then
		Talk(1,"",g_szInfoHeader.."觤 t輈h l騳 T? Quang kh玭g  <color=yellow>"..nPoint.."<color>, kh玭g th? i trang b? n祔.");
		return 0;	
	end;
	if DelItem(2,0,1091,nNum) == 1 then
		SetTask(TSK_POINT,nCurPoint-nPoint);
		give_huangdi_suit(nIdx,nRouteIdx);
		Msg2Player("B筺 i "..nNum.." Hi謕 kh竎h chng v? "..nPoint.." 甶觤 t輈h l騳 T? Quang i 1  "..nItemName);
		gf_WriteLog("T? Quang C竎","D飊g th?"..nNum.." Hi謕 kh竎h chng v? "..nPoint.." 甶觤 t輈h l騳 i 1  "..nItemName);
	else
		gf_WriteLog("T? Quang C竎 b? l鏸","H駓 b?"..nNum.." Hi謕 kh竎h chng DelItem b? l鏸 ");
	end;
end;

g_tbHuangDiWeapon = 
{
	{{0,3,8851},{0,5,8852}},	--少林俗家
	{{0,8,8853}},	
	{{0,0,8854}},	
	{{0,1,8855}},	
	{{0,2,8856}},	
	{{0,10,8857}},
	{{0,0,8858}},	
	{{0,5,8859}},	
	{{0,2,8860}},	
	{{0,9,8861}},	
	{{0,6,8862}},	
	{{0,4,8863}},	
	{{0,7,8864}},	
	{{0,11,8865}},
}

function give_huangdi_suit(nIdx,nRouteIdx)
	local szItemName = "";
	if nIdx == 1 then
		AddItem(0,102,8851+2*(nRouteIdx-1),1,1,-1,-1,-1,-1,-1,-1);
		szItemName = GetItemName(0,102,8851+2*(nRouteIdx-1));
	elseif nIdx == 2 then
		AddItem(0,102,8852+2*(nRouteIdx-1),1,1,-1,-1,-1,-1,-1,-1);
		szItemName = GetItemName(0,102,8852+2*(nRouteIdx-1));
	elseif nIdx == 3 then
		local nID1,nID2,nID3 = 0,0,0;
		for i=1,getn(g_tbHuangDiWeapon[nRouteIdx]) do
			nID1 = g_tbHuangDiWeapon[nRouteIdx][i][1];
			nID2 = g_tbHuangDiWeapon[nRouteIdx][i][2];
			nID3 = g_tbHuangDiWeapon[nRouteIdx][i][3];
			AddItem(nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
			szItemName = GetItemName(nID1,nID2,nID3);
		end;
	end;
	Msg2Player("B筺 nh薾 頲 "..szItemName);
end;

function get_exchange_exp()
	local tbSayDialog = {};
	local szSayHead = "Чi hi謕 產ng c? <color=yellow>"..GetTask(TSK_POINT).."<color> 甶觤, i hi謕 mu鑞 i bao nhi猽 甶觤 kinh nghi謒 ?"
		
	tinsert(tbSayDialog, "фi 1000 甶觤 T? Quang C竎 l蕐 10.000 甶觤 kinh nghi謒/#confirm_get_exchange_exp(1)")
	tinsert(tbSayDialog, "фi 10.000 甶觤 T? Quang C竎 l蕐 100.000 甶觤 kinh nghi謒/#confirm_get_exchange_exp(2)")
	tinsert(tbSayDialog, "фi 100.000 甶觤 T? Quang C竎 l蕐 1.000.000 甶觤 kinh nghi謒/#confirm_get_exchange_exp(3)")	
	tinsert(tbSayDialog, 	"Ta ch? ti謓 th? gh? ngang qua th玦./nothing")

	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function confirm_get_exchange_exp(nType)
	local tPoint_exchange = {
		[1] = {1000, 1 },
		[2] = {10000, 10},
		[3] = {100000, 100},	
	}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th? i 甶觤 kinh nghi謒 !!!")
		return
	end
	local nExp = tPoint_exchange[nType][1] * 10
	local nPointTQC = GetTask(TSK_POINT)
	if nPointTQC < tPoint_exchange[nType][1] then 
		Talk(1, "", "Чi hi謕 kh玭g c? nhi襲 甶觤 T? Quang C竎  i !!!")
		return 0;
	end;
	if nExp > 2000000000 - GetExp() then
		Talk(1, "", "Чi hi謕 c? qu? nhi襲 甶觤 kinh nghi謒 r錳 !!!")
		return 0;
	end

	SetTask(TSK_POINT,nPointTQC - tPoint_exchange[nType][1]);
	ModifyExp(nExp) 
	Msg2Player("Ch骳 m鮪g i hi謕  i 頲 "..nExp.." 甶觤 kinh nghi謒")	
	gf_WriteLogEx("DOI DIEM KINH NGHIEM", "甶觤 exp by TQC", tPoint_exchange[nType][2], "甶觤 exp by TQC")		
end