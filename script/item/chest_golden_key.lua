
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate <= 20080128 then
		Talk(1,"","Ch�a kh�a v�ng ch� c� th� s� d�ng sau <color=yellow>29.01.2008<color>.");
		return 0;
	end;
	if GetTask(1480) == 1 then
		Talk(1,"","M�i nh�n v�t ch� c� th� s� d�ng 1 l�n ch�a kh�a v�ng.");
		return 0;
	end;
	if GetFightState() == 1 then
		Talk(1,"","D�ng th�c chi�n ��u kh�ng th� s� d�ng v�t ph�m n�y!");
		return 0;
	end;
	local selTab = {
				"��ng �/#use("..nItemIdx..")",
				"H�y b�/nothing",
				}
	Say("B�n x�c ��nh s� d�ng <color=yellow>Ch�a kh�a v�ng<color>?",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPage = GetStoreBoxPageCount();
		SetStoreBoxPageCount(nPage+1);
		Msg2Player("R��ng c�a b�n �� c� th�m 1 trang");
		SetTask(1480,1);
	end;	
end;

function nothing()

end;