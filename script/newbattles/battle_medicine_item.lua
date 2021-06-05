Include("\\script\\newbattles\\functions.lua");
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if BT_GetData(PT_BATTLE_TYPE) == 0 and nCurMapID ~= 606 then
		Msg2Player("D��c ph�m chi�n tr��ng chuy�n d�ng ch� c� th� s� d�ng trong chi�n tr��ng");
		return 0;
	end;
	if abs(BT_GetData(PT_CURRANK)) < get_medicine_rank(nItemIdx) then
		Msg2Player("Qu�n h�m c�a b�n qu� th�p, kh�ng th� s� d�ng d��c ph�m n�y");
		return 0;
	end;
	return 1;
end;

function get_medicine_rank(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tBattleMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tBattleMed[i][7];
		end;
	end;
	for i,v in tPKMed do
		if v[2] == nGenre and v[3] == nDetail and v[4] == nParticular then
			return tPKMed[i][7];
		end;	
	end;
	return 0;
end;