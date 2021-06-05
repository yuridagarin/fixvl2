-- ��ʯ��

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

tItems = 
{
--		{ ����, "����", {G1, G2, G3, ����} },
		{  6, "Ng� Linh Th�ch", { 2, 1, 30005, 1, 1} },
		{ 47, "Lam Tinh Th�ch", { 2, 1, 30006, 1, 1} },
		{ 47, "Ho�ng B�o Th�ch", { 2, 1, 30007, 1, 1} },
};

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		Say("M� b�o r��ng s� ng�u nhi�n nh�n ���c 1 vi�n Ng� Linh Th�ch, Lam Tinh Th�ch ho�c Ho�ng B�o Th�ch, c� ��ng � m� b�o r��ng kh�ng?\nTh�i h�n s� d�ng: <color=red>24h00 31-05-2008<color>",
			2,
			format("M�/#OnOpen(%d)", nItemIdx),
			"Kh�ng c�n ��u/nothing");
	end
end

function OnOpen(nItemIdx)
	local nItem = 0;
	if GetLevel() < 20 then
		Say("��i ��n c�p 20 h�y gh� l�i..", 0);
		return
	end
	if CheckWeight() ~= 1 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		nItem = GetRandomItem(tItems)
		gf_SetLogCaption("viet_2008_51_gembox");
		gf_AddItemEx( tItems[nItem][3], tItems[nItem][2] );
		gf_SetLogCaption("");
	end
end

function CheckWeight()
	return gf_Judge_Room_Weight(1, 20);
end