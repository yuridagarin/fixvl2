--File name:	wulinteshi_npc.lua
--Describe:		��һ��npc�ļ�
--Create Date:	2008-07-17
--Author:		chenbenqian

Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");
--==========================����������������=============================

g_InfoHeader = "<color=green>V� L�m ��c S�<color>: "

tEnterPosTable =
{
	[1] = {969,1633,3263},
	[2] = {969,1610,3238},
	[3] = {969,1641,3236},
	[4] = {969,1581,3220},
	[5] = {969,1628,3176},
	[6] = {969,1578,3146},
	[7] = {969,1679,3115},
	[8] = {969,1641,3048},
	[9] = {969,1536,3039},
	[10] = {969,1565,2953},
	[11] = {969,1600,3004},
	[12] = {969,1604,3054},
}

--==============================���߼�����===============================
function main()
	if is_first_tong_jpz_open() == 0 then
		Say(g_InfoHeader.."H�m nay kh�ng c� ho�t ��ng bang h�i tinh anh, ��i h�m kh�c h�ng ��n nh�.",0)
		return
	end

	local selTab = {
				"Ta mu�n tham gia ho�t ��ng bang h�i tinh anh/join_huashan",
				"Ta ch� ��n xem th�/nothing"
				}
	Say(g_InfoHeader.."Ho�t ��ng bang h�i �� b�t ��u, thi�u hi�p mu�n xem t�nh h�nh.",getn(selTab),selTab)

end

--�μӵ�һ��
function join_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_InfoHeader.."V� m�n ph�i kh�ng th� tham gia ho�t ��ng bang h�i tinh anh!")
		return
	end
	
	local time_distance = START_TIME - Zgc_pub_today_sec_num_rtn()
	if time_distance > 0 then
		Talk(1,"",g_InfoHeader.."Ho�t ��ng bang h�i tinh anh v�n ch�a b�t ��u, xin m�i ��i! "..Zgc_pub_time_sec_change(time_distance,0).." _c� th� v�o!")
		return
	end
	
	local OldWorld = SubWorld
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID)
	if SubWorld >= 0 then
		if GetMissionV(MV_MISSION_STATE) == 0 then
			Talk(1,"",g_InfoHeader.."Ho�t ��ng bang h�i tinh anh ch�a b�t ��u, xin m�i ��i th�m ch�t n�a!")
		elseif GetMissionV(MV_MISSION_STATE) == 1 or GetMissionV(MV_MISSION_STATE) == 2 then
--			if GetMissionV(MV_TEAM_NUM) < MAX_TEAM_NUM then
				if check_enter() == 1 then
					goto_huashan()
				end
--			else
--				Talk(1,"",g_InfoHeader.."�������µ�һ�������������Ѵ� "..MAX_TEAM_NUM.."��δ�ܲμӱ������µ�һ���������ȴ��´λ�Ŀ�ʼ��")
--			end
--		elseif GetMissionV(MV_MISSION_STATE) == 2 then
--			Talk(1,"",g_InfoHeader.."���µ�һ����ֹͣ������δ�ܲμӱ��λ�������ȴ��´λ�Ŀ�ʼ��")
		elseif GetMissionV(MV_MISSION_STATE) == 3 then
			Talk(1,"",g_InfoHeader.."Ho�t ��ng bang h�i tinh anh �� k�t th�c, nh�ng ng��i ch�a tham gia ���c l�n n�y xin m�i ��i l�n ho�t ��ng t�i.")
		else
			WriteLog(g_LogTitle.."[Error]: the state of MISSION is error, the error value is : "..GetMissionV(MV_MISSION_STATE) )
		end
	else
		WriteLog(g_LogTitle.."[Error]: In wulinteshi_npc.lua, the value of SubWorld is error, the error value is : "..SubWorld)
	end
	SubWorld = OldWorld
end

--���͵���ɽ
function goto_huashan()
	local nRandom = random(1, getn(tEnterPosTable))
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			CleanInteractive()

			if NewWorld(tEnterPosTable[nRandom][1],tEnterPosTable[nRandom][2],tEnterPosTable[nRandom][3]) ~= 1 then
				Msg2Player("Chuy�n ��a �i�m th�t b�i, ��i hi�p kh�ng th� ti�n v�o b�n �� Hoa S�n")
				LeaveTeam()
				WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Sending failed, time : "..date("%Y%m%d%H%M"))
			end
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		AddMSPlayer(MISSION_ID,0)
		JoinMission(MISSION_ID,0)
--		Msg2Player("You have switched to the pk and die-without-fine condition!")
	end
	PlayerIndex = nOldPlayer

	SetMissionV(MV_TEAM_NUM, (GetMissionV(MV_TEAM_NUM)+1) )
	Msg2MSAll(MISSION_ID, GetName().." d�n d�t (g�m c� "..GetTeamSize().."  ng��i) �� v�o Hoa S�n, hi�n t�i � Hoa S�n c� s� t� ��i  "..GetMissionV(MV_TEAM_NUM))
end

-- ������������ж�
function check_enter()
	local szItemName = "V� L�m L�nh B�i"
	local nSize = GetTeamSize()
	local nMapID = GetWorldPos()
	local szTongName = GetTongName()

	if is_team_captain() ~= 1 or is_tong_captain() ~= 1 then
		Talk(1,"",g_InfoHeader.."B�t bu�c ph�i bang ch� t� ��i m�i c� th� ti�n v�o ���c")
		return 0
	end
	if nSize < 2 then
		Talk(1,"",g_InfoHeader.."S� ng��i trong t� ��i ph�i l�n ho�c b�ng 2 ng��i")
		return 0
	end

	local OldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			if GetTongName() ~= szTongName then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong t� ��i c� ng��i kh�c bang h�i, kh�ng th� tham gia ho�t ��ng bang h�i tinh anh!")
				return 0
			end		
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."V� m�n ph�i kh�ng th� tham gia ho�t ��ng bang h�i tinh anh!")
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong t� ��i v�n c� ng��i �ang b�n h�ng, kh�ng th� tham gia ho�t ��ng bang h�i tinh anh!")
				return 0
			end
			if GetWorldPos() ~= nMapID then
				PlayerIndex = OldPlayer
		    	Talk(1,"",g_InfoHeader.."T�t c� th�nh vi�n b�t bu�c ph�i trong c�ng 1 b�n ��")
				msg_2_team("T�t c� th�nh vi�n b�t bu�c ph�i trong c�ng 1 b�n ��")
				return 0
			end
		end
	end
	PlayerIndex = OldPlayer

	--�������ƴ��ڼ��
	if GetItemCount(2,1,29000) == 0 then
		Talk(1,"","Xin x�c nh�n tr�n ng��i c� mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	--�������ƿ۳��ɹ����
	if DelItem(2,1,29000,1) == 0  then
		Talk(1,"","Xin x�c nh�n tr�n ng��i c� mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	
	return 1
end
