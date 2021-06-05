Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
szLogTitle = "SINH TU VO NGA"
szLogAction = "nh�n"

function Award_Daily_Menu()
	local tbSay = {}
	tinsert(tbSay,"Nh�n nhi�m v� h�ng ng�y/STVNdailymission")
	tinsert(tbSay,"Xem t�nh h�nh nhi�m v� h�ng ng�y/STVN_DailyMissionView")
	tinsert(tbSay,"Nh�n th��ng nhi�m v� h�ng ng�y/Award_Daily")
	tinsert(tbSay,"Tho�t/gf_DoNothing")
	Say(szNpcName.."N�u ho�n th�nh t�t c� c�c th� th�ch m�i ng�y c�a ta, ta s� c� ph�n th��ng cho c�c h�.",getn(tbSay),tbSay)
end

function STVN2_NhanNhiemVu()
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if tRoute[nRoute] ~= 1 then	
		Talk(1, "", "Ch�a gia nh�p h� ph�i, kh�ng th� tham gia ho�t ��ng n�y.");
		return 0
	end	
	if nChuyenSinh >= 700 then -- b�t chuy�n sinh 7
		Talk(1,"","Kinh nghi�m chuy�n sinh c�a ��i hi�p qu� cao, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end
	if STVN_GetStatus() ~= 0 then
		Talk(1, "", "��i hi�p �� tham gia ho�t ��ng n�y, kh�ng th� tham gia th�m ���c n�a.");
		return 0
	end
	STVN_MissionAccept()
end


function menu_award()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H� th�ng nh�n th��ng:"
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 91/#Level_Award(591)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 92/#Level_Award(592)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 93/#Level_Award(593)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 94/#Level_Award(594)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 95/#Level_Award(595)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 96/#Level_Award(596)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 97/#Level_Award(597)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 98/#Level_Award(598)")
	tinsert(tbSayDialog,"Nh�n th��ng chuy�n sinh 5, ��ng c�p 99/#Level_Award(599)")
	tinsert(tbSayDialog,"Trang sau/menu_award2")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function menu_award2()
	local tbSayDialog = {};
	local szSayHead = "H� th�ng nh�n th��ng:"
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 90/#Level_Award(690)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 91/#Level_Award(691)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 92/#Level_Award(692)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 93/#Level_Award(693)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 94/#Level_Award(694)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 95/#Level_Award(695)")
	tinsert(tbSayDialog,"Nh�n th��ng Ph�c sinh, ��ng c�p 96/#Level_Award(696)")
	tinsert(tbSayDialog,"Quay l�i/menu_award")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function menu_point()
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh T� V� Ng� ch�a k�ch ho�t.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H� th�ng �i�m t�ch c�c:"
	tinsert(tbSayDialog,"Nh�n 1 �i�m t�ch c�c (ti�u hao 5.000.000 �i�m kinh nghi�m + 3 xu + 9 v�ng)/#get_point(1)")
	tinsert(tbSayDialog,"Nh�n 5 �i�m t�ch c�c (ti�u hao 25.000.000 �i�m kinh nghi�m + 15 xu + 49 v�ng)/#get_point(5)")
	tinsert(tbSayDialog,"Nh�n 10 �i�m t�ch c�c (ti�u hao 50.000.000 �i�m kinh nghi�m + 30 xu + 99 v�ng)/#get_point(10)")
	
	tinsert(tbSayDialog,"Xem �i�m t�ch l�y/show_point")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end


function show_point()
	local nPoint = mod(GetTask(TSK_SINHTUVONGA1),1000)
	local nTodayPoint = mod(floor(GetTask(TSK_SINHTUVONGA1)/1000),100)
	local szText = "�i�m t�ch c�c hi�n t�i: <color=yellow>"..nPoint.."<color>\n"
	szText = szText .. "�i�m t�ch c�c �� n�p h�m nay: <color=yellow>"..nTodayPoint.."<color>\n"
	Talk(1,"",szText)
end


function get_point(nPoint)
--	AABCCDDD
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nMaxToday = 16
	local nMax =600
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30230,3}}},nExp = 5000000, nGold = 90000},
		[5] = {item={{gdp={2,1,30230,15}}},nExp = 25000000, nGold = 490000},
		[10] = {item={{gdp={2,1,30230,30}}},nExp = 50000000, nGold = 990000},
	}
	local nCurrentPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nTodayPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,5,4)
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh T� V� Ng� ch�a k�ch ho�t.")
		return 0
	end
	if STVN_time_remain() == 0 then
		Talk(1,"","C�c �� ��n qu� mu�n, �� h�t h�n nh�n th��ng...")
		return 0
	end
	if (nCurrentPoint + nPoint) > nMax then
		Talk(1,"","M�c �i�m ��i v��t qu� gi�i h�n "..nMax..", c�c h� h�y ch�n m�c ��i kh�c.")
		return 0
	end
	local nCheck_reset = VNG_GetTaskPos(TSK_SINHTUVONGA1,9,9)
	if nCheck_reset == 1 then
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 0, 5, 4) -- Reset doi diem moi ngay
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 0, 9, 9)
	end
	if (nTodayPoint + nPoint) > nMaxToday then
		Talk(1,"","M�c �i�m ��i trong ng�y v��t qu� gi�i h�n "..nMaxToday..", c�c h� h�y ch�n m�c ��i kh�c.")
		return 0
	end
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nPoint])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[nPoint])
	nCurrentPoint = nCurrentPoint + nPoint
	nTodayPoint = nTodayPoint + nPoint
	VNG_SetTaskPos(TSK_SINHTUVONGA1,nCurrentPoint,3,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA1,nTodayPoint,5,4)
	Msg2Player("�i�m t�ch c�c t�ng "..nPoint)
	gf_WriteLogEx(szLogTitle, szLogAction, 1, nPoint.." �i�m t�ch c�c")
end


function STVNdailymission()
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","Sinh T� V� Ng� ch�a k�ch ho�t.")
		return 0
	end
	local nIndex = STVN_GetDailyAwardStatus()
	if nIndex >= 3 then
		Talk(1,"","S� l�n nh�n nhi�m v� h�m nay �� h�t, mai h�y quay l�i nh�.")
		return 0
	end
	if nIndex == 2 then
		Talk(1,"","C�c h� �� ho�n th�nh nhi�m v�, h�y �i nh�n th��ng.")
		return 0
	end
	if nIndex == 1 then
		Talk(1,"","C�c h� �� nh�n nhi�m v� h�ng ng�y, h�y mau ch�ng ho�n th�nh nhi�m v�.")
		return 0
	end
	STVN_SetDailyAwardStatus(1)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,1111,5,2) -- Set b� ��m nhi�m v� h�ng ng�y
	Talk(1,"","Sinh t� V� Ng�: Nh�n th�nh c�ng nhi�m v� h�ng ng�y.")
end


function Award_Daily()
	local nDate = tonumber(date("%y%m%d"))
	if STVN_time_remain() == 0 then
		Talk(1,"","C�c �� ��n qu� mu�n, �� h�t h�n nh�n th��ng...")
		return 0
	end
	Msg2Player(STVN_GetDailyAwardStatus())
	if STVN_GetDailyAwardStatus() == 3 then
		Talk(1,"","H� tr� h�m nay c�c h� �� nh�n, sao l�i mu�n ��i th�m?")
		return 0
	end
	if STVN_GetDailyAwardStatus() == 1 then
		Talk(1,"","Nhi�m v� m�i ng�y ch�a ho�n th�nh, c�c h� kh�ng th� nh�n th��ng.")
		return 0
	end
	if STVN_GetDailyAwardStatus() ~= 2 then
		Talk(1,"","C�c h� ch�a nh�n nhi�m v� h�ng ng�y.")
		return 0
	end
	if gf_Judge_Room_Weight(6,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	STVN_SetDailyAwardStatus(3)
	MatTichCaoCap70(2)
	local nAwardRand = mod(random(1,1000),20)
	gf_AddItemEx2({2,1,(30164+nAwardRand),19}, "Tr�i c�y", szLogTitle, szLogAction)

	--3 diem tich luy
	local nCurrentPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nTodayPoint = VNG_GetTaskPos(TSK_SINHTUVONGA1,5,4)
	local nPoint = 3
	nCurrentPoint = nCurrentPoint + nPoint
	nTodayPoint = nTodayPoint + nPoint
	VNG_SetTaskPos(TSK_SINHTUVONGA1, nCurrentPoint, 3,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA1, nTodayPoint, 5,4)
	Msg2Player("�i�m t�ch c�c t�ng "..nPoint)
	gf_WriteLogEx(szLogTitle, szLogAction, 1, nPoint.." �i�m t�ch c�c")
	
	local tbAward = {item = {{gdp={2,95,208,1,4}, name = "T� Ngh�a L�nh"},{gdp={2,1,30409,1,4}, name = "Th�ng Thi�n L�nh"}}} 
	LIB_Award:Award(tbAward)
	Talk(1,"","Nh�n h� tr� m�i ng�y th�nh c�ng.")
end


function Level_Award(nIndex)
	if STVN_time_remain() == 0 then
		Talk(1,"","C�c h� �� ��n qu� mu�n, �� h�t h�n nh�n th��ng...")
		return 0
	end
	if STVN_GetStatus() ~= 2 then
		Talk(1,"","C�c h� ch�a ho�n th�nh nhi�m v�...")
		return 0
	end
	
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ph��ng �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ng�c �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
	end
	local tbAward91 = {item = {
			{gdp={0,112,78,1,1}}, --lang ba vi bo
			{gdp={2,1,30408,3}}, --Thien huyen khac ban 3
			{gdp={2,1,30491,3}}}, --Tieu y vang
			fn = "MatTichCaoCap70(9)",
	}
	local tbAward92 = {
			item = {{gdp={2,1,9999,3}, nExpired=30*24*3600}},--quan cong chuong
			nChankhi = 30000,
			nPetExp = 300,
			nPetLinhluc = 100,
	}
	local tbAward93 = {
			item = {{gdp={2,1,9998,3}, nExpired=30*24*3600}}, --quan cong dai
			nPetExp = 300,
		 	nPetLinhluc = 100, 
		 	nChankhi = 30000,
	}
	local tbAward94 = {item = {{gdp={0,112,78,1,1}, name = "L�ng Ba Vi B�"}}, 
			nChankhi = 30000,
			nPetExp = 300,
			nPetLinhluc = 200, 
			fn = "Trao1NguLongTuongQuan_TrangBi(10,103)",
	}
	local tbAward95 = {item = {
			{gdp={0,112,78,1,1}, name = "L�ng Ba Vi B�"}},
			nPetExp = 300,
			nPetLinhluc = 200,
			nChankhi = 30000,
			fn = "Trao1NguLongTuongQuan_TrangBi(10,100)",
	}
	local tbAward96 = {
			nPetExp = 300,
			nPetLinhluc = 200,
			nChankhi = 30000,
			fn = "Trao1NguLongTuongQuan_TrangBi(10,101)",
	}
	local tbAward97 = {item = {
			{gdp={2,1,504,3,4}, nExpired = 30 * 24 * 3600},--Nu oa tinh thach
			{gdp={2, 1, 30535,44}}},--thiet tinh cap 3
			nChankhi = 30000,
			nPetLinhluc = 200,
			fn = "TraoNguLongTuongQuan_TrangSuc()",
	}
	local tbAward98 = {item = {
			{gdp={2,1,9977,3}, nExpired = 30 * 24 * 3600}, -- chien cong huy hoang
			{gdp={2,1,504,3,4}, nExpired = 30 * 24 * 3600}},--Nu oa tinh thach
			nChankhi = 30000,
			fn = "HoTroPhucSinh()",
	}
	local tbAward99 = {
			nQuancong = 99000, 
			nChankhi = 30000, 
			fn = "VukhiDieuDuong();HoTroPhucSinh2()"}
	local tbAwardPS90 =  {item = {
			{gdp={2, 1, 30535,77}}},--thiet tinh cap 3
			nPetLinhluc = 200,
			nPetExp = 300,
			nChankhi = 69000,
			fn = "TrangBiDieuDuong1(103)",
	}
	local tbAwardPS91 = {
			nExp = 1234567890,
			fn = "TrangBiDieuDuong1(100)",
			
	}
	local tbAwardPS92 = {
			nExp = 1234567890,
			nChankhi = 99000,
	}
	local tbAwardPS93 = {
			nExp = 1234567890,
			fn = "TrangBiDieuDuong1(101)",
	}
	local tbAwardPS94 = {
			item= {
				{gdp={0,102,3176,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3178,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3180,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3182,1,1,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3184,1,1,-1,-1,-1,-1,-1,-1,-1}},
			},
			fn = "AddBigExp(3999000000)",
	}
	local tbAwardPS95 = {
			nChankhi = 99000,
			fn = "AddBigExp(4999000000)",
	}
	local tbAwardPS96 = {
			fn = "HoTroPhucSinhPet();AddBigExp(5999000000)",
	}
	--TRUNGLX
	local tbLevelAward = {
		[591] = tbAward91,
		[592] = tbAward92,
		[593] = tbAward93,
		[594] = tbAward94,
		[595] = tbAward95,
		[596] = tbAward96,
		[597] = tbAward97,
		[598] = tbAward98,
		[599] = tbAward99,
		[690] = tbAwardPS90,
		[691] =	tbAwardPS91,
		[692] = tbAwardPS92,
		[693] = tbAwardPS93,
		[694] = tbAwardPS94,
		[695] = tbAwardPS95,
		[696] = tbAwardPS96,
	}
	local tbIndexAward = {
		[591] = 1,
		[592] = 2,
		[593] = 3,
		[594] = 4,
		[595] = 5,
		[596] = 6,
		[597] = 7,
		[598] = 8,
		[599] = 9,
		[690] = 10,
		[691] = 11,
		[692] = 12,
		[693] = 13,
		[694] = 14,
		[695] = 15,
		[696] = 16,
	}
	local tbCondition1 = {nQuancong = 100000, nSumon = 10000, nDanhvong = 10000}
	local tbCondition2 = {nQuancong = 300000, nSumon = 20000, nDanhvong = 20000}
	local tbDieuKienChung = { -- Diem tich cuc, hanh trang, can nang}
		[591] = {30, 17, 100},
		[592] = {50, 4, 100},
		[593] = {60, 4, 100},
		[594] = {80, 2, 100},
		[595] = {90, 2, 100},
		[596] = {120, 2, 100},
		[597] = {150, 12, 100},
		[598] = {180, 7, 100},
		[599] = {210, 2, 100},
		[690] = {280, 12, 100},
		[691] = {320, 2, 100},
		[692] = {350, 2, 100},
		[693] = {400, 2, 100},
		[694] = {450, 6, 100},
		[695] = {500, 2, 100},
		[696] = {600, 2, 100},
	}
	local tbMaterial1 = {nExp = 390000000, item={{gdp ={2,1,30230,39}}}}
	local tbMaterial690 = {item={{gdp ={2,1,30230,74}}},nGold = 740000}
	local tbMaterial695 = {item={{gdp ={2,1,30230,99}},{gdp = {2,1,30603,99}}},nGold = 990000,}
	local tbMaterial696 = {item={{gdp ={2,1,30230,444}},{gdp = {2,1,30603,444}}},nGold = 44440000,}
	
	local nAwardStep = VNG_GetTaskPos(TSK_SINHTUVONGA1,8,7)
	local nDiem = VNG_GetTaskPos(TSK_SINHTUVONGA1,3,1)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()
	if tbLevelAward[nIndex] == nil then
		return 0
	end
-- Kiem tra dieu kien
	if nAwardStep >= tbIndexAward[nIndex] then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	if (nAwardStep + 1) < tbIndexAward[nIndex] then
		Talk(1,"","C�c h� ch�a nh�n ph�n th��ng tr��c.")
		return 0
	end
	if nLevel < nIndex then
		Talk(1,"","�i�u ki�n chuy�n sinh ho�c ��ng c�p kh�ng ��.")
		return 0
	end
	if gf_Judge_Room_Weight(tbDieuKienChung[nIndex][2],tbDieuKienChung[nIndex][3]) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	if nDiem < tbDieuKienChung[nIndex][1] then
		Talk(1, "", "C�c h� ch�a �� "..tbDieuKienChung[nIndex][1].." �i�m t�ch c�c")
		return 0
	end
	if nIndex <= 599 then
		if TopCheckSkill(10) == 0 then
			Talk(1, "", "C�c h� ch�a luy�n th�nh 10 c�p v� c�ng tr�n ph�i.");
			return 0
		end
	else
		if TopCheckSkill(20) == 0 then
			Talk(1, "", "C�c h� ch�a luy�n th�nh 20 c�p v� c�ng tr�n ph�i.");
			return 0
		end
	end
	
	local nCheck = 0
	if nIndex <= 599 then
		nCheck = LIB_Award:CheckMaterial(tbCondition1)
	else
		nCheck = LIB_Award:CheckMaterial(tbCondition2)
	end
	if nCheck == 0 then
		return 0
	end
--	if nIndex == 599 then
--		if GetTask(TSK_CS6_TULINH) ~= 4 then
--			Talk(1,"","C�c h� ch�a ho�n th�nh nhi�m v� C�ng Hi�n Qu�c Gia.")
--			return 0
--		end
--	end
	nCheck = 0
	if nIndex < 598 then
		nCheck = LIB_Award:CheckMaterial(tbMaterial1)
	elseif nIndex == 598 then
		if GetTask(TSK_CS6_TULINH) < 1 then
			Talk(1,"","��i hi�p ch�a nh�n nhi�m v� T� Linh Ph�c Sinh !!!!")
			return 0
		else
			nCheck = 1
		end
	elseif nIndex == 599 then 
		if GetTask(TSK_CS6_TULINH) ~= 4 then
			Talk(1,"","��i hi�p ch�a ho�n th�nh nhi�m v� C�ng Hi�n Qu�c Gia !!!!")
			return 0
		else
			nCheck = 1
		end
	elseif nIndex == 690 then 
		nCheck = LIB_Award:CheckMaterial(tbMaterial690)
	elseif nIndex > 690 and nIndex <= 695 then
		nCheck = LIB_Award:CheckMaterial(tbMaterial695)
	elseif nIndex == 696 then
		local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		if nGetQuest < 1 then
			Talk(1, "", "C�c h� ch�a nh�n nhi�m v� ph�c sinh b�n ��ng h�nh.")
			return
		end
		nCheck = LIB_Award:CheckMaterial(tbMaterial696)
	end
	if nCheck == 0 then
		return 0
	end
	SetTask(TSK_SINHTUVONGA1, GetTask(TSK_SINHTUVONGA1) + 1000000)
	
	
	if nIndex < 598 then
		LIB_Award:PayMaterial(tbMaterial1)
	elseif nIndex == 690 then 
		LIB_Award:PayMaterial(tbMaterial690)
	elseif nIndex > 690 and nIndex <= 695 then
		LIB_Award:PayMaterial(tbMaterial695)
	elseif nIndex == 696 then
		LIB_Award:PayMaterial(tbMaterial696)
	end
	
	LIB_Award:Award(tbLevelAward[nIndex])
	gf_WriteLogEx(szLogTitle, szLogAction, 1, "Ph�n th��ng CS"..floor(nIndex/100).." level "..mod(nIndex,100))
end

function MatTichCaoCap70(nSoluong)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nSoluong}, name ="Kim Cang B�t Nh� Ch�n Quy�n"}}},
		[4] = {item={{gdp={0,107,205, nSoluong}, name ="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[3] = {item={{gdp={0,107,206, nSoluong}, name ="V� Tr�n B� �� Ch�n Quy�n"}}},
		[6] = {item={{gdp={0,107,207, nSoluong}, name ="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] = {item={{gdp={0,107,208, nSoluong}, name ="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] = {item={{gdp={0,107,209, nSoluong}, name ="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[11] = {item={{gdp={0,107,210, nSoluong}, name ="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] = {item={{gdp={0,107,211, nSoluong}, name ="Qu� Thi�n Du Long Ch�n Quy�n"}}},
		[14] = {item={{gdp={0,107,212, nSoluong}, name ="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] = {item={{gdp={0,107,213, nSoluong}, name ="Qu�n T� ��i Phong Ch�n Quy�n"}}},
		[17] = {item={{gdp={0,107,214, nSoluong}, name ="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] = {item={{gdp={0,107,215, nSoluong}, name ="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] = {item={{gdp={0,107,216, nSoluong}, name ="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] = {item={{gdp={0,107,217, nSoluong}, name ="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] = {item={{gdp={0,107,218,nSoluong}, name ="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] = {item={{gdp={0,107,222,nSoluong}, name ="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] = {item={{gdp={0,107,223,nSoluong}, name ="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end

function TrangBiHaoNguyet()
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
	local tbVuKhiHaoNguyet = {
		[2] = {item={{gdp={0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao"}}},
		[4] = {item={{gdp={0,0,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�"}}},
		[3] = {item={{gdp={0,8,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng"}}},
		[6] = {item={{gdp={0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V�n Ki�p Th�nh Th� Ch�m"}}},
		[8] = {item={{gdp={0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name ="H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m"}}},
		[9] = {item={{gdp={0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m"}}},
		[11] = {item={{gdp={0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�"}}},
		[12] = {item={{gdp={0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Du Long ��a Kh�t C�n"}}},
		[14] = {item={{gdp={0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m"}}},
		[15] = {item={{gdp={0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�ch L�c Thi�n T�n B�t"}}},
		[17] = {item={{gdp={0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-C�m Thi�n ��u H�n Th��ng"}}},
		[18] = {item={{gdp={0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung"}}},
		[20] = {item={{gdp={0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Qu� X�c T� Th�n �ao"}}},
		[21] = {item={{gdp={0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Vu C�t ��c V��ng Tr�o"}}},
		[23] = {item={{gdp={0,2,8986,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-B�t ��ng Ch�n Ti�n Ki�m"}}},
		[29] = {item={{gdp={0,13,8990,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-T� V�n Ti�n T� Phi�n"}}},
		[30] = {item={{gdp={0,12,8991,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "H�o Nguy�t-Phi H� Ti�n T� �u Lan Ti�u"}}},
	}
	local tbTrangBiHaoNguyet = {
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
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiHaoNguyet[nRoute]
	LIB_Award:AwardByBody(tbAward)
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet)
end


function UpChanKhi(nLevel)
	if MeridianGetLevel() < nLevel then
		MeridianUpdateLevel()
	end
	AwardGenuineQi(20000)
	return 1
end

function Trao1NguLongTuongQuan_TrangBi(nItemLevel,nD)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,nD,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,nD,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,nD,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,nD,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,nD,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,nD,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,nD,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,nD,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function TrangBiDieuDuong1(nD)
	-- Thieu Lam
	local DieuDuong_TLD = {3128,3129}
	local DieuDuong_TLQ = {3130,3131}
	local DieuDuong_TLT = {3132,3133}
	local DieuDuong_DM = {3134,3135,3136,3137}
	--nga my
	local DieuDuong_NMK = {nil,nil,3138,3139}
	local DieuDuong_NMD = {nil,nil,3140,3141}
	
	-- Cai Bang
	local DieuDuong_CBQ = {3142,3143,3144,3145}
		
	local DieuDuong_CBB = {3146,3147,3148,3149}
		
	
	-- Vo Dang
	local DieuDuong_VDK = {3150,3151,3152,3153}
		
	local DieuDuong_VDB = {3154,3155,3156,3157}
		
	
	-- Duong Gia
	local DieuDuong_DGT = {3158,3159,3160,3161}
		
	local DieuDuong_DGC = {3162,3163,3164,3165}
		
	
	-- Ngu Doc
	local DieuDuong_5DD = {3166,3167,3168,3169}
		
	local DieuDuong_5DT = {3170,3171,3172,3173}
		
	
	-- Con Lon
	local DieuDuong_CLTS = {3174,3175}
		
	-- Thuy Yen
	local DieuDuong_TYVT = {nil,nil,3188,3189}

	local DieuDuong_TYLN = {nil,nil,3190,3191}

	local tbTrangBiDieuDuong = {
		[2] = DieuDuong_TLD,
		[3] = DieuDuong_TLT,
		[4] = DieuDuong_TLQ,
		[6] = DieuDuong_DM,
		[8] = DieuDuong_NMK,
		[9] = DieuDuong_NMD,
		[11] = DieuDuong_CBQ,
		[12] = DieuDuong_CBB,
		[14] = DieuDuong_VDK,
		[15] = DieuDuong_VDB,
		[17] = DieuDuong_DGT,
		[18] = DieuDuong_DGC,
		[20] = DieuDuong_5DD,
		[21] = DieuDuong_5DT,
		[23] = DieuDuong_CLTS,
		[29] = DieuDuong_TYVT,
		[30] = DieuDuong_TYLN,
	}
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local tbAward = {item={{gdp={0,nD,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,10}}}}
	LIB_Award:Award(tbAward)
end

function TrangBiDieuDuong()
	-- Thieu Lam
	local DieuDuong_TLD = {
		[1] = {item={
			{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� B�o"},
			{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� Trang"},
			{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� B�o"},
			{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� Trang"},
			{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� M�o"},}},
	}
	local DieuDuong_TLQ = {
		[1] = {item={
			{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� B�o"},
			{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
			{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� B�o"},
			{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
			{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� M�o"},}},
	}
	local DieuDuong_TLT = {
		[1] = {item={
			{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� B�o"},
			{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� Trang"},
			{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� M�o"},}},
		[2] = {item={
			{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� B�o"},
			{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� Trang"},
			{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� M�o"},}},
	}
	
	-- Duong Mon
	local DieuDuong_DM = {
		[1] = {item={
			{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
			{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
			{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},}},
	}
	
	-- Nga My
	local DieuDuong_NMK = {
		[3] = {item={
			{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Y"},
			{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
			{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Y"},
			{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
			{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"},}},
	}
	local DieuDuong_NMD = {
		[3] = {item={
			{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Y"},
			{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
			{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Y"},
			{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
			{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"},}},
	}
	
	-- Cai Bang
	local DieuDuong_CBQ = {
		[1] = {item={
			{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[2] = {item={
			{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[3] = {item={
			{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
			{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},}},
		[4] = {item={
			{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
			{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},}},
	}
	local DieuDuong_CBB = {
		[1] = {item={
			{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[2] = {item={
			{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[3] = {item={
			{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Trang"},
			{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t C�n"},}},
		[4] = {item={
			{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t Y"},
			{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng ��a Kh�t C�n"},}},
	}
	
	-- Vo Dang
	local DieuDuong_VDK = {
		[1] = {item={
			{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n B�o"},
			{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Trang"},
			{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},}},
	}
	local DieuDuong_VDB = {
		[1] = {item={
			{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},}},
		[3] = {item={
			{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},}},
		[4] = {item={
			{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
			{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
			{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},}},
	}
	
	-- Duong Gia
	local DieuDuong_DGT = {
		[1] = {item={
			{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},}},
		[2] = {item={
			{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},}},
		[3] = {item={
			{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},}},
		[4] = {item={
			{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
			{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
			{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},}},
	}
	local DieuDuong_DGC = {
		[1] = {item={
			{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[2] = {item={
			{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[3] = {item={
			{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},}},
		[4] = {item={
			{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
			{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
			{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},}},
	}
	
	-- Ngu Doc
	local DieuDuong_5DD = {
		[1] = {item={
			{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n C�n"},}},
		[2] = {item={
			{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n C�n"},}},
		[3] = {item={
			{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n C�n"},}},
		[4] = {item={
			{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Y"},
			{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n Trang"},
			{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n C�n"},}},
	}
	local DieuDuong_5DT = {
		[1] = {item={
			{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y C�n"},}},
		[2] = {item={
			{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y C�n"},}},
		[3] = {item={
			{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y C�n"},}},
		[4] = {item={
			{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Y"},
			{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y Trang"},
			{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Y C�n"},}},
	}
	
	-- Con Lon
	local DieuDuong_CLTS = {
		[1] = {item={
			{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"},
			{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
			{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"},}},
		[2] = {item={
			{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"},
			{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
			{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"},}},
	}
	
	-- Thuy Yen
	local DieuDuong_TYVT = {
		[3] = {item={
			{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Y"},
			{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
			{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Y"},
			{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
			{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Tr�m"},}},
	}
	local DieuDuong_TYLN = {
		[3] = {item={
			{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Y"},
			{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Qu�n"},
			{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Tr�m"},}},
		[4] = {item={
			{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Y"},
			{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Qu�n"},
			{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� Tr�m"},}},
	}
	local tbTrangBiDieuDuong = {
		[2] = DieuDuong_TLD,
		[3] = DieuDuong_TLT,
		[4] = DieuDuong_TLQ,
		[6] = DieuDuong_DM,
		[8] = DieuDuong_NMK,
		[9] = DieuDuong_NMD,
		[11] = DieuDuong_CBQ,
		[12] = DieuDuong_CBB,
		[14] = DieuDuong_VDK,
		[15] = DieuDuong_VDB,
		[17] = DieuDuong_DGT,
		[18] = DieuDuong_DGC,
		[20] = DieuDuong_5DD,
		[21] = DieuDuong_5DT,
		[23] = DieuDuong_CLTS,
		[29] = DieuDuong_TYVT,
		[30] = DieuDuong_TYLN,
	}
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiDieuDuong[nRoute]
	LIB_Award:AwardByBody(tbAward)
end


function VukhiDieuDuong()
	local tbVukhiDieuDuong = {
		[2]={item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� Ph�t �ao"}}},
		[4]={item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�"}}},
		[3]={item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng"}}},
		[6]={item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m"}}},
		[8]={item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m"}}},
		[9]={item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� C�m"}}},
		[11]={item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�"}}},
		[12]={item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Du Long ��a Kh�t C�n"}}},
		[14]={item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m"}}},
		[15]={item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�t"}}},
		[17]={item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Th��ng"}}},
		[18]={item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Cung"}}},
		[20]={item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n �ao"}}},
		[21]={item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Tr�o"}}},
		[23]={item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m"}}},
		[29]={item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Phi�n"}}},
		[30]={item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u"}}},
	}
	LIB_Award:AwardByRoute(tbVukhiDieuDuong)
end


function HoTroPhucSinh()
	if GetTask(TSK_CS6_TULINH) == 1 then
		SetTask(TSK_CS6_TULINH,2)
		TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
	end
end

function HoTroPhucSinh2()
	SetTask(TSK_CS6_DaoQuy_XoaQuy, 99999999)
	SetTask(TSK_CS6_SaMac_TamBao, 99999999)
	SetTask(TSK_CS6_KiemTien_DichTien, 99999999)
	SetTask(TSK_CS6_LiLong_HoaHo, 99999999)
end
-- Check level skill tr�n ph�i
function TopCheckSkill(nSkillLevel)
	tb_Skill_ID = {
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
	}
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;


function show_time()
	local nSinhTu_End = GetTime()
	local nDay = floor((5184000 - (nSinhTu_End - GetTask(TSK_SINHTUVONGA2))) / 86400)
	if nDay < 0 then
		nDay = 0
	end
	Msg2Player("Th�i gian nh�n th��ng c�a ho�t ��ng Sinh T� V� Ng� c�n : "..nDay.." ng�y")
	Talk(1, "", szNpcName.."Th�i gian nh�n th��ng c�a ho�t ��ng Sinh T� V� Ng� c�n : <color=green>"..nDay.." ng�y<color>")
end


function STVN_Active()
	if STVN_GetStatus() == 3 then
		Talk(1,"",szNpcName.."Nhi�m v� Sinh T� V� Ng� �� h�t h�n.")
		return 0
	end
	if STVN_GetStatus() == 2 then
		Talk(1,"",szNpcName.."Sinh T� V� Ng� �� k�ch ho�t, kh�ng c�n k�ch ho�t l�i.")
		return 0
	end
	if STVN_GetStatus() == 1 then
		if STVN_AllMissionComplete() ~= 1 then
			Talk(1,"",szNpcName.."C�c h� ch�a ho�n th�nh c�c nhi�m v� Sinh T� V� Ng�.")
			return 0
		end
		STVN_ActiveAward()
		return 1
	end
	Talk(1,"",szNpcName.."C�c h� ch�a nh�n nhi�m v� Sinh T� V� Ng�.")
	return 0
end


function STVN_ActiveAward()
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nAwardIndex = nChuyenSinh * 100 + GetLevel()
	if nAwardIndex >= 600 and nAwardIndex <= 679 then
		Talk(1,"",szNpcName.."C�p �� n�y kh�ng th� k�ch ho�t Sinh T� V� Ng�. C�c h� h�y ph�n ��u ��n ��ng c�p 80.")
		return 0
	end
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	
	local szSayHead = "Khi luy�n Sinh T� V� Ng�, c�c h� s� �o�n tuy�t qu� kh�, tr� th�nh ng��i ho�n to�n m�i. H�y ch�n l�i phe ph�i c�a m�nh."
	local tbSay = {}
	tinsert(tbSay, "Ta s� gia nh�p phe T�ng/#STVN_Active_Phe(1)")
	tinsert(tbSay, "Ta s� gia nh�p phe Li�u/#STVN_Active_Phe(2)")
	tinsert(tbSay, "Ta mu�n ngh� k� h�n/gf_DoNothing")
	Say(szSayHead, getn(tbSay), tbSay)
end


function STVN_Active_Phe(nPhe)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")
		return 0
	end
	if STVN_GetStatus() ~= 1 then
		Talk(1,"",szNpcName.."Tr�ng th�i hi�n t�i kh�ng th� k�ch ho�t, vui l�ng ki�m tra l�i.")
		return 0
	end
	if STVN_AllMissionComplete() ~= 1 then
		Talk(1,"",szNpcName.."C�c h� ch�a ho�n th�nh c�c nhi�m v� Sinh T� V� Ng�.")
		return 0
	end
	if gf_Judge_Room_Weight(16, 50," ") ~= 1 then
		Talk(1, "", "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
        	return 0
    end
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	if tRoute[nRoute] ~= 1 then
		Talk(1, "", "Ch�a gia nh�p h� ph�i, kh�ng th� tham gia ho�t ��ng n�y.");
		return 0
	end	
	local nCheck = STVN_time_remain()
	if nCheck == 0 then
		Msg2Player("�� h�t h�n k�ch ho�t Sinh T� V� Ng�.")
		Talk(1, "", szNpcName.."�� h�t h�n k�ch ho�t Sinh T� V� Ng�.")
		return 0
	end
	
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	local tSay = 	{
		"Ta mu�n tu luy�n theo h��ng Long T�!/#SinhTu_select_translife(1,"..nPhe..")",
		"Ta mu�n tu luy�n theo h��ng H� T�!/#SinhTu_select_translife(2,"..nPhe..")",
		"Ta mu�n tu luy�n theo h��ng �ng T�!/#SinhTu_select_translife(3,"..nPhe..")",
		"Ta mu�n tu luy�n theo h��ng Ph�ng T�!/#SinhTu_select_translife(4,"..nPhe..")",
		"Ta suy ngh� l�i ��./gf_DoNothing",
	}
	Say("<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end

function AddBigExp(nExp)
	if nExp > 2000000000 then
		Msg2Player("B�n �� nh�n ���c "..nExp.." �i�m kinh nghi�m !")
		gf_WriteLogEx("SINH TU VO NGA BK", "nh�n �i�m kinh nghi�m", nExp, "�i�m kinh nghi�m")
		for i=0,(floor(nExp/1000000000)) do
			ModifyExp(min(1000000000,nExp))
			nExp = nExp - min(1000000000,nExp)
		end
		
	end
end

--TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c�y t� linh, F = 160 c�y b�t nh� nh�, c = h��ng Ph�c Sinh, dd = s� l�n ph�c sinh, g = .....
--TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chu�i nhi�m v�), e = x�c ��nh c� PET Ph�c Sinh, dd = 30 l�n C�ng T�, cc = 30 l�n Tr� An, bb = 30 l�n Th�y L�i, aa = 3 l�n luy�n ��n
function HoTroPhucSinhPet()
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_A,160160,10,5)
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_B,3303030,10,3)
	Msg2Player("B�n �� ho�n th�nh giai �o�n 1 nhi�m v� ph�c sinh b�n ��ng h�nh")
end



function SinhTu_select_translife(nType, nPhe)
	local nCountCS = GetTranslifeCount()	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(11,500) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	local nLevel = GetLevel()
	local nChuyenSinh = GetTranslifeCount() + GetPlayerRebornParam(0)
	local nAwardIndex = nChuyenSinh * 100 + GetLevel()
	if nAwardIndex >= 600 and nAwardIndex <= 679 then
		Talk(1,"",szNpcName.."C�p �� n�y kh�ng th� k�ch ho�t Sinh T� V� Ng�. C�c h� h�y ph�n ��u ��n ��ng c�p 80.")
		return 0
	end
	local nIndex = 1
	if nChuyenSinh == 5 and nLevel == 99 then
		nIndex = 2
	end
	local nCheck = LIB_Award:CheckMaterial(tbActiveFee[nChuyenSinh][nIndex])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbActiveFee[nChuyenSinh][nIndex])
	STVN_SetStatus(2) -- Set status Sinh Tu Vo Nga (2=kich hoat)
	ModifyReputation(-GetReputation(),0) --set �i�m danh v�ng v� 1
	ModifyReputation(1,0)
	SetTask(336, 1) --set �i�m s� m�n v� 1
	if nPhe == 1 then
		SetTask(701, 1)
	else
		SetTask(701, -1)
	end
	--=== Clear qu�n c�ng b�o l�u ====
	SetTask(2150, 0)
	SetTask(2151, 0)
	--==== Reset task nhiem vu de dung lai =======
	SetTask(TSK_SINHTUVONGA1,0)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)	
	--===================================
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	if nAwardIndex > 598 then
		VNG_SetTaskPos(TSK_SINHTUVONGA1,9,8,7)
		local tbAward = {
			item={
				{gdp={2,1,9977,3}, nExpired = 30 * 24 * 3600}, -- chien cong huy hoang
				{gdp={2,1,30408,3}}, --thien huyen khac ban
			},
			nChankhi = 49000,
			fn ="VukhiDieuDuong()",
		}
		LIB_Award:Award(tbAward)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,2,9,9) -- Set status Sinh Tu Vo Nga (2=kich hoat)
		-- Reset task nhiem vu de dung lai
		PlayerReborn(1,nType)
		
		if nAwardIndex >= 680 then
			local nType_cs6 = GetPlayerRebornParam(1)
			for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
				P = P + GetBody() - 1
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			end
			local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
			local nPVanSu = tbVanSu[4]  + GetBody() - 1
			for i = 0, 2 do
				BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
			end
			SetLevel(80,0)
		else
			local nType_cs5 = GetTranslifeFaction()	
			local nTransCount = GetTranslifeCount()	
			local nRoute = GetPlayerRoute()
			for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
				P = P + GetBody() - 1
				Pnew = 30000 + GetBody()
				Pnew1 = 561 + GetBody()			
				Pnew2 = 565 + GetBody()		
				lvatt3 = lvatt3 or 0
				att3 = att3 or 0
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
				BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
				BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
				BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
			end
			RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	
			AddTitle(61,05)
			local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
			local nPVanSu = tbVanSu[4]  + GetBody() - 1
			for i = 0, 2 do
				BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
			end
			gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
			SetLevel(10,0)
			ModifyExp(-GetExp())
		end
		DoWait(15,15,10)
	else
		local nRoute = GetPlayerRoute()
		-- Set s� l�n chuy�n sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5)
		-- Set h��ng chuy�n sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
		local nTransCount = GetTranslifeCount()
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 37)
		ResetProperty()
		Msg2Player("�ang truy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> v��t qua th� th�ch Long Quang Ch�n Nh�n, ���c truy�n th� 8 th�nh <color=green>H�n Nguy�n C�ng<color> theo  h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color>!")
	--		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
	-- �p d�ng c�c �i�u ki�n c�a Sinh T� V� Ng�
		SetLevel(90,0)
		ModifyExp(-GetExp()) --set �i�m kinh nghi�m v� 0
		local tbAward = {
			item={{gdp={0,200,40,1}, nExpired=30*24*3600}},
			fn="MatTichCaoCap70(6);MatTichTranPhai();"
		}
		LIB_Award:Award(tbAward)
		DoWait(15,15,10)
	end
end


function STVN2_TienDoNhiemVu()
	local szMsg = szNpcName.."Ti�n �� ho�n th�nh Sinh T� V� Ng�:\n"
	for i=1, getn(tbSTVNconfig) do
		szMsg = szMsg .. tbSTVNconfig[i][2]..": c�n <color=red>".. VNG_GetTaskPos(tbSTVNconfig[i][1],tbSTVNconfig[i][4],tbSTVNconfig[i][5]) .."<color> l�n.\n"
	end
	Talk(1,"",szMsg)
end


function MatTichTranPhai()
	local tbMatTich = {
		[2] = {item={{gdp={0, 112, 101, 1}}}},
		[4] = {item={{gdp={0, 112, 102, 1}}}},		
		[3] = {item={{gdp={0, 112, 103, 1}}}},		
		[6] = {item={{gdp={0, 112, 104, 1}}}},		
		[8] = {item={{gdp={0, 112, 105, 1}}}},		
		[9] = {item={{gdp={0, 112, 106, 1}}}},		
		[11] = {item={{gdp={0, 112, 107, 1}}}},		
		[12] = {item={{gdp={0, 112, 108, 1}}}},		
		[14] = {item={{gdp={0, 112, 109, 1}}}},		
		[15] = {item={{gdp={0, 112, 110, 1}}}},		
		[17] = {item={{gdp={0, 112, 111, 1}}}},		
		[18] = {item={{gdp={0, 112, 112, 1}}}},		
		[20] = {item={{gdp={0, 112, 113, 1}}}},		
		[21] = {item={{gdp={0, 112, 114, 1}}}},
		[23] = {item={{gdp={0,112,192,1}}}},
		[29] = {item={{gdp={0,112,196,1}}}},
		[30] = {item={{gdp={0,112,197,1}}}},
	}
	local nRoute = GetPlayerRoute()
	LIB_Award:Award(tbMatTich[nRoute])
end