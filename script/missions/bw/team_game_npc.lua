Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 3 then
		strSay = {
							"Thi u 產ng t? ch鴆 l? чi chi課 (tr薾 th? 1), ngi ch琲 tham gia thi u u c? th? nh薾 頲 ph莕 thng 甶觤 s鴆 kh醗 tng 鴑g sau khi thi u k誸 th骳.",
							"R阨 kh醝 tr薾 a/LeaveMap",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Team(2)",
							"Kh玭g c? g?/no"
							}
	elseif GetMissionV(GAME_TYPE) == 4 then
		strSay = 	{
							"Thi u 產ng t? ch鴆 l? чi chi課 (tr薾 th? 2), ngi ch琲 tham gia thi u m鏸 l莕 nh b筰 i th? c? th? nh薾 頲 ph莕 thng ti襫 nh蕋 nh. u th? chi課 th緉g sau c飊g s? nh薾 頲 ph莕 thng phong ph?.",
							"R阨 kh醝 tr薾 a/LeaveMap",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Team(3)",
							"Kh玭g c? g?/no"
							}
	else
		strSay = {
							"Hi誱 khi c? d辮  xem c竎 i hi謕 tr猲 giang h? bi觰 di詎 v? ngh?, i khi h? ph秈 nh i c? gia t礽 m韎 luy謓 th祅h. L莕 n祔 ng d辮 may! Ch糿g hay"..GetPlayerSex().."C? c莕 g? kh玭g?",
							"R阨 kh醝 tr薾 a/LeaveMap",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Team(1)",
							"Kh玭g c? g?/no"
							}
	end

	SelectSay(strSay)

end


--玩家要求离开比赛场地
function LeaveMap()

local i=0;

	if GetTaskTemp(PLAYER_CAMP) == 11 then
		DelMSPlayer(TEAM_MISSION_ID,0);
		return
	end

	--当前申请人不是队长
	if PlayerIndex ~= gf_GetTeamMember(0) then
		Say("чi trng m韎 c? th? a i r阨 kh醝 u trng!",0);
	else
		DelMSPlayer(TEAM_MISSION_ID,0);
	end
end

function GetPlayerSex()

local nSex = "";

	if GetSex() == 1 then
		nSex = "Чi hi謕";
	else
		nSex = "N? hi謕 ";
	end
	
	return nSex		

end

function Rule_Team(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"Qu莕 h飊g chi課 ph秈 c? 2 i ng? tr? l猲 tham gia m韎 c? th? m? chi課 a t? v?. M鏸 i ng? tham chi課 s? t? m譶h l祄 ch?. чi m筺h nh蕋 chi課 u n cu鑙 c飊g s? l? i chi課 th緉g!",
			"L玦 i l莕 n祔 th? nghi謒 t? i t? v? 1 i 1, ngo礽 vi謈 tr綾 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 bi誸 頲 s竎h lc chi課 u kh竎 nhau c馻 c竎 i th? m筺h y誹 v? bi課 h鉧 c馻 chi課 a  gi祅h 頲 chi課 th緉g cu鑙 c飊g. N誹 c竎 h? l? ngi v? ch, ch璦 t譵 頲 i th?. H穣 n ch鴑g t? b秐 l躰h c馻 畂祅 i trong h鏽 chi課 l玦 i!",
			"Qu莕 h飊g chi課 ph? th玭g cho ph衟 i c? 輙 nh蕋 2 ngi t? c蕄 10 tr? l猲  gia nh藀 m玭 ph竔 tham gia v? kh玭g c莕 n閜 ti襫. Л琻g nhi猲, u th? chi課 th緉g c騨g kh玭g nh薾 頲 ph莕 thng n祇. Sau khi b竜 danh th祅h c玭g s? c? 3 ph髏 chu萵 b?, h誸 th阨 gian s? t? ng khai chi課. N誹 s? i tham chi課 輙 h琻 2 i, thi u s? b? h駓 b?.",
			}
	elseif nType == 2 then
		strTalk = {
			"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課 (tr薾 th? 1), ngi ch琲 tham gia thi u u c? th? nh薾 頲 ph莕 thng 甶觤 s鴆 kh醗 tng 鴑g sau khi thi u k誸 th骳.",
			"Ch? c莕 i c? t? 2 th祅h vi猲 tr? l猲 tr? l猲 b竜 danh, s?  t? c竎h thi u. M鏸 i ng? tham chi課 s? t? m譶h l祄 ch?. чi m筺h nh蕋 chi課 u n cu鑙 c飊g s? l? i chi課 th緉g!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課 (tr薾 th? 2), i chi課 th緉g sau c飊g s? nh薾 頲 ph莕 thng phong ph?.",
			"Ch? c莕 i c? t? 2 th祅h vi猲 tr? l猲 tr? l猲 b竜 danh, s?  t? c竎h thi u. M鏸 i ng? tham chi課 s? t? m譶h l祄 ch?. чi m筺h nh蕋 chi課 u n cu鑙 c飊g s? l? i chi課 th緉g!",
			}
	end

	TalkEx("#Rule_Team_1("..nType..")",strTalk)

end

function Rule_Team_1(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"M鏸 tr薾, s? ngi tham gia m鏸 i t鑙 產 l? 10 ngi, th阨 thi u l? 15 ph髏. H誸 gi? thi u, i c遪 l筰 nhi襲 ngi h琻 s? gi祅h chi課 th緉g.",
			"Ngo礽 ra, trong khi thi u, b蕋 c? l骳 n祇 i trng b? r韙 m筺g ho芻 v? th祅h th? i m譶h s? b? x? thua!",   
--			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
--			"代志强：{团队激战大擂}则需要满{60级及以上已有门派}的{2人以上的队伍}参加，并且需由队长交纳{10金}作为比赛的入场费用，第一场比赛的胜出队伍可以获得相应的健康经验奖励，而第二场比赛的胜出队伍更可获得丰厚的奖金。",
--			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
			}
	elseif nType == 2 then
		strTalk = {
			"M鏸 tr薾, s? ngi tham gia m鏸 i t鑙 產 l? 10 ngi, th阨 thi u l? 15 ph髏. H誸 gi? thi u, i c遪 l筰 nhi襲 ngi h琻 s? gi祅h chi課 th緉g.",
			"Ngo礽 ra, trong khi thi u, b蕋 c? l骳 n祇 i trng b? r韙 m筺g ho芻 v? th祅h th? i m譶h s? b? x? thua!",   
			"L玦 i l莕 n祔 th? nghi謒 h鏽 chi課 t? v?, ngo礽 vi謈 tr綾 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 bi誸 頲 s竎h lc chi課 u kh竎 nhau c馻 c竎 i th? m筺h y誹 v? bi課 h鉧 c馻 chi課 a  gi祅h 頲 chi課 th緉g cu鑙 c飊g.",
			"Hy v鋘g c竎 giang h? hi謕 kh竎h tham gia ng !"..GetPlayerSex().."Phong th竔 c馻 b筺.",
			}
	elseif nType == 3 then
		strTalk = {
			"M鏸 tr薾, s? ngi tham gia m鏸 i t鑙 產 l? 10 ngi, th阨 thi u l? 15 ph髏. H誸 gi? thi u, i c遪 l筰 nhi襲 ngi h琻 s? gi祅h chi課 th緉g.",
			"Ngo礽 ra, trong khi thi u, b蕋 c? l骳 n祇 i trng b? r韙 m筺g ho芻 v? th祅h th? i m譶h s? b? x? thua!",   
			"L玦 i l莕 n祔 th? nghi謒 h鏽 chi課 t? v?, ngo礽 vi謈 tr綾 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 bi誸 頲 s竎h lc chi課 u kh竎 nhau c馻 c竎 i th? m筺h y誹 v? bi課 h鉧 c馻 chi課 a  gi祅h 頲 chi課 th緉g cu鑙 c飊g.",
			"Hy v鋘g c竎 giang h? hi謕 kh竎h tham gia ng !"..GetPlayerSex().."Phong th竔 c馻 b筺.",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
