Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_newserver.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");

szNPCName = "<color=green>Anh/Ch� Ch� Ph�ng M�y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
DEFINE_30_DAYS = 2592000
--EXT_POINT_CLTV = 5	--khai b�o ExtPoint
--TSK_CTVL_START = 2664  --khai b�o Task th�i h�n CTVL
--TSK_CTVL_ALL = 2665		--khai b�o task: 0987654321: 1:k�ch ho�t CTVL;	2: �� x�y d�ng bang trong tu�n	3: �� nh�n th��ng BHCT trong tu�n		4: nh�n th��ng t� ��i trong ng�y		65: check lev nh�n th��ng PS0 	7: nh�n trang b� HN	8: kich ho�t Bang h�i Ch� T�n		9: nh�n th��ng PS1 88	0: nh�n th��ng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: b� ��m b��c nhi�m v�	4: tr�ng th�i ho�n th�nh nhi�m v�		65: l�u ID nhi�m v� m�i ng�y �ang th�c hi�n	7: s� l�n ho�n th�nh nhi�m v� trong ng�y		8: tr�ng th�i nh�n th� th�ch		9: nh�n th��ng m�i ng�y c�a old server

function CTVL_first()
	do return end
	local nCTVL_End = GetTime()
	if GetTask(TSK_CTVL_START) > 0 then
		if nCTVL_End - GetTask(TSK_CTVL_START) > DEFINE_30_DAYS then
			Msg2Player("Ch� T�n V��ng L�nh �� h�t hi�u l�c.")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� T�n V��ng L�nh �� h�t hi�u l�c.")
			SetTask(TSK_CTVL_ALL, GetTask(TSK_CTVL_ALL)+1)
			return 0
		end		
	end
	
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local tSay = {}
	
	tinsert(tSay, "Ta mu�n k�ch ho�t Ch� T�n V��ng L�nh/CTVL_active")
	tinsert(tSay, "Bang h�i Ch� T�n/CTVL_Tong")
	tinsert(tSay, "T� ��i Ch� T�n/CTVL_Party")
	if ChiTonNew_CheckNewServer() ~= 1 then
		tinsert(tSay, "Ch�o m�ng b�n tr� l�i V� L�m Truy�n K� 2 (nh�n 1 b� trang b� H�o Nguy�t)/#CTVL_getHN(0)")
		if VNG_GetTaskPos(TSK_CTVL_ALL, 7, 7) ~= 0 then
			tinsert(tSay, "Nh�n l�i 1 b� trang b� H�o Nguy�t (c�n 29 v�ng))/#CTVL_getHN(1)")
		end
		tinsert(tSay, "Ta mu�n nh�n h� tr� k�ch ho�t c�nh gi�i kinh m�ch/CTVL_KinhMach_main")
		tinsert(tSay, "Ta mu�n nh�n th��ng m�i ng�y (ti�u hao 1 b�t nh� nh�, 1 b�t nh� l�n, 3 h�t gi�ng/CTVL_getDaily_Award")
		tinsert(tSay, "Ch�a Ph�c Sinh, ta mu�n nh�n th��ng theo ��ng c�p c�a Ch� T�n V��ng L�nh/CTVL_getLevel_Award")
		tinsert(tSay, "Ph�c Sinh 1 - Ch� T�n V��ng L�nh/CTVL_getLevel_PS1")
		tinsert(tSay, "Ph�c Sinh 2 - Ch� T�n V��ng L�nh/CTVL_getLevel_PS2")
	else
		tinsert(tSay, "Server m�i Ch� T�n V��ng L�nh/ChiTonNewServer_Menu")
	end
	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch v� Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function nothing()

end
function CTVL_active()
	do return end
	local nExtPoint = GetExtPoint(5)
	local nCheck = CheckAccount_Active()
	if nCheck == 0 then
		return
	end
	if nExtPoint == 1 then
		SetTask(TSK_CTVL_START, GetTime())
		SetTask(TSK_CTVL_ALL, 1) --Task k�ch ho�t CTVL
		--PayExtPoint(EXT_POINT_CLTV,GetExtPoint(EXT_POINT_CLTV))	
		--AddExtPoint(EXT_POINT_CLTV,2)
		 gf_WriteLogEx(szLogTitle, "kick ho�t th�nh c�ng", 1, "CTVL k�ch ho�t")
		Msg2Player("K�ch ho�t Ch� T�n V��ng L�nh th�nh c�ng.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: K�ch ho�t Ch� T�n V��ng L�nh th�nh c�ng.")
	end
end

function CTVL_KinhMach_main()
	local tSay = {}
	tinsert(tSay, "K�ch ho�t V� Gi� (��t c�p 90 chuy�n sinh 1 tr� l�n)/#CTVL_KinhMach_active(1)")
	tinsert(tSay, "K�ch ho�t V� T��ng (��t c�p 90 chuy�n sinh 1 tr� l�n)/#CTVL_KinhMach_active(2)")
	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")	
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch v� Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)	
end
function CTVL_KinhMach_active(nType)
	local nCheck = CheckAccount_Active1()
	local nCount_CS = GetTranslifeCount()
	local nLevel = GetLevel()
	local tKM = {1, 2}
	
	if nCheck ~= 1 then
		return
	end
	if nCount_CS < 1 then
		Talk(1, "","��i hi�p ch�a ��t Chuy�n Sinh 1 n�n kh�ng th� nh�n h� tr�")
		return
	end
	if nLevel < 90 then
		Talk(1, "","��i hi�p ch�a ��t c�p 90 n�n kh�ng th� nh�n h� tr�")
		return
	end
	if MeridianGetLevel() >= tKM[nType] then
		Talk(1, "", "��i hi�p �� k�ch ho�t c�nh gi�i n�y r�i.")
		return
	end
	if nType == 2 then
		if MeridianGetLevel() < 1 then
			Talk(1, "", "��i hi�p ch�a k�ch ho�t c�nh gi�i V� Gi�.")
			return
		end
	end
	MeridianUpdateLevel()
	 gf_WriteLogEx(szLogTitle, "h� tr� th�nh c�ng", 1, "H� tr� th�nh c�ng lo�i "..nType)
end
function CTVL_getDaily_Award()
	local nCount_CS = GetTranslifeCount()
	local nCheck = CheckAccount_Active1()
	local nCountItem = 1
	local nDelItem = 1
	local tItem_check = {
									{"B�t nh� nh�",  2,0,504,1},
									{"B�t nh� l�n", 2,0,398,1},
									{"H�t gi�ng", 2,1,30086,3},
								}
	local tItem_add = {
									{"M�nh Thi�n M�n", 2,1,30410,10},
									{"M�nh Thi�n Cang", 2,1,30390,50},
									{"C� Linh Ng�c", 2,1,30369,6},
								}
	if nCheck ~= 1 then
		return
	end	
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
--	if nCount_CS ==0 then
--		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a chuy�n sinh n�n kh�ng th� nh�n qu� h� tr�.")
--		return 
--	end	
	if nLevel < 83 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� th�p, h�y ��t c�p 83 r�i quay l�i g�p ta �� nh�n qu� h� tr�.")
		return 
	end
	if nRoute == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a gia nh�p ph�i n�n kh�ng th� nh�n qu� h� tr�.")
		return	
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 9, 9) >= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� nh�n qu� h� tr� h�m nay r�i.")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	for i = 1, 3 do
		if GetItemCount(tItem_check[i][2], tItem_check[i][3], tItem_check[i][4]) < tItem_check[i][5] then
			nCountItem = 0
		end
	end
	if nCountItem == 0 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� v�t ph�m �� nh�n th��ng h�ng ng�y.")
		return
	end
	for i = 1, 3 do
		if DelItem(tItem_check[i][2], tItem_check[i][3], tItem_check[i][4], tItem_check[i][5]) ~= 1 then
			nDelItem = 2
		end
	end
	if nDelItem == 2 then
		gf_WriteLogEx(szLogTitle, "h� tr� kh�ng th�nh c�ng", 1, "H� tr� kh�ng th�nh c�ng lo�i "..nType)
	else
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 9, 9)
		for i =1, 3 do
			gf_AddItemEx2({tItem_add[i][2], tItem_add[i][3], tItem_add[i][4], tItem_add[i][5]},tItem_add[i][1], szLogTitle, "add th�nh c�ng")
		end
		Msg2Player("Nh�n th��ng m�i ng�y: 10 M�nh Thi�n M�n, 50 M�nh Thi�n Cang, 6 C� Linh Ng�c")
		gf_WriteLogEx(szLogTitle, "h� tr� th�nh c�ng", 1, "Nh�n th��ng m�i ng�y ")
	end
end

function CTVL_getLevel_Award()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nChuyenSinh_count = GetTranslifeCount()
	local nLevel = GetLevel()
	if nPhucSinh > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� th�c hi�n Ph�c Sinh r�i n�n kh�ng th� nh�n th��ng � ��y ���c..")
		return	
	end
	if nChuyenSinh_count < 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a chuy�n sinh n�n kh�ng th� nh�n th��ng ���c.")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	if nLevel < 79 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a �� ��ng c�p �� nh�n nhi�m v�.")
		return		
	end
	local nGet = VNG_GetTaskPos(TSK_CTVL_ALL, 6,5)		--mod(floor(GetTask(TSK_CTVL_ALL)/10000), 100)
	
	if nGet >= tb_award_ctvl_PS0[nLevel][1] then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n ti�p n�a!");
		return
	end	
	if GetItemCount(tb_award_ctvl_PS0[nLevel][3], tb_award_ctvl_PS0[nLevel][4], tb_award_ctvl_PS0[nLevel][5]) < tb_award_ctvl_PS0[nLevel][6] then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p kh�ng c� �� "..tb_award_ctvl_PS0[nLevel][6].." "..tb_award_ctvl_PS0[nLevel][2].." �� nh�n nhi�m v�");
		return
	end
	if DelItem(tb_award_ctvl_PS0[nLevel][3], tb_award_ctvl_PS0[nLevel][4], tb_award_ctvl_PS0[nLevel][5], tb_award_ctvl_PS0[nLevel][6]) == 1 then
		VNG_SetTaskPos(TSK_CTVL_ALL, tb_award_ctvl_PS0[nLevel][1], 6,5)
		ModifyExp(tb_award_ctvl_PS0[nLevel][7])
		Msg2Player("Nh�n ���c "..tb_award_ctvl_PS0[nLevel][7].." �i�m kinh nghi�m")
		if nLevel < 90 then
			Earn(tb_award_ctvl_PS0[nLevel][8])
		else
			AwardGenuineQi(tb_award_ctvl_PS0[nLevel][9])
		end
		gf_WriteLogEx(szLogTitle, "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng PS0 th�nh c�ng "..nLevel)
	else
		gf_WriteLogEx(szLogTitle, "nh�n th��ng kh�ng th�nh c�ng", 1, "Nh�n th��ng PS0 kh�ng th�nh c�ng "..nLevel)
	end
	
end
function CTVL_getLevel_PS1()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nPhucSinh ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p kh�ng ph�i Ph�c Sinh 1 n�n kh�ng th� nh�n th��ng � ��y ���c..")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	if nLevel < 90 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a �� ��ng c�p �� nh�n th��ng.")
		return		
	end	
	local tSay = {}
	
	tinsert(tSay, "Nh�n th��ng ��ng c�p 90 /CTVL_PS1_getAward88")
	tinsert(tSay, "Nh�n nhi�m v� m�i ng�y/#CTVL_PS12_getMission(1)")
	tinsert(tSay, "Ti�n �� nhi�m v� m�i ng�y/CTVL_PS12_ShowCountMission")	
	tinsert(tSay, "Ti�n �� nhi�m v� �ang l�m/CTVL_PS12_ShowCountQuest")
	tinsert(tSay, "Nh� ch� ph�ng m�y h� tr� ho�n th�nh 3 nhi�m v� (ti�u hao 2 ��i ng�n phi�u)/CTVL_PS12_Help")
	tinsert(tSay, "Nh�n th��ng ho�n th�nh nhi�m v� m�i ng�y/CTVL_PS12_finishMission")

	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch v� Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function CTVL_PS1_getAward88()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)		
	local nKinhMach = MeridianGetLevel()
	local nLev = GetLevel()
	if nLev < 90 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� th�p n�n kh�ng th� nh�n th��ng. �� �i�u ki�n r�i h�y quay l�i g�p ta..")
		return
	end
	if nLev > 90 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� cao n�n kh�ng th� nh�n th��ng ���c.")
		return
	end	
	if nPhucSinh < 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a Ph�c Sinh l�n 1 n�n kh�ng th� nh�n th��ng ���c. �� �i�u ki�n r�i h�y quay l�i g�p ta..")
		return		
	end
	if nKinhMach < 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�nh gi�i kinh m�ch c�a ��i hi�p ph�i ��t V� T��ng th� ta m�i gi�p ��i hi�p k�ch ho�t c�nh gi�i V� V��ng ���c. �� �i�u ki�n r�i h�y quay l�i g�p ta..")
		return		
	end
	if gf_Judge_Room_Weight(2, 10, "Ch� Ph�ng M�y") == 0 then
		return
	end	
	local nCheck_getPS188 = VNG_GetTaskPos(TSK_CTVL_ALL, 9, 9)
	if nCheck_getPS188 >= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� nh�n ph�n th��ng n�y r�i.")
		return		
	end
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 9, 9)
	local nExp1 = 2000000000
	local nExp2 = 1000000000
	ModifyExp(nExp1)
	Msg2Player("��i hi�p nh�n ���c "..nExp1.." �i�m kinh nghi�m")
	ModifyExp(nExp2)
	Msg2Player("��i hi�p nh�n ���c "..nExp2.." �i�m kinh nghi�m")
	MeridianUpdateLevel()	
	gf_AddItemEx2({2,1,30497,290},"Ma tinh", szLogTitle, "add th�nh c�ng")
	gf_WriteLogEx(szLogTitle, "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng PS1 lev90 th�nh c�ng ")	
end
function CTVL_getLevel_PS2()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end	
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nPhucSinh ~= 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p kh�ng ph�i Ph�c Sinh 2 n�n kh�ng th� nh�n th��ng � ��y ���c..")
		return	
	end
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	if nLevel < 75 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a �� ��ng c�p �� nh�n nhi�m v�.")
		return		
	end	
	local tSay = {}
	
	tinsert(tSay, "Nh�n th��ng ��ng c�p 75 /CTVL_PS2_getAward75")
	tinsert(tSay, "Nh�n nhi�m v� m�i ng�y/#CTVL_PS12_getMission(2)")
	tinsert(tSay, "Ti�n �� nhi�m v� m�i ng�y/CTVL_PS12_ShowCountMission")
	tinsert(tSay, "Ti�n �� nhi�m v� �ang l�m/CTVL_PS12_ShowCountQuest")
	tinsert(tSay, "Nh� ch� ph�ng m�y h� tr� ho�n th�nh 3 nhi�m v� (ti�u hao 2 ��i ng�n phi�u)/CTVL_PS12_Help")
	tinsert(tSay, "Nh�n th��ng ho�n th�nh nhi�m v� m�i ng�y/CTVL_PS12_finishMission")

	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch v� Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function CTVL_PS2_getAward75()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)		
	local nLev = GetLevel()
	if nLev < 75 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� th�p n�n kh�ng th� nh�n th��ng. �� �i�u ki�n r�i h�y quay l�i g�p ta..")
		return
	end
	if nLev > 75 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� cao n�n kh�ng th� nh�n th��ng ���c")
		return
	end	
	if nPhucSinh < 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a Ph�c Sinh l�n 2 n�n kh�ng th� nh�n th��ng ���c. �� �i�u ki�n r�i h�y quay l�i g�p ta..")
		return		
	end
	if gf_Judge_Room_Weight(2, 10, "Ch� Ph�ng M�y") == 0 then
		return
	end	
	local nCheck_getPS275 = VNG_GetTaskPos(TSK_CTVL_ALL, 10, 10)
	if nCheck_getPS275 >= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� nh�n ph�n th��ng n�y r�i.")
		return		
	end
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 10, 10)	
	local nExp1 = 2000000000
	ModifyExp(nExp1)
	Msg2Player("��i hi�p nh�n ���c "..nExp1.." �i�m kinh nghi�m")
	gf_AddItemEx2({2,1,30497,290},"Ma tinh", szLogTitle, "add th�nh c�ng")
	gf_WriteLogEx(szLogTitle, "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng PS2 lev75 th�nh c�ng ")	
end
function CTVL_PS12_Help()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5) == 0  then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a nh�n nhi�m v� n�o h�t.")
		return		
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7) >= 3 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� ho�n th�nh nhi�m v� h�m nay r�i n�n kh�ng c�n ta h� tr� n�a ��u.")
		return	
	end
	if GetItemCount(2,1,199) < 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p kh�ng mang �� 2 ��i ng�n phi�u.")
		return	
	end
	if DelItem(2,1,199,2) == 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 3, 7, 7)
		Msg2Player("Ta �� gi�p ��i hi�p ho�n th�nh h�t nhi�m v� trong ng�y. ��i hi�p h�y �i nh�n th��ng �i")
		gf_WriteLogEx(szLogTitle, "h� tr� th�nh c�ng", 1, "H� tr� ho�n th�nh nhi�m v� m�i ng�y ")	
	end
end
function CTVL_PS12_finishMission()
	local tFruits = {
		[1] = {2,1,30164},
		[2] = {2,1,30165},
		[3] = {2,1,30166},
		[4] = {2,1,30167},
		[5] = {2,1,30168},
		[6] = {2,1,30169},
		[7] = {2,1,30170},
		[8] = {2,1,30171},
		[9] = {2,1,30172},
		[10] = {2,1,30173},
		[11] = {2,1,30174},
		[12] = {2,1,30175},
		[13] = {2,1,30176},
		[14] = {2,1,30177},
		[15] = {2,1,30178},
		[16] = {2,1,30179},
		[17] = {2,1,30180},
		[18] = {2,1,30181},
		[19] = {2,1,30182},
		[20] = {2,1,30183},
	}
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end		
	local nCount = CTVL_CountDailyMission()
	if nCount < 3 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>:��i hi�p ch�a ho�n th�nh �� 3 nhi�m v� ng�y h�m nay n�n kh�ng th� nh�n th��ng")
		return	
	end
	if nCount > 3 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>:��i hi�p �� nh�n th��ng ho�n th�nh nhi�m v� h�m nay r�i.")
		return	
	end
	VNG_SetTaskPos(TSK_CTVL_COUNT, 4, 7, 7) --Set gi� tr� l�n 4 �� nh�n th��ng r�i
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nExp = 390000000
	if nPhucSinh == 1 then
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c "..nExp.." �i�mkinh nghi�m")
		local nSize = getn(tFruits);
		local nIndex = mod(random(1,1000),nSize)+1
		AddItem(tFruits[nIndex][1],tFruits[nIndex][2],tFruits[nIndex][3],39);	
	elseif nPhucSinh == 2 then
		nExp = 690000000	
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c "..nExp.." �i�mkinh nghi�m")
		gf_AddItemEx2({2,1,30071,6},"Nh�n S�m V�n N�m", szLogTitle, "add th�nh c�ng")
	end
	gf_AddItemEx2({2,1,30132,999},"V� L�m B�o H�p", szLogTitle, "add th�nh c�ng")
	gf_WriteLogEx(szLogTitle, "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng m�i ng�y th�nh c�ng, Ph�c Sinh "..nPhucSinh)	
end
function CTVL_PS12_ShowCountQuest()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if CTVL_CheckActive() ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>:��i hi�p ch�a nh�n nhi�m v� n�o c�")
		return
	end
	local nQuest = VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5)
	local nCount = VNG_GetTaskPos(TSK_CTVL_COUNT, 3, 1)

	Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: B�n �ang th�c hi�n nhi�m v� "..tbCTVLName[nQuest][1]..". Ti�n �� ch�a ho�n th�nh l� "..nCount.." l�n")
end
function CTVL_PS12_ShowCountMission()
	local nCount = CTVL_CountDailyMission()
	Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: H�m nay ��i hi�p �� ho�n th�nh "..nCount.."/3 nhi�m v�")
end

function CTVL_PS12_getMission(nType)
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nPhucSinh = GetPlayerRebornParam(0)	
	local nLevel = GetLevel()
	if nType == 1 then	--PS 1
		if nLevel < 91 then
			Talk(1, "",szNPCName.."��ng c�p t� 91 ��n 99 m�i c� th� nh�n nhi�m v� m�i ng�y")
			return
		end
	else	--PS 2
		if nLevel < 79 then
			Talk(1, "", szNPCName.."��ng c�p t� 79 ��n 99 m�i c� th� nh�n nhi�m v� m�i ng�y")
			return
		end
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)  == 0 then
		if GetItemCount(2,1,30490) < 1 then
			Talk(1, "", szNPCName.."��i hi�p kh�ng c� �� 1 Ho�ng Kim ��i Ng�n Phi�u �� nh�n nhi�m v� m�i ng�y")
			return
		end
	end
	------------------
	local nSoLuongNhiemVuNgay =3
	if CTVL_CountDailyMission() >= nSoLuongNhiemVuNgay then
		Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh �� "..nSoLuongNhiemVuNgay.." nhi�m v� m�i ng�y r�i. Ng�y mai h�y quay l�i nh�.")
		return 0
	end
	if CTVL_GetStatus() == 0 and CTVL_GetDailyMission() ~= 0 then
		Talk(1,"",szNPCName.."Ng��i ch�a ho�n th�nh nhi�m v� hi�n t�i. H�y ho�n th�nh r�i quay l�i nh�.")
		return 0
	end
	if VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)  == 0 then
		DelItem(2,1,30490,1)
		gf_WriteLogEx(szLogTitle, "tr� th�nh c�ng", 1, "Tr� HKDNP m�i ng�y nh�n nv th�nh c�ng, Ph�c Sinh "..nPhucSinh)	
	end
	gf_WriteLogEx(szLogTitle, "nh�n th��ng th�nh c�ng", 1, "Nh�n nhi�m v� m�i ng�y th�nh c�ng, Ph�c Sinh "..nPhucSinh)	
	CTVL_SetDailyMission()	
	CTVL_Active()
end

function CTVL_Tong()
	local tSay = {}
	
	tinsert(tSay, "Bang Ch� ��ng k� nh�n th��ng Bang H�i (ti�u hao 8 v�ng)/CTVL_Tong_Active")
	tinsert(tSay, "Th�nh vi�n x�y d�ng bang h�i (ti�u hao 1 xu v�t ph�m, 1 v�ng, 10 tr�i c�y b�t k�)/CTVL_Tong_Contribute")
	tinsert(tSay, "Nh�n th��ng x�y d�ng Bang H�i/CTVL_Tong_Award")
	tinsert(tSay, "Xem s� l��ng th�nh vi�n �� ��ng g�p x�y d�ng Bang/CTVL_Tong_Show")

	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch nh�n th��ng Bang h�i c�a Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function CTVL_Tong_Active()
	local nIsMaster = IsTongMaster()
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nWeek = tonumber(date("%W"))
	local nCheckTongName = 0
	local nCheck = CheckAccount_Active1()
		
	if nCheck ~= 1 then
		return
	end			
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."Ch� c� th� k�ch ho�t � th�nh D��ng Ch�u.");
		return 0
	end
	---------
	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day == 0 then
		if nHour > 2000 then
			Talk ( 1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� th�c hi�n k�ch ho�t Bang H�i Ch� T�n v�o c�c ng�y trong tu�n v� tr��c 20h00 ng�y ch� nh�t");
			return
		end			
	end
	---------	
	if nIsMaster ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	if GetCash() < 80000 then
		Talk(1, "",szNpcName.."C�c h� kh�ng mang theo �� ng�n l��ng, khi kh�c h�y ��n g�p ta.");
		return 0
	end
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()

	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nCheckTongName = i
			break
		end
	end

	if nCheckTongName > 0 then
		if tonumber(nWeek) == tonumber(LIB_txtData.tbTextData[nCheckTongName][5]) then
			Talk(1,"",szNpcName.."Bang h�i c�c h� �� k�ch ho�t th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
			return 0
		else
			Pay(80000)
			LIB_txtData.tbTextData[nCheckTongName][5] = nWeek
			LIB_txtData.tbTextData[nCheckTongName][4] = 0
			LIB_txtData:SaveMultiColumn()
			return 0
		end
	end
	Pay(80000)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0	"..nWeek
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Tu�n n�y Bang h�i c�a c�c h� �� ��ng k� nh�n th��ng Bang H�i Ch� T�n th�nh c�ngi, h�y b�o tin cho c�c th�nh vi�n bang h�i.")
	gf_WriteLogEx(szLogTitle, "��ng k�", 1, "��ng k� th�nh c�ng")
end

function CTVL_Tong_Show()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."Ch� c� th� xem � th�nh D��ng Ch�u.");
		return 0
	end	
	local szTong = GetTongName()
	local nWeek = tonumber(date("%W"))
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang h�i ch�a ��ng k� nh�n th��ng Bang H�i Ch� T�n")
		return
	end	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."Tu�n n�y bang ch� ch�a k�ch ho�t nh�n th��ng Bang H�i Ch� T�n")
		return
	end
	local nCount = LIB_txtData.tbTextData[nBang][4]
	Talk(1,"",szNpcName.."S� l��ng th�nh vi�n tham gia ��ng g�p x�y d�ng Bang H�i Ch� T�n l�: "..nCount)
end

function CTVL_Tong_Contribute()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."Ch� c� th� ��ng g�p � th�nh D��ng Ch�u.");
		return 0
	end	
	local nWeek = tonumber(date("%W")	)
	local nContribute = mod(floor(GetTask(TSK_CTVL_ALL)/10),10)
	local nMod = mod(GetTask(TSK_CTVL_ALL), 10)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/10)
	local nTask = (nFloor + 1) *10 + nMod
	if nContribute >= 1 then
		Talk(1,"",szNpcName.."Tu�n n�y ��i hi�p �� th�c hi�n ��ng g�p �� x�y d�ng Bang H�i Ch� T�n r�i, tu�n sau h�y quay l�i")
		return
	end
	----------
	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day == 0 then
		if nHour > 2000 then
			Talk ( 1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� th�c hi�n ��ng g�p �� x�y d�ng Bang H�i Ch� T�n v�o c�c ng�y trong tu�n v� tr��c 20h00 ng�y ch� nh�t");
			return
		end			
	end
	-----------
	if GetItemCount(2,1,30230) < 1 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng mang �� Xu v�t ph�m ")
		return
	end
	if GetCash() < 10000 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng c� �� v�ng ")
		return
	end
	local nCount_fruite = 0
	for i = 30164, 30183 do
		nCount_fruite = GetItemCount(2,1,i)
		if nCount_fruite >= 10 then
			break
		end
	end
	if nCount_fruite < 10 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng c� �� 10 tr�i c�y c�ng lo�i ")
		return
	end
	local szTong = GetTongName()
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) ==tostring( LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang h�i ch�a ��ng k� nh�n th��ng Bang H�i Ch� T�n")
		return
	end
	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."Tu�n n�y bang ch� ch�a k�ch ho�t nh�n th��ng Bang H�i Ch� T�n")
		return
	end
	DelItem(2,1,30230,1)
	Pay(10000)
	local nDelAllFruite = 10
	for i = 30164, 30183 do
		nCount_fruite = GetItemCount(2,1,i)
		if nCount_fruite >= nDelAllFruite then
			DelItem(2,1,i, nDelAllFruite)
			break
		end
	end
	SetTask(TSK_CTVL_ALL, nTask)	--set task �� ��ng g�p r�i
	Talk(1,"",szNpcName.."��i hi�p �� ��ng g�p x�y d�ng Bang h�i Ch� T�n th�nh c�ng. H�y ch� ��n cu�i tu�n �� nh�n th��ng. ")
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + 1
	LIB_txtData:SaveMultiColumn()
	gf_WriteLogEx(szLogTitle1, "nh�n", 1, "X�y d�ng bang "..szTong)
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "X�y d�ng bang ")
end
function CTVL_Tong_Award()
	local nWeek = date("%W")
	local nGetAward = VNG_GetTaskPos(TSK_CTVL_ALL, 3, 3)
	local nDongGop_Status = VNG_GetTaskPos(TSK_CTVL_ALL, 2, 2)
	local nMod = mod(GetTask(TSK_CTVL_ALL), 100)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/100)
	local nTask = (nFloor + 1) *100 + nMod
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nCity = GetWorldPos()
	if nCity ~= 150 then
		Talk(1, "",szNpcName.."Ch� c� th� nh�n th��ng � th�nh D��ng Ch�u.");
		return 0
	end	
	if nDongGop_Status < 1 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng tham gia ��ng g�p x�y d�ng bang h�i n�n kh�ng th� nh�n th��ng Bang H�i Ch� T�n ���c. Tu�n sau ��i hi�p h�y c� g�ng l�n")
		return	
	end
	if nGetAward >= 1 then
		Talk(1,"",szNpcName.."Tu�n n�y ��i hi�p �� nh�n th��ng Bang H�i Ch� T�n r�i, tu�n sau h�y quay l�i")
		return
	end	

	local nWeek_day = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
	if nWeek_day ~= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o<color=green> ng�y ch� nh�t, th�i gian t� 20h30 ��n 23h30 <color>");
		return
	end
	if nHour < 2030 or nHour > 2330  then
		Talk ( 1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o <color=green> th�i gian t� 20h30 ��n 23h30 <color>");
		return
	end		
	local szTong = GetTongName()
	local nExp = 0
	local nCountMem = 0
	LIB_txtData:Init("ctvl_old.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if tostring(szTong) == tostring(LIB_txtData.tbTextData[i][1]) then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		Talk(1,"",szNpcName.."Bang h�i ch�a ��ng k� nh�n th��ng Bang H�i Ch� T�n")
		return
	end	
	if tonumber(nWeek) > tonumber(LIB_txtData.tbTextData[nBang][5]) then
		Talk(1,"",szNpcName.."Tu�n n�y ��i hi�p �� nh�n th��ng Bang H�i Ch� T�n r�i, tu�n sau h�y quay l�i")
		return
	end
	nCountMem = LIB_txtData.tbTextData[nBang][4]
	SetTask(TSK_CTVL_ALL, nTask)	--set task �� nh�n th��ng x�y d�ng bang h�i r�i	
	nExp = 2000000 * nCountMem
	ModifyExp(nExp)
	Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng T� ��i Ch� T�n!",0)		
	gf_WriteLogEx(szLogTitle, "nh�n th��ng", 1, "Nh�n th��ng Bang H�i Ch� T�n")
end

function CTVL_Party()
	local nTeamSize = GetTeamSize()
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	if nTeamSize == 0 then
		Talk(1,"",szNpcName.."Ch�a c� t� ��i n�n kh�ng th� nh�n th��ng")
		return	
	end	
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� ��i tr��ng m�i c� th� k�ch ho�t nh�n th��ng!")
		return
	end		
	local tSay = {}
	
	tinsert(tSay, "T� ��i nh�n th��ng Ph� Th�ng/#CTVL_Party_Award(1)")
	tinsert(tSay, "T� ��i nh�n th��ng V� Song/#CTVL_Party_Award(2)")
	
	tinsert(tSay, "Ta kh�ng mu�n l�m g� h�t/nothing")
	
	Say(szNpcName.."Ta chuy�n ph� tr�ch nh�n th��ng Bang h�i c�a Ch� T�n V��ng L�nh. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)	
end
function CTVL_Party_Award(nType)
	local nCity = GetWorldPos()	
	local szFailMember = ""
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	
	local nMod = mod(GetTask(TSK_CTVL_ALL), 1000)
	local nFloor = floor(GetTask(TSK_CTVL_ALL)/1000)
	local nTask = (nFloor + 1) *1000 + nMod	
	
	if nTeamSize == 0 then
		Talk(1,"",szNpcName.."Ch�a c� t� ��i n�n kh�ng th� nh�n th��ng")
		return	
	end
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� ��i tr��ng m�i c� th� k�ch ho�t nh�n th��ng!")
		return
	end
	if nType == 2 then
		if GetItemCount(2,1,30230) < 8 or GetCash() < 80000 then
			Talk(1, "","��i hi�p kh�ng �� Xu v�t ph�m ho�c kh�ng �� v�ng, vui l�ng ki�m tra l�i")
			return
		end
	end
	local nTeamSize = GetTeamSize()	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nCheckmem = CheckAccount_Active1()
		local nGetAwardmem = mod(floor(GetTask(TSK_CTVL_ALL)/1000),10)
		local nCity2 = GetWorldPos()
		if nCheckmem ~= 1 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh�ng c� k�ch ho�t Ch� T�n V��ng L�nh, kh�ng th� nh�n th��ng.", szFailMember))	
			return
		end	
		if nGetAwardmem >= 1 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s �� nh�n th��ng T� ��i Ch� T�n r�i, kh�ng th� nh�n th��ng.", szFailMember))	
			return
		end	
		if nCity2 ~= nCity then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh�ng c�ng b�n �� v�i ��i tr��ng, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end
	end
	PlayerIndex = nOldPlayerIdx
	if nType == 2 then
		if DelItem(2,1,30230, 8) ~= 1 or Pay(80000) ~= 1 then
				Talk(1, "","��i hi�p kh�ng �� Xu v�t ph�m ho�c kh�ng �� v�ng, vui l�ng ki�m tra l�i")
				return	
		end
	end
	
	nTeamSize = GetTeamSize()	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nExp = 3000000 + (3000000 * nTeamSize)
		if nType == 2 then
			nExp = 5000000 + (5000000 * nTeamSize)
		end
		SetTask(TSK_CTVL_ALL, nTask)	--set task �� nh�n th��ng t� ��i m�i ng�y r�i	
		ModifyExp(nExp)
		Msg2Player("��i hi�p nh�n ���c "..nExp.." �i�m kinh nghi�m")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng T� ��i Ch� T�n!",0)		
		gf_WriteLogEx(szLogTitle, "nh�n th��ng", 1, "Nh�n th��ng T� ��i Ch� T�n")
	end
	PlayerIndex = nOldPlayerIdx
end

function CTVL_getHN(nOption)
	local nCheck = CheckAccount_Active1()
	if nCheck ~= 1 then
		return
	end
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	local nGetNH = VNG_GetTaskPos(TSK_CTVL_ALL, 7, 7)
	if nOption ~= 0 then
		if gf_GetTaskBit(TSK_CHITONNEW3, 9) == 1 then
			Talk(1,"","Ph�n h� tr� n�y ng��i �� nh�n th�m 1 l�n r�i, kh�ng th� nh�n th�m l�n n�a.")
			return 0
		end
		if GetCash() < 290000 then
			Talk(1,"","H� tr� l�n n�y c�n 29 v�ng, h�nh nh� ��i hi�p kh�ng ��?")
			return 0
		end
	else
		if nGetNH >= 1 then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p �� nh�n h� tr� r�i.")
			return 
		end
	end
	if nLevel < 83 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a ��i hi�p qu� th�p, h�y ��t c�p 83 r�i quay l�i g�p ta �� nh�n qu� h� tr�.")
		return 
	end
	if gf_Judge_Room_Weight(10, 400, "Ch� Ph�ng M�y") == 0 then
		return
	end	
	if nRoute == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a gia nh�p ph�i n�n kh�ng th� nh�n qu� h� tr�.")
		return	
	end
	-- Thieu Lam
	local HaoNguyet_TLD = {
		[1] = {item={
			{gdp={0,100,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� B�o"},
			{gdp={0,101,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� Trang"},
			{gdp={0,103,3064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� B�o"},
			{gdp={0,101,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� Trang"},
			{gdp={0,103,3065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� N�n T�n Gi� M�o"},}},
	}
	local HaoNguyet_TLQ = {
		[1] = {item={
			{gdp={0,100,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� B�o"},
			{gdp={0,101,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� Trang"},
			{gdp={0,103,3066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� B�o"},
			{gdp={0,101,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� Trang"},
			{gdp={0,103,3067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� M�o"},}},
	}
	local HaoNguyet_TLT = {
		[1] = {item={
			{gdp={0,100,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� B�o"},
			{gdp={0,101,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� Trang"},
			{gdp={0,103,3068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� B�o"},
			{gdp={0,101,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� Trang"},
			{gdp={0,103,3069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� M�o"},}},
	}
	
	-- Duong Mon
	local HaoNguyet_DM = {
		[1] = {item={
			{gdp={0,100,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n"},}},
	}
	
	-- Nga My
	local HaoNguyet_NMK = {
		[3] = {item={
			{gdp={0,100,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Y"},
			{gdp={0,101,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Qu�n"},
			{gdp={0,103,3074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Y"},
			{gdp={0,101,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Qu�n"},
			{gdp={0,103,3075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t V�n Th�nh C� Tr�m"},}},
	}
	local HaoNguyet_NMD = {
		[3] = {item={
			{gdp={0,100,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Y"},
			{gdp={0,101,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Qu�n"},
			{gdp={0,103,3076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Y"},
			{gdp={0,101,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Qu�n"},
			{gdp={0,103,3077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� Tr�m"},}},
	}
	
	-- Cai Bang
	local HaoNguyet_CBQ = {
		[1] = {item={
			{gdp={0,100,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[2] = {item={
			{gdp={0,100,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[3] = {item={
			{gdp={0,100,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3080,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[4] = {item={
			{gdp={0,100,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,103,3081,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n"},}},
	}
	local HaoNguyet_CBB = {
		[1] = {item={
			{gdp={0,100,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3082,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[2] = {item={
			{gdp={0,100,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3083,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[3] = {item={
			{gdp={0,100,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3084,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[4] = {item={
			{gdp={0,100,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,103,3085,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng ��a Kh�t C�n"},}},
	}
	
	-- Vo Dang
	local HaoNguyet_VDK = {
		[1] = {item={
			{gdp={0,100,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3086,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3087,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n Qu�n"},}},
	}
	local HaoNguyet_VDB = {
		[1] = {item={
			{gdp={0,100,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n"},}},
	}
	
	-- Duong Gia
	local HaoNguyet_DGT = {
		[1] = {item={
			{gdp={0,100,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Kh�i"},}},
		[2] = {item={
			{gdp={0,100,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Kh�i"},}},
		[3] = {item={
			{gdp={0,100,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Kh�i"},}},
		[4] = {item={
			{gdp={0,100,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Kh�i"},}},
	}
	local HaoNguyet_DGC = {
		[1] = {item={
			{gdp={0,100,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[2] = {item={
			{gdp={0,100,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[3] = {item={
			{gdp={0,100,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[4] = {item={
			{gdp={0,100,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i"},}},
	}
	
	-- Ngu Doc
	local HaoNguyet_5DD = {
		[1] = {item={
			{gdp={0,100,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n C�n"},}},
		[2] = {item={
			{gdp={0,100,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n C�n"},}},
		[3] = {item={
			{gdp={0,100,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n C�n"},}},
		[4] = {item={
			{gdp={0,100,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n C�n"},}},
	}
	local HaoNguyet_5DT = {
		[1] = {item={
			{gdp={0,100,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y C�n"},}},
		[2] = {item={
			{gdp={0,100,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y C�n"},}},
		[3] = {item={
			{gdp={0,100,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y C�n"},}},
		[4] = {item={
			{gdp={0,100,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Y C�n"},}},
	}
	
	-- Con Lon
	local HaoNguyet_CLTS = {
		[1] = {item={
			{gdp={0,100,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n B�o"},
			{gdp={0,101,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Trang"},
			{gdp={0,103,3110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n B�o"},
			{gdp={0,101,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Trang"},
			{gdp={0,103,3111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Qu�n"},}},
	}
	
	-- Thuy Yen
	local HaoNguyet_TYVT = {
		[3] = {item={
			{gdp={0,100,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Y"},
			{gdp={0,101,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Qu�n"},
			{gdp={0,103,3124,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Y"},
			{gdp={0,101,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Qu�n"},
			{gdp={0,103,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Tr�m"},}},
	}
	local HaoNguyet_TYLN = {
		[3] = {item={
			{gdp={0,100,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Y"},
			{gdp={0,101,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Qu�n"},
			{gdp={0,103,3126,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Y"},
			{gdp={0,101,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Qu�n"},
			{gdp={0,103,3127,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� Tr�m"},}},
	}
	local tbVuKhiHaoNguyet_ctvl = {
		[2] = {item={{gdp={0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name="H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao"}}},
		[4] = {item={{gdp={0,0,8973,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�"}}},
		[3] = {item={{gdp={0,8,8974,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng"}}},
		[6] = {item={{gdp={0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Ch�m"}}},
		[8] = {item={{gdp={0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name ="H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m"}}},
		[9] = {item={{gdp={0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m"}}},
		[11] = {item={{gdp={0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�"}}},
		[12] = {item={{gdp={0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Du Long ��a Kh�t C�n"}}},
		[14] = {item={{gdp={0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m"}}},
		[15] = {item={{gdp={0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�t"}}},
		[17] = {item={{gdp={0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Th��ng"}}},
		[18] = {item={{gdp={0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung"}}},
		[20] = {item={{gdp={0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Qu� X�c T� Th�n �ao"}}},
		[21] = {item={{gdp={0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Vu C�t ��c V��ng Tr�o"}}},
		[23] = {item={{gdp={0,2,8986,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Ki�m"}}},
		[29] = {item={{gdp={0,13,8990,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-T� V�n Ti�n T� Phi�n"}}},
		[30] = {item={{gdp={0,12,8991,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "H�o Nguy�t-Phi H� Ti�n T� �u Lan Ti�u"}}},
	}
	local tbTrangBiHaoNguyet_ctvl = {
		[2] = HaoNguyet_TLD,
		[3] = HaoNguyet_TLT,
		[4] = HaoNguyet_TLQ,
		[6] = HaoNguyet_DM,
		[8] = HaoNguyet_NMK,
		[9] = HaoNguyet_NMD,
		[11] = HaoNguyet_CBQ,
		[12] = HaoNguyet_CBB,
		[14] = HaoNguyet_VDK,
		[15] = HaoNguyet_VDB,
		[17] = HaoNguyet_DGT,
		[18] = HaoNguyet_DGC,
		[20] = HaoNguyet_5DD,
		[21] = HaoNguyet_5DT,
		[23] = HaoNguyet_CLTS,
		[29] = HaoNguyet_TYVT,
		[30] =HaoNguyet_TYLN,
	}
	for nRoute = 1, 30 do
		if tbTrangBiHaoNguyet_ctvl[nRoute] ~= nil then
			for i=1, 4 do
				if tbTrangBiHaoNguyet_ctvl[nRoute][i] ~= nil then
					for j=1,3 do
						tbTrangBiHaoNguyet_ctvl[nRoute][i]["item"][j]["gdp"][13] = 11
					end
				end
			end
		end
	end
	local nRoute = GetPlayerRoute()
	local tbAward_ctvl = tbTrangBiHaoNguyet_ctvl[nRoute]
--	print(tbTrangBiHaoNguyet_ctvl[nRoute][1][1][3])
	VNG_SetTaskPos(TSK_CTVL_ALL, 1, 7,7)	--Set Task �� nh�n h� tr� l�n 1 � v� tr� th� 7
	LIB_Award:AwardByBody(tbAward_ctvl)
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet_ctvl)	
	local tbAwardHN_ctvl = {item = {
			{gdp={0,102,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H�o Nguy�t-� L�n B�o Gi�i"},
			{gdp={0,102,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H�o Nguy�t-T� Giao Ng�c B�i"},
			{gdp={0,102,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H�o Nguy�t-V�n H� L�nh"},
			{gdp={0,102,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H�o Nguy�t-X�ch T��c Ho�n"},
			{gdp={0,102,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "H�o Nguy�t-B�ch Quy Li�n"},},
	}
	LIB_Award:Award(tbAwardHN_ctvl)
	if nOption ~= 0 then
		gf_SetTaskBit(TSK_CHITONNEW3, 9,1,0)
		Pay(290000)
		gf_WriteLogEx(szLogTitle, "nh�n th�nh c�ng", 1, "CTVL nh�n l�i HN")
	else
		gf_WriteLogEx(szLogTitle, "nh�n th�nh c�ng", 1, "CTVL nh�n HN")
	end
end