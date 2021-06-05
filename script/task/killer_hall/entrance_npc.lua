--date:2007-3-7
--author:yanjun
--describe:this npc help player enter the killer hall
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\lib\\writelog.lua")

g_InfoHeader = "<color=green>S� gi� S�t Th� ���ng<color>: ";
function main()
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAP_ID then
		dialog_exit();
	else	
		--Talk(1,"","T�nh n�ng S�t Th� ���ng �ang t�m ��ng, ��i hi�p h�y quay l�i sau !!!")
		dialog_enter();
	end;
end;

function dialog_enter()
	local selTab = {
				"Ta lo m�i vi�c b�n ngo�i/single_man_enter",
				"Ngay c� b�n ta c�n ch�a nh�n ra/team_enter",
				"Ta ti�n gh� qua th�i/nothing",
				}
	local nTeamSize = GetTeamSize()
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	if nInMapMemberCount >= 1 or nTeamSize <= 1 then	--����ж�����ɱ�����������û����ӻ��������ֻ���Լ�һ����
		tremove(selTab,2);
	else
		tremove(selTab,1);
	end;
	Say(g_InfoHeader.."Ng��i l� ai?",getn(selTab),selTab);
end;

function dialog_exit()
	local selTab = {
				"m� ���ng m�u, r�i kh�i S�t Th� ���ng/go_out",
				"Kh�ng �i ��u/nothing",
				}
	Say(g_InfoHeader.."Th� ra l� gi� m�o �? Ng��i ��u? B�t l�i cho ta!",getn(selTab),selTab);
end;

function go_out()
	local nRand = random(1,getn(tExitPos));
	NewWorld(tExitPos[nRand][1],tExitPos[nRand][2],tExitPos[nRand][3]);
end;

function get_pos_idx()
	local nPosIdx = 0;
	if random(1,100) <= 30 then	--%30���ʴ����ſ�
		nPosIdx = random(1,3);
	else
		nPosIdx = random(4,getn(tEntrancePos));	--70%���ʴ�����������
	end;
	return nPosIdx;
end;

function single_man_enter()
	CleanInteractive();
	if check_mission_state() == 1 then
		local nPlayerState = check_player_state();
		local nPosIdx = get_pos_idx();
		if nPlayerState == 1 then
			local nDate = tonumber(date("%y%m%d"));
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
				gf_AddItemEx({2, 1, 30118, 150}, "Hoa C�c");
				WriteLogEx("Hoat dong thang 11","S�t Th� ���ng",150,"Hoa C�c");		
			end
			if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
				Give1stTimeExp()
			end		
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				WriteLogEx("Hoat Dong Thang 10","tham gia S�t Th� ���ng")
			end;
		elseif nPlayerState == 2 then
			Talk(1,"","��i hi�p v� c�ng qu� y�u n�n kh�ng th� tham gia v��t �i!!!")
		elseif nPlayerState == 3 then
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
			end;
--		elseif nPlayerState == 0 then
--			Talk(2,"",g_InfoHeader.."Ng��i l� ai? Sao l�i d�m x�ng v�o ��y?","�� b� ph�t hi�n, kh�ng c� m�t n� c�a S�t Th� ���ng xem nh� kh�ng th�nh r�i.");		
		elseif nPlayerState == 4 then
			Talk(1,"","��i hi�p kh�ng mang �� ti�n �� tham gia v��t �i!!!")
		elseif nPlayerState == 5 then
			Talk(1,"","��i hi�p kh�ng �� c�p �� tham gia v��t �i!!!")
		end;
	end;
end;
--���֮ǰû��ȥ����û��ɱ��������򷵻�0
--���֮ǰû��ȥ������ɱ������ߴͷ���1
--����书�ȼ������򷵻�2
--���֮ǰ��ȥ���򷵻�3
function check_player_state()
	if GetLevel() < 59 then 
		return 5
	end
	-- if KH_Check_Skill_Level() ~= 1 then
		-- return 2;	--�书�ȼ�����
	-- end;
	if GetCash() < 80000 then
		return 4
		--Talk(1,"","��i hi�p kh�ng mang �� ti�n �� tham gia v��t �i!!!")
	end
	if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--���֮ǰû��ȥ��
		local nDate = tonumber(date("%y%m%d"));
		if  nDate < 101022 then
			if GetItemCount(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4]) <= 0 then
				return 0;	--��ʾû��ɱ�������
			end;
		end
		SetTask(KH_TASK_OPEN_BOX_TIME,0);	--�����Ӵ�����0
	else
		return 3;	--�������������֮ǰ��ȥ����
	end;
	return 1;	--�����������������ߣ�
end;

function team_enter()
	CleanInteractive();
	if GetTeamSize() <= 1 then
		Talk(1,"",g_InfoHeader.."C� m�t m�nh ng��i m� c�ng d�m g�i l� Nh�m Thi�n S�t �?");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--������Ƕӳ�
		Talk(1,"",g_InfoHeader.."G�i ��i tr��ng c�a ng��i ��n g�p ta.");
		return 0;
	end;
	if check_mission_state() == 1 then
		if check_team_state() == 1 then
			transmit_team();
		else
			Talk(2,"",g_InfoHeader.."Ng��i l� ai? Sao l�i d�m x�ng v�o ��y?","�� b� ph�t hi�n, kh�ng c� m�t n� c�a S�t Th� ���ng xem nh� kh�ng th�nh r�i.");
		end;
	end;
end;

function check_mission_state()
	if SETTING_DYNAMIC_MISSION == 0 then
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			Talk(1,"",g_InfoHeader.."T�m th�i kh�ng cho ai v�o S�t Th� ���ng, k� c� �� t� c�a b�n ���ng!");
			return 0;
		end;
	else
		if mf_OpenDynamicMission(MISSION_ID,MAP_ID) == 0 then
			Talk(1,"",g_InfoHeader.."T�m th�i kh�ng cho ai v�o S�t Th� ���ng, k� c� �� t� c�a b�n ���ng!");
			return 0
		end;
	end;
	if mf_GetPlayerCount(MISSION_ID,0,MAP_ID) >= MAX_PLAYER then
		Talk(1,"",g_InfoHeader.."B�n trong S�t Th� ���ng �� qu� ��ng ng��i, ng��i ��ng ngo�i ��i m�t l�t nh�!");
		return 0;
	end;
	return 1;
end;

function check_team_state()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	local nPlayerState = 0;
	local bCheckFail = 0;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		nPlayerState = check_player_state();
--		if nPlayerState == 0 then
--			gf_Msg2Team(GetName().."Kh�ng c� m�t n� S�t Th� ���ng",1)
--			bCheckFail = 1;
		if nPlayerState == 2 then
			Talk(1, "", GetName().." V� c�ng qu� y�u");			
			gf_Msg2Team(GetName().." V� c�ng qu� y�u",1);
			bCheckFail = 1;
		elseif nPlayerState == 4 then
			Talk(1, "", GetName().." kh�ng c� �� ti�n �� tham gia")	
			gf_Msg2Team(GetName().." kh�ng c� �� ti�n �� tham gia",1);
			bCheckFail = 1;
		elseif nPlayerState == 5 then
			Talk(1, "", GetName().." kh�ng �� c�p �� tham gi")	
			gf_Msg2Team(GetName().." kh�ng �� c�p �� tham gia",1);
			bCheckFail = 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	if bCheckFail == 1 then
		return 0;
	end;
	return 1;
end;

function transmit_team()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	local nPosIdx = get_pos_idx();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		CleanInteractive();
		if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--֮ǰû��ȥ��\
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
				gf_AddItemEx({2, 1, 30118, 150}, "Hoa C�c");
				WriteLogEx("Hoat dong thang 11","S�t Th� ���ng",150,"Hoa C�c");		
			end
			if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
				Give1stTimeExp()
			end
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				WriteLogEx("Hoat Dong Thang 10","tham gia S�t Th� ���ng")
			else
				LeaveTeam();
			end;
		else
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
			else
				LeaveTeam();
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function Give1stTimeExp()
	local nRand = random(1,100)
	if nRand <= 50 then
		gf_EventGiveCustomAward(1, 500000, 1)
	elseif nRand <= 70 then
		gf_EventGiveCustomAward(1, 1000000, 1)
	elseif nRand <= 90 then
		gf_EventGiveCustomAward(1, 1500000, 1)
	elseif nRand <= 95 then
		gf_EventGiveCustomAward(1, 2000000, 1)
	elseif nRand <= 99 then
		gf_EventGiveCustomAward(1, 3000000, 1)
	else
		gf_EventGiveCustomAward(1, 4000000, 1)
	end
end

function nothing()
end;