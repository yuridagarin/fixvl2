
tbITEMINFO = 
{
	[1] = {"H�c Ng�c Ng�c Cao t�n",2,1,9994,100,{"Ng�c Cao t�n (chi�n tr��ng)",1,0,200}},
	[2] = {"Sinh Sinh H�a T�n",2,1,9993,100,{"Sinh Sinh H�a T�n (chi�n tr��ng)",1,0,201}},
	[3] = {"V�n V�t Quy Nguy�n ��n",2,1,9992,100,{"V�n V�t Quy Nguy�n ��n (chi�n tr��ng)",1,0,202}},
	[4] = {"C�u Chuy�n H�i H�n ��n",2,1,9991,100,{"C�u Chuy�n H�i H�n ��n (chi�n tr��ng)",1,0,203}},
}

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B�n s� d�ng kh�ng ph�i l� chi�n d��c");
		return 0;
	end;
	local selTab = {
				format("��ng �/#use(%d,%d)",nItemIdx,nType),
				"H�y b�/nothing",
				}
	Say("Ng��i ��ng � s� d�ng <color=yellow>"..tbITEMINFO[nType][1].."<color> ch�?",getn(selTab),selTab);
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbITEMINFO) do
		if genre == tbITEMINFO[i][2] and detail == tbITEMINFO[i][3] and particular == tbITEMINFO[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(tbITEMINFO[nType][6][2],tbITEMINFO[nType][6][3],tbITEMINFO[nType][6][4],tbITEMINFO[nType][5]);
		Msg2Player("B�n nh�n ���c "..tbITEMINFO[nType][5].."c�i"..tbITEMINFO[nType][6][1])
	end;
end;