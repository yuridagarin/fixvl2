--08新年小圣诞树（树种）脚本
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	if get_chrims_state() ~= 1 then
		Talk(1,"","Ho箃 ng gi竛g sinh  k誸 th骳, c﹜ th玭g  kh玭g c遪 ? ngh躠 g?.");
		return
	end
	local strtab = {
		"t c﹜ th玭g xu鑞g /drop_plant",
		"Kh玭g ph秈, t ch薽 l筰./nothing"}
	Say("Ngi mu鑞  c﹜ th玭g xu鑞g?",
		getn(strtab),
		strtab);	
end

function drop_plant()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>C﹜ Gi竛g Sinh<color>: Ъng c蕄 c馻 b筺 qu? th蕄, l韓 h琻 ho芻 b籲g c蕄 40 m韎 頲 tham gia ho箃 ng n祔.");
		return
	end
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","Khu v鵦 hi謓 t筰 kh玭g th?  xu鑞g 頲!");
		return
	end
	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("M鋓 ngi ? g莕 d? d祅g t譵 頲 c﹜ th玭g c馻 ngi. Xin ch鋘 n琲 kh竎.", 0)
		return
	end 	
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then
		Talk(1,"","M鏸 ng祔 m閠 ngi ch? c? th? tr錸g"..PLANT_TREE_NUM.." c﹜ th玭g.");
		return
	end
	local nTime = GetTime();
	if  nTime-GetTask(TASK_PLANT_TIME) < PLANT_LIFE_TIME and GetTask(TASK_PLANT_TIME) ~= 0 then
		Talk(1,"","B筺  qu猲 n琲  c﹜ th玭g? Kh玭g sao, ch髏 n鱝 n? s? quay v?.");
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
		WriteLog("[C﹜ th玭g n╩ m韎 08 b? l鏸]:"..GetName().."Khi t c﹜ th玭g v祇, CreateNpc tr? h祄 s? quay l筰 l? 0, trong h祄 s? CreateNpc tham s? nh藀 v祇 l?:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
	SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
	SetTask(TASK_IS_PLANT,1);
	SetTask(TASK_PLANT_TIME,GetTime());
	SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");
	Talk(1,"","Ngi  t c﹜ th玭g v祇.");
end
