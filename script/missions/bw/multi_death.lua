Include("\\script\\missions\\bw\\bwhead.lua");

function OnDeath(Launcher)

local nTopMurderIndex = 0;
local news_str = "";
local nMurderName = "";
local nDecedentName = GetName();
local nMurderIndex = NpcIdx2PIdx(Launcher);
local nDecedentIndex = PlayerIndex;
 
 	PlayerIndex = nMurderIndex;
	nMurderName = GetName();
	SetTaskTemp(TOTAL_KILL_NUM,GetTaskTemp(TOTAL_KILL_NUM)+1);
	if GetMissionV(GAME_TYPE) == 2 then
		Earn(10000);
		news_str = nMurderName.."  �� gi�t  "..nDecedentName..", nh�n ���c 1 ti�n v�ng. Hi�n �� ��nh b�i"..GetTaskTemp(TOTAL_KILL_NUM).." ng��i.";
	else
		news_str = nMurderName.."  �� gi�t  "..nDecedentName..". Hi�n �� ��nh b�i"..GetTaskTemp(TOTAL_KILL_NUM).." ng��i.";
	end
	PlayerIndex = nDecedentIndex;
	--������������
	if GetMissionV(GAME_TYPE) == 1 then
		PayAward(1);
	end
	Msg2MSAll(MULIT_MISSION_ID,news_str);
	ShowTopKillNumPlayer() -- ��PK��Ӫ1��ʶ��ǰɱ�˶Զ�����
	DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	SetMissionV(DECEDEND_NUM,GetMissionV(DECEDEND_NUM)+1);
	
	return 1
	
end
