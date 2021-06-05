-- Created By PhucBDB - 20110316

Include("\\script\\lib\\globalfunctions.lua")

-- Thu ho�ch h�t gi�ng
function VietGetTreeAward()
	
end

-- M� t�i h�t gi�ng
function VietSeedBagAwards()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 100}, "T�i nguy�n li�u", "Hoat dong thang 4 nam 2011", "m� T�i H�t Gi�ng")
	end
--	if VietCheckEvent201106() == 1 then
--		gf_AddItemEx2({2,1,30317, 100}, "Tr�i c�y m�a h�", "Hoat dong thang 6 nam 2011", "m� T�i H�t Gi�ng")
--	end
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2,1,30327,1}, "��n hoa Trung Thu", "Hoat dong thang 8 nam 2011", "m� T�i H�t Gi�ng", 24*3600)
		Msg2Player("B�n nh�n ���c 1 ��n hoa Trung Thu")		
	end
	
--	if VietCheckEvent20111111() == 1 then
--		gf_AddItemEx2({2,1,30333,100}, "Hoa S�n Tr�", "Hoat dong thang 11 nam 2011", "m� T�i H�t Gi�ng")
--	end
end

function VietSeedBagAwardsEvent12()
		local nDate = tonumber(date("%y%m%d"))
		if nDate < 111216 or  nDate >= 111219 then
			return
		end
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			gf_AddItemEx2({2,1,30347, 5}, "K�o Que B�c H�", "Hoat dong thang 12 nam 2011", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 5 K�o Que B�c H�")	
		elseif  nTimes >= 7 and nTimes <= 12 then
			gf_AddItemEx2({2,1,30347, 15}, "T�i nguy�n li�u", "Hoat dong thang 12 nam 2011", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 15 K�o Que B�c H�")	
		elseif  nTimes >= 13 and nTimes <= 24 then
			gf_AddItemEx2({2,1,30347, 25}, "T�i nguy�n li�u", "Hoat dong thang 12 nam 2011", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 25 K�o Que B�c H�")	
		end
end

function VietSeedBagAwardsEvent012012()
		--local nDate = tonumber(date("%y%m%d"))
		if VietCheckEvent20120116()~= 1 then
			return
		end
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			gf_AddItemEx2({2,1,30353, 5}, "��ng ti�n may m�n", "Hoat dong thang 1 nam 2012", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 5 ��ng ti�n may m�n")	
		elseif  nTimes >= 7 and nTimes <= 12 then
			gf_AddItemEx2({2,1,30353, 15}, "��ng ti�n may m�n", "Hoat dong thang 1 nam 2012", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 15 ��ng ti�n may m�n")	
		elseif  nTimes >= 13 and nTimes <= 24 then
			gf_AddItemEx2({2,1,30353, 25}, "��ng ti�n may m�n", "Hoat dong thang 1 nam 2012", "tr�ng H�t Gi�ng")
			Msg2Player("B�n nh�n ���c 25 ��ng ti�n may m�n")	
		end
end

-- C�y b�t nh� nh�
function VietSmallFruit_Award()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 30}, "T�i nguy�n li�u", "Hoat dong thang 4 nam 2011", "tr�ng B�t Nh� Nh�")
	end
end

-- C�y b�t nh� l�n
function VietBiglFruit_Award()
	if VietCheckEvent201104() == 1 then
		gf_AddItemEx2({2, 1, 30290, 40}, "T�i nguy�n li�u", "Hoat dong thang 4 nam 2011", "tr�ng B�t Nh� L�n")
	end
end

-- Ng�i sao may m�n
function VietLuckyStar()
	if VietCheckEvent201107() == 1 then
		gf_AddItemEx2({2,1,30317, 20}, "Tr�i c�y m�a h�", "Hoat dong thang 6 nam 2011", "S� d�ng Ng�i Sao May M�n")
	end
	
	if VietCheckEvent20110714() == 1 then
		gf_AddItemEx2({2,1,30323, 30}, "Nguy�n li�u l�m kem ", "Hoat dong thang 7 nam 2011", "S� d�ng Ng�i Sao May M�n")
		Msg2Player("B�n nh�n ���c 30 Nguy�n li�u l�m kem")
	end
end

-- T�i nguy�n chi�n   
function VietSongLiao(nType)
	if VietCheckEvent20110714() == 1 then
		local tMaterialQuantity201107 = 
		{
			[1] = {20},
			[2] = {35},
			[3] = {50},
			[4] = {10},
		}
		gf_AddItemEx2({2,1,30323,  tMaterialQuantity201107[nType][1]}, "Nguy�n li�u l�m kem ", "Hoat dong thang 7 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201107[nType][1].." Nguy�n li�u l�m kem")
	end

	if VietCheckEvent20110826() == 1 then
		local tMaterialQuantity201108 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30328,  tMaterialQuantity201108[nType][1]}, "B�t m�", "Hoat dong thang 8 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201108[nType][1].." B�t M� H�o H�ng")
		gf_AddItemEx2({2,1,30327,1}, "��n hoa Trung Thu", "Hoat dong thang 8 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n", 24*3600)
		Msg2Player("B�n nh�n ���c 1 ��n hoa Trung Thu")		
	end
	
	if VietCheckEvent20111007() == 1 then
		local tMaterialQuantity201108 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30331,  tMaterialQuantity201108[nType][1]}, "Hoa H�ng", "Hoat dong thang 10 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201108[nType][1].." Hoa H�ng")
	--	gf_AddItemEx2({2,1,30327,1}, "��n hoa Trung Thu", "Hoat dong thang 8 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n", 24*3600)
	-- Msg2Player("B�n nh�n ���c 1 ��n hoa Trung Thu")		
	end
	
	if VietCheckEvent20111111() == 1 then
		local tMaterialQuantity201111 = 
		{
			[1] = {40},
			[2] = {75},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30333,  tMaterialQuantity201111[nType][1]}, "Hoa S�n Tr�", "Hoat dong thang 11 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201111[nType][1].." Hoa S�n Tr�")
	end
	
	if VietCheckEvent20111216() == 1 then
		local tMaterialQuantity201111 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30347,  tMaterialQuantity201111[nType][1]}, "K�o Que B�c H�", "Hoat dong thang 12 nam 2011", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201111[nType][1].." K�o Que B�c H�")
	end
	
	if VietCheckEvent20120116() == 1 then
		local tMaterialQuantity201201 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30353,  tMaterialQuantity201201[nType][1]}, "��ng ti�n may m�n", "Hoat dong thang 1 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201201[nType][1].." ��ng ti�n may m�n")
	end
	
	if VietCheckEvent20120210() == 1 then
		local tMaterialQuantity201202 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30357,  tMaterialQuantity201202[nType][1]}, "Qu� CaCao", "Hoat dong thang 2 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201202[nType][1].." Qu� CaCao")
	end
	if VietCheckEvent20120309() == 1 then
		local tMaterialQuantity201203 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30360,  tMaterialQuantity201203[nType][1]}, "V�i l�a cao c�p", "Hoat dong thang 3 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201203[nType][1].." V�i l�a cao c�p")
	end
	if VietCheckEvent20120413() == 1 then
		local tMaterialQuantity201204 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30363,  tMaterialQuantity201204[nType][1]}, "Chi�n t�ch", "Hoat dong thang 4 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201204[nType][1].." Chi�n t�ch")
	end
	if VietCheckEvent20120511() == 1 then
		local tMaterialQuantity201205 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30375 ,  tMaterialQuantity201205[nType][1]}, "Nguy�n li�u m�a h�", "Hoat dong thang 5 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201205[nType][1].." Nguy�n li�u m�a h�")
	end
	if VietCheckEvent20120615() == 1 then
		local tMaterialQuantity201205 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30380 ,  tMaterialQuantity201205[nType][1]}, "Nguy�n li�u b�nh � tro", "Hoat dong thang 6 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201205[nType][1].." Nguy�n li�u b�nh � tro")
	end
	if VietCheckEvent20120720() == 1 then
		local tMaterialQuantity201207 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30393 ,  tMaterialQuantity201207[nType][1]}, "Nguy�n li�u H�i s�n t��i s�ng", "Hoat dong thang 7 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201207[nType][1].." Nguy�n li�u H�i s�n t��i s�ng")
	end
	if VietCheckEvent20120817() == 1 then
		local tMaterialQuantity201208 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {100},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30420 ,  tMaterialQuantity201208[nType][1]}, "Hoa Sen", "Hoat dong thang 8 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201208[nType][1].." Hoa Sen")
	end
	if VietCheckEvent20120914() == 1 then
		local tMaterialQuantity201209 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
	end
	if VietCheckEvent20121012() == 1 then
		local tMaterialQuantity201209 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30442 ,  tMaterialQuantity201209[nType][1]}, "Tinh D�u Hoa", "Hoat dong thang 10 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201209[nType][1].." Tinh D�u Hoa")
	end
	if VietCheckEvent20121116() == 1 then
		local tMaterialQuantity201211 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30454 ,  tMaterialQuantity201211[nType][1]}, "Men r��u th��ng h�ng", "Hoat dong thang 11 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201211[nType][1].." Men r��u th��ng h�ng")
	end	
	if VietCheckEvent20121217() == 1 then
		local tMaterialQuantity201212 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30464 ,  tMaterialQuantity201212[nType][1]}, "Nguy�n li�u Noel", "Hoat dong thang 12 nam 2012", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201212[nType][1].." Nguy�n li�u Noel")
	end	
	if VietCheckEvent20130125() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30472 ,  tMaterialQuantity201301[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 01 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201301[nType][1].." Nguy�n li�u Event")
	end
	if VietCheckEvent20130308() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {50},
			[2] = {100},
			[3] = {600},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30486 ,  tMaterialQuantity201301[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 03 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201301[nType][1].." Nguy�n li�u Event")
	end	
	if VietCheckEvent20130419() == 1 then
		local tMaterialQuantity201301 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30500 ,  tMaterialQuantity201301[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 04 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201301[nType][1].." Nguy�n li�u Event")
	end	
	if VietCheckEvent20130517() == 1 then
		local tMaterialQuantity201305 = 
		{
			[1] = {40},
			[2] = {50},
			[3] = {300},
			[4] = {20},
		}
		gf_AddItemEx2({2,1,30515 ,  tMaterialQuantity201305[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 05 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201305[nType][1].." Nguy�n li�u Event")
	end	
	if VietCheckEvent20130615() == 1 then
		local tMaterialQuantity201306 = 
		{
			[1] = {80},
			[2] = {100},
			[3] = {200},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30545 ,  tMaterialQuantity201306[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 06 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201306[nType][1].." Nguy�n li�u Event")
	end		
	if VietCheckEvent20130719() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30550 ,  tMaterialQuantity201307[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 07 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201307[nType][1].." Nguy�n li�u Event")
	end			
	if VietCheckEvent20130823() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30563 ,  tMaterialQuantity201307[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 08 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201307[nType][1].." Nguy�n li�u Event")
	end	
	if VietCheckEvent20130919() == 1 then	
		local tMaterialQuantity201307 = 
		{
			[1] = {100},
			[2] = {200},
			[3] = {300},
			[4] = {50},
		}
		gf_AddItemEx2({2,1,30567 ,  tMaterialQuantity201307[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 09 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity201307[nType][1].." Nguy�n li�u Event")
	end								
		
end

-- N� Oa B�o H�p 
function VietWaBaoHe()
	if VietCheckEvent201107() == 1 then
		local nUse = GetTask(2156)
		if nUse > 100 then
			return
		end
		if  mod(nUse,10) == 0 then
			gf_AddItemEx2({2,1,30317, 20}, "Tr�i c�y m�a h�", "Hoat dong thang 6 nam 2011", "S� d�ng N� Oa B�o H�p")
		end
	end
	
	if VietCheckEvent20110714() == 1 then
		local nUse = GetTask(2156)
		if nUse > 100 then
			return
		end
		if  mod(nUse,10) == 0 then
			gf_AddItemEx2({2,1,30323, 20}, "Nguy�n li�u l�m kem ", "Hoat dong thang 7 nam 2011", "S� d�ng N� Oa B�o H�p")
			Msg2Player("B�n nh�n ���c 20 Nguy�n li�u l�m kem")
		end
	end
end

--  Th�  n��mg 
function ThoNuong_Award()
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2, 1, 30328, 5}, "B�t M� H�o H�ng", "Hoat dong thang 8 nam 2011", "b�n ti�c Th� N��ng")
		Msg2Player("B�n nh�n ���c 5 B�t M� H�o H�ng")
	end
	if VietCheckEvent20111007() == 1 then
		gf_AddItemEx2({2,1,30331, 5}, "Hoa H�ng", "Hoat dong thang 10 nam 2011", "b�n ti�c Th� N��ng")
		Msg2Player("B�n nh�n ���c 5 Hoa H�ng")
	end
--	if VietCheckEvent20111111() == 1 then
--		gf_AddItemEx2({2,1,30333,100}, "Hoa S�n Tr�", "Hoat dong thang 11 nam 2011", "b�n ti�c Th� N��ng")
--		Msg2Player("B�n nh�n ���c 100 Hoa S�n Tr�")
--	end
end

--  Nhi�m v� B�ch Ti�n Sinh
function BachTienSinh_Award()
	if VietCheckEvent20110826() == 1 then
		gf_AddItemEx2({2, 1, 30328, 50}, "B�t M� H�o H�ng", "Hoat dong thang 8 nam 2011", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 B�t M� H�o H�ng")
	end
	if VietCheckEvent20111007() == 1 then
		gf_AddItemEx2({2,1,30331, 50}, "Hoa H�ng", "Hoat dong thang 10 nam 2011", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Hoa H�ng")
	end
	if VietCheckEvent20111111() == 1 then
		gf_AddItemEx2({2,1,30333,100}, "Hoa S�n Tr�", "Hoat dong thang 11 nam 2011", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Hoa S�n Tr�")
	end
	if VietCheckEvent20120116() == 1 then
		gf_AddItemEx2({2,1,30353,50}, "��ng ti�n may m�n", "Hoat dong thang 1 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 ��ng ti�n may m�n")
	end
	if VietCheckEvent20120210() == 1 then
		gf_AddItemEx2({2,1,30357,50}, "Qu� CaCao", "Hoat dong thang 2 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Qu� CaCao")
	end
	if VietCheckEvent20120309() == 1 then
		gf_AddItemEx2({2,1,30360,50}, "V�i l�a cao c�p", "Hoat dong thang 3 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 V�i l�a cao c�p")
	end
	if VietCheckEvent20120413() == 1 then
		gf_AddItemEx2({2,1,30363,50}, "Chi�n t�ch", "Hoat dong thang 4 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Chi�n t�ch")
	end
	if VietCheckEvent20120511() == 1 then
		gf_AddItemEx2({2,1,30375 ,50}, "Nguy�n Li�u m�a h�", "Hoat dong thang 5 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Nguy�n Li�u m�a h�")
	end
	if VietCheckEvent20120615() == 1 then
		gf_AddItemEx2({2,1,30380 ,50}, "Nguy�n Li�u b�nh � tro", "Hoat dong thang 6 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Nguy�n Li�u b�nh � tro")
	end
	if VietCheckEvent20120720() == 1 then
		gf_AddItemEx2({2,1,30393 ,50}, "Nguy�n Li�u H�i s�n t��i s�ng", "Hoat dong thang 7 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Nguy�n Li�u H�i s�n t��i s�ng")
	end
	if VietCheckEvent20120817() == 1 then
		gf_AddItemEx2({2,1,30420 ,50}, "Hoa Sen", "Hoat dong thang 8 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Hoa Sen")
	end
	if VietCheckEvent20120914() == 1 then
		gf_AddItemEx2({2,1,30431 ,50}, "B�t l�m b�nh", "Hoat dong thang 9 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 B�t l�m b�nh")
	end	
	if VietCheckEvent20121012() == 1 then
		gf_AddItemEx2({2,1,30442 ,50}, "Tinh D�u Hoa", "Hoat dong thang 10 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Tinh D�u Hoa")
	end	
	if VietCheckEvent20121116() == 1 then
		gf_AddItemEx2({2,1,30454 ,50}, "Men r��u th��ng h�ng", "Hoat dong thang 11 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Men r��u th��ng h�ng")
	end	
	if VietCheckEvent20121217() == 1 then
		gf_AddItemEx2({2,1,30464 ,100}, "Nguy�n li�u Noel", "Hoat dong thang 12 nam 2012", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Nguy�n Li�u Noel")
	end	
	if VietCheckEvent20130125() == 1 then
		gf_AddItemEx2({2,1,30472 ,100}, "Nguy�n li�u Event", "Hoat dong thang 01 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Nguy�n Li�u Event")
	end
	if VietCheckEvent20130308() == 1 then
		gf_AddItemEx2({2,1,30486 ,100}, "Nguy�n li�u Event", "Hoat dong thang 03 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Nguy�n Li�u Event")
	end		
	if VietCheckEvent20130419() == 1 then
		gf_AddItemEx2({2,1,30500 ,60}, "Nguy�n li�u Event", "Hoat dong thang 04 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 60 Nguy�n Li�u Event")
	end		
	if VietCheckEvent20130517() == 1 then
		gf_AddItemEx2({2,1,30515 ,100}, "Nguy�n li�u Event", "Hoat dong thang 05nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Nguy�n Li�u Event")
	end		
	if VietCheckEvent20130615() == 1 then
		gf_AddItemEx2({2,1,30545 ,100}, "Nguy�n li�u Event", "Hoat dong thang 06nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 100 Nguy�n Li�u Event")
	end		
	if VietCheckEvent20130719() == 1 then
		gf_AddItemEx2({2,1,30550 ,20}, "Nguy�n li�u Event", "Hoat dong thang 07 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 20 Nguy�n Li�u Event")
	end			
	if VietCheckEvent20130823() == 1 then
		gf_AddItemEx2({2,1,30563 ,20}, "Nguy�n li�u Event", "Hoat dong thang 08 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 20 Nguy�n Li�u Event")
	end		
	if VietCheckEvent20130919() == 1 then
		gf_AddItemEx2({2,1,30567 ,20}, "Nguy�n li�u Event", "Hoat dong thang 09 nam 2013", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 20 Nguy�n Li�u Event")
	end						
end

-- Check Date
function VietCheckEvent201104()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110401 and nDate <= 110417 then
		return 1
	end
	return 0
end

function VietCheckEvent201105()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110422 and nDate <= 110529 then
		return 1
	end
	return 0
end

function VietCheckEvent201106()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110617 and nDate <= 110710 then
		return 1
	end
	return 0
end

function VietCheckEvent201107()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110701 and nDate <=110710   then
		return 1
	end
	return 0
end

function VietCheckEvent20110714()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110715 and nDate <=110821   then
		return 1
	end
	return 0
end

function VietCheckEvent20110826()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110826 and nDate <=111002   then
		return 1
	end
	return 0
end

function VietCheckEvent20111007()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111007 and nDate <=111106   then
		return 1
	end
	return 0
end

function VietCheckEvent20111111()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111111 and nDate <=111212   then
		return 1
	end
	return 0
end

function VietCheckEvent20111216()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 111216 and nDate <=120108   then
		return 1
	end
	return 0
end

function VietCheckEvent20120116()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120113 and nDate <=120205   then
		return 1
	end
	return 0
end

function VietCheckEvent20120210()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120210 and nDate <=120304   then
		return 1
	end
	return 0
end

function VietCheckEvent20120309()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120309 and nDate <=120408   then
		return 1
	end
	return 0
end

function VietCheckEvent20120413()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120413 and nDate <=120506   then
		return 1
	end
	return 0
end

function VietCheckEvent20120511()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120511 and nDate <=120610   then
		return 1
	end
	return 0
end

function VietCheckEvent20120615()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120615 and nDate <=120715   then
		return 1
	end
	return 0
end

function VietCheckEvent20120720()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120720 and nDate <=120812   then
		return 1
	end
	return 0
end

function VietCheckEvent20120817()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120817 and nDate <=120909   then
		return 1
	end
	return 0
end

function VietCheckEvent20120914()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120914 and nDate <=121007   then
		return 1
	end
	return 0
end

function VietCheckEvent20121012()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121012 and nDate <=121112   then
		return 1
	end
	return 0
end
function VietCheckEvent20121116()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121116 and nDate <=121216   then
		return 1
	end
	return 0
end
function VietCheckEvent20121217()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 121221 and nDate <=130120   then
		return 1
	end
	return 0
end
function VietCheckEvent20130125()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130125 and nDate <=130225   then
		return 1
	end
	return 0
end
function VietCheckEvent20130308()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130308 and nDate <=130415   then
		return 1
	end
	return 0
end
function VietCheckEvent20130419()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130419 and nDate <=130512   then
		return 1
	end
	return 0
end
function VietCheckEvent20130517()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130517 and nDate <=130609   then
		return 1
	end
	return 0
end
function VietCheckEvent20130615()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130614 and nDate <=130714   then
		return 1
	end
	return 0
end
function VietCheckEvent20130719()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130719 and nDate <=130819   then
		return 1
	end
	return 0
end
function VietCheckEvent20130823()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130823 and nDate <=130916   then
		return 1
	end
	return 0
end
function VietCheckEvent20130919()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013   then
		return 1
	end
	return 0
end



