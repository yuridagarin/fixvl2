-- Event C�u Nguy�t H�o V�n 29/08/2008 - 30/09/2008
-- Created by TuanNA5

Include("\\script\\online\\cuunguyethaovan\\cnhv_head.lua");

function RequestEventCNHV()
	if (IsEventCNHVStart() == 1) then
		local tGift1 = {			    
						"Ph�n th��ng M�t T�ch S� M�n/RequestFactionBook1",
						"Ph�n th��ng T�y T�y Linh ��n/#ProcessCNHVIndex(4)",
						"Ph�n th��ng B�ng Lai Ti�n ��n/#ProcessCNHVIndex(5)",
						"Ph�n th��ng Tam Thanh Ho�n/#ProcessCNHVIndex(6)",
						"Ph�n th��ng Th�n N�ng ��n/#ProcessCNHVIndex(1)",
						"Ph�n th��ng B�ch C�u Ho�n/#ProcessCNHVIndex(2)",						
						"Hi�n t�i ta ch�a mu�n nh�n/SayNoCNHV",
						}		
		Say("Trong th�i gian t� <color=Gold>05/09/2008 - 30/09/2008<color>, ng��i ch�i tham gia ch��ng tr�nh khuy�n m�i <color=Gold>C�u Nguy�t H�o V�n<color> s� c� c� h�i nh�n ���c c�c ph�n th��ng h�p d�n v� gi� tr�. Th�i h�n nh�n th��ng ��n <color=Gold>24:00 07/10/2008<color>. B�ng h�u nh�n ph�n th��ng n�o? ",getn(tGift1),tGift1)
	end
end

function RequestFactionBook1()
	local tGift2 = {}
	
	for i=1,7  do
		tGift2[i] = tBookList[i][1].."/#ProcessCNHVIndex(3,"..i..")"	
	end
	
	tGift2[getn(tGift2) + 1]  = "Xem trang sau/RequestFactionBook2"
	tGift2[getn(tGift2) + 1]  = "Hi�n t�i ta ch�a mu�n nh�n/SayNoCNHV"
	
	Say("Ng��i ch�i tr�ng th��ng <color=Gold>M�t T�ch S� M�n<color> c� th� nh�n nhi�u l�n t��ng �ng v�i s� l�n tr�ng th��ng. M�i l�n nh�n t�i �a <color=red>1 m�t t�ch<color>. B�ng h�u nh�n m�t t�ch n�o?",getn(tGift2),tGift2)
end

function RequestFactionBook2()
	local tGift3 = {}
	local nBook = 0
	
	for i=1,7  do
		nBook = i + 7
		tGift3[i] = tBookList[nBook][1].."/#ProcessCNHVIndex(3,"..nBook..")"	
	end
	
	tGift3[getn(tGift3) + 1]  = "Xem trang tr��c/RequestFactionBook1"
	tGift3[getn(tGift3) + 1]  = "Hi�n t�i ta ch�a mu�n nh�n/SayNoCNHV"
	
	Say("Ng��i ch�i tr�ng th��ng <color=Gold>M�t T�ch S� M�n<color> c� th� nh�n nhi�u l�n t��ng �ng v�i s� l�n tr�ng th��ng. M�i l�n nh�n t�i �a <color=red>1 m�t t�ch<color>. B�ng h�u nh�n m�t t�ch n�o?",getn(tGift3),tGift3)
end


function ProcessCNHVIndex(nIndex,nChoice)	
	local nExtVal = GetExtPoint(tEventCNHVGift[nIndex][4])
	local nFreeItemRoom = GetFreeItemRoom()		
	
	if (nExtVal >= 1) then	
		if nIndex == 3 and nChoice > 0 then
			SetTask(2429,nChoice)			
			if ((nFreeItemRoom >=  tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
				PayExtPoint(tEventCNHVGift[nIndex][4], 1) 				
			else
				Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
				Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
				return
			end			
		else
			SetTask(2429,0)			
			if ((nFreeItemRoom >=  nExtVal*tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
				if PayExtPoint(tEventCNHVGift[nIndex][4], nExtVal) == 1 then
					if nIndex == 1 or nIndex == 2 then
						WriteLog( "[Cuu Nguyet Hao Van]\t"..GetAccount().."\t"..GetName().."\tnh�n".."\t"..nExtVal.."\t"..tEventCNHVGift[nIndex][1].."\t".."\t".."\t".."\t".."\t".."\t")
					end
				end
			else
				if ((nFreeItemRoom <  nExtVal*tEventCNHVGift[nIndex][2])  and (nFreeItemRoom > 0)) then
					Say("Ch�c m�ng b�ng h�u �� tr�ng th��ng "..nExtVal.." "..tEventCNHVGift[nIndex][1]..". H�nh trang c�a b�ng h�u ch� c� <color=Gold>"..nFreeItemRoom.." � tr�ng<color> n�n ch� nh�n ���c <color=Gold>"..nFreeItemRoom.."<color> "..tEventCNHVGift[nIndex][1]..". Sau khi nh�n th��ng h�y s�p x�p l�i h�nh trang r�i ��n g�p ta.",2,"��ng �/#SayYesCNHV("..nIndex..","..GetFreeItemRoom()..")","�� ta s�p x�p l�i h�nh trang/SayNoCNHV")
				else
					Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
					Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
					return			
				end
			end		
		end				
		
	else
		Say("Ch� c� ng��i tr�ng th��ng m�i ���c nh�n qu�!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
	end
end


function SayYesCNHV(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventCNHVGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventCNHVGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventCNHVGift[nIndex][4], nFreeItemRoom) == 1 then
			if nIndex == 1 or nIndex == 2 then
				WriteLog( "[Cuu Nguyet Hao Van]\t"..GetAccount().."\t"..GetName().."\tnh�n".."\t"..nExtVal.."\t"..tEventCNHVGift[nIndex][1].."\t".."\t".."\t".."\t".."\t".."\t")
			end
		end
	else
		Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
		Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
		return
	end
end

function SayNoCNHV()	
end