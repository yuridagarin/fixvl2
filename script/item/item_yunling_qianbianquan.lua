--ǧ??ȯ?ű?

Include("\\script\\lib\\globalfunctions.lua")

t_item_index =
{
	[30491] = 1,
	[30492] = 2,
	[30493] = 3,
}
t_itemconfig = 
{
	--g,d,p,szName,nAward,MaxUseNum
	{2, 1, 30491, "V? Ti?u Y V?ng", 1000, 9999},
	{2, 1, 30492,"V? Ti?u Y B?c", 100, 9999},
	{2, 1, 30493,"V? Ti?u Y ??ng", 10, 9999},
}

function OnUse(nItemIndex)
	OnUse_real(tonumber(nItemIndex))
end

function OnUse_real(nItemIndex)
	local g = GetItemGenre(nItemIndex)
	local d = GetItemDetail(nItemIndex)
	if g == 2 and d == 1 then
		local p = GetItemParticular(nItemIndex)
		local nType = t_item_index[p] or 0
		if nType then
			_do_use_item(nType, nItemIndex)
		end
	end
end

function _do_use_item(nType, nItemIndex)
	local t = t_itemconfig[nType]
	if t then
		local n = GetItemCount(t[1],t[2],t[3])
		AskClientForNumber(format("_use_item%d", nType), 1,n, format("S? d?ng bao nhi?u %s?",t[4]))
--		if t[6] > 1 then
--			AskClientForNumber(format("_use_item%d", nType), 1,t[6], format("ʹ?ö??ٸ?%s?",t[4]))
--		else
--			_real_use(nType, nItemIndex, 1)
--		end
	end
end

function _use_item1(nNum)
	_real_use(1, 0, nNum)
end

function _use_item2(nNum)
	_real_use(2, 0, nNum)
end

function _use_item3(nNum)
	_real_use(3, 0, nNum)
end

function _real_use(nType, nItemIndex, nNum)
	local t = t_itemconfig[nType]
	if t and nNum >= 1 and nNum <= t[6] then
		if nItemIndex > 0 and 1 == nNum then
			if DelItemByIndex(nItemIndex,1) ~= 1 then
				return
			end
		else
			if DelItem(t[1],t[2],t[3],nNum) ~= 1 then
				return
			end
		end
		local nGain = nNum * t[5]
		EarnCollectionCoin(nGain)
		Msg2Player(format("C?c h? s? d?ng %d %s nh?n ???c %d ?i?m th??ng Ti?u Y Ph??ng", nNum, t[4], nGain))
		local item_para = format("%d,%d,%d,%d", t[1], t[2], t[3], nNum)
		gf_WriteLogEx("", "use item qiaoyiquan", "", t[3], item_para);
	end
end