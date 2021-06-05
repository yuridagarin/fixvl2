--NPCĬ�϶Ի��ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

function main()
	local tbSay = {};
	
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) == 1 then
		tinsert(tbSay, VET_201402_MAIN);
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140930 then
		local nIsGetNV = mod(GetTask(TSK_THANGTIEN_PHUCSINH),10)
		if nIsGetNV == 0 then
			tinsert(tbSay, "Ta mu�n nh�n nhi�m v� T�ch L�y Ph�c Sinh/get_TichLuyPhucSinh")		
		elseif nIsGetNV == 1 then
			tinsert(tbSay, "Ta mu�n ��i �i�m t�ch l�y ph�c sinh/getpoint_TLPS")		
			tinsert(tbSay, "Ta mu�n xem s� �i�m t�ch l�y ph�c sinh/showpoint_TLPS")	
			tinsert(tbSay, "Ta mu�n th�ng ti�n ph�c sinh (ti�u hao 90 �i�m t�ch l�y ph�c sinh)/usepoint_TLPS")	
		end
	end
	if nDate >= 20130409 and nDate <= 20130421 then
 		tinsert(tbSay, "T�ch l�y 01 Ho�ng Kim ��i Ng�n Phi�u/#vng_nhiemvuthang4(1)")			
 		tinsert(tbSay, "T�ch l�y 10 ��i Ng�n Phi�u/#vng_nhiemvuthang4(2)")
 		tinsert(tbSay, "Nh�n th��ng ho�n th�nh �� 2 nhi�m v� t�ch l�y/vng_nhiemvuthang4_finish")
 		tinsert(tbSay, "T�m th�i ta kh�ng mu�n l�m/nothing")			
	end
	tinsert(tbSay, "Tho�t/nothing")
	Say("<color=green>L�c Tr�c �ng: <color>���ng ph� h�m nay th�t n�o nhi�t.",getn(tbSay),tbSay);
end

function vng_nhiemvuthang4(nType)
	local tbCheck ={
				[1] = {"Ho�ng Kim ��i Ng�n Phi�u", 30490, 1},
				[2] = {"��i Ng�n Phi�u", 199, 10},	
					}
	local nExp = 400000000
	if gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) >= 1 then
		Talk(1,"","��i hi�p �� ho�n th�nh nhi�m v� t�ch l�y "..tbCheck[nType][1]);
		return 0;
	end		
	if GetItemCount(2,1, tbCheck[nType][2]) < tbCheck[nType][3] then
		Talk(1,"","��i hi�p kh�ng mang theo �� "..tbCheck[nType][3].." "..tbCheck[nType][1].." �� ho�n th�nh nhi�m v�");
		return 0
	end
	if gf_Judge_Room_Weight(5,200," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C�c h� kh�ng nh�n ���c �i�m kinh nghi�m v� s� v��t qu� 2 t� �i�m !!!!")
		end
	end
	if DelItem(2,1,tbCheck[nType][2],tbCheck[nType][3]) == 1 then
		gf_SetTaskByte(TSK_NHIEMVUTHANG4,nType,gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) + 1)
		ModifyExp(nExp)
		AwardGenuineQi(7000)
		gf_AddItemEx2({2,1,30390,70},"��i th��ng lo�i "..tbCheck[nType][1],"NHIEM VU THANG 4 BK","Nh�n th�nh c�ng m�nh thi�n cang")
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 7000)
		else
			SetTask(701,GetTask(701) - 7000)
		end		
		Msg2Player("B�n nh�n ���c 7000 �i�m c�ng tr�ng�")		
		gf_WriteLogEx("NHIEM VU THANG 4", "nh�n th��ng th�nh c�ngi", 1, "Nh�n th��ng lo�i "..tbCheck[nType][1])		
	end
	
end

function vng_nhiemvuthang4_finish()
	local nValue1 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,1)
	local nValue2 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,2)
	local nValue3 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,3)
	if nValue1 < 1 or nValue2 < 1 then
		Talk(1,"", "��i hi�p ch�a ho�n th�nh �� 2 nhi�m v� t�ch l�y n�n kh�ng th� nh�n th��ng !!")
		return 0
	end
	if nValue3 >= 1 then
		Talk(1,"", "��i hi�p �� nh�n th��ng ho�n th�nh �� 2 nhi�m v� t�ch l�y r�i !!")
		return 0
	end
	if gf_Judge_Room_Weight(17,200," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end	
	gf_SetTaskByte(TSK_NHIEMVUTHANG4,3,gf_GetTaskByte(TSK_NHIEMVUTHANG4,3) + 1)	
	gf_AddItemEx2({2,1,9977,7},"Ho�n th�nh 2 nv t�ch l�y","NHIEM VU THANG 4 BK","Nh�n th�nh c�ng 7 Huy Ho�ng", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,9998,7},"Ho�n th�nh 2 nv t�ch l�y","NHIEM VU THANG 4 BK","Nh�n th�nh c�ng 7 C�ng ��i", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,30345,1,1},"Ho�n th�nh 2 nv t�ch l�y","NHIEM VU THANG 4 BK","Nh�n th�nh c�ng 1 Chuy�n Sinh ��n", 60 * 24 * 3600)	
	gf_WriteLogEx("NHIEM VU THANG 4", "nh�n th��ng th�nh c�ngi", 1, "Nh�n th��ng ho�n th�nh 2 l�n t�ch l�y")				
end

function get_TichLuyPhucSinh()
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if tRoute[nRoute] ~= 1 then	
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>Ch�a gia nh�p h� ph�i, kh�ng th� tham gia ho�t ��ng n�y.");
		return 0
	end	
	if nChuyenSinh < 599 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p kh�ng ��, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p qu� cao, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end

	SetTask(TSK_THANGTIEN_PHUCSINH,1)
	gf_WriteLogEx("THANG TIEN PHUC SINH", "nh�n nv", 1, "Nh�n nhi�m v� TTPS")	
	Talk(1, "", "<color=green>L�c Tr�c �ng: <color>Ch�c m�ng b�n �� nh�n nhi�m v� Th�ng Ti�n Ph�c Sinh th�nh c�ng")
end

function getpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "��i hi�p ch�a nh�n nhi�m v�.");
		return 0
	end
	local nThaiHu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,6,6)
	local nThoNuong = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,7,7)
	local nTongLieu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,8,8)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nMaxAllow = 90
	if nThaiHu < 1 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>H�m nay b�n ch�a ho�n th�nh 1 l�n Th�i H� (thu ph�) n�n kh�ng th� ��i �i�m t�ch l�y. H�y mau �i ho�n th�nh nhi�m v� Th�i H� !!!!")
		return 0
	end
	if nThoNuong < 1 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>H�m nay b�n ch�a ho�n th�nh nhi�m v� Th� N��ng n�n kh�ng th� ��i �i�m t�ch l�y. H�y mau �i ho�n th�nh nhi�m v� Th� N��ng !!!!")
		return 0
	end	
	if nTongLieu < 1 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>H�m nay b�n ch�a ho�n th�nh 1 nhi�m v� T�ng Li�u n�n kh�ng th� ��i �i�m t�ch l�y. H�y mau �i ho�n th�nh 1 nhi�m v� T�ng Li�u !!!!")
		return 0
	end		
--	if nTodayPoint >= 10 then
--		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>H�m nay b�n �� ��i �� 10 �i�m t�ch l�y r�i, ng�y mai h�y quay l�i nha !!!!")
--		return 0
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>B�n �� ��i �� 90 �i�m r�i, h�y th�c hi�n Th�ng Ti�n Ph�c Sinh �i !!!!")
		return 0
	end	
	local tbSay = {}
	tinsert(tbSay, "��i 1 �i�m t�ch l�y (ti�u hao 100 tri�u kinh nghi�m + 10 xu v�t ph�m + 10 v�ng/#takePoint(1)")			
	tinsert(tbSay, "��i 5 �i�m t�ch l�y (ti�u hao 500 tri�u kinh nghi�m + 50 xu v�t ph�m + 50 v�ng/#takePoint(5)")			
	tinsert(tbSay, "��i 10 �i�m t�ch l�y (ti�u hao 1 t� kinh nghi�m + 100 xu v�t ph�m + 100 v�ng/#takePoint(10)")					
	tinsert(tbSay, "T�m th�i ta kh�ng mu�n l�m/nothing")			
	
	Say("<color=green>L�c Tr�c �ng: <color>Ta c� th� gi�p ��i hi�p ��i �i�m t�ch l�y Th�ng Ti�n Ph�c Sinh",getn(tbSay),tbSay);	
end

function takePoint(nType)
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "��i hi�p ch�a nh�n nhi�m v�.");
		return 0
	end
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nMaxToday = 10
	local nMaxAllow = 90
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30230,10}}},nExp = 100000000, nGold = 100000},
		[5] = {item={{gdp={2,1,30230,50}}},nExp = 500000000, nGold = 500000},
		[10] = {item={{gdp={2,1,30230,100}}},nExp = 1000000000, nGold = 1000000},
	}
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nType])
	if nCheck == 0 then
		return 0
	end	
	local nCheck_reset = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,9,9)
--	if nCheck_reset == 1 then
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 5, 4) -- Reset doi diem moi ngay
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 9, 9)
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>B�n �� ��i �� 90 �i�m r�i, h�y th�c hi�n Th�ng Ti�n Ph�c Sinh �i !!!!")
		return 0
	end	
--	if (nTodayPoint + nType) > nMaxToday then
--		Talk(1,"","<color=green>L�c Tr�c �ng: <color>M�c �i�m ��i trong ng�y v��t qu� gi�i h�n "..nMaxToday..", c�c h� h�y ch�n m�c ��i kh�c.")
--		return 0
--	end

	LIB_Award:PayMaterial(tbMaterial[nType])
	nCurrentPoint = nCurrentPoint + nType
	nTodayPoint = nTodayPoint + nType
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nCurrentPoint,3,2)
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nTodayPoint,5,4)
	Talk(1, "", "<color=green>L�c Tr�c �ng: <color> Ch�c m�ng ��i hi�p ��i th�nh c�ng "..nType.." �i�m t�ch l�y")
	gf_WriteLogEx("THANG TIEN PHUC SINH", "��i �i�m", 1, nType.." �i�m t�ch c�c")							
end

function showpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>��i hi�p ch�a nh�n nhi�m v�.");
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local zString = "<color=green>L�c Tr�c �ng: <color>\n"
	zString = zString.."T�ng �i�m t�ch l�y hi�n t�i c�a b�n l�: <color=yellow>"..nPoint.." �i�m<color>\n"
	zString =	zString.."�i�m ��i trong ng�y l�: <color=yellow>"..nTodayPoint.." �i�m<color>"
				
	Talk(1, "", zString)
end

function usepoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>��i hi�p ch�a nh�n nhi�m v�.");
		return 0
	end
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	local tHeader = "<color=green>L�c Tr�c �ng: <color>��i hi�p qu� l� m�t k� nh�n trong V� L�m, b�t ��u l�nh ng� b� k�p <color=yellow>T� Linh Ph�c Sinh<color> �� ��t ph� b�nh c�nh. L�nh ng� th�nh c�ng c� th� kich th�ch ti�m l�c c�a b�n th�n ��t c�nh gi�i m�i trong �� Th�ng Kinh M�ch. !!!"
	local tSay = {}	
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#cs6_ttps_finish_confrim(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#cs6_ttps_finish_confrim(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#cs6_ttps_finish_confrim(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#cs6_ttps_finish_confrim(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end

function cs6_ttps_finish_confrim(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	if nChuyenSinh < 599 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p kh�ng ��, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p qu� cao, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end
	--- b�t �i�u ki�n � ��y
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	if MeridianGetLevel() < 2 then	
		Talk(1,"","Kinh m�ch c�a ��i hi�p ch�a ��t c�p �� V� T��ng !!!!")
		return 0			
	end
	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
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
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy�n Sinh 6 th�nh c�ng		
	SetLevel(10,0)
	AddTitle(61,05)
--	SetTask(TSK_CS6_TULINH,5)		--ho�n th�nh nh�m v� chuy�n sinh
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 2, 1, 1)
 	gf_WriteLogEx("THANG TIEN PHUC SINH", "chuy�n sinh th�nh c�ng", 1, "Finish nv Th�ng Ti�n Ph�c Sinh")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")
end

function check_rule()
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	if nPoint < 90 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>��i hi�p t�ch ch�a l�y �� 90 �i�m Th�ng Ti�n Ph�c Sinh.");
		return 0
	end
	if GetItemCount(2,1,30345) < 2 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>��i hi�p kh�ng mang �� 2 Chuy�n Sinh ��n.");
		return 0
	end
	if GetItemCount(2,0,1083) < 2 then
		Talk(1, "", "<color=green>L�c Tr�c �ng: <color>��i hi�p kh�ng mang �� 2 Th�i D�ch H�n Nguy�n C�ng Ph�.");
		return 0
	end
	return 1
end


function nothing()

end
