Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� qu� h�n l�? B�n trong ch�a <color=yellow>5<color> ph�o hoa.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],5)
		Msg2Player("B�n nh�n ���c 5 ph�o hoa h�n l�");
		WriteLog("[K�t h�n]:"..GetName().."�� m� 1 t�i ph�o hoa h�n l�");
	end;
end;