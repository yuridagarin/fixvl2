Include("\\script\\lib\\globalfunctions.lua");

--ѵ������
function OnUse(nIdx)
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end;
	if GetFightState() ~= 0 then
		Msg2Player("Tr�ng th�i chi�n ��u, kh�ng th� hu�n luy�n!");
		return
	end
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end

	StartTrainPet(nPetItemIndex);
end
