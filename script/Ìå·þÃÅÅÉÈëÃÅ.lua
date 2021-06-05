--
Include("\\script\\task\\world\\task_head.lua")

function main()
	local szNot = {
		"<sex> �� gia nh�p m�n ph�i."
	};
	if GetPlayerFaction() == 0 then
		Select_mp();
	else
		TalkEx("", szNot);
	end;
end;

function Select_mp()
	local szSay = {
		"<sex> mu�n gia nh�p m�n ph�i n�o?",
		"Thi�u L�m./join_sl",
		"V� �ang./join_wd",
		"Nga My./join_em",
		"C�i Bang./join_gb",
		"���ng M�n./join_tm",
		"Ta ch�a mu�n gia nh�p m�n ph�i!/end_say"
	};
	
	SelectSay(szSay);
end;

function join_sl()
	local szNot = {
		"Thi�u L�m kh�ng nh�n n� �� t�. <sex> xin ch�n m�n ph�i kh�c!"
	};
	if GetSex()==2 then
		TalkEx("Select_mp", szNot);
		return
	end;
	
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> mu�n gia nh�p h� ph�i n�o c�a Thi�u L�m?",
		"Thi�u L�m v� t�ng/enter_mp(4)",
		"Thi�u L�m thi�n t�ng/enter_mp(3)",
		"Thi�u L�m t�c gia/enter_mp(2)",
		"Ta kh�ng mu�n gia nh�p Thi�u L�m./end_say"
	};
	
	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> mu�n gia nh�p h� ph�i n�o c�a V� �ang?",
		"V� �ang ��o gia/enter_mp(14)",
		"V� �ang t�c gia/enter_mp(15)",
		"Ta kh�ng mu�n gia nh�p V� �ang./end_say"
	};
	
	SelectSay(szSay);
end;

function join_em()
	local szNot = {
		"Nga My kh�ng nh�n nam �� t�. <sex> xin ch�n m�n ph�i kh�c!"
	};
	if GetSex() == 1 then
		TalkEx("Select_mp", szNot);
		return
	end;
	
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> mu�n gia nh�p h� ph�i n�o c�a Nga My?",
		"Nga My ph�t gia/enter_mp(8)",
		"Nga My t�c gia/enter_mp(9)",
		"Ta kh�ng mu�n gia nh�p Nga My./end_say"
	};
	
	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> mu�n gia nh�p h� ph�i n�o c�a C�i Bang?",
		"C�i Bang T�nh y/enter_mp(11)",
		"C�i Bang � Y/enter_mp(12)",
		"Ta kh�ng mu�n gia nh�p C�i Bang./end_say"
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> mu�n gia nh�p ���ng M�n kh�ng?",
		"Ta mu�n gia nh�p./enter_mp(6)",
		"Ta kh�ng mu�n gia nh�p./end_say"
	};
	SelectSay(szSay);
end;

function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local szTable = {};
	
	szTable[2] = "Thi�u L�m t�c gia";
	szTable[3] = "Thi�u L�m thi�n t�ng";
	szTable[4] = "Thi�u L�m v� t�ng";

	szTable[14] = "V� �ang ��o gia";
	szTable[15] = "V� �ang t�c gia";
	
	szTable[8] = "Nga My ph�t gia";
	szTable[9] = "Nga My t�c gia";
	
	szTable[11] = "C�i Bang T�nh y";
	szTable[12] = "C�i Bang � Y";
	
	szTable[6] = "���ng M�n";
	
	if nRoute == 2 then
		nBegin = 21;
		nEnd = 32;
	elseif nRoute == 3 then
		nBegin = 45;
		nEnd = 57;
	elseif nRoute == 4 then
		nBegin = 33;
		nEnd = 44;
	elseif nRoute == 14 then
		nBegin = 125;
		nEnd = 146;
	elseif nRoute == 15 then
		nBegin = 147;
		nEnd = 159;
	elseif nRoute == 8 then
		nBegin = 75
		nEnd = 89;
	elseif nRoute == 9 then
		nBegin = 90
		nEnd = 102;
	elseif nRoute == 11 then
		nBegin = 103
		nEnd = 113;
	elseif nRoute == 12 then
		nBegin = 114
		nEnd = 124;
	elseif nRoute == 6 then
		nBegin = 58
		nEnd = 74;
	else
		print("Gia nh�p "..szTable[nRoute].."Xu�t hi�n nRoute phi ph�p : "..nRoute);
		return
	end;

	SetPlayerRoute(nRoute);
	for i = nBegin, nEnd do
		LearnSkill(i);
		for j = 1, 10 do
			LevelUpSkill(i);
		end;
	end;
	Msg2Player("T�t c� k� n�ng c�a"..szTable[nRoute].." �� h�c h�t");
end;

function end_say()

end;
