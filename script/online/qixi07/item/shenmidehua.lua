--神秘的花脚本
--by vivi
--07/30/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")

function OnUse()
	local remain_time = 0;
	local nNowDay = floor((GetTime()+28800)/86400); 
	
	if GetTask(TASK_FLOWER_GROW) > 100 then
		SetTask(TASK_FLOWER_GROW,100);
	end	
	
	--当天是否成长过或者成长度是否已经到100
	if nNowDay == GetTask(TASK_IS_GROW) or GetTask(TASK_FLOWER_GROW) >= 100 then
		Talk(1,"","<color=green>Hoa th莕 b?<color>:  trng th祅h a hoa n祔 l? <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. ч trng th祅h c馻 hoa h玬 nay  t╪g th猰 <color=red>1<color>, ph莕 thng trng th祅h gi? c? th? l穘h l? <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nh薾 ph莕 thng trng th祅h l骳 n祔. B﹜ gi? n閜 a hoa n祔 cho B竎h Hoa s? gi? c? th? nh薾 頲 ph莕 thng cu鑙 c飊g l?"..npc_final_award()..". Ch? ?, ch? c莕 s? d鬾g <color=red>B錸g Lai Ti猲 th駓<color> ho芻 <color=red>B錸g Lai Ti猲 l?<color> ho芻 <color=red>B錸g Lai Ti猲 n<color>, m鏸 ng祔 l猲 m筺g 1 gi? tr? l猲 m韎 c? th? t╪g 頲 1 甶觤  trng th祅h trong ng祔 h玬 ");
	else  				
		remain_time = NEED_TIME - GetTask(TASK_TOTAL_TIME);
		Talk(1,"","<color=green>Hoa th莕 b?<color>:  trng th祅h a hoa n祔 l? <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. H玬 nay b筺 v蒼 ph秈 l猲 m筺g <color=red>"..remain_time.."<color> ph髏  t╪g  trng th祅h l猲 <color=red>1<color>, ph莕 thng trng th祅h c? th? nh薾 b﹜ gi? l? <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nh薾 ph莕 thng trng th祅h l骳 n祔. B﹜ gi? n閜 a hoa n祔 cho B竎h Hoa s? gi? c? th? nh薾 頲 ph莕 thng cu鑙 c飊g l?"..npc_final_award()..". Ch? ?, ch? c莕 s? d鬾g <color=red>B錸g Lai Ti猲 th駓<color> ho芻 <color=red>B錸g Lai Ti猲 l?<color> ho芻 <color=red>B錸g Lai Ti猲 n<color>, m鏸 ng祔 l猲 m筺g 1 gi? tr? l猲 m韎 c? th? t╪g 頲 1 甶觤  trng th祅h trong ng祔 h玬 ");
	end			
end

--给予最终奖励，用于显示给玩家
function npc_final_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	local aStr = "";			
	if fl_grow == 0 then
		aStr = aStr.."<color=red>"..floor(tFinalAward[1][2]*exp_arg).."<color> kinh nghi謒 "
	else 
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho箃 ng Th蕋 T辌h, hoa th藅 c bi謙. Tr? s? c bi謙 l?:"..fl_grow);
				return
			end
		end		
		if j == 2 then
			aStr = aStr.."<color=red>"..floor(tFinalAward[2][2]*exp_arg).."<color> kinh nghi謒 "
		elseif j > 2 then
			aStr = aStr.."<color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi謒,"..tBoxAward[j-2]
		end			
	end
	return aStr
end

--是否已经领取过奖励
function is_get_award()
	local str = "";
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) == 0 then
		str="ch璦";
	elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) ~= 0 then
		str=" ";
	elseif fl_grow > 30 then
		for i = 31,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
				str="ch璦";
				break
			elseif fl_grow <=tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then 
				str=" ";
				break
			end
		end
	end
	return str
end		

function npc_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --经验系数
	local gStr = "";
	if fl_grow == 0 then
		gStr = "0";
	elseif fl_grow > 0 and fl_grow <= 100 then
		for i=1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] then
				gStr = "t苙g ng蓇 nhi猲 "..floor(tGrowAward[i][2]*10000*exp_arg).."-"..floor(tGrowAward[i][3]*10000*exp_arg).."Kinh nghi謒";
				break
			end
		end
	else
		gStr = "ч trng th祅h kh竎 thng c馻 hoa. Xin li猲 h? b? ph薾 ph鬰 v? kh竎h h祅g, c秏 琻.";
	end
	return gStr;	
end