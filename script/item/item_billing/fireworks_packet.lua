Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("M�/#open(%d)",nItemIdx),
			"L�n sau h�y m�!/nothing",
			}
	Say("B�n mu�n m� Di�m h�a bao?",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(6,18) == 0 then
		Talk(1,"","B�n kh�ng �� kho�ng tr�ng ho�c s�c l�c, xin ki�m tra l�i!!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=189,194 do
			AddItem(2,1,i,3)
		end;
		Msg2Player("B�n nh�n ���c 3 Tranh S�c Y�n Hoa")
		Msg2Player("B�n nh�n ���c 3 Ph�o hoa Cam")
		Msg2Player("B�n nh�n ���c 3 X�ch M�c H�a Di�m")
		Msg2Player("B�n nh�n ���c 3 Lam M�c H�a Di�m")
		Msg2Player("B�n nh�n ���c 3 Tranh M�c H�a Di�m")
		Msg2Player("B�n nh�n ���c 3 Ph�o hoa Th�n b�")
	end;
end;