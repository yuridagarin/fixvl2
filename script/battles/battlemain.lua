
Include("\\script\\battles\\butcher\\head.lua")

function main()
	openbattlemain(1, 807, 20, 1, 1)
	openbattlemain(1, 809, 20, 2, 1)
end

function openbattlemain(battleid, mapid, ruleid, level, seriesid)

	oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 2) then
		print("battle level must 1 to 2, but now is "..level..", so it is error!");
		return
	end;
	battlekey = date("%m%d") * 100000 + random(100000)
	signidx = SubWorldID2Idx(tbGAME_SIGNMAP[level]);

	SubWorld = idx
	OpenMission(ruleid)

--	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--显示与统计总战功
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	
	BT_SetGameData(GAME_CAMP1, 0) --设置当前宋方人数
	BT_SetGameData(GAME_CAMP2, 0) --设置当前辽方人数
	
	round = BT_GetGameData(GAME_ROUND)

	--设置该战局的数据
	BT_SetGameData(GAME_KEY, battlekey) --存放本次战役的Key号
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level)
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	BT_SetGameData(GAME_ROUND, round)
	
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
		
	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	
	--得到该地图有几个区域
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--随机从所有区域中抽取两个，作为双方的主区域
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);
	
	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--从后营到大营的坐标点
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
	--后营到前营的坐标点
 	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos2")
	SetMissionS(3,file)
	x,y = bt_getadata(file)
	
 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos2")
	SetMissionS(4,file)
	x,y = bt_getadata(file)
-------------------------------------------------------------------------
	
	--摆放Trap点
	--摆放双方后营的Trap点

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--摆放双方军营的trap点

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	
	--摆放双方后营到前营的trap点
	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP2)

	--摆放对话类型Npc
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "T鑞g Nhu quan");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Li猽 Nhu quan");
	
	
	--帅旗的摆放
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--贮物箱的摆放
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT1, x * 32,y * 32, "Th? kh鑏T鑞g");
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT2, x * 32, y * 32, "Th? kh? Li猽");
	
	
	StartMissionTimer(MISSIONID, 40, TIMER_2);
	--随机模柿设要打开每X分钟触发一次的触发器，以产生新旗
	StartMissionTimer(MISSIONID, 39, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--允许报名了
	
	if (level == 1) then
		lvlstr = "Khu v鵦 s? c蕄"
		lvllimit = 40
	else
		lvlstr = "Khu v鵦 cao c蕄"
		lvllimit = 70
	end
	
	RestMin, RestSec = GetMinAndSec(900);
	local str1 = lvlstr.."Thi猲 M玭 tr薾 t筰 Nh筺 M玭 quan hi謓 產ng trong giai 畂筺 b竜 danh. C竎 tng s? mau ch鉵g mang Anh h飊g l謓h n Nh筺 M玭 quan b竜 danh tham chi課! Th阨 gian b竜 danh c遪:"..RestMin.." ph髏. 襲 ki謓 tham chi課: Ъng c蕄 t?"..lvllimit.." tr? l猲.";
	
	AddGlobalNews(str1);
	Msg2Global(str1)
	CreateChannel("T鑞g"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧", 9)
	CreateChannel("Li猽"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧", 10)

	BT_SetMissionName("D筺g th鴆 c鮱 s竧")
	BT_SetMissionDesc("B鑙 c秐h: N╩ 1160 C玭g nguy猲, Li猽 ch? Ho祅 Nhan Lng t藀 h頿 qu﹏ l鵦, quy誸 nh Nam h?, ti猽 di謙 T鑞g tri襲. Tng Dng l? tr? ng筰 u ti猲 c馻 qu﹏ Li猽, Th祅h Tng Dng s緋 ng藀 ch譵 trong kh鉯 l鯽 binh 產o! <enter><enter><color=yellow>D筺g th鴆 C鮱 s竧: Tr猲 chi課 trng, ti猽 di謙 c祅g nhi襲 qu﹏ ch c祅g nh薾 頲 nhi襲 ph莕 thng 甶觤 chi課 c玭g cho phe m譶h. Phe n祇 nhi襲 甶觤 chi課 c玭g s? gi祅h chi課 th緉g chung cu閏. <enter> Ngi ch琲 kh玭g 頲 ? l筰 h藆 doanh qu? 2 ph髏. Trong chi課 trng kh玭g c? NPC chi課 u.")


	if (signidx >= 0) then
		SubWorld = signidx
	end

	local logstr_d = "Battle Start battleid\t"..battleid.."\trule\t"..ruleid.."\tIssue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d,"Nh藅 k? T鑞g Li猽");
	SubWorld = oldSubWorld
end;