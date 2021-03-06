-- 任务地图里的NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")


tMap2CityMap =
{
	[889] = 300,
}

function main()
	Say("Th﹏ l? v? l﹎ nh﹏ s? kh玭g th? ch鑙 b? tr竎h nhi謒 ch鑞g gi芻 ngo筰 x﹎, gi髉 b竎h t輓h sinh s鑞g y猲 b譶h!",
		5,
		"Gi韎 thi謚 H錳 Phong tr筰/hui_jieshao",
		"Ng╪ c秐 ti誴 vi謓/start_task",
		"Ho祅 th祅h nhi謒 v?/complete_task",
		"R阨 kh醝 H錳 Phong tr筰/leave_task",
		"K誸 th骳 i tho筰/no_say")
	init_fight()
end

function hui_jieshao()
	Say("H錳 Phong tr筰 l? n琲 a th? hi觤 tr?, s玭g ng遡 ch籲g ch辴, ch? c? 3 c﹜ c莡  qua, n琲 n祔 l? ph遪g tuy課 chi課 u cu鑙 c飊g c馻 ch, x﹜ d鵱g m閠 h? th鑞g li猲 ho祅 c竎 c玭g tr譶h ti誴 vi謓, Kho竛g trng, tr筰 ng鵤, kho lng, l蕐 g鏫nH錳 Phong tr筰 cao th? v? s?, to祅 l祄 chuy謓 x蕌 xa. H穣 ti猽 di謙 ch髇g 畂箃 c竎 b? h? gi竝  ch鴑g minh n╪g l鵦 c馻 ngi. (T? i ti猽 di謙 u m鬰 i phng, m鏸 th祅h vi猲u nh薾 頲 h? gi竝)",0)
end

function complete_task()
	Say("Th﹏ l? v? l﹎ nh﹏ s? kh玭g th? ch鑙 b? tr竎h nhi謒 ch鑞g gi芻 ngo筰 x﹎, gi髉 b竎h t輓h sinh s鑞g y猲 b譶h!",
		3,
		"Ng╪ c秐 ti誴 vi謓-tr筰 ng鵤 v? kho lng/complete_task_1",
		"Ng╪ c秐 ti誴 vi謓-Kho竛g trng v? khi n g?/complete_task_2",
		"C? h醝/no_say")
end

function complete_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 < 1 or nNow > nDate then
		Say("H玬 nay ngi ch璦 nh薾 nhi謒 v? n祔.", 0)
		return
	end
	
	if nTask1 > 1 then
		Say("Ngi  ho祅 th祅h nhi謒 v? n祔.", 0)
		return
	end
	
	if _11 == 1 and _12 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", 2, _11, _12, nTask2, _21, _22, nDate)
			Say("Ngi  ho祅 th祅h nhi謒 v?, nh薾 頲 m閠 huy chng.", 0)
			Msg2Player("Ho祅 th祅h nhi謒 v?: ng╪ c秐 ti誴 vi謓-tr筰 ng鵤 v? kho lng")
		end
	elseif _11 == 1 then
		Say("B筺  ti猽 di謙 Th? v? tr筰 ng鵤, ph秈 ti猽 di謙 lu玭 <color=yellow>Th? v? kho lng<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔",0)
	elseif _12 == 1 then
		Say("B筺  ti猽 di謙 Th? v? kho lng, c遪 ph秈 ti猽 di謙<color=yellow>Th? v? tr筰 ng鵤<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔",0)
	else
		Say("B筺 c莕 ti猽 di謙 <color=yellow>Th? v? kho lng<color>v?<color=yellow>Th? v? tr筰 ng鵤<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔.",0)
	end
end

function complete_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask2 < 1 or nNow > nDate then
		Say("H玬 nay ngi ch璦 nh薾 nhi謒 v? n祔.", 0)
		return
	end
	
	if nTask2 > 1 then
		Say("Ngi  ho祅 th祅h nhi謒 v? n祔.", 0)
		return
	end
	
	if _21 == 1 and _22 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1, _11, _12, 2, _21, _22, nDate)
			Say("Ngi  ho祅 th祅h nhi謒 v?, nh薾 頲 m閠 huy chng.", 0)
			Msg2Player("B筺  ho祅 th祅h nhi謒 v?: ng╪ c秐 ti誴 vi謓-Kho竛g trng v? M閏 trng")
		end
	elseif _21 == 1 then
		Say("B筺  ti猽 di謙 Th? v? Kho竛g trng, c莕 ph秈 ti猽 di謙 <color=yellow>Th? v? M閏 trng<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔.",0)
	elseif _22 == 1 then
		Say("B筺  ti猽 di謙 Th? v? M閏 trng, c莕 ph秈 ti猽 di謙 <color=yellow>Th? v? Kho竛g trng<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔.",0)
	else
		Say("B筺 c莕 ti猽 di謙 <color=yellow>Th? v? Kho竛g trng<color>v?<color=yellow>Th? v? M閏 trng<color> m韎 c? th? ho祅 th祅h nhi謒 v? n祔.",0)
	end
end

function start_task()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow > nDate then		-- 清理掉昨天的任务
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
	end

	Say("Th﹏ l? v? l﹎ nh﹏ s? kh玭g th? ch鑙 b? tr竎h nhi謒 ch鑞g gi芻 ngo筰 x﹎, gi髉 b竎h t輓h sinh s鑞g y猲 b譶h!",
		3,
		"Ng╪ c秐 ti誴 vi謓-tr筰 ng鵤 v? kho lng/get_task_1",
		"Ng╪ c秐 ti誴 vi謓-Kho竛g trng v? khi n g?/get_task_2",
		"C? h醝/no_say")
end

function get_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H玬 nay ngi  nh薾 nhi謒 v? n祔.",0)
		return
	end
	Say("Ng鵤 v? lng th秓 ch輓h l? n襫 t秐g c? b秐  chi課 u, h穣 甶 t s筩h kho lng v? tr筰 ng鵤 c馻 ch!",
		2,
		"Ti誴 nh薾 nhi謒 v?/get_task_1_yes",
		"C? h醝/no_say")
end

function get_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H玬 nay ngi  nh薾 nhi謒 v? n祔.",0)
		return
	end
	Say("Gi? h穣 甶 ti猽 di謙 b鋘 l輓h canh g竎 Kho竛g trng v? M閏 trng.",
		2,
		"Ti誴 nh薾 nhi謒 v?/get_task_2_yes",
		"C? h醝/no_say")
end

function get_task_1_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H玬 nay ngi  nh薾 nhi謒 v? n祔.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", 1,0,0,nTask2,_21,_22,nNow)
	Msg2Player("Ti誴 nh薾 nhi謒 v?: ng╪ c秐 ti誴 vi謓-tr筰 ng鵤 v? kho lng")
end

function get_task_2_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H玬 nay ngi  nh薾 nhi謒 v? n祔.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,1,0,0,nNow)
	Msg2Player("Ti誴 nh薾 nhi謒 v?: ng╪ c秐 ti誴 vi謓-Kho竛g trng v? M閏 trng")
end

function leave_task()
	uninit_fight()
	LeaveTeam()
	SetLogoutRV(0)
	NewWorld(300, 1732, 3540)
end

function no_say()
end