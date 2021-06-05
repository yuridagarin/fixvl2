Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		"C�a h�ng Ma Tinh Gi�i Ch� c�p 3/#show_equip_shop(3027)",
		format("C�a h�ng Ma Tinh Trang B� S� M�n/#mojing_shimen_shop(%d)", nItem),
		"C�a h�ng Ma Tinh T�p H�a/#show_equip_shop(3026)",
		"\n Tho�t/nothing",
	}
	Say("Tham gia chi�n tr��ng ch�n kh�, khi�u chi�n c�a �i nh� c� t� l� nh�t ��nh nh�n ���c Ma Tinh, t�ch l�y l��ng ma tinh c� th� ��i ���c ��o c� t��ng �ng.",getn(tSay), tSay);
end

function mojing_shimen_shop(nItem)
	local tSay = {
		"Ma Tinh ��i s� m�n b� 4/#show_equip_shop(3)",
		"Ma Tinh ��i s� m�n b� 5/#show_equip_shop(6)",
		format("\n Ph�n h�i/#OnUse(%d)", nItem),
		"Ra khi/nothing",
	}
	Say("Tham gia chi�n tr��ng ch�n kh�, khi�u chi�n c�a �i nh� c� t� l� nh�t ��nh nh�n ���c Ma Tinh, t�ch l�y l��ng ma tinh c� th� ��i ���c ��o c� t��ng �ng.",getn(tSay), tSay);
end
