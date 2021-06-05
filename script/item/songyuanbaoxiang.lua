Include("\\script\\lib\\globalfunctions.lua");

g_tbItem = 
{
	[1] = {2,1,595,"R��ng B�u T�ng Nguy�n ",10},
	[2] = {2,1,596,"R��ng B�u ��i T�ng Nguy�n ",200},
}

function OnUse(nItemIdx)
	local nIdx = get_item_index(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","C�i b�n �ang s� d�ng kh�ng ph�i b�t k� lo�i n�o thu�c R��ng B�u T�ng Nguy�n.");
		return 0;
	end;
	local selTab = {
			format("��ng �/#use(%d,%d)",nItemIdx,nIdx),
			"H�y b�/nothing",
			}
	Say("B�n mu�n m� <color=yellow>"..g_tbItem[nIdx][4].."<color>? B�n s� nh�n ���c <color=yellow>"..g_tbItem[nIdx][5].." T�ng Nguy�n Th�ng B�o<color>.",getn(selTab),selTab);
end;

function get_item_index(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nIdx)
	local szPacketName = g_tbItem[nIdx][4];
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","H�nh trang v� s�c l�c kh�ng ��, �i�u ch�nh l�i h�nh trang r�i m�"..szPacketName.."!");
		return 0;
	end;	
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nNum = g_tbItem[nIdx][5];
		local nRetCode = AddItem(2,1,594,nNum);
		if nRetCode == 1 then
			Msg2Player("B�n �� m�"..szPacketName..", nh�n ���c "..nNum.." T�ng Nguy�n Th�ng B�o ");
			WriteLog("[R��ng B�u T�ng Nguy�n ]"..GetName().." �� m� "..szPacketName);
		else
			WriteLog("[T�ng Nguy�n R��ng B�u B�o l�i ]:"..GetName().."M�"..szPacketName.." b� l�i, nRetCode:"..nRetCode);
		end;
	end;
end;