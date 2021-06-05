Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>Tr�n Linh<color>:"

function main()
	local strtab = {
			"\n r�i �i/wrx_leave_1",
			"\nTa mu�n quay l�i chi�n tr��ng (C�n [Thi�n Ki�u L�nh]x1)/wrx_goto",
			"\n c�c h� l� ai? Sao l�i c�u t�i h�./wrx_who_are_u",
			"\nK�t th�c ��i tho�i/nothing",
		}
	Say(g_NpcName.."��y l� m�t th�t V�n Ki�m Tr�ng, c�c h� b� tr�ng th��ng, t�i h� c�u c�c h� ��n ��y.",
		getn(strtab),
		strtab)
end

function wrx_leave_1()
	local strtab = {
			"\n ��ng n�i nhi�u l�i, t�i h� ph�i �i/wrx_leave_2",
			"\n ng�i quan s�t ch� th�ng quan/nothing",
		};
	Say(g_NpcName.."Thi�u hi�p ��ng t� b�, ��ng ��o v� l�m kh�ng ng�i x��ng r�i m�u �� chi�n ��u v� ch�nh ngh�a, Thi�u hi�p nh�n t�m r�i kh�i sao?",
		getn(strtab),
		strtab)
end

function wrx_who_are_u()
	local strtab = {
			"\n Th�ng Thi�n L�o T� l� ai?/wrx_tongtianlaozu",
			"\n lai l�ch V�n Ki�m Tr�ng ra sao?/wrx_wanjianzhong",
			"\n r�t lui/nothing",
		};
	Say(g_NpcName.."T�i h� l� Tr�n Linh V�n Ki�m Tr�ng Phong �n. T�i h� kh�ng th� ti�p t�c h� v� Phong �n n�a r�i, h�y ng�n ch�n Th�ng Thi�n L�o T� t�i xu�t giang h�.",
		getn(strtab),
		strtab)
end

function wrx_tongtianlaozu()
	local strtab = {
			"\n tr� v� t�ng tr��c/wrx_who_are_u",
			"\n r�t lui/nothing",
		};
	Say(g_NpcName.."Th�ng Thi�n L�o T� v�n l� v� t�n trong C� Thi�n M�n Tr�n, x�ng danh Th�ng Thi�n v� t�n, c�ng 10 �� T� Ki�m Tu, n�m x�a b�  �n Th�i S� �m h�i, Ma Kh� nh�p th�, t�n h�i kh� huy�t h�a th�nh Nh�n Ma, t� x�ng Th�ng Thi�n L�o T�.",
		getn(strtab),
		strtab)
end

function wrx_wanjianzhong()
	local strtab = {
			"\n tr� v� t�ng tr��c/wrx_who_are_u",
			"\n r�t lui/nothing",
		};
	Say(g_NpcName.."H� v� v� t�n bi�n th�nh Nh�n Ma �n th�t u�ng m�u, t�nh kh� k� qu�i. Kh��ng T� Nha ��nh Phong �n C� Thi�n M�n Tr�n.<enter>Th�ng Thi�n Huy�n C�nh trong V�n Ki�m Tr�ng l� m�t trong C� Thi�n M�n Tr�n b� Phong �n. V�n Ki�m Tr�ng kh�ng b� ph� h�y, Th�ng Thi�n L�o T� kh�ng th� tho�t kh�i Th�ng Thi�n Huy�n C�nh s�t h�i sinh linh.",
		getn(strtab),
		strtab)
end

function wrx_leave_2()
	SetCreateTeam(0);
	LeaveTeam();
	
--	local nGoMapID = GetMissionV(tbJZMY.mv19);
--	local t = {
--			[100] = {1505,3111},
--			[200] = {1241,2772},
--			[300] = {1769,3710},
--		};
--	if t[nGoMapID] then
--		NewWorld(nGoMapID,t[nGoMapID][1],t[nGoMapID][2]);
--	else
--		NewWorld(100,t[100][1],t[100][2]);
--	end
	NewWorld(500,1707,3061);
end

function wrx_goto()
	local nCurStage = GetMissionV(MV_STAGE);
	if tFildPos[nCurStage] then
		if DelItem(2, 97, 236,1) == 1 then
			Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
			_stat_when_ib_consume(1)
			gf_WriteLogEx("wanjianzhong mission", "death back to mission IB cost", "", "Thi�n Ki�u L�nh", "2, 97, 236,1");
			RestoreAll();
			ttd_setPos(tFildPos[nCurStage][1],tFildPos[nCurStage][2],1);
		else
			Talk(1,"",g_NpcName.."Thi�n Ki�u L�nh tr�n ng��i kh�ng ��!")
		end
	end
end