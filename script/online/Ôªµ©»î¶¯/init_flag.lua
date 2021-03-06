--filename:init_flag.lua
--create date:2005-12-26
--author:yanjun
--describe:初始化夺旗活动
Include("\\script\\online\\元旦活动\\yuandan_head.lua")

function main()
	local iMonth = GetCurMonth()
	local iDay = GetCurDate()
	if ((iMonth == 12 and iDay ==31) or (iMonth == 1 and iDay <= 5)) and YUANDAN_SWITCH == 1 then
		AddLocalNews("Hi謓 gi? ho箃 ng Nguy猲 Цn 畂箃 k?  b総 u, h穣 n Nam Bi謓 Kinh, Nam Th祅h Й, B綾 Tuy襫 Ch﹗ tham gia.")
		Msg2SubWorld("Hi謓 gi? ho箃 ng Nguy猲 Цn 畂箃 k?  b総 u, h穣 n Nam Bi謓 Kinh, Nam Th祅h Й, B綾 Tuy襫 Ch﹗ tham gia.")
		Init_Flag()
	end
end

function Init_Flag()
	if GetGlbValue(ID_FLAG_NUMBER_QZ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_QZ,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_CD) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_CD,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_BJ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_BJ,0)
	end
	local flagNo_QZ = GetGlbValue(ID_FLAG_NUMBER_QZ)
	local flagNo_CD = GetGlbValue(ID_FLAG_NUMBER_CD)
	local flagNo_BJ = GetGlbValue(ID_FLAG_NUMBER_BJ)
	SetGlbValue(ID_FLAG_NUMBER_QZ,flagNo_QZ+5)
	SetGlbValue(ID_FLAG_NUMBER_CD,flagNo_CD+5)
	SetGlbValue(ID_FLAG_NUMBER_BJ,flagNo_BJ+5)
	local npcFlag
	--=================================泉州府北==============================
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",108,1576,2994)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",108,1571,2982)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",108,1564,2968)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",108,1553,2965)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",108,1543,2954)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	--=================================汴京府南==============================
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",201,1460,2808)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",201,1455,2823)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",201,1445,2831)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",201,1437,2833)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",201,1427,2830)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	--=================================成都府南==============================
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",304,1396,2925)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",304,1398,2940)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",304,1402,2949)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",304,1404,2931)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
	npcFlag = CreateNpc("Ti猽 s?-i tho筰","Ti猽 k?",304,1407,2973)
	SetNpcScript(npcFlag,"\\script\\online\\元旦活动\\旗子.lua")
end
