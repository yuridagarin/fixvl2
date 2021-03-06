--coding by romandou 2004-12-22
--战役的报名点Npc对话脚本
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

function main()
CleanInteractive()	--断开交互

--bt_setnormaltask2type()
if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
	Say("Чi qu﹏ ch璦 xu蕋 ph竧. Tng s? xin ngh? ng琲 i l謓h!",0)
	return
end
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ngi ch璦 gia nh藀 m玭 ph竔 n祇! Chi課 trng r蕋 kh鑓 li謙! H鋍 xong v? ngh? h穣 quay l筰 tham chi課!", 0)
		return
	end
	-------------------------------------------------------------------	
	--判断玩家是否为逃离状态
--	local nTime = tonumber(date("%y%m%d%H%M"));
--	if nTime - BT_GetData(PL_LEAVETIME) < 60 then
--		Say("战阵之间，临阵脱逃，当以军法从事，你还是先好好反省一下吧。", 0);
--		return
--	end;


--判断玩家等级与报名点等级是否相适合
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --玩家等级
	local bt_level = 0;	-- 当前地图所属的战役等级
	
	if (pl_level < 40 ) then
		Say("Xin l鏸! Ngi ch璦 n c蕄 40! H穣 quay l筰 sau nh?!",2, "Ta s? quay l筰/bt_oncancel", "T譵 hi觰 Nh筺 M玭 quan chi課/bt_onbattleinfo");--？？“你的等级小于40级或者没有带足银两。”
		return 
	elseif pl_level >= 40 and pl_level < 70 then
		bt_level = 1
	elseif (pl_level >= 70) then
		bt_level = 2
--	else
--		bt_level = 2
	end;

	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("ID b秐  甶觤 b竜 danh b竜 l鏸, xin ki觤 tra l筰!");
		 	return 	
		 end
		 Say("N琲 n祔 l?"..szGAME_GAMELEVEL[maplevel]..", ng c蕄 c馻 ngi ch? c? th? n"..szGAME_GAMELEVEL[bt_level].." b竜 danh!", 0)--？？没有分等级的提示信息		 
		 return
	end

-------------------------------------------------------------------	

	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("Ti襫 phng 產ng ngh蟦 l鑙! T筸 th阨 kh玭g th? v祇 chi課 trng!", 0 )
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin l鏸! Hi謓 chi課 trng ch璦 m?. Khi kh竎 h穣 quay l筰!", 0 )
		SubWorld = tempSubWorld;
		return
	elseif (state == 3) then
		Say("Xin l鏸! Hi謓 chi課 trng  k誸 th骳. Khi kh竎 h穣 quay l筰!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	sl_clearplayerdata()	--每局新开始清除玩家上一局的信息，总战功不清除
	local str = ""
	if (bt_ncamp == 1) then
		str = "T鬰 ng? c? c﹗: Thi猲 h? h璶g vong, th蕋 phu h鱱 tr竎h. Nay gi芻 Li猽 x﹎ ph筸 b? c鈏 ta, Qu鑓 gia l﹎ nguy. L? con d﹏ Чi T鑞g, ta ph秈 t薾 trung b竜 Qu鑓! Anh h飊g! Xin h穣 u qu﹏ gi誸 gi芻 l藀 c玭g!"
	else
		str = "H靑 c竎 d騨g s? Li猽 Qu鑓! Nay ta chi猽 m? c竎 ngi 甶 ti猽 di謙 T鑞g qu﹏ ngoan c?, ho祅 th祅h b? nghi謕 c馻 Чi Li猽 ta. H穣 t薾 trung b竜 qu鑓, u qu﹏ gi誸 gi芻 l藀 c玭g!"
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin l鏸! Hi謓 chi課 trng  k誸 th骳. Khi kh竎 h穣 quay l筰!", 0)
		return 
	end
	BT_SetData( PL_SERIESKILL, 0 )	--连斩数清0
	BT_SetData( PL_KILLPLAYER, 0 )	--杀人数清0
	if (bt_ncamp == 1) then
		Say(str, 2, "Gia nh藀/bt_joinsong", "Ta suy ngh? l筰!/bt_oncancel");
	else
		Say(str, 2, "Gia nh藀/bt_joinjin", "Ta suy ngh? l筰!/bt_oncancel");
	end
	return	
end;

if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp and BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) ) then
	if (bt_ncamp == 1) then
		Say("Tr玭g ngi tng m筼 gian 竎, nh蕋 nh l? gian t? Li猽 Qu鑓. Ngi u! Mau b総 n?!",0)
		Msg2Player("Tr薾 n祔 ngi thu閏 phe Li猽, h穣 n 甶觤 b竜 danh xin Li猽 Qu﹏ M? Binh Quan v祇 tr薾!")
	else
		Say("To gan! D竚 x﹎ nh藀 l穘h a Чi Li猽 ta, ch竛 s鑞g ?!",0)
		Msg2Player("Tr薾 n祔 ngi thu閏 phe T鑞g, h穣 n 甶觤 b竜 danh xin T鑞g Qu﹏ M? Binh Quan v祇 tr薾!")	
	end;
	return 
end

----------------------------------------------------------------------
--正式报名时的条件是，
--1、已经报了本次的战役
--2、已经是本方战役的阵营了
--3、与本次战局的战局等级相符了

--正式可以报名了

Say( str, 2, "Л頲!/bt_enterbattle", "в ta suy ngh? l筰/bt_oncancel");
end;

function bt_enterbattle()
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin l鏸! Ti襫 phng 產ng ngh蟦 l鑙, t筸 th阨 kh玭g th? v祇 chi課 trng!",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			return
		end
		
		local OldSubWorld = SubWorld;
		SubWorld = idx;
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
	--??if getcamp=宋,进入战场时提示“你好，欢迎你加入宋军，现在辽兵尚未出现，大家先稍事休息。一旦前方号角吹响，战斗就会开始。“
	--??else =辽,进入战场时提示"辽国的勇士，欢迎你的到来！现在宋军尚未出现，大家先稍事休息。一旦前方号角吹响，战斗就会开始。"
		local SubWorld = OldSubWorld;
		return
	else
		Say("Xin l鏸! Ti襫 phng 產ng ngh蟦 l鑙, t筸 th阨 kh玭g th? v祇 chi課 trng!", 0);
	end
end;

function bt_wantjin()
		Say("Ngi th藅 s? mu鑞 gia nh藀 phe Li猽? Sau khi ch鋘 phe s? c? hi謚 l鵦 trong m閠 v遪g! Ch? c? th? ch鋘 phe kh竎 khi tr薾 sau b総 u!",2, "Ta quy誸 gia nh藀 phe Li猽/bt_joinjin", "в ta suy ngh? l筰/bt_oncancel");
end;

function bt_wantsong()
		Say("Ngi th藅 s? mu鑞 gia nh藀 phe T鑞g? Sau khi ch鋘 phe s? c? hi謚 l鵦 trong m閠 v遪g! Ch? c? th? ch鋘 phe kh竎 khi tr薾 sau b総 u!",2, "Ta quy誸 gia nh藀 phe T鑞g/bt_joinsong", "в ta suy ngh? l筰/bt_oncancel");
end;

function bt_joinsong()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 1)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("战役公告：新战役开始了，您上一次的战役总战功将被清零。")
	Msg2Player("Hoan ngh猲h anh h飊g. H穣 nhanh ch﹏ v祇 chi課 trng!")
	Say("Hoan ngh猲h anh h飊g tr? th祅h tng s? T鑞g Tri襲. Hi謓  khai chi課! C? mu鑞 l藀 t鴆 v祇 chi課 trng?", 2, "Л頲!/bt_enterbattle", "в ta suy ngh? l筰/bt_oncancel");
end;

function bt_joinjin()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 2)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("战役公告：新战役开始了，您上一次的战役总战功将被清零。")
	Msg2Player("Hoan ngh猲h d騨g s? Li猽 Qu鑓! H穣 nhanh ch﹏ v祇 chi課 trng!")
	Say("Hoan ngh猲h anh h飊g tr? th祅h d騨g s? Li猽 Qu鑓. Hi謓  khai chi課! C? mu鑞 l藀 t鴆 v祇 chi課 trng?", 2, "Л頲!/bt_enterbattle", "в ta suy ngh? l筰/bt_oncancel");
end;

function bt_oncancel()

end
