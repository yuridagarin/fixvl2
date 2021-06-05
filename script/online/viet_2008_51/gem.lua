-- Խ��2008 51 �
-- ��ʯ

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		Say("S� d�ng b�o th�ch s� nh�n ���c 1 �i�m kinh nghi�m, c� mu�n s� d�ng kh�ng?\nTh�i h�n s� d�ng: <color=red>24h00 31-05-2008<color>",
			2,
			format("���c/#OnOpen(%d)", nItemIdx),
			"Kh�ng c�n ��u/nothing");
	end
end

function OnOpen(nItemIdx)
	local nItem = 0                                 
	if GetLevel() < 20 then
		Say("��i ��n c�p 20 h�y gh� l�i..", 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("viet_2008_51_gem");
		gf_Modify("Exp", 1);
		gf_SetLogCaption("");
	end
end
