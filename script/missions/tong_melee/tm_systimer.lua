Include("\\script\\missions\\tong_melee\\tm_head.lua")

function main()
	if IsTongMeleeSystemOpen() ~= 1 then
		return
	end
	local today = Date();
	local wday = today:week();
	if wday ~= 0 then
		return 0;
	end
	Msg2Global("Lo�n chi�n bang h�i s�p b�t ��u, c�c v� ��i hi�p nhanh ch�n ��n Th�nh �� ��n ch� Ng��i Ti�p D�n Li�n Server �� ti�n h�nh b�o danh!");
	AddLocalCountNews("Lo�n chi�n bang h�i s�p b�t ��u, c�c v� ��i hi�p nhanh ch�n ��n Th�nh �� ��n ch� Ng��i Ti�p D�n Li�n Server �� ti�n h�nh b�o danh!", 2);
end