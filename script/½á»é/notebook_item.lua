Include("\\script\\���\\marriage_head.lua");
function OnUse()
	local selTab = {
			"Th�i gian b�t ��u/about_begin_time",
			"Th�i gian k�t th�c/about_end_time",
			"H� N��ng/about_xiniang",
			"Y ph�c v� nh�n c��i/about_equip",
			"L� ph�m h�n l�/about_marriage_thing",
			"��ng C�m nang/nothing",
			}
	Say("Ta c� th� gi�p g�?",getn(selTab),selTab)
end;

function about_begin_time()
	local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE))
	local nPeriod,nFieldType = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if nPeriod == 0 or nFieldType == 0 then
		Talk(1,"Hi�n ng��i v�n ch�a ��t s�n kh�u")
		return 0
	end;
	local sPeriod = map_period[nPeriod][5];
	local sFieldName = map_fieldinfo[nFieldType][1]
	Talk(1,"OnUse",format("B�n �� ��t khu v�c<color=yellow> n�m %d th�ng %d ng�y%d %s<color> - <color=yellow>%s<color>,  hi�n t�i v�o <color=yellow>n�m %d th�ng %d ng�y %d %d<color>,  c� th� v�o khu v�c n�y �� chu�n b�. th�i gian chu�n b� l� <color=yellow>30<color> ph�t,  sau khi chu�n b�,  kh�ch m�i c� th� b��c v�o h�i tr��ng.",
						nYear,
						nMonth,
						nDay,
						sPeriod,
						sFieldName,
						nYear,
						nMonth,
						nDay,
						map_period[nPeriod][1]));
end;

function about_end_time()
	local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE))
	local nPeriod,nFieldType = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if nPeriod == 0 or nFieldType == 0 then
		Talk(1,"Hi�n ng��i v�n ch�a ��t s�n kh�u")
		return 0
	end;
	Talk(1,"OnUse",format("S�n kh�u b�n d� ��nh s� k�t th�c <color=yellow>n�m %d th�ng %d ng�y %d %d gi� 30 ph�t<color>. Xin r�i kh�i s�n kh�u tr��c th�i gian tr�n",
						nYear,
						nMonth,
						nDay,
						map_period[nPeriod][3]));
end;

function about_xiniang()
	Talk(2,"OnUse","H� N��ng s� gi�p ng��i: <enter><color=yellow>C� h�nh h�n l�<color><enter> ng��i c� th� theo s� h��ng d�n c�a H� n��ng m� l�m theo. <enter><color=yellow>B�y ti�c r��u<color><enter>, H� N��ng s� gi�p ng��i b�y c�c m�n �n l�n b�n ti�c. C� r�t nhi�u m�n �n th�c kh�ch t�y � th��ng th�c.","<color=yellow>Chuy�n tr�ng th�i<color><enter> T�i s�n kh�u h�n l� b�n v� t�n n��ng c� th� t�y � chuy�n t� tr�ng th�i k�t h�n sang tr�ng th�i chi�n ��u, d� � tr�ng th�i n�o c�ng ��m b�o an to�n. <enter><color=yellow>Nh�n th� H�ng bao<color><enter> B�ng h�u t�ng cho b�n r�t nhi�u h�ng bao, l�m sao b�n c� th� c�m h�t? H� n��ng s� nh�n thay, sau �� b�n ��n g�p H� n��ng �� nh�n l�i. <enter><color=yellow>Ch�c m�ng h�n l�<color><enter> H� N��ng s� chuy�n nh�ng l�i ch�c m�ng c�a b�n b� ��n cho b�n, nh�ng ng��i tham gia h�n l� ��u c� th� nh�n th�y.");
end;

function about_equip()
	Talk(1,"OnUse","L� ph�c b�n c� th� mua � Ng� c�c, n�u kh�ng c� th� ��n ch� b� mai thu� trang ph�c v� nh�n c��i. Th�i gian thu� l� 24 gi�<enter>.");
end;

function about_marriage_thing()
	Talk(1,"OnUse","�� cho kh�ng kh� bu�i l� ���c t�ng b�ng n�o nhi�t b�n c� th� th�m nh�ng v�t ph�m nh�: L� hoa, ph�o, k�o m�ng�Nh�ng v�t ph�m n�y c� th� mua ch� Ng� c�c ho�c d�ch v� h�n nh�n.");
end;

function nothing()

end;