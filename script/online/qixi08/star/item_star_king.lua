--file name:star_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动流星（物品）脚本
Include("\\script\\online\\qixi08\\star\\head.lua");
Include("\\script\\lib\\globalfunctions.lua")
function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_PLANT_STAR) >= nDate then
		Talk(1,"","H玬 nay ngi  th緋 s竛g c竎 ng玦 sao, m鏸 ngi m鏸 ng祔 ch? c? th? th緋 s竛g 1 l莕.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B筺 ch? c? th? ch筸 v祇 m閠 ng玦 sao s竛g tr猲 Ng﹏ H?.");
		return 0;
	end;
	if gf_JudgeRoomWeight(5,20) == 0 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 c馻 ngi kh玭g , xin ki觤 tra l筰 trc!");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"H穣 nh藀 t猲 c馻 ng玦 sao:");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B筺 ch? c? th? th緋 s竛g sao tr猲 d秈 Ng﹏ H?");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	if DelItem(2,0,1071,1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ngi V? h譶h",sName,nMapID,nMapX,nMapY);
		local nTimeLeft = get_time_left();
		SetNpcLifeTime(nNpcIndex,nTimeLeft);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		for i=1,7 do	--大星星一共要8个特效
			nNpcIndex = CreateNpc("Ngi V? h譶h"," ",nMapID,nMapX,nMapY);
			SetNpcLifeTime(nNpcIndex,nTimeLeft);
			SetCurrentNpcSFX(nNpcIndex,935,1,1);
		end;
		SetTask(TSK_AOYUN_PLANT_STAR,nDate);
		local nLevel = GetLevel();
		local nExpAward = floor((nLevel^2)/(80^2)*2000000);
		if nLevel ~= 99 then
			ModifyExp(nExpAward);
			Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
			AddItem(2,1,2642,2);
			Msg2Player("B筺 nh薾 頲 2 T骾 b秓 th筩h");
			WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Lo筰 Tinh Tinh Chi Vng, nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒 v? 2 T骾 b秓 th筩h");
		else
			AddItem(2,1,2642,4);
			Msg2Player("B筺 nh薾 頲 4 T骾 b秓 th筩h");
			WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Tr錸g Tinh Tinh Chi Vng nh薾 頲 4 T骾 b秓 th筩h");
		end;
		if GetSex() == 1 then
			AddItem(2,0,352,1);
			Msg2Player("B筺 nh薾 頲 1 H箃 gi鑞g hoa h錸g");
			WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Tr錸g Tinh Tinh Chi Vng nh薾 頲 1 H箃 gi鑞g hoa h錸g");
		end;
		Msg2Player("Sao c馻 ngi  th緋 s竛g, th阨 gian t総 hi謓 gi? c遪 "..tf_GetTimeString(nTimeLeft));
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
