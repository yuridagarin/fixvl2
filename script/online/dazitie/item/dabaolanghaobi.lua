function OnUse(nItem)
	Say(format("C�c h� ��ng � m� %s nh�n%d c�i %s kh�ng?","Bao b�t l�ng l�n",50,"B�t l�ng"),2,"��ng �/ensure","H�y b�/do_nothing")
end

function ensure()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
	end
	if DelItem(2, 1, 30453, 1) == 1 then
		AddItem(2, 1, 30451, 50);
	end
end

function do_nothing()
end
