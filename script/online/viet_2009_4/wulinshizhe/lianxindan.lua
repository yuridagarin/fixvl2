--=============================================
--create by baiyun 2009.4.14
--describe:越南版4月份武林使者活动 连心丹
--=============================================
Include("\\script\\online\\viet_2009_4\\wulinshizhe\\wulinshizhe.lua");

function OnUse()
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate > JXWEB_EXPIRED_DATE then
		Msg2Player("V藅 ph萴 n祔  qu� h筺, kh玭g th� s� d鬾g th猰 n鱝.")
		return 0;
	end	
	
	-----判断等级----------------------------------------------------
	if GetLevel() < WL_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V蒼 ch璦 t n c蕄 <color=yellow>" .. WL_ROLE_LEVEL_LIMIT .. "<color> c蕄, kh玭g th� s� d鬾g Li猲 T﹎ Кn");
		return 0;
	end
	
	-----判断使用连心丹获得的经验是否已经达到上限
	if GetTask(WL_TASK_ALREADY_GET_EXP) >= WL_GET_MAX_EXP then
		Talk(1, "", "S� d鬾g Li猲 T﹎ Кn  t n kinh nghi謒 gi韎 h筺 cao nh蕋");
		return 0;		
	end
	
	-----获得经验
	if DelItem(2, 1, 30085, 1) == 1 then
		SetTask(WL_TASK_ALREADY_GET_EXP, GetTask(WL_TASK_ALREADY_GET_EXP) + WL_GET_EACH_EXP);
		ModifyExp(WL_GET_EACH_EXP);
		Msg2Player("B筺 nh薾 頲 " .. WL_GET_EACH_EXP .. "Kinh nghi謒");
	end
	
end