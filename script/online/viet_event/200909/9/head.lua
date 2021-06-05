Include("\\script\\lib\\globalfunctions.lua");

GIVE_LETTER_ID = 2430
GIVE_LETTER_TIME_ID = 2431
GIVE_MAX = 4

szNpcName = "<color=green>Minh Ch� Kim S�n<color>: "

function give_letter()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20090928 or nDate > 20091025 then
		Say(szNpcName.."Ho�t ��ng �� k�t th�c.",0)
		return
	end	
	local tSay ={
		"T�ng qu� ��c bi�t (1 M�t H�m S� M�n + 1 B�nh ��u Xanh + 1 B�nh Th�p C�m)/#give_gift(1)",
		"T�ng qu� th��ng (1 B�nh ��u Xanh + 1 B�nh Th�p C�m)/#give_gift(2)",
		"Th�t ng�i qu�! T�i h� s� quay l�i sau!/nothing";
	}	
	Say(szNpcName.."�a t�! S� ph� c�a thi�u hi�p qu� th�t c� l�ng!",getn(tSay),tSay);	
end

function give_gift(nIndex)
	local nDate = tonumber(date("%d"))
	local nTaskVal = GetTask(GIVE_LETTER_ID)
	
	if GetByte(nTaskVal, 2) ~= nDate then
		local nVal = SetByte(nTaskVal,1,0)
		SetTask(GIVE_LETTER_ID,SetByte(nVal,2,nDate))		
	end
	
	local nGiveByteVal = GetByte(GetTask(GIVE_LETTER_ID),1)
	if nGiveByteVal >= GIVE_MAX then
		Say(szNpcName.."H�m nay thi�u hi�p �� t�ng qu� cho ta "..GIVE_MAX.." l�n r�i!",0);	
		return
	end
	
	if GetTime() - GetTask(GIVE_LETTER_TIME_ID) < 3600 then
		local nRemain = GetTask(GIVE_LETTER_TIME_ID) + 3600 - GetTime()
		Say(szNpcName.."Th�i gian gi�a 2 l�n t�ng qu� l� <color=red>1 gi�<color>. Thi�u hi�p c�n "..nRemain.." gi�y.",0)
		return
	end
	
	if GetItemCount(2,1,30108) < 1 then
		Say(szNpcName.."Thi�u hi�p ��n ��a v�i ta ch�ng, sao ta ch�ng th�y thi�u hi�p mang theo g� c�, hay l� �� �� r�i tr�n ���ng ��n ��y r�i?",0)
		return
	end	
	
	if GetItemCount(2,1,30109) < 1 then
		Say(szNpcName.."Thi�u hi�p ��n ��a v�i ta ch�ng, sao ta ch�ng th�y thi�u hi�p mang theo g� c�, hay l� �� �� r�i tr�n ���ng ��n ��y r�i?",0)
		return
	end	
		
	local nPoint = 0
	if nIndex == 1 then
		if GetItemCount(2,1,1020) < 1 then
			Say(szNpcName.."Thi�u hi�p ��n ��a v�i ta ch�ng, sao ta ch�ng th�y thi�u hi�p mang theo g� c�, hay l� �� �� r�i tr�n ���ng ��n ��y r�i?",0)
			return
		end
		if DelItem(2,1,30108,1) == 1 and DelItem(2,1,30109,1) == 1 and DelItem(2,1,1020,1) == 1 then
			nPoint = 30
		end	
	elseif nIndex == 2 then
		if DelItem(2,1,30108,1) == 1 and DelItem(2,1,30109,1) == 1 then
			nPoint = 15
		end
	else
		Say(szNpcName.."Thi�u hi�p ��n ��a v�i ta ch�ng, sao ta ch�ng th�y thi�u hi�p mang theo g� c�, hay l� �� �� r�i tr�n ���ng ��n ��y r�i?",0)
		return	
	end
	SetTask(GIVE_LETTER_ID,SetByte(GetTask(GIVE_LETTER_ID),1,nGiveByteVal + 1))
	SetTask(GIVE_LETTER_TIME_ID,GetTime())
	SetTask(336,GetTask(336) + nPoint)
	Msg2Player("B�n nh�n ���c "..nPoint.." �i�m s� m�n.")
	Say("�a t�! Xin chuy�n l�i ��n S� ph� thi�u hi�p ta �� nh�n ���c qu�!",0)
end

function nothing()	
end