function main()
	if	GetPlayerFaction() == 3 then
		Say("S� mu�i mu�n xu�ng n�i �?",2,"Phi�n ��i t� ��a ta xu�ng n�i!/outemei","Ta ��n th�m S� t� th�i m�!/no_emei")
	else
		Say("<color=green>Nghi Ho�<color>: Thi�u hi�p t�m b�n ni c� vi�c g� kh�ng?",2,"Xin ��a t�i h� xu�ng n�i!/outemei","��n chi�m ng��ng c�nh Ph�t/no_other")
	end
end;

function outemei()
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
end

function no_emei()
	Say("�a t� S� mu�i c� l�ng!",0)
end;


function no_other()
	Say("<color=green>Nghi Ho�<color>: M�i thi�u hi�p v�o trong.",0)
end;