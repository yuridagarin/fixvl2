Include("\\script\\online\\plant\\tree_head.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ng��i ch�a gia nh�p m�n ph�i kh�ng ���c s� d�ng h�t gi�ng");
		return 0;
	end;
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end	
	if checktime() == 0 then
		Talk(1,"","L�c n�y linh kh� ch�a t�p trung, ch� th�m m�t ch�t t�t h�n");
		return 0;
	end;
	if checkplace_maincity() == 0 then
		Talk(1,"","Linh kh� n�i ��y kh�ng m�nh, e r�ng c�y s� kh�ng ph�t tri�n");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_SMALLTREE_DATE) < nDate then
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetTask(TASK_PLAN_SMALLTREE_COUNT,0);	--ÿ����С�������
	end;
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= PLANT_SMALL_TREE_LIMIT then
		Talk(1,"","H�m nay b�n �� tr�ng <color=yellow>"..PLANT_SMALL_TREE_LIMIT.."c�y<color> Th�i H� B�t Nh�, h�t gi�ng c�n l�i �� ng�y mai tr�ng ti�p.");
		return 0;
	end;
	local selTab = {
				"H�y mau tr�ng c�y/plant",
				"Sau n�y tr�ng s� t�t h�n!/nothing",
				}
	Say("N�i ��y s�n th�y th�ch h�p, linh kh� xung thi�n, ch�nh l� n�i tr�ng c�y ti�n, b�n x�c nh�n mu�n tr�ng c�y?",getn(selTab),selTab)
end;

function plant()
	if checkplace_maincity() == 0 then
		Talk(1,"","Linh kh� n�i ��y kh�ng m�nh, e r�ng c�y s� kh�ng ph�t tri�n");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME_SMALL) < TREELIFETIME and GetTask(TASK_PLANTTIME_SMALL) ~= 0 then
		Talk(1,"","B�n �� tr�ng th�nh c�ng 1 c�y");
		return 0;
	end;
	if GetItemCount(2,0,351) <= 0 then
		Talk(1,"","B�n kh�ng c� L� Th�y, kh�ng th� tr�ng c�y Th�i H� B�t Nh� nh�.");
		return 0;
	end;
	DelItem(2,0,351,1);	--���µ�ʱ��Ҳ��Ҫһ��¶ˮ��������ִ�����һ�����ִ���ʱ���µ�ʱ����Ҫ¶ˮ��Ҳ��һ��bug�ɣ������ã���¶ˮ�Ϳ����ִ����Ѿ��������ģ�����Ҳ���ø��ˡ�
	if DelItem(2,0,504,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(SMALLTREETYPE[1][1],GetName().." tr�ng "..SMALLTREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c tr�ng c�y, tr� quay l�i h�m s� CreateNpc l� 0. Tham s� nh�p CreateNpc l�:"..SMALLTREETYPE[1][1]..","..GetName().." tr�ng "..SMALLTREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
		SetTask(TASK_TREEGROW_SMALL,1);
		SetTask(TASK_PLANTTIME_SMALL,GetTime());
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua");
		SetTask(TASK_PLAN_SMALLTREE_COUNT,GetTask(TASK_PLAN_SMALLTREE_COUNT)+1);
----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u 3 s� ��u b�n ph�i
		local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)
		if nCSD_BNN < 181 and GetTask(TSK_CSD) == 1 then
			SetTask(TSK_CSD_COUNT_C, GetTask(TSK_CSD_COUNT_C) + 1)
		end
-----------------------Chu�i nhi�m v� Chuy�n Sinh 6
		local nCS6_BNN =  floor(GetTask(TSK_CS6_COUNTA)/10000)
		local nCS6_BNN_Num = mod(GetTask(TSK_CS6_COUNTA),10000)
		if mod(nCS6_BNN,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_BNN = (nCS6_BNN + 1) * 10000 + nCS6_BNN_Num
			SetTask(TSK_CS6_COUNTA, nCS6_BNN)
		end
------------------------
		KichHoatBatNhaNho()	-- ph�n thu�ng khi k�ch ho�t
		local nExp = 2100000
		--- �i�m V�n May
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--		else
--			Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--		end
--	-----------------------------
		Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(TASK_PLAN_SMALLTREE_COUNT).."<color> b�n tr�ng c�y Th�i H� B�t Nh� nh�, h�m nay b�n v�n c� th� tr�ng <color=yellow>"..(PLANT_SMALL_TREE_LIMIT-GetTask(TASK_PLAN_SMALLTREE_COUNT)).."<color> c�y Th�i H� B�t Nh� nh�.",0);		
		StartTimeGuage("T��i c�y",SMALLTREETYPE[1][3],0,1)

		if GetTask(TASK_PLAN_SMALLTREE_COUNT) == 16 and nDate <= 130120 then	
			gf_AddItemEx2({2,1,30030, 20}, "Ti�u Nh� Y1", "NIEN THU NHU Y", "ho�n th�nh 16 tr�ng c�y")
		end
		--����vip��
		_vc_PlantSmallBanRuo();
		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_PlantSmallBanRuo()");
	end;
end;
