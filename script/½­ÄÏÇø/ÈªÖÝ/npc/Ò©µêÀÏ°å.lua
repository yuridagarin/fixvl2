
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ���ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
--	Restore()    --�ָ���ҵ�����
--	RestoreNeili()   --�ָ���ҵ�������ȫ����
--	RestoreStamina()    --�ָ���ҵ�������ȫ����
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Giang h� h�n lo�n, nghe n�i T�y B�c l�i b�t ��u l�n x�n, ta s�p c� m�i l�m �n m�i ��y!");
	end;			
	if (nState==4) then
	
		task_004_00();
		return

	else
		
		Sale(30);

	end;
	
	return

end;

