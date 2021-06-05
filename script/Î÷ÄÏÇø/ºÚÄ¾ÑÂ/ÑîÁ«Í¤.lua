--NPCĬ�϶Ի��ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	local tbSay = {};
	tinsert(tbSay,"\n t�i h� �� s�n s�ng khi�u chi�n ��ng Ph��ng B�t B�i r�i/challenge");
	tinsert(tbSay,"\n ch� ch�t h�y n�i/do_nothing");
	Say("<color=green>D��ng Li�n ��nh: <color>��ng Ph��ng gi�o ch�, thi�n h� �� nh�t.",getn(tbSay),tbSay);
end

function do_nothing()
--do nothing
end

tbTempName = {};

function challenge()
	--�ж��Ƿ��Ƕӳ�
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t BOSS ��ng Ph��ng B�t B�i")
		return 0;
	end
	--�ж��Ƿ���˶�����������
	tbTempName = {};
	local msg;
	--������
	local nSize = GetTeamSize();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i);
		check_team();
	end
	PlayerIndex = oldPlayerIndex;
	if getn(tbTempName) ~= 0 then
		msg = "<color=red> th�nh vi�n ch�a ti�p nh�n ho�c �� ho�n th�nh nhi�m v� ��ng Ph��ng B�t B�i: <color>\n";
		for i = 1, getn(tbTempName) do
			msg = msg .. tbTempName[i] .. " ";
		end
		Talk(1,"",msg);
		return 0;
	end	
	Say("\n<color=red> chu�n b� xong ch�a?<color>\n",2,"\n khi�u chi�n ��ng Ph��ng B�t B�i/start_fight","\n ch�a chu�n b� xong/do_nothing");
end

function start_fight()
	--�ж��Ƿ��ͼ��ֻ��һ����������BOSS
	local npcIndex = GetMapTaskTemp(6017,Map_Glb_Valve1);
	if npcIndex ~= 0 then
		if IsNpcDeath(npcIndex) == 0 then
			Talk(1,"","B�n ��  ch� cho ph�p 1 ��ng Ph��ng B�t B�i xu�t hi�n, xin h�y ch� ch�t.");
			return 0;
		end
	end
	--print("npcIndex",npcIndex);
	--����NPC
	local nNpcIdx = CreateNpc("��ng Ph��ng B�t B�i","��ng Ph��ng B�t B�i",6017,1628,2891);
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\npc\\��������.lua");
	SetNpcLifeTime(nNpcIdx,10*60);
	SetCampToNpc(nNpcIdx,"camp_evil");
	SetCampToPlayer("camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve1,nNpcIdx);
	local nIndexNpc = CreateNpc("Nh�m Ng� H�nh chi�n ��u","Nh�m Ng� H�nh",6017,1628+2,2891+2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve6,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	nIndexNpc = CreateNpc("Nh�m Doanh Doanh chi�n ��u","Nh�m Doanh Doanh",6017,1628-2,2891+2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve7,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	nIndexNpc = CreateNpc("H��ng V�n Thi�n chi�n ��u","H��ng V�n Thi�n",6017,1628+2,2891-2,0);
	SetNpcLifeTime(nIndexNpc,10*60);
	SetCampToNpc(nIndexNpc,"camp_enemy");
	SetMapTaskTemp(6017,Map_Glb_Valve8,nIndexNpc)
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_npc.lua");
	--����ʱ�������
	SetTaskTemp(250,0);
	CreateTrigger(1,1521,1521*2);
	ContinueTimer(GetTrigger(1521*2));
end


function check_team()
	if tGtTask:check_cur_task(72) ~= 1 then
		tinsert(tbTempName,GetName());
	elseif GetTask(Task_id_014) == 1 then
		tinsert(tbTempName,GetName());
	end
end


function OnTimer()
	--print("GetTaskTemp(250) =",GetTaskTemp(250))
	local npcIndex = GetMapTaskTemp(6017,Map_Glb_Valve1);
	if GetTaskTemp(250) >= 16 or npcIndex == 0 or IsNpcDeath(npcIndex) == 1 then
		RemoveTrigger(GetRunningTrigger());
		SetTaskTemp(250,0);
		--������ã�npcɾ��
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve6),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve7),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve8),0);
		SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve1),0);
		SetMapTaskTemp(6017,Map_Glb_Valve1,0);
		--����
		local nSize = GetTeamSize();
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			Msg2Player("Khi�u chi�n th�t b�i");
		end
		PlayerIndex = oldPlayerIndex;
	end
	SetTaskTemp(250,GetTaskTemp(250) + 1);
end

function do_nothing()
end