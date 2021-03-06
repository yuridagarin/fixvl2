--经脉称号相关处理脚本
Include ("\\script\\system_switch_config.lua")

t_tile_cfg =
{
	--byTitleGenre, wTitleDetailType, szTitleName
	{64, 1, "V? Hi襫"},
	{64, 2, "V? Tng"},
	{64, 3, "V? Vng"},
	{64, 4, "V? T玭"},
	{64, 5, "V? Ho祅g"},
	{64, 6, "V? Th竛h"},
}

--检查并给予相应的境界称号
function merdiantitle_check_add_title(bNotify)
	if 1 ~= IsMeridianSystemOpen() then
		if 1 == bNotify then
			Talk(1,"",format("H? th鑞g kinh m筩h v蒼 ch璦 khai th玭g"))
		end
		return 0
	end
	local nAdd = 0
	local nCurLevel = MeridianGetLevel()
	for i = 1, nCurLevel do
		local t = t_tile_cfg[i]
		if t then
			if 1 ~= IsTitleExist(t[1], t[2]) then
				AddTitle(t[1], t[2])
				SetCurTitle(t[1], t[2])
				nAdd = nAdd + 1
				Msg2Player(format("C竎 h? nh薾 頲 danh hi謚 [%s]", t[3]))
			end
		else
			break
		end
	end
	if bNotify then
		if 0 == nAdd then
			Talk(1,"",format("C竎 h?  h誸 danh hi謚 c? th? nh薾!"))
		else
			Talk(1,"",format("C竎 h?  nh薾 th祅h c玭g %d danh hi謚", nAdd))
		end
	end
	return nAdd
end