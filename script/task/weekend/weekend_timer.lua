--2005-11-3 16:41

--�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;

function GetLocalHour()
	nHour = date("%H");
	return tonumber(nHour)
end;

function main()
	local nWeekDay = GetWeekDay();
	if nWeekDay == 5 or nWeekDay == 6 then	--��ĩ
		if GetLocalHour() == 19 or GetLocalHour() == 20 or GetLocalHour() == 21 or GetLocalHour() == 22 then
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man �� b�t ��u, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man �� b�t ��u, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
		elseif GetLocalHour() == 23 then
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man s� k�t th�c sau 20 ph�t");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man s� k�t th�c sau 20 ph�t");
		elseif GetLocalHour() == 0 then
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man h�m nay �� k�t th�c");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man h�m nay �� k�t th�c");
		else
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man t� 19 gi�-24 gi�, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man t� 19 gi�-24 gi�, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
		end;
	elseif nWeekDay == 0 then
		if GetLocalHour() >= 14 and GetLocalHour() <= 21 then
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man �� b�t ��u, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man �� b�t ��u, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
		elseif GetLocalHour() >= 22 then
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man h�m nay �� k�t th�c");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man h�m nay �� k�t th�c");
		else
			AddLocalNews("Ho�t ��ng ch�ng gi�c Man t� 14 gi�-22 gi�, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
			Msg2SubWorld("Ho�t ��ng ch�ng gi�c Man t� 14 gi�-22 gi�, �� bi�t th�m m�i ��n Bi�n Kinh, D��ng Ch�u, T��ng D��ng g�p Ch�n T� ��n");
		end;
	end;
end;
