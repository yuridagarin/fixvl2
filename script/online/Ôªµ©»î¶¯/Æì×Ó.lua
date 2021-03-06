--filename:旗子.lua
--create date:2005-12-23
--author:yanjun
--describe:职能NPC脚本
Include("\\script\\online\\元旦活动\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--确保无死亡惩罚
	if GetLevel() < 10 then	--小于１０级不能参加
		Say("Ъng c蕄 c馻 ngi th蕄 h琻 <color=red>10<color> c騨g mu鑞 tham gia 畂箃 k? ?? H穣 r蘮 luy謓 th猰 v礽 ba n╩ n鱝 nh?!",0)
		return 0
	end
	if GetPlayerRoute() == 0 then	--没加入门派者不能参加
		Say("Ngi ch琲 ph秈 gia nh藀 m玭 ph竔 m韎 c? th? tham gia Nguy猲 Цn 畂箃 k?.",0)
		return 0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--新的一天，已夺旗标记清0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("B筺  畂箃 k? th祅h c玭g, h玬 nay kh玭g th? tham gia ti誴, ng祔 mai h穣 quay l筰 nh?!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("M鏸 ngi ch? c? th? mang 1 ti猽 k?.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		SetDeathScript("\\script\\online\\元旦活动\\playerdeath.lua")
		npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		SummonNpc("Ti猽 s?-chi課 u","Ti猽 k?")
		AddTitle(3,3)
		SetCurTitle(3,3)
		Msg2Player("B筺  畂箃 頲 ti猽 k?, h穣 mau giao cho 畂箃 ti猽 gi竜 u.")
		mapID,mapX,mapY = GetWorldPos()
		SetTaskTemp(MAP_ID,mapID)	--记录得到旗子时玩家的座标
		SetTaskTemp(MAP_X,mapX)
		SetTaskTemp(MAP_Y,mapY)
		SetTaskTemp(TASK_FLAG_FOLLOW,1)
	end
end
