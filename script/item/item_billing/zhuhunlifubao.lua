Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� l� bao ch� h�n? B�n trong ch�a l� ph�c ch� h�n.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,109,241+nBody-1,1)
		Msg2Player("B�n nh�n ���c 1 l� ph�c ch� h�n");
		WriteLog("[K�t h�n]:"..GetName().."�� m� 1 l� bao ch� h�n");
	end;
end;