--filename:襄阳雪仗传送人in.lua
--create date:2006-01-12
--author:yanjun
--describe:襄阳雪仗传送人（进场）脚本

Include("\\script\\online\\春节活动\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi誹 hi謕"
	elseif GetSex() == 2 then
		strSex = "C? nng"
	else
		strSex = "Thi誹 hi謕/N? hi謕"
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060120 then
		Say("M蕐 h玬 nay tuy誸 ch璦 r琲 n猲 khu n衜 tuy誸 ch璦 th? m?, m阨"..strSex.."l莕 sau quay l筰 nh?!",0)
		return 0
	end
	if nDate > 20060205 then
		Say("Xu﹏ n hoa n?, tuy誸 b総 u tan, e r籲g kh玭g th鵦 hi謓 頲 k? ho筩h r錳."..strSex.."N╩ t韎 c竎 v? nh? n y ch琲 ti誴 nh?!",0)
		return 0
	end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"H穣 mau a ta n !/go",
					"T譵 hi觰 ho箃 ng./know_detail",
					"Ta  qua tu鎖 n祔 r錳 ?!/nothing"
					}
		Say("V? "..strSex.."l? n祇 kh玭g mu鑞 nh﹏ c? h閕 ch琲 a th醓 th輈h m閠 l莕 hay sao?",3,selTab)
	else
		Say("M蕐 h玬 nay tuy誸 ch璦 r琲 n猲 khu n衜 tuy誸 ch璦 th? m?, m阨"..strSex.."l莕 sau quay l筰 nh?!",0)
	end
		
end

function go()
	if GetPlayerRoute() == 0 then
		Say("Xin l鏸, ngi ch琲  gia nh藀 m玭 ph竔 m韎 c? th? tham gia ho箃 ng N衜 tuy誸 畂箃 b秓 v藅.",0)
		return 0
	end
	--进入雪仗地图时创建离开地图触发器
	local id,idx = 0,0
	bCreateFailed = 0 
	for i=1,5 do	
		Tid = 1710 + i
		Tidx = 3100 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--创建离开地图触发器
				bCreateFailed = 1
			end
		end
	end
	if bCreateFailed == 1 then	--触发器创建失败就不给进场
		Say("V祇 b秐  th蕋 b筰, xin h穣 th? l筰!",0)
		WriteLog("[Ho箃 ng m颽 xu﹏ -K誸 n鑙 th蕋 b筰]:"..GetName().."V祇 b秐 , k誸 n鑙 m竬 ch? th蕋 b筰 (3101~3105).")
		return 0
	end

	local Entry = {
				{964,1665,3582},
				{964,1665,3497},
				{964,1665,3425},
				{964,1665,3360},
				{964,1664,3291},
				{964,1695,3228},
				{964,1730,3221},
				{964,1763,3224},
				{964,1795,3226},
				{964,1826,3226},
				{964,1854,3292},
				{964,1856,3365},
				{964,1856,3422},
				{964,1858,3498},
				{964,1856,3582}
				}
	local EntryNo = random(1,15)
	NewWorld(Entry[EntryNo][1],Entry[EntryNo][2],Entry[EntryNo][3])	--随机入口
	if GetWorldPos() == 964 then
		for SkillID=843,851 do
		LearnSkill(SkillID)	--学会打雪仗技能
		end
		if GetTask(TASK_GOT_SNOWBALL) ~= GetCurDate() then
			SetTask(TASK_GOT_SNOWBALL,0)
		end
		if GetTask(TASK_GOT_SNOWBALL) == 0 then
			AddItem(2,3,216,20)
			AddItem(2,3,219,20)
			SetTask(TASK_GOT_SNOWBALL,GetCurDate())
			Msg2Player("B筺 nh薾 頲 20 n Ti觰 Tuy誸 C莡 v? 20 Ti觰 Tuy誸 C莡")
		end
		local BornPoint = {
						{1859,3230},
						{1664,3654},
						{1664,3229},
						{1854,3654}
						}
		SetDeathPunish(0)
		SetFightState(1)
		EntryNo = random(1,4)
		SetTempRevPos(964,BornPoint[EntryNo][1]*32,BornPoint[EntryNo][2]*32)	--随机重生点
		SetDeathScript("\\script\\online\\春节活动\\playerdeath.lua")
		SetPKFlag(2,1)
		UseScrollEnable(0)
		Msg2Player("Hoan ngh猲h c竎 b筺 v祇 khu n衜 tuy誸 畂箃 b秓.")
	end
end

function know_detail()
	Talk(6,"","V祇 khu n衜 tuy誸 ngi s? c? m閠 s? k? n╪g trong ? k? n╪g b猲 ph秈 (kh玭g ph秈 b秐g k? n╪g F5)","K? n╪g kh竎 nhau s? ti猽 hao Tuy誸 C莡 kh竎 nhau. M鏸 ng祔 v祇 khu n衜 tuy誸 s? 頲 ph竧 20 n Ti觰 Tuy誸 C莡 v? 20 Ti觰 Tuy誸 C莡 mi詎 ph?, c騨g c? th? mua t筰 ti謒 t筽 h鉧 ho芻 Tuy誸 Gi?.","5 th祅h th? m鏸 th祅h u c? 1 Tuy誸 Gi?, tng 鴑g v韎 5 khu n衜 tuy誸 kh竎 nhau.","Khu n衜 tuy誸 c? r蕋 nhi襲 b秓 rng ch鴄 nhi襲  qu? ch? ngi n m?.","M鏸 ng祔 12h, 18h, 21h t筰 5 khu n衜 tuy誸 s? ph竧 100 ph莕 qu? n╩ m韎. M鋓 ngi h穣 nhanh ch﹏ n l蕐!","Ch? ?: Trong khu v鵦 n衜 tuy誸 kh玭g th? s? d鬾g H錳 Th祅h ph? hay M藅 H祄 c馻 s? ph?.")
end

function nothing()

end
