Include("\\script\\online\\ʥ���ڻ\\christmas_head.lua")
function main()
	iMonth = GetCurMonth()
	iDay = GetCurDate()
	if iMonth == 12 and (iDay >=23 and iDay <=28) and CHRISTMAS_SWITCH == 1 then
		SetGlbValue(ID_PRESENT_NUMBER_CD,100)
		SetGlbValue(ID_PRESENT_NUMBER_QZ,100)
		SetGlbValue(ID_PRESENT_NUMBER_BJ,100)
		AddLocalNews("Hi�n gi� th�ng Gi�ng Sinh � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� treo qu�, ng��i ch�i h�y mau ��n l�y.")
		Msg2SubWorld("Hi�n gi� th�ng Gi�ng Sinh � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� treo qu�, ng��i ch�i h�y mau ��n l�y.")
	end
end