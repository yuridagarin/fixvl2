Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qixi08\\head.lua");

--获得当天的活动名字和活动ID
function QX08_GetTodayGame()
	local nCurWeekDate = tonumber(date("%w"));
	return tostring(g_tbGameSchedule[nCurWeekDate][1]),g_tbGameSchedule[nCurWeekDate][2];
end;
--获得日期信息
function QX08_GetDate(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	return nYear,nMonth,nDay;
end;
--奖励的统一接口。注意，此函数必须在各个活动NPC的脚本上调用
--nType:活动ID
--nAwardLevel:奖励等级
--nTaskID:记录今天是否领取过奖励的任务变量ID
function QX08_GetAward(nType,nAwardLevel,nTaskID)
	if nAwardLevel == 0 then
		Talk(1,"",g_szInfoHead.."H玬 nay ngi kh玭g c? th祅h t輈h g?, kh玭g th? nh薾 thng.");
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho箃 ng Olympic sai]:"..GetName().."nAwardLevel b? l鏸, tr? l鏸: "..nAwardLevel);
		return 0;
	end;
	local szAwardInfo = "";
	local nLevel = GetLevel();
	local nExpAward = 0;
	local nGoldenExpAward = 0;
	local nPoint = g_tbAward[nAwardLevel][4];
	local nBagNum = g_tbAward[nAwardLevel][3];
	local szTitleAward = "";
	local bGotTitle = 0;
	if nType == GAME_ID_GUESS then
		if GetTask(TSK_AOYUN_GUESS_BCOMPLETED) >= 10 then
			szTitleAward = "Ngo礽 ra, do h玬 nay ngi li猲 t骳 10 l莕 tr? l猲 畂竛 ng s?, ngi nh薾 頲 danh hi謚 <color=yellow>'Thi猲 C? Th莕 To竛'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_BOX then
		if GetTask(Box_prize_9_times) >= 10 then
			szTitleAward = "Ngo礽 ra, do h玬 nay ngi li猲 t鬰 10 l莕 vt 秈 th祅h c玭g, ngi nh薾 頲 danh hi謚 <color=yellow>'箃 B秓 K? Binh'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_LIGHT then
		if GetTask(TSK_AOYUN_LIGHT_NUM) >= 10 then
			szTitleAward = "Ngo礽 ra, do h玬 nay ngi li猲 t鬰 10 l莕 vt 秈 th祅h c玭g, ngi nh薾 頲 danh hi謚 <color=yellow>'Xai Жng Vng'<color>.";
			bGotTitle = 1;
		end;
	end;
	local szOtherAward = "";
	if nLevel == 99 then
		szOtherAward = "<color=yellow>"..nBagNum.."<color> T骾 b秓 th筩h, <color=yellow>"..nPoint.."<color> 甶觤 t輈h l騳 ho箃 ng."
	else
		szOtherAward = "<color=yellow>"..nPoint.."<color> 甶觤 t輈h l騳 ho箃 ng."
	end;
	local selTab = {
				"Nh薾 /#QX08_GetAward_1("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
				"T筸 th阨 kh玭g nh薾/nothing",
				}
	if IB_VERSION == 1 then	--免费
		if nLevel ~= 99 then
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
			szAwardInfo = "Ngi nh薾 頲 ph莕 thng c蕄 <color=yellow>"..nAwardLevel.."<color>, n閕 dung ph莕 thng l?: <color=yellow>"..nExpAward.." 甶觤 kinh nghi謒<color>,"..szOtherAward..szTitleAward.."уng ? nh薾 kh玭g?"
		else
			szAwardInfo = "Ngi nh薾 頲 ph莕 thng c蕄 <color=yellow>"..nAwardLevel.."<color>, n閕 dung ph莕 thng l?:"..szOtherAward..szTitleAward.."уng ? nh薾 kh玭g?";
		end;
	else
		if nLevel ~= 99 then
			local nCurGoldenExp = GetGoldenExp();
			nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
			szAwardInfo = "Ngi nh薾 頲 ph莕 thng c蕄 <color=yellow>"..nAwardLevel.."<color>, n閕 dung ph莕 thng l?: chuy觧 <color=yellow>"..nGoldenExpAward.."<color> 甶觤 s鴆 kh醗 th祅h 甶觤 kinh nghi謒 (hi謓 t筰 甶觤 s鴆 kh醗 l? "..nCurGoldenExp.."),<color=yellow>"..nExpAward.."<color>,"..szOtherAward..szTitleAward.."уng ? nh薾 kh玭g?"
		else
			szAwardInfo = "Ngi nh薾 頲 ph莕 thng c蕄 <color=yellow>"..nAwardLevel.."<color>, n閕 dung ph莕 thng l?:"..szOtherAward..szTitleAward.."уng ? nh薾 kh玭g?";
		end;
	end;
	Say(g_szInfoHead..szAwardInfo,getn(selTab),selTab);
end;
--针对健康经验不够而增加的一个流程
function QX08_GetAward_1(nType,nAwardLevel,nTaskID,bGotTitle)
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho箃 ng Olympic sai]:"..GetName().."nAwardLevel b? l鏸, tr? l鏸: "..nAwardLevel);
		return 0;
	end;
	local nLevel = GetLevel();
	local nCurGoldenExp = GetGoldenExp();
	local nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
	if IB_VERSION ~= 1 and nLevel ~= 99 and nGoldenExpAward > nCurGoldenExp then
		local selTab = {
					"уng ?/#QX08_GetAward_2("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
					"H駓 b?/nothing",
					}
		Say(g_szInfoHead.." ngi c? th? chuy觧 <color=yellow>"..nGoldenExpAward.."<color> 甶觤 s鴆 kh醗, nh璶g 甶觤 s鴆 kh醗 hi謓 t筰 l? <color=yellow>"..nCurGoldenExp.."<color> 甶觤, <color=red>nh? h琻<color> 甶觤 s鴆 kh醗 ngi c? th? chuy觧, ngi c? mu鑞 chuy觧 kh玭g?",getn(selTab),selTab);
	else
		QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	end;
end;

function QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	if gf_JudgeRoomWeight(6,20,g_szInfoHead) == 0 then
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho箃 ng Olympic sai]:"..GetName().."nAwardLevel b? l鏸, tr? l鏸: "..nAwardLevel);
		return 0;
	end;
	local nLevel = GetLevel();
	local nExpAward = 0;
	local nGoldenExpAward = 0;
	SetTask(nTaskID,1);
	if bGotTitle == 1 then
		if nType == GAME_ID_GUESS then
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
		elseif nType == GAME_ID_BOX then
			SetTask(Box_prize_9_times,0);
		elseif nType == GAME_ID_LIGHT then
			SetTask(TSK_AOYUN_LIGHT_NUM,0);
		end;
		AddTitle(53,nType);
		SetTitleTime(53,nType,GetTime()+24*3600);
		Msg2Player("B筺 nh薾 頲 danh hi謚"..g_tbTitleName[nType].." ' danh hi謚");
		WriteLog("[Ho箃 ng Olympic]:"..GetTime().."Nh薾 頲 "..g_tbTitleName[nType].."Hi謚");
	end;
	local nPoint = g_tbAward[nAwardLevel][4];
	SetTask(TSK_AOYUN_POINT,GetTask(TSK_AOYUN_POINT)+nPoint);
	if GetTask(TSK_AOYUN_POINT) > g_nJifenMax then
		SetTask(TSK_AOYUN_POINT,g_nJifenMax);
		Msg2Player("B筺 nh薾 頲 "..nPoint.."觤 t輈h l騳 ho箃 ng");
		Msg2Player("觤 c馻 ngi  t n "..g_nJifenMax.." 甶觤, m鏸 ngi nhi襲 nh蕋 c? th? t輈h l騳 "..g_nJifenMax.." 甶觤.");
	else	
		Msg2Player("B筺 nh薾 頲 "..nPoint.."觤 t輈h l騳 ho箃 ng");
	end
	if nLevel == 99 then	--99级奖励。收费免费一样的
		local nNum = g_tbAward[nAwardLevel][3];
		AddItem(2,1,2642,nNum);
		Msg2Player("B筺 nh薾 頲 "..nNum.." T骾 b秓 th筩h");
		WriteLog("[Ho箃 ng Olympic]:"..GetName().."Х nh薾 "..nType.."s?"..nAwardLevel.." - ph莕 thng ho箃 ng:"..nNum.." T骾 b秓 th筩h.");
		return 1;
	end;
	if IB_VERSION == 1 then	--免费
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
		WriteLog("[Ho箃 ng Olympic]:"..GetName().."Х nh薾 "..nType.."s?"..nAwardLevel.." - ph莕 thng ho箃 ng:"..nExpAward.." 甶觤 kinh nghi謒");
	else	--收费
		local nCurGoldenExp = GetGoldenExp();
		nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
		gf_GoldenExp2Exp(nGoldenExpAward);
		WriteLog("[Ho箃 ng Olympic]:"..GetName().."Х nh薾 "..nType.."s?"..nAwardLevel.." - ph莕 thng ho箃 ng: Chuy觧"..nGoldenExpAward.." 甶觤 s鴆 kh醗; "..nExpAward.." 甶觤 kinh nghi謒");
	end;
end;

function nothing()

end;

--=====================公元2008年11月5日新加=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算周的序数
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;