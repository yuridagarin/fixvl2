function OnUse(nItemIndex)
	if GetPKFlag() ~= 0 then
		Msg2Player("Tr�ng th�i kh�ng luy�n c�ng kh�ng th� s� d�ng bao thu�c c�a Nguy�t L��ng Th�");
		return 1;
	end;
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		CastState("state_life_per_per8f",300,15*18,1,117000);
		CastState("state_neili_per_per8f",200,15*18,1,118000);
		Msg2Player("M�i n�a gi�y ph�c h�i 3% sinh l�c, h�i ph�c 2% n�i l�c, duy tr� trong 15 gi�y");
		SetItemUseLapse(nItemIndex,5*60*18);	--��ȴʱ�䣺5����
		return 1;
	end;
	return 0;
end;

function OnEquip()
	return 0
end

function CanEquip()
	return 0
end

function OnUnEquip()
	return 0
end
