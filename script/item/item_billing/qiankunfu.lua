-- Ǭ����

tQKF = {2, 0, 555}

tItem =
{
	{0, 102, 24, "��ng Ph��ng Long Ch�u"},
	{0, 102, 23, "Nh� �"},
	{0, 102, 22, "C�t T��ng"},		
	{0, 102, 8840, "Huy Ho�ng Chi Th�y"},
	{0, 102, 8841, "Vinh D� Chi Th�y"},
	{0, 102, 8842, "Huy Ho�ng Chi K�"},
	{0, 102, 8843, "Vinh D� Chi K�"},
	{0, 102, 8844, "Huy Ho�ng Qu�t Kh�i"},
	{0, 102, 8845, "Vinh D� Qu�t Kh�i"},
	{0, 101, 8001, "Vi�m �� trang (Nam Ti�u Chu�n)"},
	{0, 101, 8002, "Vi�m �� trang (Nam Kh�i Ng�)"},
	{0, 101, 8003, "Vi�m �� trang (N� G�i C�m)"},
	{0, 101, 8004, "Vi�m �� trang (Ki�u N�)"},
	{0, 101, 8055,"Thi�n Chi Vi�m �� Trang (Nam Ti�u Chu�n)"},
	{0, 101, 8056,"Thi�n Chi Vi�m �� Trang (Nam Kh�i Ng�)"},
	{0, 101, 8057,"Thi�n Chi Vi�m �� Trang (N� G�i C�m)"},
	{0, 101, 8058,"Thi�n Chi Vi�m �� Trang (Ki�u N�)"},
	{0, 3, 8851, "T� Quang To�i V� �ao"},
	{0 ,5, 8852, "T� Quang To�i V� C�n"},
	{0, 8, 8853, "T� Quang C�u Nh� Tr��ng"},
	{0, 0, 8854, "T� Quang H�o Nhi�n Th�"},
	{0, 1, 8855, "T� Quang V� H�nh Ch�m"},
	{0, 2, 8856, "T� Quang T� Tinh Ki�m"},
	{0, 10, 8857, "T� Quang Ph�ng Ho�ng C�m"},
	{0, 0, 8858, "T� Quang Ng� Nh�c Th�"},
	{0, 5, 8859, "T� Quang Ph� Thi�n C�n"},
	{0, 2, 8860, "T� Quang H�ng Qu�n Ki�m"},
	{0, 9, 8861, "T� Quang Sinh T� B�t"},
	{0, 6, 8862, "T� Quang Ph� Qu�n Th��ng"},
	{0, 4, 8863, "T� Quang Khai Thi�n Cung"},
	{0, 7, 8864, "T� Quang �m D��ng Nh�n"},
	{0, 11, 8865, "T� Quang U Minh Tr�o"},	
	{0, 102, 8851, "T� Vi�n Chi�n"},
	{0, 102, 8853, "T� Vi�n Chi�n"},
	{0, 102, 8855, "T� Vi�n Chi�n"},
	{0, 102, 8857, "T� Vi�n Chi�n"},
	{0, 102, 8859, "T� Vi�n Chi�n"},
	{0, 102, 8861, "T� Vi�n Chi�n"},
	{0, 102, 8863, "T� Vi�n Chi�n"},
	{0, 102, 8865, "T� Vi�n Chi�n"},
	{0, 102, 8867, "T� Vi�n Chi�n"},
	{0, 102, 8869, "T� Vi�n Chi�n"},
	{0, 102, 8871, "T� Vi�n Chi�n"},
	{0, 102, 8873, "T� Vi�n Chi�n"},
	{0, 102, 8875, "T� Vi�n Chi�n"},
	{0, 102, 8877, "T� Vi�n Chi�n"},
	{0, 102, 8852, "T� Vi�n ��u"},
	{0, 102, 8854, "T� Vi�n ��u"},
	{0, 102, 8856, "T� Vi�n ��u"},
	{0, 102, 8858, "T� Vi�n ��u"},
	{0, 102, 8860, "T� Vi�n ��u"},
	{0, 102, 8862, "T� Vi�n ��u"},
	{0, 102, 8864, "T� Vi�n ��u"},
	{0, 102, 8866, "T� Vi�n ��u"},
	{0, 102, 8868, "T� Vi�n ��u"},
	{0, 102, 8870, "T� Vi�n ��u"},
	{0, 102, 8872, "T� Vi�n ��u"},
	{0,102, 8874,"T� Vi�n ��u"},
	{0,102, 8876,"T� Vi�n ��u"},
	{0,102, 8878,"T� Vi�n ��u"},
	{2, 0, 1083, "Th�i d�ch h�n nguy�n ph�"},
	{0, 105, 38, "L�u V�n K� L�n Th�"},
	{2, 0, 1084, "Thi�n Qu�i Th�ch"},
	{0,102,8846, "Huy Ho�ng"},
	{0,102,8847, "Vinh D�"},
	{0, 105, 30038, "Nguy�t L��ng Th�"},
}

function OnUse()
	EnterQKBind()
end

function OnItemLock()
	Say("Trang b� �� kh�a kh�ng th� s� d�ng C�n Kh�n ph�", 0)
end

function OnBindCheck(nGeren, nDetail, nParticular, bIsBind)
	if bIsBind > 0 then		-- �Ѿ��ǰ�װ����
		Say("Trang b� �� c� th� giao d�ch.", 0)
		return 0
	end

	local nIndex = CheckInItemList(nGeren, nDetail, nParticular)
	if nIndex == 0 then
		local szMsg = "Ch� c� <color=yellow>"
		for i = 1, getn(tItem) do
			if i ~= getn(tItem) then
				szMsg = szMsg..tItem[i][4].."<color>,<color=yellow>"
			else
				szMsg = szMsg..tItem[i][4].."<color>"
			end
		end
		szMsg =  "Ch� c� <color=yellow>��ng Ph��ng Long Ch�u, Nh� �, C�t T��ng, Huy Ho�ng Chi Th�y, Vinh D� Chi Th�y, Huy Ho�ng Chi K�, Vinh D� Chi K�, Vi�m �� Trang, Thi�n Chi Vi�m �� Trang, V� kh� T� Quang n�ng c�p, T� Quang Chi�n, T� Quang ��u, Th�i d�ch h�n nguy�n ph�, L�u V�n K� L�n Th�, Huy Ho�ng Qu�t Kh�i, Vinh D� Qu�t Kh�i, Thi�n Qu�i Th�ch, Huy Ho�ng, Vinh D� <color>"
		szMsg = szMsg.." m�i d�ng ���c C�n Kh�n ph� m� ra, ti�n h�nh giao d�ch!"
		Say(szMsg, 0)
		return 0
	else
		-- ɾ��Ǭ������һ��Ҫ�ǵ�ɾ����������
		if DelItem(tQKF[1], tQKF[2], tQKF[3], 1) == 1 then
			local szMsg = tItem[nIndex][4].."�� m� ���c c� th� ti�n h�nh giao d�ch."
			Say(szMsg, 0)
			return 1
		else
			Msg2Player("B�n kh�ng c� C�n Kh�n ph�")
			return 0
		end
	end
end


function CheckInItemList(nGeren, nDetail, nParticular)	
	local isExist = 0
	for index, value in tItem do
		if nGeren == value[1] and nDetail == value[2] and nParticular == value[3] then
			isExist = index
			break
		end
	end
	return isExist
end
