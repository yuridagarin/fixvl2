function main()
	Say("T�m ta c� vi�c g�?",
		2,
		"Ta mu�n mua v�t ph�m b�i s�/baishibuy",
		"Kh�ng c� vi�c g�/qita")
end

function baishibuy()
		Say("Hi�p Thi�u Ki�m v� Thi�u t�u b�n ti�m l� lo�i th��ng h�ng, gi� ch� c� 40 ��ng. Kh�ch quan c� mu�n mua kh�ng?",
		2,
		"Mua/buyshimen",
		"Kh�ng mua/meiqian")
end

function buyshimen()
		Say("��y l� Hi�p Thi�u Ki�m v� Thi�u t�u!", 0);
		Pay(40)	
		AddItem(0,2,14,1)
		AddItem(2,1,12,1)		
end;

function meiqian()
		Say("Kh�ng ti�n th� ��ng ��n b�i s�! Ch�ng n�o c� ti�n r�i h�y quay l�i.", 0);	
end;

	
function qita()
	i=random(1,3)
	if i == 1 then
		Say("M�c d� Minh Nguy�t ta ch� l� m�t ti�u ��o ��ng nh�ng c�ng l� �� t� ph�i V� �ang, ng��i xem th��ng ta �?",0)
	elseif	i == 2 then
		Say("Minh nguy�t c� th�i h�u, b� t�u v�n thanh thi�n. H�m �� s� ph� nh�t ��nh �� u�ng say n�n m�i ��t cho ta t�n ��.",0)
	else
		Say("Kh�ng c� vi�c g� th� ��ng phi�n ta thanh tu",0)
	end
end;

