function CanEquip()
	if GetTask(336) < 9000 then
		Msg2Player("B�n c�n c� 9000 �i�m danh v�ng s� m�n m�i c� th� m�c b� trang b� n�y");
		return 1;	--���ܴ�
	end;
	return 0;
end;

function OnUse()
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end
