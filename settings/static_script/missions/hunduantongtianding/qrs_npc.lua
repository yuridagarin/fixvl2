Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\missions\\hunduantongtianding\\entrynpc.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

g_NpcName = "<color=green> Th�nh n� Nh�m Doanh Doanh<color>:"

function ttd_entry_npc_main()
	T1 = {};
	T2 = {};
	T3 = {};
	T4 = {};
	
	T1.msg = g_NpcName.."Th�nh N� Nh�t Nguy�t Th�n Gi�o, Nh�m Doanh Doanh �i n� Nh�m Ng� H�nh. H�m nay t� t�p c�c v� ��ng ��o v� l�m t�i ��y c�ng x�ng l�n Th�ng Thi�n Huy�n C�nh, v� s� b�o v�t C� Luy�n Th� S� �� l�i tr�n Th�ng Thi�n Huy�n C�nh t�i h� kh�ng l�y m�t xu, n�u t�m ���c cha, t�i h� xin bi�u t�ng cho c�c v� ��ng ��o.";
	T1.sel = {
		{"T�i h� mu�n tham gia H�n �o�n Th�ng Thi�n Huy�n C�nh","qrs_talk_1"},
		{"�i�u ki�n tham gia H�n �o�n Th�ng Thi�n ��nh",T2},
		{"Nhi�m v� ng�y Th�ng Thi�n Huy�n C�nh",T3},
		{"Nhi�m v� tu�n Th�ng Thi�n Huy�n C�nh",T4},
		{"��i ph�n th��ng", "OnOpenShopGroup1"},
		{"K�t th�c ��i tho�i","nothing"},
	};
	
	T2.msg = g_NpcName.."Chuy�n �i Th�ng Thi�n ��nh th�p t� nh�t sinh, c�c v� nh� c�n th�n. �i�u ki�n v�o nh� sau: \n ph�i t� ��i 5-8 th�nh vi�n; \n    h� ph�i#5;\n   c�p �� t�t c� th�nh vi�n t� ��i #lv80;  ";
	T2.sel = {
		{"tr� l�i",T1},
		{"K�t th�c ��i tho�i","nothing"},
	};
	
	T3.msg = g_NpcName.."M�i ng�y ch� c� th� ho�n th�nh 1 l�n, ph�n th��ng ch�a nh�n sau khi ho�n th�nh s� kh�ng thi�t l�p l�i. \n    Nhi�m v� th�ng quan Th�ng Thi�n Huy�n C�nh: <color=green>4.000.000 kinh nghi�m, C� Linh Th�ch x 4<color>, \n    Nhi�m v� 1 l�n l�t b�i thu ph�: <color=green>5.000.000 kinh nghi�m, 3 V�ng, C� Linh Ng�c x 1<color>;";
	T3.sel = {
		{"\n Th�ng quan 1 l�n Th�ng Thi�n Huy�n C�nh(%s)","tthj_daily_task"},
		{"\n �i l�t b�i 1 l�n (%s)","fanpai_daily_task"},
		{"\n Ph�n h�i",T1},
		{"K�t th�c ��i tho�i","nothing"},
	}
	
	T4.msg = g_NpcName.."M�i tu�n ch� c� th� ho�n th�nh 1 l�n, ph�n th��ng ch�a nh�n sau khi ho�n th�nh s� kh�ng thi�t l�p l�i. \n   Ho�n th�nh 4 l�n nhi�m v� Th�ng Thi�n Huy�n C�nh: <color=green>12.000.000 kinh nghi�m, C� Linh Ng�c x 2<color>; \n  Nhi�m v� l�t b�i c�ng d�n ��n 15 l�n : <color=green>30.000.000 kinh nghi�m, C� Linh Ng�c x 7<color>;";
	T4.sel = {
		{"\n Th�ng quan 4 l�n Th�ng Thi�n Huy�n C�nh (%s)","tthj_week_task"},
		{"\n �i l�t b�i 15 l�n","fanpai_week_task"},
		{"\n Ph�n h�i",T1},
		{"K�t th�c ��i tho�i","nothing"},
	}
	
	local str1 = return_status(1);
	local str2 = return_status(5);
	local str3 = return_status(2);
	local str4 = return_status(6);
	T3.sel[1][1] = format(T3.sel[1][1],str1);
	T3.sel[2][1] = format(T3.sel[2][1],str2);
	T4.sel[1][1] = format(T4.sel[1][1],str3);
	T4.sel[2][1] = format(T4.sel[2][1],str4);
	
	if 1 == IsTongTianHuanJingMissionSystemOpen() then
		temp_Talk(T1);
	else
		local strtab = {
    		"K�t th�c ��i tho�i/nothing",
    		}
    	Say(g_NpcName..format("L�i v�o �i %s�� ��ng l�n sau h�y ��n m�!", "H�n �o�n Th�ng Thi�n Huy�n C�nh"),
    		getn(strtab),
    		strtab)
	end
end

function qrs_talk_1()
	Say(g_NpcName.."T�i h� mu�n tham gia H�n �o�n Th�ng Thi�n Huy�n C�nh!",
		2,
		"\n v�o Th�ng Thi�n Huy�n C�nh/qrs_talk_1_1",
		"\nK�t th�c ��i tho�i/nothing")
end

function qrs_talk_1_1()
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."��i tr��ng m�i c� th� th�c hi�n thao t�c v�o �i")
		return 0;
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."H�y tri�u t�p h�o h�u c�ng v��t �i �i!");
		return 0;
	end
	if qrs_check() == 1 then
		_stat_when_open_mission()
		_op_on_team(_stat_on_player_when_open_misson)
		enter(1);
		gf_WriteLogEx("tongtian mission", format("team enter mission member count is %d", GetTeamSize()));
	end
end

tState = {}
function qrs_check()
---�ȼ���lv80
---��������
---��ӽ��룬��ӳ�Ա5��
---��������5
	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.count = 0;
	tState.diffMap = {};
	tState.BaiTan = {};

	local nMapID = GetWorldPos();
	gf_TeamOperateEX(qrs_checkTeam,nMapID);

	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red> th�nh vi�n ch�a ��t c�p �� 80:  <color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
		end
	end
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>th�nh vi�n ch�a gia nh�p h� ph�i:    <color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	local nRouteCount = 0;
	for i = 1, getn(tState.route) do
		if tState.route[i] and tState.route[i] > 0 then
			nRouteCount = nRouteCount + 1;
		end
	end
	if nRouteCount < 5 then
		nResult = 0;
		msg = msg .. "\n<color=red> h� ph�i trong t� ��i kh�ng �� 5<color>\n";
	end
	if tState.count < 5 then
		nResult = 0;
		msg = msg .. "\n<color=red> T� ��i �� 5 th�nh vi�n m�i c� th� v�o <color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>th�nh vi�n kh�ng n�m trong b�n �� n�y:     <color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.BaiTan) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>th�nh vi�n kh�ng � tr�ng th�i b�y b�n: <color>";
		for i = 1, getn(tState.BaiTan) do
			msg = msg .. tState.BaiTan[i] .. " ";
		end
	end
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function qrs_checkTeam(nMapID)
	if GetLevel() < 80 then
		tinsert(tState.lv, GetName());
	end
	local nRoute = GetPlayerRoute();
	tState.route[nRoute] = (tState.route[nRoute] or 0) + 1;
	if gf_CheckPlayerRoute() ~= 1 then
		tinsert(tState.noRoute, GetName());
	end
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if IsStalling() == 1 then
		tinsert(tState.BaiTan, GetName());
	end
end

function nothing()
end

