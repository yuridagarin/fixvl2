function main()
	Say("V� huynh �� ��y t�m ta c� vi�c g�?",
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
   Sale(45)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t� Nga My, mua v�t ph�m b� truy�n c�a b�n m�n l�m g�?",0)
	return
else
   Sale(72)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t� Nga My, mua v�t ph�m b� truy�n c�a b�n m�n l�m g�?",0)
	return
else
   Sale(73)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t� Nga My, mua v�t ph�m b� truy�n c�a b�n m�n l�m g�?",0)
	return
else
   Sale(74)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t� Nga My, thay ��i x�ng h� th� c� li�n quan g�?",0)
	return
else
   Sale(61)
end
end