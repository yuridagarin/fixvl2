--filename:snowwar_notice.lua
--create date:2006-01-18
--author:yanjun
--describe:��ѩ�̻����ű�
Include("\\script\\online\\���ڻ\\newyear_head.lua")	

function main()
	local nDay = GetCurDate()
	local nMonth = GetCurMonth()
	local nHour = GetLocalTime()
	if ((nMonth == 1 and nDay >= 20) or (nMonth == 2 and nDay <= 5)) and NEWYEAR_SWITCH == 1 then
		AddLocalNews("Ch� �: c�n 30 ph�t n�a � 5 khu v�c n�m tuy�t s� ph�t t�ng 100 ph�n qu� n�m m�i!")
		Msg2SubWorld("Ch� �: c�n 30 ph�t n�a � 5 khu v�c n�m tuy�t s� ph�t t�ng 100 ph�n qu� n�m m�i!")
	end
end		
