Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	if qht_activity_isopen() == 1 then
		Msg2Global("Thi�n T�m Huy�n C�nh Ho�ng Kim boss s�p xu�t hi�n, boss � t�ng c�ng cao th� ph�n th��ng c�ng t�t.");
		AddLocalCountNews("Thi�n T�m Huy�n C�nh Ho�ng Kim boss s�p xu�t hi�n, boss � t�ng c�ng cao th� ph�n th��ng c�ng t�t.", 2);
	end
end