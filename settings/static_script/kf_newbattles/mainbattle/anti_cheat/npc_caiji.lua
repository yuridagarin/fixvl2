--�ɼ�
SZ_BF_CHEAT_OP_SCRIPT = "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"
function main()
	local nNpcIdx = GetTargetNpc();
	local szScript = format("pco_on_task_npc_talk_or_death(%d)",nNpcIdx)
	SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
	SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
end