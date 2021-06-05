Include("\\script\\online\\plant\\tree_head.lua");
--Խ��09��7�»����ͷ�ļ�
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--Խ��09��12�»ͷ�ļ�
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--���л������������ͳһͷ�ļ�
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\voz\\xacthuc\\xacthuc.lua");

tRewardRoute =
{
	[1] 	=  {"Thi�u L�m t�c gia", 1},
	[2] 	=  {"Thi�u L�m thi�n t�ng", 3},
	[3] 	=  {"Thi�u L�m v� t�ng", 5},
	[4] 	=  {"V� �ang ��o gia", 17},
	[5] 	=  {"V� �ang t�c gia", 19},
	[6] 	=  {"Nga My ph�t gia", 9},
	[7] 	=  {"Nga My t�c gia", 11},
	[8] 	=  {"C�i Bang t�nh y", 13},
	[9] 	=  {"C�i Bang � y", 15},
	[10] 	=  {"���ng M�n", 7},
	[11] 	=  {"D��ng Gia th��ng", 21},
	[12] 	=  {"D��ng Gia cung", 23},
	[13] 	= {"Ng� ��c hi�p ��c", 25},
	[14] 	= {"Ng� ��c t� ��c", 27},
	[15] 	= {"C�n l�n thi�n s�", 180},
	[16] 	= {"Thu� y�n v� ti�n", 188},
	[17] 	= {"Thu� y�n linh n�", 190},
}

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


--******************************************************
--	CAY BAT NHA TO
--******************************************************
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
	for i=1,getn(TREETYPE) do
		if npcModel == TREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:NPC:"..npcName.."L�i files g�c");
		return 0;
	end;
	Create_Map_Trigger();
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Khi t��i n��c, GetTargetNpc tr� quay l�i l� 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME or GetTask(TASK_PLANTTIME) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX) then
			Msg2Player("��y kh�ng ph�i l� c�y b�n tr�ng");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	if nTreeGrow < 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].." sinh tr��ng r�t t�t, t�m th�i kh�ng c�n t��i n��c nh�ng kh�ng n�n �i qu� xa, n�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh�ng t��i, c�y s� thi�u n��c m� ch�t. Th�i gian t��i n��c l�n sau c�n <color=yellow>"..Get_Time_String(TREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].."C�y ph�t tri�n, kh�ng n�n h�i s�m, sau <color=yellow>"..(TREETYPE[nTreeGrow][3]-nTimePassed).." gi�y<color> h�y h�i.");
			return 0;
		end;
		tinsert(selTab,"H�y mau h�i �� tr�nh b� c��p/getfruit");
		tinsert(selTab,"Sau n�y h�y h�i!/nothing");
		sSaySth = "Qu� Th�i H� B�t Nh� �� ch�n, k�t ra 1 tr�i Ti�n Qu� v�a to v�a t��i, b�n mu�n h�i ch�? N�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh�ng h�i th� qu� s� ch�t!";
	else
		tinsert(selTab,"T��i n��c (c�n "..TREETYPE[nTreeGrow+1][4].." ph�n L� Th�y)/givewater");
		tinsert(selTab,"Sau n�y h�y t��i./nothing");
		sSaySth = TREETYPE[nTreeGrow][2].." �ang c�n t��i L� Th�y, c� mu�n t��i kh�ng? N�u sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh�ng t��i qu� s� thi�u n��c m� ch�t.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local npcTreeIndex = GetTask(TASK_TREEINDEX);
	if npcTreeIndex == 0 then
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c t��i n��c, TASK_TREEINDEX bi�n l��ng nhi�m v� l� 0");
		return 0;
	end;	
	if DelItem(2,0,351,TREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh�ng �� L� Th�y!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(TREETYPE[nTreeGrow+1][1],GetName().." tr�ng "..TREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c t��i c�y, tr� quay l�i h�m s� CreateNpc l� 0. Tham s� nh�p CreateNpc:"..TREETYPE[nTreeGrow+1][1]..","..GetName().." tr�ng "..TREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua")
	SetTask(TASK_TREEINDEX,npcTreeIndex);
	SetTask(TASK_TREEGROW,nTreeGrow+1);
	SetTask(TASK_PLANTTIME,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	local nTreeGrow = GetTask(TASK_TREEGROW);
	if nTreeGrow ==6 then
		StartTimeGuage("Thu ho�ch",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("T��i c�y",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	local tFruitAwardJune2010 = {
		[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Nh�n"},
		[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Ch�m Ch�m"},
		[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
		[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "D�a"},
		[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "M�ng C�t"},
		[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "B��i"},
		[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "D�u"},
		[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Chu�i"},
		[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Xo�i"},
		[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "��o"},
		[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "M�n"},
		[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "V�i"},
		[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "T�o"},
		[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "B�"},
		[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, "�u ��"},
		[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "M�ng C�u"},
		[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Kh�m"},
		[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "L�"},
		[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "B�n bon"},
		[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "Kh�"},
	}
	if GetTask(TASK_TREEGROW) == 6 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[L�i ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."L�c h�i qu�, GetTargetNpc tr� quay l�i l� 0");
			 return 0;
		end;
		
		local nGroup = fruitcheckserver()
		if nGroup ==  0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		--gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Bat Nha Lon", "nh�n")

		
		--VBonus
		local nDate =  tonumber(date("%y%m%d%H"))
		Give_Fruit_Award(npcTreeIndex);
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX,0);
		SetTask(TASK_TREEGROW,0);
		SetTask(TASK_PLANTTIME,0);
		SetDeathScript("");
		WriteLogEx("Trong cay Bat Nha", "Hai qua");
   		--nhi�m v� l�m gi�u
   		if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 8) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 8, 1, 0)
		     		TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Tr�ng th�nh c�ng 01 B�t Nh� L�n.")
		     end
		end
		-----------------------Chu�i nhi�m v� ��ng H�nh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 19 then
				DongHanh_SetStatus()
			end
		end
		----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u s� th� 4 v� 5 ��u b�n ph�i
		local nCSD_BNL = floor(GetTask(TSK_CSD_COUNT_C) / 1000)
		local nNumBK = mod(GetTask(TSK_CSD_COUNT_C),1000)
		if mod(nCSD_BNL, 100) < 99 and GetTask(TSK_CSD) == 1 then
			nCSD_BNL = (nCSD_BNL + 1) * 1000 + nNumBK
			SetTask(TSK_CSD_COUNT_C, nCSD_BNL)
		end
		---------------------------------
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 100 then
			ModifyExp(200000);	--��ʮ����
			Msg2Player("B�n nh�n ���c 20 v�n kinh nghi�m");
			WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 20 v�n kinh nghi�m");
		end;
		
		local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B�t Nh� Ch�ng Th�");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 15 * 24 * 3600);
			WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha Lon", 1, "Bat Nha Chung Thu");
		end
--		nRandomNum = random(1,100);
--		if nRandomNum <= 10 then
--			if AddItem(1,0,32,2) == 1 then
--				Msg2Player("B�n nh�n ���c 2 C�u Chuy�n Ho�n H�n ��n");
--				WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 2 C�u Chuy�n Ho�n H�n ��n");
--			end;		
--		end;
		-- if CheckXacThuc() == 0 then
					-- Msg2Player("T�i kho�n ch�a x�c th�c ch� nh�n ���c kinh nghi�m. Xin th� ch� h�y d�ng tay.");
		-- else 
					
					nRandomNum = random(1,100);
					if nRandomNum <= 20 then
						if AddItem(2,2,8,3) == 1 then
							Msg2Player("B�n nh�n ���c 3 Thi�n Th�ch");
							WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 3 Thi�n Th�ch");
						end;		
					end;
					
					nRandomNum = random(1,100);
					if nRandomNum <= 20 then
						local nWhat = random(469,476);
						if AddItem(2,1,nWhat,1) == 1 then
							Msg2Player("B�n nh�n ���c 1 Th�i H� B�t Qu�i B�i");
							WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Nh�n ���c 1 Th�i H� B�t Qu�i B�i");
						end;		
					end;
					



					
					nRandomNum = random(1,100);
					if nRandomNum <= 3  then
						 local nRandBook1 = random(1,17);
						 local nRandBook2 = random(0,1);
						AddItem(0, 107, tRewardRoute[nRandBook1][2] + nRandBook2 , 1);		
						Msg2Player("B�n �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[nRandBook1][1]);
						WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().." �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[nRandBook1][1]);
					elseif  nRandomNum <= 7 then
						if AddItem(0,107,66,1) == 1 then
							Msg2Player("B�n nh�n ���c 1 quy�n ".."Chi�m Y M�t t�ch");
							WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Thu ���c 1 ".."Chi�m Y M�t t�ch");
						end;		
					elseif nRandomNum <= 10 then
						if AddItem(0,107,65,1) == 1 then
							Msg2Player("B�n nh�n ���c 1 quy�n ".."T� H� M�t t�ch");
							WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Thu ���c 1 ".."T� H� M�t t�ch");
						end;		
					elseif nRandomNum <= 15 then
						if AddItem(0,107,64,1) == 1 then
							Msg2Player("B�n nh�n ���c 1 quy�n ".."Thi�n H� M�t t�ch");
							WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().."Thu ���c 1 ".."Thi�n H� M�t t�ch");
						end;		
					end;
		-- end
		
		--bat dau mat tich phai
		-- nRandomNum = random(1,100);
		-- mRoute = GetPlayerRoute();
		-- if nRandomNum <= 5 and tRewardRoute[mRoute] then
			-- AddItem(0, 107, tRewardRoute[mRoute][2] + 166, 1, 1);		
			-- Msg2Player("B�n �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[mRoute][1]);
			-- WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().." �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[mRoute][1]);
		-- end;
		

		-- nRandomNum = random(1,100);
		-- if nRandomNum <= 5  then
			-- local nRandBook = random(1,17);
			-- gf_AddItemEx(t_TUOGUAN_HIG_VOZ[nRandBook][2], t_TUOGUAN_HIG_VOZ[nRandBook][1]);		
			-- Msg2Player("B�n �� nh�n ���c 1 M�t t�ch m�n ph�i "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
			-- WriteLog("[Ho�t ��ng tr�ng c�y Th�i H�]:"..GetName().." �� nh�n ���c 1 M�t t�ch m�n ph�i "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
		-- end;

		--ket thuc mat tich phai
		
		-- Nhi�m v� Chuy�n Sinh 3
		 if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) < 64 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) == 64 then
				TaskTip("Ho�n th�nh y�u c�u c�a ��o Ch� ��o Hoa ��o 64 l�n tr�ng th�nh c�ng B�t Nh� L�n")
			end
		end
		
		-- Nhi�m v� Chuy�n Sinh 4
		 if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) < 16 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) == 16 then
				TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh 160 l�n tr�ng th�nh c�ng B�t Nh� L�n")
			end
		end
		
		gf_EventGiveCustomAward(2,80000,0,"Bat Nha Lon","nh�n")

		--Give_YuanXiao_Award(2);
		
		--��09��6��7�»�¾��ܱ�����
		give_viet20090607_miben();
		--��09��8�»ˮ��������
		give_viet200908_shuiguodai();
		--09��8�µ������ð���֤��
		give_viet200908_banruozhengshu();
		--��09��9���������������
		give_viet200909_baimianbao();
		give_viet200911_hoacuc();
          give_viet200912_shengdantangguo()
                --���и�������ͳһ����
          Give_DaBanRuoShu_Award();          
          ThuHoachBatNhaLon()
	end;
end;

function nothing()

end;

function Give_Fruit_Award(npcTreeIndex)

	local szNpcName = GetNpcName(npcTreeIndex)	
	local nMapID, nWx, nWy = GetNpcWorldPos(npcTreeIndex)
	local nAddX,nAddY = 0,0	
	local nTargetNpc = 0		
	for i = 1, 8 do
		nAddX = random(-5, 5)
		nAddY = random(-5, 5)
		nTargetNpc = CreateNpc("T�i cao th�", "T�i tr�i c�y", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 5*60)
		SetNpcScript(nTargetNpc, "\\script\\online\\plant\\fruit_baoguo.lua")
	end
end

--��09��6��7�³¾��ܱ�����
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		gf_SetLogCaption("Truy t�m tr��ng sinh ph�");
		gf_AddItemEx({2, 1, 30088, 100}, "B� Ph� C� N�t");
		WriteLogEx("Hoat dong thang 6","B�t Nh�",100,"B� Ph� C� N�t");
		gf_SetLogCaption("");
	end
end

--��09��8�»ˮ��������
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "T�i Tr�i C�y");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha");
		end
		gf_SetLogCaption("");
	end
end
--09��8�µ������ð���֤��
function give_viet200908_banruozhengshu()
	local nRand = random(1, 100);
	local nCount = 0;
	if nRand <= 10 then
		nCount = 2;
	elseif nRand <= 95 then
		nCount = 1;
	else
		nCount = 3;
	end
	for i = 1, nCount do
		local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B�t Nh� Ch�ng Th�");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 15 * 24 * 3600);
		end
	end
	WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha", nCount, "Bat Nha Chung Thu");
end

--��09��9���������������
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "B�t M�");
		WriteLogEx("Hoat dong trung thu","B�t Nh� L�n",100,"B�t M�");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
		gf_AddItemEx({2, 1, 30118, 40}, "Hoa C�c");
		WriteLogEx("Hoat dong thang 11","B�t Nh� L�n",40,"Hoa C�c");		
	end
end

--��09��12��ʥ���ǹ�����
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 80}, "C�y K�o Gi�ng Sinh", szFullLog, 0, 1, 10, 1,"B�t Nh� l�n");
	end
end

function fruitcheckserver()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(tFruitAwardServerGroup) do
		for j = 1, getn(tFruitAwardServerGroup[i]) do
			if nServerID == tFruitAwardServerGroup[i][j] then
				return i
			end
		end	
	end
	return 0
end