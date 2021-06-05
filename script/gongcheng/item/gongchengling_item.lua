--create date:07-04-16
--author:yanjun
--describe:�����ȷ�����Ʒ�ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch� � trong khu v�c C�ng th�nh chi�n m�i c� th� s� d�ng C�ng th�nh Ti�n phong l�nh.");
		return 0;
	end;
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","Ch� trong giai �o�n c�ng th�nh m�n m�i c� th� s� d�ng C�ng th�nh Ti�n phong l�nh");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Th�nh m�n �� b� s�p �� ho�n to�n, kh�ng th� ti�p t�c s� d�ng ");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","B�n �� l� Th� v� c�a "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format("Khi�u chi�n"..tDoorName[1].."Th� v�/#use(%d,%d)",nItemIdx,1),
				format("Khi�u chi�n"..tDoorName[2].."Th� v�/#use(%d,%d)",nItemIdx,2),
				format("Khi�u chi�n"..tDoorName[3].."Th� v�/#use(%d,%d)",nItemIdx,3),
				"H�y b�/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - GCZ_GetPlayerCamp();
	local szGEGuardName,szGSGuardName,szGWGuardName = GCZ_GetGuardName(GONG_ID,0);
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say("             "..gf_FormatStringLength("Phe c�ng",20)..gf_FormatStringLength("Phe th�_",20).."<enter>"..gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szGEGuardName,20)..gf_FormatStringLength(szSEGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szGSGuardName,20)..gf_FormatStringLength(szSSGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szGWGuardName,20)..gf_FormatStringLength(szSWGuardName,20).."\n\nTr�n ��y l� t�nh h�nh th� v� c�c th�nh th�, c�c h� mu�n khi�u chi�n Th� v� th�nh m�n n�o?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","Ch� trong giai �o�n c�ng th�nh m�n m�i c� th� s� d�ng C�ng th�nh Ti�n phong l�nh");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Th�nh m�n �� b� s�p �� ho�n to�n, kh�ng c�n s� d�ng n�a");
		return 0;
	end;
	if GetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1) == 1  then
		Talk(1,"","Th�nh n�y �� b� s�p ��");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szFriendName = GCZ_GetGuardName(nPlayerCamp,nDoorIdx);	--������������
	local szEnemyName = GCZ_GetGuardName(nEnemyCamp,nDoorIdx);		--�з���������
	if szFriendName ~= "Ch�a" and szEnemyName ~= "Ch�a" then	--˫����������
		Talk(1,"","Hi�n Th� v� th�nh m�n n�y �ang khi�u chi�n ��n ��u v�i ng��i kh�c n�n kh�ng th� khi�u chi�n Th� v� th�nh m�n n�y");
		return 0;
	end;	 
	if szFriendName ~= "Ch�a" and szEnemyName == "Ch�a" then	--Ŀǰ���ű��ҷ�ռ��
		Talk(1,"","Phe ta �� ph�i ng��i tr�n gi� th�nh m�n n�y, kh�ng th� xin ph�p khi�u chi�n");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	local nEnemyIdx = GCZ_GetGuardPlayerIndex(nEnemyCamp,nDoorIdx);
	if nEnemyIdx > 0 then
		PlayerIndex = nEnemyIdx;
		if GetTaskTemp(TEMP_LOCK) ~= 0 then	--Ŀ������������
			Talk2SomeOne(nOldPlayerIdx,1,"","Phe ta �� c� ng��i g�i th� khi�u chi�n ��n ��u v�i Th� v� th�nh m�n n�y");
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		if szFriendName == "Ch�a" and szEnemyName == "Ch�a" then	--Ŀǰ����û��ռ��
			Talk(1,"","Hi�n th�nh n�y ch�a c� th� v�, b�n tr�c ti�p tr� th�nh Th� v� c�a th�nh m�n n�y!");
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
			if nPlayerCamp == SHOU_ID then
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
			else
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
			end;
			SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
			Msg2MSAll(MISSION_ID,tDoorName[nDoorIdx].." kh�ng ng��i tr�n th�, b� "..GetName().."("..tCampNameZ[nPlayerCamp]..") chi�m l�nh d� d�ng");
			return 0;
		end
		if szFriendName == "Ch�a" and szEnemyName ~= "Ch�a" then	--Ŀǰ���ű��з�ռ��
			PlayerIndex = nEnemyIdx;
			SetTaskTemp(TEMP_LOCK,1);	--��������
			Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).." khi�u chi�n v�i b�n. ��m ng��c c�n %d gi�y", 15, "\\script\\gongcheng\\item\\gongchengling_item.lua")
			PlayerIndex = nOldPlayerIdx; 
			Msg2Player("Xin ph�p khi�u chi�n ��n ��u �� g�i �i. Xin ch� ��i h�i �m");
		end;
	end;
end;

function OnAccept(nProposerIdx, nType)
	local nGuardIdx = PlayerIndex;
	SetTaskTemp(TEMP_LOCK,0);	--��������
	if nProposerIdx <= 0 then
		Talk(1,"","��i ph��ng �� r�i kh�i chi�n tr��ng");
		Msg2Player("��i ph��ng �� r�i kh�i chi�n tr��ng");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nType == 0 then	--ѡ��ȡ���������ʱ
		PlayerIndex = nProposerIdx;
		local nPlayerCamp = GCZ_GetPlayerCamp();
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		Talk(1,"","Th� v� th�nh m�n n�y �� b� tr�n, b�n �� tr� th�nh T�n th� v�. Xin h�y c� g�ng gi� th�nh!");
		Msg2Player("Th� v� th�nh m�n n�y �� b� tr�n, b�n �� tr� th�nh T�n th� v�. Xin h�y c� g�ng gi� th�nh!");
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
		local nEnemyCamp = GCZ_GetEnemyCamp();
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1,0);
		GCZ_Msg2Camp(GetName().."S� d�ng C�ng th�nh Ti�n phong l�nh tr� th�nh "..tDoorName[nDoorIdx].."Th� v�",nPlayerCamp);		
		PlayerIndex = nGuardIdx;
		nPlayerCamp = GCZ_GetPlayerCamp();
		Msg2Player("Th�nh m�n do b�n th� v� �� b� ng��i kh�c chi�m");
		Talk(1,"","Th�nh m�n do b�n th� v� �� b� ng��i kh�c chi�m")
		SetTaskTemp(TEMP_GURAD_ID,0);
		GCZ_Msg2Camp(tDoorName[nDoorIdx].." �� b� ��ch chi�m",nPlayerCamp);
		return 0;
	end;
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nProposerIdx;
	SetTaskTemp(TEMP_CHALLENGER,1);	--��Ϊ��ս��
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nGuardIdx;
	Msg2MSAll(MISSION_ID,"��i hi�p"..GetName(nProposerIdx).." ph�t khi�u chi�n ��n ��u t�i "..tDoorName[nDoorIdx].."Th� v�"..GetName(nGuardIdx)..".");
end;

function set_fight_state(nCamp,nDoorIdx)
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--ԭ������
	end;
	if GetTaskTemp(TEMP_AUDIENCE) ~= 0 then	--�������������
		DesaltPlayer(0);
		UseSkillEnable(1);--  (1����ʹ���书��0��ֹʹ���书)
		SetTaskTemp(TEMP_AUDIENCE,0);
	end;	
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--���������ʱ״̬
	ClearColdDown();	--��ҩCD
	CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
	Say("��n ��u sau <color=yellow>30 gi�y<color> s� b�t ��u!",0);
	Msg2Player("��n ��u sau 30 gi�y s� b�t ��u, ��i b�n h�y chu�n b�!");
	SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
	SetTaskTemp(TEMP_ARENA_FIGHTING,nCamp);
	SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_READY);
	SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,PlayerIndex);
	SetPos(tFightingPos[nDoorIdx][1],tFightingPos[nDoorIdx][2]);
end;