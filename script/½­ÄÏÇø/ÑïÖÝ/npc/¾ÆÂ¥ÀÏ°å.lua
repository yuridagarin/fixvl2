
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��¥�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv58\\task_main.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,375) < 1 then
		--�����ݾ�¥�ϰ�������Ѽ              
		buy_gift_talk(2);
		return
	end
	
	Talk(1,"","Kh�ch quan ��n ti�u �i�m t�m r��u th��ng h�ng �? B�o ��m s� ���c h�i l�ng!");
	
end;
