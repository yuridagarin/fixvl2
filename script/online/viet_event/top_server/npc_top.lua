-- Event �ua top
-- Created by TuanNA5
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>Ng�a Long<color>: "
szLogTitle = "Top Ngoa Long"
szStartDate = "25-07-2014"
szEndDate = "14-09 -2014"
szServerName = "Ng�a Long"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Th�i gian t�o t�i kho�n kh�ng h�p l� n�n kh�ng th� nh�n th��ng!")
--		return
--	end

	if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		Talk(1,"",strNpcName.."Ng��i kh�ng ph�i th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
--		tinsert(tSay,1,"Nh�n ph�n th��ng theo ��ng c�p/get_award_by_level")
--		tinsert(tSay,"Nh�n th��ng l�u ph�i Th�y Y�n Linh N� c�p 92-99/get_route_award_by_level_menu")
		tinsert(tSay,"Nh�n th��ng cao th� ��u ti�n ��t 1.400.000 �i�m c�ng tr�ng/confirm_get_1mil_Hornor_award")
--		tinsert(tSay,"Nh�n ph�n th��ng �u ��i server " .. szServerName .. "/Say_NhanUuDai")
		tinsert(tSay,"Nh�n ph�n th��ng cao th� Top 1 m�i h� ph�i/get_top_faction_award")
		tinsert(tSay,"Nh�n ph�n th��ng 3 nh�n s� ��u ti�n m�i phe ��t 860.000 c�ng tr�ng/confirm_get_top_Hornor_award")
--		tinsert(tSay,"��ng k� nh�n th��ng top 100 chuy�n sinh 1 c�p 99/#CS_TopAward(1)")
--		tinsert(tSay,"��ng k� nh�n th��ng top 100 chuy�n sinh 2 c�p 99/#CS_TopAward(2)")
--		tinsert(tSay,"��ng k� nh�n th��ng top 100 chuy�n sinh 3 c�p 99/#CS_TopAward(3)")
--		tinsert(tSay,"Ho�t ��ng "..szServerName.."/NewServer_HoatDong_Menu")
	end
	tinsert(tSay,"Bang h�i danh gi�/TopBangHoi_Menu")
	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top h� ph�i/get_top_faction_info")
	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top 3 chi�n tr��ng/get_top_nation_info")
--	tinsert(tSay,"Xem t�nh h�nh ��ng k� nh�n th��ng m�t t�ch/get_top100_award_info")
--	tinsert(tSay,"Ph�t th��ng bang h�i/PhatThuongBangHoi")
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho�t ��ng <color=yellow>Truy C�ng L�nh Th��ng<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t qu� ��ng ��o vui l�ng xem t�i <color=blue>http://volam2.zing.vn<color>"
		Say(strSay,getn(tSay),tSay)
	end
end

function get_award_by_level()
	local tSay = {}
	tSay[0] = strNpcName.."Trong th�i gian t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), ��ng ��o c� th� ��n g�p ta �� nh�n ph�n th��ng."
	for i=1,getn(tb_topserver_award_limit) do
		if tb_topserver_award_limit[i] ~= nil then
			if tb_topserver_award_limit[i][4] >= gf_GetTaskByte(TSK_TOP_LEVEL,1)  then
				tinsert(tSay, "Ta mu�n nh�n ph�n th��ng c�p �� "..i.."/#conf_get_award_by_level("..i..")")
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"));	
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		gf_PageSay(tSay, 1, 6)
	else
		Talk(1,"",strNpcName.."Ho�t ��ng �� k�t th�c!")
	end			
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function conf_get_award_by_level(nLevel)
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if GetLevel() < nLevel then
		Talk(1, "", strNpcName.."��ng c�p c�a c�c h� ch�a �� "..nLevel..", kh�ng th� nh�n th��ng.");
		return
	end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C�c h� ch�a h�c ��y �� v� c�ng c�p 55, kh�ng th� nh�n th��ng.");
--		return
--	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) > tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i. Kh�ng th� nh�n ti�p ���c n�a!");
		return
	end	
	local nAwardLevel = TopCheckLevel()
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", strNpcName.."Kh�ng �� �i�u ki�n nh�n ph�n th��ng n�y. Vui l�ng ki�m tra l�i c�c �i�u ki�n ��ng c�p, danh v�ng, s� m�n, c�ng tr�ng ho�c c�c h� ch�a nh�n c�c ph�n th��ng tr��c.");
		return 0
	end
	warning_get_award_by_level(nLevel, nAwardLevel);
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function warning_get_award_by_level(nWantLevel, nLevel)
	Say("X�c nh�n mu�n nh�n ph�n th��ng n�y",
		2,
		"Ta mu�n nh�n /#confirm_conf_get_award_by_level("..nWantLevel..")",
		"�� ta suy ngh� l�i./dlgover");
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function confirm_conf_get_award_by_level(nLevel)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	
	-- Check h�nh trang
	if gf_Judge_Room_Weight(14,500)~=1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end
	
	if GetLevel() < 76 then
		Talk(1, "", strNpcName.."��ng c�p c�a c�c h� ch�a �� 76, kh�ng th� nh�n th��ng.");
		return
	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) ~= tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i. Kh�ng th� nh�n ti�p ���c n�a!");
		return
	end
	local nRoute = GetPlayerRoute()
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
--	if GetReputation() < 100 then
--		Talk(1, "", strNpcName.."C�c h� ch�a �� 100 �i�m Danh v�ng.");
--		return
--	end
--
--	if GetTask(336) < 50 then
--		Talk(1, "", strNpcName.."C�c h� ch�a �� 50 �i�m S� m�n.");
--		return
--	end
	
	local nRet, nItemIdx = 0,0	
	if nLevel == 83 then
		if GetCash() < 9990000 then
			Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 999 v�ng.");
			return 0
		end
	end
	
	-- B� sung �i�u ki�n cho c�c Level sau
	if nLevel >= 99 then
		if GetReputation() < 3000 then
			Talk(1,"","C�c h� kh�ng �� 3000 �i�m danh v�ng")
			return
		end
		if GetTask(336) < 3000 then
			Talk(1,"","C�c h� kh�ng �� 2003 �i�m danh v�ng s� m�n.")
			return
		end
		if GetItemCount(2,1,30230) < 300 then
			Talk(1,"","C�c h� kh�ng �� xu v�t ph�m nh�n th��ng.")
			return
		end
		if GetExp() < 300000000 then
			Talk(1,"","C�c h� kh�ng �� �i�m kinh nghi�m nh�n th��ng.")
			return
		end
	elseif nLevel >= 91 then
		if TopCheckSkill(tFactionSkillInfo,20) == 0 then
			Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
			return 0
		end
		if GetReputation() < 500 then
			Talk(1,"","C�c h� kh�ng �� 500 �i�m danh v�ng")
			return 0
		end
		if GetTask(336) < 500 then
			Talk(1,"","C�c h� kh�ng �� 500 �i�m danh v�ng s� m�n.")
			return 0
		end
		if GetCash() < 500000 then
			Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 50 v�ng.");
			return 0
		end
	end
	
	-- Trao thuong
	local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_LEVEL,1))+1
	gf_SetTaskByte(TSK_TOP_LEVEL,1,nAwardOrder)
	--SetTask(TSK_TOP_LEVEL,GetTask(TSK_TOP_LEVEL) + 1)
	if nLevel == 83 then
		Pay(9990000)
	end
	
	if nLevel >= 99 then
		ModifyReputation(-3000,0)
		SetTask(336, GetTask(336) - 3000)
		Msg2Player("B�n b� tr� 3000 �i�m s� m�n!")
		DelItem(2,1,30230,300)
		Msg2Player("B�n b� tr� 300 xu v�t ph�m!")
		ModifyExp(-300000000)
		Msg2Player("B�n b� tr� 300.000.000 �i�m kinh nghi�m!")
	elseif  nLevel > 90 then
		ModifyReputation(-500,0)
		SetTask(336, GetTask(336) - 500)
		Msg2Player("B�n b� tr� 500 �i�m s� m�n!")
		Pay(500000)
	end
	
	for i=1,getn(tb_topserver_award_item[nLevel]) do
		local tb_item = {}
		tb_item = tb_topserver_award_item[nLevel][i]
		if tb_item[1] == 1 then -- item
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nh�n th��ng c�p "..nLevel)
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nh�n th��ng c�p "..nLevel, tb_item[4])
		 	end
		elseif tb_item[1] == 2 then -- command
			dostring(format(tb_item[2],tb_item[3]))
			WriteLogEx(szLogTitle,"nh�n th��ng c�p "..nLevel,tb_item[3],tb_item[2])
		elseif tb_item[1] == 3 then -- table
			local tb_Award = tb_item[2]
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nh�n th��ng c�p "..nLevel)			
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nh�n th��ng c�p "..nLevel, tb_item[4])
		 	end
		 	-- Ch�n v� kh� Vi�t Y�n cho TL t�c gia
		 	if nRoute == 2 and nLevel == 292 then
		 		Say("Ta c� 2 m�n v� kh� d�nh cho c�c h�, h�y ch�n v� kh� ph� h�p:", 2, "Vi�t Y�n Phi Tinh �ao/#ChonVuKhiThieuLam(1)", "Vi�t Y�n Phi Tinh C�n/#ChonVuKhiThieuLam(2)")
		 	end
		else
			Talk(1, "", strNpcName.."��ng c�p kh�ng ��ng!");
			WriteLogEx(szLogTitle,"��ng c�p kh�ng ��ng???");
			return
		end
	end
	
	local szChuyensinh = " "
	if floor(nLevel/100)>0 then
		local szChuyensinh = " (chuy�n sinh "..floor(nLevel/100)..")"
	end
	Say(strNpcName.."Ch�c m�ng c�c h� nh�n ���c ph�n th��ng "..mod(nLevel,100).." "..szChuyensinh,0)
end

--Ch�n V� kh� Thi�u L�m
function ChonVuKhiThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2({0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Vi�t Y�n Phi Tinh �ao",1)
	else
		gf_AddItemEx2({0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Vi�t Y�n Phi Tinh C�n",1)
	end
end


---- Nh�n th��ng top chuy�n sinh theo m�n ph�i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then	
		Say(strNpcName.."Nh�n ph�n th��ng cao th� ho�n th�nh <color=red>ph�c sinh c�p 96<color> ��u ti�n (theo h� ph�i)",
			2,
			"Ta mu�n nh�n/confirm_get_top_faction_award",
			"�� ta suy ngh� l�i./dlgover");
	else
		Talk(1,"",strNpcName.."Ho�t ��ng �� k�t th�c!")
	end
end

--- Nh�n th��ng top 1 h� ph�i ----
function confirm_get_top_faction_award()
	-- Dieu kien nhan thuong
	local nMonPhai = GetPlayerRoute()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C�c h� ch�a ch�n h� ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng top 1 theo h� ph�i r�i.");
		return 0
	end
	
	if nChuyenSinh ~= 6 then
		Talk(1,"",strNpcName .. "Hi�n t�i C�c h� ch�a ho�n Ph�c sinh 1!")
		return 0
	end
	
	if GetLevel() < 96 then
		Talk(1, "", strNpcName .. "C�c h� h�y ph�n ��u l�n c�p �� 96 r�i quay l�i nh�!");
		return 0
	end
	
	if nRep < 25000 or nFaction < 25000 or nHor < 500000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 5000 then
		Talk(1,"",strNpcName .. "C�c h� kh�ng �em �� 5.000 xu v�t ph�m.")
		return 0
	end
		
--	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
--		Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
--		return	
--	end

	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		-- Bit 1 nh�n ph�n th��ng chuy�n sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		DelItem(2,1,30230,5000)
--		if nFactionRank == 0 then
			local tbAward = {
				item = {
						{gdp={0,102,8844,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Huy Ho�ng Qu�t Kh�i"}, 
						{gdp={0,102,8845,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Vinh D� Qu�t Kh�i"}, 
						{gdp={0,105,30022,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Kim Mao Ng�u B�o B�o"}}
			}
			TraoMatTichCaoCap20(3, nMonPhai)
			LIB_Award:Award(tbAward)
--		end
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng h�ng "..(nFactionRank+1).." m�n ph�i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end


-- Nh�n th��ng top c�ng tr�ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if nPhucSinh < 1 or GetLevel() < 94 then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n ph�c sinh c�p �� 94!")
		return 0
	end
	
	if nRep < 25000 or nFaction < 25000 or abs(nHor) < 860000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n thu�ng. Vui l�ng ki�m tra �i�u ki�n Qu�n h�m.");
		return
	end
	
	if GetItemCount(2,1,30230) < 19000 then
		Talk(1,"", strNpcName.."C�c h� kh�ng �em �� 19000 xu v�t ph�m, hay l� �� �� qu�n trong r��ng?")
		return
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng top 5 c�ng tr�ng chi�n tr��ng r�i.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 3 then
		Talk(1, "", strNpcName.."Ph�n th��ng 3 cao th� ��u ti�n c�ng tr�ng ��t 860.000 �� c� ch� nh�n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,3) == 1 then
		DelItem(2,1,30230,19000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
--		local tbAward = {item = {{gdp={2,1,9977,1,1}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 90*24*60*60}}}
--		Bit 1 nh�n ph�n th��ng top c�ng tr�ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_HORNOR,1)
		TraoLoiHoTuongQuan(0)
--		if nNationRank == 0 then
			--TraoThuongUngTuongQuan(0);
			--TraoTrangBiKimXaTuongQuan()
--		end
--		for i=1,19 do
--			LIB_Award:Award(tbAward)
--		end
--		LIB_txtData:Init("danhsachnhanthuong.txt")
--		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOP790790	"..date("%Y-%m-%d %H:%M:%S")
--		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng h�ng "..(nNationRank+1).." c�ng tr�ng phe "..tb_Nation_Name[tonumber(nTongLieu)]..".")
	end
end


-- Nh�n th��ng top 1.400.000 c�ng tr�ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if nPhucSinh < 1 or GetLevel() < 95 then
		Talk(1, "", strNpcName.."C�c h� ch�a ph�c sinh c�p �� 95, h�y c� g�ng th�m..");
		return 0
	end
	
	if nRep < 30000 or nFaction < 30000 or abs(nHor) < 1400000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 6 then
		Talk(1,"",strNpcName.."C�c h�, ph�n th��ng n�y ch� ���c trao t�ng cho nguy�n so�i, C�c h� h�y c� g�ng th�m nh�...");
		return 0
	end
	
	if GetItemCount(2,1,30230) < 39000 then
		Talk(1,"", strNpcName.."C�c h� kh�ng �em �� 39.000 xu v�t ph�m, hay l� �� �� qu�n trong r��ng?")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng 1.400.000  c�ng tr�ng chi�n tr��ng r�i.");
		return	
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
	
	local nNationRank = 0
	for i = 1, 2 do
		nNationRank = LIB_txtData.tbTextData[tonumber(i)]
		if nNationRank == 1 then
			break
		end
	end
	
--	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(nTongLieu),1,1) == 1 then
		DelItem(2,1,30230,39000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		-- Bit 1 nh�n ph�n th��ng top c�ng tr�ng
--		local tbAward = {item = {{gdp={2,1,9977,1,1}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 90*24*60*60}}}
		local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Chi�n T��ng Nguy�n So�i"}}}
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		TraoLoiHoNguyenSoai(0)
		LIB_Award:Award(tbChienTuong)
--		TraoTrangBiKimXaNguyenSoai()
--		for i=1,39 do
--			LIB_Award:Award(tbAward)
--		end
--		LIB_txtData:Init("danhsachnhanthuong.txt")
--		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOP1500000	"..date("%Y-%m-%d %H:%M:%S")
--		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng 1.400.000 c�ng tr�ng")
	end
end


-- Xem th�ng tin top 100 nh�n m�t t�ch
function get_top100_award_info()
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local szList = "S� l��ng nh�n th��ng m�t t�ch �� ��ng k�: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		szList = szList.."Chuy�n sinh "..i..": "..LIB_txtData.tbTextData[i].."/100\n"
	end
	Talk(1,"",szList)	
end


-- Xem th�ng tin top m�n ph�i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local szList = "Th�ng tin ph�n th��ng top 1 h� ph�i �� nh�n: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			if i < 14 then
				szList = szList.."Cao th� <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			else
				szList2 = szList2.."Cao th� <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			end
		end
	end
	Talk(2,"",szList, szList2)	
end

-- Xem th�ng tin top qu�n c�ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	for i=1,getn(LIB_txtData.tbTextData) do
		print(LIB_txtData.tbTextData[i])
	end
	local szList = "Th�ng tin ph�n th��ng top 3 vinh d� chi�n tr��ng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao th� phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

-- Nh�n �u ��i server m�i
function Say_NhanUuDai()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation~=TOP_SERVER_ID then
		Talk(1,"","Ch� c� server " .. szServerName .. " m�i nh�n ���c ph�n th��ng")
		return
	end
	tbSay = {"Ta ch� gh� ngang/dlgover"}
	for i=getn(tbDieuKienUuDai),1,-1 do
		tinsert(tbSay,1,"C�p "..tbDieuKienUuDai[i]["nLevel"]..": "..tbDieuKienUuDai[i]["name"].." c�n "..tbDieuKienUuDai[i]["tbitem"][4].." "..tbDieuKienUuDai[i]["tbitem"][5].."/#UuDaiServerMoi("..i..")")
	end
	Say("M�i c�c h� nh�n ph�n t��ng t��ng x�ng",getn(tbSay), unpack(tbSay))
end

function UuDaiServerMoi(nOrder)
	if type(tbDieuKienUuDai[nOrder]) ~= "table" then
		Talk(1,"","Kh�ng c� ph�n th��ng cho c�p �� n�y")
		return
	end
	
	local tbAward = tbDieuKienUuDai[nOrder]
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	
	if tbAward["nLevel"] > nLevel then
		Talk(1,"","C�c h� ch�a �� c�p �� nh�n th��ng")
		return
	end
	
	if gf_Judge_Room_Weight(tbAward["nSlot"] ,tbAward["nWeight"] ) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"]) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng �u ��i n�y r�i.")
		return 1
	end
	
	if nRoute == 0 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i n�n kh�ng th� nh�n th��ng.");
		return
	end
	
	if GetItemCount(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3]) < tbAward["tbitem"][4] then
		Talk(1,"","C�c h� kh�ng �em �� "..tbAward["tbitem"][5]..", h�y ki�m tra l�i h�nh trang.")
		return
	end
	
	-- Trao th��ng �u ��i
--	if nOrder == 10 then
--		Say_NhanVuKhiVietYen()
--		return
--	end
	
--	if nOrder < 10 then
		if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4])==1 then
			LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
			LIB_Award.szLogAction = "nh�n"
			gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
			if nOrder == 1 then
				GiveAwardTCTK(7)
			elseif nOrder == 2 then
				GiveAwardTCTK(8)
			elseif nOrder == 3 then
				GiveAwardTCTK(9)
			elseif nOrder == 4 then
				local tbUuDai = {item = {{gdp = {0,102,24,1,1,-1,-1,-1,-1,-1,-1,-1},  name = "��ng Ph��ng Long Ch�u"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 5 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 6 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 7 then
				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,1000}, name = "C� Linh Ng�c"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 8 then
				local tbUuDai = {item = {{gdp={2,1,30368,1200}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,2000}, name = "C� Linh Ng�c"}}}
				LIB_Award:Award(tbUuDai)
			end
--			elseif nOrder == 9 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 10 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 11 then
--				local tbUuDai = {item = {{gdp={0,107,tbMatTich70caocap[nRoute][2][3],9}, name = "M�t t�ch 70 cao c�p"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 12 then
--				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,1000}, name = "C� Linh Ng�c"}}}
--				LIB_Award:Award(tbUuDai)
--			end
		end
--	end
end

--
--function Say_NhanVuKhiVietYen()
--	local tbListAllVietYen = {
--		[1] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	tbSay = {"Ta c�n suy ngh� l�i/dlgover"}
--	for i=getn(tbListAllVietYen), 1, -1 do
--		tinsert(tbSay,1,tbListAllVietYen[i][1].."/#NhanVuKhiVietYen("..i..")")
--	end
--	Say("C�c h� h�y ch�n  v� kh� t�y th�ch:", getn(tbSay), unpack(tbSay))
--end
--
--function NhanVuKhiVietYen(nOption)
--	local tbAward = tbDieuKienUuDai[10]
--	local tbListAllVietYen = {
--		[1] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4]) == 1 then
--		gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
--		gf_AddItemEx2(tbListAllVietYen[nOption][2], tbListAllVietYen[nOption][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
--	end
--end

function dlgover()
end


function PhatThuongBangHoi()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20130519 then
		Talk(1,"","Ch�a ��n ng�y trao th��ng, phi�n C�c h� ��i ��n 19-05-2013 nh�.")
		return 0
	end
	
	local nTongMember = IsTongMember();
	if nTongMember == 0 then
		Talk(1,"","Ph�n th��ng n�y ch� d�nh cho bang h�i, C�c h� h�y gia nh�p bang h�i tr��c �� nh�.")
		return 0
	end
		
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  15 then
		Talk(1,"","Th�i gian gia nh�p c�a c�c h� �t h�n 15 ng�y, kh�ng th� nh�n th��ng n�y!")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, 21) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if gf_Judge_Room_Weight(25,2100) ~=1 then
		Talk(1,"","C�c h� c�n chu�n b� 25 � h�nh trang v� 2100 s�c l�c �� nh�n th��ng.")
		return 0
	end
	
	local szTongName = GetTongName()
	LIB_txtData:Init("banghoinhanthuong.txt")
	LIB_txtData:LoadMultiColumn();
	tbTenBang = LIB_txtData.tbTextData
	if tbTenBang[1] ~= nil and tbTenBang[1][1] ~= nil then
		if tbTenBang[1][1] ~= szTongName then
			Talk(1,"","Ph�n th��ng n�y �� trao cho bang ".. tbTenBang[1][1])
			return 0
		end
	else
		if GetTongPopuLadder() ~= 1 then
			Talk(1,"","Ph�n th��ng n�y ch� trao cho bang h�i x�p h�ng 1 nh�n kh�.")
			return 0
		end
		LIB_txtData:AddLine(szTongName)
	end
	
	LIB_Award.szLogTitle = "TOP BANG HOI "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	gf_SetTaskBit(TSK_TOP_LEVEL, 21, 1)
	local tbThuongBangHoi = {item = {
		{gdp={2,0,189,2003,1}, name = "Qu� Hoa T�u"},
		{gdp={2,1,1208,2,1}, name = "P_th��ng C�ng Th�nh (th�ng)"},
		{gdp={2,1,1210,20,1}, name = "B�o r��ng T�i nguy�n"},
		{gdp={0,105,33,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Ni�n Th�", nExpired = 90*24*60*60}
	}}
	LIB_Award:Award(tbThuongBangHoi)
end


function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh ~= tbOps[nOption]["nCS"] or GetLevel() < 99 then
		Talk(1,"",strNpcName.."�i�u ki�n chuy�n sinh ho�c ��ng c�p ch�a ��ng, kh�ng th� ��ng k� nh�n m�t t�ch.")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C�c h� �� ��ng k� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	if nAward >= 100 then
		Talk(1, "", strNpcName.."�� c� �� 100 cao th� ��ng k� nh�n ph�n th��ng n�y, c�c h� h�y c� g�ng chi�m ph�n th��ng kh�c nh�!");
		return 0
	end
	
	if LIB_txtData:AddValue(tonumber(nOption),1,100) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C�c h� l� ng��i th� "..(nAward+1).." ��ng k� nh�n m�t t�ch th�nh c�ng.")
	end
end


function get_route_award_by_level_menu()
	local tbSay = {}
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 92/#get_route_award_by_level_done(92)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 93/#get_route_award_by_level_done(93)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 94/#get_route_award_by_level_done(94)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 96/#get_route_award_by_level_done(96)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 99/#get_route_award_by_level_done(99)")
	tinsert(tbSay, "Ta ch�a mu�n nh�n ngay/gf_DoNothing")
	Say("�� t� ph�i C�n L�n n�u ��t ��n ��ng c�p nh�t ��nh s� ���c ta t�ng th��ng ��c bi�t, d� nhi�n c�ng ph�i c�n ch�t th� lao.", getn(tbSay), tbSay)
end


function get_route_award_by_level_done(nOption)
	local tbAward = {
			[92] = {fn="TraoNguLongTuongQuan_TrangBi(7)"},
			[93] = {fn="TraoMatTich70CaoCap(20)"},
			[94] = {fn="TraoNguLongTuongQuan_TrangSuc()"},
			[96] = {fn="ThuongVuKhi_ThuyYenLinhNu()"},
			[99] = {item={
						{gdp={2,1,30345,1,1}, name = "Chuy�n Sinh ��n"}, 
						{gdp={2,0,1083,3,1}, name = "Th�i D�ch H�n Nguy�n C�ng Ph�"}, 
						{gdp={2,95,204,4,1}, name = "Thi�n Cang L�nh"}},
					nChankhi = 150000,
			},
	}
	if GetPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."Ng��i ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng..")
		return
	end
	if GetLevel() < nOption then
		Talk(1,"",strNpcName.."��ng c�p ch�a ��, kh�ng th� nh�n th��ng..")	
		return
	end
	if IsPlayerDeath() == 1 then
		Talk(1,"",strNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	if IsStalling() == 1 then
		Talk(1,"",strNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh 20 c�p v� c�ng tr�n ph�i.");
		return	
	end
	local tbDieuKien = {
		[92] = {Bit = 1, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 3},
		[93] = {Bit = 2, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 20},
		[94] = {Bit = 3, Route = 30, Quanham = 4, Quancong = 230000, Danhvong = 23000, Sumon = 23000, Slot = 3},
		[96] = {Bit = 4, Route = 30, Quanham = 5, Quancong = 300000, Danhvong = 26000, Sumon = 26000, Slot = 1},
		[99] = {Bit = 5, Route = 30, Quanham = 5, Quancong = 330000, Danhvong = 30000, Sumon = 30000, Slot = 2},
	}
	local tbMaterial = {
		[92] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[93] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[94] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[96] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 600000000},
		[99] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 1000000000},
	}
	if tbDieuKien[nOption] == nil then
		return 0
	end
	
	if gf_Judge_Room_Weight(tbDieuKien[nOption]["Slot"],500) ~= 1 then
		Talk(1,"",strNpcName.."C�n ".. tbDieuKien[nOption]["Slot"] .." h�nh trang , 500 s�c l�c. Vui l�ng s�p x�p l�i.")
		return
	end
	
	local nRoute = GetPlayerRoute()
	local nQuanham = GetTask(704)
	local nQuancong = GetTask(701)
	local nDanhvong = GetReputation()
	local nSumon = GetTask(336)
	
	if gf_GetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"]) ~= 0 then
		Talk(1,"", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if nRoute ~= tbDieuKien[nOption]["Route"] then
		Talk(1,"", strNpcName.."H� ph�i kh�ng ph� h�p, kh�ng th� nh�n th��ng.")
		return 0
	end
	
	if nDanhvong < tbDieuKien[nOption]["Danhvong"] then
		Talk(1,"", strNpcName.."Danh v�ng ch�a ��t m�c "..tbDieuKien[nOption]["Danhvong"]..", ta ch�a th� trao th��ng cho c�c h�.")
		return 0
	end
	
	if nSumon < tbDieuKien[nOption]["Sumon"] then
		Talk(1,"", strNpcName.."�i�m c�ng hi�n s� m�n ch�a ��t m�c "..tbDieuKien[nOption]["Sumon"]..", ta ch�a th� trao th��ng cho c�c h�.")
		return 0
	end
	
	if abs(nQuanham) < abs(tbDieuKien[nOption]["Quanham"]) then
		Talk(1,"", strNpcName.."Qu�n h�m ch�a �� �i�u ki�n, ng��i h�y c� g�ng th�m.")
		return 0
	end
	
	if abs(nQuancong) < abs(tbDieuKien[nOption]["Quancong"]) then
		Talk(1,"", strNpcName.."Qu�n c�ng ch�a �� "..abs(tbDieuKien[nOption]["Quancong"])..", ng��i h�y c� g�ng th�m.")
		return 0
	end
	
	if GetCash() < tbMaterial[nOption]["Gold"]*10000 then
		Talk(1,"", strNpcName.."Ng��i ch�a �em �� "..tbMaterial[nOption]["Gold"].." v�ng, h�y ki�m tra l�i nh�.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMaterial[nOption]["Xu"] then
		Talk(1,"", strNpcName.."Ng��i ch�a �em �� "..tbMaterial[nOption]["Xu"].." xu v�t ph�m, h�y ki�m tra l�i nh�.")
		return 0
	end
	
	if GetExp() < tbMaterial[nOption]["Exp"] then
		Talk(1,"", strNpcName.."Ng��i ch�a t�ch l�y �� "..tbMaterial[nOption]["Exp"].." �i�m kinh nghi�m, h�y c� g�ng th�m.")
		return 0
	end

--	****************** Trao th��ng *************************
	ModifyReputation(-tbMaterial[nOption]["Danhvong"],0)
	SetTask(336, GetTask(336) - tbMaterial[nOption]["Sumon"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Sumon"].." �i�m s� m�n")
	Pay(tbMaterial[nOption]["Gold"]*10000)
	DelItem(2,1,30230,tbMaterial[nOption]["Xu"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Xu"].." xu v�t ph�m")
	ModifyExp(-tbMaterial[nOption]["Exp"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Exp"].." �i�m kinh nghi�m")
	gf_SetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"], 1, 0)
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward[nOption])
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Th�y Y�n Linh N� c�p "..nOption)
end
