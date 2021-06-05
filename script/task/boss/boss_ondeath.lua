Include("\\script\\online\\newyear08\\newyear08_head.lua");--08ʥ����
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

t_TUOGUAN_MIJI = {
	[1] = {"Kim Cang B�t Nh� Kinh", {0,107,166,2}},
	[2] = {"V� Tr�n B� �� Kinh",{0,107,168,1}},
	[3] = {"Ti�m Long T�ch Di�t Kinh",{0,107,167,1}},
	[4] = {"Thi�n La Li�n Ch�u L�c",{0,107,169,1}},
	[5] = {"Nh� � Kim ��nh M�t T�ch",{0,107,170,1}},
	[6] = {"B�ch H�i Tuy�t �m Ph�",{0,107,171,1}},
	[7] = {"H�n ��n Tr�n Nh�c M�t T�ch"	,{0,107,172,1}},
	[8] = {"Qu� Thi�n Du Long M�t T�ch",{0,107,173,1}},
	[9] = {"Huy�n �nh M� Tung M�t T�ch",{0,107,174,1}},
	[10] = {"Qu�n T� Ti�t Phong M�t T�ch",{0,107,175,1}},
	[11] = {"Tr�n Qu�n Phi Long Th��ng Ph�"	,{0,107,176,1}},
	[12] = {"Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177,1}},
	[13] = {"U Minh Phong Ma L�c",{0,107,178,1}},
	[14] = {"Linh C� Huy�n T� L�c",{0,107,179,1}},
	[15] = {"C�u Thi�n Phong L�i Quy�t",{0,107,198,1}},	
	[16] = {"H�ng Tr�n T�y M�ng Ph�",{0,107,202,1}},
	[17] = {"Phong Hoa Thi�n Di�p Ph�",{0,107,203,1}},
};

t_TUOGUAN_HIG_VOZ = {
	[1] = {"Kim Cang B�t Nh� Ch�n Quy�n", {0,107,204,1,1}},
	[2] = {"V� Tr�n B� �� Ch�n Quy�n",{0,107,206,1,1}},
	[3] = {"Ti�m Long T�c Di�t Ch�n Quy�n",{0,107,205,1,1}},
	[4] = {"Thi�n La Li�n Ch�u Ch�n Quy�n",{0,107,207,1,1}},
	[5] = {"Nh� � Kim ��nh Ch�n Quy�n",{0,107,208,1,1}},
	[6] = {"B�ch H�i Tuy�t �m Ch�n Quy�n",{0,107,209,1,1}},
	[7] = {"H�n ��n Tr�n Nh�c Ch�n Quy�n",{0,107,210,1,1}},
	[8] = {"Qu� Thi�n Du Long Ch�n Quy�n",{0,107,211,1,1}},
	[9] = {"Huy�n �nh M� T�ng Ch�n Quy�n",{0,107,212,1,1}},
	[10] = {"Qu�n T� ��i Phong Ch�n Quy�n",{0,107,213,2,1}},
	[11] = {"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n",{0,107,214,1,1}},
	[12] = {"Xuy�n V�n L�c H�ng Ch�n Quy�n",{0,107,215,1,1}},
	[13] = {"Huy�n Minh Phong Ma Ch�n Quy�n",{0,107,216,1,1}},
	[14] = {"Linh C� Huy�n T� Ch�n Quy�n",{0,107,217,2,1}},
	[15] = {"C�u Thi�n Phong L�i Ch�n Quy�n", {0,107, 218,1,1}},		
	[16] = {"H�ng Tr�n T�y M�ng Ch�n Quy�n", {0,107, 222,1,1}},		
	[17] = {"Phong Hoa Thi�n Di�p Ch�n Quy�n", {0,107, 223,1,1}},			
};

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if get_chrims_state() == 1 then
		local nRand = random(1,1000);
		if nRand <= 1000 then
			AddItem(2,1,1192,1);
			Msg2Player("B�n nh�n ���c m�t t�i l� v�t Gi�ng Sinh");
		end
	end
	if npcName == "B�c L�c L�m Minh Ch�" then
		local npcIndex = CreateNpc("B�c L�c L�m l�nh","B�c L�c L�m l�nh",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "T�i c�a B�c L�c L�m Minh Ch�", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "Th��ng Th�n Doanh Thi�n" then
		local npcIndex = CreateNpc("Tr�c �nh Th��ng","Tr�c �nh Th��ng",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������	
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "T�i c�a Th��ng Th�n Doanh Thi�n", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "L�nh H��ng L�ng" then
		---- Nhi�m v� chuy�n sinh 5
	local nTeamSize = GetTeamSize()
	if nTeamSize >= 2 then
		local nOldPlayerIdx = PlayerIndex
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
			end
			if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho�n th�nh y�u c�u c�a Nh� Ho�ng T� �o�n T� Thu�n ti�u di�t h�n ma L�nh H��ng L�ng  ")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
		end
		if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho�n th�nh y�u c�u c�a Nh� Ho�ng T� �o�n T� Thu�n ti�u di�t h�n ma L�nh H��ng L�ng  ")
		end
	end
		
		local npcIndex = CreateNpc("Tuy�t T�nh Th�ch","Tuy�t T�nh Th�ch",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������	
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "T�i c�a L�nh H��ng L�ng", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end			
	else
		Talk(1,"","B�n nh�n xung quanh v�n kh�ng ph�t hi�n g�.");
	end;
	
	if AddItem(2,2,7,3) == 1 then
			Msg2Player("B�n nh�n ���c 1 m�nh Thi�n Th�ch");
			WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 1 m�nh Thi�n Th�ch");
	end;		
	

	local nRandBook = random(1,17);
	gf_AddItemEx(t_TUOGUAN_MIJI[nRandBook][2], t_TUOGUAN_MIJI[nRandBook][1]);		
	Msg2Player("B�n �� nh�n ���c 1 M�t t�ch m�n ph�i "..t_TUOGUAN_MIJI[nRandBook][1]);
	WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().." �� nh�n ���c 1 M�t t�ch m�n ph�i "..t_TUOGUAN_MIJI[nRandBook][1]);

end