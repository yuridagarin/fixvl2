
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��¥�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
Include("\\script\\vng\\doinguyenlieu.lua");
Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\vng\\weapon_upgrade\\thienchiviemde2bachkimviemde.lua");

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "<color=green>Ch� T�u L�u:<color> Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."

	tinsert(tbSayDialog, "Nh�n nhi�m v� ��i Vi�m �� th�nh Thi�n Chi Vi�m �� (ti�u hao 1000 v�ng)/get_VD2TCVD")
	tinsert(tbSayDialog, "Nh�n nhi�m v� ��i Thi�n Chi Vi�m �� th�nh B�ch Kim Vi�m �� (ti�u hao 2000 v�ng)/get_TCVD2BKVD")
	tinsert(tbSayDialog, "Ho�n th�nh nhi�m v�: Nh�n trang b� Thi�n Chi Vi�m ��/finish_VD2TCVD")
	tinsert(tbSayDialog, "Ho�n th�nh nhi�m v�: Nh�n trang b� B�ch Kim Vi�m ��/finish_TCVD2BKVD")
	tinsert(tbSayDialog, "Ta ch� gh� th�m th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end;

function nothing()

end