--create date:07-04-24
--author:yanjun
--describe:���ŵ���TRAP��ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");

g_RoomIdx = 3;

function main()
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--���ڵ�����
		return 0;
	end;
	local nRoomIdx = GetTaskTemp(TEMP_AUDIENCE);
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nState = GetMissionV(MV_MISSION_STATE);
	if nRoomIdx ~= 0 then	--�ڵ�����������
		SetTaskTemp(TEMP_AUDIENCE,0);
		SetPos(tFightRoomExit[nRoomIdx][nPlayerCamp][1],tFightRoomExit[nRoomIdx][nPlayerCamp][2]);
		DesaltPlayer(0);
		SetFightState(1);
		UseSkillEnable(1);--  (1����ʹ���书��0��ֹʹ���书)
	else	--�ڵ�����������
		if nState >= MS_STATE_GONGCHENG then	--ת�빥�ǽ׶κ�Ͳ�������
			return 0;
		end;
		SetFightState(0);
		SetTaskTemp(TEMP_AUDIENCE,g_RoomIdx);
		SetPos(tFightingPos[g_RoomIdx][1],tFightingPos[g_RoomIdx][2]);	
		DesaltPlayer(1);
		UseSkillEnable(0);--  (1����ʹ���书��0��ֹʹ���书)
	end;
end;