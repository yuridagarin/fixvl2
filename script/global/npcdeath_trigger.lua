--��ɫ���ߴ�����kill������
--����npc���ᴥ��
--һֱ���ڲ���ɾ��

Include("\\script\\online_activites\\award.lua")
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")

function OnNpcDeath()
	local npcIdx, sTempName, sName, bIsPlayer = GetTriggeringUnit();
	if npcIdx <= 0 then
		return 0;
	end
	--��Ұ��
	if bIsPlayer == 0 then
		trigger_killnpc_drop();
		--201401���2
		trigger_killnpc_wildpig(sName);
		--201401���3
		trigger_killnpc_tuzi(sName);
		--201401���4
		trigger_killnpc_wildpig2(sName);
		--201402���2
		Vet_201402_KillNpc1(sName);
		Vet_201402_KillNpc2(sName);
		--ͨ�û
		trigger_killnpc_common(sName);
		--���˴���
		lb_OnKiller(sName);
	end
	--�����
	if bIsPlayer == 1 then
		--nothing
	end
end