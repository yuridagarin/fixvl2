-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��NPC����Script
-- By StarryNight
-- 2006/02/09 PM 14:12

-- �����������ɽԵøʾͺ���

-- ======================================================

-- ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_wp.lua"); 
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\������\\�嶾��\\npc\\����.lua";	--Ĭ��ֵ
g_szInforHeader = "<color=green>C�u S�ch<color>:";	--Ĭ��ֵ
g_nBackRoomEntryType = 1;	--������ͣ������֡�1��ʾ��ʦ�������룬2��ʾ�ӵ��ߴ�����

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 1 then
		task_001();
		return
	end
	
	if nTaskValue == 2 then
		Say("<color=yellow>Ph��ng Vi�n<color> � <color=yellow>ph�ng b�n<color> ��!",0);
		return
	end
	
	if nTaskValue == 6 then
		task_010();
		return
	end
	
	if nTaskValue == 7 then
		Say("Ng��i c� th� ��n g�p <color=yellow>B�ch gi�o ch�<color>.",0);
		return
	else
		backroom_main();
	end
end;
