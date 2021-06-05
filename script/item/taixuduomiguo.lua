
-- ̫����ܹ�
TAIXU_TIME = 1782		--��¼���һ�ν���̫��þ���ʱ��
EAT_TIME_TODAY = 1795	-- ����ʹ��̫����ܹ��Ĵ���
MASK = 10000000

MAX_ENTER_CHANCE = 200

function OnUse(nItemIndex)
	local nValue = GetTask(EAT_TIME_TODAY)
	local nChance = floor(nValue / MASK)
	local nDate = mod(nValue, MASK)
	
	local nNow = tonumber(date("%y%m%d"))
	local nDuration = nNow - GetTask(TAIXU_TIME)
	if nNow <= nDate and nChance >= MAX_ENTER_CHANCE then
		WriteLog("<Th�i H� �a M�t Qu�>"..GetName().."Trong m�t ng�y s� d�ng qu�"..MAX_ENTER_CHANCE.." l�n")
		Msg2Player("B�n s� d�ng qu� nhi�u Th�i H� �a M�t Qu�, kh�ng th� ti�p t�c s� d�ng")
	elseif nDuration > 0 then
		Msg2Player("H�m nay b�n v�n v�o ���c Th�i H� Huy�n c�nh, kh�ng c�n d�ng Th�i H� �a M�t Qu�")
	else
		if DelItem(2,1,387, 1) == 1 then
			SetTask(TAIXU_TIME, 0)
			if nNow > nDate then
				nChance = 1
			else
				nChance = nChance + 1
			end
			SetTask(EAT_TIME_TODAY, nNow + 10000000 * nChance)
			Msg2Player("Th�nh c�ng s� d�ng Th�i H� �a M�t Qu�, c� th� ti�p t�c v�o Th�i H� Huy�n c�nh")
		else
			Msg2Player("B�n kh�ng c� Th�i H� �a M�t Qu�")
		end
	end
end
