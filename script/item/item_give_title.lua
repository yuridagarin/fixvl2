
t_tile_cfg =
{
	[30560] = {65, 1, 30, "Du Hi�p"},
	[30561] = {65, 2, 30, "�ng D��ng"},
	[30562] = {65, 3, 30, "Chi�n Cu�ng"},
}
ITEM_G=2
ITEM_D=1

function OnUse(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == ITEM_G and ITEM_D == 1 then
		local p = GetItemParticular(id)
		local t = t_tile_cfg[p]
		if t then
    		local szMsg = format("Ng��i x�c nh�n mu�n ��i %d ng�y gia h�n th�i gian [%s] danh hi�u kh�ng?", t[3], t[4])
    		local tSay = 
        	{
        		format("��ng �/#ye_use(%d)", p),
        		"R�i kh�i/no",
        	}
        	Say(szMsg, getn(tSay), tSay)
		end
	end	
end

function ye_use(nItemP)
	local t = t_tile_cfg[nItemP]
	if t then
		if 1 ~= IsTitleExist(t[1], t[2]) then
			local nDelResult = DelItem(ITEM_G, ITEM_D, nItemP, 1)
			if 1 == nDelResult then
				AddTitle(t[1], t[2])
				SetTitleTime(t[1], t[2], GetTime() + t[3] * 24 * 60 * 60)
				SetCurTitle(t[1], t[2])
				Msg2Player(format("Ng��i nh�n ���c %d ng�y gia h�n th�i gian [%s] danh hi�u", t[3], t[4]))
			end
		else
			Say(format("�� c� [%s] danh hi�u, kh�ng th� s� d�ng l�i", t[4]), 0)
		end
	end
end

function no()
end
