--2007春节活动-麻将收集活动-活动广播
--代码开发人：赵贵春
--代码开发时间：2007-01-26
--修改记录:

--赵贵春公共文件
Include("\\script\\online\\zgc_public_fun.lua")
--=============================公共变量定义区==============================
--===============================主逻辑区==================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local mah_seq_time = {{11,time_distance},{15,time_distance},{22,time_distance}}
	local mah_suc_seq = spring_2007_mahj_suc_seq_rtn()
	if mah_suc_seq == 0then
		local mah_jong_suc_seq = {		--麻将和发法序列
			{11,4,16},	{12,10,7},	{18,16,15},
			{4,17,14},	{10,6,1},	{2,7,3},
			{4,19,9},	{3,1,5},	{8,11,2},
			{1,12,13},	{13,9,7},	{2,12,15},
			{16,10,6},	{17,14,19},	{18,11,3},
			{9,5,1},	{4,2,1},
		}
		mah_suc_seq = 1
		local sec_seq_now = Zgc_pub_today_sec_num_rtn()		--获得现在是今天的第多少秒
		for i = 1, 3 do
			sec_seq_now[i].time_distance = sec_seq_now - (sec_seq_now[i][1]*3600 )
		end
		for i = 2,3 do
			if sec_seq_now[i].time_distance < sec_seq_now[i-1].time_distance then
				mah_suc_seq = i
			end
		end
		local date_seq = (zgc_pub_day_turn(1) - 13552 + 1)
		mah_suc_seq = mah_jong_suc_seq[date_seq][mah_suc_seq]
	end
	local mah_suc_name = {	"Чi T? H?",		"T? Kh綾 T?",		"C鰑 Li猲 B秓 Жng", "Th藀 Tham Y猽",	"Li猲 Th蕋 цi",
							"Thanh Th蕋 цi",		"Th蕋 Tinh B蕋 Kh竜",		"Th鑙 b蕋 o",	"Чi Tam Nguy猲",	"Thanh Y猽 C鰑",
							"Nh蕋 S綾 T? уng Thu薾", 	"Nh蕋 S綾 T? Ti誸 Cao", 	"T? Nh蕋 S綾",	"Thanh Nh蕋 S綾",
							"To祅 i",			"To祅 trung",			"To祅 ti觰",		"Thanh Long",		"Tam Kh綾 T?",}
	Msg2SubWorld("Ho箃 ng thu th藀 b礽 M筩 Chc:"..mah_suc_name[mah_suc_seq].."!")
	Msg2SubWorld("M鋓 ngi tham gia gia ho箃 ng thu th藀, n 3 th祅h th? ch輓h g苝 Ph骳 Th莕  nh薾 ph莕 thng.")
	Msg2SubWorld("Xin n ch? Ph骳 Th莕 nh薾  Hng d蒼 ho箃 ng (mi詎 ph?)")
end
