-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��NPC��ԳScript
-- By StarryNight
-- 2006/02/09 PM 14:19

-- ������������ʵ����

-- ======================================================

-- ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 2 then
		task_002();
		return
	end
	
	if nTaskValue == 3 then
		task_004();
		return
	end
	
	if nTaskValue == 4 then
		Say("Ng��i h�y �i v� <color=yellow>ph�a ��ng<color> ti�u l� s� g�p ���c <color=yellow>V�u Dung<color>.",0);
		return
	end
	
	if GetPlayerFaction == 7 then
		Say("Nh�n g� th�! Mau tr�nh ra!",0);
	else
		Say("Ch�ng bi�t V�u Dung �ang lo l�ng chuy�n g� n�a, t�t nh�t ch� n�n ��n l�m phi�n!",0);
	end
end;
