-- name: cloth_gift.lua
-- desc: ����װ���(Խ�ϰ�)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nIdx)
	Say("B�n c� mu�n s� d�ng kh�ng?",
		2,
		"Mu�n/#use_gift("..nIdx..")",
		"Ta ch�a mu�n s� d�ng./end_dialog")
end

-- ��׼������ñ	
-- ��׼��������װ	
-- ��׼��������װ	
-- ����������ñ	
-- ������������װ	
-- ������������װ	
-- �Ը�Ů����ñ	
-- �Ը�Ů������װ	
-- �Ը�Ů������װ	
-- ��СŮ����ñ	
-- ��СŮ������װ	
-- ��СŮ������װ	
tCloth = 
{
	{{0, 109, 114, 1, 1}, "Trang ph�c xu�n kh�i ng�"},
	{{0, 109, 115, 1, 1}, "Trang ph�c xu�n Ki�u n�"},
	{{0, 109, 113, 1, 1}, "Trang ph�c xu�n chu�n"},
	{{0, 109, 116, 1, 1}, "Trang ph�c xu�n g�i c�m"},

};
function use_gift(nIdx)
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Msg2Player(STR_OVERWEIGHT);
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end
	local nItem = 0;
	gf_SetLogCaption("[viet_newyear][cloth_gift]");
	local nGiftType = random(1,getn(tCloth));
	local nRet, nItem = gf_AddItemEx(tCloth[nGiftType][1], tCloth[nGiftType][2]);
	if nRet ~= 0 and nItem ~= nil then
		nRet = gf_setItemExpireDate(nItem, 2008, 2, 29, 24);
		if nRet ~= 1 then
			WriteLog("[viet_newyear] limit date error: date = 2008, 2, 29, 24");
		end
	end

	gf_SetLogCaption("");
end

function end_dialog()
end

