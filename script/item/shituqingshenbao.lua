Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szPacketName = "T�i S� �� T�nh Th�m";	--��������
g_nNeedRoom = 1;
g_nNeedWeight = 100;	
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Xin gia nh�p ph�i tr��c r�i k�ch ho�t"..g_szPacketName.."!");
		return 0;
	end;
	local selTab = {};
	tinsert(selTab,format("��ng �/#add_item(%d)",nItemIdx));
	tinsert(selTab,"H�y b�/nothing");	
	Say("B�n mu�n m� <color=yellow>"..g_szPacketName.."<color>ch�? B�n c� th� nh�n ���c <color=yellow>m�o S� M�n Trung C�p <color> v� <color=yellow>200<color> �i�m c�ng hi�n S� m�n.",getn(selTab),selTab);
end;

function add_item(nItemIdx)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = fe_AddFactionEquipment(nRoute,nBody,61,0);
		Msg2Player("B�n nh�n ���c 1 m�o S� m�n trung c�p");
		SetTask(336,GetTask(336)+200);
		Msg2Player("B�n nh�n ���c 200 �i�m c�ng hi�n S� m�n ");
		WriteLog("["..g_szPacketName.."]:"..GetName().."M� 1 t�i ");
	end;
end;