
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��װ���ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh�m n�m linh th�ch d�ng �� l�m trang b� B�t Qu�i �� xu�t hi�n tr�n giang h�, ta s�p c� m�i l�m �n r�i ��y!");
	end;	
	
	if (nState==2) and (GetSex()== 2) then
	
		task_002_00_female();
		return
	
	else
		i=random(1,3)
		if (i == 1) then
			Sale(34)
		elseif (i == 2) then
			Sale(34)
		else
			Sale(34)
		end
	end
	return
end;
