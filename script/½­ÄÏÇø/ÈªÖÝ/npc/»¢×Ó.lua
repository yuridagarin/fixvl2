-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ü��������ɶ������ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");


function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local strMain = {

		"Mu�i mu�i ��ng y�u qu��.N�o! T�i ��y ca ca h�n c�i coi!",
		"Qu� nhi�n l� �c ��! �� ta cho ng��i bi�t l� ��!"

	}
	if (nTaskValue==3) then
		TE_Talk(getn(strMain), "task_010", strMain);
		return
	else
		Say("Kh�ng c� g� th� bi�n �i!",0);
	end

end