
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ǯׯ�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==19) then
	
		Teach_Level07_02()
		
	else
		
		Talk(1,"","M�y n�m nay Th�nh �� bu�n b�n � �m, Ti�n Trang �� ��ng c�a, xin h�y ��n Bi�n Kinh �� nh�n.");
	
	end
	
	return

end