
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

function main()
	local tSay = {
		"Mua v� kh�/_buy_sale_equip",
		"Trang b� t�ch/_equip_recycle",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>Ch� Ti�m V� Kh�:<color> V� kh� � ch� c�a ta v�n l� m�t h�ng ph� bi�n, kh�ng bi�t m�n v� kh� c� thu�c qu� s� nh� th� n�o!", getn(tSay), tSay);
end;

function _buy_sale_equip()
	Sale(36);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end