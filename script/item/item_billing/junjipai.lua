function OnUse(nItemIdx)
	local selTab = {
				format("��ng �/#use(%d)",nItemIdx),
				"H�y b�",
				}
	Say("S� d�ng Qu�n t�ch b�i c� th� t�ng <color=yellow>1000<color> �i�m t�ch l�y.",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(707,GetTask(707)+1000)
		Msg2Player("B�n s� d�ng Qu�n t�ch b�i, �i�m t�ch l�y chi�n tr�n t�ng 1000 �i�m");
		WriteLog("[Chi�n tr��ng Nh�n M�n Quan]:"..GetName().."S� d�ng Qu�n t�ch b�i ");
	end;
end;