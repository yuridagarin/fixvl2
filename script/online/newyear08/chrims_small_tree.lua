--08����Сʥ���������֣��ű�
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	if get_chrims_state() ~= 1 then
		Talk(1,"","Ho�t ��ng gi�ng sinh �� k�t th�c, c�y th�ng �� kh�ng c�n � ngh�a g�.");
		return
	end
	local strtab = {
		"��t c�y th�ng xu�ng /drop_plant",
		"Kh�ng ph�i, ��t ch�m l�i./nothing"}
	Say("Ng��i mu�n �� c�y th�ng xu�ng?",
		getn(strtab),
		strtab);	
end

function drop_plant()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>C�y Gi�ng Sinh<color>: ��ng c�p c�a b�n qu� th�p, l�n h�n ho�c b�ng c�p 40 m�i ���c tham gia ho�t ��ng n�y.");
		return
	end
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","Khu v�c hi�n t�i kh�ng th� �� xu�ng ���c!");
		return
	end
	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("M�i ng��i � g�n d� d�ng t�m ���c c�y th�ng c�a ng��i. Xin ch�n n�i kh�c.", 0)
		return
	end 	
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then
		Talk(1,"","M�i ng�y m�t ng��i ch� c� th� tr�ng"..PLANT_TREE_NUM.." c�y th�ng.");
		return
	end
	local nTime = GetTime();
	if  nTime-GetTask(TASK_PLANT_TIME) < PLANT_LIFE_TIME and GetTask(TASK_PLANT_TIME) ~= 0 then
		Talk(1,"","B�n �� qu�n n�i �� c�y th�ng? Kh�ng sao, ch�t n�a n� s� quay v�.");
		return
	end
	local MapID,MapX,MapY = GetWorldPos();
	local nNum = GetTask(TASK_TREE_NUM);
	local nSharpIdx = GetTask(TASK_SHARP_IDX);
	if nSharpIdx == 0 then
		nSharpIdx = random(1,4);
		SetTask(TASK_SHARP_IDX,nSharpIdx);
	end
	local npcTreeIndex = CreateNpc(tTreeNpc[nNum+1][nSharpIdx][1],GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[C�y th�ng n�m m�i 08 b� l�i]:"..GetName().."Khi ��t c�y th�ng v�o, CreateNpc tr� h�m s� quay l�i l� 0, trong h�m s� CreateNpc tham s� nh�p v�o l�:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
	SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
	SetTask(TASK_IS_PLANT,1);
	SetTask(TASK_PLANT_TIME,GetTime());
	SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");
	Talk(1,"","Ng��i �� ��t c�y th�ng v�o.");
end
