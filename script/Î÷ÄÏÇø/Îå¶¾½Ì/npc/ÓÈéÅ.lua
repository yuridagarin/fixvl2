-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��NPC����Script
-- By StarryNight
-- 2006/02/09 PM 15:03

-- �⼸��������������

-- ======================================================

-- ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 4 then
		task_005();
		return
	end
	
	if nTaskValue == 5 then
		task_007();
		return
	else
		Say("T�i nay nh�t ��nh ph�i th�ng h�n 1 l�n!",0);
	end
end;
