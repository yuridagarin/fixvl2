
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��װ���ϰ�ű�
-- Edited by Starry
-- 2006/04/12 PM 18:03

-- ======================================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

function main()

 ----------------------------------76�������䷽ɽʨ��Ƥ����----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI);
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh�m n�m linh th�ch d�ng �� l�m trang b� B�t Qu�i �� xu�t hi�n tr�n giang h�, ta s�p c� m�i l�m �n r�i ��y!");
	end;			
		if nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79 then
			--��Ůװ���ϰ�Ի�
			if nTaskState_shanshi == 1 then
				weave_shanshi_003()
				return
			--�Ͻ��·�
			elseif nTaskState_shanshi == 2 then
				weave_shanshi_004()
				return
			--δ��ȥ�ظ�����
			elseif nTaskState_shanshi == 3 then
				weave_shanshi_006()
				return
			end 
		end
		
		Sale(34)
		
end;
