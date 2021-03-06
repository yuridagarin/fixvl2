--=============================================
--create by baiyun 2009.4.13
--describe:越南版4月份金星星银星星活动 锦囊大事件
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\online\\viet_2009_4\\collectjqbox\\tianjilaoren.lua")

function OnUse()

	----检查活动时间
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
		return 0;
	end
	
	Say(
			"Ho箃 ng ch祇 m鮪g s? ki謓 30/4 di詎 ra trong kho秐g 24-04-2009 n 24:00 ng祔 31-05-2009.:",
			5,
			"T筰 h? mu鑞 n﹏g c蕄 Lam K? (C莕 3 Lam K? v? 10 b筩)/JQ_LevelBToRFlag",
			"T筰 h? c莕 gh衟 H錸g K? v韎 Ho祅g Kim Th筩h (nh薾 頲 Ho祅g Kim K? ho芻 B筩h Kim K?)/JQ_GroupRedAndStone",
			"Nh薾 Ng玦 Sao B筩 (nh薾 t? 18h ? 19h, t? th? hai n th? s竨 h祅g tu莕)./JQ_GetSilverStar",
			"T譵 hi觰 th玭g tin s? ki謓/JQ_GetInfo",
			"K誸 th骳 i tho筰/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetSilverStar()
--领取银星星
--------------------------------------
function JQ_GetSilverStar()

	-----判断等级----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V蒼 ch璦 t n c蕄 <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color>, kh玭g th? tham gia ho箃 ng.");
		return 0;
	end
	
	--检查当前时间是否可以领取银星星（从18：00 - 19:00,从周1到周5每周）
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDay == 0 or nDay == 6 then
		Talk(1, "", "B﹜ gi? kh玭g th? nh薾 ng玦 sao v祅g");
		return 0;
	end
	if nHour ~= 18 and nHour ~= 19 then
		Talk(1, "", "B﹜ gi? kh玭g th? nh薾 ng玦 sao v祅g");
		return 0;
	end
	--检查今天是否有得到银星星
	--检查得到的银星星的次数是否到达每天可以得到的上限
	local nDate = tonumber(date("%y%m%d"));
	
	if GetTask(GSSTARS_TASK_GET_SSTARS_DATE) < nDate then --如果今天第一次获得银星星
		SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, 0);
	end;
	
	--判断领取银星星是否已到最大数量
	if GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) >= GSSTARS_GET_SSTAR_MAX_TIME then 
		Talk(1, "", "H玬 nay  nh薾 <color=yellow>".. GetTask(GSSTARS_TASK_GET_SSTARS_DATE) .." l莕<color> ng玦 sao b筩, i ng祔 mai h絥g n l筰 nh?.");
			return 0;
	end
	
	--判断与上次领取银星星的时间间隔
		if GetTime() - GetTask(GSSTARS_TASK_GET_SSTARS_TIME) < GSSTARS_GET_SSTARS_INTERVAL then
			Talk(1, "", "Th阨 gian gi穘 c竎h hai l莕 nh薾 ng玦 sao b筩 l? <color=yellow>" .. GSSTARS_GET_SSTARS_INTERVAL .. " gi﹜.");
			return 0;
		end
	
	-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l鏸, ") == 0 then
		return 0;
	end
	
	--判断玩家可以得到几个银星星
	local nSilverStarCount = GSSTARS_PARAM[floor(GetLevel() / 10)][2];
	--可以给银星星了
	if AddItem(2, 1, 30077, nSilverStarCount) == 1 then
				Msg2Player("B筺 nh薾 頲 " .. nSilverStarCount .. "c竔" .. "Ng玦 Sao b筩");
				WriteLog("[Ho箃 ng ng玦 sao v祅g ng玦 sao b筩 th竛g 4]:" .. GetName() .. "Nh薾 頲" .. "!!" .. nSilverStarCount .. "c竔" .. "Ng玦 Sao b筩");
			--给完银星星后，更新下列值：
			SetTask(GSSTARS_TASK_GET_SSTARS_DATE, nDate);
			SetTask(GSSTARS_TASK_GET_SSTARS_TIME, GetTime());
			SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) + 1);
	end

end

--------------------------------------
--JQ_GetInfo()
--了解活动信息
--------------------------------------
function JQ_GetInfo()
	Say(
			"S? ki謓 30/4 n╩ nay bao g錷 c竎 ho箃 ng sau y::",
			4,
			"S? ki謓 30 th竛g 4/#JQ_EventDetail(1)",
			"Tr錸g c﹜ 1 th竛g 5/#JQ_EventDetail(2)",
			"Ng玦 Sao V祅g/#JQ_EventDetail(3)",
			"K誸 th骳 i tho筰/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetInfo()
--了解活动信息
--------------------------------------
function JQ_EventDetail(nType)
	if nType == 1 then
		Talk(1,"JQ_GetInfo","Ho箃 ng ch祇 m鮪g s? ki謓 30/4 di詎 ra trong kho秐g 24-04-2009 n 24:00 ng祔 31-05-2009. Trong th阨 gian s? ki謓, c竎 h? c? th? thu th藀 Rng Hi謚 K?  th玭g qua nhi謒 v? S? M玭,T祅g Ki誱 S琻 Trang, tr錸g C﹜ B竧 Nh?. M? Rng Hi謚 K? s? thu 頲 Lam K?, n﹏g c蕄 Lam K? th祅h H錸g K? (qu? tr譶h n﹏g c蕄 c? th? s? c? th蕋 b筰, th蕋 b筰 b筺 ch? nh薾 l筰 頲 2 Lam K?), k誸 h頿 H錸g K? v韎 Ho祅g Kim K? Th筩h s? thu 頲 Ho祅g Kim K? , n誹 may m緉 b筺 s? nh薾 頲 B筩h Kim K? v韎 nh鱪g ph莕 thng c鵦 k? h蕄 d蒼."	)
	elseif nType == 2 then
		Talk(1,"JQ_GetInfo","Ho箃 ng tr錸g c﹜ di詎 ra trong kho秐g 24-04-2009 n 24:00 31-05-2009. Trong th阨 gian s? ki謓, c竎 h? c? th? mua H箃 Gi鑞g t? Ng? C竎. C? th? gieo h箃 gi鑞g t筰 6 Чi Th祅h Th?. Khi gieo h箃 gi鑞g s? ng蓇 nhi猲 nh薾 琧 c竎 lo筰 c﹜ kh竎 nhau nh?: C﹜ H衞 骯, C﹜ B蕋 T?, C﹜ B筩h Ng﹏, C﹜ Ho祅g Kim, C﹜ B筩h Kim. Qu? tr譶h tr錸g c﹜ di詎 ra nh? sau:- Gi﹜ th? 1 n gi﹜ th? 45: gieo h箃, nh薾 頲 lo筰 c﹜ ng蓇 nhi猲\n- Gi﹜ th? 46 n gi﹜ th? 240: l? giai 畂筺 ngi ch琲 s? d鬾g l? th駓  ch╩ s鉩 cho c﹜. цi v韎 lo筰 c﹜ B蕋 T? th? kh玭g c莕 d飊g L? Th駓  ch╩ s鉩\n- Gi﹜ th? 241 n gi﹜ th? 300: giai 畂筺 thu ho筩h ph莕 thng, ph莕 thng s? tng 鴑g v韎 m鏸 lo筰 c﹜ kh竎 nhau ")	
	else
		Talk(1,"JQ_GetInfo","Ho箃 ng Ng玦 Sao V祅g ? Ng玦 Sao B筩 di詎 ra trong kho秐g 24-04-2009 24:00 31-05-2009. V祇 c竎 th阨 gian 18 gi? n 19 gi?, t? th? hai n th? s竨 h祅g tu莕, c竎 h? c? th?  thu th藀 mi詎 ph? Ng玦 Sao B筩 t筰 C萴 Nang Чi S? Ki謓. \n- T飝 theo c蕄  c馻 nh﹏ v藅 m? s? nh薾 頲 s? lng Ng玦 Sao B筩 kh竎 nhau\n- Th阨 gian gi鱝 2 l莕 nh薾 Ng玦 Sao B筩 li猲 ti誴 l? 5 ph髏\n- C竎 h? d飊g Ng玦 Sao B筩  n﹏g c蕄 th祅h Ng玦 Sao V祅g t筰 NPC Phi Y課 Ti猲 T?.\n- T? th? b秠 n ch? nh藅 h祅g tu莕, c竎 h? d飊g Ng玦 Sao V祅g  i l蕐 ph莕 thng t筰 NPC Phi Y課 Ti猲 T?."	)	
	end	
end