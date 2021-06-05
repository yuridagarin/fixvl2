--���ɴ��Ҷ�����npc
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

g_TimeLimit = 0;
g_TimeLimitOther = 0;
g_tTongRank = {};

--�μӰ��ɴ��Ҷ�
function tm_join_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"Lo�n chi�n bang h�i l� g�/tm_what_is_tong_melee",
		"�i�u ki�n tham gia lo�n chi�n bang h�i/tm_join_condition",
		"Quy t�c lo�n chi�n bang h�i/tm_rule_tong_melee",
		"\n Ph�n h�i/tm_dialog_return",
		"Ra kh�i/nothing"
	}
	local nRet = IsPlayerQueuing(1);
	if not nRet  then return 0; end
	if nRet == 1 then
		tinsert(tSay, 1, "Tho�t ra x�p h�ng bang h�i lo�n chi�n/tm_cancle_tong_melee_now");
	else
		tinsert(tSay, 1, "Tham gia lo�n chi�n bang h�i/tm_join_tong_melee_now");
	end
	Say(TM_TONG_AD_NPC.."T� Linh Th�n Th� l� �� r�n luy�n t� c�ch c�a m�i ng��i, c�c bang h�i l�ng danh thi�n h� ��n �� tham gia lo�n chi�n, ��ng th�i c�ng ki�m tra th�c l�c c�a c�c bang h�i.", getn(tSay), tSay);
end

--��ȡ���ɴ��Ҷ�����
function tm_award_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"Nh�n th��ng m�i tr�n/tm_get_every_match_award",
		"L�nh ph�n th��ng bang h�i/tm_get_tong_award",
		"Xem x�p h�ng hi�n nay/tm_look_for_rank",
		"\n T�i h� ch� xem qua th�i/nothing",
	}
	Say(TM_TONG_AD_NPC.."T� Linh Th�n Th� l� �� r�n luy�n t� c�ch c�a m�i ng��i, c�c bang h�i l�ng danh thi�n h� ��n �� tham gia lo�n chi�n, ��ng th�i c�ng ki�m tra th�c l�c c�a c�c bang h�i.", getn(tSay), tSay);
end

--����
function tm_dialog_return()
	SetPlayerScript("\\script\\�����ͼ\\������䳡\\npc\\tong_ambassagor.lua");
	SendScript2VM("\\script\\�����ͼ\\������䳡\\npc\\tong_ambassagor.lua", "main()");
end

function get_join_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 1300 then
		return 1
	else
		return 2
	end
end
function get_delete_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 2215 then
		return 1
	else
		return 2
	end
end

--�μӰ����Ҷ�
function tm_join_tong_melee_now()
	if tm_checkJoinCondition() ~= 0 then
		AddPlayerToQueuing(get_join_que_id(), 1);
	end
end

--ȡ�������Ҷ�
function tm_cancle_tong_melee_now()
	local nRet = IsPlayerQueuing(1);
	if nRet and nRet == 1 then
		DelPlayerFromQueuing(get_delete_que_id());
	end
end

--ʲô�ǰ����Ҷ�
function tm_what_is_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."T� Linh Th�n Th� l� �� r�n luy�n t� c�ch c�a h�, ki�m tra l�c chi�n ��u c�a bang h�i, c�c bang h�i l�ng danh thi�n h� c� th� tham gia lo�n chi�n. To�n b� ho�t ��ng l� c�c bang h�i tham gia, m�i bang h�i s� ch�n ra 8 ng��i tham gia, ho�t ��ng di�n ra v�o l�c 19:45 th� 6, th� 7, ch� nh�t tham gia b�o danh, 20:00 ch�nh th�c b�t ��u.";
	tSay.sel = {
		{"\n Ph�n h�i", "tm_join_tong_melee"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

--�μ�������ʲô
function tm_join_condition()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."Ch� c�n nh�n v�t ��t ��n c�p 90 v� h�c h�t k� n�ng c�p 55 , <color=red> ng��i ch�i �� gia nh�p bang h�i <color> th� c� th� tham gia. Nh�ng ch� c� <color=red> qu�n l� bang h�i <color> l�m ��i tr��ng ��a t� ��i �i v�o m�i ���c!";
	tSay.sel = {
		{"\n Ph�n h�i", "tm_join_tong_melee"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end


function tm_rule_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."Sau khi lo�n chi�n bang h�i b�t ��u, ��i tr��ng c� th� ph�n ph�i Th�n Th�, giao cho 1 th�nh vi�n b�o v�. ��nh b�i th�nh vi�n bang h�i kh�c s� nh�n ���c �i�m linh l�c th�n th�, ��nh b�i ng��i b�o v� th�n th�, c� th� nh�n ���c c�ng nhi�u �i�m linh l�c th�n th�. B� t� vong s� b� tr� �i�m linh l�c th�n th� c�a bang h�i m�nh, khi �i�m linh l�c th�n th� ��t ��n gi� tr� nh�t ��nh, th�n th� s� th�ng c�p, mang ��n nhi�u l�i �ch cho bang h�i. ��ng th�i b� tr� qu� nhi�u �i�m linh l�c th�n th� s� l�m cho th�n th� b� h� c�p. Cu�i c�ng c�n c� v�o �i�m linh l�c bang h�i �� ti�n h�nh x�p h�ng cao th�p v� l�m �i�u ki�n �� ph�n ��nh th�ng b�i.";
	tSay.msg = tSay.msg..format("( m�t bang h�i nhi�u nh�t ch� ���c 3 th�nh vi�n tham gia)",3);
	tSay.sel = {
		{"\n Ph�n h�i", "tm_join_tong_melee"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function tm_get_every_match_award()
	local nExp = GetTask(TM_TASKID_EXP);
	local nYinJuan = gf_GetMyTaskByte(TM_TASKID_YINJUAN, 1, 2);
	if nExp == 0 and nYinJuan == 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Ng��i �� nh�n ph�n th��ng m�i tr�n lo�n chi�n bang h�i, ho�c l� ch�a tham gia lo�n chi�n bang h�i l�n n�o h�t!");
		return 0;
	end
	if nExp > 0 then
		gf_Modify("Exp", nExp);
		SetTask(TM_TASKID_EXP, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
	if nYinJuan > 0 then
		yinquanapi_limittop_award_yinquan(nYinJuan)
		gf_SetMyTaskByte(TM_TASKID_YINJUAN, 1, 2, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
end

function tm_look_for_rank()
	local nTime = GetTime();
	DebugOutput(nTime - g_TimeLimit)
	--5min����һ��
	if nTime - g_TimeLimit < 5*60 then
		tm_look_for_rank_local();
	else
		local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
		s:apply2(tm_look_for_rank_cb);
		g_TimeLimit = nTime;
	end
end

function tm_look_for_rank_local()
	--��ѯ����
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in g_tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	--��ʾ����
	local msg;
	if nRank <= 0 then
		msg = TM_TONG_AD_NPC.."S� li�u x�p h�ng lo�n chi�n bang h�i c�a qu� bang hi�n t�i t�m th�i ch�a c�";
	elseif nRank > TM_TONG_RANK_MAX then
		msg = TM_TONG_AD_NPC..format("X�p h�ng lo�n chi�n bang h�i c�a qu� bang hi�n t�i n�m ngo�i %d top", TM_TONG_RANK_MAX);
	else
		msg = TM_TONG_AD_NPC..format("Tu�n tr��c qu� bang nh�n ���c <color=green>%d<color> �i�m t�ch l�y bang h�i, lo�n chi�n bang h�i x�p h�ng  <color=green>%d<color>!", nSorce, nRank);
	end	
	local nIndex = 1;
	local tSay = {}
	for i = 1, getn(g_tTongRank) do
		local v = g_tTongRank[i];
		if v and type(v) == "table" and getn(v) == 3 then	
			if v[3] > TM_TONG_RANK_MAX then
				break;
			end	
			tSay[nIndex] = format("H�ng th� %d, bang h�i [%s], �i�m t�ch l�y [%d]", v[3], v[1], v[2]);
			nIndex = nIndex + 1;
		end
	end
	local suSay = {};
	suSay.msg = msg;
	suSay.sel = {};
	for i =1, getn(tSay) do
		tinsert(suSay.sel, {tSay[i], "nothing"});
	end
	tinsert(suSay.sel, {"T�i h� ch� xem qua th�i", "nothing"});
	temp_Talk(suSay);
	return 1;
end

function tm_look_for_rank_cb(nCount, sdb)
	DebugOutput("tm_look_for_rank_cb", nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Nh�n s� li�u x�p h�ng bang h�i lo�n ��u li�n server b� l�i");
		return 0;
	end
	--��������
	local tempData;
	local nLastSocre = -1;
	local nRealRank = 0;
	local nIndex = 1;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			DebugOutput(tostring(tempData[1]), tonumber(tempData[2]), nRealRank);
			g_tTongRank[nIndex] = {tostring(tempData[1]), tonumber(tempData[2]), nRealRank};
			nIndex = nIndex + 1;
			nLastSocre = tempData[2];
		end
	end
	tm_look_for_rank_local()
end

function tm_get_tong_award()
	local nTime = GetTime()
	DebugOutput(nTime - g_TimeLimitOther)
	if nTime - g_TimeLimitOther < 90 then
		Talk(1,"","Server �ang b�n, xin ch� m�t ch�t th� l�i!")
		return
	end
	local nDuty = GetTongDuty();
	if nDuty <= 0 or nDuty >= 4 then
		Talk(1,"",TM_TONG_AD_NPC.."Ch� c� ng��i qu�n l� bang h�i m�i nh�n th��ng ph�n th��ng bang h�i ���c!")
		return 0;
	end
	local today = Date();
	local wDay = today:week();
	if wDay == 0 or wDay == 5 or wDay == 6 then
		Talk(1,"",TM_TONG_AD_NPC.."Ph�n th��ng bang h�i ch� c� th� nh�n t� th� 2 ��n th� 5 h�ng tu�n!")
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:apply2(_tm_get_tong_award)
	g_TimeLimitOther = nTime;
end

function _tm_get_tong_award(nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for i = 1, nCount do
		local tData = sdb[i-1];
		DebugOutput("TM_RANK_INSOURCEREALM", tData[1], tData[2], tData[3], tData[4], tData[5]);
		if tData and tostring(RealmTongName) == tostring(tData[1]) and 1 == tonumber(tData[2]) then
			Say(TM_TONG_AD_NPC..format("Tu�n tr��c qu� bang nh�n ���c %s �i�m t�ch l�y bang h�i, lo�n chi�n bang h�i x�p h�ng th� %d, ph�n th��ng bang h�i �� ���c <color=red>%s<color> nh�n th��ng!", 
				tData[4], tData[3], tData[5]), 0);
			return 0;
		end
	end
	local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
	s:apply2(_tm_get_tong_award_cd)
end

function _tm_get_tong_award_cd(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Nh�n s� li�u x�p h�ng bang h�i lo�n ��u li�n server b� l�i");
		return 0;
	end
	--��������
	local tempData;
	local tTongRank = {}
	local nLastSocre = -1;
	local nRealRank = 0;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			tinsert(tTongRank, {tostring(tempData[1]), tonumber(tempData[2]), nRealRank})
			nLastSocre = tempData[2];
		end
	end
	--��ѯ����
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	if nRank <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."S� li�u x�p h�ng lo�n chi�n bang h�i c�a qu� bang hi�n t�i t�m th�i ch�a c�");
		return 0;
	end
	if nRank > TM_TONG_RANK_MAX then
		Talk(1,"",TM_TONG_AD_NPC..format("X�p h�ng lo�n chi�n bang h�i c�a qu� bang hi�n t�i n�m ngo�i %d top", TM_TONG_RANK_MAX));
		return 0;
	end
	local msg = format("Tu�n tr��c qu� bang nh�n ���c <color=green>%d<color> �i�m t�ch l�y bang h�i, lo�n chi�n bang h�i x�p h�ng  <color=green>%d<color>!", nSorce, nRank);
	Say(TM_TONG_AD_NPC..msg, 2, format("Nh�n l�y./#_tm_get_tong_award_now(%d, %d)", nSorce, nRank), "T�i h� ch� xem qua th�i/nothing");
	return 1;
end

function _tm_get_tong_award_now(nSorce, nRank)
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:reflash();
	s:apply2(callout(_tm_get_tong_award_now_cb, nSorce, nRank));
end

function _tm_get_tong_award_now_cb(nSorce, nRank, nCount, sdb)
	DebugOutput("_tm_get_tong_award_now_cb", nSorce, nRank, nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	local tData = sdb[RealmTongName];
	DebugOutput(RealmTongName, tData, tData[1], tData[2], tData[3], tData[4], tData[5])
	if tData[1] and tData[1] ~= 0 then
		Talk(1,"",TM_TONG_AD_NPC..format("Th�nh vi�n bang h�i %s �� nh�n th��ng tr��c ng��i m�t b��c r�i!", tData[4]));
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s[RealmTongName] = {"ddds", 1, nRank, nSorce, GetName()};
	--������----------------
	gf_AddItemEx2({2,1,30614,TM_TONG_AWARD[nRank][1]}, "L�i H� Tinh Ph�ch", "Lo�n chi�n bang h�i", "Ph�n th��ng bang h�i", 0, 1);
	AddRuntimeStat(12, 3, 0, TM_TONG_AWARD[nRank][1]);
	if TM_TONG_AWARD[nRank][2] == 2 then
		gf_AddItemEx2({2,1,30618,1}, "Chi�n k� t� linh bang h�i cao c�p", "Lo�n chi�n bang h�i", "Ph�n th��ng bang h�i", 0, 1);
	elseif TM_TONG_AWARD[nRank][2] == 1 then
		gf_AddItemEx2({2,1,30617,1}, "Chi�n K� T� Linh Bang H�i", "Lo�n chi�n bang h�i", "Ph�n th��ng bang h�i", 0, 1);
	end
	return 1;
end