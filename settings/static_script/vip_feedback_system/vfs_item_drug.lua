--������
--������Ŀ99�����Խ��ף�ʹ�ú����ظ�100�㣬IB�ۼ� 100Xu
function OnUse(nItem)
	Say("Ng��i quy�t ��nh s� d�ng Tinh L�c Ho�n kh�ng?", 2, format("��ng �/#ensure(%d)", nItem), "Kh�ng c�n ��u/do_nothing");
end

function ensure(nItem)
	local nCurrent, nMax = ModifyEnergy(0,1);
	if nCurrent < 0 or nMax < 0 or nCurrent == nMax then
		Msg2Player("S� d�ng Tinh L�c Ho�n th�t b�i");
		return 0;
	end
	if 1 == DelItemByIndex(tonumber(nItem), 1) then
		ModifyEnergy(100, 1);
	end
end

function do_nothing()
--do nothing
end