--�꾩����to�꾩
--GGH




function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 409 then
		return
	end
	if (GetPKValue() <= 3 ) then
		NewWorld(400, 1426 ,2857)
		SetFightState(0);
	else
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")
	end	
end;