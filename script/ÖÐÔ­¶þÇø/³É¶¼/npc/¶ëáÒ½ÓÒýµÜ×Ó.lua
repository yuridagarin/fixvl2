function main()
	if GetPlayerFaction() == 3  then
		Say("S� mu�i mu�n tr� v� ph�i kh�ng?!",3,"L�m phi�n s� t�!/gotoemei","T�m hi�u khu v�c luy�n c�p/maphelp","Gh� th�m S� t� th�i m�!Kh�ng c�n/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","V� �ang n�i danh thi�n h�, T� H�c Ch�n Nh�n c� giao t�nh v�i Ch��ng m�n ta, hai ph�i ta li�n k�t c� th� n�i l� v� ��ch thi�n h�!")
	elseif GetPlayerFaction() == 1 then				
		Talk(1,"","A Di �� Ph�t! Th� ra l� s� huynh c�a Thi�u L�m ph�i, Huy�n Kh� ��i s� c�a qu� ph�i g�n ��y th� n�o? C�ng phu c�a �ng ta nghe n�i ��n Ch��ng m�n c�a b�n gi�o c�n k�m 3 ph�n.")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Qu� Bang ng��i ��ng th� m�nh, tr�n d��i b�n ph�i ��u b�ng l�ng k�t giao v�i c�c v�!")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","B�n ph�i v� qu� ph�i x�a nay �t c� qua l�i, kh�ng bi�t c� g� ch� gi�o?")
	else
		Say("Th� ch� t�m b�n ni c� chuy�n g�?",2,"Ta mu�n tham quan Nga My/gotoemei","Kh�ng c� g�!/no")
	end
end

function gotoemei()
	NewWorld(303, 1603, 3240)			--����Ҵ��͵��������
end;

function no()
end;

function maphelp()
end;