--=============================================
--create by baiyun 2009.4.9
--describe:Խ�ϰ�4�·������
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")

-----------------------------------------------
--OnUse()
--������ִ����¼�
-----------------------------------------------
function OnUse()
-----����Ƿ��������������
	if checkEventDate() == 0 then
		Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
		return 0;
	end
	if checkEventTime() == 0 then
		Talk(1, "", "Th�i gian tr�ng c�y l� 0:00 - 12:00 v� 17:00 - 0:00");
		return 0;
	end
	
	if GetLevel() < PLANT_TREE_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V�n ch�a ��t ��n c�p <color=yellow>" .. PLANT_TREE_ROLE_LEVEL_LIMIT .. "<color> c�p kh�ng th� tr�ng c�y");
		return 0;
	end
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "��a �i�m tr�ng c�y kh�ng th�ch h�p");
		return 0;
	end
-----���������ڼ�飬��������һ����������ʾ���ڿ��������ˣ�������������-----
-----��������������Ϊ0������������Ϊ���죬��������ʱ��ͽ�ˮʱ����Ϊ����--------
	local nDate = tonumber(date("%y%m%d"));
--������컹û�����������ʾ��������
	if GetTask(TASK_PLANT_TREE_DATE) < nDate then 
		SetTask(TASK_PLANT_TREE_COUNT, 0);
		SetTask(TASK_WATER_TREE_TIME, 0);
		SetTask(TASK_PLANT_TREE_TIME, 0);
	else
-----�������ֵ����Ƿ��Ѿ���������������--------------------------------------
		if GetTask(TASK_PLANT_TREE_COUNT) >= PLANT_TREE_LIMIT then
			Talk(1, "", "H�m nay b�n �� tr�ng <color=yellow>".. GetTask(TASK_PLANT_TREE_COUNT) .."<color> c�y r�i, ��i ngay mai h�y ti�p t�c nh�.");
			return 0;
		end
-----����Ƿ��Ѿ�����һ������----------------------------------------------------
		for i = 1, 6 do
			if GetTask(TASK_TREE_GROW) == i and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < TREE_PARAM[i][2] and GetTask(TASK_WATER_TREE_TIME) ~= 0 then
				Talk(1, "", "��i hi�p �� tr�ng 1 c�y r�i");
				return 0;
			end
		end
-----������ϴ������Ƿ��Ѿ�����PLANT_TREE_INTERVAL��ô��ʱ��---------------------
		local nTreeType = GetTask(TASK_PLANT_TREE_TYPE)
		if nTreeType == 2 then
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL * 2  then
				Talk(1, "", "Th�i gian gi�n c�ch gi�a hai l�n tr�ng c�y l� <color=yellow>" .. PLANT_TREE_INTERVAL * 2 .. " gi�y.");
				return 0;
			end
		else			
			if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
				Talk(1, "", "Th�i gian gi�n c�ch gi�a hai l�n tr�ng c�y l� <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi�y.");
				return 0;
			end
		end
	end
-----����������------------------------------------------------------------------
	local selTab = {
				"H�y mau tr�ng c�y/plantTree",
	 			"Sau n�y tr�ng s� t�t h�n!/doNothing"
	 		}
	Say("��i hi�p mu�n tr�ng c�y?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--��������
---------------------------
function plantTree()
	local nDate = tonumber(date("%y%m%d"));
-----ɾ�����ϵ�һ������-------------------------------------------------------------------------
	if DelItem(2, 1, 30075, 1) == 1 then
		local nMapID, nMapX, nMapY = GetWorldPos();
-----�˴����������ֵĸ������õ�������������-----------------------------------------------------
		local nRand = 0;
		local nTreeType = 0;
		local nMin = 0;
		
		nRand = random(1, 100);
		
		for i=1,getn(TREE_TYPE) do
			if nRand > nMin and nRand <=  TREE_TYPE[i][3] + nMin then
				nTreeType = i
				break
			end		
			nMin = nMin + TREE_TYPE[i][3]
		end
		
		local npcTreeIndex = CreateNpc(TREE_TYPE[nTreeType][1], GetName().." tr�ng "..TREE_TYPE[nTreeType][2], nMapID, nMapX, nMapY);
		WriteLogEx("Hoat dong thang 4","tr�ng c�y",1,TREE_TYPE[nTreeType][2])
		if npcTreeIndex == 0 then
			WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:"
								..GetName..
								"Trong l�c tr�ng c�y, CreatNpc h�m s� tr� v� 0. Nh�p tham s� CreateNPC l�:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " tr�ng "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----�����ð׽���������ȫ���緢����
		if nTreeType == 5 then
			AddGlobalNews("Ch�c m�ng  "..GetName().." �� nh�n ���c." .. "C�y B�ch Kim" .. "T�i".. CITY_NAME_ID[GetWorldPos()]);
		end
		
-----�������Ĵ��ʱ��----------------------------------------------------------------------------		
		SetTask(TASK_PLANT_TREE_TYPE, nTreeType);
		if nTreeType == 2 then
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[6][2]);--����ǲ�����������¶ˮ���࣬����ʱ��ֱ����300��
		else
			SetNpcLifeTime(npcTreeIndex, TREE_PARAM[1][2]);--�����¿϶��ǵ�һ�׶�
		end
		SetTask(TASK_TREE_INDEX, npcTreeIndex);
		SetTask(TASK_TREE_GROW, 1);
		SetTask(TASK_WATER_TREE_TIME, GetTime());
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_2009_4\\planttrees\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());
		Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l�n tr�ng c�y, h�m nay c�n c� th� tr�ng <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c�y. N�u nh� " .. TREE_PARAM[1][2] .. " gi�y kh�ng t��i n��c, c�y s� t� ��ng ch�t �i.", 0);
	end
end