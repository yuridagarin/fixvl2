--���Ž��Ļ�����

tItemName = {
	{"R��ng Thi�n M�n Kim V�n H� Ph�",2,100,48},
	{"Thi�n M�n Kim V�n H� Ph�",2,100,45,10}
}
function OnUse()
	Say("B�t ��u"..tItemName[1][1].."C� th� nh�n ���c <color=yellow>"..tItemName[2][5].."c�i"..tItemName[2][1].."<color>, c� kh�i ��ng?",
		2,
		"\n��ng/confirm_use",
		"\nKh�ng c�n/nothing")
end

function nothing()

end

function confirm_use()
	if DelItem(tItemName[1][2],tItemName[1][3],tItemName[1][4],1) == 1 then
		local nRet,nIdx = AddItem(tItemName[2][2],tItemName[2][3],tItemName[2][4],tItemName[2][5],5);
		if nRet == 1 then
			Msg2Player("B�n nh�n ���c ["..tItemName[2][1].."]x"..tItemName[2][5]);
		end
		WriteLog("["..tItemName[1][1].."]: t�i kho�n:"..tostring(GetAccount())..",T�n:"..tostring(GetName())..",Th�i gian:"..tonumber(date("%Y%m%d"))..",[m�"..tItemName[1][1].."Nh�n ���c"..tItemName[2][1].."x"..tItemName[2][5].."], k� hi�u:"..nRet)
	end
end