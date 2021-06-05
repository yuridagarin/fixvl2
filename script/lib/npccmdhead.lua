--Include("\\script\\lib\\define.lua")

NPCCOMMAND = {
	do_none			= 0,		-- ʲôҲ����
	do_stand		= 1,		-- վ��
	do_goto			= 2,		-- ȥ(��/��)��ĳ��Ŀ�ĵ� Param_x, Param_y Ŀ�ĵص�����
	do_skill		= 3,		-- ������:	��Ŀ��㷢����	 Param_X, Param_Y, Ŀ��㳡������;
					--			��Ŀ��Npc������	 Param_X = enumSPT_TARGET_NPC,  Param_Y = Ŀ��Npc��ID;
					--			��Ŀ�����巢���� Param_X = enumSPT_TARGET_TRAP, Param_Y = Ŀ��������ӵ�ID;
					--			Param_Z : 0~15bit ����ID; 15~23 ���ܵȼ�; 24~31 Ԥ��
					--			Param_E : C2S,S2C����do_skill����ʱ�Զ����
					--					  C2S:	0~7bit �����������;	8~15 ������Ӽ�����;	(���͵��������˴���Ч�Լ��)
					--					  S2C:	0~7bit �����������;	8~15 ������Ӽ�����;	16~23 �����ٶȰٷֱȼӳ�;	24~31 �����ٶȰٷֱȼӳ�

	do_talk			= 4 ,		-- ��Npc˵��    Param_X = dwNpcId
	do_hurt			= 5 ,		-- ����/�ܴ�� ParamX Ϊ-1ʱ���͵��Ƿ������ܵ�ͬ�� Ϊ0ʱ���͵��Ǻ�������,Ϊ1ʱ���͵���͵�Լ��ܵ�ͬ��
	do_parry		= 6 ,		-- ��
	do_dodge		= 7 ,		-- ����
	do_death		= 8 ,		-- ����, Param_X = ���µķ���,Param_Y = ���µ�ʱ��(��Ϸ����)
	do_revive		= 9 ,		-- ����
	do_beatback		= 10,		-- ����, Param_X = ���˵ķ���,Param_Y = ���˵�ʱ��(��Ϸ����), Param_Z = �Ƿ���Ի�������
	do_beatdown		= 11,		-- ����, Param_X = ���ɵķ���,Param_Y = ���ɵ�ʱ��(��Ϸ����)
	do_fakehurt		= 12,		-- �ͻ�����ٵı�������
	do_upturn		= 13,		-- ������
	do_sit			= 14,		-- ����
	do_reading		= 15,		-- �ж�
	do_faint		= 16,		-- ����
	do_interactive	= 17,		-- ���֮�佻��, Param_X = �����ľ��嶯��, Param_Y = �Ƿ�������0-������1-������
	do_chaos_run	= 18,		-- ������
	do_gather		= 19,		-- �ɼ�
	do_home_coming	= 20,		-- �س�
	do_gather_end	= 21,  		-- �ɼ�����
	do_delude_run	= 22,		-- �Ի���
	do_delude_skill	= 23,		-- �Ի󹥻�
	do_ride			= 24,		-- ���, Param_X = Ҫ��˵���Ʒ����Ϸ������Ʒ����, Param_Y = 0 ���� 1 ����, Param_Z = 0��жװ 1 = жװ
	do_train		= 25,		-- ѵ������
	----han't beed checked below--
	--do_idle		,		-- ����
	do_stall		= 26,		-- ��̯
	do_smelt		= 27,		-- �����ڵ�
}

eSkillParamType =
{
	enumSPT_TARGET_NPC	= -1,	-- Ŀ��Npc
	enumSPT_TARGET_TRAP	= -2,	-- Ŀ��Trap
}
--?gm ds NpcCommand(484,3,1634*32,3536*32,65536*20+146)

------------------------------------------------------------------
g_NpcAI = {}
AT_SM_ATTACK 	= 17;	-- A��ȥ
AT_SM_MOVE		= 18;	-- M��ȥ
AT_SM_PATROL	= 19;	-- P��ȥ
AT_SM_PROTECT	= 20;	-- �������汣��	(�����û�)

function g_NpcAI:checkNpc(npc)
	local m,x,y = GetNpcWorldPos(npc);
	--print("MapID=",m)
	if m < 700 then
		WriteLog(format("[Error] [NpcAI] [npc=%s at (%d,%d,%d)] [callfrom:%s # %s]",
			GetNpcName(npc), m, x, y, tostring(CALL_SCRIPT_NAME), tostring(CALL_FUNCTION_NAME)));
		return 1
	end
	return 1;
end
function g_NpcAI:setAI(npc, aiType)
	if not self:checkNpc(npc) then return end
	return AddUnitStates(npc, 7, aiType);
end
function g_NpcAI:setWayPoint(npc, tpos)
	if not self:checkNpc(npc) then return end
	ClearAiParam(npc);
	for i = 1, getn(tpos) do
		local x, y = tpos[i][1] * 32, tpos[i][2] * 32;
		PushAiParam(npc, 0, x, y);
	end
end
