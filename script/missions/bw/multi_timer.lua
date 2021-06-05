Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(MULTIMAP_STATE);
	nTimeState = GetMissionV(MULTIMAP_NEWS_STATE) + 1;
	SetMissionV(MULTIMAP_NEWS_STATE,nTimeState);

	--׼���׶�
	if nMapState == 1 then 
		ReportReadyState(nTimeState);
	--������
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--��������
	elseif nMapState == 3 then 
		Msg2MSAll(MULIT_MISSION_ID, "Thi ��u k�t th�c!");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	end;
end;

--׼���׶���Ϣ����
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};

	if nReadyState == 1 then
		nReadyState = 0;
		SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--ɾȥ�˳�Npc			 
		SetMissionV(MULTIMAP_STATE,3);
		CloseMission(MULIT_MISSION_ID);
		return
	end

	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	--׼��ʱ�䵽��3�����Ժ��жϳ��ڵ�ǰ���
	if nTimeState >= READY_TIME then 
		
		--������ʼʱ���������ٵ���1��
		if nTotalFighterNum <= 1 then
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
				if nPlayerIndex > 0 then					
					PlayerIndex = nPlayerIndex
					Say("V� s� ng��i trong tr�n ��a �t h�n <color=yellow>2 ng��i<color> n�n h�y b� thi ��u! Vui l�ng ��i gi�y l�t! H� th�ng s� t� ��ng chuy�n ��u th� ra kh�i chi�n tr��ng!",0);
				end
			end
			PlayerIndex = OldPlayer
			news_str = "S� ng��i trong chi�n ��a kh�ng ��, thi ��u b� h�y b�!";
			Msg2MSAll(MULIT_MISSION_ID,news_str);
			nReadyState = 1;
			return
		end
		
		--������ʼ����
		
		OldPlayer = PlayerIndex
		
		for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do	
			PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,0);
			if nPlayerIndex > 0 then
				tinsert(PlayerIndexTab,nPlayerIndex);
			end
		end
		
		if nTotalFighterNum ~= getn(PlayerIndexTab) then
			WriteLog("[Qu�n h�ng chi�n]Khi thi ��u b�t ��u, nh�n PlayerIndex kh�ng ph� h�p v�i s� l��ng tr�n h�nh!");
		end
		
		for i=1,getn(PlayerIndexTab) do
			PlayerIndex = PlayerIndexTab[i]
			Talk(1,"","Thi ��u ch�nh th�c b�t ��u, s� ng��i trong tr�n hi�n l� <color=yellow>"..nTotalFighterNum.."<color> ng��i!")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ��u ch�nh th�c b�t ��u!";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--������δ��ʼǰ����Ϣ����
	
	nMin = floor((READY_TIME - nTimeState) / 3);
	nSec = mod((READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:"..nMin.." ph�t, s� ng��i trong tr�n hi�n l� "..nTotalFighterNum.." ng��i!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	elseif (nMin == 0) then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:" ..nSec.. " gi�y, s� ng��i trong tr�n hi�n l�"..nTotalFighterNum.." ng��i!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
	end
	
end


--��ս�׶�ս������
function ReportBattleState(nTimeState)

local news_str = "";
local nMSPlayerIndex = 0;
local nPlayerIndexTab = {};
local i=0;
local nMin = 0; 
local nSec = 0;
local nPlayerIndex = 0;
local nPlayerName = "";
local nKillNum = 0;
local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
	
	--��ǰ����ֻʣ��һ��ѡ��
	if nTotalFigtherNum <= 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if	nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				--Say("��ϲ���Ϊ������̨������ʤ�ߣ��㱾��ս��Ϊ���ɹ�ɱ��"..nKillNum.."�ˣ��Ժ󽫻���㴫�ͳ������������ĵȴ���")
				PlayerIndex = OldPlayer;
			end
			
			--�������н�ɫ���ͱ���������������ڣ�
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng thi ��u tr�n n�y l� <color=yellow>"..nPlayerName.."<color>, t�ng s� ng��i ��nh b�i l�:"..nKillNum.."  ng��i. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer; 	
			nDelayState = nDelayState + 1;
			news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng l�"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			return
		end
		--��ʱ�˳�
		if nDelayState == 1 then
			nDelayState = 0;
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
	end
	
	--ս������
 	if nTimeState >= GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--���ɱ����Ŀ�ɴ�С�����list
				
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i]
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng tr�n n�y l�"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i."
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i; "
				end
			end
			
			--�������н�ɫ���ͱ���������������ڣ�
			nMSPlayerIndex = 0
			OldPlayer = PlayerIndex
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng l�:"..nPlayerName
			Msg2MSAll(MULIT_MISSION_ID, news_str);

 			return
 		end
 		
 		--�ӳ��˳�
 		if nDelayState == 1 then
 			nDelayState = 0; 
 			SetMissionV(MULTIMAP_STATE,3);
 			CloseMission(MULIT_MISSION_ID);
 			return
 		end
 		
 	end
 	
	nMin = floor((GAME_TIME - nTimeState) / 3);
	nSec = mod((GAME_TIME - nTimeState),3) * 20;
	
	if (nMin == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "Giai �o�n chi�n ��u: Thi ��u �ang ti�n h�nh, trong tr�n hi�n c�"..nTotalFigtherNum.." ��u th�, th�i gian thi ��u c�n"..nSec.." gi�y.");
	elseif (nSec == 0) then
		Msg2MSAll(MULIT_MISSION_ID, "Giai �o�n chi�n ��u: Thi ��u �ang ti�n h�nh, trong tr�n hi�n c�"..nTotalFigtherNum.." ��u th�, th�i gian thi ��u c�n"..nMin.." ph�t.");
	--else
		--Msg2MSAll(MULIT_MISSION_ID, "ս���׶Σ����������У�����������"..nTotalFigtherNum.."����ɫ���������������"..nMin.."��"..nSec.."�롣");
	end;
	
end;
