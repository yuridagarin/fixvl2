-- by windle 2009-2-13 15:18
--====Edit by PhucNG 8-10-2014=======

--Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\longhu\\prize.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online\\viet_event\\vng_task_control.lua") 
Include("\\script\\online\\chuyen_sinh\\translife_head.lua") 
szNPCName = "<color=green>Long H� S�<color>: "
TASKTEMP_BHTA9 = 118

--tbExpBonusBHTA9 = {
--	[1] = 100000000,
--	[2] = 200000000,
--	[3] = 300000000,
--	[4] = 400000000,
--	[5] = 600000000,
--	[6] = 700000000,
--	[7] = 800000000,
--}

tTongList = {
	[03] = {"�T�M�."},
	[62] = {"�0keBaBy"},
	[16] = {"H�ngTh�t"},
	[24] = {"-Ng�Long"},
	[01] = {"-��Hotel"},
	[11] = {"_.��zN�z"},
	[66] = {"-H�i*T�"},
	[20] = {"-Long�H�"},
	[22] = {"Holywar"},
	[25] = {"Ngh� S�"},
	[33] = {"��M�tTr�"},

}

tbBangHoiTA12 = {
	[3] = {"Li�nMinh"},
	[8] = {"Google"},
	[9] = {"*M�*"},
	[15] = {"�Quy��n�"},
	[24] = {"-Ng�Long"},
	[50] = {"-H�i*T�"},
	[11] = {"�Family"},
	[22] = {"Holywar"},
	[33] = {"��M�tTr�"},
}

tbNguyenLieuVote = {
	--PhucNG [1]=ID Item, [2]= Item Name, [3]= Vote Point, [4] = EXP
	[1] = {{2,1,30737,1}, "Hoa H�ng ��", 1, 0 },
	[2] = {{2,1,30738,1}, "Hoa H�ng V�ng", 2, 0 },
}

tbCCHH = {
	{1,297, "T�y T�y ��n",{2,0,136,2},30 * 24 *3600},
	{1,200,"T�y T�y Linh ��n",{2,0,137,1},30 * 24 *3600},
	{1,200,"B�t B�o T�y T�y ��n",{2,0,138,1},30 * 24 *3600},
	{1,1,"Thi�n th�ch linh th�ch",{2,1,1068,1},7 * 24 * 3600},
	{1,1,"��nh H�n Thi�n Th�ch Th�n Th�ch",{2,1,1067,1},7 * 24 * 3600},
	{1,1,"T�i thi�n th�ch tinh th�ch",{2,1,3356,1},7 * 24 * 3600},
	{1,800,"Ng� Hoa T� Nguy�n T�n(s�c m�nh)",{1,0,261,2},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (n�i c�ng)",{1,0,262,2},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (g�n c�t)",{1,0,263,2},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (th�n ph�p)",{1,0,264,2},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (nhanh nh�n)",{1,0,265,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (l�c c�n)",{1,0,266,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (l�c th�n)",{1,0,267,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (l�c ��ng)",{1,0,268,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (l�c n�i)",{1,0,269,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (n�i c�n)",{1,0,270,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (n�i th�n)",{1,0,271,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (n�i ��ng)",{1,0,272,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (th�n c�n)",{1,0,273,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (th�n ��ng)",{1,0,274,2},0},
	{1,400,"Th�t Hoa T� Nguy�n T�n (��ng c�n)",{1,0,275,2},0},
	{1,300,"Minh Nguy�t D�",{1,1,17,2},0},
	{1,300,"T�y B�c V�ng",{1,1,19,2},0},
	{1,300,"B�nh B�t v�ng",{1,1,15,2},0},
	{1,100,"B�nh �t B�t B�o",{2,1,1123,2},0},
	{1,100,"B�nh �t ch�n g�",{2,1,1124,2},0},
	{1,100,"B�nh �t H��ng Ng�i",{2,1,1125,2},0},	
}


function jybh_check_skill_level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


function main()
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate > 120415 then
--		Talk(1,"","<color=green>Long H� S�<color>: Ho�t ��ng Bang H�i Tinh Anh �� k�t th�c.");
--		return
--	end

--	if beadroll.tongName == "" then
--		beadroll:load()
--	end
	
	local tSel = {}
	if nDate <= 20140905 then
 		tinsert(tSel, "Nh�nh mi�n B�c - ��ng k� thi ��u Long Tranh H� ��u 3/FormDangKyTeamHN")
		tinsert(tSel, "Nh�nh mi�n Nam - ��ng k� thi ��u Long Tranh H� ��u 3/FormDangKyTeamHCM")
 	end
-- 	if nDate <= 20140815 then
-- 		tinsert(tSel, "Ta mu�n ��ng k� tranh t�i Long Tranh H� ��u/ThiDauOffLine_DangKy_Form")
-- 	end
	if nDate == 20130605 then
		tinsert(tSel, "Nh�n th��ng kinh nghi�m Bang H�i Tinh Anh/ExpBonusBHTA9")
	end
	
	--========== N�p Tinh Anh L�nh K� ==========--
	if nDate >= 20141008 and nDate <= 20141022 then
		tinsert(tSel, "T�m hi�u th�ng tin ��ng k� gi�i ��u Bang H�i Tinh Anh	/#about(1)")
		tinsert(tSel, "Nh�n Tinh Anh L�nh K�/getFlags")
		tinsert(tSel, "N�p Tinh Anh L�nh K�(th�nh vi�n th��ng)/#giveFlag(1)")
		tinsert(tSel, "N�p Tinh Anh L�nh K�(Nguy�n so�i)/#giveFlag(2)")
		tinsert(tSel, "Xem danh s�ch ��ng k� thi ��u/viewList")
--		tinsert(tSel, "������ȡxxxx����/getAward")
	end
	
	--========== B�nh ch�n BHTA 12 ==============--
	if nDate >= 20141006 and nDate <= 20141012 then
		tinsert(tSel,"B�nh ch�n Bang H�i Tinh Anh 12/BinhChonBHTA_CC_Form")
		tinsert(tSel,"Xem s� l��t b�nh ch�n bang h�i/ViewVote")
		-- tinsert(tSel,"B�nh ch�n bang h�i gi�i Si�u C�p/BinhChonBHTA_SC_Form")
	end
--================ ��ng k� BHTA 12	
	if nDate >= 20141003 and nDate <= 20141005 then
		tinsert(tSel,"��ng k� tham gia Bang H�i Tinh Anh 12/DangKyThamGiaBHTA_Form")
		tinsert(tSel,"Ta mu�n xem t�nh h�nh b�o danh Bang H�i Tinh Anh 12/#DangKyThamGiaBHTA_view(1)")
--		tinsert(tSel,"Ta mu�n xem t�nh h�nh b�o danh Bang h�i Si�u C�p/#DangKyThamGiaBHTA_view(2)")
	end
	
	tinsert(tSel, "Ta ch� gh� th�m th�i!/nothing")
	Say("<color=green>Long H� S�<color>: Ta chuy�n ph� tr�ch gi�i ��u Bang H�i Tinh Anh, c�c h� c�n h�i ta vi�c g�?", getn(tSel), tSel);

end


function DangKyThamGiaBHTA_Form()
	local nChuyenSinh = GetPlayerRebornParam(0)
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNPCName.."C�c h� ch�a gia nh�p h� ph�i.")
		return 0
	end
	
--	if GetLevel() < 79 then
--		Talk(1,"",szNPCName.."C�c h� h�y ph�n ��u ��t c�p �� 79, sau �� h�y ��n g�p ta.")
--		return 0
--	end
	
	if nChuyenSinh < 1 then
		Talk(1,"",szNPCName.."C�c h� h�y ph�n ��u ��t c�p �� chuy�n sinh 6, sau �a h�y ��n g�p ta.")
		return 0
	end
	
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNPCName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	
	if GetTongLevel() < 5 then
		Talk(1,"",szNPCName.."Bang h�i c�c h� ch�a ��t ��n c�p 5, kh�ng th� ��ng k�.")
		return 0
	end
	
	if gf_GetTaskByte(2280,1) ~= GetGlbValue(1023) then
		Talk(1,"",szNPCName.."C�c h� kh�ng ph�i th�n d�n b�n qu�c, kh�ng ���c ��ng k� tham gia.")
		return 0
	end
	
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < 43200   then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 1 ng�y, kh�ng th� ��i di�n bang h�i ��ng k�.")
		return 0
	end
	
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n b�o danh tham gia v�ng server/#DangKyThamGiaBHTA_Confirm(1)")
--	tinsert(tbSay, "Ta mu�n b�o danh BHTA si�u c�p/#DangKyThamGiaBHTA_Confirm(2)")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szNPCName.."Gi�i ��u Bang H�i Tinh Anh s�p b�t ��u kh�i tranh, ��i hi�p h�y nhanh ch�ng ��n b�o danh cho bang h�i c�a m�nh !!!!", getn(tbSay), tbSay);
end


function DangKyThamGiaBHTA_Confirm(nOption)
	local tbGiai = {CAOCAP = "Thi�n H� V� Song", SIEUCAP = "Si�u c�p"}
	local szTong = GetTongName()
	local szTongLevel = GetTongLevel()
	local szAcc = GetAccount()
	local szRole = GetName()
	local szGiai = "CAOCAP"
	local nPhucSinh = GetPlayerRebornParam(0)
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	-- if nOption > 1 then
		-- szGiai = "SIEUCAP"
	-- end
	
	if szTong == "" or szTong == nil then
		return 0
	end
	
	local tbMaterial = {
		[1] = {item={{gdp={2,1,539,5}, name="��i h�ng bao ho�ng kim"}}},
		-- [2] = {item={{gdp={2,1,539,48}, name="��i h�ng bao ho�ng kim"}}},
	}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbMaterial[nOption])
	if nCheck == 0 then
		return 0
	end
	
	LIB_txtData:Init("danhsachbhta12.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng ���c ��ng k� th�m l�n n�a.")
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[nOption])
--	local szLogAward = szTong.."	"..szTongLevel.."	"..szAcc.."	"..szRole.."	"..szGiai.."	"..date("%Y-%m-%d %H:%M:%S")
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	"..GetLevel().."	"..nPhucSinh.."	"..nPhe.."	"..date("%Y-%m-%d %H:%M:%S")
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNPCName.."Bang h�i c�c h� b�o danh BHTA 12 th�nh c�ng, xin ch�c m�ng.")
	AddGlobalNews("Ch�c m�ng bang h�i "..szTong.." b�o danh th�nh c�ng Bang H�i Tinh Anh 12.")
end


function DangKyThamGiaBHTA_view(nOption)
	local nTongLevel = IsTongMember() or 0
	local szTong = GetTongName()
	local nTongRegisgter = getn(LIB_txtData.tbTextData) or 0
	local tbSayDialog = szNPCName .. "Hi�n t�i c� " .. nTongRegisgter .. " bang h�i ��ng k� tham gia Bang H�i Tinh Anh 12 \n"
	if nTongLevel < 1 then
		Talk(1, "",szNPCName.."C�c h� ch�a gia nh�p bang h�i, kh�ng th� xem t�nh h�nh ��ng k�.");
		return 0
	end	
	
	LIB_txtData:Init("danhsachbhta12.txt")
	LIB_txtData:LoadMultiColumn()
	
	if (nTongRegisgter == nil or nTongRegisgter == 0) then
		Talk(1,"","Hi�n t�i ch�a c� bang h�i n�o ��ng k� tham gia")
	else
		for i = 1, nTongRegisgter do
			tbSayDialog = tbSayDialog .. LIB_txtData.tbTextData[i][1] .. ", "
		end
		Talk(1,"",tbSayDialog)
	end
	
	-- local nCountCC, nCountSC, szListCC, szListSC = 0, 0, "", ""
	-- local tbGiai = {CAOCAP = "Thi�n H� V� Song", SIEUCAP = "Si�u c�p"}
	-- local nCheck = 0
	-- local szGiai = ""
--	for i=1, getn(LIB_txtData.tbTextData) do
--		if LIB_txtData.tbTextData[i][1] == szTong then
--			nCheck = i
--			szGiai = LIB_txtData.tbTextData[i][7]
--			break
--		end
--	end
	-- for i=1, getn(LIB_txtData.tbTextData) do
		-- if LIB_txtData.tbTextData[i][7] == "CAOCAP" then
			-- nCountCC  = nCountCC  + 1
			-- szListCC = szListCC .. LIB_txtData.tbTextData[i][1] .. ", "
		-- else
			-- nCountSC  = nCountSC  + 1
			-- szListSC = szListSC .. LIB_txtData.tbTextData[i][1] .. ", "
		-- end
	-- end
	-- if nOption == 1 then
		-- if nCountCC == 0 then
			-- Talk(1,"",szNPCName.."Ch�a c� bang h�i n�o tham gia � gi�i Cao c�p.")
			-- return 0
		-- end
		-- Talk(1,"",szNPCName.."Hi�n t�i �� c� "..nCountCC.." bang h�i ��ng k� gi�i Cao c�p g�m: "..szListCC)
	-- else
		-- if nCountSC == 0 then
			-- Talk(1,"",szNPCName.."Ch�a c� bang h�i n�o tham gia � gi�i Si�u c�p.")
			-- return 0
		-- end
		-- Talk(1,"",szNPCName.."Hi�n t�i �� c� "..nCountSC.." bang h�i ��ng k� gi�i Si�u c�p g�m: "..szListSC)
	-- end	
--	if nCheck ~= 0 then
--		Talk(1,"",szNPCName.."Bang h�i c�a c�c h� �� ��ng k� th�nh c�ng � gi�i "..tbGiai[szGiai]..".")
--	end
	
end


function show()
	local tSel = {}
	tinsert(tSel, "Xem k�t qu� b�nh ch�n gi�i Si�u C�p/#show_list7(1)")
	tinsert(tSel, "Xem k�t qu� b�nh ch�n gi�i Cao C�p/#show_list7(2)")

	Say("<color=green>Long H� S�<color>: Ta chuy�n ph� tr�ch gi�i ��u Bang H�i Tinh Anh, c�c h� c�n h�i ta vi�c g�?", getn(tSel), tSel);	
end


function about(page)
	local msgs = {
		{
		"<color=green>Long H� S�<color>: T� <color=yellow>20-10-2014 ��n h�t 22-10-2014<color>, c�c bang ch� c�a bang h�i ��i di�n cho m�i c�m m�y ch� c� th� ��n g�p Long S� �� nh�n 42 <color=red>Tinh Anh L�nh K�<color>.\n",
		"Bang ch� c� tr�ch nhi�m ph�n ph�t <color=red>Tinh Anh L�nh K�<color>cho c�c th�nh vi�n tham gia gi�i ��u Bang H�i Tinh Anh. C�c th�nh vi�n c�a bang h�i khi ��ng k� ph�i c� �t nh�t 1 <color=red>Tinh Anh L�nh K�<color> trong h�nh trang c�a m�nh, v� ph�i gia nh�p Bang �t nh�t 3 ng�y.\n",   
		},
		{
		"Ch� �: \n",
		" - Ch� c� bang ch� c�a bang h�i ��i di�n cho m�i m�y ch� m�i c� th� nh�n Tinh Anh L�nh K� \n",                         
		" - M�i bang h�i ch� c� th� nh�n t�i �a 42 Tinh Anh L�nh K� t� Long H� S�.\n",
		},                         
		{
		" - M�i Tinh Anh L�nh K� l� 1 t�m v� �� ��ng k� tham gia gi�i ��u Bang H�i Tinh Anh. V� v�y, bang ch� ph�i c� tr�ch nhi�m khi ph�n ph�t Tinh Anh L�nh K� cho c�c th�nh vi�n tham gia thi ��u gi�i\n",         
		" - Khi n�p th�nh c�ng 1 Tinh Anh L�nh K� cho Long H� S�, h� th�ng s� t� ��ng ghi nh�n c�c th�ng tin c�a nh�n v�t\n",                
		" - Danh s�ch nh�n v�t n�p Tinh Anh L�nh K� l� danh s�ch ��i di�n cho m�y ch� tham gia thi ��u gi�i Bang H�i Tinh Anh\n",                
		" - M�i nh�n v�t ch� c� th� n�p t�i �a 1 Tinh Anh L�nh K� cho Long H� S�.\n",                        
		},
	}
	local tCallback = {"#about(2)","#about(3)", "main"};
	local msg = "";
	for k,v in msgs[page] do
		msg = msg .. v;
	end
	Talk(1, tCallback[page], msg);
end

function getFlags()
	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbBangHoiTA12[nServerID] == nil or tbBangHoiTA12[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	local nTongMember = IsTongMember()
	if nTongMember ~= 1 then
		Talk(1, "", szNPCName.."Ch� c� bang ch� c�a bang h�i ��i di�n cho m�y ch� m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>");
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,200," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang!")
   		return 0
	end
--	local nJoinTime = GetJoinTongTime();	
--	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
--	if nDayCount <  7 and szName ~= "__MyLove" then
--		Talk(1,"","Th�i gian gia nh�p c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng tu�n n�y!")
--		return 0
--	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < 604800   then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		return 0
	end
	
	local nCountTALK = gf_GetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK)
	if nCountTALK >= 42 then
		Talk(1,"",szNPCName.."C�c h� �� nh�n �� 42 Tinh Anh L�nh K�!")
		return 0
	end	
	
	gf_AddItemEx2({2,0,30000,1}, "Tinh Anh L�nh K�", "Bang Hoi Tinh Anh 12", "nh�n", 3 * 24 * 3600)
	gf_SetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK, nCountTALK + 1)
	main()
end

function giveFlag(nChoice)

	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szPhe = "Tong"
	
	--Check s� l�n Chuy�n sinh
	if GetTranslifeCount() < 5 then
		Talk(1,"",szNPCName.."C�c h� ch�a ��t chuy�n sinh 5 tr� l�n. H�y luy�n th�m r�i quay l�i ��y")
		return 0
	end	
	
	--Check Level
	if GetTranslifeCount() == 5 and GetPlayerRebornParam(0) < 1 and GetLevel() < 96 then
		Talk(1,"",szNPCName.."C�c h� ch�a �� tr�nh �� �� tham gia. H�y luy�n th�m r�i quay l�i ��y")
		return 0
	end		
	
	--� trong bang h�i �t nh�t 3 ng�y
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  1  then
		Talk(1,"",szNPCName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1 ng�y, n�n kh�ng th� n�p Tinh Anh L�nh K� ���c!")
		return 0
	end	
	--Get Phe Tong Lieu
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	--Check �� ��ng k� ch�a
	if gf_GetTaskByte(TASK_BHTA6, 3) == 1 then
		Talk(1,"",szNPCName.."C�c h� �� ��ng k� r�i, kh�ng th� ��ng k� th�m n�a.")
		return 0
	end
	--C� tinh anh l�nh k� kh�ng?
	if GetItemCount(2,0,30000) == 0 then
		Talk(1,"",szNPCName.."C�c h� l� ai? Trong tay kh�ng c� Tinh Anh L�nh K�, ch� ��n xem n�o nhi�t �?")
		return 0
	end
	--C� trong danh s�ch bang h�i tham gia kh�ng?
	if tbBangHoiTA12[nServerID] == nil or tbBangHoiTA12[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	--C� c�ng qu�c t�ch v�i server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."Ch� c� ng��i c�ng qu�c t�ch m�i c� th� n�p <color=red>Tinh Anh L�nh K�<color>")
		return
	end
	-------------
	-- if jybh_check_skill_level() ~= 1 then
		-- Talk(1,"","<color=green>Long H� S�<color>: C�c h� ch�a �� c�c �i�u ki�n c�n thi�t �� tham gia gi�i ��u Bang H�i Tinh Anh");
		-- return
	-- end	
	-------------
	
	--Check ��ng k� v� s� l��ng �� ��ng k�
	LIB_txtData:Init("BaoDanhBHTA12.txt")
	LIB_txtData:LoadMultiColumn()
	local nMember = 0
	local nRegCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		nMember = nMember + 1
		if LIB_txtData.tbTextData[i][1] == GetAccount() then
			nRegCheck = 1
		end
	end
	if nRegCheck == 1 then
		Talk(1,"",szNPCName.."C�c h� �� c� t�n trong danh s�ch thi ��u, kh�ng c�n ��ng k� n�a nh�.")
		return 0
	end
	if nMember >= 42 then
		Talk(1,"",szNPCName.."Ta �� c� trong tay danh s�ch 42 ng��i tham d�, r�t ti�c c�c h� �� ��n tr�...")
		return 0
	end
	
	--Check S� l��ng h� ph�i �� ��ng k�
	local nHePhai = GetPlayerRoute()
	LIB_txtData:Init("CheckRouteBHTA12.txt")
	LIB_txtData:LoadData()
	local nRouteCount = LIB_txtData.tbTextData[tonumber(nHePhai )]
	if nRouteCount >= 5 then
		Talk(1, "", szNPCName.."�� �� 5 cao th� thu�c h� ph�i nh� c�c h�, kh�ng th� ��ng k� th�m!");
		return 0
	end
	
	--Check ��ng k� d�nh cho Nguy�n So�i
	local nTeamSize = GetTeamSize()
	local nCountNguyenSoai = 0
	LIB_txtData:Init("BaoDanhBHTA12.txt")
	LIB_txtData:LoadMultiColumn()
	if nChoice == 2 then
		--Check so luong Nguyen Soai �� ��ng k�
		for i = 1, getn(LIB_txtData.tbTextData) do
			if LIB_txtData.tbTextData[i][6] == "NguyenSoai" then
				nCountNguyenSoai = nCountNguyenSoai + 1
			end
		end
		
		if nCountNguyenSoai >= 2 then
			Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� �� 2 Nguy�n So�i.")
			return 0
		end
		
		--Check t� ��i v�i bang ch� khi ��ng k�
		if nTeamSize > 3 then
			Talk(1,"",szNPCName.."T� ��i ch� ���c t�i �a 3 ng��i v�i t�i �a 2 ng��i s� h�u trang b� Nguy�n So�i")
			return 0
		else
			if IsTongMaster() == 0 then
				local nOldIndex = PlayerIndex
				local nTongMaster = 0
				for i = 1, nTeamSize do
					PlayerIndex = GetTeamMember(i)
					if IsTongMaster() == 1 then
						nTongMaster = 1
						break
					end
				end
				PlayerIndex = nOldIndex
				
				if nTongMaster == 0 then
					Talk(1,"",szNPCName.."C�c h� c�n t� ��i v�i bang ch�")
					return 0
				end		
			end
		end
	end	
	
	----------------------------------
	if DelItem(2,0,30000,1) == 1 then
		gf_SetTaskByte(TASK_BHTA6, 3, 1) -- Set �� ��ng k�
		LIB_txtData:Init("CheckRouteBHTA12.txt")
		LIB_txtData:LoadData()
		LIB_txtData:AddValue(tonumber(nHePhai),1) -- Write log s� l��ng c�c h� ph�i
		
		LIB_txtData:Init("BaoDanhBHTA12.txt")
		LIB_txtData:LoadMultiColumn()
		
		local szData
		if nChoice == 1 then
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szPhe .. "	".."Thuong"
		else
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szPhe .. "	".."NguyenSoai"
		end
		
		LIB_txtData:AddLine(szData)
		local nRet, nItem = gf_AddItemEx({2,0,30001,1,1},"V� l�m th�p nh� s�");
		gf_SetItemExpireTime(nItem, 2014,11,30,24);		
		WriteLogEx("BHTA12 "..GetName(),"nh�n",1,"V� l�m th�p nh� s�","",GetTongName())
		Talk(1, "", szNPCName.."Ch�c m�ng ��i hi�p �� b�o danh Bang H�i Tinh Anh l�n 12 th�nh c�ng. H�y c� g�ng l�n nh�!");
		Msg2Global("Ch�c m�ng ��i hi�p "..GetName().." �� b�o danh Bang H�i Tinh Anh l�n 12 th�nh c�ng.")
		AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh l�n 12<color> th�nh c�ng.")
	end
	
	-- beadroll:addPlayer();
end

function viewList()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szTong = tbBangHoiTA12[nServerID][1]  or ""
	if szTong == "" then
		return 0
	end
	LIB_txtData:Init("BaoDanhBHTA12.txt")
	LIB_txtData:LoadMultiColumn()
	local szList = ""
	local nCount = 0
	for i=1, getn(LIB_txtData.tbTextData) do
			szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
			nCount = nCount + 1
	end
	Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
end

--======================== Binh chon giai cao cap ========================
function BinhChonBHTA_CC_Form()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	if GetLevel() < 79 then
		Talk(1,"", szNPCName.."C�p �� 79 m�i ���c quy�n b�nh ch�n, c�c h� h�y ph�n ��u th�m nh�.")
		return 0
	end
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local tbSay = {}
		
	tbSay[0] = szNPCName.."C�c h� h�y b�nh ch�n bang h�i ��i di�n qu�c gia tham gia thi ��u."
	if tbBangHoiTA12[nServerID] ~= nil then		
		tinsert(tbSay,"B�nh ch�n cho bang "..tbBangHoiTA12[nServerID][1].."/#BinhChonBHTA_CC_Step2(1)")		
	else
		tinsert(tbSay,"Kh�ng c� bang h�i n�o ��ng k� tham gia/gf_DoNothing")
	end	
	
	gf_PageSay(tbSay, 1, 6);
end

function ViewVote()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)

	LIB_txtData:Init("binhchonbhta12.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = LIB_txtData.tbTextData[1][2]
	
	if tbBangHoiTA12[nServerID] ~= nil then
		Talk(1,"", szNPCName.."Bang h�i "..tbBangHoiTA12[nServerID][1].." �� c� "..nCount.." �i�m t�ch l�y ")
	else	
		Talk(1,"","Ch�a c� bang h�i n�o ���c b�nh ch�n")
	end	
end

function BinhChonBHTA_CC_Step2(nBang)
	local nW, nX, nY = GetWorldPos()
	local nBangHoi = nBang
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	
	local nVoteBHTA12 = GetTask(TSK_CUOCCHIENHOAHONG)
	if nVoteBHTA12 >= 1000 then
		Talk(1,"",szNPCName.."C�c h� �� b�nh ch�n �� s� l��ng c�a ng�y h�m nay. Xin vui l�ng quay l�i ng�y h�m sau �� b�nh ch�n ti�p")
		return 0
	end
	
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
--	SetTaskTemp(TASKTEMP_BHTA9, nBangHoi)
	tinsert(tbSay, "Hoa H�ng ��: 1 �i�m/#BinhChonBHTA_Step3(1)")
	tinsert(tbSay, "Hoa H�ng V�ng: 2 �i�m/#BinhChonBHTA_Step3(2)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."C�c h� mu�n b�nh ch�n cho bang "..tbBangHoiTA12[nServerID][1].." b�ng h�nh th�c n�o?", getn(tbSay), tbSay)
end

--===========================================================================================

function BinhChonBHTA_SC_Form()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	if GetLevel() < 79 then
		Talk(1,"", szNPCName.."C�p �� 79 m�i ���c quy�n b�nh ch�n, c�c h� h�y ph�n ��u th�m nh�.")
		return 0
	end
	local nServerID = GetGlbValue(1023)
	if tbBangSieuCap[nServerID] == nil then
		Talk(1,"","Kh�ng c� bang h�i n�o ��ng k� gi�i Si�u c�p.")
		return 0
	end
	local tbSay = {}
	LIB_txtData:Init("binhchonsc.txt")
	LIB_txtData:LoadData()
	
	tbSay[0] = szNPCName.."C�c h� h�y b�nh ch�n bang h�i ��i di�n qu�c gia tham gia thi ��u."
	if tbBangSieuCap[nServerID] ~= nil then
		for i=1,getn(tbBangSieuCap[nServerID]) do
			tinsert(tbSay,"- "..tbBangSieuCap[nServerID][i]..": ".. LIB_txtData.tbTextData[i] .." l��t/#BinhChonBHTA_SC_Step2("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6);
end

function BinhChonBHTA_SC_Step2(nBang)
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	SetTaskTemp(TASKTEMP_BHTA9, nBang)
	tinsert(tbSay, "2 Xu v�t ph�m: 1 �i�m/#BinhChonBHTA_Step3(1,2)")
	tinsert(tbSay, "10  v�ng: 1 �i�m/#BinhChonBHTA_Step3(2,2)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."C�c h� mu�n b�nh ch�n cho bang "..tbBangSieuCap[nServerID][nBang].." b�ng h�nh th�c n�o?", getn(tbSay), tbSay)
end
--================================================

function BinhChonBHTA_Step3(nOption)
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	local tbDanhSachBang = {}
	local nServerID = GetGlbValue(1023)
	
	if type(tbNguyenLieuVote[nOption][1]) == "table" then
		if GetItemCount(tbNguyenLieuVote[nOption][1][1], tbNguyenLieuVote[nOption][1][2], tbNguyenLieuVote[nOption][1][3]) < tbNguyenLieuVote[nOption][1][4] then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� "..tbNguyenLieuVote[nOption][1][4].." "..tbNguyenLieuVote[nOption][2]..", h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
--	elseif type(tbNguyenLieuVote[nOption][1]) == "number" then
--		if GetCash() < tbNguyenLieuVote[nOption][1]*10000 then
--			Talk(1,"",szNPCName.."C�c h� kh�ng c� "..tbNguyenLieuVote[nOption][1].." v�ng, h�y chu�n b� �� r�i ��n ��y nh�.")
--			return 0
--		end
	end
	
	if gf_Judge_Room_Weight(3,200," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang �� ti�p t�c b�nh ch�n!")
   		return 0
	end
	
	-- local nBang = tonumber(GetTaskTemp(TASKTEMP_BHTA9))

	LIB_txtData:Init("binhchonbhta12.txt")
	if LIB_txtData:AddValue(1,tbNguyenLieuVote[nOption][3]) == 1 then
		if type(tbNguyenLieuVote[nOption][1]) == "table" then
			DelItem(tbNguyenLieuVote[nOption][1][1], tbNguyenLieuVote[nOption][1][2], tbNguyenLieuVote[nOption][1][3], tbNguyenLieuVote[nOption][1][4])
			
			--Cuoc Chien Hoa Hong			
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + 1)
			local nTaskCCHH = GetTask(TSK_CUOCCHIENHOAHONG)
			Msg2Player("S� l�n n�p v�t ph�m l�: "..nTaskCCHH)
			if mod(nTaskCCHH,25) == 0 then
				gf_EventGiveRandAward(tbCCHH,10000,7,"CuocChienHoaHong","NhanThuong")
			end
--		else
--			Pay(tbNguyenLieuVote[nOption][1]*10000)
		end
		--Nhan Diem Cong Trang
		if GetTask(TSK_CUOCCHIENHOAHONG) == 1000 then
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 12000)
			else
				SetTask(701, GetTask(701) - 12000)
			end
			Msg2Player("C�c h� nh�n ���c 12000 �i�m c�ng tr�ng")
		end
		--Nhan Exp
		ModifyExp(600000)
		
		--Message 2 Player
		Msg2Player("Bang h�i "..tbBangHoiTA12[nServerID][1].." nh�n ���c "..tbNguyenLieuVote[nOption][3].." �i�m b�nh ch�n .")
	end
	
	BinhChonBHTA_CC_Step2(1)
	-- if nGiai == 1 then
		-- BinhChonBHTA_CC_Step2(nBang)
	-- else
		-- BinhChonBHTA_SC_Step2(nBang)
	-- end
end


function ExpBonusBHTA9()
	if GetExtPoint(2) == 0 then
		Talk(1,"",szNPCName .."C�c h� kh�ng c� trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng r�i.")
		return 0
	end
	local nExpBonus = tbExpBonusBHTA9[GetExtPoint(2)] or 0
	if nExpBonus > 0 then
		local tbAward = {nCheckExp = 0, nExp = nExpBonus}
		LIB_Award:Award(tbAward )
		PayExtPoint(2, GetExtPoint(2))
		gf_WriteLogEx("NHAN THUONG BHTA9", "nh�n th�nh c�ng", 1, "Nh�n th��ng BHTA9")
	end
end


function CheckRule()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 3 then
		Talk(1,"","T� ��i ph�i c� ��ng 3 th�nh vi�n, kh�ng h�n kh�ng k�m.")
		return 0
	end
	if GetItemCount(2,1,539) < 3 then
		Talk(1,"","Kh�ng c� �� 3 Ho�ng Kim ��i H�ng Bao.");
		return 0
	end
	local tbMember = {[1] = {}, [2] = {}, [3] = {}, [4]={}, [5]={}}
	local tbRoute = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	nOldPlayerIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		tbMember[i]["name"] = GetName()
		tbMember[i]["route"] = GetPlayerRoute()
		tbMember[i]["task"] = GetTask(TASK_LHTH)
		tbMember[i]["chuyensinh"] = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
		tbMember[i]["level"] = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetLevel()
		tbRoute[GetPlayerRoute()] = tbRoute[GetPlayerRoute()] + 1
	end
	PlayerIndex = nOldPlayerIndex
	
	-- Check cac dieu kien dang ky
	for i=1, getn(tbRoute) do
		if tbRoute[i] > 1 then
			Talk(1,"","T� ��i ph�i c� 3 h� ph�i kh�c nhau m�i ���c ��ng k�.");
			return 0
		end
	end

	for i=1, 3 do
		if tbMember[i]["route"] == 0 then
			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " ch�a gia nh�p h� ph�i.")
			return 0
		end
--		if tbMember[i]["task"] == 1 then
--			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " �� ��ng k� thi ��u r�i.")
--			return 0
--		end
		if tbMember[i]["level"] < 396 then
			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " kh�ng �� �i�u ki�n chuy�n sinh v� ��ng c�p.")
			return 0
		end
--		if tbMember[i]["chuyensinh"] < 3  then
--			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " kh�ng �� �i�u ki�n chuy�n sinh.")
--			return 0
--		end
	end
	
	return 1
end


function  FormDangKyTeamHN()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i ���c ph�p ��ng k�.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end
	end
	PlayerIndex = nOldPlayer
	if nCheckMsg == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n �� ��ng k� tham gia r�i")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n ch�a gia nh�p h� ph�i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHN","T�n ��i.",2,32,"T�n ��i: (2-32 k� t�)");
	end
end


function KiemTraDangKyHN(szTeamName)

	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","T�n ��i ch� ���c ch�a c�c k� t� t� A ��n Z (���c ph�p c� ch� hoa & ch� th��ng) v� ch� s� t� 0 ��n 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","T�n ��i " .. szTeamName .. " �� c� ng��i ��ng k�.")
			return 0
		end
	end

	local szLocation = "HN"
	if CheckRule() == 1 then
		if DelItem(2,1,539,3) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� 3 Ho�ng Kim ��i H�ng Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","��ng k� nh�nh Mi�n B�c th�nh c�ng, c�c h� �� l� th�nh vi�n c�a ��i " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function  FormDangKyTeamHCM()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i ���c ph�p ��ng k�.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end	
	end
	PlayerIndex = nOldPlayer	
	if nCheckMsg == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n �� ��ng k� tham gia r�i")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n ch�a gia nh�p h� ph�i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHCM","T�n ��i.",2,32,"T�n ��i: (2-32 k� t�)");
	end
end


function KiemTraDangKyHCM(szTeamName)
	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","T�n ��i ch� ���c ch�a c�c k� t� t� A ��n Z (���c ph�p c� ch� hoa & ch� th��ng) v� ch� s� t� 0 ��n 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung3all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","T�n ��i " .. szTeamName .. " �� c� ng��i ��ng k�.")
			return 0
		end
	end

	local szLocation = "HCM"
	if CheckRule() == 1 then
		if DelItem(2,1,539,3) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� 3 Ho�ng Kim ��i H�ng Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","��ng k� nh�nh Mi�n Nam th�nh c�ng, c�c h� �� l� th�nh vi�n c�a ��i " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function ThiDauOffLine_DangKy_Form()
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n ��ng k� ��u t�i H� N�i/#ThiDauOffLine_DangKy(1)")
	tinsert(tbSay, "Ta mu�n ��ng k� ��u t�i th�nh ph� H� Ch� Minh/#ThiDauOffLine_DangKy(2)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."Gi�i ��u l�n n�y chia l�m 2 khu v�c H� N�i v� Th�nh ph� H� Ch� Minh. C�c h� h�y ch�n ��a �i�m ph� h�p v�i c�c h�.", getn(tbSay), tbSay)
end

function ThiDauOffLine_DangKy(nOption)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0);
	local nLevel = nChuyenSinh*100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local szAccount = GetAccount()
	local szLocation = "HN"
	if nOption ~= 1 then
		szLocation = "HCM"
	end
--	if nRoute ~= 23 then
--		Talk(1,"",szNPCName.."Ta r�t ti�c, gi�i ��u n�y ch� d�nh ri�ng cho h� ph�i C�n L�n Thi�n S�.")
--		return 0
--	end
	if nLevel < 93 then
		Talk(1,"",szNPCName.."C�c h� ch�a �� c�p �� tr�ng sinh ho�c ��ng c�p, h�y c� g�ng th�m.")
		return 0
	end
	if GetItemCount(2,1,30230) < 3000 then
		Talk(1,"",szNPCName.."Ta c�n 3000 xu v�t ph�m l�m tin, c�c h� h�y chu�n b� �� nh�.")
		return 0
	end
	LIB_txtData:Init("offlineconlon.txt")
	LIB_txtData:LoadMultiColumn()
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szAccount) == tostring(LIB_txtData.tbTextData[i][1]) then
			Talk(1,"","C�c h� �� c� t�n trong danh s�ch, kh�ng c�n ��ng k� n�a.")
			return 0
		end
	end
	if DelItem(2,1,30230,3000) == 1 then
		local szData = szAccount .. "	" .. GetName() .. "	" .. GetGlbValue(1023) .. "	" .. GetLevel().."	" .. nChuyenSinh.."	" .. date("%Y%m%d%H%M%S").."	"..szLocation
		LIB_txtData:AddLine(szData)
		Talk(1,"",szNPCName.."��ng k� th�nh c�ng, c�c h� vui l�ng ch� th�ng b�o k�t qu�.")
	end
end

function nothing()
end
