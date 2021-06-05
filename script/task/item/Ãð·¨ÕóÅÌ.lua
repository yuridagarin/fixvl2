Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

Mfzp_Npc_index_1 = 0;
Mfzp_Npc_index_2 = 0;
Mfzp_Npc_index_3 = 0;
Mfzp_Npc_index_4 = 0;

function OnUse(nIndex)
	if tGtTask:check_cur_task(80) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2,0,30050) >= 1 then
		return 0;
	end
	if GetTrigger(1520*2) ~= 0 or GetTrigger(3008*2) ~= 0 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 509 then
		Talk(1,"","N�i n�y kh�ng th� d�ng ��o c� n�y");
		return 0;
	end
--	if GetMapTaskTemp(nMap,Map_Glb_Valve9) >= 1 then
--		Talk(1,"","�Ѿ�����������������Ժ�����");
--		return 0;
--	end
	if (GetNpcName(Mfzp_Npc_index_1) == "�ng Linh") or
			(GetNpcName(Mfzp_Npc_index_2) == "Long Linh") or
			(GetNpcName(Mfzp_Npc_index_3) == "Ph��ng Linh") or
			(GetNpcName(Mfzp_Npc_index_4) == "H� Linh") then
		Talk(1,"","�� c� ng��i l�m nhi�m v� n�y, h�y ch� ch�t");
		return 0;
	end
	RemoveTrigger(GetTrigger(1520*2));
	RemoveTrigger(GetTrigger(3008*2));
--	SetMapTaskTemp(nMap,Map_Glb_Valve9,1);
	NewWorld(509,1456,3371);
	SetTask(Task_id_015,0);
	CastState("state_dispear",100,18*40);
	CreateTrigger(1,1520,1520*2);
	ContinueTimer(GetTrigger(1520*2));
	CreateTrigger(3,3008,3008*2);
	DoWait(103,104,40);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),936,0,0,18*5);
	SetItemUseLapse(nIndex,18*60*3);
	local npcIndex = CreateNpc("��i tho�i v�i Trung �ng","�ng Linh",509,1453,3368);
	Mfzp_Npc_index_1 = npcIndex;
	SetNpcLifeTime(npcIndex,50);
end

function deal_rezult()
	--if DelItem(2,0,30049,GetItemCount(2,0,30049)) == 1 then
	if GetTask(Task_id_015) >= 40 then
		if BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("Gh�p th�nh c�ng T� Linh Di�t Ph�p Tr�n B�n");
		end
	else
		Msg2Player("Gh�p T� Linh Di�t Ph�p Tr�n B�n th�t b�i");
	end
	--end
end

function OnTimer()
	SetTask(Task_id_015,GetTask(Task_id_015)+1);
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 509 then
		SetTask(Task_id_015,45);
	end
	local nTimes = GetTask(Task_id_015);
--	if nTimes == 1 then
--		local npcIndex = CreateNpc("�Ի���ӥ","ӥ��",509,1453,3368);
--		Mfzp_Npc_index_1 = npcIndex;
--		SetNpcLifeTime(npcIndex,50);
--	end
	if nTimes == 2 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,904,0,0,18*3);
	end
	if nTimes == 3 then
		NpcChat(Mfzp_Npc_index_1,"G�n ��y b�n r�n tr�ng b� b�n �c �� s�t h�i b�ch t�nh.");
	end
	if nTimes == 5 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,956,0,0,18*5);
		NpcChat(Mfzp_Npc_index_1,"T�i h� �ang ��nh ngh� ng�i ch�t, t�i sao c�c h� ��n l�m phi�n v�y?");
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),959,0,0,18*35);
	end
	if nTimes ==  7 then
		NpcChat(Mfzp_Npc_index_1,"T�i h� s� khi�n c�c h� d� s�ng d� ch�t.");
	end

	if nTimes == 11 then
		local npcIndex = CreateNpc("��i tho�i v�i Trung Long","Long Linh",509,1459,3374);
		Mfzp_Npc_index_2 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 12 then
		SetCurrentNpcSFX(Mfzp_Npc_index_2,904,0,0,18*3);
	end
	if nTimes == 13 then
		NpcChat(Mfzp_Npc_index_2,"C�c h� l� ai? t�i h� v� c�c h� kh�ng th� kh�ng o�n, t�i sao b�t t�i h� �i?")
	end
	if nTimes == 15 then
		SetCurrentNpcSFX(Mfzp_Npc_index_2,955,0,0,18*5);
		NpcChat(Mfzp_Npc_index_2,"T�i h� ��nh �i c�u d�n ch�ng nh�ng gi� kh�ng k�p n�a r�i.")
	end
	if nTimes == 17 then
		NpcChat(Mfzp_Npc_index_2,"Ng��i g�y ra bao �i�u �c, nh�t ��nh s� b� b�o �ng.");
	end

	if nTimes == 21 then
		local npcIndex = CreateNpc("��i tho�i Trung Ph��ng","Ph��ng Linh",509,1459,3368);
		Mfzp_Npc_index_3 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 22 then
		SetCurrentNpcSFX(Mfzp_Npc_index_3,904,0,0,18*3);
	end
	if nTimes == 23 then
		NpcChat(Mfzp_Npc_index_3,"T�i h� lu�n mu�n b�o v� b� t�nh, t�i sao c�c h� t�n nh�n nh� th�, c��p �i t� do c�a t�i h�.");
	end
	if nTimes == 26 then
		SetCurrentNpcSFX(Mfzp_Npc_index_3,958,0,0,18*5);
		NpcChat(Mfzp_Npc_index_3,"C�u xin c�c h�, ��ng b�t t�i h� �i, ��ng b�t t�i h� �i�");
	end

	if nTimes == 31 then
		local npcIndex = CreateNpc("��i tho�i Trung H�","H� Linh",509,1453,3374);
		Mfzp_Npc_index_4 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 32 then
		SetCurrentNpcSFX(Mfzp_Npc_index_4,904,0,0,18*3);
	end
	if nTimes == 33 then
		NpcChat(Mfzp_Npc_index_4,"C�c v� anh h�ng h�o ki�t �ang chi�n ��u anh d�ng tr�n chi�n tr��ng, t�i h� v�n h�i ng� c�ng ch� v�, nh�ng c�c h� �� chia c�t.");
	end
	if nTimes == 35 then
		SetCurrentNpcSFX(Mfzp_Npc_index_4,957,0,0,18*5);
		NpcChat(Mfzp_Npc_index_4,"Nh�ng c�c h� �� chia c�t, kh�ng bi�t h� s�ng ch�t ra sao.");
	end
	if nTimes == 37 then
		NpcChat(Mfzp_Npc_index_4,"H�y ��n m�ng �i!");
	end
	if nTimes == 38 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_2,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_3,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_4,913,0,0,18*3);
	end
	if nTimes == 40 then
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),912,0,0,18*5);
--		SetMapTaskTemp(nMap,Map_Glb_Valve9,0);
--		RemoveTrigger(GetRunningTrigger());
--		RemoveTrigger(GetTrigger(3008*2));
--		SetNpcLifeTime(Mfzp_Npc_index_1,0);
--		SetNpcLifeTime(Mfzp_Npc_index_2,0);
--		SetNpcLifeTime(Mfzp_Npc_index_3,0);
--		SetNpcLifeTime(Mfzp_Npc_index_4,0);
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
	end
	if nTimes > 40 then
--		SetMapTaskTemp(509,Map_Glb_Valve9,0);
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3008*2));
		SetNpcLifeTime(Mfzp_Npc_index_1,0);
		SetNpcLifeTime(Mfzp_Npc_index_2,0);
		SetNpcLifeTime(Mfzp_Npc_index_3,0);
		SetNpcLifeTime(Mfzp_Npc_index_4,0);
		if nMap == 509 and BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("Gh�p th�nh c�ng T� Linh Di�t Ph�p Tr�n B�n");
		end
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
	end
end

function Leave_Game()
--		SetMapTaskTemp(509,Map_Glb_Valve9,0);
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(1520*2));
		SetNpcLifeTime(Mfzp_Npc_index_1,0);
		SetNpcLifeTime(Mfzp_Npc_index_2,0);
		SetNpcLifeTime(Mfzp_Npc_index_3,0);
		SetNpcLifeTime(Mfzp_Npc_index_4,0);
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
end