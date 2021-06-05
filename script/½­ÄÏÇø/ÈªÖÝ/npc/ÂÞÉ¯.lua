--==========Code By PhucNG 16-10-2014=======--
--=====Event �ua top bang h�i li�n server===--
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\eventkimxalienserver.lua")

szNpcName = "<color=green>La Sa<color>: "
tbVoteMaterials = {
	[1] = {1, {nExp = 10000000}, "10 tri�u �i�m kinh nghi�m(1 �i�m t�ch l�y)"},
	[2] = {10,{nExp = 100000000}, "100 tri�u �i�m kinh nghi�m(10 �i�m t�ch l�y)"},
	[3] = {1, {item={{gdp={2,1,30499,1}}}}, "1 Hu�n Ch��ng Anh H�ng(1 �i�m t�ch l�y)"},
	[4] = {2, {item={{gdp={2,1,30614,1}}}}, "1 L�i H� Tinh Ph�ch(2 �i�m t�ch l�y)"},
	[5] = {1, {item={{gdp={2,2,8,5}},{gdp={2,1,30230,8}}}}, "5 Thi�n Th�ch v� 8 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
}

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b�n Socola l� t�nh nh�n",2,"Ta ��n mua Socola l� t�nh nh�n/buy_chocolate","Ta ch� gh� ch�i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:t�ng Ho�ng Kim Phi Phong cho t�t c� n� sinh trong th�nh (<color=green>�� s� d�ng ph�n th��ng cu�i c�a event 8 thang 3 s� nh�n ���c ph�n th��ng cu�i phong ph� h�n<color>)",2,"M�i SaSa thay ta t�ng Phi Phong cho c�c ch� em ph� n� trong th�nh (ti�u hao 8 Phi Phong Ho�ng Kim + 3 v�ng)/deal_send","Ta ch� gh� ch�i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi�ng sinh vui v�!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	
	--���
	local tSay = {};
	--���
	local tActivityID = {84, 124, 127, 136};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	
	--Event Dua Top Bang Hoi Lien Server 21/10/2014 - 30/11/2014
	if GetGlbValue(GLB_TSK_SERVER_ID) ~= 92 then
		--DuaTop_Main()
		if nDate >= 20141022 and nDate <= 20141130 then
			tinsert(tSay,"Bang ch� ��i di�n Bang H�i ��ng k� tham gia/DuaTop_DangKy")
			tinsert(tSay,"Xem th�ng tin c�c Bang H�i tham gia trong m�y ch�/DuaTop_ViewListBangHoi")
			tinsert(tSay,"�ng h� c�c Bang H�i/DuaTop_UngHo")
			tinsert(tSay,"Xem t�ch l�y b�n th�n/DuaTop_ViewPersonalPoint")
			tinsert(tSay,"Xem t�ch l�y c�c Bang H�i/DuaTop_ViewBangHoiPoint")		
		end	
	end
	
	if nDate >= 20130416 and nDate <= 20130421 then
		tinsert(tSay, "Ta mu�n ��i nguy�n li�u l�y kinh nghi�m/Trade_Material2Exp_Menu")
		tinsert(tSay, "Ta mu�n ��i c�c lo�i nguy�n li�u l�y ph�n th��ng/Trade_Material2Item_Menu")
	end
	if nDate >= 20131012 and nDate <= 20131024 then
		tinsert(tSay, "�ua top Trang b� Kim X� Nguy�n So�i/EventKimXaLienServer_Menu")
	end
	if nDate == 20131027 then
		tinsert(tSay, "Bang ch� nh�n th��ng �ua top Kim X� Nguy�n So�i/EventKimXaLienServer_NhanThuong_Form")
	end
	
	
	tinsert(tSay, "\nK�t th�c ��i tho�i/do_nothing");
	Say("<color=green>La Sa<color>: Th�t ra h� ti�ng hoa c�a ta l� h� T��ng, nghe hay kh�ng?", getn(tSay), tSay);
end

function do_nothing()
end

function DuaTop_NhanThuong(nRank)
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local szTongName = GetTongName()
	local isTong = IsTongMaster()
	
	local nCheck = 0
	local nPoint = 0
	for i = 1, getn(LIB_txtData.tbTextData) do
		if szTongName == LIB_txtData.tbTextData[i][1] then
			nPoint = LIB_txtData.tbTextData[i][5]
			nCheck = 1
			break
		end
	end
		
	if nCheck <= 0 then
		Talk(1,"","C�c h� kh�ng c� trong danh s�ch bang h�i nh�n th��ng!")
		return
	end
	
	if isTong ~= 1 then
		Talk(1,"","C�c h� kh�ng ph�i bang ch�, kh�ng th� nh�n th��ng!")
		return
	end
	
	local nNhanThuong = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,2,0)
	if nNhanThuong >= 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng. Kh�ng th� nh�n ���c n�a!")
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(7*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Th�i gian gia nh�p c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if nPoint < 300000 then
		Talk(1,"","�i�m t�ch l�y d��i 300,000 �i�m. Bang h�i kh�ng th� nh�n th��ng!")
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Judge_Room_Weight(15, 700) == 0 then
		Talk(1,"", szNpcName.."H�y chu�n b� �t nh�t 15 � tr�ng v� 700 s�c l�c r�i quay l�i ��y nh�n th��ng !")
		return 0
	end
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*60*60}}}
	local nRoute = GetPlayerRoute()
	if nRank == 1 then
		TraoChienCuong(15)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(13)
		LIB_Award:Award({item = {{gdp={0,112,225,3}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,3}, name="Bao Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,500}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,10}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30014,2}, name="B�o V�ng"}}})
	elseif nRank == 2 then
		TraoChienCuong(13)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(7)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,1}, name="Bao Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,200}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,5}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1}, name="B�o �en"}}})
	elseif nRank == 3 then
		TraoChienCuong(10)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(0)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,3356,1}, name="T�i Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,100}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,2}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30039,1}, name="Th� �en"}}})
	end
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,2,1)
	Msg2Player("C�c h� �� nh�n th��ng th�nh c�ng")
end

function DuaTop_ViewPersonalPoint()
	local nPoint = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	Talk(1,"",szNpcName.."H�m nay c�c h� �� �ng h� ���c t�ng c�ng <color=red>"..nPoint.."<color> �i�m")
end

function DuaTop_ViewBangHoiPoint()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local msgs = {"","","",""}
		
	for i = 1, getn(LIB_txtData.tbTextData) do
		if i <= 50 then
			msgs[1] = msgs[1] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> �i�m), "
		elseif i <= 100 then
			msgs[2] = msgs[2] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> �i�m), "
		end
	end	
	
	if msgs[1] == "" then
		Talk(1,"",szNpcName.."Hi�n t�i kh�ng c� bang h�i n�o ��ng k� tham gia!")
		return
	end
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_UngHo()
	local nConfirmCDKey = GetTask(2822) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 100 then
		Talk(1,"", szNpcName.."C�c h� vui l�ng ��n Tuy�n Ch�u �ng h� nh�!")
		return 
	end
	
	if IsPlayerDeath() == 1 then
		Talk(1,"",szNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	
	-- Check Kich ho�t t�ng ki�m l�nh 2
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t T�ng Ki�m L�nh, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	-- Check k�ch ho�t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t th� X� n�, kh�ng th� ��ng k� tham gia!")
		return
	end

	--Check gia nh�p m�n ph�i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� tham gia �ng h� Bang H�i!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C�c h� ch�a �� level 90. H�y v� nh� luy�n th�m r�i quay l�i ��y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C�c h� ch�a n�ng c�p t�i �� k� n�ng c�p 55!")
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	if LIB_txtData.tbTextData == nil then
		Talk(1,"","Kh�ng c� bang h�i n�o ��ng k� tham gia!")
		return
	end	
	
	local tbSay = {}
	tbSay[0] = szNpcName.."C�c h� h�y l�a ch�n bang h�i mu�n b�nh ch�n: "
	for i = 1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay,"Ta mu�n b�nh ch�n bang h�i "..LIB_txtData.tbTextData[i][1].."/#DuaTop_UngHo_01("..i..")")
	end
	
	gf_PageSay(tbSay, 1, 6);
end

function DuaTop_UngHo_01(nBang)
	local tbSay = {}
	for i = 1, 5 do
		tinsert(tbSay,format(tbVoteMaterials[i][3].."/#DuaTop_UngHo_02(%d,%d)",i,nBang))
	end
	tinsert(tbSay,"R�i Kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n b�nh ch�n b�ng h�nh th�c n�o?",getn(tbSay),tbSay)
end

function DuaTop_UngHo_02(nType,nBang)
	
	local nPointVote = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	if nPointVote + tbVoteMaterials[nType][1] > 200 then
		Talk(1,"","C�c h� ch� ���c n�p t�i �a 200 �i�m trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end
	
	if LIB_Award:CheckMaterial(tbVoteMaterials[nType][2]) ~= 1 then
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,nPointVote + tbVoteMaterials[nType][1])
	LIB_txtData.tbTextData[nBang][5] = LIB_txtData.tbTextData[nBang][5] + tbVoteMaterials[nType][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[5]) > tonumber(y[5]) end)
	LIB_txtData:SaveMultiColumn()
	LIB_Award:PayMaterial(tbVoteMaterials[nType][2])
	Msg2Player("C�c h� �� b�nh ch�n th�nh c�ng cho bang h�i "..LIB_txtData.tbTextData[nBang][1])
	AddGlobalNews("S� ki�n �ua Top Bang H�i Li�n Server: Bang H�i "..LIB_txtData.tbTextData[nBang][1].." �� ���c b�nh ch�n "..tbVoteMaterials[nType][1].." �i�m!")
	DuaTop_UngHo_01(nBang)
end

function DuaTop_ViewListBangHoi()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = getn(LIB_txtData.tbTextData)
	local msgs = {
		szNpcName.."Hi�n t�i �� c� "..nCount.." bang h�i tham gia s� ki�n: \n",
		"","","",
	}
	
	for i = 1, nCount do
		if i <= 40 then
			msgs[1] = msgs[1] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		elseif i <= 80 then
			msgs[2] = msgs[2] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		end
	end	
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_DangKy()
	local szTong = GetTongName()
	local szAccount = GetAccount()
	local nLevel = GetLevel()
	local szName = GetName()
	local nPoint = 0
	local nConfirmCDKey = GetTask(2822) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	--Check Kich ho�t t�ng ki�m l�nh 2
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t T�ng Ki�m L�nh, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	--Check k�ch ho�t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t th� X� n�, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	--Check c� ph�i bang ch�?
	local isTong = IsTongMaster()
	if isTong ~= 1 then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i bang ch�. Kh�ng th� ��ng k� tham gia Bang H�i �ua top!")
		return
	end
	
	--Check gia nh�p m�n ph�i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� tham gia �ng h� Bang H�i!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C�c h� ch�a �� level 90. H�y v� nh� luy�n th�m r�i quay l�i ��y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C�c h� ch�a n�ng c�p t�i �� k� n�ng c�p 55!")
		return
	end
	
	--Check C�ng server
	if gf_GetTaskByte(TSK_SERVER_ID,1) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i th�n d�n b�n qu�c, kh�ng ���c ��ng k� tham gia!")
		return 0
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0	
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNpcName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng ���c ��ng k� th�m l�n n�a!")
		return 0
	end
	
	local szLog = szTong.."	"..szAccount.."	"..szName.."	"..nLevel.."	".. nPoint
	LIB_txtData:AddLine(szLog)
	Talk(1,"",szNpcName.."Bang h�i c�c h� b�o danh s� ki�n �ua Top Bang H�i Li�n Server th�nh c�ng, xin ch�c m�ng.")
	AddGlobalNews("Ch�c m�ng bang h�i "..szTong.." b�o danh th�nh c�ng s� ki�n �ua Top Bang H�i Li�n Server!")
end