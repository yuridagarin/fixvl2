g_szPacketName = "H�p T�n Nguy�n ngo�i trang";
g_szItemName = "1 T�n Nguy�n ngo�i trang";

function OnUse(nItemIdx)
	local selTab = {
				"��ng �/#confirm("..nItemIdx..")",
				"H�y b�/nothing",
				}
	Say("B�n mu�n m� <color=yellow>"..g_szPacketName.."<color>? B�n c� th� nh�n ���c <color=yellow>"..g_szItemName.."<color>.",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if gf_JudgeRoomWeight(1,50,"") == 0 then
		return 0;
	end;
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		local nRet, nIndex = AddItem(0,109,495+nBody-1,1);
		if nRet == 1 then		
			SetItemExpireTime(nIndex, nExpireTime);
		end
		Msg2Player("B�n nh�n ���c "..g_szItemName);
	end;
end;

--�ж����ϵĸ��Ӻ͸������������������������������˵Ļ���ʾҪ��Talk��ʾ����������ʾ�˵�����
function gf_JudgeRoomWeight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--������˵���������
			Talk(1,"",szMsgHead.."H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;

function nothing()

end;