function main()
	UWorld1508 = GetTask(1508)
	if ( UWorld1508 == 10 and  GetLevel() > 7 )  then
		Say("C� th� gi�p ta t�m L�ng Nhi kh�ng? N� ra ngo�i t� s�m ��n gi� v�n ch�a th�y v�.",2,"��ng �/yes1508","Ta c�n ch�t vi�c/no1508")
	elseif ( UWorld1508  >= 5 and  UWorld1508  < 40)  then	
		Talk(1,"","V�n ch�a c� tin t�c c�a L�ng Nhi? Ta ph�i l�m sao b�y gi�?")
	elseif  UWorld1508  ==40    then
		Talk(1,"","T��ng c�ng! T�i v� M�c th�c th�c kh�ng c� l�m g� c� l�i v�i �ng, t�i sao L�ng Nhi l�i ngh� nh� th�? Vi�c ��n n��c n�y, �ng k�u t�i l�m sao s�ng ��y!")
		SetTask(1508,45)
		Earn(1000)
		ModifyExp(1000)
		AddNote("Ho�n th�nh nhi�m v� Lang T�m T� Ph�")
		TaskTip("Ho�n th�nh nhi�m v� Lang T�m T� Ph�")
	elseif  UWorld1508  >=45    then
		Talk(1,"","T��ng c�ng! L�ng Nhi c�a ch�ng ta c�ng �� l�n, kh�ng c�n t�i ph�i lo l�ng, t�i s� theo �ng.")
	else
		Talk(1,"","Cha n� m�t s�m �� l�i hai m� con ta, n�u kh�ng c� M�c th�c th�c gi�p �� th�t kh�ng bi�t ph�i l�m sao!")
	end
end;

function yes1508 ()
		Talk(1,"","L�ng Nhi th��ng ch�i chung v�i Thu�n Oa trong th�nh, ng��i ��n h�i Thu�n Oa xem?")
		SetTask(1508,5)
		AddNote("T�m Thu�n Oa h�i tin t�c c�a L�ng Nhi")
		TaskTip("Nh�n nhi�m v� Lang T�m T� Ph�.")
end;

function no1508 ()
		Talk(1,"","B�ng h�u b�n vi�c ta kh�ng th� mi�n c��ng!")
end;
