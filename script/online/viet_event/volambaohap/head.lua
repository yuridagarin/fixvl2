Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

MAX_KEY_EXP = 1800000000
VLBH_MAX_DAY =  200
VLBH_MAX_WEEK = 1400
VLBH_MAX_Qi = 1500
VLBH_MAX_QUANCONG = 52500

tExpKeyAward =
{
	[1] = {"Ch�a Kh�a Thanh ��ng", 30135, 1000000, 0, 1},
	[2] = {"Ch�a Kh�a B�ch Ng�n", 30134, 10000000, 200, 15},
	[3] = {"Ch�a Kh�a V�ng", 30133, 120000000, 3500, 100},
}
-- Ch� th�ch: item name, ch� s� P c�a item, exp, qu�n c�ng, ch�n khi

function vlbh_exchange_key_gold()
	if GetLevel() < 79 then
		Talk(1, "", "��ng c�p 79 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
		return
	end	
	local tSay = {}
	local szHeader = "��i hi�p mu�n ��i lo�i ch�a kh�a n�o?"
	tinsert(tSay, "��i Ch�a Kh�a Thanh ��ng (c�n 10 V� L�m B�o H�p v� 11 v�ng)/vlbh_exchange_bronzekey")
	tinsert(tSay, "��i Ch�a Kh�a B�ch Ng�n (c�n 100 V� L�m B�o H�p v� 123 v�ng)/vlbh_exchange_silverkey")
	tinsert(tSay, "��i Ch�a Kh�a V�ng (c�n 999 V� L�m B�o H�p v� 1200 v�ng)/vlbh_exchange_goldenkey")
	tinsert(tSay, "��i 1 Huy Hi�u Chi�n C�ng Huy Ho�ng (c�n 999 V� L�m B�o H�p v� 869 v�ng)/vlbh_exchange_HCHH")
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	Say(szHeader, getn(tSay), tSay)
end


function vlbh_exchange_key_xu()
	if GetLevel() < 79 then
		Talk(1, "", "��ng c�p 79 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
		return
	end	
	local tSay = {}
	local szHeader = "��i hi�p mu�n ��i lo�i ch�a kh�a n�o?"
	tinsert(tSay, "��i Ch�a Kh�a Thanh ��ng (c�n 10 V� L�m B�o H�p v� 3 xu v�t ph�m)/vlbh_exchange_bronzekey_xu")
	tinsert(tSay, "��i Ch�a Kh�a B�ch Ng�n (c�n 100 V� L�m B�o H�p v� 30 xu v�t ph�m)/vlbh_exchange_silverkey_xu")
	tinsert(tSay, "��i Ch�a Kh�a V�ng (c�n 999 V� L�m B�o H�p v� 349 xu v�t ph�m)/vlbh_exchange_goldenkey_xu")
	tinsert(tSay, "��i 1 Huy Hi�u Chi�n C�ng Huy Ho�ng (c�n 999 V� L�m B�o H�p v� 249 xu v�t ph�m)/vlbh_exchange_HCHH_xu")
	tinsert(tSay, "��i 1 Huy Hi�u Chi�n C�ng ��i (c�n 399 V� L�m B�o H�p v� 99 xu v�t ph�m)/vlbh_exchange_HCDai_xu")
	tinsert(tSay, "��i 1 Qu�n C�ng Ch��ng (c�n 99 V� L�m B�o H�p v� 24 xu v�t ph�m)/vlbh_exchange_QCC_xu")
	tinsert(tSay, "��i 1 T� Linh Ti�n ��n (c�n 449 V� L�m B�o H�p v� 249 xu v�t ph�m)/vlbh_exchange_TLTDon_xu")
--	tinsert(tSay, "��i 1 ��i Ng�n Phi�u (c�n 149 V� L�m B�o H�p v� 90 xu v�t ph�m)/vlbh_exchange_DaiNganPhieu_xu")
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	Say(szHeader, getn(tSay), tSay)
end


function vlbh_receive_key_prize()
	if GetLevel() < 79 then
		Talk(1, "", "��ng c�p 79 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
--		return
--	end		
	local tSay = {}
	local szHeader = "��i hi�p h�y ch�n lo�i ch�a kh�a �� m� th��ng, l�u � l� ch� c� th� nh�n th��ng t�i �a 180.000 v�n �i�m kinh nghi�m t� ch�a kh�a m�i tu�n:"
	
	tinsert(tSay, "Nh�n th��ng b�ng Ch�a Kh�a Thanh ��ng/#receive_keyprize(1)")
	tinsert(tSay, "Nh�n th��ng b�ng Ch�a Kh�a B�ch Ng�n/#receive_keyprize(2)")
	tinsert(tSay, "Nh�n th��ng b�ng Ch�a Kh�a V�ng/#receive_keyprize(3)")
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

-- ��i ch�a kh�a b�ng v�ng
function vlbh_exchange_bronzekey()
	AskClientForNumber("confirm_exchange_bronzekey", 1, 10, "Ch�a Kh�a ��ng:")
end

function vlbh_exchange_silverkey()
	AskClientForNumber("confirm_exchange_silverkey", 1, 10, "Ch�a Kh�a B�c:")
end

function vlbh_exchange_goldenkey()
	AskClientForNumber("confirm_exchange_goldenkey", 1, 10, "Ch�a Kh�a V�ng:")
end

function vlbh_exchange_HCHH()
	AskClientForNumber("confirm_vlbh_exchange_HCHH", 1, 10, "Hu�n Ch��ng Huy Ho�ng:")
end

function confirm_exchange_bronzekey(nCount)
	local nGold = 110000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
     if GetItemCount(2, 1, 30132) < (10 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� v�ng �� ��i!")
		return
	end
	if DelItem(2, 1, 30132, 10 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30135, nQuantity}, "Ch�a kh�a Thanh ��ng ��i = v�ng", "Vo Lam Bao Hap", "��i Ch�a kh�a Thanh ��ng")
	end
end

function confirm_exchange_silverkey(nCount)
	local nGold = 1230000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
     if GetItemCount(2, 1, 30132) < (100 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� v�ng �� ��i!")
		return
	end
	if DelItem(2, 1, 30132, 100 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30134, nQuantity}, "Ch�a kho� B�ch Ng�n ��i = v�ng", "Vo Lam Bao Hap", "��i Ch�a kho� B�ch Ng�n")
	end	
end

function confirm_exchange_goldenkey(nCount)
	local nGold = 12000000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� v�ng �� ��i!")
		return
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30133, nQuantity}, "Ch�a Kh�a V�ng ��i = v�ng", "Vo Lam Bao Hap", "��i Ch�a Kh�a V�ng")
	end
end

function confirm_vlbh_exchange_HCHH(nCount)
	local nGold = 8690000
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetCash() < (nGold * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� v�ng �� ��i!")
		return
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and Pay(nGold * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9977, nQuantity}, "Huy hi�u Huy Ho�ng ��i = v�ng", "Vo Lam Bao Hap", "��i Huy Hi�u Huy Ho�ng",7*24*3600)
	end
end


-- ��i ch�a kh�a b�ng xu
function vlbh_exchange_bronzekey_xu()
	AskClientForNumber("confirm_exchange_bronzekey_xu", 1, 10, "Ch�a Kh�a ��ng:")
end

function vlbh_exchange_silverkey_xu()
	AskClientForNumber("confirm_exchange_silverkey_xu", 1, 10, "Ch�a Kh�a B�c:")
end

function vlbh_exchange_goldenkey_xu()
	AskClientForNumber("confirm_exchange_goldenkey_xu", 1, 10, "Ch�a Kh�a V�ng:")
end

function vlbh_exchange_HCHH_xu()
	AskClientForNumber("confirm_vlbh_exchange_HCHH_xu", 1, 10, "Hu�n Ch��ng Huy Ho�ng:")
end

function vlbh_exchange_HCDai_xu()
	AskClientForNumber("confirm_vlbh_exchange_HCDai_xu", 1, 10, "Hu�n Ch��ng ��i:")
end

function vlbh_exchange_QCC_xu()
	AskClientForNumber("confirm_vlbh_exchange_QCC_xu", 1, 10, "Hu�n C�ng Ch��ng:")
end

function vlbh_exchange_TLTDon_xu()
	AskClientForNumber("confirm_vlbh_exchange_TLTDon_xu", 1, 10, "T� Linh Ti�n ��n:")
end

function vlbh_exchange_DaiNganPhieu_xu()
	AskClientForNumber("confirm_vlbh_exchange_DaiNganPhieu_xu", 1, 10, "��i Ng�n Phi�u:")
end

function confirm_exchange_bronzekey_xu(nCount)
	local nXu = 3
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (10 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 10 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30135, nQuantity}, "Ch�a kh�a Thanh ��ng ��i = xu", "Vo Lam Bao Hap", "��i Ch�a kh�a Thanh ��ng - xu")
	end
end

function confirm_exchange_silverkey_xu(nCount)
	local nXu = 30
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (100 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 100 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30134, nQuantity}, "Ch�a kho� B�ch Ng�n ��i = xu", "Vo Lam Bao Hap", "��i Ch�a kho� B�ch Ng�n - xu")
	end	
end

function confirm_exchange_goldenkey_xu(nCount)
	local nXu = 349
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30133, nQuantity}, "Ch�a Kh�a V�ng ��i = xu", "Vo Lam Bao Hap", "��i Ch�a Kh�a V�ng - xu")
	end
end

function confirm_vlbh_exchange_HCHH_xu(nCount)
	local nXu = 249
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (999 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 999 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9977, nQuantity}, "Hu�n Ch��ng Huy Ho�ng ��i = xu", "Vo Lam Bao Hap", "��i Hu�n Ch��ng Huy Ho�ng - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_HCDai_xu(nCount)
	local nXu = 99
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (399 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 399 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9998, nQuantity}, "Hu�n Ch��ng ��i ��i = xu", "Vo Lam Bao Hap", "��i Hu�n Ch��ng ��i - xu",7*24*3600)
	end
end


function confirm_vlbh_exchange_QCC_xu(nCount)
	local nXu = 24
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (99 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 99 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 9999, nQuantity}, "Hu�n C�ng Ch��ng ��i = xu", "Vo Lam Bao Hap", "��i Hu�n C�ng Ch��ng - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_TLTDon_xu(nCount)
	local nXu = 249
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (449 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 449 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30460, nQuantity}, "T� Linh Ti�n ��n ��i = xu", "Vo Lam Bao Hap", "��i T� Linh Ti�n ��n - xu",7*24*3600)
	end
end

function confirm_vlbh_exchange_DaiNganPhieu_xu(nCount)
	local nXu = 90
	local nQuantity = tonumber(nCount)
	if check_quantity(nQuantity) == 0 then
		return 0
	end
	 if GetItemCount(2, 1, 30132) < (149 * nQuantity) or GetItemCount(2, 1, 30230) < (nXu * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� V� L�m B�o H�p ho�c kh�ng �� xu v�t ph�m �� ��i!")
		return 0
	end
	if DelItem(2, 1, 30132, 149 * nQuantity) == 1 and DelItem(2, 1, 30230, nXu * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 199, nQuantity}, "��i Ng�n Phi�u ��i = xu", "Vo Lam Bao Hap", "��i ��i Ng�n Phi�u - xu",7*24*3600)
	end
end

-- Nh�n th��ng ch�a kh�a
function receive_keyprize(nType)
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))


--	if MeridianGetLevel()==0 then
--		VLBH_MAX_Qi = 0
--	end
-- Reset kinh nghi�m tu�n
	if nReceiveWeek ~= nCurrentWeek then
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)
		SetTask(TSK_VLBH_Qty,0)
		SetTask(TSK_VLBH_QUANCONG,0)
	end
			
	local nCurrentExpVLBH = GetTask(TSK_VLBH_EXP)
	local nCurrentQiVLBH = GetTask(TSK_VLBH_QI)
	local nCurrentQuanCong = GetTask(TSK_VLBH_QUANCONG)

	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 390000 > 2000000000 then
			Talk(1,"",format("C�c h� kh�ng nh�n ���c �i�m kinh nghi�m v� s� v��t qu� 2 t� �i�m !!!!!"))
			--return 0
		end
	end	
-- Check max exp, ch�n kh�
	if nCurrentExpVLBH >= MAX_KEY_EXP  then	--and nCurrentQiVLBH>=VLBH_MAX_Qi
		Talk(1, "", "�� nh�n ���c t�i �a m�c �i�m kinh nghi�m trong tu�n, kh�ng th� nh�n th�m n�a!")
		return
	end
	
	if nCurrentQuanCong >= VLBH_MAX_QUANCONG  then
		Talk(1, "", "�� nh�n ���c t�i �a m�c �i�m c�ng tr�ng  trong tu�n, kh�ng th� nh�n th�m n�a!")
		return
	end
	
	local nExp = min(MAX_KEY_EXP - nCurrentExpVLBH, tExpKeyAward[nType][3])
	local nQuanCong = min(VLBH_MAX_QUANCONG - nCurrentQuanCong, tExpKeyAward[nType][4])
--	local nQi = min(VLBH_MAX_Qi - nCurrentQiVLBH, tExpKeyAward[nType][5])
---- �� ph�ng ch�n kh� �m
--	if nQi<0 then
--		nQi = 0
--	end
	
-- ��i th��ng
	SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
	if DelItem(2, 1, tExpKeyAward[nType][2], 1) == 1 then
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
		--- �i�m V�n May
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--		else
--			Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--		end
		---------			
		SetTask(TSK_VLBH_EXP, nCurrentExpVLBH + nExp)
		SetTask(TSK_VLBH_QUANCONG, nCurrentQuanCong + nQuanCong)
--		if MeridianGetLevel() > 0 then
--			AwardGenuineQi(nQi)
--			SetTask(TSK_VLBH_Qi, nCurrentQiVLBH + nQi)
--		end
		
		if nQuanCong > 0 then
			if GetTask(701) ~= 0 then
				if GetTask(701) > 0 then
					SetTask(701, GetTask(701) + tExpKeyAward[nType][4])
				elseif GetTask(701) < 0 then
					SetTask(701, GetTask(701) - tExpKeyAward[nType][4])
				end
				Msg2Player("B�n nh�n ���c "..tExpKeyAward[nType][4].." �i�m qu�n c�ng!")
			end
		end
		if nType == 3 then
			SetTask(TSK_VLBH_QI, nCurrentQiVLBH + 1)
		end
		 gf_WriteLogEx("Vo Lam Bao Hap", "nh�n th��ng", 1, "nh�n th��ng "..tExpKeyAward[nType][1])
		--WriteLogEx("Vo Lam Bao Hap", "nh�n th��ng "..tExpKeyAward[nType][1])
	else
		Talk(1,"","��i Hi�p kh�ng mang theo "..tExpKeyAward[nType][1].. " trong h�nh trang.")
		return
	end
	vlbh_receive_key_prize()
end

function check_quantity(nQuantity)
	if nQuantity == nil then
		return 0
	end
	if nQuantity < 1 or nQuantity > 10 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, ch� cho ph�p nh�p s� t� 1 ��n 10 xin vui l�ng nh�p l�i!")
		return 0
	end
	if gf_Judge_Room_Weight(2, nQuantity + 100," ") ~= 1 then
        	return 0
     end
     return 1
end

function Rec_VLBH()
	local nQty = 1
	local nMaxDay = 100
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))
	
	local nTotalReceiveWeek = floor(tonumber(GetTask(TSK_VLBH_Qty)/100000))
	local nTotalReceiveDay = floor(mod(GetTask(TSK_VLBH_Qty),100000)/10)
	local nHoTroNhanVLBH = mod(GetTask(TSK_VLBH_Qty),10)
	local nHour = tonumber(date("%H%M"))
	if (nHour >= 0000 and nHour < 0830) or (nHour > 1030 and nHour < 1530) or (nHour > 1730 and nHour < 2000) or (nHour > 2200 and nHour < 2359) then
		Talk(1,"","Ch�a ��n gi� nh�n b�o h�p, c�c h� vui l�ng quay l�i sau");
		return
	end
	if GetLevel() < 80 then --or GetReputation() < 3000 then
		Talk(1,"","��i hi�p ch�a �� �i�u ki�n �� nh�n v� l�m b�o h�p, vui l�ng quay l�i sau");
		return
	end
	if gf_Check55MaxSkill() == 0 then
		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
		return
	end	
--	if GetLevel() >= 82 then
		nQty =  2
--		nMaxDay = VLBH_MAX_DAY
--	end
	
-- Reset s� l��ng nh�n theo ng�y	
	if nReceiveDate ~= nCurrentDate then
		nTotalReceiveDay = 0
		nHoTroNhanVLBH = 0
	end
-- Reset s� l��ng nh�n theo tu�n
	if nReceiveWeek ~= nCurrentWeek then
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)
		nTotalReceiveWeek = 0
		SetTask(TSK_VLBH_QUANCONG,0)
	end
	
 --Check delay nh�n b�o h�p (c�ch 3 ph�t)
	local nTimePoint = GetTask(TSK_VLBH_TIME)
	if (GetTime()  - nTimePoint ) < 180 then
		Talk(1,"","C�n "..(2 - floor((GetTime()  - nTimePoint )/60)).." ph�t "..(60 - mod((GetTime()  - nTimePoint ),60)).." gi�y n�a m�i c� th� ��i V� L�m B�o H�p ti�p.")
		return
	end
-- IP bonus
--	if GetExtPoint(4) == 1 then
--		VLBH_MAX_DAY =  200
--		VLBH_MAX_WEEK = 1400
--	else
--		VLBH_MAX_DAY =  100
--		VLBH_MAX_WEEK = 700
--	end
-- Check nh�n max trong ng�y
	if nTotalReceiveDay >= nMaxDay then
		Talk(1,"","H�m nay ng��i �� nh�n �� ".. nMaxDay.." V� L�m B�o H�p r�i!")
		return
	end

-- Check nh�n max trong tu�n
	if nTotalReceiveWeek >= VLBH_MAX_WEEK then
		Talk(1,"","Tu�n n�y ng��i �� nh�n ".. VLBH_MAX_WEEK .." V� L�m B�o H�p r�i!")
		return
	end
	
	if gf_Judge_Room_Weight(1, 100,"") == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�");
		return
	end
	
--	if GetExtPoint(4) == 1 then
--		nTotalReceiveDay = nTotalReceiveDay +2
--		nTotalReceiveWeek = nTotalReceiveWeek + 2
--	else
		nTotalReceiveDay = nTotalReceiveDay +nQty
		nTotalReceiveWeek = nTotalReceiveWeek + nQty
--	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nh�n th�nh c�ng", 1, "T�ng s� l�n click nh�n th�nh c�ng")
	if nTotalReceiveDay == nMaxDay then
		gf_WriteLogEx("Vo Lam Bao Hap", "nh�n th�nh c�ng", 1, "Nh�n Max VLBH trong ng�y")
	end
	if nTotalReceiveWeek == VLBH_MAX_WEEK then
		gf_WriteLogEx("Vo Lam Bao Hap", "nh�n th�nh c�ng", 1, "Nh�n Max VLBH trong tu�n")
	end
	SetTask(TSK_VLBH_TIME,GetTime())
	SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
	SetTask(TSK_VLBH_Qty, (nTotalReceiveWeek*10000 + nTotalReceiveDay)*10 + nHoTroNhanVLBH)
--	if GetExtPoint(4) == 1 then
--		gf_AddItemEx2({2,1,30132,2}, "V� L�m B�o H�p", "Vo Lam Bao Hap", "nh�n")
--		Msg2Player("B�n nh�n ���c 2 V� L�m B�o H�p!")
--	else
		gf_AddItemEx2({2,1,30132,nQty}, "V� L�m B�o H�p", "Vo Lam Bao Hap", "nh�n")
		Msg2Player("B�n nh�n ���c "..nQty.." V� L�m B�o H�p!")
--	end

end

function Rec_VLBH_2()
	if GetCash()<200000 then
		Talk(1,"","Nh�n V� L�m B�o H�p ti�n l�i c�n t�n 20 v�ng, c�c h� �� �em �� ch�a?");
		return
	end
	local nQty = 20
	local nDayQty = 0
	local nWeekQty = 0
	local nRealQty = 0
	local nReceiveDate = floor(tonumber(GetTask(TSK_VLBH_MARK)/100))
	local nReceiveWeek = mod(GetTask(TSK_VLBH_MARK),100)
	local nCurrentDate = tonumber(date("%m%d"))
	local nCurrentWeek = tonumber(date("%W"))
	
	local nTotalReceiveWeek = floor(tonumber(GetTask(TSK_VLBH_Qty)/10000))
	local nTotalReceiveDay = mod(GetTask(TSK_VLBH_Qty),10000)

-- Reset s� l��ng nh�n theo ng�y	
	if nReceiveDate ~= nCurrentDate then
		nTotalReceiveDay = 0
	end
-- Reset s� l��ng nh�n theo tu�n
	if nReceiveWeek ~= nCurrentWeek then
		nTotalReceiveWeek = 0
		SetTask(TSK_VLBH_EXP,0)
		SetTask(TSK_VLBH_QI,0)	
		SetTask(TSK_VLBH_QUANCONG,0)		
	end
	
 --Check delay nh�n b�o h�p (c�ch 15 ph�t)
	local nTimePoint = GetTask(TSK_VLBH_TIME2)
	if (GetTime()  - nTimePoint ) < (15*60) then
		Talk(1,"","C�n "..(14 - floor((GetTime()  - nTimePoint )/60)).." ph�t "..(60 - mod((GetTime()  - nTimePoint ),60)).." gi�y n�a m�i c� th� ��i V� L�m B�o H�p ti�p.")
		return
	end

-- Check nh�n max trong ng�y
	if nTotalReceiveDay>=VLBH_MAX_DAY then
		Talk(1,"","H�m nay ng��i �� nh�n �� ".. VLBH_MAX_DAY.." V� L�m B�o H�p r�i!")
		return
	end

-- Check nh�n max trong tu�n
	if nTotalReceiveWeek>=VLBH_MAX_WEEK then
		Talk(1,"","Tu�n n�y ng��i �� nh�n ".. VLBH_MAX_WEEK .." V� L�m B�o H�p r�i!")
		return
	end
	
	if gf_Judge_Room_Weight(1, 100,"") == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�");
		return
	end
	
	-- Check s� l��ng th�c nh�n
	nDayQty = min(VLBH_MAX_DAY - nTotalReceiveDay, nQty)
	nWeekQty = min(VLBH_MAX_WEEK - nTotalReceiveWeek, nQty)
	nRealQty = min(nDayQty, nWeekQty)
		
	if Pay(200000)==1 then
		nTotalReceiveDay = nTotalReceiveDay + nRealQty
		nTotalReceiveWeek = nTotalReceiveWeek + nRealQty
		SetTask(TSK_VLBH_TIME2,GetTime())
		SetTask(TSK_VLBH_MARK, nCurrentDate*100 + nCurrentWeek)
		SetTask(TSK_VLBH_Qty, (nTotalReceiveWeek*10000 + nTotalReceiveDay)*10 + nHoTroNhanVLBH)
		
		gf_AddItemEx2({2,1,30132,nRealQty}, "V� L�m B�o H�p", "Vo Lam Bao Hap", "nh�n")
		Msg2Player("B�n nh�n ���c "..nRealQty.." V� L�m B�o H�p!")
	end
end


function gold_key_shop()
	tbSay = {}
	tinsert(tbSay,"Ta mu�n ��i 01 C��ng h�a quy�n c�p 12 (ti�u hao 3 ch�a kh�a v�ng)/#gold_key_shop_trade(2)")
	tinsert(tbSay,"Ta mu�n ��i 01 C��ng h�a quy�n c�p 13 (ti�u hao 6 ch�a kh�a v�ng)/#gold_key_shop_trade(3)")
	tinsert(tbSay,"Ta mu�n ��i 01 C��ng h�a quy�n c�p 14 (ti�u hao 5 ch�a kh�a v�ng)/#gold_key_shop_trade(4)")
	tinsert(tbSay,"Ta mu�n ��i 01 C��ng h�a quy�n c�p 15 (ti�u hao 6 ch�a kh�a v�ng)/#gold_key_shop_trade(5)")
	tinsert(tbSay,"Ta mu�n d�ng 01 ch�a kh�a v�ng �� nh�n th��ng ng�u nhi�n/#gold_key_shop_trade(1)")
	tinsert(tbSay,"Ta ch� xem th�/do_nothing")
	Say("Ta c� m�t s� v�t ph�m qu�, c�c h� c� mu�n d�ng ch�a kh�a v�ng �� ��i l�y kh�ng?", getn(tbSay), tbSay)
end


function gold_key_shop_trade(nOrder)
	local tbTHKhacBan1 = {item={{gdp={2,1,30406,1}, name ="Thi�n Huy�n Kh�c B�n c�p 1"}}}
	local tbTHKhacBan2 = {item={{gdp={2,1,30407,1}, name ="Thi�n Huy�n Kh�c B�n c�p 2"}}}
	local tbTHKhacBan3 = {item={{gdp={2,1,30408,1}, name ="Thi�n Huy�n Kh�c B�n c�p 3"}}}
	local tbMaDaoThach1 = {item={{gdp={2,1,30428,1}, name ="Ma �ao Th�ch c�p 1", nExpired = 15*24*60*60}}}
	local tbMaDaoThach2 = {item={{gdp={2,1,30429,1}, name ="Ma �ao Th�ch c�p 2", nExpired = 15*24*60*60}}}
	local tbMaDaoThach3 = {item={{gdp={2,1,30430,1}, name ="Ma �ao Th�ch c�p 3", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen12 = {item={{gdp={2,1,30424,1}, name ="C��ng h�a quy�n 12", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen13 = {item={{gdp={2,1,30425,1}, name ="C��ng h�a quy�n 13", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen14 = {item={{gdp={2,1,30426,1}, name ="C��ng h�a quy�n 14", nExpired = 15*24*60*60}}}
	local tbCuongHoaQuyen15 = {item={{gdp={2,1,30427,1}, name ="C��ng h�a quy�n 15", nExpired = 15*24*60*60}}}
	local tbManhBachKim = {item={{gdp={2,1,30346,1}, name ="M�nh B�ch Kim"}}}
	local tbExp = {nExp = 5000000}
	local tbAwardSet = {
		[1] = {[1] = tbTHKhacBan1, nRate = 5},
		[2] = {[1] = tbTHKhacBan2, nRate = 5},
		[3] = {[1] = tbTHKhacBan3, nRate = 3},
		[4] = {[1] = tbMaDaoThach1, nRate = 8},
		[5] = {[1] = tbMaDaoThach2, nRate = 11},
		[6] = {[1] = tbMaDaoThach3, nRate = 5},
		[7] = {[1] = tbCuongHoaQuyen12, nRate = 7},
		[8] = {[1] = tbCuongHoaQuyen13, nRate = 6},
		[9] = {[1] = tbCuongHoaQuyen14, nRate = 7},
		[10] = {[1] = tbCuongHoaQuyen15, nRate = 10},
		[11] = {[1] = tbManhBachKim, nRate = 33},
	}
	
	local tbShopItem = {
		[2] = {tbCuongHoaQuyen12, 3},
		[3] = {tbCuongHoaQuyen13, 6},
		[4] = {tbCuongHoaQuyen14, 5},
		[5] = {tbCuongHoaQuyen15, 6},
	}
	
	LIB_Award.szLogTitle = "SHOP CHIA KHOA VANG"
	LIB_Award.szLogAction = "nh�n"
	
	if nOrder > 1 then
		if GetItemCount(2,1,30133) < tbShopItem[nOrder][2] then
			Talk(1,"","C�c h� kh�ng c� �� s� ch�a kh�a v�ng ta c�n.")
			return 0
		end
		if DelItem(2,1,30133,tbShopItem[nOrder][2]) == 1 then
			LIB_Award:Award(tbShopItem[nOrder][1]);
			gold_key_shop()
		end
	else
		if GetItemCount(2,1,30133) < 1 then
			Talk(1,"","C�c h� kh�ng c� �� s� ch�a kh�a v�ng ta c�n.")
			return 0
		end
		if GetItemCount(2,1,30133,1) >= 1 then
			if LIB_Award:Award(tbExp) == 1 then
				DelItem(2,1,30133,1)
			end
			LIB_Award:AwardByRate(tbAwardSet)
			gold_key_shop()
		end
	end
end


function HoTroVLBH(nOption)
	if GetGlbValue(1023) ~= 80 then
		return 0
	end
	if gf_Judge_Room_Weight(1, 1000,"") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
     end
     local nTotalReceiveDay = floor(mod(GetTask(TSK_VLBH_Qty),100000)/10)
     local nHoTroNhanVLBH = mod(GetTask(TSK_VLBH_Qty),10)
     if nTotalReceiveDay < 100 then
		Talk(1,"","C�c h� ch�a nh�n �� 100 VLBH trong ng�y, kh�ng th� nh�n h� tr� n�y.")
		return 0
	end
     if GetBit(nHoTroNhanVLBH,nOption) ~= 0 then
		Talk(1,"","C�c h� �� nh�n h� tr� n�y r�i, mai h�y nh�n l�i nh�.")
		return 0
	end
     if nOption == 1 then
     		if GetItemCount(2,1,30230) < 21 then
     			Talk(1,"","��a ta 21 xu v�t ph�m, ta s� h� tr� c�c h�.")
        		return 0
     		end
     	else
     		if GetCash() < 660000 then
     			Talk(1,"","��a ta 66 v�ng, ta s� h� tr� c�c h�.")
        		return 0
     		end
     	end

	if nOption == 1 then
		DelItem(2,1,30230,21)
	else
		Pay(660000)
	end
	nHoTroNhanVLBH = SetBit(nHoTroNhanVLBH, nOption, 1)
	SetTask(TSK_VLBH_Qty, floor(GetTask(TSK_VLBH_Qty)/10)*10 + nHoTroNhanVLBH)
	gf_AddItemEx2({2,1,30132,900}, "V� L�m B�o H�p h� tr�", "Vo Lam Bao Hap", "nh�n")
end


function do_nothing()

end