
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ؤ������������֪ζ�ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03
-- �峤��2011-4-2��ʦ������NPC��������
-- ======================================================

Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\buy_sell_main.lua")

function main()
	local nTaskValue = FN_GetTaskState(FN_GB);
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_004();
		return
	else
		local sDiaHead,tDiaSel = faction_buysell_main(4)
		Say(sDiaHead,getn(tDiaSel),tDiaSel)
	end
end
