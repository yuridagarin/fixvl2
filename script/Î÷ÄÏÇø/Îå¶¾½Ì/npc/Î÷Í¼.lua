-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��NPC��ͼScript
-- By StarryNight
-- 2006/02/09 PM 15:19

-- ֱ���Լ������İɣ�

-- ======================================================

-- ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 5 then
		task_008();
		return
	end
	
	if nTaskValue == 6 then
		Say("Ng��i h�y mau t�m g�p <color=yellow>C�u S�ch<color>.",0);
	else
		Say("Ch� H�n th�t kh� hi�u, h�y �i h�i C�u S�ch!",0);
	end
end;
