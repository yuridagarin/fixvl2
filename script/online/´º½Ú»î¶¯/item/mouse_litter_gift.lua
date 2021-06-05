-- name: mouse_litter_gift.lua
-- desc: ����С���(Խ�ϰ�)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\���ڻ\\newyear_head.lua");

function OnUse(nIdx)
	Say("B�n c� mu�n s� d�ng kh�ng?",
		2,
		"Mu�n/#use_gift("..nIdx..")",
		"Ta ch�a mu�n s� d�ng./end_dialog")
end

-- 5.000 ����	
-- 10.000 ����	
-- 15.000 ����	
-- 1 ��	
-- 2������	
-- 4������	
-- 6������	
-- 8������	
function use_gift(nIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20080229 then
		Msg2Player("V�t ph�m �� qu� h�n, kh�ng th� s� d�ng.");
		return
	end
	if GetTask(TASKID_OPEN_LITTER_GIFT) >= nDate then
		Msg2Player("M�i ng�y m�i nh�n v�t ch� c� th� s� d�ng 1 l�n!");
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end

	SetTask(TASKID_OPEN_LITTER_GIFT, nDate);

	gf_SetLogCaption("[viet_newyear][mouse_litter_gift]");
	local nGiftType = random(1,8);
	if nGiftType == 1 then
		gf_Modify("Exp", 5000);
	elseif nGiftType == 2 then
		gf_Modify("Exp", 10000);
	elseif nGiftType == 3 then
		gf_Modify("Exp", 15000);
	elseif nGiftType == 4 then
		gf_Modify("Money", 10000);
	elseif nGiftType == 5 then
		gf_Modify("Rep", 2);
	elseif nGiftType == 6 then
		gf_Modify("Rep", 4);
	elseif nGiftType == 7 then
		gf_Modify("Rep", 6);
	elseif nGiftType == 8 then
		gf_Modify("Rep", 8);
	else
		print("[mouse_litter_gift]Kh�ng th� ��n ��y nh�.!!!");
	end		
	gf_SetLogCaption("");
end

function end_dialog()
end

