--���ߣ��Ͼ�
--�������ڣ�08��2��18��16:20
--ʦ�Źؿ����������ű��ļ�
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szInforHeader = "<color=green>Truy�n ph� m�t th�t<color>:";
g_szThisFile = "\\script\\item\\item_billing\\back_room_ticket.lua";
g_nFaction = 0;	--����
g_nBackRoomEntryType = 2;	--������ͣ������֡�1��ʾ��ʦ�������룬2��ʾ�ӵ��ߴ�����

function OnUse(nItemIdx)
	if BR_CheckCityMapID() ~= 1 then
		Talk(1,"","Ch� c� th� d�ng v�t n�y trong th�nh.");
		return 0;
	end;
	backroom_main();
end;