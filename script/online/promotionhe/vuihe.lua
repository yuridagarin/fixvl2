-- Event H� Ng�p Tr�n - Vui R�n R�ng 11/06/2008 - 20/07/2008

Include("\\script\\online\\promotionhe\\vuihe_head.lua");

function RequestEventHeGift()
	if (IsEventHeStart() == 1) then
		local tGift1 = {			    
						"Ph�n th��ng Ch��ng M�n ��c Phong L�nh/#ProcessIndexHe(1)",
						"Ph�n th��ng Phong Th��ng L�nh Chi�n Tr��ng/GetSongLiao",
						"Ph�n th��ng B�o R��ng T�ng Ki�m Hoa Kh�/#ProcessIndexHe(4)",
						"Ph�n th��ng Th�n N�ng ��n/#ProcessIndexHe(5)",
						"Ph�n th��ng B�ch C�u Ho�n/#ProcessIndexHe(6)",						
						"Hi�n t�i ta ch�a mu�n nh�n/SayNo",
						}
		
		Say("Ng��i ch�i trong th�i gian t� <color=Gold>11/06/2008 - 13/07/2008<color> tham gia ch��ng tr�nh quay s� tr�ng th��ng <color=Gold>H� R�n R�ng - Vui Ng�p Tr�n<color> s� c� c� h�i nh�n ���c c�c ph�n th��ng h�p d�n. Th�i gian nh�n th��ng t� <color=Gold>11/06/2008 - 20/07/2008<color>. B�ng h�u nh�n ph�n th��ng n�o? ",getn(tGift1),tGift1)
	end
end

function GetSongLiao()
	local tGift2 = {			    
					"Phong Th��ng L�nh Ti�n Phong - T�ng/#ProcessIndexHe(2)",
					"Phong Th��ng L�nh Ti�n Phong - Li�u/#ProcessIndexHe(3)",					
					"Hi�n t�i ta ch�a mu�n nh�n/SayNo",
					}
	
	Say("B�ng h�u nh�n phong th��ng l�nh n�o?",getn(tGift2),tGift2)

end

function ProcessIndexHe(nIndex)		
		local nExtVal = GetExtPoint(tEventHeGift[nIndex][4])
		local nFreeItemRoom = GetFreeItemRoom()
		
		if (nExtVal >= 1) then
			if nIndex == 2 then
				SetTask(2428,1)
			else
				if nIndex == 3 then
					SetTask(2428,2)
				end
			end
			
			if ((nFreeItemRoom >=  nExtVal*tEventHeGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tEventHeGift[nIndex][3] <= GetMaxItemWeight())) then
				if PayExtPoint(tEventHeGift[nIndex][4], nExtVal) == 1 then
					WriteLog("[Vui He]\t"..GetAccount().."\t"..GetName().."\t �� nh�n ���c "..nExtVal.." "..tEventHeGift[nIndex][1])				
				end
			else
				if ((nFreeItemRoom <  nExtVal*tEventHeGift[nIndex][2])  and (nFreeItemRoom > 0)) then
					Say("Ch�c m�ng b�ng h�u �� tr�ng th��ng "..nExtVal.." "..tEventHeGift[nIndex][1]..". H�nh trang c�a b�ng h�u ch� c� <color=Gold>"..nFreeItemRoom.." � tr�ng<color> n�n ch� nh�n ���c <color=Gold>"..nFreeItemRoom.."<color> "..tEventHeGift[nIndex][1]..". Sau khi nh�n th��ng h�y s�p x�p l�i h�nh trang r�i ��n g�p ta.",2,"��ng �/#SayYesHe("..nIndex..","..GetFreeItemRoom()..")","�� ta s�p x�p l�i h�nh trang/SayNoHe")
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
end

function SayYesHe(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tEventHeGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tEventHeGift[nIndex][3] <= GetMaxItemWeight())) then
		if PayExtPoint(tEventHeGift[nIndex][4], nFreeItemRoom) == 1 then
			WriteLog("[Vui He]\t"..GetAccount().."\t"..GetName().."\t �� nh�n ���c "..nFreeItemRoom.." "..tEventHeGift[nIndex][1])				
		end
	else
		Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
		Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
		return
	end
end


function SayNoHe()	
end