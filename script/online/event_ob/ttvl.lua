EXT_POINT_TTVL = 5

BIT_LEVEL_20 = 1
BIT_LEVEL_30 = 2
BIT_LEVEL_40 = 3
BIT_LEVEL_50 = 4

function take_gift_ttvl()
local gift = {			    
			    	"Ph�n th��ng c�p 20/#processIndex(1)",
				"Ph�n th��ng c�p 30/#processIndex(2)",
				"Ph�n th��ng c�p 40/#processIndex(3)",
				"Ph�n th��ng c�p 50/#processIndex(4)",
				"Hi�n t�i ta ch�a c�n/OnCancel"				
	}
	
	Say(	"Ng��i ch�i t� c�p <color=Gold>20<color>, <color=Gold>30<color>, <color=Gold>40<color> v� <color=Gold>50<color> tr� l�n s� nh�n ���c ph�n th��ng Th�ch Th�c V� L�m trong th�i gian t� 01/12/2007 - 01/01/2008. B�ng h�u ch�n ph�n th��ng n�o? ",getn(gift),gift)

end

function processIndex(nIndex)
	local nLevel = GetLevel()
	local nExtVal = GetExtPoint(EXT_POINT_TTVL)
	
	if (nIndex == 1) then
		if (nLevel >= 20) then
			if (GetBit(nExtVal, BIT_LEVEL_20) == 0) then
				if (GetFreeItemRoom() >= 2) then					
					AddExtPoint(EXT_POINT_TTVL, 1)
				else
					Say("H�nh trang ng��i kh�ng �� 2 � tr�ng!",0)
					Msg2Player("H�nh trang b�n kh�ng �� � tr�ng.")
					return
				end
			else
				Say("Ch�ng ph�i t�i kho�n c�a ng��i �� nh�n ph�n th��ng n�y r�i sao?",0)
				Msg2Player("B�n �� nh�n ph�n th��ng n�y r�i.")
				return			
			end				
		else
			Say("��t ��n c�p 20 r�i h�y ��n t�m ta!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n nh�n ph�n th��ng.")
			return
		end
	
	elseif (nIndex == 2) then
		if (nLevel >= 30) then
			if (GetBit(nExtVal, BIT_LEVEL_30) == 0) then
				if (GetFreeItemRoom() >= 5) then
					AddExtPoint(EXT_POINT_TTVL, 2)
				else
					Say("H�nh trang ng��i kh�ng �� 5 � tr�ng!",0)
					Msg2Player("H�nh trang b�n kh�ng �� � tr�ng.")
					return
				end
			else
				Say("Ch�ng ph�i t�i kho�n c�a ng��i �� nh�n ph�n th��ng n�y r�i sao?",0)
				Msg2Player("B�n �� nh�n ph�n th��ng n�y r�i.")
				return			
			end				
		else
			Say("��t ��n c�p 30 r�i h�y ��n t�m ta!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n nh�n ph�n th��ng.")
			return
		end
	
	elseif (nIndex == 3) then
		if (nLevel >= 40) then
			if (GetBit(nExtVal, BIT_LEVEL_40) == 0) then
				if (GetFreeItemRoom() >= 7) then
					AddExtPoint(EXT_POINT_TTVL, 4)
				else
					Say("H�nh trang ng��i kh�ng �� 7 � tr�ng!",0)
					Msg2Player("H�nh trang b�n kh�ng �� � tr�ng.")
					return
				end
			else
				Say("Ch�ng ph�i t�i kho�n c�a ng��i �� nh�n ph�n th��ng n�y r�i sao?",0)
				Msg2Player("B�n �� nh�n ph�n th��ng n�y r�i.")
				return			
			end				
		else
			Say("��t ��n c�p 40 r�i h�y ��n t�m ta!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n nh�n ph�n th��ng.")
			return
		end
	
	elseif (nIndex == 4) then
		if (nLevel >= 50) then
			if (GetBit(nExtVal, BIT_LEVEL_50) == 0) then
				if (GetFreeItemRoom() >= 9) then
					AddExtPoint(EXT_POINT_TTVL, 8)
				else
					Say("H�nh trang ng��i kh�ng �� 9 � tr�ng!",0)
					Msg2Player("H�nh trang b�n kh�ng �� � tr�ng.")
					return
				end
			else
				Say("Ch�ng ph�i t�i kho�n c�a ng��i �� nh�n ph�n th��ng n�y r�i sao?",0)
				Msg2Player("B�n �� nh�n ph�n th��ng n�y r�i.")
				return			
			end				
		else
			Say("��t ��n c�p 50 r�i h�y ��n t�m ta!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n nh�n ph�n th��ng.")
			return
		end	
	else
		Say("C� l�i x�y ra, xin li�n h� GM �� gi�i quy�t!",0)
		WriteLog(date("%Y%m%d%H")..GetAccount()..":"..GetName().." b� l�i nh�n ph�n th��ng Th�ch th�c v� l�m.")		
	end

end