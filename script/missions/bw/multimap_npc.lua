Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 1 then
		strSay = {
							"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課 (tr薾 th? 1), ngi ch琲 tham gia thi u u c? th? nh薾 頲 ph莕 thng 甶觤 s鴆 kh醗 tng 鴑g sau khi thi u k誸 th骳.",
							"R阨 kh醝 tr薾 a/LeaveTalk",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Hundred(2)",
							"Kh玭g c? g?/no"
							}
	elseif GetMissionV(GAME_TYPE) == 2 then
		strSay = 	{
							"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課 (tr薾 th? 2), ngi ch琲 tham gia thi u m鏸 l莕 nh b筰 i th? c? th? nh薾 頲 ph莕 thng ti襫 nh蕋 nh. u th? chi課 th緉g sau c飊g s? nh薾 頲 ph莕 thng phong ph?.",
							"R阨 kh醝 tr薾 a/LeaveTalk",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Hundred(3)",
							"Kh玭g c? g?/no"
							}
	else
		strSay = {
							"Hi誱 khi c? d辮  xem c竎 i hi謕 tr猲 giang h? bi觰 di詎 v? ngh?, i khi h? ph秈 nh i c? gia t礽 m韎 luy謓 th祅h. L莕 n祔 ng d辮 may! Ch糿g hay"..GetPlayerSex().."C? c莕 g? kh玭g?",
							"R阨 kh醝 tr薾 a/LeaveTalk",
							"T譵 hi觰 quy t綾 l玦 i/#Rule_Hundred(1)",
							"Kh玭g c? g?/no"
							}
	end

	SelectSay(strSay)

end

function LeaveTalk()

	Talk(1,"LeaveMultiMap","Hy v鋘g l莕 sau c? d辮 tr? l筰 n琲 n祔 xem u l玦 i!"..GetPlayerSex().."Phong th竔 c馻 b筺.");

end


--玩家要求离开比赛场地
function LeaveMultiMap()

local nCamp = GetTaskTemp(PLAYER_CAMP)

	--观众离场
	if nCamp == 2 then
		DelMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);		
	--选手离场	
	elseif nCamp == 1 then
		Msg2MSAll(GetName().."  r阨 kh醝 tr薾 a.");
		DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
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

function Rule_Hundred(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
		"Qu莕 h飊g chi課 ph秈 do 2 ho芻 nhi襲 h琻 c竎 hi謕 kh竎h giang h? tham gia m韎 c? th? m? chi課 a t? v?. M鏸 u s? tham chi課 s? t? m譶h l祄 ch?. u th? m筺h m? chi課 u n cu鑙 c飊g s? l? ngi chi課 th緉g!",
		"Qu莕 h飊g chi課 l莕 n祔 th? nghi謒 t? v? 1 i 1, ngo礽 vi謈 tr綾 nghi謒 c玭g l鵦 b秐 th﹏ c遪 c莕 bi誸 頲 s竎h lc chi課 u kh竎 nhau c馻 c竎 i th? m筺h y誹 v? bi課 h鉧 c馻 chi課 a  gi祅h 頲 chi課 th緉g cu鑙 c飊g. N誹 c竎 h? l? ngi v? ch tr猲 tr薾 n u l玦 i 1 i 1, ch璦 t譵 頲 i th?. H穣 n ch鴑g t? b秐 l躰h c馻 m譶h trong tr薾 Qu莕 h飊g chi課!",
		"Qu莕 h飊g chi課 ph? th玭g: cho ph衟 hi謕 kh竎h giang h? c蕄 10 tr? l猲  gia nh藀 m玭 ph竔 tham gia v? kh玭g c莕 n閜 ti襫. Л琻g nhi猲, ngi chi課 th緉g c騨g kh玭g nh薾 頲 ph莕 thng n祇. Sau khi m阨 v祇 chi課 a th祅h c玭g s? c? th阨 gian chu萵 b? l? 3 ph髏, h誸 th阨 gian s? t? ng khai chi課. N誹 s? ngi tham chi課 輙 h琻 1 ngi, thi u s? b? h駓 b?.",
		}
	
	elseif nType == 2 then
		strTalk = {
			"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課- tr薾 th? 1, ngi ch琲 tham gia thi u u c? th? nh薾 頲 ph莕 thng 甶觤 s鴆 kh醗 tng 鴑g sau khi thi u k誸 th骳.",
			"M鏸 u th? tham chi課 s? t? m譶h l祄 ch?. u th? m筺h m? chi課 u n cu鑙 c飊g s? l? ngi chi課 th緉g!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi u 產ng t? ch鴆 l? Qu莕 h飊g chi課- tr薾 th? 2, ngi ch琲 tham gia thi u m鏸 l莕 nh b筰 i th? c? th? nh薾 頲 ph莕 thng ti襫 nh蕋 nh. u th? chi課 th緉g sau c飊g s? nh薾 頲 ph莕 thng phong ph?.",
			"M鏸 u th? tham chi課 s? t? m譶h l祄 ch?. u th? m筺h m? chi課 u n cu鑙 c飊g s? l? ngi chi課 th緉g!",
			}
	end

	TalkEx("#Rule_Hundred_1("..nType..")",strTalk)

end

function Rule_Hundred_1(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
			"M鏸 tr薾, s? ngi tham chi課 t鑙 產 l? 100 ngi, th阨 gian thi u l? 15 ph髏. Khi k誸 th骳, b猲 n祇 c遪 l筰 nhi襲 ngi h琻 s? chi課 th緉g! N誹 s? ngi c遪 l筰 b籲g nhau th? b猲 n祇 l骳 v祇 輙 h琻 s? chi課 th緉g!",
--			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{百人英雄大擂}。时间分别为 {早上11:00}、{11:30}，{下午17:00}、{17:30}和{晚上21:00}、{21:30}。",
--			"代志强：{百人英雄大擂}则需要满{60级及以上已有门派}的江湖侠士参加，第一场比赛的胜出者可以获得相应的健康经验奖励，而第二场比赛的胜出者更可获得丰厚的奖金。",
--			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
			}
	
	elseif nType == 2 then
		strTalk = {
			"M鏸 tr薾, s? ngi tham chi課 t鑙 產 l? 100 ngi, th阨 gian thi u l? 15 ph髏. Khi k誸 th骳, b猲 n祇 c遪 l筰 nhi襲 ngi h琻 s? chi課 th緉g! N誹 s? ngi c遪 l筰 b籲g nhau th? b猲 n祇 l骳 v祇 輙 h琻 s? chi課 th緉g!",
			}
	elseif nType == 3 then
		strTalk = {
			"M鏸 tr薾, s? ngi tham chi課 t鑙 產 l? 100 ngi, th阨 gian thi u l? 15 ph髏. Khi k誸 th骳, b猲 n祇 c遪 l筰 nhi襲 ngi h琻 s? chi課 th緉g! N誹 s? ngi c遪 l筰 b籲g nhau th? b猲 n祇 l骳 v祇 輙 h琻 s? chi課 th緉g!",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
