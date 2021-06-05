Include("\\script\\lib\\globalfunctions.lua");

tBoat = {"Thuy�n R�ng Th�y L�i","Thuy�n R�ng Th�y L�ng","Thuy�n r�ng �o�n Binh","Thuy�n R�ng Li�n X�","Thuy�n r�ng Ti�m H�nh"};
function OnUse(nItemIdx)
	local selTab = {
				"Th�y L�i Long Chu (s� d�ng ���c 1 l�n)/#select_boat(1,"..nItemIdx..")",
				"Th�y L�ng Long Chu (s� d�ng ���c 1 l�n)/#select_boat(2,"..nItemIdx..")",
				"Th�y Ph�o Long Chu (s� d�ng ���c 1 l�n)/#select_boat(3,"..nItemIdx..")",
				"Li�n X� Long Chu (s� d�ng ���c 1 l�n)/#select_boat(4,"..nItemIdx..")",
				"Ti�m H�ng Long Chu (s� d�ng ���c 1 l�n)/#select_boat(5,"..nItemIdx..")",
				"�� ta ngh� l�i/nothing",
				}
	Say("Xin ch�n thuy�n r�ng b�n mu�n s� d�ng:",getn(selTab),selTab);
end;

tBoadType = {
	[1] = {27,"Thuy�n R�ng Th�y L�i"},
	[2] = {28,"Thuy�n R�ng Th�y L�ng"},
	[3] = {26,"Thuy�n R�ng Th�y Ph�o"},
	[4] = {30,"Thuy�n R�ng Li�n X�"},
	[5] = {31,"Thuy�n r�ng Ti�m H�nh"},
	}

function select_boat(nType,nItemIdx)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,105,tBoadType[nType][1],1);
		Msg2Player("B�n nh�n ���c 1 "..tBoadType[nType][2]);
	end;
end;

function nothing()

end;