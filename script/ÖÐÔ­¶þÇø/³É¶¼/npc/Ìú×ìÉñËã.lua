
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==11) then
		task_011();
		return
	else
		Talk(1,"","Gi�p th�n m�ng 5 th�ng 1, kinh tr�p, tr�i l�nh, c� ng��i d��i qu� l�n, th�ch h�p c��i h�i, k� th� m�c, h��ng ��ng nam t�t!");
	end;
	
end;