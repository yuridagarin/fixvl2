---�ؾ�������.lua---
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>�� t� C�n L�n th�n b� <color>: "
function main()
	Say("Kh�ng ng� Ng� Vi�t l�o t� d�ng nha ph�p tinh ch� ra Huy�t C� L�u. Nha v�t �ang � sau m�t th�t, ng��i c� th� ��n �� tr� ma gi�p ta?",3,"�i Thi�n S� m�t c�nh/tianshimijing","Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_33","Kh�ng c�n ��u!/no");
end;
function tianshimijing()
		NewWorld(329,1886,3762);
		SetFightState(1)
end


function no()
end;