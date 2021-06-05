--filename:knowmandeath.lua
--create date:2006-06-02
--describe:֪����NPC�����ű�
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nNpcCamp,nNum = get_npc_camp(tonumber(npcIndex));
	local nPlayerCamp = BT_GetCamp();
	SetNpcDeathScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetMissionV(nNum,0);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_VILLAGE_KILL_KNOWMAN);
	BT_AddBattleActivity(BA_VILL_KILL_KNOWMAN);
	if nNpcCamp == nPlayerCamp then
		SetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1)+1);	--nPlayerCampɱ��nPlayerCamp��֪����
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"S� B�ch S� Th�ng c�a phe T�ng b� phe T�ng di�t:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"S� B�ch S� Th�ng c�a phe Li�u b� phe Li�u di�t:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		end;
	else
		SetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1)+1);	--nPlayerCampɱ��nEnemyCamp��֪����
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"S� B�ch S� Th�ng c�a phe Li�u b� phe T�ng di�t:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"S� B�ch S� Th�ng c�a phe T�ng b� phe Li�u di�t:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		end;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG+nNpcCamp-1));
	if nNpcCamp == SONG_ID then
		Say("Nh�n v�t phe T�ng <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> t�a ��: <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	else
		Say("Nh�n v�t phe Li�u <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> t�a ��: <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	end;
end;
--�ж�NPC���ĸ���Ӫ�ġ�������Ҫ˵��һ�£����ǿ��Ը���NPC���������ж�����������Ӫ��
--���������Ļ�������������������ں���棬��Ϊ�������ַ����Ĵ���ͬ�����İ档
--���Ծ�����Ҫ���ж������ַ��ķ�ʽ������һЩ���顣
function get_npc_camp(nIndex)
	for i=MV_KNOWMAN_SONG_BEGIN,MV_KNOWMAN_SONG_END do
		if nIndex == GetMissionV(i) then
			return SONG_ID,i;
		end;
	end;
	for i=MV_KNOWMAN_LIAO_BEGIN,MV_KNOWMAN_LIAO_END do
		if nIndex == GetMissionV(i) then
			return LIAO_ID,i;
		end;
	end;
	WriteLog("[Chi�n tr��ng b�o l�i]: get_npc_camp kh�ng t�m th�y ��i ph��ng NPC, nh�p tham s�:"..nIndex);
end;