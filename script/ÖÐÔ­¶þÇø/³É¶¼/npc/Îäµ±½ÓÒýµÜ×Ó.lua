
function main()
	if GetPlayerFaction() == 2  then
		Say("Xem ra c� vi�c phi�n ��n ta, ��ng kh�ng?",3,"Phi�n huynh ��a �� xu�ng n�i!/gotowudang","T�m hi�u khu v�c luy�n c�p/maphelp","Thay �� v�n an s� ph�!/no")
	elseif GetPlayerFaction() == 1  then
		Talk(1,"","Th� ra l� ti�u s� ph� c�a Thi�u L�m, kh�ng bi�t c� g� ch� gi�o?")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Th� ra l� n� hi�p c�a Nga My! Qu� ph�i v� b�n ph�i c� giao h�o, ��ng n�n kh�ch s�o!")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","V� �ang ch�ng t�i r�t ng��ng m� tuy�t k� c�a qu� bang, hy v�ng s� c� d�p th� gi�o.")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","Qu� ph�i c�ng c� th� g�i l� ��i ph�i trong v� l�m. Hy v�ng qu� ph�i h�nh s� kh�ng gi�ng nh� v� kh� c�a qu� ph�i.")
	else
		Say("B�n ��o c� th� gi�p g�?",2,"Ta mu�n tham quan V� �ang/gotowudang","Kh�ng c� g�!/no")
	end
end

function gotowudang()
	NewWorld(312, 1713, 3469)			--����Ҵ��͵��������
end;

function no()
end;

function maphelp()
end;

