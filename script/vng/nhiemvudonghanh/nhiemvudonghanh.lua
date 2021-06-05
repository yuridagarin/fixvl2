Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

TANGMATTICH_FILE = "\\script\\vng\\nhiemvudonghanh\\tangmattich.lua";
TANGTRAICAY_FILE = "\\script\\vng\\nhiemvudonghanh\\tangtraicay.lua";

--*************************************
-- Task: TSK_DONGHANH = 2189
-- From: 7/5/2013
-- End: ...
--*************************************

function NhiemVuDongHanh_Menu()
	local tbSay = {}
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetCount() == 365 and DongHanh_GetFinalAward() == 0 then
			tinsert(tbSay, "Ta �� v��t qua 365 nhi�m v�, ta mu�n nh�n th�nh qu�/NhiemVuDongHanh_FinalAward")
		end
		if DongHanh_GetStatus() == 1 and DongHanh_GetAward() == 1 then
			tinsert(tbSay, "Nh�n th��ng nhi�m v� ng�y/NhiemVuDongHanh_DailyAward")
		end
		tinsert(tbSay, "Nh�n nhi�m v� ��ng h�nh/NhiemVuDongHanh_Nhan")
		tinsert(tbSay, "Xem s� l��ng nhi�m v� �� th�c hi�n/NhiemVuDongHanh_Count")
		tinsert(tbSay, "Nh� Ch�n Nh�n ho�n th�nh gi�p nhi�m v� (ti�u hao 02 xu v�t ph�m + 02 v�ng)/NhiemVuDongHanh_Support")
		if gf_GetTaskByte(TSK_DONGHANH_COUNT,1) > 0 then
			tinsert(tbSay, "Ta mu�n nh�n th�m nhi�m v�/NhiemVuDongHanh_GetMore")
		end
		tinsert(tbSay, "Xem nhi�m v� hi�n t�i/NhiemVuDongHanh_Show")
		if DongHanh_GetMission() == 22 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "T�ng Long Quang Ch�n Nh�n 02 m�t t�ch./#DongHanh_TangMatTich(2)")
		end
		if DongHanh_GetMission() == 23 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "T�ng Long Quang Ch�n Nh�n 03 m�t t�ch./#DongHanh_TangMatTich(3)")
		end
		if DongHanh_GetMission() == 24 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "T�ng Long Quang Ch�n Nh�n 20 tr�i c�y./DongHanh_TangTraiCay")
		end
		if DongHanh_GetMission() == 25 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "T�ng Long Quang Ch�n Nh�n 8 v�ng v� 8 xu v�t ph�m./DongHanh_TangTien")
		end
	end
	tinsert(tbSay, "Ta ch� gh� th�m/gf_DoNothing")
	Say(szNPCName .."��ng h�nh ��ng h�nh, thi�n h� ��ng h�nh, giang h� hung hi�m, c�ng ta ��ng h�nh?", getn(tbSay), tbSay)
end


function NhiemVuDongHanh_Nhan()
	if DongHanh_GetCount() >= 365 then
		Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh t�t c� nhi�m v�, ta s� g�i ng��i khi c� nhi�m v� m�i.")
		return 0
	end
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName.."Ng��i ch�a tr� nhi�m v� l�n tr��c, h�y tr� nhi�m v� r�i m�i nh�n th�m nh�.")
		return 0
	end
	local nQty = gf_GetTaskByte(TSK_DONGHANH_COUNT, 1)
	if DongHanh_GetStatus() == 1 then
		Talk(1,"",szNPCName.."H�m nay ng��i �� ho�n th�nh "..nQty.." nhi�m v�, mai h�y quay l�i nh�.")
		return 0
	end
	
	if DongHanh_GetMission() ~= 0 then
		Talk(1,"",szNPCName.."H�m nay ng��i �� nh�n nhi�m v�, c�n kh�ng mau �i th�c hi�n?")
		return 0
	end
	
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh < 1 or nChuyenSinh > 4 then
		Talk(1,"",szNPCName.."�i�u ki�n chuy�n sinh kh�ng ph� h�p, ng��i kh�ng th� nh�n nhi�m v�.")
		return 0
	end
	
	DongHanh_SetMission()
end


function NhiemVuDongHanh_Count()
	Talk(1,"",szNPCName.."��n h�m nay ng��i �� ho�n th�nh <color=yellow>".. DongHanh_GetCount() .."/365<color> nhi�m v�, mai ti�p t�c c� g�ng nh�.")
end


function NhiemVuDongHanh_Show()
	local nMissionID = DongHanh_GetMission()
	if nMissionID > 0 then
		Talk(1,"",szNPCName.."Ta �� giao cho ng��i <color=yellow>".. tbDongHanhName[nMissionID][1] .."<color>, c�n kh�ng mau �i th�c hi�n?")
	else
		Talk(1,"", szNPCName.."Ng��i ch�a nh�n nhi�m v� h�m nay.")
	end
end


function NhiemVuDongHanh_DailyAward()
	if DongHanh_GetStatus() ~= 1 then
		Talk(1,"", szNPCName.."Ng��i ch�a ho�n th�nh y�u c�u c�a ta, ch�a th� nh�n th��ng.")
		return 0
	end

	if DongHanh_GetAward() == 0 then
		Talk(1,"", szNPCName.."Ng��i ch�a ho�n th�nh nhi�m v� ho�c �� nh�n th��ng.")
		return 0
	end
	
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	
	DongHanh_SetAward(0)
	DongHanh_AddCount()
	Talk(1,"",szNPCName.."Kh� khen cho ng��i �� ho�n th�nh nhi�m v� h�m nay. Mai h�y ti�p t�c ��n t�m ta nh�.")
	--gf_AddItemEx2({2,1,30341,1}, "T�ng R��ng", szLogTitle, "nh�n")
end


function DongHanh_TangTien()
	if GetCash() < 80000 then
		Talk(1,"", szNPCName.."Ng��i ch�a �� 8 v�ng, ta kh�ng nh�n ��u.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < 8 then
		Talk(1,"", szNPCName.."Ng��i ch�a �� 8 xu v�t ph�m, ta kh�ng nh�n ��u.")
		return 0
	end
	
	if Pay(80000) == 1 and DelItem(2,1,30230,8) == 1 then
		DongHanh_SetStatus()
	end
end


function DongHanh_TangMatTich(nQty)
	PutinItemBox("T�ng "..nQty.." M�t t�ch" ,nQty , szNPCName.."Ng��i t�ng ta "..nQty.." quy�n m�t t�ch n�y th�t ch�?", TANGMATTICH_FILE, 1)
end


function DongHanh_TangTraiCay()
	PutinItemBox("T�ng 20 tr�i c�y" ,1, szNPCName.."Ng��i t�ng ta 20 tr�i n�y th�t ch�?", TANGTRAICAY_FILE, 1)
end


function NhiemVuDongHanh_FinalAward()
	local tSay = 	{
		"Ta mu�n tu luy�n theo h��ng Long T�!/#DongHanh_select_translife(1)",
		"Ta mu�n tu luy�n theo h��ng H� T�!/#DongHanh_select_translife(2)",
		"Ta mu�n tu luy�n theo h��ng �ng T�!/#DongHanh_select_translife(3)",
		"Ta mu�n tu luy�n theo h��ng Ph�ng T�!/#DongHanh_select_translife(4)",
		"Ta suy ngh� l�i ��./gf_DoNothing",
	}
	Say(szNPCName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end


function DongHanh_select_translife(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if DongHanh_GetFinalAward() == 1 then
		Talk(1,"", szNPCName.."Ch�c m�ng ng��i �� tr� th�nh cao th� v� l�m, t� do b�n ba giang h�.")
		return 0
	end
	
	if DongHanh_GetCount() < 365 then
		Talk(1,"", szNPCName.."Ng��i ch�a v��t qua 365 th� th�ch, ta ch�a th� truy�n th� H�n Nguy�n C�ng cho ng��i.")
		return 0
	end 
	
	DongHanh_SetFinalAward()
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
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
	SetLevel(79,0)
	Msg2Player("�ang truy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
	AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> v��t qua th� th�ch Long Quang Ch�n Nh�n, ���c truy�n th� 8 th�nh <color=green>H�n Nguy�n C�ng<color> theo  h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color>!")
--		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
	gf_WriteLogEx(szLogTitle, "th��ng", 1, "Ph�n th��ng cu�i CS5")
	DoWait(15,15,10)
end


function NhiemVuDongHanh_Support()
	if DongHanh_GetMission() == 0 then
		Talk(1,"",szNPCName .. "Ng��i ch�a nh�n nhi�m v�, kh�ng c�n ta ph�i gi�p ��.")
		return 0
	end
	
	if DongHanh_GetStatus() == 1 then
		Talk(1,"",szNPCName .. "Ng��i �� ho�n th�nh nhi�m v�, kh�ng c�n ta ph�i gi�p ��.")
		return 0
	end
	
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName .. "Ng��i ch�a tr� nhi�m v� tr��c, ta kh�ng th� gi�p ��.")
		return 0
	end
	
	if GetCash() < 20000 then
		Talk(1,"",szNPCName .. "Ng��i kh�ng c� �� 2 v�ng, sao ta l�i ph�i gi�p.")
		return 0
	end
	if GetItemCount(2,1,30230) < 2 then
		Talk(1,"",szNPCName .. "Ng��i kh�ng c� �� 2 xu v�t ph�m, sao ta l�i ph�i gi�p.")
		return 0
	end
	if Pay(20000) == 1 and DelItem(2,1,30230,2) == 1 then
		DongHanh_SetStatus()
		gf_WriteLogEx(szLogTitle,"ho�n th�nh",1,"H� tr� ho�n th�nh")
	end
end


function NhiemVuDongHanh_GetMore()
	if DongHanh_GetStatus() ~= 1 then
		Talk(1,"",szNPCName .. "Nhi�m v� hi�n t�i ch�a ho�n th�nh, ng��i kh�ng c�n ph�i nh�n th�m.")
		return 0
	end
	
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName.."Ng��i ch�a tr� nhi�m v� l�n tr��c, h�y tr� nhi�m v� r�i m�i nh�n th�m nh�.")
		return 0
	end
	
	local nQty = gf_GetTaskByte(TSK_DONGHANH_COUNT,1) + 1
	if tbMissionQty[nQty] == nil then
		Talk(1,"",szNPCName .. "S� l�n th�c hi�n nhi�m v� h�m nay �� h�t, ta kh�ng th� gi�p ng��i th�m n�a.")
		return 0
	end
	
	if GetCash() < tbMissionQty[nQty]["nGold"]*10000 then
		Talk(1,"",szNPCName .."Ng��i kh�ng c� �� "..tbMissionQty[nQty]["nGold"].." v�ng, ta s� kh�ng gi�p.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMissionQty[nQty]["nXu"] then
		Talk(1,"",szNPCName .."Ng��i kh�ng c� �� "..tbMissionQty[nQty]["nXu"].." xu v�t ph�m, ta s� kh�ng gi�p.")
		return 0
	end
	
	if Pay(tbMissionQty[nQty]["nGold"]*10000) == 1 and DelItem(2,1,30230,tbMissionQty[nQty]["nXu"]) then
		gf_SetTaskByte(TSK_DONGHANH, 3, 0)
		gf_SetTaskBit(TSK_DONGHANH, 25, 0, 0)
		gf_SetTaskBit(TSK_DONGHANH, 26, 0, 0)
		Talk(1,"",szNPCName .."L� v�t c�a ng��i c�ng kh� h�u h�nh, ta vui l�ng cho ng��i nh�n ti�p nhi�m v� l�n "..(nQty))
	end
end