Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� L� r��ng l�n? C� th� nh�n ���c <color=yellow>500<color> l� kim.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = AddItem(ITEM_COIN[1],ITEM_COIN[2],ITEM_COIN[3],500)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 500 l� kim");
			WriteLog("[K�t h�n]:"..GetName().."M� m�t L� r��ng l�n");
		else
			WriteLog("[K�t h�n b�o l�i]:"..GetName().."M� L� r��ng l�n b�o l�i, AddItem tr� ph�n h�i:"..nRetCode);
		end;
	end;
end;