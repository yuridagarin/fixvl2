--filename:init_present_num.lua
--create date:2006-01-05
--author:yanjun
--describe:初始化福神身上的礼物数量
Include("\\script\\online\\春节活动\\newyear_head.lua")

function main()
	if Check_Date() == 0 then
		SetGlbValue(GLB_PRESENT_NUM_BJ,50)
		SetGlbValue(GLB_PRESENT_NUM_CD,50)
		SetGlbValue(GLB_PRESENT_NUM_QZ,50)
		AddLocalNews("Ph骳 th莕 ? Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗  b総 u ph竧 h錸g bao, ch? c? 50 h錸g bao th玦 nh?, xin c竎 v? h穣 nhanh ch﹏ n l蕐!")
		Msg2SubWorld("Ph骳 th莕 ? Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗  b総 u ph竧 h錸g bao, ch? c? 50 h錸g bao th玦 nh?, xin c竎 v? h穣 nhanh ch﹏ n l蕐!")
	end
end	