Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\missionfunctions.lua")

IBC_TASK_MANAGE = TaskManager:Create(1, 18);
IBC_TASK_MANAGE.AwardTag = 1; --�Ƿ���ȡ���߲���
IBC_TASK_MANAGE.BigBoxTime = 2;
IBC_TASK_MANAGE.SmallBoxTime = 3;

--�ʱ��
IBC_START = {2014, 9, 22, 0, 0, 0};
IBC_END  = {2014, 9, 22, 0, 0, 0};

--
IBC_MAPID = 108;
IBC_MAP_X = 1519;
IBC_MAP_Y = 3165;

IBC_MISSION_ID = 70;
IBC_TIMER_ID = 100;

IBC_MISION_V1 = 1;


function ibc_IsOpen()
	return gf_CheckDuration(IBC_START, IBC_END);
end

--��ȡ�������
function ibc_PlayerLogin()
	if ibc_IsOpen() ~= 1 then
		return 0;
	end
	if IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.AwardTag) ~= 0 then
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() == 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		Msg2Player("H�nh trang kh�ng �� ch�, kh�ng th� nh�n t�i qu� ��n b�.");
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.AwardTag, 1);
	gf_AddItemEx2({2, 1, 30733, 1, 4}, "T�i qu� ��n b�", "��n b� hack item", "T�i qu� ��n b�", 7 * 24 * 3600, 1);
end

function ibc_RelayCallBoss(nRandomSeed)
	if ibc_IsOpen() ~= 1 then
		return 0;
	end

	Msg2Global("�ng Ch� Tr�n mang ��n r�t nhi�u ph�n qu�,� B�c Tuy�n Ch�u (189,197) �� ��n b� cho c�c b�n.")
	if SubWorldID2Idx(IBC_MAPID) ~= -1 then
		local npcIndex = CreateNpc("BC_huanglaoban", "�ng Ch� Tr�n", IBC_MAPID, IBC_MAP_X, IBC_MAP_Y);
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\online\\item_buchang\\boss_death.lua");
			SetNpcLifeTime(npcIndex, 30 * 60);
			mf_OpenMission(IBC_MISSION_ID, IBC_MAPID);
			mf_SetMissionV(IBC_MISSION_ID, IBC_MISION_V1, npcIndex, IBC_MAPID);
		end
	end
end


