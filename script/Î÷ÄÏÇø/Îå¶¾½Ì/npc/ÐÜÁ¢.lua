-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��NPC����Script
-- By StarryNight
-- 2006/02/09 PM 17:17

-- ֱ���Լ������İɣ�

-- ======================================================

function main()
	if GetSex()==1 then
		Say("B�ng h�u mu�n r�i kh�i ��y �?",2,"L�m phi�n huynh ��i!/outwudu","Kh�ng c�n ��u!/no")
	else
		Say("Ti�u c� n��ng mu�n r�i kh�i �?",2,"L�m phi�n huynh ��i!/outwudu","Kh�ng c�n ��u!/no")
	end
end;

function outwudu()
	SetFightState(0)
	i=random(1,3)
		if i==1 then
			NewWorld(100, 1521 ,2870)
		elseif i==2 then
			NewWorld(100, 1386 ,2905)
		else 
			NewWorld(100, 1555 ,3080)
	end
end

function no()
end;
