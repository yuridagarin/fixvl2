--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 3  then
		Say("D� ch�nh hay t�, ch� c�n c� l�ng ��u c� th� k�t l�m b�ng h�u. K�t giao nhi�u b�ng h�u, h�a kh� �t sinh t�i. Ng��i b�n tr� mu�n bi�t l�m sao �� k�t giao b�ng h�u kh�ng?",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
	SetTask(1,4)
	else
		Say("C�n ta ��a ng��i ��n Nam Bi�n Kinh kh�ng?",2,"C�n/gotomap53","Kh�ng c�n/noneed")
	end
end;


function yes()
	Talk(1,"no","Khi ng��i nh�n th�y ng��i mu�n k�t giao ho�c t�n ng��i ��, nh�n Ctrl+chu�t ph�i l�n ng��i ho�c t�n l� c� th� m�i ng��i �� k�t l�m b�ng h�u. N�u bi�t s� id c�a ��i ph��ng, c� th� th�ng qua s� id �� t�m ��i ph��ng m�i k�t giao. Sau khi th�nh b�ng h�u, �� th�n m�t hai ng��i s� t�ng d�n, c� th� k�t th�nh phu th� ho�c k�t ngh�a kim lan!")
	Earn(1000)
end

function no()
	Talk(1,"","Ta �� mang h�ng h�a ch� l�i ��i c�n v� r�i. H�y gi�p ta nh�n h�n ��n l�y!")
end


function gotomap53()
	SetFightState(1)
	NewWorld(201, 1575 ,3168);
end

function noneed()
end
	