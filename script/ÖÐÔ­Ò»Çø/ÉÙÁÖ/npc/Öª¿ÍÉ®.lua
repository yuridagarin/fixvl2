function main()
	if	GetPlayerFaction() == 1 then
		Say("S� �� mu�n xu�ng n�i kh�ng?",2,"Mu�n!/outshaolin","Ta ��n th�m S� huynh th�i m�!/no_shaolin")
	else
		Say("A Di �� Ph�t! ���c th� ch� h� c� Thi�u L�m, th�t l�y l�m vinh d� cho b�n t� qu�, ti�u t�ng l�m sao c� th� t� ch�i ���c ch�?",2,"Phi�n ��i s� ��a t�i h� xu�ng n�i/outshaolin","T�i h� mu�n tham quan Thi�u L�m/no_other")
	end
end;

function outshaolin()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")	
	else
    SetFightState(0)
		i=random(1,4)
    if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else   
			NewWorld(200, 1249 ,2732)
		end
	end
end;


function no_shaolin()
	Say("�a t�!",0)
end;

function no_other()
	Say("A Di �� Ph�t! M�i th� ch� v�o trong!",0)
end;