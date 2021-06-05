Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

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
		Msg2MSAll(MULIT_MISSION_ID, "Chi�n ��u k�t th�c!");
		StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);		
	end;
end;

--׼���׶���Ϣ����
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0
local nTotalFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP)
local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)
local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};

	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	--׼��ʱ�䵽��15�����Ժ��жϳ��ڵ�ǰ���
	if nTimeState >= HUNDRED_READY_TIME then 
	
		--������ʼʱ���������ٵ���1��
		if nTotalFighterNum <= 1 then
				--�����볡�Ѹ����
			if GetMissionV(GAME_TYPE) == 2 then
				PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,0,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					OldPlayer = PlayerIndex
					PlayerIndex = nPlayerIndex
					Earn(20000);
					Say("V� s� ng��i tham gia Qu�n h�ng chi�n l�n n�y kh�ng �� 2 ng��i, kh�ng th� t� ch�c ���c! Nay tr� l�i cho ng��i <color=yellow>2 ti�n v�ng<color> ph� v�o tr�n!",0);
					PlayerIndex = OldPlayer
				end
			end
			news_str = "S� ng��i tham chi�n kh�ng ��, h�y b� thi ��u!";
			Msg2MSAll(MULIT_MISSION_ID,news_str);	
			--�����漰�볡����˲�����ʱ�������������ʱ�׶ν�����ʹ��ȡ�볡�Ѳ����˻�				
			SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--ɾȥ�˳�Npc			 
			SetMissionV(MULTIMAP_STATE,3);
			CloseMission(MULIT_MISSION_ID);
			return
		end
		
		--������ʼ����
		
		OldPlayer = PlayerIndex
		
		for i=1,nTotalNum do	
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
			Talk(1,"","Qu�n h�ng chi�n �ang ch�nh th�c b�t ��u, trong tr�n hi�n l� <color=yellow>"..nTotalFighterNum.."<color> ng��i!")
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ��u Qu�n h�ng chi�n ch�nh th�c b�t ��u!";
		Msg2MSAll(MULIT_MISSION_ID,news_str);             
		RunMission(MULIT_MISSION_ID);
		return
	end
	
	--������Ϣ����
	
	nMin = floor((HUNDRED_READY_TIME - nTimeState) / 3);
	nReportTime = mod(floor((HUNDRED_READY_TIME - nTimeState) / 3),3);
	nSec = mod((HUNDRED_READY_TIME - nTimeState),3) * 20;
	
	--ÿ��������һ����Ϣ
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:"..nMin.." ph�t, s� ng��i trong tr�n hi�n l� "..nTotalFighterNum.." ng��i!";
		Msg2MSAll(MULIT_MISSION_ID, news_str);
		Msg2SubWorld("��i Ch� C��ng thay m�t ch� nh�n t� ch�c Qu�n h�ng chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh! Th�i gian chu�n b� c�n"..nMin.." ph�t, s� ng��i tham chi�n hi�n l� "..nTotalFighterNum.." ng��i.");
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
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerIndex = 0;
local nWinState = 0;
local nPlayerName = "";
local nKillNum = 0;
local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nBonus = 0;
local Bonus_str = "";
	
	--ֻʣ��һ��ѡ��
	if nTotalFigtherNum == 1 then
		if nDelayState == 0 then
			nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
			if nPlayerIndex > 0 then
				OldPlayer = PlayerIndex;
				PlayerIndex = nPlayerIndex;
				nPlayerName = GetName();
				nKillNum = GetTaskTemp(TOTAL_KILL_NUM);
				if GetMissionV(GAME_TYPE) == 1 then
					PayAward(2);
				end
				if GetMissionV(GAME_TYPE) == 2 then
					nBonus = floor(GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)
					Bonus_str = TurnMoneyFormat(nBonus);
				--Say("<color=green>��־ǿ<color>�����Ѿ�ʤ���ó�����Ӣ�۴��ޱ��������չ��򽫻��"..Bonus_str.."��Ϊ������",0);
					Earn(nBonus);
				end
				WriteLog("[Qu�n h�ng chi�n] Ng��i ch�i "..GetName().." Th�ng tr�n"..GetMissionV(START_TIME).."nh�n ���c ph�n th��ng:"..nBonus.." T�ng ph� v�o tr�n l�:"..GetMissionV(MULTIMAP_BONUS).." T�i kho�n: "..GetAccount());
				PlayerIndex = OldPlayer;
			end
			
			--�������н�ɫ���ͱ���������������ڣ�
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(GAME_TYPE) == 2 then 
						news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng thi ��u tr�n n�y l� <color=yellow>"..nPlayerName.."<color>, t�ng s� ng��i ��nh b�i l�:"..nKillNum.."  ng��i, theo l� s� nh�n ���c ph�n th��ng"..Bonus_str.."! Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
					else
						news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng thi ��u tr�n n�y l� <color=yellow>"..nPlayerName.."<color>, t�ng s� ng��i ��nh b�i l�:"..nKillNum.."  ng��i. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
					end
					Talk(1,"",news_str);
				end
			end
			PlayerIndex = OldPlayer ;
			nDelayState = 1;
			news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng l�"..nPlayerName;
			Msg2MSAll(MULIT_MISSION_ID, news_str);
			Msg2SubWorld(nPlayerName.."Tr��c khi gi� ��u k�t th�c, ai ��nh b�i ��i ph��ng s� gi�nh th�ng l�i!");
			AddGlobalNews(nPlayerName.."Tr��c khi gi� ��u k�t th�c, ai ��nh b�i ��i ph��ng s� gi�nh th�ng l�i!");
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
 	if nTimeState >= HUNDRED_GAME_TIME then
 		
 		if nDelayState == 0 then
			
			WinnerTab = GetMurderIndexTab(nTotalFigtherNum);--���ɱ����Ŀ�ɴ�С�����list
			
			if GetMissionV(GAME_TYPE) == 2 then
				nBonus = floor((GetMissionV(MULTIMAP_BONUS)*BONUS_RATE)/getn(WinnerTab[1]));
				Bonus_str = TurnMoneyFormat(nBonus);
			end
			
			for i=1,getn(WinnerTab[1]) do
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 2 then
					Earn(nBonus);
				end
				if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 1 then
					PayAward(2)
				end
				tinsert(Winner_info,GetName());
				tinsert(Winner_info,GetTaskTemp(TOTAL_KILL_NUM));
				tinsert(Winner_News,Winner_info);
				WriteLog("[Qu�n h�ng chi�n] Ng��i ch�i "..GetName().." Th�ng tr�n"..GetMissionV(START_TIME).."nh�n ���c ph�n th��ng:"..nBonus.." T�ng ph� v�o tr�n l�:"..GetMissionV(MULTIMAP_BONUS).." T�i kho�n: "..GetAccount());
				PlayerIndex = OldPlayer
				Winner_info = {}
			end
			
			--��ʧ���߷���
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP) do	
				nMSPlayerIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nMSPlayerIndex,MULIT_FIGTHER_CAMP);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					if GetMissionV(DECEDEND_NUM) == 0 then
						PayAward(1);
					else 
						for j=1,getn(WinnerTab[1]) do	
							if PlayerIndex == WinnerTab[1][j] then
								nWinState = 1;
								break;
							end
						end
						if nWinState ~= 1 then
							PayAward(1);
						end
						nWinState = 0;
					end
				end
			end
			PlayerIndex = OldPlayer;
	
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ��u tr�n n�y kh�ng c� ng��i th��ng vong, tr�n ��u ���c x� h�a! Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!"
			else
				news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng tr�n n�y l�"
				for i=1,getn(Winner_News) do
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ��nh b�i: <color=yellow>"..Winner_News[i][2].." <color> ng��i."
						if GetMissionV(GAME_TYPE) == 2 then
							news_str = news_str.."Theo quy t�c s� nh�n ���c ph�n th��ng"..Bonus_str.."!";
						end
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."<color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i; "
					end
				end
			end
			
			--�������н�ɫ���ͱ���������������ڣ�
			nMSPlayerIndex = 0;
			OldPlayer = PlayerIndex;
			for i=1,GetMSPlayerCount(MULIT_MISSION_ID,0) do
				nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
				if nPlayerIndex > 0 then
					PlayerIndex = nPlayerIndex;
					SetFightState(0);
					RemvoeTempEffect();
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			nDelayState = nDelayState + 1;
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ��u k�t th�c, tr�n n�y x� h�a.";
			else
				news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng l�:"..nPlayerName;
			end
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
 	
	nMin = floor((HUNDRED_GAME_TIME - nTimeState) / 3);
	nSec = mod((HUNDRED_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai �o�n chi�n ��u: Thi ��u �ang ti�n h�nh, trong tr�n hi�n c�"..nTotalFigtherNum.." ��u th�, th�i gian thi ��u c�n"..nSec.." gi�y.");
	elseif nSec == 0 then
		Msg2MSAll(MULIT_MISSION_ID, "Giai �o�n chi�n ��u: Thi ��u �ang ti�n h�nh, trong tr�n hi�n c�"..nTotalFigtherNum.." ��u th�, th�i gian thi ��u c�n"..nMin.." ph�t.");
	end
	
end;
