-- ؤ���������

function main()
	if GetPlayerFaction() == 4  then
		Say("Mu�n quay v� s� m�n?",3,"Phi�n huynh ��a �� xu�ng n�i!/gotogaibang","T�m hi�u khu v�c luy�n c�p/maphelp","Thay ta v�n an s� ph�/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","V� �ang ch� hi�p n�i danh thi�n h�, xin thay m�t Khi�u H�a T� v�n an T� H�c Ch�n Nh�n.")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Nga My n� hi�p! Khi�u H�a T� ta ng��ng m� �� l�u!")
	elseif GetPlayerFaction() == 1 then
		Talk(1,"","Qu� ph�i v� b�n bang giao h�o th�m t�nh, n�n th��ng xuy�n gi�p �� l�n nhau!")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","Nh�c ��n �m kh� ���ng M�n l� thi�n h� �� bi�n s�c, sao qu� ph�i kh�ng nghi�n c�u th�m binh kh� kh�c?")
	else
		Say("Th� ch� t�m ta c� chuy�n g�?",2,"Ta mu�n tham quan C�i Bang/gotogaibang","Kh�ng c� g�!/no")
	end
end

function gotogaibang()
	NewWorld(209, 1528, 3246)			--����Ҵ��͵��������
end;

function no()
end;

function maphelp()
end;