--查看战场里面的一些统计信息
--战场统计系统说明：
--统计内容主要有以下五大模块：4个战场的上一场统计信息加战场总统计信息
--ApplyRelayShareData的第一个参数为"battle_statistic"，表示共享数据库中的战场统计模块
--第二个参数表示战场的各种统计信息，其中1至4表示四个战场的上一场统计信息，5表示战场总的统计信息
--第三个参数表示统计信息的种类,1表示最终结果统计，2为个人积分排名，其它的根据不同的战场会有不同的定义
--注意使用functions.lua的函数时不要使用那些与Mission有关的函数
Include("\\script\\newbattles\\functions.lua");
BTS_MAX_ITEM_COUNT = 5;	--每页最多显示信息数量
BTS_MAX_RANK_NUM = 20;	--只显示排前20名的玩家

BTS_TYPE_MAIN_INFOR = 1;		--最终结果统计信息
BTS_TYPE_POINT_RANK = 2;		--个人积分排行信息
BTS_TYPE_KILL_PLAYER_COUNT = 3;	--杀人数排行信息
BTS_TYPE_DEATH_COUNT = 4;		--被杀次数排行信息

--统计模块入口
function BTS_ViewBattleStatistic()
	local selTab = {
				"Chi課 trng Gi秈 C鴘 N玭g Trang/BTS_ViewVillageBattle",
				"Chi課 trng Thu Th藀 Lng Th秓/BTS_ViewResourceBattle",
				"Chi課 trng B秓 V? Th祅h Tr?/BTS_ViewEmplacementBattle",
				"Chi課 trng Nh筺 M玭 R鵦 L鯽/BTS_ViewMainBattle",
				"L辌h s? chi課 trng/BTS_ViewBattleHistory",
				--"回主对话/main",
				"K誸 th骳/nothing",
				}
	Say("B筺 mu鑞 xem tin t鴆 chi課 trng n祇?",getn(selTab),selTab);
end;
--上场村落战场统计信息
function BTS_ViewVillageBattle()
	local selTab = {
				"K誸 qu? cu鑙 c飊g/#BTS_Battle_Final_Result(1)",
				--"个人积分排名/#BTS_Public_Rank(1,2)",
				"Quay l筰 n閕 dung trc./BTS_ViewBattleStatistic",
				"K誸 th骳/nothing",
				}
	Say("B筺 mu鑞 xem n閕 dung n祇 trong Chi課 trng Th玭 trang:",getn(selTab),selTab);
end;
--上场草谷场战场统计信息
function BTS_ViewResourceBattle()
	local selTab = {
				"K誸 qu? cu鑙 c飊g/#BTS_Battle_Final_Result(2)",
				--"个人积分排名/#BTS_Public_Rank(2,2)",
				"Quay l筰 n閕 dung trc./BTS_ViewBattleStatistic",
				"K誸 th骳/nothing",
				}
	Say("B筺 mu鑞 xem n閕 dung n祇 trong Chi課 trng Th秓 c鑓:",getn(selTab),selTab);
end;
--上场炮台战场统计信息
function BTS_ViewEmplacementBattle()
	local selTab = {
				"K誸 qu? cu鑙 c飊g/#BTS_Battle_Final_Result(3)",
				--"个人积分排名/#BTS_Public_Rank(3,2)",
				--"本场击倒敌人次数排行/#BTS_Public_Rank(3,3)",
				--"本场被击倒次数排行/#BTS_Public_Rank(3,4)",
				"Quay l筰 n閕 dung trc./BTS_ViewBattleStatistic",
				"K誸 th骳/nothing",
				}
	Say("B筺 mu鑞 xem n閕 dung n祇 trong Chi課 trng ph竜 i:",getn(selTab),selTab);
end;
--上场雁门关战场统计信息
function BTS_ViewMainBattle()
	local selTab = {
				"K誸 qu? cu鑙 c飊g/#BTS_Battle_Final_Result(4)",
				--"本场个人积分排行/#BTS_Public_Rank(4,2)",
				--"本场击倒敌人次数排行/#BTS_Public_Rank(4,3)",
				--"本场被击倒次数排行/#BTS_Public_Rank(4,4)",
				--"营救难民次数排行/BTS_Main_Help_Refugee_Rank",
				"Quay l筰 n閕 dung trc./BTS_ViewBattleStatistic",
				"K誸 th骳/nothing",
				}
	Say("B筺 mu鑞 xem n閕 dung n祇 trong Nh筺 M玭 Quan:",getn(selTab),selTab);
end;
--查看上场战场最终结果
function BTS_Battle_Final_Result(nBattleType)
	local tCallBackFunc = {
		[VILLAGE_ID] = "BTS_CB_Village_Final_Result",
		[RESOURCE_ID] = "BTS_CB_Resource_Final_Result",
		[EMPLACEMENT_ID] = "BTS_CB_Emplacement_Final_Result",
		[MAINBATTLE_ID] = "BTS_CB_Main_Final_Result",
		}
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,BTS_TYPE_MAIN_INFOR,RELAY_CALLBACK_SCRIPT,tCallBackFunc[nBattleType]);
end;
--查看上场战场个人积分排行
function BTS_Public_Rank(nBattleType,nRecordType)
	BT_SetTempData(PTT_SNAPSHOOT,nBattleType);
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,nRecordType,RELAY_CALLBACK_SCRIPT,"BTS_CB_Show_Pub_Rank");
end;
--村落战场最终结果统计信息回调函数
function BTS_CB_Village_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewVillageBattle","Hi謓 kh玭g c? tin t鴆");
		return 0;
	end;
	local _,nResult,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h遖 nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh薾 頲"..tBattleName[nBattleType].." th緉g l頸 cu鑙 c飊g";
	end;
	Talk(1,"BTS_ViewVillageBattle","T筰"..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.."Nh藅"..nHour.."k誸 qu? tr薾 u:"..sResultStr.."<enter>Phe T鑞g t譵 頲: <color=yellow>"..nStepSong.."<color><enter>Phe Li猽 t譵 頲: <color=yellow>"..nStepLiao.."<color>");
end;
--草谷场战场最终结果统计信息回调函数
function BTS_CB_Resource_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewResourceBattle","Hi謓 kh玭g c? tin t鴆");
		return 0;
	end;
	local _,nResult,nResSong,nResLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h遖 nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh薾 頲"..tBattleName[nBattleType].." th緉g l頸 cu鑙 c飊g";
	end;
	Talk(1,"BTS_ViewResourceBattle","T筰"..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.."Nh藅"..nHour.."k誸 qu? tr薾 u:"..sResultStr.."<enter>S? lng th秓 phe T鑞g: <color=yellow>"..nResSong.."<color><enter>S? lng th秓 phe Li猽: <color=yellow>"..nResLiao.."<color>");
end;
--炮台战场最终结果统计信息回调函数
function BTS_CB_Emplacement_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewEmplacementBattle","Hi謓 kh玭g c? tin t鴆");
		return 0;
	end;
	local _,nResult,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h遖 nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh薾 頲"..tBattleName[nBattleType].." th緉g l頸 cu鑙 c飊g";
	end;
	Talk(1,"BTS_ViewEmplacementBattle","T筰"..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.."Nh藅"..nHour.."k誸 qu? tr薾 u:"..sResultStr.."<enter>Th阨 gian chi誱 l躰h ph竜 i c馻 phe T鑞g: <color=yellow>"..nTimeSong.." gi﹜<color> Th阨 gian chi誱 l躰h ph竜 i c馻 phe Li猽: <color=yellow>"..nTimeLiao.." gi﹜<color><enter>觤 t輈h l騳 phe T鑞g: <color=yellow>"..nPubPointSong.."<color>觤 t輈h l騳 phe Li猽: <color=yellow>"..nPubPointLiao.."<color><enter>S? ngi thng vong phe T鑞g: <color=yellow>"..nDeathSong.."<color> S? ngi thng vong phe Li猽: <color=yellow>"..nDeathLiao.."<color>");
end;
--雁门关战场最终结果统计信息回调函数
function BTS_CB_Main_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewMainBattle","Hi謓 kh玭g c? tin t鴆");
		return 0;
	end;
	local _,nResult,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h遖 nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh薾 頲"..tBattleName[nBattleType].." th緉g l頸 cu鑙 c飊g";
	end;
	Talk(1,"BTS_ViewMainBattle","T筰"..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.."Nh藅"..nHour.."k誸 qu? tr薾 u:"..sResultStr.."<enter>觤 t輈h l騳 phe T鑞g: <color=yellow>"..nPubPointSong.."<color>觤 t輈h l騳 phe Li猽: <color=yellow>"..nPubPointLiao.."<color><enter>S? n筺 d﹏ phe T鑞g c鴘: <color=yellow>"..nHelpRefugeeSong.."<color> S? n筺 d﹏ phe Li猽 c鴘: <color=yellow>"..nHelpRefugeeLiao.."<color><enter>S? ngi thng vong phe T鑞g: <color=yellow>"..nDeathSong.."<color> S? ngi thng vong phe Li猽: <color=yellow>"..nDeathLiao.."<color>");
end;
--战场个人积分排行统计信息回调函数，只适用于所有战场共同的那些排名
function BTS_CB_Show_Pub_Rank(szKey,nBattleType,nRecordType,nRecordCount)
	local tTitle = {""," T輈h l騳 c? nh﹏","S? l莕 gi誸 ch ","S? l莕 b? gi誸"};	--第一个被用作统计最终结果了。这样设计好像不太妥，暂时不管吧
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	if nRecordCount == 0 then
		Talk(1,tReturnFunc[BT_GetTempData(PTT_SNAPSHOOT)],"Hi謓 kh玭g c? tin t鴆");
		return 0;
	end;
	if nRecordCount > BTS_MAX_RANK_NUM then
		nRecordCount = BTS_MAX_RANK_NUM;	--只排前BTS_MAX_RANK_NUM名
	end;
	BTS_Show_Rank_Page(tTitle[nRecordType],1,szKey,nBattleType,nRecordType,nRecordCount);
end;
--显示积分排行的函数。第一个参数是要排行项目的字符串描述；第二个参数是当前要显示的页数；
function BTS_Show_Rank_Page(sTitle,nPageNum,szKey,nBattleType,nRecordType,nRecordCount)
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	local selTab = {};
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*BTS_MAX_ITEM_COUNT;
		if nCount >= BTS_MAX_ITEM_COUNT then
			return BTS_MAX_ITEM_COUNT
		else
			return mod(nCount,BTS_MAX_ITEM_COUNT);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*BTS_MAX_ITEM_COUNT
	local sName,nData,nRoute,nLevel,nCamp = "",0,0,0,0;
	local sContent = gf_FormatStringLength("H筺g",6)..gf_FormatStringLength("T猲",18)..gf_FormatStringLength("M玭 ph竔",10)..gf_FormatStringLength("C蕄",6)..gf_FormatStringLength(sTitle,strlen(sTitle)+2)..gf_FormatStringLength("Phe",4).."<enter>";
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		sName,nData,nRoute,nLevel,nCamp = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,i)
		sContent = sContent..gf_FormatStringLength(i+1,6)..gf_FormatStringLength(sName,18)..gf_FormatStringLength(tRoute[nRoute],10)..gf_FormatStringLength(nLevel,6)..gf_FormatStringLength(nData,strlen(sTitle)+2)..gf_FormatStringLength(tCampNameZ[nCamp],4).."<enter>"
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"Trang trc/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum-1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/BTS_MAX_ITEM_COUNT) then
		tinsert(selTab,"Trang k?/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum+1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");	
	end;
	tinsert(selTab,"Quay l筰 n閕 dung trc./"..tReturnFunc[nBattleType]);
	local nLength = strlen(sContent);
	sContent = strsub(sContent,1,nLength-7);
	Say(sContent,getn(selTab),selTab);
end
--查看战场历史记录
function BTS_ViewBattleHistory()
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,1,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_V");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,2,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_R");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,3,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_E");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,4,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_M");
end;

function BTS_CB_History_Record_V(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_R(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_E(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_M(szKey, nKey1, nKey2, nRecordCount)
	local nSongWinV,nLiaoWinV,nDrawV = 0,0,0;
	local nSongWinR,nLiaoWinR,nDrawR = 0,0,0;
	local nSongWinE,nLiaoWinE,nDrawE = 0,0,0;
	local nSongWinM,nLiaoWinM,nDrawM = 0,0,0;
	local nTotalSongWin,nTotalLiaoWin,nTotalDraw
	local szKey = RELAY_DATA_BATTLE;
	local nKey1 = 5;
	nSongWinV,nLiaoWinV,nDrawV = GetRelayShareDataByKey(szKey,nKey1,1,"history_record")
	if nSongWinV == nil then
		nSongWinV = 0;
	end;
	if nLiaoWinV == nil then
		nLiaoWinV = 0;
	end;
	if nDrawV == nil then
		nDrawV = 0;
	end;
	nSongWinR,nLiaoWinR,nDrawR = GetRelayShareDataByKey(szKey,nKey1,2,"history_record")
	if nSongWinR == nil then
		nSongWinR = 0;
	end;
	if nLiaoWinR == nil then
		nLiaoWinR = 0;
	end;
	if nDrawR == nil then
		nDrawR = 0;
	end;
	nSongWinE,nLiaoWinE,nDrawE = GetRelayShareDataByKey(szKey,nKey1,3,"history_record")
	if nSongWinE == nil then
		nSongWinE = 0;
	end;
	if nLiaoWinE == nil then
		nLiaoWinE = 0;
	end;
	if nDrawE == nil then
		nDrawE = 0;
	end;
	nSongWinM,nLiaoWinM,nDrawM = GetRelayShareDataByKey(szKey,nKey1,4,"history_record")
	if nSongWinM == nil then
		nSongWinM = 0;
	end;
	if nLiaoWinM == nil then
		nLiaoWinM = 0;
	end;
	if nDrawM == nil then
		nDrawM = 0;
	end;
	nTotalSongWin = nSongWinV + nSongWinR + nSongWinE + nSongWinM;
	nTotalLiaoWin = nLiaoWinV + nLiaoWinR + nLiaoWinE + nLiaoWinM
	nTotalDraw = nDrawV + nDrawR + nDrawE + nDrawM;
	BT_ShowDebugInfor("nSongWinV:"..nSongWinV..", nLiaoWinV:"..nLiaoWinV..", nDrawV:"..nDrawV);
	BT_ShowDebugInfor("nSongWinR:"..nSongWinR..", nLiaoWinR:"..nLiaoWinR..", nDrawR:"..nDrawR);
	BT_ShowDebugInfor("nSongWinE:"..nSongWinE..", nLiaoWinE:"..nLiaoWinE..", nDrawE:"..nDrawE);
	BT_ShowDebugInfor("nSongWinM:"..nSongWinM..", nLiaoWinM:"..nLiaoWinM..", nDrawM:"..nDrawM);
	Talk(1,"BTS_ViewBattleStatistic","L辌h s? chi課 trng T鑞g-Li猽: <enter>"
		..gf_FormatStringLength(" ",20).."<color=yellow>"..gf_FormatStringLength("S? l莕 phe T鑞g th緉g",11).."<color=green>"..gf_FormatStringLength("S? l莕 phe Li猽 th緉g",11).."<color=red>"..gf_FormatStringLength("S? l莕 i b猲 h遖",11).."\n"
		..gf_FormatStringLength("Chi課 trng Th玭 trang",25).."<color=yellow>"..gf_FormatStringLength(nSongWinV,11).."<color=green>"..gf_FormatStringLength(nLiaoWinV,11).."<color=red>"..gf_FormatStringLength(nDrawV,11).."<color>\n"
		..gf_FormatStringLength("Chi課 trng Th秓 c鑓",25).."<color=yellow>"..gf_FormatStringLength(nSongWinR,11).."<color=green>"..gf_FormatStringLength(nLiaoWinR,11).."<color=red>"..gf_FormatStringLength(nDrawR,11).."<color>\n"
		..gf_FormatStringLength("Chi課 trng ph竜 i",25).."<color=yellow>"..gf_FormatStringLength(nSongWinE,11).."<color=green>"..gf_FormatStringLength(nLiaoWinE,11).."<color=red>"..gf_FormatStringLength(nDrawE,11).."<color>\n"
		..gf_FormatStringLength("Chi課 trng Nh筺 M玭 quan",25).."<color=yellow>"..gf_FormatStringLength(nSongWinM,11).."<color=green>"..gf_FormatStringLength(nLiaoWinM,11).."<color=red>"..gf_FormatStringLength(nDrawM,11).."<color>\n"
		..gf_FormatStringLength("t鎛g c閚g",25).."<color=yellow>"..gf_FormatStringLength(nTotalSongWin,11).."<color=green>"..gf_FormatStringLength(nTotalLiaoWin,11).."<color=red>"..gf_FormatStringLength(nTotalDraw,11).."<color>");
end;

function nothing()

end;