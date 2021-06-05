Include("\\script\\online\\plant\\tree_head.lua");
--Խ��09��7�»����ͷ�ļ�
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--Խ��09��12�»ͷ�ļ�
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--���л������������ͳһͷ�ļ�
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\plant\\guoshi13_24.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Khi t��i n��c, GetTriggeringUnit th� 1, tr� quay l�i l� 0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(SMALLTREETYPE) do	--������������Ŀ��NPC�ǲ������������о�����ûʲô����
		if npcModel == SMALLTREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:NPC:"..npcName.."L�i files g�c");
		return 0;
	end;
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Khi t��i n��c, GetTargetNpc tr� quay l�i l� 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME_SMALL) > TREELIFETIME or GetTask(TASK_PLANTTIME_SMALL) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX_SMALL) then
			Msg2Player("��y kh�ng ph�i l� c�y b�n tr�ng");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	if nTreeGrow < 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." sinh tr��ng r�t t�t, t�m th�i kh�ng c�n t��i n��c nh�ng kh�ng n�n �i qu� xa, n�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh�ng t��i, c�y s� thi�u n��c m� ch�t. Th�i gian t��i n��c l�n sau c�n <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." v�a m�i ph�t tri�n, kh�ng n�n nh� c�y, sau <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color> h�y nh�.");
			return 0;
		end;
		tinsert(selTab,"H�y nh� c�y �i! Tr�ng ti�p n� c�ng kh�ng ph�t tri�n./getfruit");
		tinsert(selTab,"Sau n�y h�y nh�!/nothing");
		sSaySth = "H�t Th�i H� nh� ch� c� th� ph�t tri�n th�nh c�y Th�i H� nh�! B�y gi� nh� c�y c� th� nh�n ���c qu� b�t ng�! C� mu�n nh� c�y? N�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh�ng nh� th� c�y s� ch�t!";
	else
		tinsert(selTab,"T��i n��c (c�n "..SMALLTREETYPE[nTreeGrow+1][4].." ph�n L� Th�y)/givewater");
		tinsert(selTab,"Sau n�y h�y t��i./nothing");
		sSaySth = SMALLTREETYPE[nTreeGrow][2].." �ang c�n t��i L� Th�y, c� mu�n t��i kh�ng? N�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> kh�ng t��i th� c�y thi�u n��c m� ch�t.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local npcTreeIndex = GetTask(TASK_TREEINDEX_SMALL);
	if npcTreeIndex == 0 then
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c t��i n��c, TASK_TREEINDEX bi�n l��ng nhi�m v� l� 0");
		return 0;
	end;	
	if DelItem(2,0,351,SMALLTREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh�ng �� L� Th�y!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(SMALLTREETYPE[nTreeGrow+1][1],GetName().." tr�ng "..SMALLTREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c t��i c�y, tr� quay l�i h�m s� CreateNpc l� 0. Tham s� nh�p CreateNpc:"..SMALLTREETYPE[nTreeGrow+1][1]..","..GetName().." tr�ng "..SMALLTREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua")
	SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
	SetTask(TASK_TREEGROW_SMALL,nTreeGrow+1);
	SetTask(TASK_PLANTTIME_SMALL,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	if nTreeGrow ==3 then
		StartTimeGuage("Thu ho�ch",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("T��i c�y",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	if GetTask(TASK_TREEGROW_SMALL) == 3 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c nh� c�y, GetTargetNpc tr� quay l�i l� 0");
			 return 0;
		end;
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX_SMALL,0);
		SetTask(TASK_TREEGROW_SMALL,0);
		SetTask(TASK_PLANTTIME_SMALL,0);
		ModifyExp(100000);	--ʮ����
		Msg2Player("B�n nh�n ���c 100000 �i�m kinh nghi�m");
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 20 then
			ModifyExp(100000);	--ʮ����
			Msg2Player("B�n nh�n ���c 100000 �i�m kinh nghi�m");
			WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 100000 �i�m kinh nghi�m");
		end;
		nRandomNumSuper = random(1,100);
		if nRandomNumSuper <=80 then
			nRandomNum = random(1,100);
			if nRandomNum <= 20 then
				if AddItem(2,2,7,1,4) == 1 then
					Msg2Player("B�n nh�n ���c 1 m�nh Thi�n Th�ch");
					WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 1 m�nh Thi�n Th�ch");
				end;		
			end;
			
			
			nRandomNum = random(1,100);
			if nRandomNum <= 5 then
				local nWhat = random(469,476);
				if AddItem(2,1,nWhat,1,4) == 1 then
					Msg2Player("B�n nh�n ���c 1 Th�i H� B�t Qu�i B�i");
					WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 1 Th�i H� B�t Qu�i B�i");
				end;		
			end;

			nRandomNum = random(1,100);
			if nRandomNum <=5  then
				if AddItem(2,1,473,2) == 1 then
					Msg2Player("B�n nh�n ���c 1 Th�i H� B�t Qu�i B�i-Li");
					WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 1 Th�i H� B�t Qu�i B�i-Li");
				end;		
			end;
		else
			local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B�t Nh� Ch�ng Th�");
			if nRetCode == 1 then
				SetItemExpireTime(nIndex, 15 * 24 * 3600);
				WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha nho", 1, "Bat Nha Chung Thu");
			end
		end
		--Give_YuanXiao_Award(1);
		
		--��09��6��7�»�¾��ܱ�����
		--give_viet20090607_miben();
		--��09��8�»ˮ��������
		--give_viet200908_shuiguodai();
		--��09��9���������������
		--give_viet200909_baimianbao();
		--give_viet200911_hoacuc()
          -- give_viet200912_shengdantangguo()
         --  Give_XiaoBanRuoShu_Award();
         -- Give_Fruit_Award();
         --  VietSmallFruit_Award();
         --  ThuHoachBatNhaNho();
           --IP Bonus
		--Give_IpBonus_SmallTree()
		
--           if GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 then
--           	local nGroup = fruitcheckserver()
--			gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Trong Bat Nha Nho", "nh�n khi tr�ng 8 c�y")
--           end
           
           --Bang h�i tinh anh 6 , ngu�n ra hoa h�ng
           if (GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 or GetTask(TASK_PLAN_SMALLTREE_COUNT) == 16) and tonumber(date("%Y%m%d")) >= 20110930 and tonumber(date("%Y%m%d")) <= 20111023 then
           	gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "tr�ng B�t Nh� Nh�")
           end
	     --nhi�m v� l�m gi�u
	     if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 7) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 7, 1, 0)
		     		TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Tr�ng th�nh c�ng 01 B�t Nh� Nh�.")
		     end
		end
		-----------------------Chu�i nhi�m v� ��ng H�nh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 18 then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
  		-- Nhi�m v� Chuy�n Sinh 3        	
          	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) < 128 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) == 128 then
				TaskTip("Ho�n th�nh y�u c�u c�a ��o Ch� ��o Hoa ��o 128 l�n tr�ng th�nh c�ng B�t Nh� Nh�")
			end
		end
		
		-- Nhi�m v� Chuy�n Sinh 4
		if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
				TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh 320 l�n tr�ng th�nh c�ng B�t Nh� Nh�")
			end
		end
		
		-- Nhi�m v� chuy�n sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
			TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh 320 l�n tr�ng th�nh c�ng C�y B�t Nh� Nh�")
		end
	end
		
		if GetTask(TASK_PLAN_SMALLTREE_COUNT) > 3 then
	           local nLastLingshuDate = GetTask(85)
	           local nMultiCount = GetTask(86)
			local nDate = tonumber(date("%Y%m%d"))
			local nSMPoint = 5
			if nDate >= 20100821 and nDate <= 20100822 then
				nSMPoint = 10
			end
	           if nLastLingshuDate == nDate then
	           	local nBonusExp = nMultiCount * nSMPoint
	           	SetTask(336, GetTask(336) + nBonusExp)
	           	Msg2Player("Nh�n ���c "..nBonusExp.." �i�m c�ng hi�n S� M�n.")
	           else
				SetTask(86, 1)
				SetTask(336, GetTask(336) + nSMPoint)
	           	Msg2Player("Nh�n ���c "..nSMPoint.." �i�m c�ng hi�n S� M�n.")
			end
		end
	end;
end;

function Give_Fruit_Award()
--		gf_AddItemEx2({2, 1, 30165, 1}, "Ch�m Ch�m","Hoat dong thang 4 nam 2010","Ph�n th��ng tr�ng c�y b�t nh� nh�");
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= 9 then
		local nGroup = fruitcheckserverNov()
		if nGroup == 0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2(tFruitAwardNov2010[nGroup][6], tFruitAwardNov2010[nGroup][7], "Trong Bat Nha Nho", "nh�n khi tr�ng 1 c�y")
	end
end

function nothing()

end;

--��09��6��7�³¾��ܱ�����
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		gf_SetLogCaption("Truy t�m tr��ng sinh ph�");
		gf_AddItemEx({2, 1, 30088, 100}, "B� Ph� C� N�t");
		WriteLogEx("Hoat dong thang 6","B�t Nh� Nh�",100,"B� Ph� C� N�t");
		gf_SetLogCaption("");
	end
end

--��09��8�»ˮ��������
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "T�i Tr�i C�y");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha nho");
		end
		gf_SetLogCaption("");
	end
end

--��09��9���������������
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "B�t M�");
		WriteLogEx("Hoat dong trung thu","B�t Nh� Nh�",100,"B�t M�");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
		gf_AddItemEx({2, 1, 30118, 20}, "Hoa C�c");
		WriteLogEx("Hoat dong thang 11","B�t Nh� Nh�",20,"Hoa C�c");		
	end
end

--��09��12��ʥ���ǹ�����
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 40}, "C�y K�o Gi�ng Sinh", szFullLog, 0, 1, 10, 1,"B�t Nh� nh�");
	end
end

function  Give_IpBonus_SmallTree()
	if GetExtPoint(4) == 1 then
		local nTimes = GetTask(429)
		if  nTimes >= 1 and nTimes <= 3 then
			ModifyExp(100000 )
			Msg2Player("B�n nh�n ���c 100000 �i�m kinh nghi�m ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh�n 100000 �i�m kinh nghi�m")
		elseif  nTimes >= 4 and nTimes <= 8 then
			ModifyExp(150000 )
			Msg2Player("B�n nh�n ���c 150000 �i�m kinh nghi�m ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh�n 150000 �i�m kinh nghi�m")
		elseif  nTimes >= 9 and nTimes <= 16 then
			ModifyExp(250000 )
			Msg2Player("B�n nh�n ���c 250000 �i�m kinh nghi�m ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nh�n 250000 �i�m kinh nghi�m")
		else
			return
		end
	end
end