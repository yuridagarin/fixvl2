Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

NOPVATPHAM_FILE = "\\script\\vng\\nhiemvuphucsinh2\\nopvatpham.lua";
HOANTHANHNHANH_FILE = "\\script\\vng\\nhiemvuphucsinh2\\hoanthanhnhanh.lua";

--*************************************
-- Task: TSK_DONGHANH = 2189
-- From: 7/5/2013
-- End: ...
--*************************************

function NhiemVuPhucSinh2_Menu()
	local tbSay = {}
	if PhucSinh2_CheckActive() == 0 then
		tinsert(tbSay, "Ta mu�n nh�n th� th�ch c�a T� Linh Ph�c Sinh 2 (ti�u hao 04 B�ch Kim ��i H�ng Bao ch�a 4000v )/PhucSinh2_Start")
	end
	if PhucSinh2_CheckActive() == 1 then
		if PhucSinh2_GetCount() < nMISSION_QTY then
			local nQuestID = PhucSinh2_GetDailyMission()
			if  nQuestID ~= 0 and tbPhucSinh2Name[nQuestID][3] == 1 and PhucSinh2_GetStatus() == 0 then
				tinsert(tbSay, "N�p v�t ph�m/PhucSinh2_NopItem")
			end
			tinsert(tbSay, "Nh�n nhi�m v� ng�y ("..PhucSinh2_CountDailyMission().."/5)/PhucSinh2_NhanNhiemVuNgay")
			tinsert(tbSay, "L�m m�i nhi�m v�/PhucSinh2_LamMoiNhiemVu")
			tinsert(tbSay, "Ti�n �� ho�n th�nh nhi�m v� ng�y/PhucSinh2_TienDoNhiemVuNgay")
			tinsert(tbSay, "Ti�n �� ho�n th�nh chu�i 50 nhi�m v�/PhucSinh2_TienDoPhucSinh2")
			tinsert(tbSay, "Ho�n th�nh nhanh nhi�m v�/PhucSinh2_HoanThanhNhanh")
--			tinsert(tbSay, "Test - Ho�n th�nh 1 ph�n nhi�m v�/PhucSinh2_SetMissionPart")
--			tinsert(tbSay, "Test - Ho�n th�nh nhi�m v�/PhucSinh2_SetStatus")
--			tinsert(tbSay, "Test - Nh�n nhi�m v� chu�n v�i/PhucSinh2_TestNhanNhiemVu_Menu")
		else
			tinsert(tbSay, "Thu th�p nguy�n li�u/PhucSinh2_NopNguyenLieu_Menu")
		end
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."Ng��i mu�n l�nh ng� c�nh gi�i m�i c�a T� Linh Ph�c Sinh, tr��c h�t ph�i v��t qua c�c th� th�ch c�a ta.",getn(tbSay), tbSay)
end


function PhucSinh2_Start()
	local tbNguyenLieu = {item={{gdp={2,1,30229,4}, name="B�ch Kim H�ng Bao"}}}
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	if nPhucSinh < 1 then
		Talk(1,"",szNPCName.."Ng��i ch�a Ph�c Sinh l�n n�o, kh�ng th� l�nh h�i b� k�p Ph�c Sinh c�p cao h�n.")
		return 0
	end
	if GetLevel() < 99 then
		Talk(1,"",szNPCName.."Ng��i ch�a ��t ��ng c�p 99, luy�n b� k�p s� r�t nguy hi�m. H�y tu luy�n th�m nh�.")
		return 0
	end
	if PhucSinh2_CheckActive() == 1 then
		Talk(1,"",szNPCName.."Ng��i �� nh�n th� th�ch, kh�ng c�n ph�i nh�n l�i.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu)
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieu)
	PhucSinh2_Active()
	gf_WriteLogEx("NHIEM VU PHUC SINH 2", "kick ho�t th�nh c�ng", 1, "Ph�c Sinh 2 k�ch ho�t")
	Talk(1,"",szNPCName.."Ng��i �� ��ng � nh�n th� th�ch c�a ta, t� gi� h�y ki�n tr� ho�n th�nh th� th�ch nh�.")
end


function PhucSinh2_NhanNhiemVuNgay()
	if PhucSinh2_CheckActive() == 0 then
		Talk(1,"",szNPCName.."Ng��i ch�a nh�n th� th�ch, kh�ng th� nh�n nhi�m v� h�ng ng�y.")
		return 0
	end
	if PhucSinh2_CountDailyMission() >= nSoLuongNhiemVuNgay then
		Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh �� "..nSoLuongNhiemVuNgay.." m�i ng�y. Mai nh� quay l�i nh�.")
		return 0
	end
	if PhucSinh2_GetStatus() == 0 and PhucSinh2_GetDailyMission() ~= 0 then
		Talk(1,"",szNPCName.."Ng��i ch�a ho�n th�nh nhi�m v� hi�n t�i. H�y ho�n th�nh r�i quay l�i nh�.")
		return 0
	end
	PhucSinh2_SetDailyMission()
end


function PhucSinh2_LamMoiNhiemVu()
	if PhucSinh2_GetStatus() == 1 then
		Talk(1,"",szNPCName.."Nhi�m v� �� ho�n th�nh, ng��i kh�ng c�n ph�i ��i.")
		return 0
	end
	local tbSay = {}
	tinsert(tbSay, "Ti�u hao 69 v�ng/#PhucSinh2_LamMoiNhiemVu_Done(1)")
	tinsert(tbSay, "Ti�u hao 19 xu v�t ph�m/#PhucSinh2_LamMoiNhiemVu_Done(2)")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothong")
	Say(szNPCName.."Ng��i c� th� b� ra �t l� ph� �� ��i nhi�m v� kh�c n�u c�n.", getn(tbSay), tbSay)
end


function PhucSinh2_LamMoiNhiemVu_Done(nOption)
	local tbNguyenLieu = {
		[1] = {nGold = 690000},
		[2] = {item={{gdp={2,1,30230,19}, name="Xu V�t Ph�m"}}},
	}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieu[nOption])
	PhucSinh2_SetDailyMission()
end


function PhucSinh2_TienDoNhiemVuNgay()
	local nQuestID = PhucSinh2_GetDailyMission() or 0
	if nQuestID == 0 then
		Talk(1,"",szNPCName.."Hi�n ng��i ch�a nh�n th� th�ch Ph�c sinh n�o.")
		return 0
	end
	local nPart = PhucSinh2_GetMissionPart()
	Talk(1,"",szNPCName.."Ng��i ph�i <color=yellow>"..tbPhucSinh2Name[nQuestID][1].."<color>. C�n th�c hi�n <color=red>"..nPart.."<color> l�n n�a �� ho�n th�nh nhi�m v�.")
end


function PhucSinh2_TienDoPhucSinh2()
	local nCount = PhucSinh2_GetCount()
	Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh <color=yellow>"..nCount.."/"..nMISSION_QTY.."<color> th� th�ch Ph�c Sinh 2.")
end

function PhucSinh2_NopItem()
	local nQuestID = PhucSinh2_GetDailyMission()
	PutinItemBox(tbPhucSinh2Name[nQuestID][1] ,1, szNPCName.."X�c nh�n n�p v�t ph�m n�y.", NOPVATPHAM_FILE, 1)
end


function PhucSinh2_NopNguyenLieu_Menu()
	local tbSay = {}
	for i=1, getn(tbNguyenLieuThuThap) do
		if gf_GetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[i][6]) == 0 then
			tinsert(tbSay, "N�p "..tbNguyenLieuThuThap[i][4].." "..tbNguyenLieuThuThap[i][5].."/#PhucSinh2_ThuThapNguyenLieu("..i..")")
		end
	end
	tinsert(tbSay, "Ta c�n chu�n b� th�m/gf_DoNothing")
	Say(szNPCName.."N�u c�c h� �� c� �� nguy�n li�u c�n thi�t, h�y nhanh ch�ng giao l�i cho ta.", getn(tbSay), tbSay)
end


function PhucSinh2_TestNhanNhiemVu_Menu()
	AskClientForNumber("PhucSinh2_SetDailyMission",1,41,"ID nhi�m v�:")
end


function PhucSinh2_HoanThanhNhanh()
	local nQuestID = PhucSinh2_GetDailyMission()
	PutinItemBox("Ho�n th�nh nhanh nhi�m v�" ,1, szNPCName.."X�c nh�n n�p v�t ph�m n�y.", HOANTHANHNHANH_FILE, 1)
end