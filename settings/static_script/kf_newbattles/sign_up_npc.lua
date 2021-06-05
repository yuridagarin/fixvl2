Include("\\settings\\static_script\\kf_newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");

Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--���������Ľӿ�
Include("\\script\\function\\vip_card\\vc_head.lua")

Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\global\\merit.lua")

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
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--��ȡ��ұ���������һ���ε�ս��
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--��ȡ��ұ�����������ĸ�ս�����ķ�
	local nBattleType = BT_GetBattleType();
	local nSongPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,SONG_ID);
	local nLiaoPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,LIAO_ID);
	local nSongPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,SONG_ID);
	local nLiaoPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,LIAO_ID);
	local nSongPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,SONG_ID);
	local nLiaoPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,LIAO_ID);
	local nSongPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,LIAO_ID);
	local nSongPlayerMSCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	--��ѡ��ֻ�ܼ�����������ѡ��֮��
	local selTab = {
			"B�o danh"..tBattleName[VILLAGE_ID].." [T�ng "..nSongPlayerCountV.." ng��i]: [Li�u "..nLiaoPlayerCountV.." ng��i]/#sign_up("..VILLAGE_ID..")",
			"B�o danh"..tBattleName[RESOURCE_ID].." [T�ng "..nSongPlayerCountR.." ng��i]: [Li�u "..nLiaoPlayerCountR.." ng��i]/#sign_up("..RESOURCE_ID..")",
			"B�o danh"..tBattleName[EMPLACEMENT_ID].." [T�ng "..nSongPlayerCountE.." ng��i]: [Li�u "..nLiaoPlayerCountE.." ng��i]/#sign_up("..EMPLACEMENT_ID..")",
			"B�o danh"..tBattleName[MAINBATTLE_ID].." [T�ng "..nSongPlayerCountM.." ng��i]: [Li�u "..nLiaoPlayerCountM.." ng��i]/#sign_up("..MAINBATTLE_ID..")",
			"Ta mu�n v�o"..tBattleName[nBattleType].."chi�n tr��ng [T�ng "..nSongPlayerMSCount.." ng��i]: [Li�u "..nLiaoPlayerMSCount.." ng��i]/#join_battle("..nBattleType..")",
			"Xem s� li�u th�ng k�/BTS_ViewBattleStatistic",
			"Ta mu�n nh�n ph�n th��ng chi�n tr��ng/get_battle_award",
			"��i ph�n th��ng chi�n tr��ng/battle_regular_award",
			"Tham gia ��nh gi� qu�n h�m/assess_rank",
			"Ta mu�n ���c h��ng d�n v� chi�n tr��ng/get_battle_book",
			"K�t th�c ��i tho�i/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.",getn(selTab),selTab);
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		if 3-g_nNpcCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: N�u ng��i �� ch�n ��i T�ng ta c�ng kh�ng c��ng �p, xin b�o tr�ng!");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: N�u ng��i �� ch�n ��i Li�u ta c�ng kh�ng c��ng �p, xin b�o tr�ng!");
		end;
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nBattleSegment == 2 or nBattleSegment == 4  then	--ս��������
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--���֮ǰ�б���
			for i=1,4 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
			return 0;			
		else	--֮ǰû�б���
			for i=1,5 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>: Th�i gian b�o danh �� k�t th�c, xin ��i tr�n sau!",getn(selTab),selTab);
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--�ڱ����׶Σ���������
		for i=1,4 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>"..tBattleName[nBattleType].."<color>.",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 1 then	--��ս�������У�δ��������
		tremove(selTab,4);	--ȥ����ս������
		tremove(selTab,4);	--ȥ������ս��ѡ��
	elseif nBattleSegment == 3 then	--��ս�������У�δ��������
		for i=1,3 do
			tremove(selTab,1)
		end;
		tremove(selTab,2);	--ȥ������ս��ѡ��
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Xin ch�n chi�n tr��ng mu�n tham gia.",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--�ж�ս��ʱ������ҵȼ�
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c.");
		return 0;
	end;
	if GetPKValue() >= 4 then	--�������ܽ�ս��
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
		return 0;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr�n chi�n �� di�n ra nh�ng ai ch�a tham gia vui l�ng ��i tr�n sau.");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = 0,0;
	if nBattleType < 4 then
		if GetLevel() < 40 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Nh� h�n c�p 40 kh�ng th� tham gia chi�n tr��ng ph�.");
			return 0;
		end;
	else
		if GetLevel() < 60 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Nh� h�n c�p 60 kh�ng th� tham gia chi�n tr��ng ch�nh.");
			return 0;
		end;
	end;
	local sMedicineStr = "";
	if nBattleType == VILLAGE_MAP_ID or nBattleType == EMPLACEMENT_MAP_ID then
		--sMedicineStr = "��ȷ�ϱ���<color=yellow>"..tBattleName[].."���������ѻ��";
	end;
	local selTab = {
				"��ng �/#sign_up_confirm("..nBattleType..")",
				"Ta suy ngh� l�i!/nothing",
				}
	if g_nNpcCamp == SONG_ID then
		Say("<color=green>"..g_sNpcName.."<color>: <color=red>Ch� �: Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng. <color>B�n mu�n gia nh�p <color=yellow>phe T�ng<color>?",getn(selTab),selTab);
	else
		Say("<color=green>"..g_sNpcName.."<color>: <color=red>Ch� �: Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng. <color>B�n mu�n gia nh�p <color=yellow>phe Li�u<color>?",getn(selTab),selTab);
	end;
end;

function sign_up_confirm(nBattleType)	--�ж�ս��ʱ�䡢������������������
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--��ȡս����ǰ�����ĸ��׶�
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Tr�n chi�n �� di�n ra nh�ng ai ch�a tham gia vui l�ng ��i tr�n sau.");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = SUB_BATTLE_SIGNUP_MAX_PLAYER,SUB_BATTLE_SIGNUP_PLAYER_DIFF;
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_SIGNUP_MAX_PLAYER;
		nPlayerDiff = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;
	end;
	local nCurPlayerCount = BT_GetSignUpPlayerCount(nBattleType,nCamp);
	local nOppositePlayerCount = BT_GetSignUpPlayerCount(nBattleType,SONGLIAO_ID-nCamp);
	if nCurPlayerCount >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Hi�n t�i chi�n tr��ng<color> �� ��y, m�i c�c anh h�ng ch�n chi�n tr��ng ho�c phe kh�c.");
		return 0;
	end;
	if nCurPlayerCount-nOppositePlayerCount >= nPlayerDiff then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Hi�n s� ng��i T�ng-Li�u ��i b�n b�o danh ��t t�i �a <color=yellow>"..nPlayerDiff.." ng��i<color>, m�i c�c anh h�ng ch�n chi�n tr��ng ho�c phe kh�c");
		Msg2Player("S� ng��i hi�n t�i kho�ng "..nPlayerDiff);
		return 0;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	if nCamp == SONG_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n �� b�o danh tham gia <color=yellow>phe T�ng<color>, xin chu�n b� ch� khai chi�n!");
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n �� b�o danh tham gia <color=yellow>phe Li�u<color>, xin chu�n b� ch� khai chi�n!");
	end;
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
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
	local nBattleType = BT_GetBattleType();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if tPlayerCount[nCamp] >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Phe n�y �� c� <color=yellow>"..nMaxPlayer.."<color> ng��i, khi kh�c h�y quay l�i!");
		return 0;
	end;
	if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Binh l�c phe n�y �� ��, B�ng h�u h�y quay l�i sau nh�! S� ng��i ��i b�n hi�n l�: <color=yellow>T�ng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li�u<color>.");
		Msg2Player("S� ng��i hi�n t�i kho�ng "..nDiffPlayerCount);
		return 0;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--����nSignUpInfoҲ���Եõ�nBattleType�������ٱ���һ�λ᲻������أ�
	local Old_SubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nBattleMapID);
	JoinMission(tBTMSInfo[nBattleType][1],nCamp);
	SubWorld = Old_SubWorld;
	--cdkey
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_BZBD_PVP_Set(%d)", 3 + BT_GetBattleType()));
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: Ch�ng ph�i ng��i c� quy�n s�ch sao?");
	end;
end;

function battle_shouxian()
	local nValue = GetTask(701)
	if g_nNpcCamp == SONG_ID and nValue < 0 then	-- �������귽���ܽ����ɷ�����
		Say("<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng ph�i phe T�ng kh�ng th� nh�n qu�n h�m", 0)
	elseif g_nNpcCamp == LIAO_ID and nValue > 0 then	-- ��Զ¥�����ܽ����η�����
		Say("<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng ph�i phe Li�u kh�ng th� nh�n qu�n h�m", 0)
	else
		Say("<color=green>"..g_sNpcName.."<color>: N�u tu�n n�y ch�a tham gia qua chi�n tr��ng m� mu�n nh�n x�p h�ng qu�n c�ng ta ph�i tham gia nghi th�c trao qu�n h�m, c�n n�u ng��i ch�i �� tham gia qua s� m�c ��nh tham gia nh�n qu�n h�m, <color=yellow>21 gi� t�i th� 6 h�ng tu�n<color> c� h�nh nghi th�c trao qu�n h�m cho ng��i ch�i <color=yellow>online v� tham gia nh�n qu�n h�m<color>, nh�n xong ta c� th� <color=yellow>��ng nh�p l�i ho�c ��n ��y<color> nh�n qu�n h�m m�i nh�t.", 2, "Tham gia nh�n qu�n h�m/battle_shouxian_yes", "Kh�ng c�n/nothing")
	end
end

function battle_shouxian_yes()
	SetRankPoint(5, 701, 1)
end

function update_cur_rank()
	CalcBattleRank()
	UpdateBattleMaxRank()
	Say("<color=green>"..g_sNpcName.."<color>: Qu�n h�m c�a ng��i �� ���c thay ��i.", 0)
end


tbJUNGONGZHANG = 
{
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,2},
	[2] = {"Qu�n C�ng ��i",2,1,9998,5},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,10},
	[4] = {"qu�n c�ng ch��ng vinh d� ",2,1,30642,14},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau �i tham gia chi�n tr��ng r�i ��n ��y l�nh th��ng!");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		if nLastCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: L�n tr��c b�n �� tham gia phe <color=yellow>T�ng<color>, m�i ��n �i�m b�o danh l�nh th��ng!")
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: L�n tr��c b�n �� tham gia phe <color=yellow>Li�u<color>, m�i ��n �i�m b�o danh l�nh th��ng!")
		end;
		return 0;
	end
	local selTab = {
	                format("D�ng qu�n c�ng ch��ng (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p 1.5 l�n)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
                    format("D�ng ��i qu�n c�ng ch��ng (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p ��i)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
                    format("D�ng huy ho�ng ch��ng (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p 2.5 l�n)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
                    format("Ta mu�n d�ng Vinh D� Qu�n C�ng Ch��ng (Ph�n th��ng qu�n c�ng %d l�n, ph�n th��ng kinh nghi�m 3 l�n)/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[4][5],4),
                    "Kh�ng d�ng/not_use_jungongzhang_confirm",
                    "Ch�a mu�n nh�n th��ng/nothing",
                    }
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local szSay = "";
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local szExpAward = "M�i ng�y m�i ng��i ch� c� th� nh�n ph�n th��ng 1 l�n";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= 1 and nLastBattle == MAINBATTLE_ID then	--��������ù����齱��
		nExpAward = 0;
		szExpAward = "M�i ng�y m�i ng��i ch� c� th� nh�n ph�n th��ng 1 l�n, <color=yellow>h�m nay b�n �� nh�n qua ph�n th��ng<color>.";
	end;
	if IB_VERSION == 1 then 	--�����IB�汾
		szSay = "Ph�n th��ng kinh nghi�m l�n tr��c b�n nh�n l� <color=yellow>"..nExpAward.." �i�m<color>,"..szExpAward.." ph�n th��ng t�ch l�y l� <color=yellow>"..nPointAward.." �i�m<color> t�ch l�y, <color=yellow>"..nJunGongAward.." �i�m<color>. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng v� ph�n th��ng kinh nghi�m<color>.";
	else
		szSay = "Ph�n th��ng kinh nghi�m l�n tr��c b�n nh�n l� <color=yellow>"..nExpAward.." �i�m<color>,"..szExpAward..", c� th� chuy�n <color=yellow>"..nGoldenExpAward.." �i�m<color> s�c kh�e th�nh �i�m kinh nghi�m, ph�n th��ng t�ch l�y l� <color=yellow>"..nPointAward.." �i�m<color> t�ch l�y, <color=yellow>"..nJunGongAward.." �i�m<color> qu�n c�ng. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng<color>."
	end;
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng��i tham gia chi�n tr��ng phe c�a ��i ph��ng, kh�ng th� d�ng Qu�n C�ng Ch��ng/��i Qu�n C�ng Ch��ng/Huy Ho�ng Qu�n C�ng Ch��ng/Vinh D� Qu�n C�ng Ch��ng, h�y ch�n d�ng kh�ng d�ng Qu�n C�ng Ch��ng �� nh�n th��ng.");
		return 0;
	end;
	local selTab = {
				format("��ng/#get_all_award(%d)",nType),
				"Sai/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i mu�n s� d�ng <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>?",getn(selTab),selTab);
end;

function get_all_award(nType)
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local nLevel = GetLevel();
	
	if gf_JudgeRoomWeight(3,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
		return 0;
	end;
	
	if nType ~= 0 then
		if nTimePassed <= ITEM_SPYCLOTH_TIME then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Hi�u qu� m�t n� Gi�n �i�p c�a b�n v�n c�n, kh�ng th� s� d�ng ph�n th��ng qu�n c�ng nh�n ph�n th��ng. Th�i gian s� d�ng m�t n� Gi�n �i�p: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
			return 0;
		end;
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng mang theo <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> th� ph�i!");
			return 0;
		end;
	end;
	
	--��������� ��ֹ����콱
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0)
	BT_SetData(PT_LAST_BATTLE,0);
	
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --�����µĽ�����������
	{
		[0] = 1,
		[1] = 1.5,
		[2] = 2,
		[3] = 2.5,
		[4] = 3,
	};	
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID then	--�����Сս��
		nExpAward = floor(nExpAward*tbExpMultiple[nType]);
		--< Added by SunZhuoshi
		HBRewardInSmallBattleField();
		-->
		ModifyExp(nExpAward);
		Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");	
		--����vip��
		_vc_JoinSmallBattle();
	else	--��ս������
		--< Added by SunZhuoshi
		HBRewardInBigBattleField();
		-->
		if nGetExpAwardCount < 1 then	--�����ȡ��ս����������С��1
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");	
			BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
			BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);		
		else
			Msg2Player("H�m nay b�n �� nh�n 1 l�n ph�n th��ng kinh nghi�m, m�i ng�y ch� c� th� nh�n 1 l�n");
		end;
		--����vip��
		_vc_JoinBigbattle();
	end;
	-- Խ��2008 5.1 �����
	local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
	local is_winner = (nLastCamp == nLastResult) or 0
	viet_51_battle_award(is_main_batter, is_winner);
	
	local tYinXiongXunZhang = {
		[0] = {0, 1,},
		[1] = {1, 2,},
		[2] = {2, 3,},
		[3] = {3, 4,},
		[4] = {4, 5,},
	}
	local nYinXiongXunZhangCnt = tYinXiongXunZhang[nType][is_winner+1] or 0
	if nYinXiongXunZhangCnt > 0 then
		gf_SetLogCaption("NewBattle");
    	gf_AddItemEx({2, 1, 30499, nYinXiongXunZhangCnt}, "Hu�n ch��ng anh h�ng");
    	gf_SetLogCaption("");
	end

	
	--��������
	AwardZhenQi_ZhanChang(is_main_batter, is_winner)
	
	--Խ��2009��8�»��������ս���Ÿ�
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nDayWeek = tonumber(date("%w"));
		if nDayWeek == 0 or nDayWeek == 1 or nDayWeek == 5 or nDayWeek == 6 then 
			if is_main_batter == 1 then
				local nCurRank = BT_GetData(PT_CURRANK);
				nCurRank = abs(nCurRank);
				if nCurRank == 1 then
					ModifyExp(100000);
				elseif nCurRank == 2 then
					ModifyExp(200000);
				elseif nCurRank == 3 then		-- ��ͳ
					ModifyExp(350000 + is_winner * 50000);
				elseif nCurRank == 4 then
					ModifyExp(700000 + is_winner * 100000);
				elseif nCurRank == 5 then
					ModifyExp(1000000 + is_winner * 200000);
				end
			end
		end
	end
	
	if IB_VERSION ~= 1 then	--������շѰ汾�����ӽ���ת���齱��
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--ִ��SetRankPoint��˥������
	Msg2Player("B�n nh�n ���c "..nPointAward.." �i�m t�ch l�y chi�n tr��ng");
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		nJunGongAward = 0;
		Msg2Player("Hi�u qu� m�t n� Gi�n �i�p: B�n kh�ng nh�n ���c qu�n c�ng");
	end;
	nCurRankPoint = BT_GetData(PT_RANKPOINT);	--��ȡ˥����ľ���
	if nLastCamp == SONG_ID then
		BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
	else
		BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	Msg2Player("B�n nh�n ���c "..tCampNameZ[nLastCamp].."Ph��ng "..nJunGongAward.." �i�m c�ng tr�ng");
	--���ֹ�ѫ
	if nLastBattle ~= MAINBATTLE_ID then	--�����Сս��
		if nLastCamp == nLastResult then
			merit_SmallBattle(1, nType);
		else
			merit_SmallBattle(0, nType);
		end
	else
		if nLastCamp == nLastResult then
			merit_BigBattle(1, nType);
		else
			merit_BigBattle(0, nType);
		end
	end
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
				"Ra kh�i/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: B�n tham gia chi�n tr��ng phe ��i ph��ng, tr�c ti�p nh�n th��ng s� b� kh�u tr� �i�m qu�n c�ng, c� th� s� d�ng <color=yellow>m�t n� Gi�n �i�p<color> l�m qu�n c�ng b�n b� kh�u tr� th�nh 0. N�u b�n v�n mu�n nh�n ph�n th��ng h�y ch�n x�c nh�n, n�u b�n mu�n suy ngh� th�m hay ch�n R�i kh�i.",getn(selTab),selTab);
end;

function assess_rank()
	local selTab = {
			"Ta mu�n nh�n qu�n h�m qu�n c�ng tu�n n�y/battle_shouxian",
			"��i m�i qu�n h�m/update_cur_rank",
			"Quay l�i n�i dung tr��c./main",
			"K�t th�c ��i tho�i/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i mu�n tham gia trao qu�n h�m tu�n n�y �?",getn(selTab),selTab);
end;

function battle_regular_award()
	local selTab = {
				"��i trang b� chi�n tr��ng/BTA_Main",
				"Ta mu�n ��i 100000 �i�m t�ch l�y l�y H� y c�a T�ng Ki�m c�p 70/want_cangjian_equip",
				"Ta mu�n ��i 30000 �i�m t�ch l�y l�y L�nh b�i bang h�i/want_ling_pai",
				"Ta mu�ni 1000 �i�m t�ch l�y l�y �i�m kinh nghi�m/want_exp_award",
				"Quay l�i n�i dung tr��c./main",
				"K�t th�c ��i tho�i/nothing",
				}
	if IB_VERSION == 1 then	--IB�汾û�л��ֻ�װ�������顢�������ƽ���
		tremove(selTab,2);
		tremove(selTab,3);
--		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i mu�n ��i ph�n th��ng n�o?",getn(selTab),selTab);
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

function change_camp()
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 070920 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Th�i gian ��i phe mi�n ph� �� qua, c�c v� ��i hi�p h�y c�n tr�ng khi ch�n phe!");
		return 0;
	end;
	if BT_GetData(PT_CHANGE_CAMP_COUNT) >= MAX_CHANGE_CAMP then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: B�n �� ��i qu�n c�ng <color=yellow>"..MAX_CHANGE_CAMP.."<color> l�n, kh�ng th� ��i ti�p.");
		return 0;
	end;
	local selTab = {
				"T�ng/#change_camp_confirm(1)",
				"Li�u/#change_camp_confirm(2)",
				"Ta suy ngh� l�i/nothing",
				}
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	if nJunGong < 0 then
		szStr = "B�n �ang thu�c phe Li�u, qu�n c�ng hi�n t�i:"..abs(nJunGong)..".";
	elseif nJunGong > 0 then
		szStr = "B�n �ang thu�c phe T�ng, qu�n c�ng hi�n t�i:"..abs(nJunGong)..".";
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu�n c�ng hi�n t�i c�a b�n l� 0, kh�ng c�n ph�i chuy�n qu�n c�ng.");
		return 0;
	end;
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	Say("<color=green>"..g_sNpcName.."<color>: "..szStr.."Ng��i mu�n c�ng hi�n cho phe n�o? <color=yellow>Tr��c 20/9<color> ta c� th� gi�p ng��i ��i qu�n c�ng mi�n ph� 3 l�n. Hi�n gi� ng��i c� th� chuy�n ��i qu�n c�ng <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount).."<color> l�n.",getn(selTab),selTab);
end;

function change_camp_confirm(nCamp)
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	if nJunGong <= 0 then
		if nCamp == LIAO_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i �� l� T��ng s� phe Li�u, kh�ng c�n chuy�n ��i qu�n c�ng!");
			return 0;
		end;
		szStr = "B�n �� ��i sang phe T�ng, qu�n c�ng c�a b�n l�: <color=yellow>"..abs(nJunGong).."<color>. B�n c�n <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color> l�n ��i phe mi�n ph�";
	elseif nJunGong > 0 then
		if nCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i �� l� T��ng s� phe T�ng, kh�ng c�n chuy�n ��i qu�n c�ng!");
			return 0;
		end;	
		szStr = "B�n �� ��i sang phe Li�u, qu�n c�ng c�a b�n l�: <color=yellow>"..abs(nJunGong).."<color>. B�n c�n <color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color> l�n ��i phe mi�n ph�";
	end;
	BT_SetData(PT_RANKPOINT,-nJunGong);
	BT_SetData(PT_CHANGE_CAMP_COUNT,nChangeCampCount+1);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>: "..szStr);
end;
