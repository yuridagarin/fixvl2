Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qixi08\\head.lua");

--��õ���Ļ���ֺͻID
function QX08_GetTodayGame()
	local nCurWeekDate = tonumber(date("%w"));
	return tostring(g_tbGameSchedule[nCurWeekDate][1]),g_tbGameSchedule[nCurWeekDate][2];
end;
--���������Ϣ
function QX08_GetDate(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	return nYear,nMonth,nDay;
end;
--������ͳһ�ӿڡ�ע�⣬�˺��������ڸ����NPC�Ľű��ϵ���
--nType:�ID
--nAwardLevel:�����ȼ�
--nTaskID:��¼�����Ƿ���ȡ���������������ID
function QX08_GetAward(nType,nAwardLevel,nTaskID)
	if nAwardLevel == 0 then
		Talk(1,"",g_szInfoHead.."H�m nay ng��i kh�ng c� th�nh t�ch g�, kh�ng th� nh�n th��ng.");
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho�t ��ng Olympic sai]:"..GetName().."nAwardLevel b� l�i, tr� l�i: "..nAwardLevel);
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
			szTitleAward = "Ngo�i ra, do h�m nay ng��i li�n t�c 10 l�n tr� l�n �o�n ��ng s�, ng��i nh�n ���c danh hi�u <color=yellow>'Thi�n C� Th�n To�n'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_BOX then
		if GetTask(Box_prize_9_times) >= 10 then
			szTitleAward = "Ngo�i ra, do h�m nay ng��i li�n t�c 10 l�n v��t �i th�nh c�ng, ng��i nh�n ���c danh hi�u <color=yellow>'�o�t B�o K� Binh'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_LIGHT then
		if GetTask(TSK_AOYUN_LIGHT_NUM) >= 10 then
			szTitleAward = "Ngo�i ra, do h�m nay ng��i li�n t�c 10 l�n v��t �i th�nh c�ng, ng��i nh�n ���c danh hi�u <color=yellow>'Xai ��ng V��ng'<color>.";
			bGotTitle = 1;
		end;
	end;
	local szOtherAward = "";
	if nLevel == 99 then
		szOtherAward = "<color=yellow>"..nBagNum.."<color> T�i b�o th�ch, <color=yellow>"..nPoint.."<color> �i�m t�ch l�y ho�t ��ng."
	else
		szOtherAward = "<color=yellow>"..nPoint.."<color> �i�m t�ch l�y ho�t ��ng."
	end;
	local selTab = {
				"Nh�n /#QX08_GetAward_1("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
				"T�m th�i kh�ng nh�n/nothing",
				}
	if IB_VERSION == 1 then	--���
		if nLevel ~= 99 then
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
			szAwardInfo = "Ng��i nh�n ���c ph�n th��ng c�p <color=yellow>"..nAwardLevel.."<color>, n�i dung ph�n th��ng l�: <color=yellow>"..nExpAward.." �i�m kinh nghi�m<color>,"..szOtherAward..szTitleAward.."��ng � nh�n kh�ng?"
		else
			szAwardInfo = "Ng��i nh�n ���c ph�n th��ng c�p <color=yellow>"..nAwardLevel.."<color>, n�i dung ph�n th��ng l�:"..szOtherAward..szTitleAward.."��ng � nh�n kh�ng?";
		end;
	else
		if nLevel ~= 99 then
			local nCurGoldenExp = GetGoldenExp();
			nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
			szAwardInfo = "Ng��i nh�n ���c ph�n th��ng c�p <color=yellow>"..nAwardLevel.."<color>, n�i dung ph�n th��ng l�: chuy�n <color=yellow>"..nGoldenExpAward.."<color> �i�m s�c kh�e th�nh �i�m kinh nghi�m (hi�n t�i �i�m s�c kh�e l� "..nCurGoldenExp.."),<color=yellow>"..nExpAward.."<color>,"..szOtherAward..szTitleAward.."��ng � nh�n kh�ng?"
		else
			szAwardInfo = "Ng��i nh�n ���c ph�n th��ng c�p <color=yellow>"..nAwardLevel.."<color>, n�i dung ph�n th��ng l�:"..szOtherAward..szTitleAward.."��ng � nh�n kh�ng?";
		end;
	end;
	Say(g_szInfoHead..szAwardInfo,getn(selTab),selTab);
end;
--��Խ������鲻�������ӵ�һ������
function QX08_GetAward_1(nType,nAwardLevel,nTaskID,bGotTitle)
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho�t ��ng Olympic sai]:"..GetName().."nAwardLevel b� l�i, tr� l�i: "..nAwardLevel);
		return 0;
	end;
	local nLevel = GetLevel();
	local nCurGoldenExp = GetGoldenExp();
	local nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
	if IB_VERSION ~= 1 and nLevel ~= 99 and nGoldenExpAward > nCurGoldenExp then
		local selTab = {
					"��ng �/#QX08_GetAward_2("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
					"H�y b�/nothing",
					}
		Say(g_szInfoHead.." ng��i c� th� chuy�n <color=yellow>"..nGoldenExpAward.."<color> �i�m s�c kh�e, nh�ng �i�m s�c kh�e hi�n t�i l� <color=yellow>"..nCurGoldenExp.."<color> �i�m, <color=red>nh� h�n<color> �i�m s�c kh�e ng��i c� th� chuy�n, ng��i c� mu�n chuy�n kh�ng?",getn(selTab),selTab);
	else
		QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	end;
end;

function QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	if gf_JudgeRoomWeight(6,20,g_szInfoHead) == 0 then
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho�t ��ng Olympic sai]:"..GetName().."nAwardLevel b� l�i, tr� l�i: "..nAwardLevel);
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
		Msg2Player("B�n nh�n ���c danh hi�u"..g_tbTitleName[nType].." ' danh hi�u");
		WriteLog("[Ho�t ��ng Olympic]:"..GetTime().."Nh�n ���c "..g_tbTitleName[nType].."Hi�u");
	end;
	local nPoint = g_tbAward[nAwardLevel][4];
	SetTask(TSK_AOYUN_POINT,GetTask(TSK_AOYUN_POINT)+nPoint);
	if GetTask(TSK_AOYUN_POINT) > g_nJifenMax then
		SetTask(TSK_AOYUN_POINT,g_nJifenMax);
		Msg2Player("B�n nh�n ���c "..nPoint.."�i�m t�ch l�y ho�t ��ng");
		Msg2Player("�i�m c�a ng��i �� ��t ��n "..g_nJifenMax.." �i�m, m�i ng��i nhi�u nh�t c� th� t�ch l�y "..g_nJifenMax.." �i�m.");
	else	
		Msg2Player("B�n nh�n ���c "..nPoint.."�i�m t�ch l�y ho�t ��ng");
	end
	if nLevel == 99 then	--99���������շ����һ����
		local nNum = g_tbAward[nAwardLevel][3];
		AddItem(2,1,2642,nNum);
		Msg2Player("B�n nh�n ���c "..nNum.." T�i b�o th�ch");
		WriteLog("[Ho�t ��ng Olympic]:"..GetName().."�� nh�n "..nType.."s�"..nAwardLevel.." - ph�n th��ng ho�t ��ng:"..nNum.." T�i b�o th�ch.");
		return 1;
	end;
	if IB_VERSION == 1 then	--���
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
		WriteLog("[Ho�t ��ng Olympic]:"..GetName().."�� nh�n "..nType.."s�"..nAwardLevel.." - ph�n th��ng ho�t ��ng:"..nExpAward.." �i�m kinh nghi�m");
	else	--�շ�
		local nCurGoldenExp = GetGoldenExp();
		nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
		gf_GoldenExp2Exp(nGoldenExpAward);
		WriteLog("[Ho�t ��ng Olympic]:"..GetName().."�� nh�n "..nType.."s�"..nAwardLevel.." - ph�n th��ng ho�t ��ng: Chuy�n"..nGoldenExpAward.." �i�m s�c kh�e; "..nExpAward.." �i�m kinh nghi�m");
	end;
end;

function nothing()

end;

--=====================��Ԫ2008��11��5���¼�=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--�����ܵ�����
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;