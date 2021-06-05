Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")
Include("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua")

KF_NPC_NAME = "<color=green>Chi�n tr��ng li�n ��u ti�p d�n s�: <color>"

function main()
	if IsKfNewBattleOpen() ~= 0 then
		main_kf_newbattle(); --�����˿����̨ս
		return 0;
	end
	local tSay = {};
	local nJoinTimes = KF_GetJoinTimes();
	tSay.msg = KF_NPC_NAME..format("��i hi�p mu�n tham gia chi�n tr��ng li�n server kh�ng? Trong chi�n tr��ng li�n server, b�n c� th� chi�n ��u m�t c�ch s�ng kho�i v�i h�o ki�t c�a to�n v� l�m, ki�n c�ng l�p nghi�p v� nh�n ���c ph�n th��ng qu� hi�m. Hi�n t�i ch� m� cho nh�n v�t chuy�n sinh %d c�p %d tr� l�n, �� gia nh�p l�u ph�i v� �� h�c t�t c� k� n�ng c�p %d, ��ng th�i m�i ng��i ch� c� th� tham gia %d l�n/ng�y. ��i hi�p h�m nay �� tham gia <color=green>%d<color> l�n.", 5, 96, 55, KF_JOIN_TIMES_MAX, nJoinTimes);
	if GetNpcName(GetTargetNpc()) == "Ng��i B�o Danh Li�n ��u" then
		local nTimes = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		tSay.msg = tSay.msg..format("\n<color=red> Chi�n Tr��ng Li�n Server l�n n�y �� m� %d tr�n <color>", nTimes);
	end
	tSay.sel = {
			{format("B�o danh c� nh�n (ti�u hao %d v�ng)", KF_ENTRY_FEE), "jyr_single_join"},
			{format("T� ��i b�o danh (nhi�u nh�t 3 ng��i, ti�u hao %d v�ng)", KF_ENTRY_FEE * min(gf_GetTeamSize(),3)), "jyr_team_join"},
		};
	tinsert(tSay.sel,	{"\n r�t lui", "nothing"});	
	temp_Talk(tSay);
end

function jyr_main_lingjiang()
	local tSay = {};
	local nJoinTimes = KF_GetJoinTimes();
	tSay.msg = KF_NPC_NAME..format("��i hi�p mu�n tham gia chi�n tr��ng li�n server kh�ng? Trong chi�n tr��ng li�n server, b�n c� th� chi�n ��u m�t c�ch s�ng kho�i v�i h�o ki�t c�a to�n v� l�m, ki�n c�ng l�p nghi�p v� nh�n ���c ph�n th��ng qu� hi�m. Hi�n t�i ch� m� cho nh�n v�t chuy�n sinh %d c�p %d tr� l�n, �� gia nh�p l�u ph�i v� �� h�c t�t c� k� n�ng c�p %d, ��ng th�i m�i ng��i ch� c� th� tham gia %d l�n/ng�y. ��i hi�p h�m nay �� tham gia <color=green>%d<color> l�n.", 5, 96, 55, KF_JOIN_TIMES_MAX, nJoinTimes);
	tSay.sel = {
			{"Nh�n ph�n th��ng l�n tr��c", "jyr_get_last_award"},
			{"C�a h�ng hu�n ch��ng", "jyr_medal_shop"},
			{"Th�ng tin chi�n tr��ng li�n ��u", "jyr_battle_introduce"},	
		};
	tinsert(tSay.sel,	{"\n r�t lui", "nothing"});	
	temp_Talk(tSay);
end

function jyr_single_join()
	--ʱ������
	local nTime = tonumber(date("%H%M"));
	if (not ((1630 <= nTime and nTime < 1730) or (2130 <= nTime and nTime < 2230))) then
		Talk(1,"",KF_NPC_NAME..format("Chi�n tr��ng li�n server ch�a m�, ��i hi�p h�y b�o danh v�o l�c %s ho�c %s �� tham gia.", "16:30", "21:30"));
		return 0;
	end
	--�Ѿ��ж�����
	if GetTeamSize() ~= 0 then
		Talk(1,"",KF_NPC_NAME.."C�c h� �� c� ��i ng� kh�ng th� b�o danh c� nh�n");
		return 0;
	end
	--����1
	if gf_CheckBaseCondition(80) == 0 then
		return 0;
	end
	--����2
	if KF_GetBattleRezult() ~= 0 or KF_GetActivity() ~= 0 then
		Talk(1,"",KF_NPC_NAME.."V�n ch�a nh�n ph�n th��ng chi�n tr��ng l�n tr��c, kh�ng th� tham gia.");
		return 0;
	end
	--����3
	if KF_GetJoinTimes() >= KF_JOIN_TIMES_MAX then
		Talk(1,"",KF_NPC_NAME..format("S� l�n tham gia chi�n tr��ng li�n ��u �� v��t qu� %d l�n", KF_JOIN_TIMES_MAX));
		return 0;
	end
	--����4
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	--����4
	if GetCash() < gf_GetTeamSize() * KF_ENTRY_FEE * 10000 then
		Talk(1,"",format("Ng�n l��ng kh�ng �� %d v�ng", KF_ENTRY_FEE));
		return 0;
	end
	--����MISSION
	local nCurMapId = KF_GetSuitMap(1);
	local nCityMapId = GetWorldPos();
	if nCurMapId ~= 0 then
		if mf_GetPlayerCount(KF_MISSION_ID, CampOne_ID, nCurMapId) <= mf_GetPlayerCount(KF_MISSION_ID, CampTwo_ID, nCurMapId) then
			mf_JoinMission(KF_MISSION_ID, CampOne_ID, nCurMapId);
		else
			mf_JoinMission(KF_MISSION_ID, CampTwo_ID, nCurMapId);
		end
	else
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		if nMissionCount >= MISSION_COUTN_MAX then
			Talk(1,"",KF_NPC_NAME.."S� ng��i tham gia tr�n c�c ��u tr��ng ��u �� ��y, c�c h� vui l�ng tham gia v�o tr�n chi�n l�n sau.");
			return 0;
		end
		--��һ����ʼ��һ������
		local nLastMapID = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID);
		if SubWorldID2Idx(nLastMapID) ~= -1 then
			local nLoadTag = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, nLastMapID);
			local nMissionState = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, nLastMapID);
			if nLoadTag == 1 then --��һ���ѿ���
				if nMissionState == MS_STATE_PEACE or nMissionState == MS_STATE_READY then --��һ�������Ľ׶λ�û����ս���׶�
					Talk(1,"",KF_NPC_NAME.."B�n �� ��u tr��ng li�n ��u tr��c kh�i ��ng r�i m�i c� th� m� b�n �� chi�n tr��ng ti�p theo!")
					return 0;
				end
			end
		end
		local nMapID, nMapIdx = DynamicLoadMap(KF_MAP_ID);
		if nMapID == 0 and nMapIdx == 0 then
			Talk(1,"","Xu�t hi�n l�i ch�a x�c ��nh, chi�n tr��ng kh�ng th� m�");
			return 0;
		end
		if mf_OpenMission(KF_MISSION_ID, nMapID) == 1 then
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount + 1);
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_LAST_OPEN_MAPID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, 1, nMapID);	
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_ID, nMapID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_INDEX, nMapIdx, nMapID);
			mf_JoinMission(KF_MISSION_ID, CampOne_ID, nMapID);	
			
			_stat_on_misson_open()
		end
	end
	
	_stat_when_join(1)
end

function jyr_team_join()
	--ʱ������
	local nTime = tonumber(date("%H%M"));
	if (not ((1630 <= nTime and nTime < 1730) or (2130 <= nTime and nTime < 2230))) then
		Talk(1,"",KF_NPC_NAME..format("Chi�n tr��ng li�n server ch�a m�, ��i hi�p h�y b�o danh v�o l�c %s ho�c %s �� tham gia.", "16:30", "21:30"));
		return 0;
	end
	--�Ѿ��ж�����
	if GetTeamSize() == 0 then
		Talk(1,"",KF_NPC_NAME.."Hi�n t�i c�c h� ch�a c� ��i ng�, kh�ng th� b�o danh ��i ng� tham gia");
		return 0;
	end
	--���Ƕӳ�
	if GetCaptainName() ~= GetName() then
		Talk(1,"",KF_NPC_NAME.."C�c h� kh�ng ph�i ��i tr��ng kh�ng th� b�o danh ��i ng�");
		return 0;
	end
	--���鳬Ա
	if GetTeamSize() > KF_TEAM_SIZE_MAX then
		Talk(1,"",KF_NPC_NAME..format("��i ng� t� ��i tham gia b�o danh kh�ng ���c v��t qu� %d ng��i", KF_TEAM_SIZE_MAX));
		return 0;
	end
	--����4
	if GetCash() < gf_GetTeamSize() * KF_ENTRY_FEE * 10000 then
		Talk(1,"",format("Ng�n l��ng kh�ng �� %d v�ng", GetTeamSize() * KF_ENTRY_FEE));
		return 0;
	end
	local OldPlayerIndex = PlayerIndex;
	local bFlag = 0;
	local nOldMapID = GetWorldPos();
	local sString = "\nTh�nh vi�n kh�ng trong b�n �� n�y:\n<color=red>";
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nMapIDTemp = GetWorldPos();
		if nMapIDTemp ~= nOldMapID then
			sString = sString..GetName().."   ";
			bFlag = 1;
		end
	end
	PlayerIndex = OldPlayerIndex;
	sString = sString.."<color>";
	if bFlag == 1 then
		Talk(1,"",KF_NPC_NAME..sString);
		return 0;
	end
	local tResult = {
		[1] = {},
		[2] = {},
		[3] = {},	
		[4] = {},
	};
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		--����1
		if gf_CheckBaseCondition(80) == 0 then
			tinsert(tResult[1], GetName());
		end
		--����2
		if KF_GetBattleRezult() ~= 0 or KF_GetActivity() ~= 0 then
			tinsert(tResult[2], GetName());
		end
		--����3
		if KF_GetJoinTimes() >= KF_JOIN_TIMES_MAX then
			tinsert(tResult[3], GetName());
		end
		--����4
		if GetFreeItemRoom() < 1 then
			tinsert(tResult[4], GetName());
		end
	end
	PlayerIndex = OldPlayerIndex;
	local bTag = 0;
	local msg = "\nKh�ng �� c�p gi�i h�n k� n�ng:\n<color=red>"
	for i = 1, getn(tResult[1]) do
		msg = msg..tResult[1][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nCh�a nh�n ph�n th��ng tr�n tr��c g�m: \n<color=red>"
	for i = 1, getn(tResult[2]) do
		msg = msg..tResult[2][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nKh�ng th�a �i�u ki�n s� l�n tham gia: \n<color=red>"
	for i = 1, getn(tResult[3]) do
		msg = msg..tResult[3][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nH�nh trang ��y:\n<color=red>"
	for i = 1, getn(tResult[4]) do
		msg = msg..tResult[4][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>"
	if bTag == 1 then
		Talk(1,"",KF_NPC_NAME..msg);
		return 0;
	end
	--����MISSION
	local nSize = GetTeamSize();
	local nCurMapId = KF_GetSuitMap(nSize);
	local nCityMapId = GetWorldPos();
	if nCurMapId ~= 0 then
		if mf_GetPlayerCount(KF_MISSION_ID, CampOne_ID, nCurMapId) <= mf_GetPlayerCount(KF_MISSION_ID, CampTwo_ID, nCurMapId) then
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampOne_ID, nCurMapId);
			end
			PlayerIndex = OldPlayerIndex;
		else
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampTwo_ID, nCurMapId);
			end
			PlayerIndex = OldPlayerIndex;
		end
	else
		--�������ɶ�����������
		if KF_GetSuitMap(1) ~= 0 then
			Talk(1,"",KF_NPC_NAME.."Chi�n tr��ng kh�ng th� dung n�p s� ng��i trong ��i ng�, xin h�y ��i tr�n ti�p theo.")
			return 0;
		end
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		--��ͼ�����ޣ������Ե��˱���
		--��ʱ��ο�������������
		if nMissionCount >= MISSION_COUTN_MAX then
			Talk(1,"",KF_NPC_NAME.."S� ng��i tham gia tr�n c�c ��u tr��ng ��u �� ��y, c�c h� vui l�ng tham gia v�o tr�n chi�n l�n sau.");
			return 0;
		end
		--��һ����ʼ��һ������
		local nLastMapID = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID);
		if SubWorldID2Idx(nLastMapID) ~= -1 then
			local nLoadTag = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, nLastMapID);
			local nMissionState = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, nLastMapID);
			if nLoadTag == 1 then --��һ���ѿ���
				if nMissionState == MS_STATE_PEACE or nMissionState == MS_STATE_READY then --��һ�������Ľ׶λ�û����ս���׶�
					Talk(1,"",KF_NPC_NAME.."B�n �� ��u tr��ng li�n ��u tr��c kh�i ��ng r�i m�i c� th� m� b�n �� chi�n tr��ng ti�p theo!")
					return 0;
				end
			end
		end
		local nMapID, nMapIdx = DynamicLoadMap(KF_MAP_ID);
		if nMapID == 0 and nMapIdx == 0 then
			Talk(1,"","Xu�t hi�n l�i ch�a x�c ��nh, chi�n tr��ng kh�ng th� m�");
			return 0;
		end
		if mf_OpenMission(KF_MISSION_ID, nMapID) == 1 then
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount + 1);
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_LAST_OPEN_MAPID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, 1, nMapID);	
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_ID, nMapID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_INDEX, nMapIdx, nMapID);
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampOne_ID, nMapID);
			end
			PlayerIndex = OldPlayerIndex;	
			
			_stat_on_misson_open()
		end
	end
	
	_stat_when_join(GetTeamSize() or 2)
end

function jyr_get_last_award()
	local tSay = {};
	local tTempString = {
		[0] = "�� nh�n th��ng ho�c ch�a tham gia chi�n tr��ng",
		[1] = "Tho�t ra",	
		[2] = "�� gi�nh chi�n th�ng",
		[3] = "�� th�t b�i",
		[4] = "B�t ph�n th�ng b�i",
	}
	local tResult = KF_Calculate_Award();
	local nRet = KF_GetBattleRezult();
	local strTemp = format("Chi�n tr��ng l�n tr��c c�a b�n <color=green>%s<color>, �� t�ch c�c l� <color=green>%d<color>#", tTempString[nRet], KF_GetActivity(), tResult[1], tResult[2]);
	tSay.sel = {};
	if nRet > 0 then
		strTemp = strTemp.."S� d�ng qu�n c�ng ch��ng, qu�n c�ng ��i, qu�n c�ng huy ho�ng nh�n th��ng c� th� nh�n ���c ph�n th��ng nhi�u h�n v� �i�m kinh nghi�m, g�i qu� th��ng."
		tinsert(tSay.sel, {"Nh�n th��ng tr�c ti�p", "direct_award"})
		tinsert(tSay.sel, {"Qu�n c�ng ch��ng nh�n th��ng", "jungongzhang_award"})
		tinsert(tSay.sel, {"Qu�n c�ng ��i nh�n th��ng", "dajungongzhang_award"})
		tinsert(tSay.sel, {"Qu�n c�ng huy ho�ng nh�n th��ng", "hhjungongzhang_award"})
		tinsert(tSay.sel, {"Vinh D� Qu�n C�ng Ch��ng nh�n th��ng", "ryjungongzhang_award"})
	end
	tinsert(tSay.sel, {"Quay l�i ", "main"})
	tinsert(tSay.sel, {"Ra kh�i", "nothing"})
	tSay.msg = KF_NPC_NAME..strTemp;
	temp_Talk(tSay);
end

function direct_award()
	KF_GetAward(1);
end

function jungongzhang_award()
	KF_GetAward(2);
end

function dajungongzhang_award()
	KF_GetAward(3);
end

function hhjungongzhang_award()
	KF_GetAward(4);
end

function ryjungongzhang_award()
	KF_GetAward(5);
end

function jyr_battle_introduce()
	local tSay = {};
	local string1 = format("Chi�n tr��ng li�n server m� h�ng ng�y v�o %s, %s gi�, hi�n t�i ch� m� cho nh�n v�t chuy�n sinh %d c�p %d tr� l�n, �� gia nh�p l�u ph�i, h�c t�t c� k� n�ng c�p 55, ��ng th�i m�i ng��i ch� ���c tham gia %d l�n/ng�y.\n", "16:30", "21:30", 5, 96, KF_JOIN_TIMES_MAX);
	local string2 = "Chi�n tr��ng th�ng l�i: mu�n nh�n ���c th�ng l�i c�n ph�i nh�n ���c ��y �� �i�m t�ch l�y chi�n tr��ng. �i�m t�ch l�y chi�n tr��ng n�u b�n n�o ��t ��n s� �i�m gi�i h�n tr��c s� gi�nh th�ng l�i. Gi�i h�n �i�m t�ch l�y th�ng qua nh�n s� khi chi�n tr��ng b�t ��u �� quy�t ��nh, nh�n s� c�ng nhi�u th� chi�n tr��ng c�ng k�ch li�t �i�m t�ch l�y y�u c�u s� c�ng nhi�u. �i�m t�ch l�y chi�n tr��ng c� th� th�ng qua ti�u di�t ng��i ch�i ��i ph��ng, binh l�nh ��i ph��ng, t��ng l�nh, �o�t k� �� nh�n ���c. \n"
	local string3 = "Ph�n th��ng chi�n tr��ng: Mu�n nh�n ���c ph�n th��ng t�t sau khi chi�n ��u, c�n ph�i n� l�c gi�nh ���c th�ng l�i. Ph�n th��ng b�n th�ng s� t�t h�n ph�n th��ng b�n thua. Ngo�i ra trong chi�n tr��ng c� th� th�ng qua vi�c ��nh b�i ng��i ch�i ��i ph��ng, binh l�nh, t��ng l�nh, qu�i, �o�t k� v� nhi�u h�nh th�c �� nh�n ���c �i�m n�ng ��ng. �i�m n�ng ��ng c�ng cao th� s� nh�n ���c m�t s� ph�n th��ng v��t m�c. \n"
	local string4 = "L�i �ch chi�n tr��ng: trong chi�n tr��ng c� r�t nhi�u qu�i v�t trung l�p, ��nh b�i n� th� to�n ��i c� th� nh�n ���c hi�u qu� l�i �ch. Trong chi�n tr��ng c�n c� 2 Boss, ��nh b�i n� kh�ng nh�ng nh�n ���c trang b� t�t, m� c� ��i c�n nh�n ���c hi�u qu� l�i �ch. \n"
	--local string3 = "ÿ���һ�λ�ø߼�����ʱ���ܻ�ö������ʿѫ�¡������е���ʿѫ�£�Ӣ��ѫ�¿����������Ҷһ���£�����װ����\n";
	tSay.msg = KF_NPC_NAME..string1..string2..string3..string4;
	tSay.sel = {
		{"\nQuay l�i", "main"},
		{"Ra kh�i", "nothing"},
	}
	temp_Talk(tSay);
end

function jyr_medal_shop()
	local tSay = {};
	tSay.msg = KF_NPC_NAME.."C�c h� mu�n tham quan c�a h�ng hu�n ch��ng?";
	tSay.sel = {
		{"C�a h�ng Hu�n Ch��ng D�ng S�", "jyr_ys_shop"},
		{"C�a h�ng Hu�n Ch��ng Anh H�ng", "jyr_yx_shop"},
		{"C�a hi�u qu�n ph�c L�i H�", "jyr_junzhuang_shop"},
		{"C�a h�ng trang b� Kim X� 4 sao", "jyr_jinshe_shop"},
		{"\nQuay l�i", "main"},
		{"Ra kh�i", "nothing"},
	}
	temp_Talk(tSay);
end

function jyr_jinshe_shop()
	local szTitle = format("N�u ch�n s� d�ng ph��ng th�c n�ng c�p ng� h�nh, xin ch� � s�<color=yellow> gi�m �� c��ng h�a<color>:\n")
	szTitle = format("%s 1. Ch� trang b� c� <color=yellow>�� c��ng h�a +13 v� tr� l�n<color> m�i ���c tham gia n�ng c�p\n", szTitle)
	szTitle = format("%s 2. N�ng c�p trang b� xong <color=yellow> +13 ��i th�nh +0, +14 +15 ��i th�nh +7<color>\n", szTitle)
	szTitle = format("%s t�t c� <color=yellow>hi�u qu� ��nh h�n kh�ng b�o l�u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X�c nh�n m�","#show_equip_shop(3037)"),
			format("\n%s/%s","\n Ph�n h�i", "jyr_medal_shop"),
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function jyr_junzhuang_shop()
	local szTitle = format("N�u ch�n s� d�ng trang b� Th��ng �ng n�ng c�p ��n trang b� L�i H�, xin ch� � s� <color=yellow>gi�m �� c��ng h�a<color>:\n")
	szTitle = format("%s 1. Ch� trang b� c� <color=yellow>�� c��ng h�a +14,+15 <color> m�i ���c tham gia n�ng c�p\n", szTitle)
	szTitle = format("%s 2. N�ng c�p xong <color=yellow>�� c��ng h�a ��i th�nh +0<color>\n", szTitle)
	szTitle = format("%s t�t c� <color=yellow>hi�u qu� ��nh h�n kh�ng b�o l�u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X�c nh�n m�","#show_equip_shop(3038)"),
			format("\n%s/%s","\n Ph�n h�i", "jyr_medal_shop"),
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
	--show_equip_shop(3038);
end

function jyr_ys_shop()
	local szTitle = format("N�u ch�n s� d�ng trang b� H�o Nguy�t n�ng c�p ��n trang b� Di�u D��ng, xin ch� � <color=yellow>�� c��ng h�a gi�m n�a<color>:\n")
	szTitle = format("%s Nh�: +1, +7, +10 n�ng c�p xong �� c��ng h�a s� ph�n bi�t ��i th�nh +0, +3, +5\n", szTitle)
	szTitle = format("%s t�t c� <color=yellow>hi�u qu� ��nh h�n kh�ng b�o l�u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X�c nh�n m�","#show_equip_shop(3028)"),
			format("\n%s/%s","\n Ph�n h�i", "jyr_medal_shop"),
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
	--show_equip_shop(3028);
end

function jyr_yx_shop()
	show_equip_shop(3029);
end

function nothing()
end