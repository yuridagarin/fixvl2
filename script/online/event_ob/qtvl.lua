EXT_POINT_QTVL = 4

START_DATE_QTVL = 2007120500
END_DATE_QTVL = 2007120900

PRIZE_QTVL = 3

function take_gift_qtvl()
	local nExtVal = GetExtPoint(EXT_POINT_QTVL)	
	
	if (nExtVal == 1) then
			if (GetFreeItemRoom() >=  PRIZE_QTVL) then
				PayExtPoint(EXT_POINT_QTVL, nExtVal)
			else
				Say("H�nh trang b�ng h�u kh�ng �� "..PRIZE_QTVL.." ch� tr�ng.",0)
				Msg2Player("H�nh trang c�a b�n kh�ng �� ch� tr�ng.")
				return
			end		
	else
		Say("Ch� c� ng��i ��ng nh�p v�o ng�y 01/12/2007 m�i nh�n ���c qu�!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n qu�.")
	end
end
