--�޺��鵤������1~5����ǰ���飬��󲻳���50���
function OnUse()

local PlayerExpAdd = floor(random(1,5)*0.01*GetExp());
	
	if PlayerExpAdd == 0 then 
		ModifyExp(1);
		DelItem(2,0,136,1,1);
		Say("B�n �� s� d�ng 1 vi�n La H�n Linh ��n, t�ng th�m <color=yellow>1<color> �i�m kinh nghi�m!",0);
		return 
	elseif PlayerExpAdd<= 500000 then
		ModifyExp(PlayerExpAdd);
		DelItem(2,0,136,1,1);
		Say("B�n �� s� d�ng 1 vi�n La H�n Linh ��n, t�ng th�m <color=yellow>"..PlayerExpAdd.."<color> �i�m kinh nghi�m!",0);
		return 
	else
		ModifyExp(500000);
		DelItem(2,0,136,1,1);
		Say("B�n �� s� d�ng 1 vi�n La H�n Linh ��n, t�ng th�m <color=yellow>500000<color> �i�m kinh nghi�m!",0);
		return
		
	end;
		
end;
