--filename:newyear_notice.lua
--create date:2006-01-04
--author:yanjun
--describe:���ڻ����ű�
Include("\\script\\online\\���ڻ\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%y%m%d"))
	local nHour = GetLocalTime();
	if (Check_Date() == 0) and NEWYEAR_SWITCH == 1 then
		if nHour == 9 or nHour == 15 or nHour == 19 or nHour == 22 then
			AddLocalNews("Ng��i ch�i ch� �, c�n 30 ph�t n�a Ph�c Th�n s� ph�t t�ng 50 h�ng bao � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u.")
			Msg2SubWorld("Ng��i ch�i ch� �, c�n 30 ph�t n�a Ph�c Th�n s� ph�t t�ng 50 h�ng bao � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u.")
		elseif nHour == 13 or nHour == 18 or nHour == 21 then
			AddLocalNews("Ng��i ch�i ch� �, c�n 30 ph�t n�a, Ni�n Th� s� xu�t hi�n!")
			Msg2SubWorld("Ng��i ch�i ch� �, c�n 30 ph�t n�a, Ni�n Th� s� xu�t hi�n!")
		end		
	end
end
