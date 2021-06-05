Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0)
	SetNpcScript(npcIndex,"");
	local szLogTitle = "TNC Boss The Gioi"
	gf_EventGiveCustomAward(1, 5000000, 0, szLogTitle)
	local _npcIndex,npcModel,npcName = GetTriggeringUnit()
	
	if npcName == "B�c L�c L�m Minh Ch�" then
		local npcIndex = CreateNpc("B�c L�c L�m l�nh","B�c L�c L�m l�nh",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);
	elseif npcName == "Th��ng Th�n Doanh Thi�n" then
		local npcIndex = CreateNpc("Tr�c �nh Th��ng","Tr�c �nh Th��ng",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	elseif npcName == "L�nh H��ng L�ng" then
		local npcIndex = CreateNpc("Tuy�t T�nh Th�ch","Tuy�t T�nh Th�ch",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	end
	
	local nRand = random(1, 10000)
	if nRand <= 9693 then
		gf_AddItemEx2({2, 2, 7, 1}, "M�nh Thi�n th�ch", szLogTitle, "nh�n")
	elseif nRand <= 9993 then
		gf_AddItemEx2({2, 1, 30071, 1}, "Nh�n S�m V�n N�m", szLogTitle, "nh�n")
	else
		gf_AddItemEx2({2, 1, 30130, 1}, "Phi Y�n Th�ch", szLogTitle, "nh�n")
	end
end