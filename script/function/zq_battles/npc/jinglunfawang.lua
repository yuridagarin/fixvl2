Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_JugdeCamp(SONG_ID) == 1 then
		return 0;
	end
	local tSay = {};
	tSay = ZQ_TaskDialog(4, 2);
	tinsert(tSay, "\n T�i h� ch� xem qua th�i/do_nothing");
	Say("<color=green>Kim Lu�n Ph�p V��ng: <color>Kim cang n� m�c, ph�t ph�p �� ma.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end