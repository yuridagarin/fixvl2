function CanEquip()
	if GetTask(336) < 200 then
		Msg2Player("B�n c�n 200 �i�m danh v�ng s� m�n m�i c� th� c� trang b� n�y");
		return 1;	--���ܴ�
	end;
	return 0;
end;

function OnUse()
	return 0;
end;

function OnEquip()
	return 0
end

function OnUnEquip()
	return 0;
end
