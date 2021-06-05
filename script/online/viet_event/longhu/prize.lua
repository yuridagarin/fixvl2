-- Created by TuanNA5
-- Give player award for 3rd BHTA

EXT_MATTICH = -1
EXT_NHANSAM = 5
BHTA_DATE_START = 10051400
BHTA_DATE_END = 10051624

tPrize ={
	{"M�nh M�t T�ch Th�t L�c",{2,1,1088},1,1,EXT_MATTICH},
	{"Nh�n S�m V�n N�m",{2,1,30071},1,1,EXT_NHANSAM}
}

function get_prize()
	local tSay = {
--		"Nh�n M�nh M�t T�ch Th�t L�c/#processIndex(1)",
		"Nh�n Nh�n S�m V�n N�m/#processIndex(2)",
		"K�t th�c ��i tho�i/nothing",
	}	
	Say("Th�i gian nh�n th��ng v�t ph�m Bang H�i Tinh Anh 3 t� <color=red>14/05/2010 - 16/05/2010<color>, c�c h� nh�n ph�n th��ng n�o?",getn(tSay),tSay)
end


function processIndex(nIndex)		
	local nExtVal = GetExtPoint(tPrize[nIndex][5])
	local nFreeItemRoom = GetFreeItemRoom()
	
	if (nExtVal >= 1) then
		if ((nFreeItemRoom >=  tPrize[nIndex][3]) and (GetCurItemWeight() + nExtVal*tPrize[nIndex][4] <= GetMaxItemWeight())) then
			PayExtPoint(tPrize[nIndex][5], nExtVal)
		else			
			Say("S�c l�c ho�c h�nh trang c�a c�c h� kh�ng ��.",0)
			Msg2Player("S�c l�c ho�c h�nh trang c�a b�n kh�ng ��.")
			return			
		end		
	else
		Say("Ch� c� ng��i tham gia Bang H�i Tinh Anh 3 m�i ���c nh�n!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
	end
end