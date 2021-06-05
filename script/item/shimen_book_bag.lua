Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
BOOK_BAG_G=2
BOOK_BAG_D=1
BOOK_BAG_P=30627
function OnUse(nItem)
	local tSay = {
		format("%s/%s","��ng �","onUse_Confirm"),
		format("%s/%s","Ra kh�i","nothing"),
	}

	Say("T�i m�t t�ch s� m�n cao c�p: m� ra ng�u nhi�n nh�n ���c m�t m�t t�ch s� m�n cao c�p, c� x�c nh�n m� kh�ng?", getn(tSay), tSay);
end

function onUse_Confirm()
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if DelItem(BOOK_BAG_G,BOOK_BAG_D, BOOK_BAG_P, 1) ~= 1 then
		return 0;
	end
	MA_GiveFactionBook({1,100},"T�i m�t t�ch s� m�n cao c�p")
end

function nothing()
end