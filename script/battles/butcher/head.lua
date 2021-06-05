Include("\\script\\battles\\battlehead.lua")
Include("\\script\\shinynight_head.lua")
Include("\\script\\online\\zgc_temp_fun.lua")
IncludeLib("SETTING");
MISSIONID = 20
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����
sf_aryItems = {
	{ "Ti�n Th�o L�", {6,1,71,1,0,0}, 20 },
	{ "Gia B�o ho�n", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung ho�n", {6,0,5,1,0,0}, 5 },
	{ "Cao Thi�m ho�n", {6,0,4,1,0,0}, 5 },
	{ "Tr��ng M�nh ho�n", {6,0,1,1,0,0}, 5 },
	{ "Phi T�c ho�n", {6,0,6,1,0,0}, 5 },
	{ "��c Ph�ng ho�n", {6,0,10,1,0,0}, 5 },
	{ "B�ng Ph�ng ho�n", {6,0,7,1,0,0}, 5 },
	{ "H�a Ph�ng ho�n", {6,0,9,1,0,0}, 5 },
	{ "L�i Ph�ng ho�n", {6,0,8,1,0,0}, 5 },
	{ "��i L�c ho�n", {6,0,3,1,0,0}, 30 },
	{ "Ph�o hoa", {6,0,11,1,0,0}, 1 },
	{ "Hoa H�ng", {6,0,20,1,0,0}, 2 },
	{ "T�m T�m T��ng �nh ph�", {6,1,18,1,0,0}, 5 },
	}

SL_AWARDITEM = {
			{2,1,196,1},	--�η�ս��
			{2,1,197,1},	--��ս��
}

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 45 * 60  * FRAME2TIME; -- ս��ʱ��Ϊ45���ӣ����б���15���ӣ���սʱ��30����
RUNGAME_TIME = 15 * 60 * FRAME2TIME / TIMER_1; --����15����֮���Զ�����ս���׶�
CLOSE_SIGNUP_TIME = 25 * 60 * FRAME2TIME / TIMER_1	--��ս��10���ӹرձ���
MAX_MEMBERCOUNT = 100--100
TIME_PLAYER_REV = 10--10 ; -- ����������˳���Ϸ�ٽ���ʱ������3����֮������뿪��Ӫ����Ӫ
TIME_PLAYER_STAY = 120	--GetGameTime() ����Ϊ��λ
--������ĳЩֵ��¼��MissionValue�е�����λ�ã�ͨ��GetMissionV(MS_XXX)�����ʵ�ʵ�ֵ
MS_butcher = 2;--��¼��ǰ���������ξ�Ԫ˧��1�������ɾ�Ԫ˧��2�����Ƕ������ˣ�3��

MS_CENTER_X1 = 4;   --����1���������׶�ʱ����ֹ����뿪��Ӫʱ��������ӻش�Ӫ������
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--����2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --����1����Ӫ������
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --��Ӫ������
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--����2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --��¼Timer1ִ�еĴ���

MS_MOSTDEATH = 18	--���һ������������Ϊ��1���Σ���2���ɣ�������Ϊ��0

MS_TOTALPOINT_S = 19		--����ս�۽���ʱ���㣬��¼����ս���η���ս��
MS_TOTALPOINT_J = 20		--����ս�۽���ʱ���㣬��¼����ս���ɷ���ս��


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"
--��Ӫ��ǰӪ��trap�ű�
FILE_HOME2CENTERTRAP1 = "\\script\\battles\\butcher\\home2fronttrap1.lua"
FILE_HOME2CENTERTRAP2 = "\\script\\battles\\butcher\\home2fronttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"

--Npc��ģ���ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--��С�����ĳһ��Ӫ����������������ս������Ӫ������������ڸ���Ŀ�����Ӫ���䣬����ս��������
MIN_PLAYER_COUNT_LIMIT = 10--10
MIN_PLAYER_COUNT_ING = 1--5
AVERAGE_PLAYERCOUNT = 5--20

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_KEY = 7;		--��¼��ǰ��ͼ�������һ��key����һ��������ɵ�����

--MS_NEWSVALUE = 10; --�����д�����ű����ĵط�

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns( wincamp )
	oldPlayerIndex = PlayerIndex
	
	local idx = 0;
	local pidx = 0;
	local tbPlayer = {}
	local tbFailPlayer = {}
	local nCount = 1;
	
	if wincamp == 3 then	--ƽ��
		for i = 1, 500 do
			idx, pidx = GetNextPlayer(MISSIONID, idx, 0);
			if pidx > 0 then
				PlayerIndex = pidx;
				bt_addtotalpoint(350);
				local point = multiple_reward(SYS_BATTLE, 350)
				Say("Tr�n n�y 2 b�n h�a nhau. B�n nh�n ���c <color=yellow>"..point.."<color> �i�m chi�n c�ng.", 0)
			end;
			
			if idx == 0 then
				break;
			end;
		end;
		PlayerIndex = oldPlayerIndex;
		return
	end;
	
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
		if( pidx > 0 ) then
			tbPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
	 	if (idx == 0) then 
			break
		end;
	end
		--��������Է���Ӫû����ң���ʤ����������
	local failcamp = 0
	if (wincamp == 1) then
		failcamp = 2
	else
		failcamp = 1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b�i kh�ng c� ng��i ch�i n�n phe th�ng kh�ng ���c ph�n th��ng","Nh�t k� T�ng Li�u")
		return
	end
	
	nCount = 1;
	for i = 1, 500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp);
		if pidx > 0 then
			tbFailPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
		if idx == 0 then
			break
		end;
	end;
	
	--������������ս����������������ҵı����͸�ʤ��
--	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
--	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
--	local AVRCUN = (wincamp_count + failcamp_count) / 2
--	local bonuscff1 = 0
--	if (AVRCUN == 0) then
--		bonuscff1 = 1
--		bonuscff2 = 1
--	else
--		bonuscff1 = 1 - ( ( wincamp_count - AVRCUN ) / AVRCUN )
--		bonuscff2 = 1 - ( ( failcamp_count - AVRCUN ) / AVRCUN )
--	end
--	bonuscff1 = floor(1000 * bonuscff1)	--���������Ľ�������
--	if( bonuscff1 < 500 ) then
--		bonuscff1 = 500
--	end
--	WriteLog("ʤ�����͸��Ľ���ս��Ϊ\t"..bonuscff1,"������־")

	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
	local bonus_s = GetMissionV(MS_TOTALPOINT_S);
	local bonus_j = GetMissionV(MS_TOTALPOINT_J);
	local nMax = 0;
	local nMin = 0;
	
	if bonus_s > bonus_j then
		nMax = bonus_s
		nMin = bonus_j
	else
		nMax = bonus_j
		nMin = bonus_s
	end
	
	local nWinBouns = floor(1000 + nMax / wincamp_count)
	local nFailBouns = floor(350 + nMin / failcamp_count)
	local nLevel = 0;
	local nGoldenExp = 0;
	local nExp = 0;
	local nDate = tonumber(date("%y%m%d"));
	for i = 1, getn(tbPlayer) do
		PlayerIndex = tbPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nWinBouns)
		SetTask(763,GetTask(763)+1);	--��������
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 1500000 then
			nGoldenExp = 1500000
		end;
		if IsPlayerDeath() == 0 then	--��������״̬
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(1000000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(1000000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(1000000*0.8);
			else
				nExp = 1000000;
			end;
			if IsPlayerDeath() == 0 then	--��������״̬
				ModifyExp(nExp);
				sExpString = "B�n nh�n ���c th�m"..nExp.."�i�m kinh nghi�m. M�i ng��i m�i ng�y ch� nh�n ���c th�m 2 l�n �i�m kinh nghi�m.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--��������״̬
			Msg2Player("Do phe b�n gi�nh ���c th�ng l�i, nh�n ���c ban th��ng c�a nguy�n so�i,"..nGoldenExp.."�i�m s�c kh�e nhanh ch�ng ��i th�nh kinh nghi�m."..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nWinBouns)
		--AddItem(SL_AWARDITEM[wincamp][1], SL_AWARDITEM[wincamp][2], SL_AWARDITEM[wincamp][3], SL_AWARDITEM[wincamp][4])
		Say("Phe ta ��i th�ng tr�n n�y. B�n nh�n ���c <color=yellow>"..point.."<color> �i�m chi�n c�ng.", 0)
	end
	sExpString = "";
	for i = 1, getn(tbFailPlayer) do
		PlayerIndex = tbFailPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nFailBouns)
		SetTask(763,GetTask(763)+1);	--��������
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 500000 then
			nGoldenExp = 500000
		end;
		if IsPlayerDeath() == 0 then	--��������״̬
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(300000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(300000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(300000*0.8);
			else
				nExp = 300000;
			end;
			if IsPlayerDeath() == 0 then	--��������״̬
				ModifyExp(nExp);
				sExpString = "B�n nh�n ���c th�m"..nExp.."�i�m kinh nghi�m. M�i ng��i m�i ng�y ch� nh�n ���c th�m 2 l�n �i�m kinh nghi�m.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--��������״̬
			Msg2Player("Do phe b�n thua cu�c, nguy�n so�i ��ch th�n ch� ��o,"..nGoldenExp.."�i�m s�c kh�e nhanh ch�ng ��i th�nh kinh nghi�m. Hy v�ng n� l�c h�n!"..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nFailBouns)
		Say("B�n �� anh d�ng chi�n ��u, l�p nhi�u c�ng tr�ng. �� kh�ch l� t��ng s�, Th�nh Th��ng anh minh ban th��ng <color=yellow>"..point.."<color> �i�m chi�n c�ng.", 0);
	end;
	
	PlayerIndex = oldPlayerIndex
end

function sf_winbouns_old(wincamp)	--����
	--��������Է���Ӫû����ң���ʤ����������
	if (wincamp == 1) then
		failcamp =2
	else
		failcamp =1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b�i kh�ng c� ng��i ch�i n�n phe th�ng kh�ng ���c ph�n th��ng","Nh�t k� T�ng Li�u")
		return
	end
	
	--������������ս����������������ҵı����͸�ʤ��
	local CAMP1CUN = GetMSPlayerCount(MISSIONID, wincamp)
	local CAMP2CUN = GetMSPlayerCount(MISSIONID, failcamp)
	local AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	bonuscff1 = floor(1000 * bonuscff1)	--���������Ľ�������
	WriteLog("Ph�n th��ng chi�n c�ng phe th�ng nh�n ���c l�:"..bonuscff1,"Nh�t k� T�ng Li�u")
	
	sf_itemcount = getn(sf_aryItems)
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
	 	if (idx == 0) then 
			break
		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
	   		AddRepute(3);			
	   		Msg2Player("B�n ���c th�m 3 �i�m danh v�ng!")
			bt_addtotalpoint(bonuscff1)
			Msg2Player("B�n nh�n ���c "..bonuscff1.."�i�m chi�n c�ng!")
			Say("Ch�c m�ng b�n gi�nh ���c chi�n th�ng trong tr�n chi�n n�y, b�n ���c th�m <color=yellow>3<color> �i�m danh v�ng v� <color=yellow>"..bonuscff1.."<color> �i�m chi�n c�ng + <color=yellow>Huy�n Tinh Kho�ng Th�ch<color>!", 0)
				if (GetLevel() >= 40 and GetLevel() < 60) then
					AddItem(6,1,147,1,0,0);
				end
				if (GetLevel() >= 60 and GetLevel() < 90) then
					AddItem(6,1,147,2,0,0);
				end
				if (GetLevel() >= 90 ) then
					AddItem(6,1,147,3,0,0);
				end
				randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#> Ch�c m�ng b�n nh�n ���c ph�n th��ng"..szItemName);
			end;
 		end;
	end
end;

function but_addmissionpoint(totalpoint)
print( "but_addmissionpoint=="..totalpoint )
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_S)=="..GetMissionV(MS_TOTALPOINT_S))
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_J)=="..GetMissionV(MS_TOTALPOINT_J))
	end
end

function GameOver()
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	WriteLog(szGAME_GAMELEVEL[ lsf_level ].."battle is ending\tsongmemcount\t"..GetMSPlayerCount(MISSIONID, 1).."\tliaomemcount\t"..GetMSPlayerCount(MISSIONID, 2).."\tsongpoint\t"..bonus_s.."\tliaopoint\t"..bonus_j,"Nh�t k� T�ng Li�u")
	
	--����������ص�����������

--	--ģʽ�����а�

		BT_SortWorldLadder(PL_TOTALPOINT, 10147)
		BT_SortWorldLadder(PL_KILLPLAYER, 10148)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10149)
		BT_SortWorldLadder(PL_GETITEM, 10150)

	--ģʽ�ӵȼ����а�
--		if (lsf_level == 3) then
--			BT_SortWorldLadder(PL_KILLPLAYER, 10151)
--			BT_SortWorldLadder(PL_MAXSERIESKILL, 10152)
--			BT_SortWorldLadder(PL_GETITEM, 10153)
--			BT_SortWorldLadder(PL_TOTALPOINT, 10154)
		if (lsf_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10155)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10156)
			BT_SortWorldLadder(PL_GETITEM, 10157)
			BT_SortWorldLadder(PL_TOTALPOINT, 10158)
		elseif (lsf_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10159)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10160)
			BT_SortWorldLadder(PL_GETITEM, 10161)
			BT_SortWorldLadder(PL_TOTALPOINT, 10162)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (lsf_level == 1) then
		resultstr = "Khu v�c s� c�p"
	elseif (lsf_level == 2) then
		resultstr = "Khu v�c cao c�p"
	end
	
	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."Chi�n ��u k�t th�c, t�ng chi�n c�ng hai phe T�ng Li�u nh�n ���c l�"..bonus_s..":"..bonus_j..", phe T�ng gi�nh chi�n th�ng!";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"Nh�t k� T�ng Li�u")
			BT_ReportResult(1)
			RecordBTCount_Win(1)		--��ÿ��������������¼���˴�����ս��ʤ��״��
			sf_winbouns(1)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."Chi�n ��u k�t th�c, t�ng chi�n c�ng hai phe T�ng Li�u nh�n ���c l�"..bonus_s..":"..bonus_j..", phe Li�u gi�nh chi�n th�ng!"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"Nh�t k� T�ng Li�u")
			BT_ReportResult(2)
			RecordBTCount_Win(2)	--��ÿ��������������¼���˴�����ս��ʤ��״��
			sf_winbouns(2)
		else
			resultstr = resultstr.."Chi�n ��u k�t th�c, t�ng chi�n c�ng hai phe T�ng Li�u nh�n ���c l�"..bonus_s..":"..bonus_j..", chi�n d�ch l�n n�y b�t ph�n th�ng b�i"
			Msg2MSAll(MISSIONID, resultstr)
			sf_winbouns(3);	--ƽ��
			WriteLog(resultstr,"Nh�t k� T�ng Li�u")
		end;

		AddGlobalNews(resultstr)

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."Th�i gian khai chi�n �� ��n, nh�ng s� ng��i hai phe kh�ng ��t y�u c�u. H�y tr�n chi�n!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh�t k� T�ng Li�u")
		AddGlobalNews(resultstr)
	elseif( GetMissionV(MS_MOSTDEATH) == 2 ) then
		resultstr = resultstr.."Do qu�n s� phe Li�u ��o ng� trong chi�n d�ch n�n phe T�ng gi�nh chi�n th�ng!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh�t k� T�ng Li�u")
		AddGlobalNews(resultstr)
		BT_ReportResult(1)
		RecordBTCount_Win(1)	--��ÿ��������������¼���˴�����ս��ʤ��״��
		sf_winbouns(1)
	elseif( GetMissionV(MS_MOSTDEATH) == 3 ) then
		resultstr = resultstr.."Do qu�n s� phe T�ng ��o ng� trong chi�n d�ch n�n phe Li�u gi�nh chi�n th�ng!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"Nh�t k� T�ng Li�u")
		AddGlobalNews(resultstr)
		BT_ReportResult(2)
		RecordBTCount_Win(2)	--��ÿ��������������¼���˴�����ս��ʤ��״��
		sf_winbouns(2)
	end
	Msg2Global(resultstr)
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[getn(tbPlayer)+1] = pidx
		end
		if (idx <= 0) then
	 		break
	 	end
	end 	

 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	Xmas_prize_get(1)	--ʥ������
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetCreateTeam(0);
		SetDeathScript("");
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0, 0)
		level = BT_GetGameData(GAME_LEVEL);
		UseScrollEnable(1);
		local temp_mapid,temp_posx, temp_posy = bt_getsignpos(l_curcamp)
		local campname = ""	
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[lsf_level], tbGAME_SIGNMAP[lsf_level])
			NewWorld(bt_getsignpos(1))
			campname = "T�ng\t"
		else	
			SetRevPos(tbGAME_SIGNMAP[lsf_level], (tbGAME_SIGNMAP[lsf_level] + 1))
			NewWorld(bt_getsignpos(2))
			campname = "Li�u\t"
		end;
		WriteLog( campname..GetName().."\t��ng c�p\t"..GetLevel().."\tM�n ph�i\t"..GetPlayerRoute().."\t�i�m t�ch l�y v�ng n�y\t"..BT_GetData( PL_KILLPLAYER ),"Nh�t k� T�ng Li�u" )
		SetTempRevPos( temp_mapid, temp_posx * 32, temp_posy * 32 )
		SetLogoutRV(0);
	end;
end;

-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Binh l�c qu�n ta hi�n �� �� ti�u di�t gi�c Li�u, v�n c�n nhi�u c� h�i l�p c�ng! Anh h�ng! Xin ��i l�n sau!")
		elseif (camp==2) then
			Msg2Player("Binh l�c qu�n ta hi�n �� �� ti�u di�t gi�c T�ng, v�n c�n nhi�u c� h�i l�p c�ng! Anh h�ng! Xin ��i l�n sau!")
			return
		end
	end
	
	local ownmscount = GetMSPlayerCount(MISSIONID, camp)
	local countstr = ""
	if( camp == 1 ) then
		emymscount = GetMSPlayerCount(MISSIONID, 2)
		countstr = "S� ng��i b�o danh hai phe v��t qu�"..AVERAGE_PLAYERCOUNT..", hi�n s� ng��i phe T�ng qu� nhi�u. B�n kh�ng gia nh�p ���c!"
	else
		emymscount = GetMSPlayerCount(MISSIONID, 1)
		countstr = "S� ng��i b�o danh hai phe v��t qu�"..AVERAGE_PLAYERCOUNT..", hi�n s� ng��i phe Li�u qu� nhi�u. B�n kh�ng gia nh�p ���c!"
	end
	
	if( (ownmscount - emymscount) >= AVERAGE_PLAYERCOUNT ) then
		Talk(1, "", countstr)
		return
	end
	
	local timer1 = BT_GetTimer1()
	if (timer1 >= CLOSE_SIGNUP_TIME and BT_GetData(PL_KEYNUMBER) ~= BT_GetGameData(GAME_KEY)) then
		Talk(1, "", "Ti�n ph��ng Nh�n M�n quan �ang trong h�i k�ch li�t, ���ng v�o chi�n tr��ng c�a m�i b�n �� b� phong t�a. Vi�n qu�n ch� c� th� l�u l�i n�i n�y ��i tin chi�n b�o!")
		Msg2Player("Khai chi�n ���c 10 ph�t, ���ng ��n chi�n tr��ng Nh�n M�n Quan �� b� phong t�a.")
		return
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","B�n Li�u c�u c�c ng��i x�m ph�m b� c�i ta, gi�t h�i ��ng b�o ta, h�n cao nh� n�i! Ta th� s� quy�t chi�n ��n c�ng r�a h�n cho ��i T�ng!")
		else
			Talk(1,"","Li�u Qu�c ch�ng ta t��ng s� ng��i ng��i ��u thi�n chi�n. B�n T�ng Qu�c th�i n�t kia sao �� s�c ch�ng tr�! Ha! Ha! Ha!")
			return
		end
	end

if (result == 0) then
--	if (GetCash() >= 3000) then
--		Pay(3000)
		BT_LeaveBattle() -- �����ҿͻ��˵�ǰ����������
		BT_ClearPlayerData()
--		Msg2Player("ս����ʾ��ս���п��԰��������Ͻǵġ����л���ʾ��ǰս�������");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	else
--		Say("�Բ��𣬲μӱ������ɴ�ս������븶������3000��", 0)
--		return 
--	end
	if( camp == 1 ) then
		Msg2Player("Hoan ngh�nh hi�p kh�ch gia nh�p T�ng qu�n. Hi�n Li�u binh ch�a xu�t hi�n, t��ng s� h�y t�m ngh� ng�i. ��i hi�u l�nh c�ng x�ng l�n gi�t gi�t!")
	else
		Msg2Player("Hoan ngh�nh hi�p kh�ch gia nh�p Li�u qu�n. Hi�n Li�u binh ch�a xu�t hi�n, t��ng s� h�y t�m ngh� ng�i. ��i hi�u l�nh c�ng x�ng l�n gi�t gi�t!")
	end
end

if( result == 1 and GetMissionV(MS_STATE) == 1 ) then
	if( camp == 1 ) then
		Msg2Player("Hoan ngh�nh hi�p kh�ch gia nh�p T�ng qu�n. Hi�n Li�u binh ch�a xu�t hi�n, t��ng s� h�y t�m ngh� ng�i. ��i hi�u l�nh c�ng x�ng l�n gi�t gi�t!")
	else
		Msg2Player("Hoan ngh�nh hi�p kh�ch gia nh�p Li�u qu�n. Hi�n Li�u binh ch�a xu�t hi�n, t��ng s� h�y t�m ngh� ng�i. ��i hi�u l�nh c�ng x�ng l�n gi�t gi�t!")
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)
if (BT_GetData(PL_CURRANK) > 0) then
	Title_AddTitle(BT_GetData(PL_CURRANK), 0, 399999)
	Title_ActiveTitle(BT_GetData(PL_CURRANK))
end

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().." �� gia nh�p phe T�ng."
	EnterChannel(PlayerIndex, "T�ng"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().." �� gia nh�p phe Li�u."
	EnterChannel(PlayerIndex, "Li�u"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] )
else
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] + 1)
end

NewWorld(sf_mapid, posx, posy);
UseScrollEnable(0);	--��ֹʹ�ûسǷ�
SetLogoutRV(1);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(1);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))
BT_SetData( PL_MAXSERIESKILL, 0 )
--BT_SetData( PL_SERIESKILL, 0 )  --��Ҫ��0,������ս����ʱ�����
--BT_SetData( PL_KILLPLAYER, 0 )  --ͬ��
BT_SetData( PL_TOTALPOINT, 0 )
BT_SetData( PL_LEAVETIME, 0 )

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf();
BT_BroadBattleDesc();
BT_ViewBattleStart();
SetFightState(0)
Msg2MSAll(MISSIONID,str);
SetPKFlag(1, camp)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");

Say( "��i chi�n Nh�n M�n quan: <enter>M�i l�n ��nh b�i m�i ��i ph��ng s� nh�n ���c �i�m chi�n c�ng nh�t ��nh. Cu�i c�ng, c�n c� v�o t�ng chi�n c�ng c�a hai b�n �� ph�n ��nh th�ng b�i. N�u h�a �i�m nhau th� phe n�o c� s� ng��i tham chi�n (bao g�m � h�u doanh) �t h�n 1 ng��i s� b� x� thua. <enter> Hi�n phe T�ng c�n:"..GetMSPlayerCount(MISSIONID, 1).." ng��i; Phe Li�u c�n:"..GetMSPlayerCount(MISSIONID, 2).." ng��i", 0 )

end;
------------------------------------------------------------------

-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--��ÿ��������������¼���˴�����ս��ʤ��״��
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: T�ng Li�u k�t th�c, Log th�ng thua b� l�i!")
		return
	end
	idx = 0
	pidx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	else
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	end
end

-- ��������״̬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	pidx = 0
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
			PlayerIndex = pidx
			if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
			elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
			end
		end
		if (idx == 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local temprevposx = 0
	local temprevposy = 0
	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X1) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y1) * 32
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X2) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y2) * 32
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
			print("but_pop2home  but_pop2home  but_pop2home  but_pop2home")
			SetPos(floor(x/32), floor(y/32))
			SetTempRevPos(SubWorldIdx2ID(SubWorld) , temprevposx, temprevposy);
			SetFightState(1)
			Msg2Player("B�n kh�ng th� ti�p t�c l�u l�i � H�u doanh.")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("B�n c� th� l�u l�i � H�u doanh"..remain_time.." Gi�y ")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end

function sj_getfrontpos( camp )
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area = 0
	if( camp == 1 ) then
		area = BT_GetGameData( GAME_CAMP1AREA )
	else
		area = BT_GetGameData( GAME_CAMP2AREA )
	end
	local area_section = "Area_"..area;
-------------------------------------------------------------------------
--��ȡ��������Ĵ�Ӫ�ڵ�����
	--�Ӵ�Ӫ����Ӫʱ�������
    frontpos = GetIniFileData(mapfile, area_section , "frontpos")
    x,y =bt_str2xydata(frontpos)
    return x, y
end

--ս�۽����У����һ��������������С�������ƣ�������
function wl_search_memcount()
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)
	
	if( group1count >= MIN_PLAYER_COUNT_ING and group2count >= MIN_PLAYER_COUNT_ING ) then
		return
	end
	
	if( group1count > group2count ) then
		SetMissionV(MS_MOSTDEATH, 2)
	elseif( group1count < group2count ) then
		SetMissionV(MS_MOSTDEATH, 3)
	end
	return 1
end

function sl_clearbattledata()	--����ս�����������ս����Ϣ
	for i = 1, 14 do
		BT_SetGameData( i, 0 )
	end
end