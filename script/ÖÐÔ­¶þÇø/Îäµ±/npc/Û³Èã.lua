function main()
	Say("B�ng h�u t�m ta c� chuy�n g�?",
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
   Sale(46)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i �� t� V� �ang, sao c� th� mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(78)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i �� t� V� �ang, sao c� th� mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(79)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i �� t� V� �ang, sao c� th� mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(80)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng��i kh�ng ph�i �� t� V� �ang, ��i c�ch x�ng h� th� c� li�n quan g�?",0)
	return
else
   Sale(63)
end
end