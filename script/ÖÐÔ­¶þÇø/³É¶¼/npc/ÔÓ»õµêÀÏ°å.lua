
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ӻ����ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th�ch? Ch� ta ch�ng c� �� b�n, ng��i �i h�i ng��i c�a C�ng D� Th� Gia xem sao!");
	end;	
	
	if (nState==5) then
	
		task_005_00();
		return

	else
		i = random(1,3)
		if (i == 1) then
			Sale(35)
		elseif (i == 2) then
			Sale(35)
		else
			Sale(35)
		end
	end
	return
end;

