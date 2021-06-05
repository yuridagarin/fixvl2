-- Event khuy�n m�i th�ng 4 - May m�n th� c�o, R��c v�o v�n l�c
-- tPromotionGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}

tPromotionGift=
{
	[1] = {"B�t B�o T�y T�y Ti�n ��n",1,1,0}, -- Gi�i t�
	[2] = {"T�y T�y linh ��n",1,1,1}, -- Gi�i n�m
	[3] = {"S� tay s�ng",1,1,2}, -- Gi�i s�u
	[4] = {"B�n Ti�u",1,10,3}, -- Gi�i b�y
	[5] = {"Th�n N�ng ��n",1,1,4}, -- Gi�i t�m
	[6] = {"B�ch C�u Ho�n",1,1,5}, -- Gi�i ch�n
}

function RequestPromotionGift()

local gift = {			    
			    	"Ph�n th��ng Gi�i T�/#processIndex(1)",
				"Ph�n th��ng Gi�i N�m/#processIndex(2)",
				"Ph�n th��ng Gi�i S�u/#processIndex(3)",
				"Ph�n th��ng Gi�i B�y/#processIndex(4)",
				"Ph�n th��ng Gi�i T�m/#processIndex(5)",
				"Ph�n th��ng Gi�i Ch�n/#processIndex(6)",
				"Hi�n t�i ta ch�a mu�n nh�n./SayNo",
				}
	
	Say("Ng��i ch�i trong th�i gian t� <color=Gold>18/04/2008 - 30/05/2008<color> tham gia ch��ng tr�nh <color=Gold>V�ng Quay May M�n<color> s� c� c� h�i nh�n ���c c�c ph�n th��ng gi� tr�. Th�i gian nh�n th��ng t� <color=Gold>18/04/2008 - 07/06/2008<color>. B�ng h�u nh�n ph�n th��ng n�o? ",getn(gift),gift)

end


function processIndex(nIndex)
	local nExtVal = GetExtPoint(tPromotionGift[nIndex][4])
	local nFreeItemRoom = GetFreeItemRoom()
	
	if (nExtVal >= 1) then
		if ((nFreeItemRoom >=  nExtVal*tPromotionGift[nIndex][2]) and (GetCurItemWeight() + nExtVal*tPromotionGift[nIndex][3] <= GetMaxItemWeight())) then
			PayExtPoint(tPromotionGift[nIndex][4], nExtVal)
		else
			if ((nFreeItemRoom <  nExtVal*tPromotionGift[nIndex][2])  and (nFreeItemRoom > 0)) then
				Say("Ch�c m�ng b�ng h�u �� tr�ng th��ng "..nExtVal.." "..tPromotionGift[nIndex][1]..". H�nh trang c�a b�ng h�u ch� c� <color=Gold>"..nFreeItemRoom.." � tr�ng<color> n�n ch� nh�n ���c <color=Gold>"..nFreeItemRoom.."<color> "..tPromotionGift[nIndex][1]..". Sau khi nh�n th��ng h�y s�p x�p l�i h�nh trang r�i ��n g�p ta.",2,"��ng �/#SayYes("..nIndex..","..GetFreeItemRoom()..")","�� ta s�p x�p l�i h�nh trang/SayNo")
			else
				Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
				Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
				return			
			end
		end		
	else
		Say("Ch� c� ng��i tr�ng th��ng m�i ���c nh�n qu�!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
	end
end


function SayYes(nIndex, nFreeItemRoom)
	if ((GetFreeItemRoom() >=  nFreeItemRoom*tPromotionGift[nIndex][2]) and (GetCurItemWeight() + nFreeItemRoom*tPromotionGift[nIndex][3] <= GetMaxItemWeight())) then
		PayExtPoint(tPromotionGift[nIndex][4], nFreeItemRoom)
	else
		Say("S�c l�c ho�c h�nh trang c�a b�ng h�u kh�ng ��.",0)
		Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
		return
	end
end


function SayNo()
end