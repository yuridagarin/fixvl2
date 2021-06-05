-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

Include("\\script\\newbattles\\newresourcebattle\\newres_head.lua");

szNpcName = "<color=green>Ho�ng Tr� th��ng nh�n<color>: "

function main()
	local tSay = {
		"Mua d�ng c� cao c�p (15 xu v�t ph�m/c�i)/buy_item_special",
		format("Mua d�ng c� ph� th�ng (10 b�c%sc�i)/buy_item_normal","/"),
		"Mua 1 ��u H�n (gi� 35 Xu V�t Ph�m)/#buy_item(5)",
		"Ta kh�ng c�n th� g�!/do_nothing",	
	}
	Say(szNpcName.."Thi�u d�ng c� thu th�p? Ta chuy�n bu�n b�n c�c lo�i d�ng c� thu th�p t�i nguy�n, gi� r� b�t ng�! Ha ha...",getn(tSay),tSay)	
end
function buy_item_special()
	local tSay = {
		"Mua 1 Cu�c C�ng C�ng/#buy_item(6)",
		"Mua 1 B�n C� Ph�/#buy_item(7)",
		"Mua 1 L�i Th�n �ao/#buy_item(8)",
		"Mua 1 Cu�c Th�n N�ng/#buy_item(9)",
		"Ta kh�ng c�n th� g�!/do_nothing",	
	}
	Say(szNpcName.."Thi�u d�ng c� thu th�p? Ta chuy�n bu�n b�n c�c lo�i d�ng c� thu th�p t�i nguy�n cao c�p, gi� 15 Xu v�t ph�m 1 c�i.",getn(tSay),tSay)	
end
function buy_item_normal()
	local tSay = {
		"Mua 1 Cu�c Chim (gi� 10 b�c)/buy_item1",
		"Mua 1 Thi�t Ph� (gi� 10 b�c)/buy_item2",
		"Mua 1 Ch� B� �ao (gi� 10 b�c)/buy_item3",
		"Mua 1 Cu�c Thu�c (gi� 10 b�c)/buy_item4",
		"Ta kh�ng c�n th� g�!/do_nothing",	
	}
	Say(szNpcName.."Thi�u d�ng c� thu th�p? Ta chuy�n bu�n b�n c�c lo�i d�ng c� thu th�p t�i nguy�n, gi� r� b�t ng�! Ha ha....",getn(tSay),tSay)	
end
function buy_item(nChoice)
	if nChoice == 5 then
		if GetItemCount(2,1,30230) < 35 then
			Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� 35 Xu V�t Ph�m!")
			return
		end
		if DelItem(2,1,30230,35) == 1 then
			gf_AddItemEx2(tItem[nChoice][2], "��u H�n", "TL TNChien", "Mua t� Ho�ng Tr� th��ng nh�n", 3 * 24 * 3600)	
		end	
		WriteLogEx("LOG XU VAT PHAM","Mua ��u h�n trong TNC")
	end
--	if nChoice  == 1 or nChoice == 2 or nChoice == 3 or nChoice == 4 then
--		if GetCash() < 1000 then
--			Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� 10 b�c!")
--			return
--		end
--		if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
--			return
--		end
--		if Pay(1000) == 1 then
--			gf_AddItemEx(tItem[nChoice][2],tItem[nChoice][1])		
--			WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,tItem[nChoice][1])
--		end	
--	end
	if nChoice  == 6 or nChoice == 7 or nChoice == 8 or nChoice == 9 then
		if GetItemCount(2,1,30230) < 15 then
			Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� 15 Xu V�t Ph�m!")
			return
		end
		if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
			return
		end
		if DelItem(2,1,30230,15) == 1 then
			gf_AddItemEx(tItem[nChoice][2],tItem[nChoice][1])		
			WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,tItem[nChoice][1])
			WriteLogEx("LOG XU VAT PHAM","Mua "..tItem[nChoice][1].." trong TNC")
		end
	end
	
end
function buy_item1()
	AskClientForNumber("confirm_buy_item1", 1, 50, "S� l��ng (1-50)")
end
function buy_item2()
	AskClientForNumber("confirm_buy_item2", 1, 50, "S� l��ng (1-50)")
end
function buy_item3()
	AskClientForNumber("confirm_buy_item3", 1, 50, "S� l��ng (1-50)")
end
function buy_item4()
	AskClientForNumber("confirm_buy_item4", 1, 50, "S� l��ng (1-50)")
end
function confirm_buy_item1(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� b�c �� mua "..nCount.." ��o c�")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,11,nCount},"Cu�c Chim")		
		WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,"Cu�c Chim")
	end	
end
function confirm_buy_item2(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� b�c �� mua "..nCount.." ��o c�")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,14,nCount},"Thi�t Ph�")		
		WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,"Thi�t Ph�")
	end	
end
function confirm_buy_item3(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� b�c �� mua "..nCount.." ��o c�")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,12,nCount},"Ch� B� �ao")		
		WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,"Ch� B� �ao")
	end	
end
function confirm_buy_item4(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c�c h� kh�ng c� �� b�c �� mua "..nCount.." ��o c�")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,16,nCount},"Cu�c Thu�c")		
		WriteLogEx("TL TNChien","Mua t� Ho�ng Tr� th��ng nh�n",1,"Cu�c Thu�c")
	end	
end
function check_cash(nCount)
	if GetCash() < nCount*1000 then
		return 1
	end
	return 0
end

function do_nothing()

end