Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tbNpcIdex = {}

function main()
	local npcIndex = GetTargetNpc();
	for _,npcPos in tbNpcIdex do
		if npcIndex == npcPos then
			Talk(1,"","<color=green>N玦 鴑g:<color>t玦  頲 c鴘 r錳");
			return 0;
		end
	end
	if tGtTask:check_cur_task(69) == 1 and GetTask(Task_id_007) < 8 then
--		local tbRand = {
--			"<color=green>内应：<color>为教主效命在所不辞",
--			"<color=green>内应：<color>教主还好吧！",
--			"<color=green>内应：<color>教主大恩永世不忘！",
--		}
		tinsert(tbNpcIdex,npcIndex);
--		local nTemp1 = mod(random(100),3) or 0;
--		Talk(1,"",tbRand[nTemp1 +1]);
		SetTask(Task_id_007,GetTask(Task_id_007)+1);
		local tSex = gf_GetPlayerSexName();
		Msg2Player(tSex..format("Х c鴘 頲 %d/8 n閕 鴑g.",GetTask(Task_id_007)));
		Talk(1,"",tSex..format("Х c鴘 頲 %d/8 n閕 鴑g.",GetTask(Task_id_007)));
		if getn(tbNpcIdex) >= 8 then
			for i = 1,getn(tbNpcIdex) do
				tremove(tbNpcIdex,i);
			end
			if getn(tbNpcIdex) ~= 0 then
				print("Error!need reload script.");
			end
		end
	else
		Talk(1,"","<color=green>N閕 鴑g: <color>l謓h c馻 gi竜 ch? quy誸 kh玭g t? nan");
	end
end
