function OnUse(nItemIndex)
	local nLevel = GetLevel()
	local nNeedExp = floor((nLevel^2*100000)/(80^2))
	local selTab = {
			"��ng �/#confirm("..nItemIndex..")",
			"H�y b�/nothing",
			}
	Say("��ng c�p hi�n t�i c� th� nh�n ���c <color=yellow>"..nNeedExp.."<color> �i�m kinh nghi�m. B�n mu�n s� d�ng kh�ng?",
		getn(selTab),
		selTab)
end;

function confirm(nItemIndex)
	if GetTask(559) > GetTask(1714)*4 then
		Talk(1,"","Giang h� t�m ��c c�a ��i hi�p �� l�nh ng� ��n m�c c�c h�n r�i, kh�ng c�n ph�i s� d�ng th�m ��u.");
		return 0;
	end;
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		local nLevel = GetLevel()
		local nNeedExp = floor((nLevel^2*100000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("B�n nh�n ���c "..nNeedExp.." �i�m kinh nghi�m.")
		SetTask(559,GetTask(559)+1);
	end;
end;

function nothing()

end;