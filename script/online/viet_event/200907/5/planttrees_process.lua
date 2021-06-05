--=============================================
--create by baiyun 2009.5.29
--describe:Խ�ϰ�7�·ݻ֮������
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")
Include("\\script\\lib\\writelog.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

-----------------------------------------------
--OnUse()
--������ִ����¼�
-----------------------------------------------

function OnUse(nItemIdx)
-----����Ƿ��������������
--	if checkEventDate() == 0 then
--		Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
--		return 0;
--	end
--	if tonumber(date("%y%m%d%H")) >= 09082108 and  tonumber(date("%y%m%d%H")) < 09082118 then 
--		Msg2Player("Hi�n t�i kh�ng th� s� d�ng ���c v�t ph�m n�y");
--		return
--	end
--	if checkEventTime() == 0 then
--		Talk(1, "", "����ʱ��Ϊ00:00 �C 12:00��17:00 �C 00:00����ʱ���");
--		return 0;
--	end
	if GetFreeItemRoom() < 2 then
		Talk(1, "", "H�nh trang kh�ng �� 2 � tr�ng, kh�ng th� tr�ng c�y");
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
	if checkPlaceMainCity() == 0 then
		Talk(1, "", "��a �i�m tr�ng c�y kh�ng th�ch h�p");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
-----ɾ�����ϵ�һ������-------------------------------------------------------------------------
	if DelItem(2, 1, 30086, 1) == 1 then
		----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u 3 s� ��u b�n ph�i
		local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)
		if nCSD_HG < 300 and GetTask(TSK_CSD) == 1 then
			SetTask(TSK_CSD_COUNT_B, GetTask(TSK_CSD_COUNT_B) + 1)
		end
		----------------------- Chu�i nhi�m v� M�nh Thi�n Th�ch, l�u 3 s� ��u b�n ph�i
		local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
		local nMTT_HG_NV =  mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
		if nMTT_HG < 150 and nMTT_HG_NV == 1 then
			SetTask(TSK_MTT_COUNT, GetTask(TSK_MTT_COUNT) + 1)
		end
		------------------------Chu�i nhi�m v� Chuy�n Sinh 6
		local nCS6_HG =  floor(GetTask(TSK_CS6_COUNTA)/10000000)
		local nCS6_HG_Num = mod(GetTask(TSK_CS6_COUNTA),10000000)
		if mod(nCS6_HG,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_HG = (nCS6_HG + 1) * 10000000 + nCS6_HG_Num
			SetTask(TSK_CS6_COUNTA, nCS6_HG)
		end
		-----------------------------------------------------------------
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

		KichHoatHatGiong() -- ph�n thu�ng khi k�ch ho�t
		--- �i�m V�n May
--		local nBonusExp = 1200000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nBonusExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--		else
--			Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--		end
		---------			
		WriteLogEx("Hoat dong trong cay","Tr�ng",1,TREE_TYPE[nTreeType][4])
		if npcTreeIndex == 0 then
			WriteLog("[Hoat dong trong cay loi]:"
								..GetName..
								"Trong l�c tr�ng c�y, CreatNpc h�m s� tr� v� 0. Nh�p tham s� CreateNPC l�:"
								 ..TREE_TYPE[nTreeType][1]..", " ..GetName().. " tr�ng "
								  ..TREE_TYPE[nTreeType][2].. ", " ..nMapID.. "," ..nMapX.. "," ..nMapY);
		end

-----�����ð׽���������ȫ���緢����
		if nTreeType == 5 then
			AddGlobalNews("Ch�c m�ng  "..GetName().." �� nh�n ���c." .. "C�y B�ch Kim" .. " T�i ".. CITY_NAME_ID[GetWorldPos()]);
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

		if nTreeType ~= 2 then
			StartTimeGuage("T��i c�y",TREE_PARAM[GetTask(TASK_TREE_GROW)][3],0,1)
		else
			StartTimeGuage("Thu ho�ch",240,0,1)
		end
		Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(TASK_PLANT_TREE_COUNT).."<color> l�n tr�ng c�y, h�m nay c�n c� th� tr�ng <color=yellow>"..PLANT_TREE_LIMIT - GetTask(TASK_PLANT_TREE_COUNT).."<color> c�y. N�u nh� " .. TREE_PARAM[1][2] .. " gi�y kh�ng t��i n��c, c�y s� t� ��ng ch�t �i.", 0);

		--if GetTask(TASK_PLANT_TREE_COUNT) == PLANT_TREE_LIMIT and nDate <= 130120 then	
		if nDate >= 130214 and nDate <= 130228 then	
			gf_AddItemEx2({2,1,30357, 200}, "H�t Ca Cao", "VALENTINE 2013", "H�t ca cao")
		end	
	end
end
