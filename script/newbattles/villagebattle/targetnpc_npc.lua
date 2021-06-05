Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIdx);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("B�n v�  "..npcName.."  c�ch qu� xa.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if npcName ~= GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp) then	--����ǵз���Ŀ��NPC
		Talk(1,"","<color=green>"..npcName.."<color>: Xin h�i c� chuy�n g�?");
		return 0;
	end;
	if Is_The_Selected(nCamp) == 1 then	--����Ǳ�ѡ�е���֮һ
		Talk(1,"#reaction(\""..npcName.."\")","Phi�n v� ��i ca cho bi�t tung t�ch th� l�nh, t�i h� mu�n ph�n c�m k�ch.");
		BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	else
		Talk(1,"","<color=green>"..npcName.."<color>: Xin h�i c� chuy�n g�?");
	end;
end;

function reaction(sNpcName)
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME+nPlayerCamp-1);
	if sNpcName ~= sName then	--�����������ͬʱ���NPCʱ���ֵ��������
		return 0;
	end;
	local sNewTargetName = "";
	
	if GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) >= 10 then	--����Է�ɱ��������ȫ��֪����
		if Modify_Task_Step(nPlayerCamp,5) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			if nEnemyCamp == SONG_ID then
				Say("<color=green>"..sName.."<color>: C�c ng��i ��n tr� v�y? Huynh �� t� mu�i c�a ta �� b� Binh s� phe T�ng s�t h�i, h�y gi�p ta b�o th�, huhu! V� tung t�ch th� l�nh, <color=yellow>"..sNewTargetName.."<color> l� ng��i bi�t r� nh�t.",0);	
			else
				Say("<color=green>"..sName.."<color>: C�c ng��i ��n tr� v�y? Huynh �� t� mu�i c�a ta �� b� Binh s� phe Li�u s�t h�i, h�y gi�p ta b�o th�, huhu! V� tung t�ch th� l�nh, <color=yellow>"..sNewTargetName.."<color> l� ng��i bi�t r� nh�t.",0);	
			end;
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);	
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) >= 10 then--�������ɱ������ȫ��֪����
		Talk(1,"","<color=green>"..sName.."<color>: H�! ��m th� ph� c�c ng��i c�n c� gan ��n h�i th�m tin t�c c�a th� l�nh n�a sao? Ta li�u ch�t v�i ng��i ��y!");
		change_npc2fight(nPlayerCamp,sName,RAGING_NPC);	--����񱩵�Ŀ��npc
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) == 0 then	--�������δɱ�������κ�֪����
		if Modify_Task_Step(nPlayerCamp,2) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName =Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>: Tuy ta l� g� th�t phu nh�ng v�n hi�u ���c l� ph�i, ph�n bi�t ���c t�t x�u. Mu�n t�m th� l�nh c� th� h�i th�m <color=yellow>"..sNewTargetName.."<color>, h�n ta th��ng � trong th�n, bi�t ��u gi�p ���c ng��i.",0);	
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) <= 3 then	--�������ɱ������֪������Ŀ������3
		if Modify_Task_Step(nPlayerCamp,1) == 1 then
			Reach_Final_Step(nPlayerCamp);
		else
			sNewTargetName = Go_To_Next_Step(nPlayerCamp);
			Say("<color=green>"..sName.."<color>: �i! Chi�n tranh �o�t quy�n, ng��i d�n nh� ch�ng t�i ch�u kh� m� th�i, mu�n t�m th� l�nh c� th� h�i <color=yellow>"..sNewTargetName.."<color>, ta kh�ng mu�n nh�ng tay v�o chuy�n n�y!",0);
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_FIND_TARGET);
		BT_EmperorAward(1);
	elseif GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1) < GetMissionV(MV_SONG_KILL_LIAO+nEnemyCamp-1) then	--�������ɱ��֪������Ŀ����3���ȵз�ɱ����
		Talk(1,"","<color=green>"..sName.."<color>: H�! M�y ng��i c�c ng��i so v�i l� gi�t ng��i c��p c�a c� ph�n bi�t g�? Ta tuy�t ��i kh�ng ti�t l� tung t�ch c�a th� l�nh.");
		change_npc2fight(nPlayerCamp,sName,SICK_NPC);	--�����޵�Ŀ��npc
	else	--�������ɱ��֪������Ŀ����3�ұȵ���ɱ�ö�
		if nEnemyCamp == SONG_ID then
			Talk(1,"","<color=green>"..sName.."<color>: Mu�n t�m th� l�nh ph�i b��c qua x�c ta ��!");
		else
			Talk(1,"","<color=green>"..sName.."<color>: Mu�n t�m th� l�nh ph�i b��c qua x�c ta ��!");
		end;
		change_npc2fight(nPlayerCamp,sName,ANGRY_NPC);	--�����ŭ��Ŀ��npc
	end;
end;
--����Ϊս��NPC�����������NPC��Ӫ��NPC���֣�NPC����
function change_npc2fight(nCamp,sName,nType)	
	local npcIndex = GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp);
	if npcIndex == 0 then
		WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� change_npc2fight nh�n ���c tr� h��ng d�n NPC l� 0");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex);
	SetNpcScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,0)
	if nType == SICK_NPC then
		npcIndex = CreateNpc("Th� d�n th� h�n","o�n h�n"..sName,MapID,MapX,MapY);
	elseif nType == ANGRY_NPC then
		npcIndex = CreateNpc("Th� d�n ph�n n�","ph�n n�"..sName,MapID,MapX,MapY);
	else
		npcIndex = CreateNpc("Th� d�n cu�ng b�o","cu�ng b�o"..sName,MapID,MapX,MapY);
	end;
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,nType);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);
	SetNpcDeathScript(npcIndex,"\\script\\newbattles\\villagebattle\\targetnpcdeath.lua");
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,1);	--����Ŀ��NPC�ĵ�ǰ״̬Ϊս��״̬
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,GetMissionV(MV_TIMER_LOOP));	--��¼Ŀ��NPC���ս��NPCʱ��ʱ���ļ�ʱ����
end;
