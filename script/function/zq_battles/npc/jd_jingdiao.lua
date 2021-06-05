Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_GetCamp() ~= LIAO_ID then
		return 0;
	end
	local tSay = {
		"H�y ��a v�o T�ng doanh/slip_into_song",
		"\nL�ng l�ng r�i kh�i/do_nothing",
	}
	Say("<color=green>Gi�n �i�p Kim �i�u: <color>C�n th�n c�i mi�ng c�a ng��i, n�u kh�ng th� h�y c�n th�n sau l�ng ng��i.", getn(tSay), tSay);
end

function slip_into_song()
	local tJoinPos = {
		{1645, 3797},
		{1613, 3826},
		{1613, 3761},
		{1555, 3714},
		{1546, 3739},
		{1638, 3747},
	};
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	if GetItemCount(ZQ_ITEM_FLAG[LIAO_ID][1], ZQ_ITEM_FLAG[LIAO_ID][2], ZQ_ITEM_FLAG[LIAO_ID][3]) ~= 1 then
		return 0;
	end
	local nRandIndex = random(getn(tJoinPos));
	SetPos(tJoinPos[nRandIndex][1], tJoinPos[nRandIndex][2]);
	RestoreAll();
	SetFightState(1);
end

function do_nothing()
	--do nothing
end