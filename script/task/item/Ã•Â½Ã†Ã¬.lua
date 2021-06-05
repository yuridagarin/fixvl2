Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nIndex)
	local i;
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 6017 then
		Talk(1,"","Chi�n k� ch� c� th� s� d�ng tr�n H�c M�c Nhai!");
		return 0;
	end
	if GetTask(Task_id_008) == 2 and tGtTask:check_cur_task(70) == 1 then
		Say("B�n c� mu�n s� d�ng l�i chi�n k� kh�ng?",2,"��ng �/done","Ta ch� ��n xem th�/do_nothing")
	end
	--��ͼս���������ܳ���10��
	if GetMapTaskTemp(nMapId,Map_Glb_Valve) > 30 then
		Talk(1,"","T�ng s� Chi�n K� xu�t hi�n tr�n B�n �� kh�ng th� v��t qu� 10 c�i, h�y ch� m�t ch�t.")
		return 0;
	end
	if GetTask(Task_id_008) == 1 and tGtTask:check_cur_task(70) == 1 then
		if GetTrigger(1518*2) == 0 and GetTask(Task_id_009) ~= 6 then
			--����ս��
			local npcIndex = CreateNpc("Di�t m�n lam",format(" Chi�n K� c�a %s",GetName()),GetWorldPos());
			SetNpcDeathScript(npcIndex,"\\script\\task\\item\\ս��Death.lua");
			local nHp,nHp1 = GetUnitCurStates(npcIndex,1);
			if GetTask(Task_id_013) ~= 0 then
				AddUnitStates(npcIndex,1,GetTask(Task_id_013)-nHp);
			end
			SetTask(Task_id_011,npcIndex);
			SetNpcLifeTime(npcIndex,10*60);
			SetCampToNpc(npcIndex,"camp_enemy");
			SetCampToPlayer("camp_enemy");
			SetTask(Task_id_010,0)		
			CreateTrigger(1,1518,1518*2);
			ContinueTimer(GetTrigger(1518*2));
			SetTask(Task_id_008,2)
			SetMapTaskTemp(nMapId,Map_Glb_Valve,(GetMapTaskTemp(nMapId,Map_Glb_Valve) or 0) + 1);
			CreateTrigger(3,3007,3007*2);
		end
	end
	if GetTask(Task_id_008) == 0 and tGtTask:check_cur_task(70) == 1 then
		Talk(1,"","H�y ti�u di�t H�c V� Th��ng tr��c r�i s� d�ng chi�n k�");
	end
end

function done()
	if GetTask(Task_id_009) ~= 6 then
		local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
		SetTask(Task_id_013,nHp1);
		SetTask(Task_id_008,1);
		SetTask(Task_id_010,0);
		SetNpcLifeTime(GetTask(Task_id_011),0);
		SetTaskTemp(250,0);
		SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetTrigger(1518*2));
		RemoveTrigger(GetTrigger(3007*2));
		Msg2Player("Ph�ng th� th�t b�i, h�y s� d�ng l�i chi�n k�");
		return 1;
	else
		Talk(1,"","�� ho�n th�nh nhi�m v� , kh�ng th� s� d�ng n�a.");
		return 0;
	end
end

function do_nothing()
end

function OnTimer()
	local i;
	local nMapId,nX,nY = GetWorldPos();
	local nMap,nX,nY = GetNpcWorldPos(GetTask(Task_id_011));
	if nMapId ~= nMap then
		SetTask(Task_id_010,(10 * 60) / 30);
	end
	SetTask(Task_id_010,GetTask(Task_id_010)+1);
	if GetTask(Task_id_010) >= (10 * 60) / 30 or GetTask(Task_id_009) == 6 then
		if GetTask(Task_id_009) ~= 6 then
			SetTask(Task_id_008,1);
			SetTask(Task_id_010,0);
			SetNpcLifeTime(GetTask(Task_id_011),0);
			SetTaskTemp(250,0);
			Msg2Player("Ph�ng th� th�t b�i, h�y s� d�ng l�i chi�n k�");
		else
			if DelItem(2,0,30040,1) == 1 then 
				SetNpcLifeTime(GetTask(Task_id_011),0);
				Msg2Player("Ph�ng th� th�nh c�ng!");
			else
				SetTask(Task_id_008,0);
				SetTask(Task_id_009,0);
				SetTask(Task_id_010,0);
				SetNpcLifeTime(GetTask(Task_id_011),0);
				SetTask(Task_id_011,0);
				SetTask(Task_id_013,0);
				SetTaskTemp(250,0);
				DelItem(2,0,30040,1)
				Msg2Player("Nhi�m v� kh�c th��ng, h�y h�y b� nhi�m v� v� b�t ��u th� l�i!")
			end
		end
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3007*2));
		return 0;
	end
	local nNum = GetTask(Task_id_009);
	local nIndexNpc;
	if nNum == 0 then
		if GetTrigger(1267*2) ~= 0 then
		--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Th�ch Kh�ch Ho�ng K�","Th�ch Kh�ch Ho�ng K�",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
		--end
		else
			CreateTrigger(0,1267,1267*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 1!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Th�ch Kh�ch Ho�ng K�","Th�ch Kh�ch Ho�ng K�",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch Ho�ng K�","Th�ch Kh�ch Ho�ng K�",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch Ho�ng K�","Th�ch Kh�ch Ho�ng K�",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch Ho�ng K�","Th�ch Kh�ch Ho�ng K�",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 1 then
		if GetTrigger(1268*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Th�ch Kh�ch H�ng K�","Th�ch Kh�ch H�ng K�",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1268,1268*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 2!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�ng K�","Th�ch Kh�ch H�ng K�",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�ng K�","Th�ch Kh�ch H�ng K�",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�ng K�","Th�ch Kh�ch H�ng K�",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�ng K�","Th�ch Kh�ch H�ng K�",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 2 then
		if GetTrigger(1269*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Th�ch Kh�ch B�ch K�","Th�ch Kh�ch B�ch K�",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1269,1269*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 3!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Th�ch Kh�ch B�ch K�","Th�ch Kh�ch B�ch K�",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
	
			nIndexNpc = CreateNpc("Th�ch Kh�ch B�ch K�","Th�ch Kh�ch B�ch K�",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Th�ch Kh�ch B�ch K�","Th�ch Kh�ch B�ch K�",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Th�ch Kh�ch B�ch K�","Th�ch Kh�ch B�ch K�",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 3 then
		if GetTrigger(1270*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Lam K� Th�ch Kh�ch","Lam K� Th�ch Kh�ch",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1270,1270*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 4!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Lam K� Th�ch Kh�ch","Lam K� Th�ch Kh�ch",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam K� Th�ch Kh�ch","Lam K� Th�ch Kh�ch",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam K� Th�ch Kh�ch","Lam K� Th�ch Kh�ch",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam K� Th�ch Kh�ch","Lam K� Th�ch Kh�ch",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 4 then
		if GetTrigger(1271*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Th�ch Kh�ch H�c K�","Th�ch Kh�ch H�c K�",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1271,1271*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 5!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�c K�","Th�ch Kh�ch H�c K�",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�c K�","Th�ch Kh�ch H�c K�",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�c K�","Th�ch Kh�ch H�c K�",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Th�ch Kh�ch H�c K�","Th�ch Kh�ch H�c K�",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end		
	elseif nNum == 5 then
		if GetTrigger(1272*2) ~= 0 then
			if mod(GetTask(Task_id_010),3) == 0 then
				if GetTaskTemp(250) < 1 then
					local i = random(2);
					local j = random(2);
					local tbTemp = {2,-2};
					nIndexNpc = CreateNpc("H�u h� ph�p L� Tam �ao","H�u h� ph�p L� Tam �ao",nMap,nX+tbTemp[i],nY+tbTemp[j]);
					SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
					SetNpcLifeTime(nIndexNpc,3*60);
					SetTaskTemp(250,GetTaskTemp(250)+1);
				end
			end
		else
			CreateTrigger(0,1272,1272*2);
			Msg2Player("Xung quanh chi�n k� xu�t hi�n ��t t�n c�ng th� 6!");
			SetTaskTemp(250,1);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("H�u h� ph�p L� Tam �ao","H�u h� ph�p L� Tam �ao",nMap,nX,nY+1);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\ս��.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	end
end

function huangqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function hongqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function baiqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function lanqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function heiqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function lisandao_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0);
end

function Leave_Game()
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetTrigger(1518*2));
		local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
		SetTask(Task_id_013,nHp1);
		if GetTask(Task_id_009) ~= 6 or GetTask(Task_id_008) ~= 2 then
			SetTask(Task_id_008,1);
		end
		SetNpcLifeTime(GetTask(Task_id_011),0);
		SetTask(Task_id_011,0);
		SetTask(Task_id_010,0);
		SetTaskTemp(250,0);
		RemoveTrigger(GetRunningTrigger());
end