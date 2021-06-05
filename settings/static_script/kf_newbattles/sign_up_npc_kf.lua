Include("\\settings\\static_script\\kf_newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\system_switch_config.lua")

g_sNpcName = "Chi�n tr��ng li�n ��u";

function main_kf_newbattle()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Chi�n tr��ng l� n�i nguy hi�m, ��i ng��i luy�n t�p th�m m�t th�i gian ��t c�p <color=yellow>40<color> r�i h�y quay l�i!");
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V� danh ti�u t�t nh� ng��i m� c�ng mu�n tham gia cu�c chi�n T�ng-Li�u �? Gia nh�p m�n ph�i r�i h�y t�nh.");
		return 0;
	end
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi�n tr��ng v�n ch�a m�, m�i thi�u hi�p v�o l�c %s ho�c %s ��n b�o danh tham gia.", "16:30", "21:30"), 0);
		return 0;
	end
	if GetPKValue() >= 4 then	--�������ܽ�ս��
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
		return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--��ȡ��ұ���������һ���ε�ս��
	local nBattleType = BT_GetBattleType();
	local nSongPlayerCount = BT_GetPlayerCount(EMPLACEMENT_ID,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(EMPLACEMENT_ID,LIAO_ID);
		
	local selTab = {
			"Ta mu�n tham gia"..tBattleName[EMPLACEMENT_ID].."chi�n tr��ng [T�ng "..nSongPlayerCount.." ng��i]: [Li�u "..nLiaoPlayerCount.." ng��i]/#join_battle("..EMPLACEMENT_ID..")",
			"Ta mu�n ���c h��ng d�n v� chi�n tr��ng/get_battle_book",
			"K�t th�c ��i tho�i/nothing",
	}
	
	Say("<color=green>"..g_sNpcName..format("<color>: Chi�n tr��ng ph�a tr��c �� khai h�a, %s mu�n tham gia kh�ng?", gf_GetPlayerSexName()),getn(selTab),selTab);
end

function join_battle(nBattleType)
	if BT_GetData(PT_POINT_AWARD) ~= 0 or BT_GetData(PTNC_BATTLEPOINT) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c.");
		return 0;
	end
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nBattleSegment ~= 1 and nBattleSegment ~= 3 then	--��ս�������У�δ��������
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Chi�n tr��ng �� m�, l�n sau h�y quay l�i.");
		return 0;
	end
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	if nSongPlayerCount >= nMaxPlayer and nLiaoPlayerCount >= nMaxPlayer then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: S� ng��i b�o danh chi�n tr��ng �� ��t ��n gi�i h�n, l�n sau h�y quay l�i.");
		return 0;
	end
	local nCamp = SONG_ID;
	if nSongPlayerCount > nLiaoPlayerCount then
		nCamp = LIAO_ID;
	end
		
	BT_SetData(PT_BATTLE_TYPE,nBattleType);
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local Old_SubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nBattleMapID);
	JoinMission(tBTMSInfo[nBattleType][1],nCamp);
	SubWorld = Old_SubWorld;
end

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ch�ng ph�i ng��i c� quy�n s�ch sao?");
	end
end

function get_kf_pt_award()
	local nRezult = BT_GetData(PT_LAST_RESULT);
	local nPersonPoint = BT_GetData(PTNC_BATTLEPOINT);
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	if nRezult == 0 and nPersonPoint == 0 and nPointAward == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau �i tham gia chi�n tr��ng r�i ��n ��y l�nh th��ng!");
		return 0;
	end
	local tSay = {};
	local tTempString = {
		[0] = "B�t ph�n th�ng b�i",	
		[1] = "�� gi�nh chi�n th�ng",
		[2] = "�� th�t b�i",
	}
	if not tTempString[nRezult] then
		return 0;
	end
	local strTemp = format("Chi�n tr��ng tr�n tr��c c�a b�n l� <color=green>%s<color>, t�ng �i�m t�ch l�y nh�n ���c l� <color=green>%d<color>.", tTempString[nRezult], nPersonPoint+nPointAward);
	tSay.sel = {};
	strTemp = strTemp.."S� d�ng qu�n c�ng ch��ng, qu�n c�ng ��i, qu�n c�ng huy ho�ng nh�n th��ng c� th� nh�n ���c ph�n th��ng nhi�u h�n v� �i�m kinh nghi�m, g�i qu� th��ng."
	tinsert(tSay.sel, {"Nh�n th��ng tr�c ti�p", "#get_kf_pt_award_deal(1)"})
	tinsert(tSay.sel, {"Qu�n c�ng ch��ng nh�n th��ng", "#get_kf_pt_award_deal(2)"})
	tinsert(tSay.sel, {"Qu�n c�ng ��i nh�n th��ng", "#get_kf_pt_award_deal(3)"})
	tinsert(tSay.sel, {"Qu�n c�ng huy ho�ng nh�n th��ng", "#get_kf_pt_award_deal(4)"})
	tinsert(tSay.sel, {"Vinh D� Qu�n C�ng Ch��ng nh�n th��ng", "#get_kf_pt_award_deal(5)"})
	tinsert(tSay.sel, {"Ra kh�i", "nothing"})
	tSay.msg = "<color=green>"..g_sNpcName.."<color>: "..strTemp;
	temp_Talk(tSay);
end



function get_kf_pt_award_deal(nKind)
	nKind = tonumber(nKind) or 0;
	
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	
	--���飬����������
	local nRet = BT_GetData(PT_LAST_RESULT);
	local tAwardTable = {
		[0] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {8000000, 10000}, 300, {1, 1}},
			[3] = {100, {8000000, 10000}, 800, {1, 1}},
			[4] = {200, {8000000, 10000}, 1200, {1, 1}},
			[5] = {450, {20000000, 0}, 1600, {1, 1}},
		},
		[1] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {16000000, 10000}, 300, {2, 1}},
			[3] = {100, {16000000, 10000}, 800, {2, 1}},
			[4] = {200, {16000000, 10000}, 1200, {2, 1}},
			[5] = {450, {36000000, 0}, 1600, {2, 1}},
		},
		[2] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {8000000, 10000}, 300, {1, 1}},
			[3] = {100, {8000000, 10000}, 800, {1, 1}},
			[4] = {200, {8000000, 10000}, 1200, {1, 1}},
			[5] = {450, {20000000, 0}, 1600, {1, 1}},
		},
	}
	local tAward = tAwardTable[nRet];
	if not tAward then  return 0; end
	local nPersonPoint = BT_GetData(PTNC_BATTLEPOINT);
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nActivity = nPersonPoint+nPointAward;
	local nIndex = 0;
	local tAwardLevel = {0, 30, 100, 200, 450};
	for i = 1, getn(tAwardLevel) do
		if i ~= getn(tAwardLevel) then
			if nActivity >= tAwardLevel[i] and nActivity < tAwardLevel[i+1] then
				nIndex = i;
				break;
			end
		else
			nIndex = i;
		end
	end	
	local tSubAward = tAward[nIndex];
	if not tSubAward then return 0; end
	local nExp = (tSubAward[2][1] + tSubAward[2][2] * nActivity) * (1 + GetVipCardParam()) * (min(VNG_CFG_KFB_EXP_EXT_ADD_RATE or 0, 1) + 1);
	local nJunGong = tSubAward[3] * (1 + min(VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE or 0, 1));
	local tAwardRet = {nExp, nJunGong, tSubAward[4]};
	
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu�n C�ng Ch��ng"},
		[3] = {2, 1, 9998, "Qu�n C�ng ��i"},
		[4] = {2, 1, 9977, "Qu�n C�ng Huy Ho�ng"},
		[5] = {2, 1, 30642, "qu�n c�ng ch��ng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H�nh trang kh�ng �� <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
	end
	
	local tAwardType = {
		[1] = {1, 1, {0, 0}, "Nh�n th��ng tr�c ti�p"},
		[2] = {1.5, 2, {1, 1}, "Qu�n c�ng ch��ng nh�n th��ng"},
		[3] = {2, 5, {2, 1}, "Qu�n c�ng ��i nh�n th��ng"},
		[4] = {2.5, 10, {3, 1}, "Qu�n c�ng huy ho�ng nh�n th��ng"},
		[5] = {3, 14, {3, 2}, "Vinh D� Qu�n C�ng Ch��ng nh�n th��ng"},
	}
	if not tAwardType[nKind] then return 0; end
	
	--��������� ��ֹ����콱
	BT_SetData(PT_LAST_RESULT,0);
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PTNC_BATTLEPOINT,0);
	
	--������
	gf_Modify("Exp", tAwardRet[1] * tAwardType[nKind][1]);
	gf_EventGiveCustomAward(31, tAwardRet[2] * tAwardType[nKind][2], 1, "Ph�o ��i Chi�n Li�n Server", tAwardType[nKind][4]);
	local funcPackAward = function (tParam)
		if not tParam or getn(tParam) ~= 2 then
			return 0;
		end
		local tTemp = {
			[1] = {
				{3, 100, 30000, 1},
				{3, 40, 60000, 1},
				{3, 10, 100000, 1},
				{27, 150, 300, 1},
				{27, 100, 600, 1},
				{27, 100, 1000, 1},
				{34, 75, 60, 1},
				{35, 25, 60, 1},
				{1, 150, "V� Ti�u Y ��ng", {2, 1, 30493, 1}, 0},
				{1, 100, "V� Ti�u Y ��ng", {2, 1, 30493, 2}, 0},
				{1, 50, "V� Ti�u Y ��ng", {2, 1, 30493, 4}, 0},
				{1, 100, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
			},
			[2] = {
				{3, 50, 100000, 1},
				{3, 20, 150000, 1},
				{3, 10, 300000, 1},	
				{27, 100, 600, 1},
				{27, 100, 1200, 1},
				{27, 100, 1500, 1},
				{34, 40, 60, 1},
				{35, 10, 60, 1},
				{1, 200, "V� Ti�u Y ��ng", {2, 1, 30493, 2}, 0},
				{1, 100, "V� Ti�u Y ��ng", {2, 1, 30493, 4}, 0},
				{1, 50, "V� Ti�u Y B�c", {2, 1, 30492, 1}, 0},
				{1, 120, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
				{1, 100, "Thi�t Tinh c�p 2", {2, 1, 30534, 4}, 0},
			},
			[3] = {
				{3, 100, 150000, 1},
				{3, 100, 300000, 1},
				{3, 10, 600000, 1},	
				{27, 100, 1500, 1},
				{27, 100, 2000, 1},
				{27, 100, 2500, 1},
				{35, 75, 60, 1},
				{36, 25, 60, 1},
				{1, 100, "V� Ti�u Y B�c", {2, 1, 30493, 1}, 0},
				{1, 100, "V� Ti�u Y B�c", {2, 1, 30493, 2}, 0},
				{1, 50, "V� Ti�u Y B�c", {2, 1, 30492, 4}, 0},
				{1, 50, "Thi�t Tinh c�p 1", {2, 1, 30533, 4}, 0},
				{1, 50, "Thi�t Tinh c�p 2", {2, 1, 30534, 4}, 0},
				{1, 40, "Thi�t Tinh c�p 3", {2, 1, 30535, 4}, 0},
			},
		}
		local tTempAdd = {
			[1] = {
				{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1}, 0},
				{28, 300, 1},--����
			},
			[2] = {
				{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 2}, 0},
				{28, 400, 1},--����
			},
			[3] = {
				{1, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 6}, 0},
				{28, 500, 1},--����
			},
		}
		local ttAward = tTemp[tParam[1]];
		local ttAwardAdd = tTempAdd[tParam[1]];
		if not ttAward or not ttAwardAdd then
			return 0;
		end
		for i = 1, tParam[2] do
			gf_EventGiveRandAward(ttAward, gf_SumRandBase(ttAward), 1, "Ph�o ��i Chi�n Li�n Server", "Ph�o ��i Chi�n Li�n Server");
			gf_EventGiveAllAward(ttAwardAdd, "Ph�o ��i Chi�n Li�n Server", "Ph�o ��i Chi�n Li�n Server");
		end
	end
	funcPackAward(tAwardRet[3]);
	funcPackAward(tAwardType[nKind][3]);
end