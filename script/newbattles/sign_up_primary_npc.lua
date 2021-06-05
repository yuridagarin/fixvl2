Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\lib\\lingshi_head.lua");

--g_sNpcName��g_nNpcCamp����һ��ȫ�ֱ�������������Զ¥��������Ľű��϶���

function battle_main()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Chi�n tr��ng l� n�i nguy hi�m, ��i ng��i luy�n t�p th�m m�t th�i gian ��t c�p <color=yellow>40<color> r�i h�y quay l�i!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V� danh ti�u t�t nh� ng��i m� c�ng mu�n tham gia cu�c chi�n T�ng-Li�u �? Gia nh�p m�n ph�i r�i h�y t�nh.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--��ȡ��ұ���������һ���ε�ս��
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--��ȡ��ұ�����������ĸ�ս�����ķ�
	local nBattleType = BT_GetBattleType();
	local nSongPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,LIAO_ID);
	--��ѡ��ֻ�ܼ��������2��ѡ��֮��
	local selTab = {
			"B�o danh"..tBattleName[PRIMARY_MAINBATTLE_ID].."[T�ng "..nSongPlayerMSCount.." ng��i]: [Li�u "..nLiaoPlayerMSCount.." ng��i]/#sign_up("..PRIMARY_MAINBATTLE_ID..")",
			"Ta mu�n v�o"..tBattleName[nBattleType].."chi�n tr��ng [T�ng "..nSongPlayerMSCount.." ng��i]: [Li�u "..nLiaoPlayerMSCount.." ng��i]/#join_battle("..nBattleType..")",
			"Ta mu�n nh�n ph�n th��ng chi�n tr��ng/get_battle_award",
			"��i ph�n th��ng chi�n tr��ng/battle_regular_award",
			"Ta mu�n ���c h��ng d�n v� chi�n tr��ng/get_battle_book",
			"K�t th�c ��i tho�i/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nGlobalState == 0 or nBattleSegment == 1 or nBattleSegment == 2 then
		for i=1,2 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.",getn(selTab),selTab);
		return 0;
	end;
	if nBattleType ~= 0 and nBattleType ~= PRIMARY_MAINBATTLE_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n �� b�o danh tham gia chi�n tr��ng Nh�n M�n quan, m�i b�n ��n n�i b�o danh b�o danh Bi�n Kinh �� tham gia chi�n ��u.");
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: N�u ng��i �� ch�n ��i Li�u"..tCampNameZ[3-g_nNpcCamp].." ta c�ng kh�ng c��ng �p. Xin b�o tr�ng!");
		return 0;
	end;
	local nCurRank = BT_GetCurRank();
	if nBattleSegment == 2 or nBattleSegment == 4  then	--ս��������
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--���֮ǰ�б���
			for i=1,1 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
			return 0;			
		else	--֮ǰû�б���	
			tremove(selTab,2);	--ȥ������ս��ѡ��
			if nCurRank >= 4 then	--�ȷ����Ͼ��ο�����ս����ʼ���������
				Say("<color=green>"..g_sNpcName.."<color>: Xin ch�n chi�n tr��ng mu�n tham gia.",getn(selTab),selTab);
			else
				Say("<color=green>"..g_sNpcName.."<color>: Th�i gian b�o danh �� qua, b�n c� th� ch�n s� d�ng V� Song Phi T��ng M�t L�nh (Ng� C�c) ti�n h�nh b�o danh (B� h�n ch� s� ng��i t�i �a v� s� ng��i 2 b�n ch�nh l�ch) ho�c 1 Qu�n C�ng Ch��ng �� b�o danh (b�o danh v� v�o chi�n tr��ng kh�ng b� gi�i h�n s� ng��i).",getn(selTab),selTab);
			end;
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--�ڱ����׶Σ���������
		for i=1,1 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 3 then	--��ս�������У�δ��������
		tremove(selTab,2);	--ȥ������ս��ѡ��
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Xin ch�n chi�n tr��ng mu�n tham gia.",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--�ж�ս��ʱ������ҵȼ�
	local nUpLevel,nLowLevel = 0,0;
	if IB_VERSION == 1 then
		nLowLevel,nUpLevel = 60,79;
	else
		nLowLevel,nUpLevel = 60,79;
	end;
	if GetLevel() > nUpLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ��ng c�p c�a b�n �� r�t cao, m�i b�n ��n Bi�n Kinh �� t�m <color=yellow>Tri�u Di�n Ni�n <color>ho�c <color=yellow>Ti�u Vi�n L�u<color>b�o danh tham gia chi�n tr��ng Nh�n M�n quan. ");
		return 0;
	end;
	if GetLevel() < nLowLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch�a ��t c�p "..nLowLevel.." (c�p) kh�ng th� tham gia Chi�n tr��ng Ng�c M�n quan.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nLevel = GetLevel();
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	local szBattleName = tostring(tBattleName[nBattleType]);
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c.");
		return 0;
	end;
	if GetPKValue() >= 4 then	--�������ܽ�ս��
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
		return 0;
	end;
	if nBattleType == RESOURCE_ID then	--����ǲݹȳ�
		local nNeedLevel = 0;
		if IB_VERSION == 1 then
			nNeedLevel = 85;	--���85��
		else
			nNeedLevel = 90;	--�շ�90��
		end;
		if nLevel > nNeedLevel then	--����nNeedLevel�����òμ�
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: L�n h�n c�p "..nNeedLevel.." kh�ng th� b�o danh tham gia"..szBattleName..".");
			return 0;
		end;
		if nCurRank >= 4 then	--����Ϊ�ȷ漰���ϣ��������þ��Σ�����Ҳ������������ս��
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i ch�i c� qu�n h�m l� ti�n phong v� l�n h�n (bao g�m qu�n h�m v�nh vi�n) kh�ng th� b�o danh tham gia"..szBattleName..".");
			return 0;
		end;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	local nMaxPlayer,nPlayerDiff = 0,0;
	local nRequireLevel = 0;
	if nBattleType == VILLAGE_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 60;
		else
			nRequireLevel = 70;
		end;
	elseif nBattleType == RESOURCE_ID then
		nRequireLevel = 40; 
	elseif nBattleType == EMPLACEMENT_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 75;
		else
			nRequireLevel = 80;
		end;
	elseif nBattleType == MAINBATTLE_ID then
		nRequireLevel = 80;
	elseif nBattleType == PRIMARY_MAINBATTLE_ID then
		nRequireLevel = 60;
	end;
	if nLevel < nRequireLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ch�a ��t c�p "..nRequireLevel.." kh�ng ���c tham gia."..szBattleName..".");
		return 0;	
	end;
	local selTab = {
				"Kh�ng d�ng Qu�n C�ng Ch��ng b�o danh (ng��i ch�i qu�n h�m d��i Ti�n phong s� b� gi�i h�n s� ng��i t�i �a v� s� ng��i ch�nh l�ch)/#sign_up_confirm("..nBattleType..",0)",
				"\nTa mu�n d�ng 1 Qu�n C�ng Ch��ng b�o danh (kh�ng b� gi�i h�n s� ng��i ch�nh l�ch v� s� ng��i t�i �a, tr�n Ti�n phong kh�ng th� s� d�ng)/#sign_up_confirm("..nBattleType..",1)",
				"Ta suy ngh� l�i!/nothing",
				}
	if nBattleSegment == 2 or nBattleSegment == 4 then
		tremove(selTab,1);
		tinsert(selTab,1,"Ta mu�n s� d�ng 1 V� Song Phi T��ng M�t L�nh b�o danh (Ng��i ch�i qu�n h�m d��i Ti�n phong s� b� gi�i h�n s� ng��i ch�nh l�ch v� s� ng��i t�i �a)/#sign_up_confirm("..nBattleType..",2)");
	end;
	local szNotice = "";
	if BT_GetData(PT_RANKPOINT) ~= 0 and nCurCamp ~= g_nNpcCamp then
		szNotice = "<color=red> B�n tham gia phe ��i ��ch n�n kh�ng th� nh�n ph�n th��ng kinh nghi�m <color>. ";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: <color=red> Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng. <color>B�n mu�n gia nh�p phe <color=yellow>"..tCampNameZ[g_nNpcCamp].." kh�ng?<color>"..szNotice,getn(selTab),selTab);
end;

function sign_up_confirm(nBattleType,nSignUpType)	--�ж�ս��ʱ�䡢������������������
	local nCamp = g_nNpcCamp;
	local nCurRank = BT_GetCurRank();
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	nSignUpType = nSignUpType or 0;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
		return 0;
	end;
	if nCurRank >= 4 and nSignUpType == 1 then	--�ȷ����Ͼ��β���ʹ�þ�����
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu�n h�m c�a b�n hi�n r�t cao, c� th� kh�ng d�ng ���c ��o c� b�o danh.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nBattleSegment == 2 or nBattleSegment == 4 then
		if nCurRank >= 4 or nSignUpType ~= 0 then
			nGlobalState = nGlobalState - 1;	--��nGlobalStateΪ��������ʾ�Ǳ����׶�
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr�n chi�n �� di�n ra nh�ng ai ch�a tham gia vui l�ng ��i tr�n sau.");
			return 0;
		end;
	end;
	if nSignUpType == 1 then
		if DelItem(2,1,9999,1) == 1 then
			BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,nSignUpType);
			WriteLog("[Chi�n tr��ng]:"..GetName().." d�ng 1 Qu�n C�ng Ch��ng b�o danh tham gia chi�n tr��ng");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n c�n <color=yellow>1 Qu�n C�ng Ch��ng<color> m�i c� th� b�o danh.");
			return 0;
		end;
	elseif nSignUpType == 2 then
		if DelItem(2,1,9964,1) ~= 1 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n c�n c� <color=yellow>1 V� Song Phi T��ng M�t L�nh<color> m�i c� th� b�o danh.");
			return 0;
		end;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n �� b�o danh tham gia phe <color=yellow>"..tCampNameZ[nCamp].."<color>. Xin chu�n b� ch� khai chi�n! S� ng��i phe");
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
	local nCurRank = BT_GetCurRank();
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--��ȡ��ұ���������һ��ս��
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--��ȡ��ұ�����������ĸ�ս�����ķ�
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
		return 0;
	end;
	if nDate*1000+nGlobalState - nSignUpTime > 1 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ng��i ch�a b�o danh kh�ng th� tham gia chi�n tr��ng.");
		return 0;	
	end;
	local nCurMapID = GetWorldPos();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nSongPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],SONG_ID,nBattleMapID);
	local nLiaoPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],LIAO_ID,nBattleMapID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID or nBattleType == PRIMARY_MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if nCurRank < 4 and BT_GetData(PTNC_ENTER_USE_JUNGONGZHANG) == 0 then	--����������ȷ����²���û�þ����²����ľ���Ҫ���������޺��������ж�
		local selTab = {
					"Ta mu�n d�ng Qu�n C�ng Ch��ng v�o chi�n tr��ng/#join_battle_use_jungongzhang_confirm("..nBattleType..")",
					"\n�� ta suy ngh� th�m/nothing",
					}
		if tPlayerCount[nCamp] >= nMaxPlayer then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].." l� <color=yellow>"..nMaxPlayer.."<color> �� ��, "..tSexName[GetSex()].."B�n c� th� <color=yellow>s� d�ng Qu�n C�ng Ch��ng v�o chi�n tr��ng<color> ho�c ��i � b�n ngo�i.",getn(selTab),selTab);
			return 0;
		end;
		if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
			Say("<color=green>"..g_sNpcName.."<color>: "..tCampNameZ[nCamp].."_ binh l�c �� ��, "..tSexName[GetSex()].."B�n c� th� <color=yellow>s� d�ng Qu�n C�ng Ch��ng v�o chi�n tr��ng<color> ho�c ��i b�n ngo�i, hi�n s� ng��i 2 phe trong chi�n tr��ng l�: <color=yellow>T�ng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li�u<color>.",getn(selTab),selTab);
			Msg2Player("S� ng��i hi�n t�i kho�ng "..nDiffPlayerCount);
			return 0;
		end;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--����nSignUpInfoҲ���Եõ�nBattleType�������ٱ���һ�λ᲻������أ�
	mf_JoinMission(tBTMSInfo[nBattleType][1],nCamp,nBattleMapID);
end;

function join_battle_use_jungongzhang_confirm(nBattleType)
	local selTab = {
				"��ng �/#join_battle_use_jungongzhang("..nBattleType..")",
				"H�y b�/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: B�n mu�n s� d�ng <color=yellow>Qu�n C�ng Ch��ng<color> v�o chi�n tr��ng?",getn(selTab),selTab);
end;

function join_battle_use_jungongzhang(nBattleType)
	if DelItem(2,1,9999,1) == 1 then
		BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n c�n c� <color=yellow>1 Qu�n C�ng Ch��ng<color> m�i c� th� v�o chi�n tr��ng.");
		return 0;
	end;	
	join_battle(nBattleType);
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ch�ng ph�i ng��i c� quy�n s�ch sao?");
	end;
end;

tbJUNGONGZHANG = 
{
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,2},
	[2] = {"Qu�n C�ng ��i",2,1,9998,5},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,10},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nCurCamp = BT_GetCurCamp();
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local szLastResult = "";
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau �i tham gia chi�n tr��ng r�i ��n ��y l�nh th��ng!");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr�n chi�n b�n tham gia l� <color=yellow>"..tCampNameZ[nLastCamp].." <color>. Xin m�i ��n n�i b�o danh l�nh th��ng.")
		return 0;
	end;
	if nLastResult == 0 then
		szLastResult = "K�t qu� 2 b�n T�ng Li�u h�a nhau."
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	elseif nLastCamp == nLastResult then
		szLastResult = "K�t qu�"..tCampNameZ[nLastCamp].." �� th�ng.";
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		szLastResult = "K�t qu�"..tCampNameZ[SONGLIAO_ID-nLastCamp].." �� th�ng.";
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	local selTab = {
	                format("Ta mu�n s� d�ng qu�n c�ng ch��ng (ph�n th��ng qu�n c�ng %d, ph�n th��ng kinh nghi�m*"..nExpMul1.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
                    format("Ta mu�n s� d�ng ��i qu�n c�ng ch��ng (ph�n th��ng qu�n c�ng %d l�n, ph�n th��ng kinh nghi�m "..nExpMul2.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
                    format("Ta mu�n s� d�ng Huy ho�ng qu�n c�ng ch��ng (ph�n th��ng qu�n c�ng %d l�n, ph�n th��ng kinh nghi�m "..nExpMul3.." )/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
                    "Kh�ng d�ng/not_use_jungongzhang_confirm",
                    "Ch�a mu�n nh�n th��ng/nothing",
                    }
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nCurGoldenExp = GetGoldenExp();
	local szSay = "";
	local szJunGong = "";
	local nDate = tonumber(date("%y%m%d"));
	if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
		szJunGong = "(N�u qu�n c�ng nh�n ���c <400 �i�m, d�ng Qu�n C�ng Ch��ng s� t�ng ��i theo 400 �i�m, n�u nh�n qu�n c�ng nh�n ���c <600 �i�m, d�ng Qu�n C�ng Ch��ng v� Qu�n C�ng Ch��ng huy ho�ng s� t�ng ��i theo 600)";
	else
		szJunGong = "(N�u qu�n c�ng nh�n ���c <200 �i�m, d�ng Qu�n C�ng Ch��ng s� t�ng ��i theo 200 �i�m, n�u qu�n c�ng nh�n ���c <400 �i�m, d�ng ��i Qu�n C�ng Ch��ng v� Huy ho�ng Qu�n C�ng Ch��ng s� nh�n ��i theo 400 �i�m)";
	end;
	local szExpAward = "M�i ng�y ng��i ch�i ch� c� th� nh�n "..MAX_GET_EXP_AWARD.." l�n ph�n th��ng chi�n tr��ng ch�nh.";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= MAX_GET_EXP_AWARD and (nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID) then	--��������ù����齱��
		nExpAward = 0;
		if IB_VERSION ~= 1 then
			szExpAward = "M�i ng�y ng��i ch�i ch� c� th� nh�n "..MAX_GET_EXP_AWARD.." l�n ph�n th��ng chi�n tr��ng ch�nh. <color=yellow>H�m nay b�n �� nh�n "..MAX_GET_EXP_AWARD.." ph�n th��ng r�i, v� v�y kh�ng th� nh�n n�a<color>";
		end;
	end;
	if IB_VERSION == 1 then 	--�����IB�汾
		szExpAward = "ph�n th��ng nh�n ���c l� <color=yellow>"..nExpAward.." �i�m<color>. ";
	else
		szExpAward = "ph�n th��ng nh�n ���c l� <color=yellow>"..nExpAward.." �i�m<color>, t�i �a chuy�n <color=yellow>"..nGoldenExpAward.." �i�m<color> s�c kh�e chuy�n th�nh kinh nghi�m (Hi�n t�i s�c kh�e c�a b�n l� <color=yellow>"..nCurGoldenExp.."<color> �i�m)."..szExpAward;
	end;
	if nLastCamp ~= nCurCamp then
		szExpAward = "V� b�n tham gia phe ��i ph��ng n�n kh�ng th� nh�n ph�n th��ng.";
	end;
	szSay = "Tr�n chi�n b�n tham gia l�n tr��c l� phe <color=yellow>"..tCampNameZ[nLastCamp].."<color>, "..szLastResult.." ph�n th��ng t�ch l�y l� <color=yellow>"..nPointAward.." �i�m<color> t�ch l�y, <color=yellow>"..nJunGongAward.." �i�m<color>"..szJunGong.."."..szExpAward
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--�Ƿ��ڼ��װ������Ч����
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp and bSpyTime == 0 then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: B�n tham gia chi�n tr��ng c�a phe ��i ph��ng, kh�ng th� s� d�ng qu�n c�ng ch��ng/��i qu�n c�ng ch��ng/huy ho�ng ch��ng, xin h�y ch�n d�ng kh�ng s� d�ng qu�n c�ng ch��ng nh�n ph�n th��ng.");
		return 0;
	end;
	local selTab = {
				format("��ng/#get_all_award(%d)",nType),
				"Sai/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i mu�n s� d�ng <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>?",getn(selTab),selTab);
end;

function get_all_award(nType)
	if gf_JudgeRoomWeight(1,10,"<color=green>"..g_sNpcName.."<color>: ") == 0 then
		return 0;
	end;
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--�Ƿ��ڼ��װ������Ч����
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nLevel = GetLevel();
	if nType ~= 0 then
		if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
			if nType == 1 then
				nJunGongAward = max(400,nJunGongAward);
			else
				nJunGongAward = max(600,nJunGongAward);
			end;
		else
			if nType == 1 then
				nJunGongAward = max(200,nJunGongAward);
			else
				nJunGongAward = max(400,nJunGongAward);
			end;
		end;
	end;
	if nLastCamp == nLastResult or nLastResult == 0 then
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng mang theo <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> th� ph�i!");
			return 0;
		end;
	end;
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0);
	BT_SetData(PT_LAST_BATTLE,0);
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --�����µĽ�����������
	{
		[0] = 1,
		[1] = nExpMul1,
		[2] = nExpMul2,
		[3] = nExpMul3,
	};
	local nCurCamp = BT_GetCurCamp();
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID and nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--�����Сս��
		if nLastCamp == nCurCamp then
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
		else
			Msg2Player("B�n tham gia phe ��i ��ch, v� v�y kh�ng th� nh�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m ���c.");
		end;
	else	--��ս������
		if nGetExpAwardCount < MAX_GET_EXP_AWARD then	--�����ȡ��ս����������С��1
			if nLastCamp == nCurCamp then
				nExpAward = floor(nExpAward*tbExpMultiple[nType]);
				ModifyExp(nExpAward);
				Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");	
				BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
				BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);
			else
				Msg2Player("B�n tham gia phe ��i ��ch, v� v�y kh�ng th� nh�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m ���c.");
			end;	
		else
			Msg2Player("H�m nay b�n �� nh�n ���c "..MAX_GET_EXP_AWARD.." l�n nh�n ph�n th��ng kinh nghi�m, m�i ng�y ch� c� th� nh�n 1 l�n"..MAX_GET_EXP_AWARD.." l�n nh�n ph�n th��ng kinh nghi�m ��i chi�n tr��ng");
		end;
		local nLSLevel = 0;
		if nLevel <= 70 then
			nLSLevel = random(1,4);		
		elseif nLevel <= 80 then
			nLSLevel = random(1,5);
		elseif nLevel <= 100 then
			nLSLevel = random(2,5);
		end;
		if nLSLevel ~= 0 then
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B�n nh�n ���c 1 "..nLSLevel.." (c�p) Linh th�ch, �� cho v�o T� Linh ��nh");		
		end;
	end;
	if IB_VERSION ~= 1 then	--������շѰ汾�����ӽ���ת���齱��
		if nLastCamp == nCurCamp then
			gf_GoldenExp2Exp(nGoldenExpAward);
		else
			Msg2Player("B�n tham gia phe ��i ��ch, v� v�y kh�ng th� nh�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m ���c.");
		end;
	end;
	local nCurRankPoint = BT_GetData(PT_RANKPOINT);
	if abs(nCurRankPoint) < MAX_PRIMARY_JUNGONG or nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--��������MAX_PRIMARY_JUNGONGʱ�Ż��о����ͻ��ֽ���
		BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
		SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--ִ��SetRankPoint��˥������
		Msg2Player("B�n nh�n ���c "..nPointAward.." �i�m t�ch l�y chi�n tr��ng");
		nCurRankPoint = BT_GetData(PT_RANKPOINT);	--��ȡ˥����ľ���
		if bSpyTime == 1 then	--������װ����Ч
			if nCurCamp == LIAO_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B�n nh�n ���c "..tCampNameZ[nCurCamp].."Ph��ng "..nJunGongAward.." �i�m c�ng tr�ng");
		else
			if nLastCamp == SONG_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("B�n nh�n ���c "..tCampNameZ[nLastCamp].."Ph��ng "..nJunGongAward.." �i�m c�ng tr�ng");
		end;
	else
		Msg2Player("Qu�n c�ng c�a b�n �� cao h�n "..MAX_PRIMARY_JUNGONG.." �i�m, tham gia Chi�n tr��ng Ng�c M�n quan kh�ng ���c nh�n qu�n c�ng v� ph�n th��ng �i�m t�ch l�y.");
	end;
	WriteLog("[ph�n th��ng chi�n tr�n]:"..GetName().."nh�n l�nh ph�n th��ng chi�n tr��ng ("..nLastCamp..","..nLastBattle..","..nLastResult.."), c�c lo�i qu�n c�ng ch��ng: "..nType..". S� qu�n c�ng tr��c: "..nCurRankPoint..", s� qu�n c�ng c� ���c:"..BT_GetData(PT_RANKPOINT));
end;

function not_use_jungongzhang_confirm()
	local selTab = {
				"S� d�ng qu�n c�ng ch��ng/get_battle_award",
				"Kh�ng mu�n d�ng qu�n c�ng n�o h�t/#not_use_jungongzhang_confirm2(0)",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng d�ng qu�n c�ng ch��ng sao?",getn(selTab),selTab);
end;

function not_use_jungongzhang_confirm2()
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then	--����μӵ��Ǳ�����Ӫ����װ������Чʱ����
		get_all_award(0);
		return 0;
	end;
	local selTab = {
				"��ng �/#get_all_award(0)",
				"Tho�t/nothing",
				}
	if IB_VERSION == 1 then
		Say("<color=green>"..g_sNpcName.."<color>: Chi�n tr��ng b�n tham gia l� c�a phe ��i ph��ng, v� th� <color=red>kh�ng th� nh�n ���c ph�n th��ng kinh nghi�m<color> v� tr�c ti�p nh�n ph�n th��ng ��ng th�i tr� �i�m qu�n c�ng c�a b�n, c� th� d�ng <color=yellow>Gi�n �i�p trang<color> �� nh�n qu�n c�ng phe m�nh. N�u b�n v�n mu�n nh�n ph�n th��ng h�y ch�n 'X�c nh�n', n�u b�n mu�n suy ngh� th�m h�y ch�n 'Tho�t kh�i'.",getn(selTab),selTab);	
	else
		Say("<color=green>"..g_sNpcName.."<color>: Chi�n tr��ng b�n tham gia l� c�a phe ��i ph��ng v� th� <color=red>kh�ng th� nh�n ���c ph�n th��ng kinh nghi�m v� ph�n th��ng s�c kh�e ��i �i�m kinh nghi�m<color>, v� tr�c ti�p nh�n ph�n th��ng ��ng th�i tr� �i�m qu�n c�ng c�a b�n, c� th� d�ng <color=yellow>Gi�n �i�p trang<color> �� nh�n qu�n c�ng phe m�nh. N�u b�n v�n mu�n nh�n ph�n th��ng h�y ch�n 'X�c nh�n', n�u b�n mu�n suy ngh� th�m h�y ch�n 'Tho�t kh�i'.",getn(selTab),selTab);	
	end;
end;

function battle_regular_award()
	local selTab = {
				"��i trang b� chi�n tr��ng/BTA_Main",
				"Ta mu�n ��i 100000 �i�m t�ch l�y l�y H� y c�a T�ng Ki�m c�p 70/want_cangjian_equip",
				"Ta mu�n ��i 30000 �i�m t�ch l�y l�y L�nh b�i bang h�i/want_ling_pai",
				"Ta mu�ni 1000 �i�m t�ch l�y l�y �i�m kinh nghi�m/want_exp_award",
				"Ta mu�n ��i Tr�m Tinh Th�n Sa (100 �i�m t�ch l�y chi�n tr��ng ��i 1 c�i)/want_zscs",
				"Quay l�i n�i dung tr��c./main",
				"K�t th�c ��i tho�i/nothing",
				}
	if IB_VERSION == 1 then	--IB�汾û�л��ֻ�װ�������顢�������ƽ���
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i mu�n ��i ph�n th��ng n�o?",getn(selTab),selTab);
end;

function want_zscs()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nCount = floor(nCurPoint/1000);
	if nCount <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: �i�m t�ch l�y chi�n tr��ng c�a b�n kh�ng ��, h�y x�c nh�n b�n c� �t nh�t <color=yellow>1000 �i�m t�ch l�y chi�n tr��ng<color>.");
		return 0;
	end;
	AskClientForNumber("give_zscs",1,min(nCount,100),"B�n mu�n ��i bao nhi�u?");	--������໻��������
end;

function give_zscs(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	if nCurPoint < nCount*1000 then
		Talk(1,"",g_szInforHeader.."B�n kh�ng �� �i�m t�ch l�y chi�n tr��ng, h�y x�c nh�n b�n c� �t nh�t <color=yellow>"..(nCount*1000).." �i�m t�ch l�y chi�n tr��ng<color>.")	
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nCount*1000);
	AddItem(2,1,3334,nCount);
	Msg2Player("B�n ��i "..(nCount*1000).." �i�m t�ch l�y ��i l�y "..nCount.." Tr�m Tinh Th�n Sa");
	WriteLog("[ph�n th��ng chi�n tr�n]:"..GetName().."��i "..nCount.." Tr�m Tinh Th�n Sa");
end;

function want_ling_pai()
	local selTab = {
			"��ng �/give_ling_pai",
			"H�y b�/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: ��i <color=yellow>L�nh b�i bang h�i<color> c�n <color=yellow>30000 �i�m t�ch l�y<color>, b�n x�c nh�n mu�n ��i?",getn(selTab),selTab);
end;

function give_ling_pai()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 30000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(2,0,125,1);
	if nRetCode == 1 then
		Msg2Player("B�n �� ��i m�t L�nh b�i bang h�i");
		WriteLog("[ph�n th��ng chi�n tr�n]:"..GetName().." �� ��i m�t l�nh b�i bang h�i");
	else
		WriteLog("[ph�n th��ng b� l�i]"..GetName().."Khi ��i l�nh b�i bang h�i AddItem b�o l�i, nRetCode:"..nRetCode);
	end;
end;

function want_cangjian_equip()
	local selTab = {
			"��ng �/give_cangjian_equip",
			"H�y b�/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: Mu�n ��i <color=yellow>H� y T�ng Ki�m c�p 70<color> c�n <color=yellow>100000 �i�m t�ch l�y<color>, b�n x�c nh�n mu�n ��i?",getn(selTab),selTab);
end;

function give_cangjian_equip()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 100000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n ph�i gia nh�p m�n ph�i m�i c� th� ��i H� y T�ng Ki�m");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nNum = nRoute * 100 + 70 + nBody;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(0,101,nNum,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n ��i "..nNeedPoint.." �i�m t�ch l�y l�y 1 H� y T�ng Ki�m c�p 70");
		WriteLog("[ph�n th��ng chi�n tr�n]:"..GetName().." ��i l�y H� y T�ng Ki�m c�p 70");
	else
		WriteLog("[ph�n th��ng b� l�i]"..GetName().."��i l�y H� y T�ng Ki�m c�p 70 AddItem b�o l�i, nRetCode:"..nRetCode);
	end;
end;

function want_exp_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 1000;
	local nLevel = GetLevel();
	if nLevel < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l�i! Nh�n v�t d��i c�p <color=yellow>40<color> kh�ng th� ��i ph�n th��ng kinh nghi�m");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
		BT_SetData(PT_EXCHANGE_EXP_COUNT,0);
	end;
	local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
	if nCurCount >= 20 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l�i! H�m nay b�n �� nh�n <color=yellow>20<color> l�n ph�n th��ng �i�m kinh nghi�m, m�i ng�y ch� c� th� ��i �i�m t�ch l�y l�y �i�m kinh nghi�m 20 l�n");
		return 0;
	end;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
		return 0;
	end;
	local nExpAward = floor((((nLevel^2)/1600)^2)*20000);
	nCurCount = nCurCount + 1;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	BT_SetData(PT_EXCHANGE_EXP_COUNT,nCurCount);
	BT_SetData(PT_EXCHANGE_EXP_DATE,nDate);
	ModifyExp(nExpAward);
	Msg2Player("B�n ��i "..nNeedPoint.." �i�m t�ch l�y ��i l�y "..nExpAward.." �i�m kinh nghi�m, ��y l� l�n ��i �i�m kinh nghi�m th� "..nCurCount..".");
	WriteLog("[ph�n th��ng chi�n tr�n]:"..nLevel.."-(c�p):"..GetName().." �� d�ng �i�m t�ch l�y ��i"..nExpAward.." �i�m kinh nghi�m");
end;
