Include("\\script\\task\\global_task\\gtask_data.lua")

function main()	
	strTab = {"Ta v� tr�m ch� �n th�t m� �� b� Huy�n Minh s� th�c ph�t m�t th�ng, ng��i ��ng ��n qu�y r�y ta.",
			  "Ng��i xu�t gia kh�ng h� n�i d�i, ta c� �n th�t ch� th�t nh�ng l�c �� kh�ng ai nh�n th�y sao s� th�c l�i bi�t ta �n ch�?",
			  "�� t� T�nh Th�ng t�m kh�ng t�t �� l� �n m�n, xin ph�t t� tr�ng ph�t."}
	
	local i = random(3);
	if IsHaveTaskOrCanGet2(15, 16) == 1 then
		Say(strTab[i], 2,"Ti�n v�o Thi�u L�m Ngh� S� ���ng/entrance","Kh�ng c�n ��u/do_nothing")
	else
		Say(strTab[i], 0)
	end
end;

function entrance()
		NewWorld(6012,1582,3217)
		SetFightState(0);
		return 1;
end

function do_nothing()
end
