Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

tbNpcIdex = {}

function main()
	local npcIndex = GetTargetNpc();
	for _,npcPos in tbNpcIdex do
		if npcIndex == npcPos then
			Talk(1,"","<color=green>N�i �ng:<color>t�i �� ���c c�u r�i");
			return 0;
		end
	end
	if tGtTask:check_cur_task(69) == 1 and GetTask(Task_id_007) < 8 then
--		local tbRand = {
--			"<color=green>��Ӧ��<color>Ϊ����Ч����������",
--			"<color=green>��Ӧ��<color>�������ðɣ�",
--			"<color=green>��Ӧ��<color>�����������������",
--		}
		tinsert(tbNpcIdex,npcIndex);
--		local nTemp1 = mod(random(100),3) or 0;
--		Talk(1,"",tbRand[nTemp1 +1]);
		SetTask(Task_id_007,GetTask(Task_id_007)+1);
		local tSex = gf_GetPlayerSexName();
		Msg2Player(tSex..format("�� c�u ���c %d/8 n�i �ng.",GetTask(Task_id_007)));
		Talk(1,"",tSex..format("�� c�u ���c %d/8 n�i �ng.",GetTask(Task_id_007)));
		if getn(tbNpcIdex) >= 8 then
			for i = 1,getn(tbNpcIdex) do
				tremove(tbNpcIdex,i);
			end
			if getn(tbNpcIdex) ~= 0 then
				print("Error!need reload script.");
			end
		end
	else
		Talk(1,"","<color=green>N�i �ng: <color>l�nh c�a gi�o ch� quy�t kh�ng t� nan");
	end
end
