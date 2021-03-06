
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 通缉名册脚本
-- 作用：领取一个通缉任务
-- Edited by StarryNight
-- 2007/01/17 10:25

-- 输了你，赢了世界又如何
-- 你曾渴望的梦
-- 我想永远都不会懂

-- ======================================================

Include("\\script\\task\\killer\\killer_head.lua");

USE_TIME = 1116;--一天内使用通缉名册累计数量
LAST_TIME = 1117;--上一次使用通缉名册的日期

function OnUse()
	
	Say("B筺 mu鑞 d飊g danh s竎h truy n?? N? c? th? gi髉 b筺 nh薾 nhi謒 v? truy n?, t鑙 產 20 l莕.",
	2,
	"уng ?/confirm_use",
	"T筸 th阨 ch璦 s? d鬾g!/cancel_use"
	)

end

--确认使用通缉名册
function confirm_use()

local nLastTime = GetTask(LAST_TIME);
local nNowTime = GetYMDTime();
local nUseTime = GetTask(USE_TIME);

	--任务等级小于20不能使用
	if GetLevel() < 20 then
		Say("Ъng c蕄 hi謓 th阨 c馻 b筺 kh玭g th? nh薾 nhi謒 v? truy n?, t c蕄 <color=yellow>20<color> h穣 quay l筰!",0)
		return
	end
	
	--之前已经领取师门任务则无法使用
	if GetTask(TASK_KILLER_STATE_ID) ~= 0 then
		Say("B筺 ch璦 ho祅 th祅h nhi謒 v? trc, c? g緉g l猲!",0)
		return
	end
	
	if nLastTime == nNowTime then
		if GetTask(USE_TIME) >= 20 then
		 Say("H玬 nay b筺  s? d鬾g  danh s竎h truy n?, ng祔 mai h穣 quay l筰!",0)
		 return
		end
	end
	
	--发布一个通缉任务
	if DelItem(2,1,1022,1) == 1 then
	
		local nKillerName = "";
		local nKillerMode = "";
		local nMapName = "";
		local nMapID = 0;
		local nWx,nWy,nMx,nMy = 0,0,0,0;
		local nTriggerID = 0;
		local nCustomID = 0;
			
		--生成一个杀手数据
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
		
		Say("Theo tin th竚 b竜, s竧 th? <color=yellow>"..nKillerName.."<color> g莕 y hay xu蕋 hi謓 t筰 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H穣 mau 甶 di謙 tr?! (H玬 nay b筺  d飊g <color=yellow>"..(nUseTime+1).."<color> c竔 danh s竎h truy n?, c遪 <color=yellow>"..20-(nUseTime+1).."<color> l莕 c? h閕).",0);
		
		--生成时间触发器，计数值为900
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--保存当前时间
		nTime = GetTime();--获取1970年至今经过的秒数
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--生成地图触发器
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--保存地图触发器ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
	
		TaskTip("N閕 15 ph髏 ph秈 ho祅 th祅h, xem th猰 trong L謓h truy n?!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end
		
		--记录使用时间和当天使用次数
		if nLastTime ~= nNowTime then
			SetTask(USE_TIME,1);
		else
		 SetTask(USE_TIME,nUseTime+1);
		end
		
		SetTask(LAST_TIME,nNowTime);
		
	else
		Say("B筺 kh玭g mang danh s竎h truy n?, kh玭g th? s? d鬾g.",0)
	end
	
end

--取消使用通缉名册
function cancel_use()

end

--获取当前年月日字符串
function GetYMDTime()

local nYMD_str = date("%y")..date("%m")..date("%d")

	return nYMD_str

end