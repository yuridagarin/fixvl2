--=============================================
--create by baiyun 2009.5.29
--describe:Խ�ϰ�7�·ݻ֮������
--ӦԽ�Ϸ�Ҫ�󣬻�ð׽����ĸ�����100%��������������һ�������Ը��ļ�����\script\online\viet_event\200907\5\planttrees_process.lua
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")

-----------------------------------------------
--OnUse()
--������ִ����¼�
-----------------------------------------------
function OnUse(nItemIdx)
-----����Ƿ��������������
	if checkEventDate() == 0 then
		Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
		return 0;
	end
--	if checkEventTime() == 0 then
--		Talk(1, "", "����ʱ��Ϊ00:00 �C 12:00��17:00 �C 00:00����ʱ���");
--		return 0;
--	end
	
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
		if GetTask(TASK_PLANT_TREE_TYPE) == 2 and GetTime() - GetTask(TASK_PLANT_TREE_TIME) < 300 then--������²�����������û��֮ǰ���������ֱ����
				Talk(1, "", "��i hi�p �� tr�ng 1 c�y r�i");
				return 0;
		end
-----������ϴ������Ƿ��Ѿ�����PLANT_TREE_INTERVAL��ô��ʱ��---------------------
		if GetTime() - GetTask(TASK_PLANT_TREE_TIME) < PLANT_TREE_INTERVAL then
			Talk(1, "", "Th�i gian gi�n c�ch gi�a hai l�n tr�ng c�y l� <color=yellow>" .. PLANT_TREE_INTERVAL .. " gi�y.");
			return 0;
		end
	end
-----����������------------------------------------------------------------------
	local selTab = {
				"H�y mau tr�ng c�y/#plantTree("..nItemIdx..")",
	 			"Sau n�y tr�ng s� t�t h�n!/doNothing"
	 		}
	Say("��i hi�p mu�n tr�ng c�y?", getn(selTab), selTab);		 
end

---------------------------
--plantTree()
--��������
---------------------------
function plantTree(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
-----ɾ�����ϵ�һ������-------------------------------------------------------------------------
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nMapID, nMapX, nMapY = GetWorldPos();
-----�˴����������ֵĸ������õ�������������-----------------------------------------------------
		local nRand = 0;
		local nTreeType = 0;
		local nMin = 0;
	

--		nRand = random(1, 100);
--		if nRand > 0 and nRand <= TREE_TYPE[5][3] then
--			nMin = TREE_TYPE[5][3];
--			nTreeType = 5;
--		elseif nRand > nMin and nRand <= TREE_TYPE[4][3] + nMin then
--			nTreeType = 4;
--			nMin = nMin + TREE_TYPE[4][3];
--		elseif nRand > nMin and nRand <= TREE_TYPE[1][3] + nMin then
--			nTreeType = 1;
--			nMin = nMin + TREE_TYPE[1][3];
--		elseif nRand > nMin and nRand <= TREE_TYPE[2][3] + nMin then
--			nTreeType = 2;
--			nMin = nMin + TREE_TYPE[2][3];
--		else
--			nTreeType = 3;
--		end
                --by xiongyizhi ��������ˣ�ֱ�Ӹ����ǰ׽�
                nTreeType = 5;
		
		local npcTreeIndex = CreateNpc(TREE_TYPE[nTreeType][1], GetName().." tr�ng "..TREE_TYPE[nTreeType][2], nMapID, nMapX, nMapY);
		if npcTreeIndex == 0 then
			WriteLogEx(g_viet0908_event_title, "Tr�ng c�y", nil, nil, nil, nil, nil, "Ham so CreatNPC tro ve 0. Nhap ham so Create:"
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
		SetNpcScript(npcTreeIndex, "\\script\\online\\viet_event\\200907\\5\\tree_npc.lua");
		SetTask(TASK_PLANT_TREE_DATE, nDate);
		SetTask(TASK_PLANT_TREE_COUNT, GetTask(TASK_PLANT_TREE_COUNT) + 1);
		SetTask(TASK_PLANT_TREE_TIME, GetTime());
		Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l�n tr�ng c�y, h�m nay c�n c� th� tr�ng <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c�y. N�u nh� " .. TREE_PARAM[1][2] .. " gi�y kh�ng t��i n��c, c�y s� t� ��ng ch�t �i.", 0);
	end
end
