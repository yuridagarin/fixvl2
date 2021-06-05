--��̳�ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {
		"V�o c�a �i ng�u nhi�n/rand_join_copy",
		"\n T�i h� ch� xem qua th�i/do_nothing",
	}
	Say("C�a �i c� nh�n c� th� khi�u chi�n, ng��i ch�i s� d�ng 1 Ma Th�ch tr�n T� ��n c� th� ���c ng�u nhi�n chuy�n ��n c�c �i�m tr�n nh�n kh�c, tham gia ng�u nhi�n c�c tr� ch�i nh�. M�i nh�n v�t m�i ng�y c� th� tham gia c�a �i nh� 8 l�n.", getn(tSay), tSay);
end

function rand_join_copy()
	local nIndex = random(4);
	if nIndex == 1 then
		repair_real();
	elseif nIndex == 2 then
		demon_bet();
	elseif nIndex == 3 then
		restart_real();
	elseif nIndex == 4 then
		protect_real();
	end
end

function check_condition()
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		return 0;
	end
	if gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) >= ZQ_JOIN_GAME_TIMES_MAX then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t c� th� tham gia %d l�n c�a �i nh�.", ZQ_JOIN_GAME_TIMES_MAX))
		return 0;
	end
	if GetItemCount(2, 1, 30481) < 1 then
		Talk(1,"","S� l��ng Ma Th�ch trong h�nh trang kh�ng ��");
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	return 1;
end

function repair_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1525) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1525)");
				return 0;
			end
			SetPos(1606,3308);
			--��ս��״̬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Tu s�a phong �n tr�n linh, gi�p c� ta t�m �� nguy�n li�u th�ch h�p trong th�i gian ch� ��nh (nguy�n li�u r�i r�i r�c xung quanh c�c �i�m)");
		end
	end
end

function demon_bet()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1526) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1526)");
				return 0;
			end
			SetPos(1922,3681);
			--��ս��״̬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 23, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Ch�i o�n t� t� v�i Ma H�a Tr�n Linh, ch�i th�ng s� nh�n ph�n th��ng t�ch l�y, kh�ng gi�i h�n s� l�n o�n t� t�, ch�i thua s� b� tr�ng th��ng tr� v� tr�n doanh.")
		end
	end
end

function restart_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1527) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1527)");
				return 0;
			end
			SetPos(1576,3524);
			--��ս��״̬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 24, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","T�ng c�ng c� 8 �i�m phong �n tr�n b�n ��, kh�i ��ng 3 �i�m theo y�u c�u, tr�n �i�m phong �n c� c� quan th� v�, t� v�ng th� kh�i ��ng th�t b�i")
		end
	end
end

function protect_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1528) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1528)");
				return 0;
			end
			SetPos(1877,3498);
			--����ս��״̬
			SetFightState(0);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 30, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Ti�u di�t qu�i trong th�i gian ch� ��nh, ti�u di�t c�ng nhi�u, ph�n th��ng c�ng cao");
		end
	end
end

function do_nothing()
end
