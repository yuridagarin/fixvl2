function main()
	Say("B�ng h�u t�m ta c� vi�c g�?",
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
   Sale(48)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t� ���ng M�n, kh�ng th� mua v�t d�ng b� truy�n c�a b�n m�n.",0)
	return
else
   Sale(69)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t� ���ng M�n, kh�ng th� mua v�t d�ng b� truy�n c�a b�n m�n.",0)
	return
else
   Sale(70)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t� ���ng M�n, kh�ng th� mua v�t d�ng b� truy�n c�a b�n m�n.",0)
	return
else
   Sale(71)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t� ���ng M�n, ��i c�ch x�ng h� th� c� quan g�?",0)
	return
else
   Sale(60)
end
end