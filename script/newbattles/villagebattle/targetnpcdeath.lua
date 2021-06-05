--filename:targetnpcdeath.lua
--create date:2006-06-02
--describe:Ŀ��NPC�����ű�
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nCamp = BT_GetCamp()
	local nEnemyCamp = 3 - nCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp);
	local sNewTargetName = "";
	local nStep = 0;
	local nPoint = 0;
	local nEvenID = 0;
	local nNpcType = 0;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetNpcDeathScript(npcIndex,"");
	BT_EmperorAward(1);
	BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	if tonumber(npcIndex) == GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp) then	--ɱ�����Ǳ���Ŀ��NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			nStep = 1;
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = 2;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = 3;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		BT_AddBattleEvenPoint(nEvenID);
		if Modify_Task_Step(nCamp,nStep) == 1 then
			Reach_Final_Step(nCamp);
		else
			sNewTargetName = Go_To_Next_Step(nCamp);
			Talk(1,"","<color=green>"..sName.."<color>: C�c ng��i mu�n t�m th� l�nh, ph�i �i h�i <color=yellow>"..sNewTargetName.."<color>, h�n ta th��ng � trong th�n.")
			Msg2MSGroup(MISSION_ID,"Doanh tr�i c�p b�o:"..sNewTargetName.."c� th� bi�t tung t�ch th� l�nh, m�i c�c v� anh h�ng nhanh ch�ng t�m ra. Hi�n phe ta nh�n ���c s� t�n nhi�m c�a th� d�n l�"..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
		end;
	else	--ɱ�����ǵз�Ŀ��NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nEnemyCamp-1);
		if nNpcType == SICK_NPC then
			nStep = -2;	--�۵��з�������
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = -3;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = -5;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		Modify_Task_Step(nEnemyCamp,nStep);
		BT_AddBattleEvenPoint(nEvenID);
		sNewTargetName = Go_To_Next_Step(nEnemyCamp);
		BT_OperateAllPlayer(tell_fail,{sNewTargetName,nEnemyCamp},nEnemyCamp)
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "��ng ti�c! B�ch S� Th�ng �� b� ��ch ph��ng s�t h�i. Nh�ng ta v�a nh�n ���c tin t�c: Th� d�n <color=yellow>"..sName.."<color> c� th� bi�t tung t�ch c�a th� l�nh, m�i t��ng s� <color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color> mau ��n �� t�m B�ch S� Th�ng c� li�n quan �� t�m ra t�ng t�ch <color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;