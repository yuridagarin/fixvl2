--*************************
-- Cay bat nha lon / nho --
--*************************

Include("\\script\\lib\\lingshi_head.lua");
TREELIFETIME = 5*60;	--树的生命：5分钟
PLANT_SMALL_TREE_LIMIT = 5;	--每天种小树的数量限制 -- 20101122
PLANT_BIG_TREE_LIMIT = 2;	--每天种大树的数量限制

TASK_GET_AWARD_DATE = 418;	--记录领取奖励的日期
TASK_GET_AWARD_COUNT = 419;	--记录当天领取奖励的次数
TASK_TREEINDEX = 420;	--记录玩家种的树的NPC索引
TASK_TREEGROW = 421;	--记录树的生成程度
TASK_PLANTTIME = 422;	--记录种下树的时间，单位为秒
TASK_GETSEEDCOUNT = 423;	--记录玩家当天得种子的次数
TASK_GETSEEDDATE = 424;	--记录玩家上次得种子的日期
TASK_GETSEEDHOUR = 425;	--记录玩家上次得种子的具体时间（小时）
TASK_TREEINDEX_SMALL = 426;	--记录玩家种的小树的NPC索引
TASK_TREEGROW_SMALL = 427;	--记录小树的生成程度
TASK_PLANTTIME_SMALL = 428;	--记录种下小树的时间，单位为秒
TASK_PLAN_SMALLTREE_COUNT = 429	--记录玩家当天种小树的次数
TASK_PLAN_SMALLTREE_DATE = 430	--记录玩家种下小树的日期
TASK_PLAN_BIGTREE_COUNT = 431	--记录玩家当天种大树的次数
TASK_PLAN_BIGTREE_DATE = 432	--记录玩家种下大树的日期

TREETYPE = {	--模板名，NPC名字，间隔时间，所需露水
		{"M莔 hoa h錸g","M莔 c﹜ Th竔 H? B竧 Nh? ",45,1},
		{"M莔 Hoa h錸g","M莔 c﹜ Th竔 H? B竧 Nh? ",45,1},
		{" nh竛h hoa h錸g","C﹜ Th竔 H? B竧 Nh? nh? ",45,1},
		{"c﹜  M藅 Hoa Qu? nh?","C﹜ Th竔 H? B竧 Nh? l韓 ",45,1},
		{"c﹜  M藅 Hoa Qu? trung","C﹜ hoa Th竔 H? B竧 Nh? ",45,2},
		{"c﹜  M藅 Hoa Qu? l韓","C﹜ Th竔 H? B竧 Nh? ",45,2},
		};
SMALLTREETYPE = {	--模板名，NPC名字，间隔时间，所需露水
		{"M莔 hoa h錸g","M莔 c﹜ Th竔 H? nh? ",120,1},
		{"M莔 Hoa h錸g","M莔 c﹜ Th竔 H? nh? ",120,1},
		{" nh竛h hoa h錸g","C﹜ Th竔 H? nh? ",120,1},
		}

function Create_Map_Trigger()
	local bCreateFailed = 0;	
	for i=1,5 do	
		Tid = 1107 + i
		Tidx = 3113 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--创建进入离开种树地图触发器
				bCreateFailed = 1	--某一个触发器创建失败了
			end
		end;
	end;
	if bCreateFailed == 1 then
		WriteLog("[Ho箃 ng Th竔 H? Qu? Th? (K誸 n鑙 th蕋 b筰)]:"..GetName().."K誸 n鑙 server (3113~3118) th蕋 b筰.")
	end
end;

function checktime()
	local nHour = tonumber(date("%H"));
	if nHour == 13 or nHour == 17 or nHour == 21 then	--只在13点17点和21点这两个小时内开放
		return 1;
	else
		return 1;	--07年2月9日，IB服务器改为任何时间都可种
	end;
end;

function checkplace()	--是否在指定地点。成都府西
	local nMapID = GetWorldPos();
	local nValidMapID = 0;
	local nValidMapID1 = 108;--添加种树地图，泉州俯北
	if Check_YuanXiao08_Date() == 1 then
		nValidMapID = 504;
	else
		nValidMapID = 301;
	end;
	if nMapID == nValidMapID or nMapID == nValidMapID1 then
		return 1;
	else
		return 0;
	end;
end;

function checkplace_maincity()	--种小树。是否在指定地点：四大主城
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 or (Check_YuanXiao08_Date() == 1 and nMapID == 500) then
		return 1;
	else
		return 0;
	end;
end;

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."Thi猲";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."h ";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.." ph髏 ";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.." Gi﹜ ";
	end;
	return sTime;
end;
--判断是不是在０８年元宵节活动期间
function Check_YuanXiao08_Date()
	local nTime = tonumber(date("%Y%m%d%H"));
	if nTime >= 2008031200 and nTime <= 2008031623 then
		return 1;
	else
		return 0;
	end;
end;
--给额外奖励，nType为1时是小树，为2时是大树
function Give_YuanXiao_Award(nType)
	if Check_YuanXiao08_Date() ~= 1 then
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > GetTask(TASK_GET_AWARD_DATE) then
		SetTask(TASK_GET_AWARD_COUNT,0);
	end;
	local nTimes = GetTask(TASK_GET_AWARD_COUNT)+1;
	if nTimes <= 0 or nTimes > 4 then
		return 0;
	end;
	SetTask(TASK_GET_AWARD_COUNT,nTimes);
	SetTask(TASK_GET_AWARD_DATE,nDate);
	local tbPercent = {100,50,30,20};
	local tbLSCount = {};
	local nLevel = GetLevel();
	local nExpBase = 0;
	local nRand = 0;
	if nType == 1 then
		nExpBase = 200;
		tbLSCount = {4,3,2,1};
	elseif nType == 2 then
		nExpBase = 400;
		tbLSCount = {5,4,3,2};
	end;
	if nLevel >= 10 and nLevel <= 98 then
		local nExp = ((nExpBase*10000*nLevel^3)/(80^3))*(tbPercent[nTimes]/100);
		nRand = random(1,100);
		if nRand <= 5 then
			nExp = nExp*2;
			Msg2Global("Ch骳 m鮪g "..GetName().."Trong d辮 T誸 tr錸g c﹜ tham gia ho箃 ng tr錸g c﹜ nh薾 頲 ph莕 thng g蕄 2 l莕!");
		elseif nRand <= 7 then
			nExp = nExp*3;
			Msg2Global("Ch骳 m鮪g "..GetName().."Trong d辮 T誸 tr錸g c﹜ tham gia ho箃 ng tr錸g c﹜ nh薾 頲 ph莕 thng g蕄 3 l莕!");
		end;
		nExp = floor(nExp*0.8);	--免费区×0.8
		ModifyExp(nExp);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒, y l? l莕 i 甶觤 kinh nghi謒 th? "..nTimes.." (l莕) nh薾 th猰 ph莕 thng,m鏸 ngi m閠 ng祔 頲 nh薾 th猰 ph莕 thng 4 l莕");
		WriteLog("[08T誸 tr錸g c﹜]:"..GetName().."th?"..nTimes.." (l莕) nh薾 th猰 ph莕 thng, tr? kinh nghi謒:"..nExp..". Ъng c蕄 ngi ch琲:"..nLevel);
	elseif nLevel == 99 then	--99级获得5颗1至6级的随机灵石
		local nLSLevel = 0;
		for i=1,tbLSCount[nTimes] do
			nLSLevel = random(1,6);
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B筺 nh薾 頲 1 "..nLSLevel.." (c蕄) Linh th筩h,  cho v祇 T? Linh nh");
		end;
		Msg2Player("H玬 nay b筺 ng th?"..nTimes.." (l莕) nh薾 th猰 ph莕 thng,m鏸 ngi m閠 ng祔 頲 nh薾 th猰 ph莕 thng 4 l莕")
		WriteLog("[08T誸 tr錸g c﹜]:"..GetName().."th?"..nTimes.." (l莕) nh薾 th猰 ph莕 thng, 頲"..tbLSCount[nTimes].." Linh th筩h");
	end;
end;

function nothing()

end;