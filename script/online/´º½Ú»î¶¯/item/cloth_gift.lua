-- name: cloth_gift.lua
-- desc: 新年装礼盒(越南版)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nIdx)
	Say("B筺 c? mu鑞 s? d鬾g kh玭g?",
		2,
		"Mu鑞/#use_gift("..nIdx..")",
		"Ta ch璦 mu鑞 s? d鬾g./end_dialog")
end

-- 标准男新年帽	
-- 标准男新年上装	
-- 标准男新年下装	
-- 魁梧男新年帽	
-- 魁梧男新年上装	
-- 魁梧男新年下装	
-- 性感女新年帽	
-- 性感女新年上装	
-- 性感女新年下装	
-- 娇小女新年帽	
-- 娇小女新年上装	
-- 娇小女新年下装	
tCloth = 
{
	{{0, 109, 114, 1, 1}, "Trang ph鬰 xu﹏ kh玦 ng?"},
	{{0, 109, 115, 1, 1}, "Trang ph鬰 xu﹏ Ki襲 n?"},
	{{0, 109, 113, 1, 1}, "Trang ph鬰 xu﹏ chu萵"},
	{{0, 109, 116, 1, 1}, "Trang ph鬰 xu﹏ g頸 c秏"},

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

