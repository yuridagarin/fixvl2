--�鿴ս�������һЩͳ����Ϣ
--ս��ͳ��ϵͳ˵����
--ͳ��������Ҫ���������ģ�飺4��ս������һ��ͳ����Ϣ��ս����ͳ����Ϣ
--ApplyRelayShareData�ĵ�һ������Ϊ"battle_statistic"����ʾ�������ݿ��е�ս��ͳ��ģ��
--�ڶ���������ʾս���ĸ���ͳ����Ϣ������1��4��ʾ�ĸ�ս������һ��ͳ����Ϣ��5��ʾս���ܵ�ͳ����Ϣ
--������������ʾͳ����Ϣ������,1��ʾ���ս��ͳ�ƣ�2Ϊ���˻��������������ĸ��ݲ�ͬ��ս�����в�ͬ�Ķ���
--ע��ʹ��functions.lua�ĺ���ʱ��Ҫʹ����Щ��Mission�йصĺ���
Include("\\script\\newbattles\\functions.lua");
BTS_MAX_ITEM_COUNT = 5;	--ÿҳ�����ʾ��Ϣ����
BTS_MAX_RANK_NUM = 20;	--ֻ��ʾ��ǰ20�������

BTS_TYPE_MAIN_INFOR = 1;		--���ս��ͳ����Ϣ
BTS_TYPE_POINT_RANK = 2;		--���˻���������Ϣ
BTS_TYPE_KILL_PLAYER_COUNT = 3;	--ɱ����������Ϣ
BTS_TYPE_DEATH_COUNT = 4;		--��ɱ����������Ϣ

--ͳ��ģ�����
function BTS_ViewBattleStatistic()
	local selTab = {
				"Chi�n tr��ng Gi�i C�u N�ng Trang/BTS_ViewVillageBattle",
				"Chi�n tr��ng Thu Th�p L��ng Th�o/BTS_ViewResourceBattle",
				"Chi�n tr��ng B�o V� Th�nh Tr�/BTS_ViewEmplacementBattle",
				"Chi�n tr��ng Nh�n M�n R�c L�a/BTS_ViewMainBattle",
				"L�ch s� chi�n tr��ng/BTS_ViewBattleHistory",
				--"�����Ի�/main",
				"K�t th�c/nothing",
				}
	Say("B�n mu�n xem tin t�c chi�n tr��ng n�o?",getn(selTab),selTab);
end;
--�ϳ�����ս��ͳ����Ϣ
function BTS_ViewVillageBattle()
	local selTab = {
				"K�t qu� cu�i c�ng/#BTS_Battle_Final_Result(1)",
				--"���˻�������/#BTS_Public_Rank(1,2)",
				"Quay l�i n�i dung tr��c./BTS_ViewBattleStatistic",
				"K�t th�c/nothing",
				}
	Say("B�n mu�n xem n�i dung n�o trong Chi�n tr��ng Th�n trang:",getn(selTab),selTab);
end;
--�ϳ��ݹȳ�ս��ͳ����Ϣ
function BTS_ViewResourceBattle()
	local selTab = {
				"K�t qu� cu�i c�ng/#BTS_Battle_Final_Result(2)",
				--"���˻�������/#BTS_Public_Rank(2,2)",
				"Quay l�i n�i dung tr��c./BTS_ViewBattleStatistic",
				"K�t th�c/nothing",
				}
	Say("B�n mu�n xem n�i dung n�o trong Chi�n tr��ng Th�o c�c:",getn(selTab),selTab);
end;
--�ϳ���̨ս��ͳ����Ϣ
function BTS_ViewEmplacementBattle()
	local selTab = {
				"K�t qu� cu�i c�ng/#BTS_Battle_Final_Result(3)",
				--"���˻�������/#BTS_Public_Rank(3,2)",
				--"�����������˴�������/#BTS_Public_Rank(3,3)",
				--"������������������/#BTS_Public_Rank(3,4)",
				"Quay l�i n�i dung tr��c./BTS_ViewBattleStatistic",
				"K�t th�c/nothing",
				}
	Say("B�n mu�n xem n�i dung n�o trong Chi�n tr��ng ph�o ��i:",getn(selTab),selTab);
end;
--�ϳ����Ź�ս��ͳ����Ϣ
function BTS_ViewMainBattle()
	local selTab = {
				"K�t qu� cu�i c�ng/#BTS_Battle_Final_Result(4)",
				--"�������˻�������/#BTS_Public_Rank(4,2)",
				--"�����������˴�������/#BTS_Public_Rank(4,3)",
				--"������������������/#BTS_Public_Rank(4,4)",
				--"Ӫ�������������/BTS_Main_Help_Refugee_Rank",
				"Quay l�i n�i dung tr��c./BTS_ViewBattleStatistic",
				"K�t th�c/nothing",
				}
	Say("B�n mu�n xem n�i dung n�o trong Nh�n M�n Quan:",getn(selTab),selTab);
end;
--�鿴�ϳ�ս�����ս��
function BTS_Battle_Final_Result(nBattleType)
	local tCallBackFunc = {
		[VILLAGE_ID] = "BTS_CB_Village_Final_Result",
		[RESOURCE_ID] = "BTS_CB_Resource_Final_Result",
		[EMPLACEMENT_ID] = "BTS_CB_Emplacement_Final_Result",
		[MAINBATTLE_ID] = "BTS_CB_Main_Final_Result",
		}
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,BTS_TYPE_MAIN_INFOR,RELAY_CALLBACK_SCRIPT,tCallBackFunc[nBattleType]);
end;
--�鿴�ϳ�ս�����˻�������
function BTS_Public_Rank(nBattleType,nRecordType)
	BT_SetTempData(PTT_SNAPSHOOT,nBattleType);
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,nRecordType,RELAY_CALLBACK_SCRIPT,"BTS_CB_Show_Pub_Rank");
end;
--����ս�����ս��ͳ����Ϣ�ص�����
function BTS_CB_Village_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewVillageBattle","Hi�n kh�ng c� tin t�c");
		return 0;
	end;
	local _,nResult,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h�a nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh�n ���c"..tBattleName[nBattleType].." th�ng l�i cu�i c�ng";
	end;
	Talk(1,"BTS_ViewVillageBattle","T�i"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.."k�t qu� tr�n ��u:"..sResultStr.."<enter>Phe T�ng t�m ���c: <color=yellow>"..nStepSong.."<color><enter>Phe Li�u t�m ���c: <color=yellow>"..nStepLiao.."<color>");
end;
--�ݹȳ�ս�����ս��ͳ����Ϣ�ص�����
function BTS_CB_Resource_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewResourceBattle","Hi�n kh�ng c� tin t�c");
		return 0;
	end;
	local _,nResult,nResSong,nResLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h�a nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh�n ���c"..tBattleName[nBattleType].." th�ng l�i cu�i c�ng";
	end;
	Talk(1,"BTS_ViewResourceBattle","T�i"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.."k�t qu� tr�n ��u:"..sResultStr.."<enter>S� l��ng th�o phe T�ng: <color=yellow>"..nResSong.."<color><enter>S� l��ng th�o phe Li�u: <color=yellow>"..nResLiao.."<color>");
end;
--��̨ս�����ս��ͳ����Ϣ�ص�����
function BTS_CB_Emplacement_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewEmplacementBattle","Hi�n kh�ng c� tin t�c");
		return 0;
	end;
	local _,nResult,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h�a nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh�n ���c"..tBattleName[nBattleType].." th�ng l�i cu�i c�ng";
	end;
	Talk(1,"BTS_ViewEmplacementBattle","T�i"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.."k�t qu� tr�n ��u:"..sResultStr.."<enter>Th�i gian chi�m l�nh ph�o ��i c�a phe T�ng: <color=yellow>"..nTimeSong.." gi�y<color> Th�i gian chi�m l�nh ph�o ��i c�a phe Li�u: <color=yellow>"..nTimeLiao.." gi�y<color><enter>�i�m t�ch l�y phe T�ng: <color=yellow>"..nPubPointSong.."<color>�i�m t�ch l�y phe Li�u: <color=yellow>"..nPubPointLiao.."<color><enter>S� ng��i th��ng vong phe T�ng: <color=yellow>"..nDeathSong.."<color> S� ng��i th��ng vong phe Li�u: <color=yellow>"..nDeathLiao.."<color>");
end;
--���Ź�ս�����ս��ͳ����Ϣ�ص�����
function BTS_CB_Main_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewMainBattle","Hi�n kh�ng c� tin t�c");
		return 0;
	end;
	local _,nResult,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe h�a nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nh�n ���c"..tBattleName[nBattleType].." th�ng l�i cu�i c�ng";
	end;
	Talk(1,"BTS_ViewMainBattle","T�i"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.."k�t qu� tr�n ��u:"..sResultStr.."<enter>�i�m t�ch l�y phe T�ng: <color=yellow>"..nPubPointSong.."<color>�i�m t�ch l�y phe Li�u: <color=yellow>"..nPubPointLiao.."<color><enter>S� n�n d�n phe T�ng c�u: <color=yellow>"..nHelpRefugeeSong.."<color> S� n�n d�n phe Li�u c�u: <color=yellow>"..nHelpRefugeeLiao.."<color><enter>S� ng��i th��ng vong phe T�ng: <color=yellow>"..nDeathSong.."<color> S� ng��i th��ng vong phe Li�u: <color=yellow>"..nDeathLiao.."<color>");
end;
--ս�����˻�������ͳ����Ϣ�ص�������ֻ����������ս����ͬ����Щ����
function BTS_CB_Show_Pub_Rank(szKey,nBattleType,nRecordType,nRecordCount)
	local tTitle = {""," T�ch l�y c� nh�n","S� l�n gi�t ��ch ","S� l�n b� gi�t"};	--��һ��������ͳ�����ս���ˡ�������ƺ���̫�ף���ʱ���ܰ�
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	if nRecordCount == 0 then
		Talk(1,tReturnFunc[BT_GetTempData(PTT_SNAPSHOOT)],"Hi�n kh�ng c� tin t�c");
		return 0;
	end;
	if nRecordCount > BTS_MAX_RANK_NUM then
		nRecordCount = BTS_MAX_RANK_NUM;	--ֻ��ǰBTS_MAX_RANK_NUM��
	end;
	BTS_Show_Rank_Page(tTitle[nRecordType],1,szKey,nBattleType,nRecordType,nRecordCount);
end;
--��ʾ�������еĺ�������һ��������Ҫ������Ŀ���ַ����������ڶ��������ǵ�ǰҪ��ʾ��ҳ����
function BTS_Show_Rank_Page(sTitle,nPageNum,szKey,nBattleType,nRecordType,nRecordCount)
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	local selTab = {};
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
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
	local sContent = gf_FormatStringLength("H�ng",6)..gf_FormatStringLength("T�n",18)..gf_FormatStringLength("M�n ph�i",10)..gf_FormatStringLength("C�p",6)..gf_FormatStringLength(sTitle,strlen(sTitle)+2)..gf_FormatStringLength("Phe",4).."<enter>";
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		sName,nData,nRoute,nLevel,nCamp = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,i)
		sContent = sContent..gf_FormatStringLength(i+1,6)..gf_FormatStringLength(sName,18)..gf_FormatStringLength(tRoute[nRoute],10)..gf_FormatStringLength(nLevel,6)..gf_FormatStringLength(nData,strlen(sTitle)+2)..gf_FormatStringLength(tCampNameZ[nCamp],4).."<enter>"
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"Trang tr��c/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum-1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/BTS_MAX_ITEM_COUNT) then
		tinsert(selTab,"Trang k�/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum+1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");	
	end;
	tinsert(selTab,"Quay l�i n�i dung tr��c./"..tReturnFunc[nBattleType]);
	local nLength = strlen(sContent);
	sContent = strsub(sContent,1,nLength-7);
	Say(sContent,getn(selTab),selTab);
end
--�鿴ս����ʷ��¼
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
	Talk(1,"BTS_ViewBattleStatistic","L�ch s� chi�n tr��ng T�ng-Li�u: <enter>"
		..gf_FormatStringLength(" ",20).."<color=yellow>"..gf_FormatStringLength("S� l�n phe T�ng th�ng",11).."<color=green>"..gf_FormatStringLength("S� l�n phe Li�u th�ng",11).."<color=red>"..gf_FormatStringLength("S� l�n ��i b�n h�a",11).."\n"
		..gf_FormatStringLength("Chi�n tr��ng Th�n trang",25).."<color=yellow>"..gf_FormatStringLength(nSongWinV,11).."<color=green>"..gf_FormatStringLength(nLiaoWinV,11).."<color=red>"..gf_FormatStringLength(nDrawV,11).."<color>\n"
		..gf_FormatStringLength("Chi�n tr��ng Th�o c�c",25).."<color=yellow>"..gf_FormatStringLength(nSongWinR,11).."<color=green>"..gf_FormatStringLength(nLiaoWinR,11).."<color=red>"..gf_FormatStringLength(nDrawR,11).."<color>\n"
		..gf_FormatStringLength("Chi�n tr��ng ph�o ��i",25).."<color=yellow>"..gf_FormatStringLength(nSongWinE,11).."<color=green>"..gf_FormatStringLength(nLiaoWinE,11).."<color=red>"..gf_FormatStringLength(nDrawE,11).."<color>\n"
		..gf_FormatStringLength("Chi�n tr��ng Nh�n M�n quan",25).."<color=yellow>"..gf_FormatStringLength(nSongWinM,11).."<color=green>"..gf_FormatStringLength(nLiaoWinM,11).."<color=red>"..gf_FormatStringLength(nDrawM,11).."<color>\n"
		..gf_FormatStringLength("t�ng c�ng",25).."<color=yellow>"..gf_FormatStringLength(nTotalSongWin,11).."<color=green>"..gf_FormatStringLength(nTotalLiaoWin,11).."<color=red>"..gf_FormatStringLength(nTotalDraw,11).."<color>");
end;

function nothing()

end;