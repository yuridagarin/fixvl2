Include("\\script\\battles\\butcher\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v鵦 s? c蕄"
		lvllimit = 40
	elseif (lsf_level == 2) then
		resultstr = "Khu v鵦 cao c蕄"
		lvllimit = 70
	end
	
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)

	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit() ) then
			SetMissionV(MS_MOSTDEATH, 1) 
			CloseMission(MISSIONID)
			return
		end
		RunMission(MISSIONID)
		AddGlobalNews(resultstr.."Thi猲 M玭 tr薾 t筰 Nh筺 M玭 quan  m?. C竎 hi謕 kh竎h xin nhanh ch﹏ n b竜 danh tham chi課!");
		Msg2Global(resultstr.."Thi猲 M玭 tr薾 t筰 Nh筺 M玭 quan  m?. C竎 hi謕 kh竎h xin nhanh ch﹏ n b竜 danh tham chi課!")
		Msg2MSAll(MISSIONID, "Чi chi課 Nh筺 M玭 quan ch輓h th鴆 khai chi課! C竎 tng s?! Ti課 l猲!");
		WriteLog("butcher battle is entering fight state\tsong member count\t"..GetMSPlayerCount(MISSIONID, 1).."\tliao member count\t"..GetMSPlayerCount(MISSIONID, 2), "Nh藅 k? T鑞g Li猽")
	end

	if (t == CLOSE_SIGNUP_TIME) then
		AddGlobalNews("Chi課 trng 產ng di詎 ra kh鑓 li謙. Л阯g v祇 chi課 trng  b? phong t醓! Vi謓 qu﹏ m鏸 b猲 xin i tr薾 sau!")
		Msg2Global("Chi課 trng 產ng di詎 ra kh鑓 li謙. Л阯g v祇 chi課 trng  b? phong t醓! Vi謓 qu﹏ m鏸 b猲 xin i tr薾 sau!")
	end

	if (t < RUNGAME_TIME and mod(t, 3) == 0 ) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."Thi猲 M玭 tr薾 t筰 Nh筺 M玭 quan s緋 khai chi課. C竎 hi謕 kh竎h h穣 mau ch鉵g mang theo Anh h飊g l謓h n Nh筺 M玭 quan b竜 danh! Th阨 gian b竜 danh c遪"..RestMin.." ph髏. 襲 ki謓 tham chi課: Ъng c蕄 t?"..lvllimit.." tr? l猲.";
			str2 = "Th阨 gian khai chi課 c遪:"..RestMin.." Ph髏 "
		else
			str1 = resultstr.."Thi猲 M玭 tr薾 t筰 Nh筺 M玭 quan s緋 khai chi課. C竎 hi謕 kh竎h h穣 mau ch鉵g mang theo Anh h飊g l謓h n Nh筺 M玭 quan b竜 danh! Th阨 gian b竜 danh c遪"..RestMin.." Ph髏 "..RestSec.." gi﹜. 襲 ki謓 tham chi課: Ъng c蕄 kh玭g nh? h琻"..lvllimit.." tr? l猲.";
			str2 = "Th阨 gian khai chi課 c遪:"..RestMin.." Ph髏 "..RestSec.." Gi﹜ "
		end
		if( mod(t, 18) == 0 ) then
			AddGlobalNews(str1);
			Msg2Global(str1)
		end
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then

		--如果场上某一阵营人数低于最小数量，则比赛结束，人多的阵营直接获胜
		if( t > RUNGAME_TIME and wl_search_memcount() == 1 ) then
			CloseMission(MISSIONID)
			return
		end

		--每一分钟通告当前双方战功，和npc
		if (mod(t, 3) == 0 ) then
			msstr = "Th玭g b竜: Chi課 c玭g 2 phe T鑞g Li猽 hi謓 l?"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
			
			local gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
			local gamerestmin, gamerestsec = GetMinAndSec(gametime);
			if( gamerestmin ~= 0 ) then
				Msg2MSAll( MISSIONID, "Th阨 gian k誸 th骳 tr薾 chi課 c遪"..gamerestmin.." ph髏 " )
				if ( mod(t,30) == 0 and t > RUNGAME_TIME and t < CLOSE_SIGNUP_TIME) then
					AddGlobalNews("Chi課 u gi鱝 T鑞g qu﹏ v? Li猽 binh 產ng h錳 k辌h li謙, th阨 gian k誸 th骳 tr薾 chi課 c遪"..gamerestmin.." ph髏, c竎 tng s? kh萵 trng d飊g Anh h飊g l謓h th糿g ti課 Nh筺 M玭 quan tham chi課!")
					Msg2Global("Chi課 u gi鱝 T鑞g qu﹏ v? Li猽 binh 產ng h錳 k辌h li謙, th阨 gian k誸 th骳 tr薾 chi課 c遪"..gamerestmin.." ph髏, c竎 tng s? kh萵 trng d飊g Anh h飊g l謓h th糿g ti課 Nh筺 M玭 quan tham chi課!")
				end
			end
			resttime_to_close = (CLOSE_SIGNUP_TIME - t) * TIMER_1 / FRAME2TIME
			m, s = GetMinAndSec(resttime_to_close);
			if (m > 0 and mod(t, 15) == 0) then
				Msg2Global("Л阯g v祇 Nh筺 M玭 quan s? ng sau "..m.."  ph髏, vi謓 qu﹏ m鏸 b猲 h穣 kh萵 c蕄 ti課 v? chi課 trng!")
			end
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end
end
