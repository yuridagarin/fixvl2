--����ս��ʹ�ýű�
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
function OnUse(nItem)
	local nG, nD, nP = GetItemInfoByIndex(nItem);
	local nBangName = GetTongName()
	if nBangName == nil then
		return 0
	end
	--����ս��
	if nG == 2 and nD == 1 and nP == 30573 then
		local nMapID, nX, nY = GetWorldPos();
		if gf_MapIsAllow({200, 300, 350, 100, 150, 500}, nMapID) ~= 1 or QHT_MAP_NAME[nMapID] == nil then
			Talk(1,"","B�n �� n�y kh�ng cho ph�p s� d�ng chi�n k� bang ph�i");
			return 0;
		end
		if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
			Talk(1,"","Ng��i ch�a gia nh�p bang h�i ho�c gia nh�p bang th�i gian ch�a �� 1 ng�y n�n kh�ng th� s� d�ng chi�n k�");
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then	
			local npcIndex = CreateNpc("Hoa ��ng3", nBangName, GetWorldPos());
			SetNpcScript(npcIndex, "\\script\\online\\qianhe_tower\\npc\\tong_fight_flag_npc.lua");
			SetNpcLifeTime(npcIndex, 6*3600);
			AddUnitStates(npcIndex, 0, 1);
			Msg2Player("V�o 1")
		end
		local strMsg = format("%s Bang ph�i %s kh�i chi�n k� bang ph�i, th�nh vi�n n�y c� th� nh�n th��ng, %s bang ph�i tr�n r�t l�i h�i.", GetTongName(), QHT_MAP_NAME[nMapID], GetTongName());
		Msg2Global(strMsg);
		AddLocalNews(strMsg);
	end
	--��Ѫ����ս��
	if nG == 2 and nD == 1 and nP == 30574 then
		local nMapID, nX, nY = GetWorldPos();
		if gf_MapIsAllow({200, 300, 350, 100, 150, 500}, nMapID) ~= 1 or QHT_MAP_NAME[nMapID] == nil then
			Talk(1,"","B�n �� n�y kh�ng cho ph�p s� d�ng chi�n k� bang ph�i");
			return 0;
		end
		if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
			Talk(1,"","Ng��i ch�a gia nh�p bang h�i ho�c gia nh�p bang th�i gian ch�a �� 1 ng�y n�n kh�ng th� s� d�ng chi�n k�");
			return 0;
		end
		if DelItemByIndex(nItem, 1) == 1 then
			--local npcIndex = CreateNpc("QxTiexueqi", GetTongName(), nMapID, nX, nY);
			local npcIndex = CreateNpc("Hoa ��ng3", nBangName, GetWorldPos());
			SetNpcScript(npcIndex, "\\script\\online\\qianhe_tower\\npc\\tong_fight_flag_npc.lua");
			SetNpcLifeTime(npcIndex, 6*3600);
			AddUnitStates(npcIndex, 0, 2);
		end
		local strMsg = format("%s Bang ph�i %s kh�i l�n chi�n k� thi�t huy�t bang ph�i, th�nh vi�n n�y s� ���c th��ng h�u h�nh, %s Bang ph�i tr�n m�nh m� v� c�ng!!!", GetTongName(), QHT_MAP_NAME[nMapID], GetTongName());
		Msg2Global(strMsg);
		AddLocalNews(strMsg);
	end
end