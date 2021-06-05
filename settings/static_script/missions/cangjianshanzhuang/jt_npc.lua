--�ؽ�����
Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\entrynpc.lua")
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>H�c T�ng Qu�n Nh�t Nguy�t Th�n Gi�o<color>:"

N_JOIN_ENERGY_NEED = 15
N_JOIN_TIANJIAOLING_NEED = 3
T_TIANJIAOLING = {2, 97, 236, "Thi�n Ki�u L�nh"}
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
function join_consume(bTianJiaolingMode, bDelete)
--	if 1 == bDelete then
--		AddRuntimeStat(4,1,bTianJiaolingMode,1)
--	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    		if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    			Msg2Player(format("Tr�n ng��i kh�ng �� %s",T_TIANJIAOLING[4]))
    			return 0
    		end
    		if bDelete and bDelete == 1 then
        		--ɾ����Ʒ
        		if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        			return 0
        		end
        		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        		_stat_when_ib_consume(N_JOIN_TIANJIAOLING_NEED)
    		end
    	else
    		return 0
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
    			local nCur,_ = ModifyEnergy(0, 1)
    			if nCur < N_JOIN_ENERGY_NEED then
    				MU_Msg2Team(format("[%s] tinh l�c kh�ng �� [%d] �i�m", GetName(), N_JOIN_ENERGY_NEED))
    				return 0
    			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
    				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		end
		end
		PlayerIndex = OldPlayerIndex
	end
	return 1
end

function wjz_entry_npc_main()
	if 1 == IsWanJianZhongMissionSystemOpen() then
		local strtab = {
    		"V��t �i th��ng/entry_jingli",
			"V��t �i Thi�n Ki�u/#entry_tianjiaoling(0)",
    		"�i�u ki�n v��t �i/jt_talk_2",
    		"Nhi�m v� ng�y V�n Ki�m Tr�ng/jt_talk_3",
    		"Nhi�m v� tu�n V�n Ki�m Tr�ng/jt_talk_4",
    		"��i ph�n th��ng/OnOpenShopGroup1",
    		"K�t th�c ��i tho�i/do_nothing",
    		}
    	local szMsg = g_NpcName.."Nh�m gi�o ch� c�ng Giang ��i hi�p �� x�ng l�n V�n Ki�m Tr�ng, t�i h� ch� � ��y ngh�nh ��n c�c v� l�n tr� gi�p"
    	szMsg = format("%s\n s� l�u ph�i trong t� ��i c�ng nhi�u gi�i th��ng c�ng t�t", szMsg)
		szMsg = format("%s\nV��t �i th��ng: M�i th�nh vi�n c�n ti�u hao <color=yellow>%d �i�m tinh l�c<color>\nV��t �i Thi�n Ki�u: ��i tr��ng c�n ti�u hao <color=yellow>%d c�i %s<color>"
			, szMsg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
    	Say(szMsg,
    		getn(strtab),
    		strtab)
	else
		local strtab = {
    		"K�t th�c ��i tho�i/do_nothing",
    		}
    	Say(g_NpcName..format("L�i v�o �i %s�� ��ng l�n sau h�y ��n m�!", "V�n Ki�m Tr�ng"),
    		getn(strtab),
    		strtab)
	end
	
end

function entry_jingli()
	jt_talk_1(0)
end
function entry_tianjiaoling(bSure)
	if not bSure or 0 == bSure then
		local tSay = {
				"��ng �/#entry_tianjiaoling(1)",
				"Ta ch� gh� qua th�i/nothing",
				}
			Say(format("D�ng Thi�n Ki�u c�n <color=red>%d c�i %s (C� th� mua trong Ng� C�c)<color> ��ng � kh�ng?",N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
		return
	end
	jt_talk_1(1)
end

function nothing()
end

function jt_talk_1(bTianJiaolingMode)
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."H�y m�i ��i tr��ng ��n. Mu�n v�o �i c�n <color=yellow>s� th�nh vi�n c� h� ph�i ph�i t� 5 tr� l�n.<color>")
		return
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."H�y tri�u t�p h�o h�u c�ng v��t �i �i!");
		return 0;
	end	
	if jt_check() == 1 and join_consume(bTianJiaolingMode, 0) == 1 then
		local nCurMapID = GetWorldPos();
		local nRet = join_consume(bTianJiaolingMode, 1)
		if 1 == nRet then
			local nMapID = tbJZMY:Create();
			mf_SetMissionV(tbJZMY.missionID,tbJZMY.mv19,nCurMapID,nMapID);
			tbJZMY:TeamEnter(nMapID,1);
			gf_WriteLogEx("wanjianzhong mission", format("team enter mission member count is %d", GetTeamSize()));
		
			_stat_when_open_mission(bTianJiaolingMode)
			_op_on_team(_stat_on_player_when_open_misson)
			--cdkey�
			gf_TeamOperateEX(function () 
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(3)");	
			end);
		end
	end		
end

tState = {}
function jt_check()
---�ȼ���lv80
---��������
---��ӽ��룬��ӳ�Ա4��
---��������3
--����������Ҷ�����ӵ��1��ͨ�춥Կʯ(ͨ�춥Կʯ���������ﻻȡ)
--do return 1 end

	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.noTickets = {};
	tState.count = 0;
	tState.diffMap = {};
	
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(jt_checkTeam,nMapID);

	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red>th�nh vi�n ch�a ��t c�p ��:   <color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
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
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>th�nh vi�n ch�a gia nh�p h� ph�i:    <color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	if tState.count < 5 then
		nResult = 0;
		msg = msg .. "<color=red>s� l��ng th�nh vi�n tr�n 5 m�i c� th� v�o<color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>th�nh vi�n kh�ng n�m trong b�n �� n�y:     <color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function jt_checkTeam(nMapID)
	if GetLevel() < 70 then
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
end

function jt_talk_2()
	Talk(1,"main",g_NpcName.."Nh�n s� giang h� c�p 70 tr� l�n �� gia nh�p h� ph�i m�i c� t� c�ch v�o V�n Ki�m Tr�ng. Th�nh vi�n t� ��i v� h� ph�i d��i 5 kh�ng th� v�o �i ���c. ")
end
 
function jt_talk_3()
	local str1 = return_status(3);
	local str2 = return_status(5);
	Say(g_NpcName.."M�i ng�y ch� ���c ho�n th�nh 1 l�n, sau khi ho�n th�nh n�u ch�a nh�n th��ng s� kh�ng b� thi�t l�p l�i.\n    Nhi�m v� v��t �i V�n Ki�m Tr�ng: <color=green>500W Exp, Hu�n Ch��ng Anh H�ng #2<color>;\n    Nhi�m v� l�t b�i thu ph� 1 l�n: <color=green>800W Exp, 30 v�ng, Hu�n Ch��ng Anh H�ng #3<color>;",
		4,
		format("\n Th�ng quan 1 l�n V�n Ki�m Tr�ng (%s)/wjz_daily_task",str1),
		format("\n �i l�t b�i 1 l�n (%s)/fanpai_daily_task",str2),
		"\n Ph�n h�i/main",
		"K�t th�c ��i tho�i/do_nothing")
end

function jt_talk_4()
	local str1 = return_status(4);
	local str2 = return_status(6);
	Say(g_NpcName.."M�i ng�y ch� ���c ho�n th�nh 1 l�n, sau khi ho�n th�nh n�u ch�a nh�n th��ng s� kh�ng b� thi�t l�p l�i.\n    Nhi�m v� v��t �i V�n Ki�m Tr�ng 7 l�n: <color=green>900W Exp, Hu�n Ch��ng Anh H�ng #4<color>;\n    Nhi�m v� l�t b�i thu ph� 15 l�n: <color=green>5000W Exp, Hu�n Ch��ng Anh H�ng #8<color>;",
		4,
		format("\n Th�ng quan 7 l�n V�n Ki�m Tr�ng (%s)/wjz_week_task",str1),
		format("\n �i l�t b�i 15 l�n/fanpai_week_task",str2),
		"\n Ph�n h�i/main",
		"K�t th�c ��i tho�i/do_nothing")
end

function do_nothing()
end

