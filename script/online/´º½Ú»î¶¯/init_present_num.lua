--filename:init_present_num.lua
--create date:2006-01-05
--author:yanjun
--describe:��ʼ���������ϵ���������
Include("\\script\\online\\���ڻ\\newyear_head.lua")

function main()
	if Check_Date() == 0 then
		SetGlbValue(GLB_PRESENT_NUM_BJ,50)
		SetGlbValue(GLB_PRESENT_NUM_CD,50)
		SetGlbValue(GLB_PRESENT_NUM_QZ,50)
		AddLocalNews("Ph�c th�n � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u �� b�t ��u ph�t h�ng bao, ch� c� 50 h�ng bao th�i nh�, xin c�c v� h�y nhanh ch�n ��n l�y!")
		Msg2SubWorld("Ph�c th�n � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u �� b�t ��u ph�t h�ng bao, ch� c� 50 h�ng bao th�i nh�, xin c�c v� h�y nhanh ch�n ��n l�y!")
	end
end	