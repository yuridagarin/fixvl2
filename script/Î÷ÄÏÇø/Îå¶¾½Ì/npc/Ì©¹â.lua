function main()
	Say("B�ng h�u t�m ta c� chuy�n g� kh�ng?",
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
   Sale(55)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l� �� t� Ng� ��c, kh�ng th� mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(84)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l� �� t� Ng� ��c, kh�ng th� mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(85)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l� �� t� Ng� ��c, kh�ng th� mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(86)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l� �� t� Ng� ��c, kh�ng th� thay ��i x�ng hi�u!",0)
	return
else
   Sale(65)
end
end