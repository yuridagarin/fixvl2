Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("B�n mu�n t�m th�i r�i kh�i L�i ��i t� v� �?",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
end;

function yes()
	LeaveGame(1);
end

function no()
	return
end
