
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
	
	if (nState==4) then
	
		task_004_00();
		return

	else
		
		Sale(30);

	end;
	
	return

end;

