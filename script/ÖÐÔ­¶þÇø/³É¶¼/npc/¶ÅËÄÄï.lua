--�������ܽ��Ӳ�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>�� T� N��ng<color>: ";

function main()
	local tSay = {
		format("\nTi�m Linh �� Gi�i Ch�/#show_equip_shop(%d)", 3044),
		--format("\n����װ���̵�/#show_equip_shop(%d)", 3045),
		--format("\n�߼������̵�/#show_equip_shop(%d)", 3043),
		"\nT�i ch� xem xem th�i/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
