--Ǭ��������Ʒ�ű�

function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: c� th� gi�i kh�a trang b� kh�ng th� giao d�ch.",
		GetItemName(nItemIdx))
	szTitle = format("%s\n%s",szTitle, "Xin ch� �:<color=red>gi�i kh�a trang b� s� x�a �� qu� kh�m tr�n trang b�.<color>")
	tinsert(tbSay, format("Ta mu�n gi�i kh�a/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("Tra xem trang b� c� th� gi�i kh�a/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "R�i kh�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: gi�i kh�a trang b� kh�c nhau c�n ti�u hao v�ng v� s� l��ng v�t ph�m kh�c nhau. Hi�n t�i c�c trang b� sau c� th� gi�i kh�a: \nB� trang b� s� m�n 4, B� trang b� s� m�n 5, Trang b� Tinh Kh�c, \nTrang b� Thi�n Ngh�a, Trang b� H�o Nguy�t, Trang b� C�u Ch�u, \nTrang b� Di�u D��ng, trang b� V� L�m Minh Ch�, Thi�n ��a Nh�t Nguy�t gi�i ch�.",
		GetItemName(nItemIdx))
	szTitle = szTitle.."\n H� th�ng trang b� Chi�n Cu�ng"..", Trang b� Thi�n H� V� Song"
	tinsert(tbSay, format("tr� l�i/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "R�i kh�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUse_confirm(nItemIdx)
	SendScript2Client("Open([[CommonEnhanceItem]], 2);");
end

function no()
end