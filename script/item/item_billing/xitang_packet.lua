Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� bao k�o m�ng? B�n trong ch�a <color=yellow>20<color> vi�n k�o m�ng.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(2,30) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],20)
		Msg2Player("B�n nh�n ���c 20 vi�n k�o m�ng");
		WriteLog("[K�t h�n]:"..GetName().."�� m� 1 bao k�o m�ng");
	end;
end;