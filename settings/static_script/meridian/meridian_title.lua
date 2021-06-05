--�����ƺ���ش���ű�
Include ("\\script\\system_switch_config.lua")

t_tile_cfg =
{
	--byTitleGenre, wTitleDetailType, szTitleName
	{64, 1, "V� Hi�n"},
	{64, 2, "V� T��ng"},
	{64, 3, "V� V��ng"},
	{64, 4, "V� T�n"},
	{64, 5, "V� Ho�ng"},
	{64, 6, "V� Th�nh"},
}

--��鲢������Ӧ�ľ���ƺ�
function merdiantitle_check_add_title(bNotify)
	if 1 ~= IsMeridianSystemOpen() then
		if 1 == bNotify then
			Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng"))
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
				Msg2Player(format("C�c h� nh�n ���c danh hi�u [%s]", t[3]))
			end
		else
			break
		end
	end
	if bNotify then
		if 0 == nAdd then
			Talk(1,"",format("C�c h� �� h�t danh hi�u c� th� nh�n!"))
		else
			Talk(1,"",format("C�c h� �� nh�n th�nh c�ng %d danh hi�u", nAdd))
		end
	end
	return nAdd
end