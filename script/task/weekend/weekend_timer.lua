--2005-11-3 16:41

--返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

function GetLocalHour()
	nHour = date("%H");
	return tonumber(nHour)
end;

function main()
	local nWeekDay = GetWeekDay();
	if nWeekDay == 5 or nWeekDay == 6 then	--周末
		if GetLocalHour() == 19 or GetLocalHour() == 20 or GetLocalHour() == 21 or GetLocalHour() == 22 then
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man  b総 u,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man  b総 u,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
		elseif GetLocalHour() == 23 then
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man s? k誸 th骳 sau 20 ph髏");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man s? k誸 th骳 sau 20 ph髏");
		elseif GetLocalHour() == 0 then
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man h玬 nay  k誸 th骳");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man h玬 nay  k誸 th骳");
		else
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man t? 19 gi?-24 gi?,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man t? 19 gi?-24 gi?,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
		end;
	elseif nWeekDay == 0 then
		if GetLocalHour() >= 14 and GetLocalHour() <= 21 then
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man  b総 u,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man  b総 u,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
		elseif GetLocalHour() >= 22 then
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man h玬 nay  k誸 th骳");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man h玬 nay  k誸 th骳");
		else
			AddLocalNews("Ho箃 ng ch鑞g gi芻 Man t? 14 gi?-22 gi?,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
			Msg2SubWorld("Ho箃 ng ch鑞g gi芻 Man t? 14 gi?-22 gi?,  bi誸 th猰 m阨 n Bi謓 Kinh, Dng Ch﹗, Tng Dng g苝 Ch﹏ T? Кn");
		end;
	end;
end;
