--����ָ��
--lijinyong

function main()
	if (GetLevel() < 10) then
		Say("Ch�o m�ng b�n tr� tham gia th� gi�i V� L�m Truy�n K� 2! Ta c� th� gi�p g� ��y?",3,"Ta mu�n t�m hi�u ki�n th�c m�n ph�i./introfaction","Ta mu�n nghe truy�n thuy�t V� �ang./introwudang","Sao ng��i m�t m�i th�! ��ng qu� c�ng th�ng!/no")
	else
		Say("Ta c� th� gi�p g� cho ng��i?",4,"Ta mu�n t�m hi�u ki�n th�c m�n ph�i./introfaction","Ta mu�n nghe truy�n thuy�t V� �ang./introwudang","Ta mu�n gia nh�p V� �ang./interwudang","��a ch�t th�i!/no")
	end
end;

function introfaction()
	Say("Hi�n t�ng c�ng tr�n giang h� c� c�u ��i m�n ph�i nh� V� �ang, Thi�u L�m, Nga My, C�i Bang, ���ng M�n...C�c m�n ph�i c�n l�i ��u c� s� tr��ng ri�ng. B�ng h�u theo �i�u ki�n c�a m�nh c� th� n� l�c ph�n ��u, ��n c�p 10 c� th� ��n c�c ��i m�n ph�i t�m hi�u r� ��c s�c c�a m�i m�n ph�i. H�y l�m ��ng l�i ta truy�n d�y, nh�t ��nh s� m� ��o th�nh c�ng!")
end;


function introwudang()
	Say("T� khi t� s� ��o Nh�t ch�n nh�n s�ng l�p V� �ang ��n nay �� h�n 400 n�m. Tr�i qua th�i gian, c�c ��i t� s� d�y c�ng x�y d�ng m�n ph�i, �� t� �o�n k�t m�t l�ng, ��n nay V� �ang �� tr� th�nh m�t cao m�n ��i ph�i trong giang h�. B�ng h�u r�nh r�i ��ch th�n l�n V� �ang t�m hi�u!")
end;

function interwudang()
	if (GetPlayerFaction() > 0) then
		Say("Ng��i mu�n ��a g� ��y? Ch�ng ph�i ng��i �� gia nh�p m�n ph�i r�i sao?")
	else
		Say("X�t th�y ng��i c� th�nh t�m, ta thu nh�n ng��i l�m �� t� V� �ang ��i th� 18. T� nay ph�i ch�m ch� tu luy�n, ��ng l�m m�t thanh danh s� m�n!")
		SetPlayerFaction=2
		AddGlobalNews("Tin t�c li�n quan: Ng��i ch�i",GetName().." �� gia nh�p V� �ang.")
	end;
end;

function no()
end;		