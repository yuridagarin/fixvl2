--=============================================
--create by baiyun 2009.4.9
--describe:Խ�ϰ�4�·������
--=============================================
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

--------------------------------------
--main()
--������
--------------------------------------
function main()
	local nPlantTimePassed = 0;
	local nWaterTimePassed = 0;
	local npcIdx, npcModel, npcName = GetTriggeringUnit();--��õ�ǰ���������NPC������ģ��ID����ʾ����
	if npcIdx == 0 then
		WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:"..GetName().."Trong l�c t��i c�y, GetTriggeringUnit th� nh�t s� tr� v� 0");
		return 0;
	end
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName, 1, nNameLen) then --���������ж��ǲ�����ҵ���
		bJudgeByName = 1;
	end
	local bIsTree = 0;
	for i = 1, getn(TREE_TYPE) do
		if npcModel == TREE_TYPE[i][1] then
			bIsTree = 1;
			break;
		end
	end
	if bIsTree == 0 then
		SetNpcScript(npcIdx, "");
		WriteLog("[L�i khi tr�ng c�y th�ng 4]:NPC:"..npcName.."L�i files g�c");
		return 0;
	end
	local npcTreeIndex = GetTargetNpc(); --��ȡ��ҵĶ�������Npc
	if npcTreeIndex == 0 then
		WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:"..GetName.."Khi t��i n��c, GetTargetNpc tr� quay l�i l� 0");
		return 0;
	end;
	if bJudgeByName == 0 then
		if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("��y kh�ng ph�i l� c�y b�n tr�ng");
			return 0;
		end
	end
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	
	local sSysSth = "";
	local selTab = {};
	--����ǲ�����
	if GetTask(TASK_PLANT_TREE_TYPE) == 2 then
		if nPlantTimePassed < 240 then
			Talk(1, "", "C�y B�t T� v�n ch�a tr��ng th�nh, b�y gi� kh�ng th� thu ho�ch ���c, ��i <color=yellow>" .. 240 - nPlantTimePassed .. " gi�y<color> h�y ti�p t�c thu ho�ch");
			return 0;
		else
			tinsert(selTab, "B�y gi� thu ho�ch /getTree");
			tinsert(selTab, "��i m�t l�c h�y thu ho�ch ti�p/doNothong");
			sSaySth = "C�y �� tr��ng th�nh, mu�n thu ho�ch b�y gi�? N�u nh�<color=yellow>" .. 300 - nPlantTimePassed .. "<color> gi�y sau kh�ng thu ho�ch, c�y s� t� ��ng ch�t �i";
		end
	else
		if nTreeGrow == 1 then
			if nPlantTimePassed	< TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C�n ph�i ��i th�m <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi�y m�i c� th� t��i n��c, c� �i�u ��ng c� ch�y �i qu� xa, n�u nh� <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi�y sau kh�ng t��i n��c, c�y thi�u n��c s� ch�t �i."
				);	
				return 0;
			end
		end
		if nTreeGrow < 6 and nTreeGrow ~= 1 then
			if nPlantTimePassed > TREE_PARAM[nTreeGrow - 1][3] and nPlantTimePassed	<= TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "C�n ph�i ��i th�m <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi�y m�i c� th� t��i n��c, c� �i�u ��ng c� ch�y �i qu� xa, n�u nh� <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi�y sau kh�ng t��i n��c, c�y thi�u n��c s� ch�t �i."
				);	
				return 0;
			end
		end
		if nTreeGrow == 6 then
			if nPlantTimePassed < TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. "V�n ch�a tr��ng th�nh, n�n kh�ng th� thu ho�ch b�y gi� ���c<color=yellow>" ..TREE_PARAM[nTreeGrow][3] - nPlantTimePassed .. " gi�y<color> h�y ti�p t�c thu ho�ch");
				return 0;
			end
			tinsert(selTab, "B�y gi� thu ho�ch /getTree");
			tinsert(selTab, "��i m�t l�c h�y thu ho�ch ti�p/doNothong");
			sSaySth = "C�y �� tr��ng th�nh, mu�n thu ho�ch b�y gi�? N�u nh�<color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi�y sau kh�ng thu ho�ch, c�y s� t� ��ng ch�t �i";
		else
				tinsert(selTab, "T��i n��c (c�n " .. TREE_PARAM[nTreeGrow + 1][4] .. " ph�n L� Th�y)/giveWater");
				tinsert(selTab, "Sau n�y h�y t��i./doNothing");
				sSaySth = TREE_TYPE[nTreeGrow][2] .. " �ang c�n t��i L� Th�y, c� mu�n t��i kh�ng? N�u sau <color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi�y sau kh�ng t��i n��c, c�y thi�u n��c s� ch�t �i.";
		end
	end
	
	Say(sSaySth, getn(selTab), selTab);
end

--------------------------------------
--giveWater()
--������ˮ
--------------------------------------
function giveWater()
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	local npcTreeIndex = GetTask(TASK_TREE_INDEX);
	if npcTreeIndex == 0 then
		WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:" .. GetName() .. "L�c t��i n��c, nhi�m v� bi�n l��ng TASK_TREE_INDEX l� 0");
		return 0;
	end
	if DelItem(2, 0, 351, TREE_PARAM[nTreeGrow][4]) ~= 1 then
		Talk(1, "", "Kh�ng �� L� Th�y!");
		return 0;
	end

	SetNpcLifeTime(npcTreeIndex, TREE_PARAM[nTreeGrow + 1][2] - (GetTime() - GetTask(TASK_PLANT_TREE_TIME)));
	SetTask(TASK_TREE_GROW, nTreeGrow + 1);
	SetTask(TASK_WATER_TREE_TIME, GetTime());
	Talk(1, "", "T��i n��c th�nh c�ng!");
end

--------------------------------------
--getTree()
--����
--------------------------------------
function getTree()

-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(4, 20, "Xin l�i, ") == 0 then
		return 0
	end
	
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:" .. GetName() .. "L�c nh� c�y, GetTargetNpc tr� quay l�i l� 0");
		return 0;
	end
	local nTreeType = GetTask(TASK_PLANT_TREE_TYPE);
	if nTreeType ~= 1 and nTreeType ~= 2 and nTreeType ~= 3 and nTreeType ~= 4 and nTreeType ~= 5 then
		WriteLog("[Ho�t ��ng tr�ng c�y th�ng 4  sai s�t]:" .. GetName() .. "Trong l�c thu ho�ch thu ���c lo�i c�y kh�ng ��ng");
		return 0;
	end

	SetNpcScript(npcTreeIndex, "");
	SetNpcLifeTime(npcTreeIndex, 0);
	SetTask(TASK_TREE_INDEX, 0);
	SetTask(TASK_TREE_GROW, 0);
	SetTask(TASK_WATER_TREE_TIME, 0);
	
	Give_Zhongzi2_Award();
			
-----�����齱��----------------------
	local nRand = 0;
	local nExp = 0;
	if nTreeType == 1 then			--�ݸ���
		nExp = 100000;
	elseif nTreeType == 2 then	--������
		nExp = 200000;	
	elseif nTreeType == 3 then	--������
		nRand = PlantTree_GetRandItem(WHITE_SILVER_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_SILVER_TREE_EXP_REWARD_PARAM[nRand][1];
	elseif nTreeType == 4 then	--�ƽ���
		nRand = PlantTree_GetRandItem(YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	else 												--�׽���
		nRand = PlantTree_GetRandItem(WHITE_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
	end
	
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c " .. nExp.." �i�m kinh nghi�m");
	WriteLog("[Ho�t ��ng tr�ng c�y th�ng 04]:" .. GetName() .. "Nh�n ���c " .. nExp.. " �i�m kinh nghi�m");
	

-----����Ʒ������ֻ�лƽ����Ͱ׽����Ÿ�
	if nTreeType == 4 or nTreeType == 5 then
		local nMainType = 0;
		local nSecondryType = 0;
		local nDetailType = 0;
		local nCount = 1;
		local sItemName = "";
		local nLimitFlag = 0;
		local nLimitTime = 0;
		local nItem = 0;
		local nproperty = 0;
		local nReturn = 0;
		local nIndex = 0;
		
		if nTreeType == 4 then										-- �ƽ���
			nItem = PlantTree_GetRandItem(GOLDEN_TREE_REWARD_ITEM_PARAM);
			nMainType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][6];
		elseif nTreeType == 5 then								--�׽���
			nItem = PlantTree_GetRandItem(WHITE_TREE_REWARD_ITEM_PARAM);
			nMainType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = WHITE_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = WHITE_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = WHITE_TREE_REWARD_ITEM_PARAM[nItem][6];
			if nItem >= 1 and nItem <= 5 then
				nproperty = 1;
			end
		end
		
		if nproperty == 1 then
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount, 1, -1, -1, -1, -1, -1, -1);
		else
			nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
		end
		
		if nReturn == 1 then
			if nLimitTime ~= 0 then
				SetItemExpireTime(nIndex, nLimitTime);
			end
			Msg2Player("B�n nh�n ���c " .. nCount .. "c�i" .. sItemName);
			WriteLogEx("Hoat dong thang 4",TREE_TYPE[nTreeType][2],nCount,sItemName)
		end
	end
	
-----��������У���佱��
	if nTreeType == 3 then
		nRand = random(1, 100);
		if nRand > 0 and nRand <= 40 then
			if AddItem(2, 1, 30079, 100) == 1 then
				Msg2Player("B�n nh�n ���c " .. "100" .. "c�i" .. "R��ng Hi�u K�");
				WriteLogEx("Hoat dong thang 4","C�y B�ch Ng�n",100,"R��ng Hi�u K�")
			end
		elseif nRand > 40 and nRand <= 50 then
			if AddItem(2, 1, 30079, 200) == 1 then
				Msg2Player("B�n nh�n ���c " .. "200" .. "c�i" .. "R��ng Hi�u K�");
				WriteLogEx("Hoat dong thang 4","C�y B�ch Ng�n",200,"R��ng Hi�u K�")
			end			
		end
	end
	
end