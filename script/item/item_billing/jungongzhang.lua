Include("\\script\\newbattles\\functions.lua");
tbJUNGONGZHANG = 
{
	[1] = {"Huy hi�u chi�n c�ng (ti�u)",2,1,9999,2},
	[2] = {"Qu�n C�ng ��i",2,1,9998,5},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,10},
}

function OnUse(nItemIdx)
	if 1==1 then
		return 0;
	end;
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B�n kh�ng s� d�ng huy hi�u chi�n c�ng!");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	if nTimePassed < ITEM_SPYCLOTH_TIME then
		Talk(1,"","Huy hi�u chi�n c�ng v� m�t n� gi�n �i�p kh�ng th� c�ng s� d�ng! Th�i gian s� d�ng m�t n� chi�n �cng c�a ng��i c�n: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
		return 0;
	end;
	local selTab = {
				format("��ng �/#use(%d)",nType),
				"H�y c�ng d�ng huy hi�u chi�n c�ng/cancel_effect",
				"H�y b�/nothing",
				}
	local nCurMultiple = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurMultiple ~= 0 then
		nCurMultiple = nCurMultiple + 1;
	end;
	Say("C�ng d�ng huy hi�u chi�n c�ng c�a ng��i hi�n l� <color=yellow>"..nCurMultiple.."<color>l�n. S� d�ng <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> khi chi�n tr�n k�t th�c s� nh�n ���c <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> l�n c�ng tr�ng. ��ng � s� d�ng ch�? <enter> Ch� �: <enter>1: <color=yellow> C�ng tr�ng kh�ng t��ng �ng v�i huy hi�u chi�n c�ng s� b� kh�u tr� khi chi�n tr�n k�t th�c. <color><enter>2: �i�m c�ng tr�ng <color=yellow>s� c�n c� v�o s� l�n th�ng b�i m� t�ch l�y<color>.<enter>3 <color=red>Qu�n c�ng tr�ng v� M�t n� gi�n �i�p kh�ng th� ��ng th�i s� d�ng<color>!",getn(selTab),selTab);
end;

function cancel_effect()
	BT_SetData(PT_MULTIPLE_JUNGONG,0)
	Talk(1,"","H�y b� c�ng d�ng huy hi�u chi�n c�ng, hi�n c�n l� <color=yellow>0<color> l�n")
	Msg2Player("C�ng d�ng huy hi�u chi�n c�ng hi�n l� 0 l�n");
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbJUNGONGZHANG) do
		if genre == tbJUNGONGZHANG[i][2] and detail == tbJUNGONGZHANG[i][3] and particular == tbJUNGONGZHANG[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	BT_SetData(PT_MULTIPLE_JUNGONG,tbJUNGONGZHANG[nType][5]-1)
	Talk(1,"","C�ng d�ng huy hi�u chi�n c�ng hi�n l� <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> l�n");
	Msg2Player("C�ng d�ng huy hi�u chi�n c�ng hi�n l� "..tbJUNGONGZHANG[nType][5].."l�n")
end;