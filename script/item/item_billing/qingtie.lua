Include("\\script\\���\\marriage_head.lua");

function OnUse(item)
	-- DEBUG
	print(format("OnUse(%d)", item))
	local year, mon, day = decode_date(GetItemParam(item, 0))	-- ��������
	local period, type = decode_param2(GetItemParam(item, 1))	-- ����ʱ�κ�����
	if (period == 0) then
		Talk(1, "", "M�t t�m thi�p m�i tr�ng")
	else
		local caption = format("Thi�p m�i: <color=red>th�ng %d ng�y %d %s<color> <color=red>%s<color>",
			mon,
			day,
			map_period[period][6],
			map_fieldinfo[type][1])
		Talk(1, "", caption)
	end
end
