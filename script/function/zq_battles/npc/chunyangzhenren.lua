Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_JugdeCamp(LIAO_ID) == 1 then
		return 0;
	end
	local tSay = {};
	tSay = ZQ_TaskDialog(3, 2);
	tinsert(tSay, "\n T�i h� ch� xem qua th�i/do_nothing");
	Say("<color=green>Thu�n D��ng Ch�n Nh�n: <color>chi�n tr��ng Thi�n M�n Tr�n �� b� ma h�a, b�n ��o ph�i h�a gi�i nguy c� n�y nh� th� n�o ��y.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end