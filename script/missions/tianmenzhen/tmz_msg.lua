function main()
	local w = tonumber(date("%w"));
	local h = tonumber(date("%H"));
	if w == 6 or w == 0 then
		if h == 13 or h == 14 then
			Msg2Global("H�y quay l�i sau 14 gi� t�m phi�u k� t��ng qu�n Qu�ch Qu�n B�ng b�o danh di�n v� Thi�n M�n Tr�n!");
		end
	end
end