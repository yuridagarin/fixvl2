--file name:staratlas_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动星星地图脚本
Include("\\script\\online\\qixi06\\qixi06_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
IB_VERSION = 1;

function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
		SetTask(TASK_FIND_STAR_COUNT,0);
	end;
	local nFindNum = GetTask(TASK_FIND_STAR_COUNT);
	if nFindNum >= 7 then
		gf_ShowMsg("H玬 nay ngi  t譵 頲 7 ng玦 sao, m鏸 ngi m鏸 ng祔 nhi襲 nh蕋 ch? c? th? t譵 <color=yellow>7<color> ng玦 sao.",0)
		return 0;
	end;
	local sMapName = "";
	local nMapID,nMapX,nMapY = 0,0,0;
	local nCurMapID = GetWorldPos();
	local nRow = 0;
	local nRetCode = 0;
	local nRandomNum = 0;
	local nOldPlayerIndex = PlayerIndex;
	if GetTask(TASK_POS_INDEX) ~= 0 then
		nRow = GetTask(TASK_POS_INDEX);
		if nRow < 3 then
			WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]:"..GetName().."Khi nh薾 頲 hng d蒼 v? tr? ng玦 sao, nRandomRow nh? h琻 3, tr? l?:"..nRow)
			SetTask(TASK_POS_INDEX,3);	--设为３
		end;
		sMapName = tabPos:getCell(nRow,3);
		nMapID = tonumber(tabPos:getCell(nRow,4));
		nMapX = tonumber(tabPos:getCell(nRow,5));
		nMapY = tonumber(tabPos:getCell(nRow,6));
		local nItemIdx = 0;
		if nCurMapID == nMapID then
			if is_around_the_star() == 1 then
				if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1) == 1 then
					nRetCode,nItemIdx = AddItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],1);
					SetItemExpireTime(nItemIdx,get_time_left());
					nFindNum = nFindNum + 1;
					if nRetCode == 1 then
						Talk(1,"","Theo t鋋  b秐 , ch? n祔 l? n琲 Sao b╪g r琲, b筺 nh薾 頲 <color=yellow>"..t7XiItem["star"][1].."<color>");
						WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Nh薾 頲"..t7XiItem["star"][1]);
						Msg2Player("H玬 nay ngi nh薾 頲 "..nFindNum.." "..t7XiItem["star"][1]);
					else
						WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]:"..GetName().."L鏸 khi nh薾 頲 Sao b╪g, tr? quay l筰 ch? l謓h AddItem:"..nRetCode);
					end;
					SetTask(TASK_FIND_STAR_COUNT,nFindNum);
					SetTask(TASK_POS_INDEX,0);
					local nExpAward = 0;
					local nLevel = GetLevel();
					if Is_Lovers_Team() == 1 then
						for i=1,2 do
							PlayerIndex = GetTeamMember(i);						
							nLevel = GetLevel();	
							if nOldPlayerIndex == PlayerIndex then
								if random(1,100) <= 80 then
									nRetCode,nItemIdx = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
									Msg2Player("Ch骳 m鮪g ngi nh薾 頲 1 t蕀 "..t7XiItem["atlas"][1]);
									WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Nh薾 頲 th猰 1 t蕀 Tinh Tinh мa у");
								end;
							else
								if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
									SetTask(TASK_FIND_STAR_COUNT,0);
								end;
							end;
							if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
								SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
								if nLevel ~= 99 then
									if IB_VERSION == 0 then
										nExpAward = floor((nLevel^2)/(80^2)*5180000);
									else
										nExpAward = floor((nLevel^2)/(80^2)*4680000);
									end;
									ModifyExp(nExpAward);
									Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
									WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Х nh薾 ph莕 thng song nh﹏ th緋 sao Th蕋 T辌h"..nExpAward.." 甶觤 kinh nghi謒");										
								else
									AddItem(2,1,2642,2);
									Msg2Player("B筺 nh薾 頲 2 T骾 b秓 th筩h");
									WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Nh薾 ph莕 thng song nh﹏ th緋 sao Th蕋 T辌h: 2 T骾 b秓 th筩h");
								end;
							else
								Msg2Player("H玬 nay ngi  nh薾 ph莕 thng kinh nghi謒 th緋 sao (ho芻 T骾 b秓 th筩h), l莕 n祔 ngi kh玭g nh薾 頲 ph莕 thng kinh nghi謒 (ho芻 T骾 b秓 th筩h)");
							end;
						end;
						PlayerIndex = nOldPlayerIndex;
					else
						if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
							SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
							if nLevel ~= 99 then
								if IB_VERSION == 0 then
									nExpAward = floor((nLevel^2)/(80^2)*5180000*0.8);
								else
									nExpAward = floor((nLevel^2)/(80^2)*4680000*0.8);
								end;
								ModifyExp(nExpAward);
								Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
								WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Х nh薾 ph莕 thu雗g Th蕋 T辌h t譵 sao c? nh﹏:"..nExpAward.." 甶觤 kinh nghi謒");										
							else
								AddItem(2,1,2642,2);
								Msg2Player("B筺 nh薾 頲 2 T骾 b秓 th筩h");
								WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Nh薾 ph莕 thu雗g Th蕋 T辌h t譵 sao c? nh﹏: 2 T骾 b秓 th筩h");
							end;
						else
							Msg2Player("H玬 nay ngi  nh薾 ph莕 thng kinh nghi謒 th緋 sao (ho芻 T骾 b秓 th筩h), l莕 n祔 ngi kh玭g nh薾 頲 ph莕 thng kinh nghi謒 (ho芻 T骾 b秓 th筩h)");
						end;
					end;
					WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."T譵 頲 1 ng玦 sao");
				end;
			else
				Talk(1,"","Theo t鋋  b秐 , ch? n祔 kh玭g ph秈 l? n琲 Sao b╪g r琲 nh璶g b筺 ph竧 hi謓 ? <color=yellow>"..floor(nMapX/8)..","..floor(nMapY/16).."(t鋋 )<color> c? v藅 產ng ph竧 s竛g.");
			end;
		else
			Talk(1,"","Theo t鋋  b秐 , ch? n祔 kh玭g ph秈 l? n琲 Sao b╪g r琲, hay l? b籲g h鱱 n <color=yellow>"..sMapName.."<color> xem th?!");
		end;
	else
		local nTotalPosCount = tabPos:getRow();	--得到总行数
		local nRandomRow = random(3,nTotalPosCount);	--随机一个位置
		if nRandomRow < 3 then
			WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]:"..GetName().."Khi nh薾 頲 hng d蒼 v? tr? ng玦 sao, nRandomRow nh? h琻 3, tr? l?:"..nRandomRow..", tr? s? nTotalPosCount:"..nTotalPosCount)
			SetTask(TASK_POS_INDEX,3);	--设为３
		end;
		sMapName = tabPos:getCell(nRandomRow,3);
		nMapID = tonumber(tabPos:getCell(nRandomRow,4));
		nMapX = tonumber(tabPos:getCell(nRandomRow,5));
		nMapY = tonumber(tabPos:getCell(nRandomRow,6));
		SetTask(TASK_POS_INDEX,nRandomRow);
		Talk(1,"","G莕 y th玭 d﹏ n r籲g th蕐 1 ng玦 sao r琲 ? <color=yellow>"..sMapName.."<color>, v? c飊g tr竛g l?.");
	end;
end;
--判断是否在目标地点附近
function is_around_the_star()
	local nCurMapID,nCurMapX,nCurMapY = GetWorldPos();
	local nMapID,nMapX,nMapY = 0,0,0;
	local nRow = GetTask(TASK_POS_INDEX);
	nMapID = tonumber(tabPos:getCell(nRow,4));
	nMapX = tonumber(tabPos:getCell(nRow,5));
	nMapY = tonumber(tabPos:getCell(nRow,6));
	if nCurMapID == nMapID then
		if floor(nCurMapX/8) == floor(nMapX/8) and floor(nCurMapY/16) == floor(nMapY/16) then
			return 1;
		else
			return 0;
		end;
	else
		return 0;
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
