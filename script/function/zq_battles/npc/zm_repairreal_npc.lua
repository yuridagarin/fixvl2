--���ŷ�ӡnpc
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) ~= 1 then
		return 0;
	end
	if GetTrigger(1523 * 2) ~= 0 and gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 1 then
		ZQ_RepairReal_NpcTalk(GetTargetNpc());
	else
		Talk(1,"","C� th� nh�n ���c nhi�u th�ng tin h�n t�i <color=green>C�nh M�n Tr�n Linh<color>");
	end
end