--���񵤣���PKֵ1��
function OnUse()

local PlayerPK = GetPKValue();
	
	if PlayerPK > 0 then
		AddPKValue(-1);
		DelItem(2,0,137,1,1);
		Say("Tr� PK c�a b�n gi�m xu�ng <color=yellow>1<color>!",0);
	else
		Say("Tr� Pk c�a b�n l� <color=yellow>0<color>, v�t ph�m s� d�ng v� hi�u!",0);
		
	end;
	
end;	