function main()
	if (GetSex()==2 and GetPlayerFaction() == 2) then
		Say("S� mu�i mu�n h� s�n?",2,"Phi�n M�c s� ca/outwudang","Ta ��n th�m S� ca th�i m�!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 2) then
		Say("C� n��ng t�m ta c� vi�c g�?",2,"Phi�n ��o tr��ng ��a t�i h� xu�ng n�i/outwudang","Kh�ng c� vi�c g�!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 2) then
		Say("S� �� mu�n l�n ra ngo�i ch�i?",2,"�� ph�ng m�nh h� s�n/outwudang","Kh�ng c� vi�c g�!/no")
	else
		Say("��i hi�p! B�n ��o c� th� gi�p g�?",2,"Phi�n ��o tr��ng ��a t�i h� xu�ng n�i/outwudang","Kh�ng c� vi�c g�!/no")
	end
end;


function outwudang()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")	
	else
    SetFightState(0)
		i=random(1,4)
		if i==1 then
			NewWorld(350, 1518 ,3050)
		elseif i==2 then
			NewWorld(350, 1362 ,3053)
		elseif i==3 then
			NewWorld(350, 1332 ,2865)
		else 
			NewWorld(350, 1542 ,2865)
		end
	end
end

function no()
end;

