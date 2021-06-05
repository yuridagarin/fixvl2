--
-- ������Ե�����2
-- xmas_seed.lua
-- 2007Խ��ʥ��� ���ӽű�
-- 2007-12-12
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function OnUse(nIdx)
	local nG, nD, nP = GetItemInfoByIndex(nIdx);
	if xmas_v07_is_open() ~= 1 then
		return 0;
	end
	if nG ~= 2 or nD ~= 0 then
		WriteLog("[xmas] Error ItemId: "..nG..","..nD..","..nP);
		return 0;
	end
		
	local nPlantType = 0;
	if nP == 573 then		-- J��ʥ����֦
		nPlantType = XMAS_TYPE_JH;
	elseif nP == 574 then	-- ����ʥ����֦
		nPlantType = XMAS_TYPE_ML;
	else
		WriteLog("[xmas] Error Item P: "..nG..","..nD..","..nP);
		return 0;
	end

	setup_global_value(nPlantType);
	XMAS_TREE_TYPE = nPlantType;
	
	if GetLevel() < 10 then
		Talk(1, "", "��t ��n c�p 10 m�i c� th� d�ng v�t ph�m n�y!");
		return 0;
	end
	if checkplace_maincity() == 0 then
		Talk(1, "", "Ch� c� th� d�ng v�t ph�m n�y � Tuy�n Ch�u, Th�nh ��, Bi�n Kinh.");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASKID_XMAS_PLANT_DATE) < nDate then
		SetTask(TASKID_XMAS_PLANT_COUNT,0);	--ÿ����С�������
	end;
	if GetTask(TASKID_XMAS_PLANT_COUNT) >= XMAS_PLANT_TREE_LIMIT then
		Talk(1,"","H�m nay b�n �� tr�ng <color=yellow>"..XMAS_PLANT_TREE_LIMIT.." c�y <color>"..XMAS_TREE_NAME..", ng�y mai m�i c� th� s� d�ng ti�p.");
		return 0;
	end;
	local selTab = {
				"H�y mau tr�ng c�y/#plant("..nIdx..")",
				"Sau n�y tr�ng s� t�t h�n!/nothing",
				}
	Say("N�i ��y linh kh� h�i t�, th�ch h�p �� tr�ng c�y"..XMAS_TREE_NAME.."B�n mu�n tr�ng ch�?",getn(selTab),selTab)
end;

function plant(nIdx)
	local nDate = tonumber(date("%y%m%d")); --����TASKID_XMAS_PLANT_DATE����
	if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) < XMAS_TREELIFETIME and GetTask(TASKID_XMAS_PLANTTIME) ~= 0 then
		Talk(1,"","B�n �� tr�ng th�nh c�ng 1 c�y");
		return 0;
	end;

	if DelItemByIndex(nIdx, 1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(txmas_tree_mode[1], GetName().."-"..XMAS_TREE_NAME,MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[xmas seed]:"..GetName().."L�c tr�ng c�y, tr� quay l�i h�m s� CreateNpc l� 0. Tham s� nh�p CreateNpc l�:"..txmas_tree_mode[1]..","..GetName().." tr�ng "..XMAS_TREE_NAME..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,XMAS_TREELIFETIME)
		
		SetTask(TASKID_XMAS_TREEINDEX,npcTreeIndex);
		SetTask(TASKID_XMAS_TREE_GROW, 1);
		SetTask(TASKID_XMAS_TREE_SCORE, 0);
		SetTask(TASKID_XMAS_TREE_TYPE, XMAS_TREE_TYPE);
		
		SetTask(TASKID_XMAS_PLANTTIME,GetTime());
		SetTask(TASKID_XMAS_PLANT_DATE,nDate);
		SetNpcScript(npcTreeIndex,"\\script\\online\\xmas_07_viet\\xmas_tree.lua");
		SetTask(TASKID_XMAS_PLANT_COUNT,GetTask(TASKID_XMAS_PLANT_COUNT)+1);
		Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(TASKID_XMAS_PLANT_COUNT).."<color> l�n"..XMAS_TREE_NAME..", h�m nay b�n c�n c� th� tr�ng <color=yellow>"..(XMAS_PLANT_TREE_LIMIT-GetTask(TASKID_XMAS_PLANT_COUNT)).."<color> c�y"..XMAS_TREE_NAME..".",0);
	end;
end;

function checkplace_maincity()	--��С�����Ƿ���ָ���ص㣺��������
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		return 1;
	else
		return 0;
	end;
end;
