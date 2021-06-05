Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse()
	Create_Map_Trigger();
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ng��i ch�a gia nh�p m�n ph�i kh�ng ���c s� d�ng h�t gi�ng");
		return 0;
	end;
	if checktime() == 0 then
		Talk(1,"","L�c n�y linh kh� ch�a t�p trung, ch� th�m m�t ch�t t�t h�n");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","Linh kh� n�i ��y kh�ng m�nh, e r�ng c�y s� kh�ng ph�t tri�n");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_BIGTREE_DATE) < nDate then
		SetTask(TASK_PLAN_BIGTREE_COUNT,0);	--ÿ����С�������
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
	end;
	if GetTask(TASK_PLAN_BIGTREE_COUNT) >= PLANT_BIG_TREE_LIMIT then
		Talk(1,"","H�m nay b�n �� tr�ng <color=yellow>"..PLANT_BIG_TREE_LIMIT.."c�y<color> Th�i H� B�t Nh�, ng�y mai h�y tr�ng ti�p!");
		return 0;
	end;
	local selTab = {
				"H�y mau tr�ng c�y/plant",
				"Sau n�y tr�ng s� t�t h�n!/nothing"
				}
	Say("N�i ��y s�n th�y th�ch h�p, linh kh� xung thi�n, ch�nh l� n�i tr�ng c�y ti�n, b�n x�c nh�n mu�n tr�ng c�y?",getn(selTab),selTab)
end;

function plant()
	if checktime() == 0 then
		Talk(1,"","L�c n�y linh kh� ch�a t�p trung, ch� th�m m�t ch�t t�t h�n");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","Linh kh� n�i ��y kh�ng m�nh, e r�ng c�y s� kh�ng ph�t tri�n");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME) < TREELIFETIME and GetTask(TASK_PLANTTIME) ~= 0 then
		Talk(1,"","B�n �� tr�ng th�nh c�ng 1 c�y");
		return 0;
	end;
	if DelItem(2,0,398,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(TREETYPE[1][1],GetName().." tr�ng "..TREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c tr�ng c�y, tr� quay l�i h�m s� CreateNpc l� 0. Tham s� nh�p CreateNpc l�:"..TREETYPE[1][1]..","..GetName().." tr�ng "..TREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX,npcTreeIndex);
		SetTask(TASK_TREEGROW,1);
		SetTask(TASK_PLANTTIME,GetTime());
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua");
		SetDeathScript("\\script\\online\\plant\\playerdeath.lua");
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
		SetTask(TASK_PLAN_BIGTREE_COUNT,GetTask(TASK_PLAN_BIGTREE_COUNT)+1);
		Say("C�y ch�a tr��ng th�nh r�i kh�i ch�ng s� ch�t. H�m nay b�n �� tr�ng <color=yellow>"..GetTask(TASK_PLAN_BIGTREE_COUNT).."<color> l�n c�y Th�i H� B�t Nh�, c�n tr�ng ���c <color=yellow>"..(PLANT_BIG_TREE_LIMIT-GetTask(TASK_PLAN_BIGTREE_COUNT)).."<color> c�y Th�i H� B�t Nh�.",0);
		StartTimeGuage("T��i c�y",TREETYPE[1][3],0,1)
		local nMapID = GetWorldPos();
		if nMapID == 301 then
			WriteLogEx("Trong cay Bat Nha", "Tay Thanh Do");
		elseif nMapID == 504 then
			WriteLogEx("Trong cay Bat Nha", "Bac Tuyen Chau");
		end
		--����vip��
		_vc_PlantBigBanRuo();
	end;
end;
