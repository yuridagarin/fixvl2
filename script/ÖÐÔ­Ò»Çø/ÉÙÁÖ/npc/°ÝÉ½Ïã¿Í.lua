
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������������ͽű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==4) then
		task_008();
		return
	elseif (nTaskValue==5) then
		task_010();
		return
	else
		Say("K�nh ph�t l� ph�i th�nh t�m, ch�n ch�o l�p b�t n�y ta ph�i �n th�i.",0);
	end
	
end;
