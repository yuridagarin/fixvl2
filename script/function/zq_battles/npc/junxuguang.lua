Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {};
	local nCamp = ZQ_GetCamp();
	local tName = {
		[SONG_ID] = "T�ng Qu�n Nhu Quan",
		[LIAO_ID] = "Li�u Qu�n Nhu Quan",
	}
	if tName[nCamp] ~= GetNpcName(GetTargetNpc()) then
		return 0;
	end
	tSay = ZQ_TaskDialog(5, 3);
	tinsert(tSay, "\n T�i h� ch� xem qua th�i/do_nothing");
	Say("<color=green>Qu�n Nhu Quan: <color>M�i c� �i�m t�i nguy�n ch� c� th� thu th�p 1 ng��i trong c�ng m�t th�i gian. Thu th�p th�nh c�ng c� th� nh�n ���c t�i nguy�n c�ng �i�m kinh nghi�m.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end