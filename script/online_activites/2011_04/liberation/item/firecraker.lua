Include("\\script\\online\\viet_event\\firework_10\\head.lua")

function OnUse(nItemIndex)

	local nHour = tonumber(date("%H%M"))
	if nHour < 0800 or ( nHour > 1000 and nHour < 1500 ) or ( nHour > 1700  and nHour < 2000 ) or ( nHour > 2200 )  then
		Talk ( 1, "", "Ho�t ��ng ��t ph�o hoa di�n ra trong 3 ��t th�i gian t�: 8gi� ��n 10gi�, 15gi� ��n 17gi�, 20gi� ��n 22gi� !!!!" )
		return
	end
	local nDate = tonumber( date( "%y%m%d" ))
	local nCurDate = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 9, 4)
	if nCurDate ~= nDate then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 3, 3) 
	end
	local nCheck = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3)
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	if nCheck == 0 then
		tinsert(tbSayDialog, "Ta mu�n nh�n ��i kinh nghi�m (ti�u hao 139 v�ng)/#use_firework("..nItemIndex..", 1)")
		tinsert(tbSayDialog, "Ta ch� s� d�ng b�nh th��ng/#use_firework("..nItemIndex..", 2)")
		nSaySize = getn(tbSayDialog);
		Say(szSayHead, nSaySize, tbSayDialog);
	else
		use_firework(nItemIndex)	
	end
	

end