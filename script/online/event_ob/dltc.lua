EXT_POINT_DLTC = 6

function take_gift_dltc()
	local nExtVal = GetExtPoint(6)
	local nLevel = GetLevel()
	
	if (nLevel >= 10) then
		if (nExtVal >= 1 and nExtVal <= 100) then
			Say("Ch�c m�ng b�ng h�u �� tr�ng th��ng <color=Gold>"..nExtVal.."<color> Th�n N�ng ��n. B�ng h�u mu�n nh�n th��ng kh�ng?",2, "Ta mu�n nh�n ph�n th��ng!/Confirm","Hi�n t�i ta ch�a c�n/SayNo")
		else
			Say("Ch� c� ng��i tr�ng th��ng m�i nh�n ���c qu�!",0)
			Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
		end
	else
		Say("��ng c�p 10 tr� l�n m�i ���c nh�n qu�!",0)		
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
	end
end


function Confirm()
	local nExtVal = GetExtPoint(6)
	local nLevel = GetLevel()
	local nFreeItemRoom = GetFreeItemRoom() 
		
	if (nLevel >= 10) then
		if (nExtVal >= 1 and nExtVal <= 100) then
			if (nFreeItemRoom >=  nExtVal) then
				PayExtPoint(EXT_POINT_DLTC, nExtVal)
			else
				Say("H�nh trang c�a b�ng h�u ch� c� <color=Gold>"..nFreeItemRoom.." � tr�ng<color> n�n ch� nh�n ���c <color=Gold>"..nFreeItemRoom.."<color> Th�n N�ng ��n. Sau khi nh�n th��ng h�y s�p x�p l�i h�nh trang r�i ��n g�p ta.",2,"��ng �/#SayYes("..nFreeItemRoom..")","�� ta s�p x�p l�i h�nh trang/SayNo")					
			end		
		else
			Say("Ch� c� ng��i tr�ng th��ng m�i nh�n ���c qu�!",0)
			Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
		end
	else
		Say("��ng c�p 10 tr� l�n m�i ���c nh�n qu�!",0)		
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
	end
end

function SayYes(nFreeItemRoom)
	if (GetFreeItemRoom() >= nFreeItemRoom) then		
		PayExtPoint(EXT_POINT_DLTC, nFreeItemRoom)
	else	
		Say("H�nh trang c�a b�ng h�u kh�ng �� "..nFreeItemRoom.." � tr�ng.",0)
		Msg2Player("H�nh trang c�a b�n kh�ng �� � tr�ng.")
		return
	end	
end

function SayNo()

end

