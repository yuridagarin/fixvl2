
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������﹤ͷ�ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==2) then
		task_005();
		return
	else
		Say("C� chuy�n g� v�y?",0);
	end

end