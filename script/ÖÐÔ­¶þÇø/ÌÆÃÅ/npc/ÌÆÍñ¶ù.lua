function main()
	if (GetSex()==2 and GetPlayerFaction() == 5) then
		Say("S� mu�i mu�n r�i kh�i ��y?",2,"L�m phi�n s� t�!/outtangmen","Ta ��n th�m S� t� th�i m�!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 5) then
		Say("C� n��ng t�m ta c� vi�c g�?",2,"Phi�n t� t� ��a ta r�i ���ng M�n/outtangmen","Kh�ng c� g�/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 5) then
		Say("S� �� l�i mu�n tr�n ra ngo�i ch�i �?",2,"�� ph�ng m�nh h� s�n/outtangmen","Kh�ng c� vi�c g�/no")
	else
		Say("C�ng t�! Ta c� th� gi�p g�?",2,"Phi�n c� n��ng ��a ta m�t �o�n/outtangmen","Kh�ng c� g�/no")
	end
end;


function outtangmen()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")	
	else
    SetFightState(0)
		i=random(1,4)
		if i==2 then
			NewWorld(300, 1677 ,3671)
		elseif i==3 then
			NewWorld(300, 1681 ,3464)
		else 
			NewWorld(300, 1911 ,3442)
		end
	end
end;

function no()
end;

