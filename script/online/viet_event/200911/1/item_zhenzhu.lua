--=============================================
--create by baiyun 2009.10.14
--describe:越南版11月份活动 珍珠脚本文件
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	if GetTask(VIET_0911_TASK_ZHENZHU_COUNT) >= VIET_0911_ZHENZHU_MAX_COUNT then
		Talk(1, "", "Чi hi謕 s? d鬾g ng鋍 trai t n s? l莕 cho ph衟, kh玭g th? s? d鬾g 頲 n鱝");
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(500000)
		SetTask(VIET_0911_TASK_ZHENZHU_COUNT, GetTask(VIET_0911_TASK_ZHENZHU_COUNT) + 1);
	end
end