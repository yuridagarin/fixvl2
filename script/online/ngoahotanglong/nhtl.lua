-- Event Ng�a H� T�ng Long -  V� l�m l�nh b�i 11/06/2008 - 31/12/2008

Include("\\script\\online\\ngoahotanglong\\nhtl_head.lua");

function RequestEventGift()
	if (IsEventStart() == 1) then
		local tGift1 = {			    
						"Ph�n th��ng Th�n N�ng ��n/#ProcessIndex(1)",
						"Ph�n th��ng B�ch C�u Ho�n/#ProcessIndex(2)",
						"Ph�n th��ng Trang b�/GetFactionItem",
						"Hi�n t�i ta ch�a mu�n nh�n/SayNo",
						}
		
		Say("Ng��i ch�i trong th�i gian t� <color=Gold>11/06/2008 - 31/12/2008<color> s� h�u th� t�i kho�n <color=Gold>V� L�m L�nh B�i<color> s� c� c� h�i nh�n ���c c�c ph�n th��ng h�p d�n v� trang b� m�n ph�i. B�ng h�u nh�n ph�n th��ng n�o? ",getn(tGift1),tGift1)
	end
end


function GetFactionItem()
	local tGift2 = {			    
					"Trang b� m�n ph�i S� c�p/#ProcessIndexItem(1)",
					"Trang b� m�n ph�i Trung c�p/#ProcessIndexItem(2)",
					"Trang b� T�ng Ki�m/#ProcessIndexItem(3)",
					"Hi�n t�i ta ch�a mu�n nh�n/SayNo",
					}
	
	Say("B�ng h�u nh�n trang b� n�o?",getn(tGift2),tGift2)
end


function ProcessIndex(nIndex)	
	if (CheckAccount() == 1) then	
			local nExtVal = GetExtPoint(tEventGift[nIndex][4])
			local nFreeItemRoom = GetFreeItemRoom()
			
			if (nExtVal >= 1) then
				if ((nFreeItemRoom >=  nExtVal*tEventGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventGift[nIndex][3] <= GetMaxItemWeight())) then
					if PayExtPoint(tEventGift[nIndex][4], nExtVal) == 1 then
						WriteLog("[Ng�a H� T�ng Long]\t"..GetAccount().."\t"..GetName().."\t �� nh�n ���c "..nExtVal.." "..tEventGift[nIndex][1])				
					end
				else
					if ((nFreeItemRoom <  nExtVal*tEventGift[nIndex][2])  and (nFreeItemRoom > 0)) then
						Say("Ch�c m�ng b�ng h�u �� tr�ng th��ng "..nExtVal.." "..tEventGift[nIndex][1]..". H�nh trang c�a b�ng h�u ch� c� <color=Gold>"..nFreeItemRoom.." � tr�ng<color> n�n ch� nh�n ���c <color=Gold>"..nFreeItemRoom.."<color> "..tEventGift[nIndex][1]..". Sau khi nh�n th��ng h�y s�p x�p l�i h�nh trang r�i ��n g�p ta.",2,"��ng �/#SayYes("..nIndex..","..GetFreeItemRoom()..")","�� ta s�p x�p l�i h�nh trang/SayNo")
					else
						Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
						Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
						return			
					end
				end		
			else
				Say("Ch� c� ng��i tr�ng th��ng m�i ���c nh�n qu�!",0)
				Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
			end
	else
			Say("T�i kho�n c�a b�ng h�u kh�ng c� V� L�m L�nh B�i!",0)
			Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
	end
end


function ProcessIndexItem(nIndex)	
	if (CheckAccount() == 1) then	
		local strTalk = "Ph�n th��ng "..tEventFactionGift[nIndex][1].." bao g�m "..tEventFactionGift[nIndex][2].." . �� nh�n ���c ph�n th��ng n�y b�ng h�u ph�i c� <color=Gold>t�i kho�n V� L�m L�nh B�i<color> v� <color=Gold>��ng c�p nh�n v�t t� c�p "..tEventFactionGift[nIndex][3].." tr� l�n<color>. Ch� � s�p x�p h�nh trang tr��c khi nh�n th��ng."		
		Say(strTalk, 2, "Ta mu�n nh�n!/#GetGift("..nIndex..")", "�� ta s�p x�p l�i h�nh trang/SayNo")	
	else
		Say("T�i kho�n c�a b�ng h�u kh�ng c� V� L�m L�nh B�i!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
	end
end


function GetGift(nIndex)
	local nExtVal = GetExtPoint(NHTL_EXT_POINT_FACTION)
	if (nIndex >= 1) and (nIndex <= 3) and (nExtVal < 16) then
		local nFaction = GetPlayerRoute()
		if  CheckFaction(nFaction) == 1 then
			local nLevel = GetLevel() 
			if nLevel  >= tEventFactionGift[nIndex][3] then			
				local nExtBit  = GetBit(nExtVal, tEventFactionGift[nIndex][4])			
				if nExtBit == 0 then
					local nFreeItemRoom = GetFreeItemRoom()								
					if nFreeItemRoom >= tEventFactionGift[nIndex][6] then				
						AddExtPoint(NHTL_EXT_POINT_FACTION,  tEventFactionGift[nIndex][5])
					else
						Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
						Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
					end			
				else
					Say("Ch�ng ph�i b�ng h�u �� nh�n ph�n th��ng n�y r�i sao?!",0)
					Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
				end		
			else
				Say("H�y r�n luy�n th�m r�i ��n g�p ta!",0)
				Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
			end
		else
			Say("B�ng h�u ch�a gia nh�p m�n ph�i n�n kh�ng ���c nh�n th��ng.",0)
			Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
		end
	else
		WriteLog("[Ng�a H� T�ng Long]\t"..GetAccount().."\t"..GetName().."\t tr� s� nIndex tr� v� sai.")
	end
end


function SayYes(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventGift[nIndex][4], nFreeItemRoom) == 1 then
			WriteLog("[Ng�a H� T�ng Long]\t"..GetAccount().."\t"..GetName().."\t �� nh�n ���c "..nFreeItemRoom.." "..tEventGift[nIndex][1])
		end
	else
		Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
		Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
		return
	end
end


function SayNo()	
end