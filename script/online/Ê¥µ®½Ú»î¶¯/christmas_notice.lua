Include("\\script\\online\\ʥ���ڻ\\christmas_head.lua")
function main()
	iMonth = GetCurMonth()
	iDay = GetCurDate()
	if iMonth == 12 and (iDay >=23 and iDay <=28) and CHRISTMAS_SWITCH == 1 then
		local nHour = GetLocalTime()
		if nHour == 20 then
			AddLocalNews("21h t�i nay, � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u s� treo 300 ph�n qu� tr�n nh�ng c�y th�ng Gi�ng Sinh, ng��i ch�i h�y mau ��n l�y.")
			Msg2SubWorld("21h t�i nay, � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u s� treo 300 ph�n qu� tr�n nh�ng c�y th�ng Gi�ng Sinh, ng��i ch�i h�y mau ��n l�y.")
		elseif nHour == 22 then
			AddLocalNews("23h t�i nay, � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u s� treo 300 ph�n qu� tr�n nh�ng c�y th�ng Gi�ng Sinh, ng��i ch�i h�y mau ��n l�y.")
			Msg2SubWorld("23h t�i nay, � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u s� treo 300 ph�n qu� tr�n nh�ng c�y th�ng Gi�ng Sinh, ng��i ch�i h�y mau ��n l�y.")
		end
	end
end