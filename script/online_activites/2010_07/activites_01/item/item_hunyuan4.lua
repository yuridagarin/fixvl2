--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 混元功4成脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_hunyuan.lua");--活动头文件
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- Chuy觧 sinh VN

--g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[17][1], 2, 1);

function OnUse(nItemIdx)
	if GetTranslifeCount() < 2 then
		Talk(1,"","Ph秈 luy謓 th祅h H鏽 Nguy猲 C玭g th祅h th? 4 m韎 c? th? s? d鬾g v藅 ph萴 n祔")
		return
	end

    local tSay = {}
    local szHeader = "Ch骳 m鮪g c竎 h?  t n nh cao c馻 H鏽 Nguy猲 C玭g th祅h th? 4, h穣 ch鋘 ph莕 thng h? tr? :"
   	tinsert(tSay, "N﹏g c蕄 th? ci K? L﹏ (c莕 1 Phi猽 V? + 100 v祅g)/do_bonus")
   	tinsert(tSay, "Tho竧/do_nothing")
   	
   	Say(szHeader, getn(tSay), tSay)
end

function do_bonus()
	if GetLevel() < 98 then
		Talk(1,"","Ъng c蕄 98 tr? l猲 m韎 c? th? s? d鬾g ch鴆 n╪g n祔!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"","Ch璦  ng﹏ lng  i!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","H祅h trang kh玭g  ch? tr鑞g ho芻  n苙g, vui l遪g s緋 x誴 l筰!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B筺 ph秈 trang b? ng鵤 m韎 c? th? i 頲!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B筺 ph秈 trang b? Phi猽 V? m韎 c? th? i 頲!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(1000000) == 1 then	
		local nOk, nItemIndex = AddItem(0, 105, 33, 1, 1, 3, 403)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nExpireTime)
		end
		Msg2Player("Nh薾 頲 th? ci K? L﹏.")
		gf_WriteLogEx("Ho tro Chuyen Sinh 2", "i K? L﹏")
	end
end

function do_nothing()
	
end