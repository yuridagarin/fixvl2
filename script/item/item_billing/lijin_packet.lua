Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� r��ng l� kim? B�n trong c� <color=yellow>50<color> l� kim.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = AddItem(ITEM_COIN[1],ITEM_COIN[2],ITEM_COIN[3],50)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 50 l� kim");
			WriteLog("[K�t h�n]:"..GetName().."�� m� 1 r��ng l� kim");
		else
			WriteLog("[K�t h�n b�o l�i]:"..GetName().."M� r��ng l� kim b�o l�i, AddItem tr� quay v�:"..nRetCode);
		end;
	end;
end;