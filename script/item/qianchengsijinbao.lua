Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
g_szPacketName = "Ti�n Tr�nh T� C�m B�o";	--��������
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Xin gia nh�p ph�i tr��c r�i k�ch ho�t"..g_szPacketName.."!");
		return 0;
	end;
	local selTab = {};
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		tinsert(selTab,format("X�c nh�n, ch�n c�n l�m v� kh�/#add_item(%d,%d)",nItemIdx,5));
		tinsert(selTab,format("X�c nh�n, ch�n �ao l�m v� kh�/#add_item(%d,%d)",nItemIdx,4));
	else
		tinsert(selTab,format("��ng �/#add_item(%d,%d)",nItemIdx,0));
	end;
	tinsert(selTab,"H�y b�/nothing");	
	Say("B�n mu�n m� <color=yellow>"..g_szPacketName.."<color> B�n nh�n ���c 1 b� <color=yellow>trang b� s� m�n s� c�p<color> v� <color=yellow>100<color> �i�m c�ng hi�n s� m�n.",getn(selTab),selTab);
end;

function add_item(nItemIdx,nType)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = fe_AddFactionEquipment(nRoute,nBody,40,nType);
		Msg2Player("B�n nh�n ���c 1 b� trang b� s� m�n s� c�p.");
		SetTask(336,GetTask(336)+100);
		Msg2Player("B�n nh�n ���c 100 �i�m c�ng hi�n s� m�n");
		WriteLog("["..g_szPacketName.."]:"..GetName().."M� 1 t�i ");
	end;
end;