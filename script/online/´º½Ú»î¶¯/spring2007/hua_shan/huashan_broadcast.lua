--脚本名称：2007年春节活动-华山竞技-活动准备脚本
--脚本功能：华山竞技活动的广播
--代码编写人：村长
--代码编写时间：2007-01-29
--代码修改记录：
--============================公共变量定义区===============================
--赵贵春公共文件
Include("\\script\\online\\zgc_public_fun.lua")
--================================主逻辑===================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local time_minuet_dis = floor((66600 - Zgc_pub_today_sec_num_rtn())/60)
	if time_minuet_dis > 0 then
		Msg2SubWorld("H閕 Hoa S琻"..time_minuet_dis.." ph髏 n鱝 s? b総 u, c竎 anh h飊g h穣 nhanh ch鉵g tham gia!")
	else
		Msg2SubWorld("H閕 Hoa S琻  b総 u")
	end
end
