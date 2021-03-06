--=============================================
--create by baiyun 2009.10.15
--describe:越南版11月份活动 烟火脚本文件
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\item\\yanhuo.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 091106 or nDate > 091206 then
		Talk(1, "", "Ho箃 ng l莕 n祔  k誸 th骳");
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "C蕄 b薱 i hi謕 kh玭g  10, kh玭g th? s? d鬾g ph竜 hoa");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Чi hi謕 ch璦 gia nh藀 m玭 ph竔, kh玭g th? s? d鬾g ph竜 hoa");
		return
	end
	if GetTask(VIET_0911_TASK_YANHUO_DATE) < nDate then
		SetTask(VIET_0911_TASK_YANHUO_NUM, 0);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, 0);
	end
	if GetTask(VIET_0911_TASK_YANHUO_NUM) >= 16 then
		Talk(1, "", "M鏸 ng祔 m鏸 nh﹏ v藅 ch? c? th? s? d鬾g 16 ph竜 h鉧");
		return
	end
	if GetTime() - GetTask(VIET_0911_TASK_LAST_USE_TIME) < 120 then
		Talk(1, "", "Th阨 gian s? d鬾g li猲 ti誴 ph竜 hoa l? 2 ph髏, c莕 ph秈 i "..(120 - GetTime() + GetTask(VIET_0911_TASK_LAST_USE_TIME)).." gi﹜ m韎 c? th? s? d鬾g ti誴");
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		DoFireworks(801, 10);
		if nDate < 091109 then
			ModifyExp(1000000);
			Msg2Player("B筺 nh薾 頲 1000000 甶觤 kinh nghi謒.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph竜 hoa",1000000,"甶觤 kinh nghi謒")
		else
			ModifyExp(100000);
			Msg2Player("B筺 nh薾 頲 100000 甶觤 kinh nghi謒.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph竜 hoa",100000,"甶觤 kinh nghi謒")
		end
		ModifyReputation(10, 0);
		
		local nRand = random(1,100)
		if nRand <= 33 then
			AddItem(2,1,30120,1)
			Msg2Player("B筺 nh薾 頲 1 B竛h B竎h Hoa");	
		elseif nRand <= 67 then
			AddItem(2,1,30118,2)
			Msg2Player("B筺 nh薾 頲 2 Hoa C骳");	
		else
			AddItem(2,0,351,1)
			Msg2Player("B筺 nh薾 頲 1 L? Th駓");	
		end
		SetTask(VIET_0911_TASK_YANHUO_NUM, GetTask(VIET_0911_TASK_YANHUO_NUM) + 1);
		SetTask(VIET_0911_TASK_YANHUO_DATE, nDate);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, GetTime());		
		WriteLogEx(VIET_0911_LOG_TITLE,"Ph竜 hoa",10,"甶觤 danh v鋘g")
	end
end