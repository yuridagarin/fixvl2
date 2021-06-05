Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

t_pet_fighting_pos = {
	{101,1660, 3081},
	{101,1638, 3151},
	{101,1605, 3183},
	{101,1572, 3165},
	{101,1543, 3184},
	{101,1515, 3300},
	{101,1520, 3243},
	{101,1551, 3272},
	{101,1501, 3116},
	{101,1538, 3131},
}

function main()
	local tSay = {
		"So t�i B�n ��ng H�nh/pet_fight",
		"R�n luy�n B�n ��ng H�nh/pet_train",
		"K�t th�c ��i tho�i/gf_DoNothing",	
	}
	Say("T�i ��y di�n ra thi ��u B�n ��ng H�nh. Ph� ��ng k� thi ��u l� 60 v�ng 1 l�n. Ch� nh�n c�a B�n ��ng H�nh chi�n th�ng s� nh�n ���c 4 T�o. N�u so t�i h�a s� ���c 2 T�o.", getn(tSay), tSay)
end

function pet_fight()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
	local tSay = {
		"B�t ��u so t�i B�n ��ng H�nh/pet_fight_start",
		"Nh�n ph�n th��ng chi�n th�ng/pet_fight_reward",
		"K�t th�c ��i tho�i/gf_DoNothing",	
	}
	Say("T�i ��y di�n ra thi ��u B�n ��ng H�nh. Ph� ��ng k� thi ��u l� 60 v�ng 1 l�n. Ch� nh�n c�a B�n ��ng H�nh chi�n th�ng s� nh�n ���c 3 T�o. Th�i gian thi ��u l� 10 ph�t.", getn(tSay), tSay)
end

function pet_fight_reward()
	if GetTrigger(2516) ~= 0 then
		Talk(1,"","B�n ��ng H�nh c�a b�n �ang thi ��u v�i ng��i kh�c!")		
		return
	end
	local nTaskVal = GetTask(TASK_PET_FIGHT)
	if nTaskVal== 0 or nTaskVal > 2 then
		Talk(1,"","B�n hi�n t�i kh�ng c� ph�n th��ng n�o!")		
		return
	end
	if gf_JudgeRoomWeight(1,1,"") == 0 then
		return
	end	
	SetTask(TASK_PET_FIGHT,0)
	if nTaskVal == 1 then
		gf_AddItemEx2({2, 1, 30176, 4},"T�o","Ban Dong Hanh","so t�i th�ng",0,1)
	elseif nTaskVal == 2 then
		gf_AddItemEx2({2, 1, 30176, 2},"T�o","Ban Dong Hanh","so t�i h�a",0,1)
	end
end

function pet_fight_start()
	local nTeamSize = GetTeamSize()
	local nTargetIdx = GetTargetNpc()
	if GetTime() - GetUnitCurStates(nTargetIdx,6) <= 10*60 then
		Talk(1,"","Khu v�c n�y hi�n �ang c� thi ��u!")		
		return	
	end	
	if nTeamSize ~= 2  then	
		Talk(1,"","T� ��i thi ��u ph�i c� 2 ng��i!")		
		return
	end
	if GetName() ~= GetCaptainName() then		
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t thi ��u!")		
		return
	end
	local nOldIndex = PlayerIndex;	
	local nEnemyIndex = 0
	local nPetEnemyIndex = 0
	local nCheck = 1	
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if  mod(GetTask(TASK_VNG_PET), 100) < 2 then
			Talk(1,"","B�n ��ng H�nh c�p 2 tr� l�n m�i c� th� tham gia thi ��u!")		
			nCheck = 0
			break
		end
		if GetCash() < 600000 then
			Talk(1,"","Ph� ��ng k� thi ��u l� 60 v�ng! B�n ch�a mang theo �� v�ng!")		
			nCheck = 0
			break
		end
		if GetTrigger(2516) ~= 0 then
			Talk(1,"","B�n ��ng H�nh c�a b�n �ang thi ��u v�i ng��i kh�c!")		
			nCheck = 0
			break
		end
		if PlayerIndex ~= nOldIndex then
			nEnemyIndex = PlayerIndex
		end
	end
	PlayerIndex = nOldIndex
	if nCheck == 0 then	
		Talk(1,"","T� ��i c� ng��i kh�ng �� �i�u ki�n ��ng k�!")
		return
	end
	
	local nPosIdx = GetUnitCurStates(nTargetIdx,2)
	AddUnitStates(nTargetIdx,6, - GetUnitCurStates(nTargetIdx,6) + GetTime())
	
	local nNpcIdx1, nNpcIdx2 = 0,0
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100) 
		local nPetType = gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_TYPE)
		Pay(600000)		
		SetTask(TASK_PET_FIGHT,nTargetIdx*10)		
		CreateTrigger(1, 1001, 2516);
    		ContinueTimer(GetTrigger(2516));
		if PlayerIndex == nOldIndex then	
			SetTaskTemp(TSK_TMP_ENEMY_INDEX,nEnemyIndex)
			nNpcIdx1 = CreateNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType],GetName(),t_pet_fighting_pos[nPosIdx][1],t_pet_fighting_pos[nPosIdx][2],t_pet_fighting_pos[nPosIdx][3],-1,1,1,15)
			SetTaskTemp(TSK_TMP_PET_INDEX,nNpcIdx1)			
			SetCampToNpc(nNpcIdx1,"dasong")
			SetNpcDeathScript(nNpcIdx1,"\\script\\online\\viet_event\\pet_fighting\\pet_death.lua")
			SetNpcLifeTime(nNpcIdx1,600)
			AddUnitStates(nNpcIdx1,7,10)
			local nState = GetUnitCurStates(nNpcIdx1,6)
			AddUnitStates(nNpcIdx1,8, 50)
			AddUnitStates(nNpcIdx1,6, - nState)
			AddUnitStates(nNpcIdx1,6,PlayerIndex)
		else
			SetTaskTemp(TSK_TMP_ENEMY_INDEX,nOldIndex)
			nNpcIdx2 = CreateNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType],GetName(),t_pet_fighting_pos[nPosIdx][1],t_pet_fighting_pos[nPosIdx][2],t_pet_fighting_pos[nPosIdx][3],-1,1,1,15)
			SetTaskTemp(TSK_TMP_PET_INDEX,nNpcIdx2)
			SetCampToNpc(nNpcIdx2,"daliao")
			SetNpcDeathScript(nNpcIdx2,"\\script\\online\\viet_event\\pet_fighting\\pet_death.lua")
			SetNpcLifeTime(nNpcIdx2,600)
			AddUnitStates(nNpcIdx2,7,10)
			local nState = GetUnitCurStates(nNpcIdx2,6)
			AddUnitStates(nNpcIdx2,8, 50)
			AddUnitStates(nNpcIdx2,6, - nState)
			AddUnitStates(nNpcIdx2,6,PlayerIndex)
		end		
	end	
	PlayerIndex = nOldIndex
		
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex == nOldIndex then	
			SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,nNpcIdx2)
		else
			SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,nNpcIdx1)
		end
	end
	PlayerIndex = nOldIndex
end