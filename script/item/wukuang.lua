--�ڿ�
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 711 or n == 716 or n == 721 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh�ng th� s� d�ng c�ng c� thu th�p n�y � ��y.")
	end
end