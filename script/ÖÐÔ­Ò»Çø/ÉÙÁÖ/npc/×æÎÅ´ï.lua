function main()
	Say("V� huynh �� n�y t�m ta c� vi�c g� kh�ng?",
		5,
		"Ta mu�n mua m�t s� v�t d�ng./PutongBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho t�n th�? H�y cho ta xem!/ChujitaoBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho v� l�m cao th�? H�y cho ta xem!/ZhongtaoBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho tuy�t th� cao th�? H�y cho ta xem!/GaotaoBuy",
		"R�i kh�i./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(44)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a Thi�u L�m sao l�i mua v�t ph�m b� truy�n c�a b�n ph�i?",0)
	return
else
   Sale(66)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a Thi�u L�m sao l�i mua v�t ph�m b� truy�n c�a b�n ph�i?",0)
	return
else
   Sale(67)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a Thi�u L�m sao l�i mua v�t ph�m b� truy�n c�a b�n ph�i?",0)
	return
else
   Sale(68)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l� �� t� Thi�u L�m sao d�m l�a g�t ta?",0)
	return
else
   Sale(59)
end
end