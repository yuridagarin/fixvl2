-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ü��������ɶ������ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");

function OnDeath()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==3) then
		task_010();
		Msg2Player("Quay v� t�m Chu Thi�n Nh�n!");
		Say("Quay v� t�m Chu Thi�n Nh�n!",0);
	end

end;