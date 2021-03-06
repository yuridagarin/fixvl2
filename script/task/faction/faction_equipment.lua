--脚本名称：师门装备增加脚本
--脚本功能：师门武器的增加功能封装
--策划人：严军和村长
--代码开发人：村长
--代码开发时间：2006-04-06
--代码修改记录
--备注：传入参数	1、player_way：玩家路线
--			2、palyer_body：玩家体型
--			3、att_num：给装备的数量：（40-45为40级）40为给师门全套，41为头，42为衣服，43为鞋子，44为武器
--						  （60-65为60级）60为给师门全套，61为头，62为衣服，63为鞋子，64为武器，65为首饰
--			4、knife_rung：少林俗家给刀还是棍子：0为全给，4为刀，5为棍子
Tb_teacher_att = {}
--40级师门装备列表
Tb_teacher_att[40] = {
	--少林
	{},
	--少林俗家
	{	
		{	
			{"H祅h Gi? m穙",0,103,201},
			{"H祅h Gi? ph鬰",0,100,201},
			{"H祅h Gi? trang",0,101,201},
			{"H祅h Gi? Gi韎 產o",0,3,201},
			{"H祅h Gi? Gi韎 c玭",0,5,201},
		},
		{	
			{"H祅h Gi? m穙",0,103,202},
			{"H祅h Gi? ph鬰",0,100,202},
			{"H祅h Gi? trang",0,101,202},
			{"H祅h Gi? Gi韎 產o",0,3,202},
			{"H祅h Gi? Gi韎 c玭",0,5,202},
		},	
	},
	--少林禅僧
	{	
		{	
			{"Kh? H祅h m穙",0,103,301},
			{"Kh? H祅h b祇",0,100,301},
			{"Kh? H祅h ph鬰",0,101,301},
			{"Kh? H祅h Trng",0,8,301},
		},
		{	
			{"Kh? H祅h m穙",0,103,302},
			{"Kh? H祅h b祇",0,100,302},
			{"Kh? H祅h ph鬰",0,101,302},
			{"Kh? H祅h Trng",0,8,302},
		},
	},
	--少林武僧
	{	
		{
			{"Sa Di m穙",0,103,401},
			{"Sa Di Ph鬰",0,100,401},
			{"Sa Di ph鬰",0,101,401},
			{"Sa Di H? Uy觧",0,0,401},
		},
		{
			{"Sa Di m穙",0,103,402},
			{"Sa Di Ph鬰",0,100,402},
			{"Sa Di ph鬰",0,101,402},
			{"Sa Di H? Uy觧",0,0,402},
		},
	},
	--唐门   
	{},
	--唐门   
	{	
		{	
			{"Trang Kh竎h m穙",0,103,601},
			{"Trang kh竎h ph鬰",0,100,601},
			{"Trang Kh竎h ph鬰",0,101,601},
			{"Trang Kh竎h Phi o",0,1,601},		
		},
		{
			{"Trang Kh竎h m穙",0,103,602},
			{"Trang kh竎h ph鬰",0,100,602},
			{"Trang Kh竎h ph鬰",0,101,602},
			{"Trang Kh竎h Phi o",0,1,602},		
		},
		{
			{"Trang Kh竎h m穙",0,103,603},
			{"Trang kh竎h ph鬰",0,100,603},
			{"Trang Kh竎h ph鬰",0,101,603},
			{"Trang Kh竎h Phi o",0,1,603},		
		},
		{
			{"Trang Kh竎h m穙",0,103,604},
			{"Trang kh竎h ph鬰",0,100,604},
			{"Trang Kh竎h ph鬰",0,101,604},
			{"Trang Kh竎h Phi o",0,1,604},		
		},
	},
	---峨嵋
	{},
	--峨嵋佛家
	
	{	{},{},
		{
			{"Thanh T﹎",0,103,801},
			{"Thanh T﹎ t? y",0,100,801},
			{"Thanh T﹎ t? trang",0,101,801},
			{"Thanh T﹎ T? Ki誱",0,2,801},		
		},
		{
			{"Thanh T﹎",0,103,802},
			{"Thanh T﹎ t? y",0,100,802},
			{"Thanh T﹎ t? trang",0,101,802},
			{"Thanh T﹎ T? Ki誱",0,2,802},
		},
	},
	--峨嵋俗家
	{	{},{},
		{
			{"T? Kh骳",0,103,901},
			{"T? Kh骳 t? y",0,100,901},
			{"T? Kh骳 ph鬰",0,101,901},
			{"T? Kh骳 T? C莔",0,10,901},	
		},
		{
			{"T? Kh骳",0,103,902},
			{"T? Kh骳 t? y",0,100,902},
			{"T? Kh骳 ph鬰",0,101,902},
			{"T? Kh骳 T? C莔",0,10,902},		
		},
	},
	--丐帮
	{},
	--丐帮净衣
	{	
		{
			{"Ch蕄 B竧 c﹏",0,103,1101},
			{"Ch蕄 B竧 Thng",0,100,1101},
			{"Ch蕄 B竧 ph鬰",0,101,1101},
			{"B竧 s?",0,0,1101},	
		},
		{
			{"Ch蕄 B竧 c﹏",0,103,1102},
			{"Ch蕄 B竧 Thng",0,100,1102},
			{"Ch蕄 B竧 ph鬰",0,101,1102},
			{"B竧 s?",0,0,1102},		
		},
		{
			{"Ch蕄 B竧 c﹏",0,103,1103},
			{"Ch蕄 B竧 Thng",0,100,1103},
			{"Ch蕄 B竧 ph鬰",0,101,1103},
			{"B竧 s?",0,0,1103},		
		},
		{
			{"Ch蕄 B竧 c﹏",0,103,1104},
			{"Ch蕄 B竧 Thng",0,100,1104},
			{"Ch蕄 B竧 ph鬰",0,101,1104},
			{"B竧 s?",0,0,1104},		
		},
	},
	--丐帮污衣
	{	
		{
			{"Khi誹 Hoa c﹏",0,103,1201},
			{"Khi誹 Hoa y",0,100,1201},
			{"Khi誹 Hoa Kh?",0,101,1201},
			{"Khi誹 Hoa B鎛g",0,5,1201},	
		},
		{
			{"Khi誹 Hoa c﹏",0,103,1202},
			{"Khi誹 Hoa y",0,100,1202},
			{"Khi誹 Hoa Kh?",0,101,1202},
			{"Khi誹 Hoa B鎛g",0,5,1202},		
		},
		{
			{"Khi誹 Hoa c﹏",0,103,1203},
			{"Khi誹 Hoa y",0,100,1203},
			{"Khi誹 Hoa Kh?",0,101,1203},
			{"Khi誹 Hoa B鎛g",0,5,1203},		
		},
		{
			{"Khi誹 Hoa c﹏",0,103,1204},
			{"Khi誹 Hoa y",0,100,1204},
			{"Khi誹 Hoa Kh?",0,101,1204},
			{"Khi誹 Hoa B鎛g",0,5,1204},		
		},
	},
	--武当
	{},
	--武当道家
	{	
		{
			{"Thanh Tu c﹏",0,103,1401},
			{"Thanh Tu b祇",0,100,1401},
			{"Thanh Tu ph鬰",0,101,1401},
			{"Thanh Tu Ki誱",0,2,1401},	
		},
		{
			{"Thanh Tu c﹏",0,103,1402},
			{"Thanh Tu b祇",0,100,1402},
			{"Thanh Tu ph鬰",0,101,1402},
			{"Thanh Tu Ki誱",0,2,1402},		
		},
		{
			{"Thanh Tu c﹏",0,103,1403},
			{"Thanh Tu b祇",0,100,1403},
			{"Thanh Tu ph鬰",0,101,1403},
			{"Thanh Tu Ki誱",0,2,1403},		
		},
		{
			{"Thanh Tu c﹏",0,103,1404},
			{"Thanh Tu b祇",0,100,1404},
			{"Thanh Tu ph鬰",0,101,1404},
			{"Thanh Tu Ki誱",0,2,1404},		
		},
	},
	--武当俗家
	{	
		{
			{"Thanh Phong c﹏",0,103,1501},
			{"Thanh Phong b祇",0,100,1501},
			{"Thanh Phong ph鬰",0,101,1501},
			{"Thanh Phong Th輈h",0,9,1501},	
		},
		{
			{"Thanh Phong c﹏",0,103,1502},
			{"Thanh Phong b祇",0,100,1502},
			{"Thanh Phong ph鬰",0,101,1502},
			{"Thanh Phong Th輈h",0,9,1502},		
		},
		{
			{"Thanh Phong c﹏",0,103,1503},
			{"Thanh Phong b祇",0,100,1503},
			{"Thanh Phong ph鬰",0,101,1503},
			{"Thanh Phong Th輈h",0,9,1503},		
		},
		{
			{"Thanh Phong c﹏",0,103,1504},
			{"Thanh Phong b祇",0,100,1504},
			{"Thanh Phong ph鬰",0,101,1504},
			{"Thanh Phong Th輈h",0,9,1504},		
		},
	},
	--杨门
	{},
	--杨门枪骑
	{	
		{
			{"Khinh K? kh玦",0,103,1701},
			{"Khinh K? gi竝",0,100,1701},
			{"Khinh K? ph鬰",0,101,1701},
			{"Khinh K? Thng",0,6,1701},	
		},
		{
			{"Khinh K? kh玦",0,103,1702},
			{"Khinh K? gi竝",0,100,1702},
			{"Khinh K? ph鬰",0,101,1702},
			{"Khinh K? Thng",0,6,1702},		
		},
		{
			{"Khinh K? kh玦",0,103,1703},
			{"Khinh K? gi竝",0,100,1703},
			{"Khinh K? ph鬰",0,101,1703},
			{"Khinh K? Thng",0,6,1703},		
		},
		{
			{"Khinh K? kh玦",0,103,1704},
			{"Khinh K? gi竝",0,100,1704},
			{"Khinh K? ph鬰",0,101,1704},
			{"Khinh K? Thng",0,6,1704},		
		},
	},
	--杨门弓骑
	{	
		{
			{"N? Th? kh玦",0,103,1801},
			{"N? th? gi竝",0,100,1801},
			{"N? Th? ph鬰",0,101,1801},
			{"N? Th? Cung",0,4,1801},	
		},
		{
			{"N? Th? kh玦",0,103,1802},
			{"N? th? gi竝",0,100,1802},
			{"N? Th? ph鬰",0,101,1802},
			{"N? Th? Cung",0,4,1802},		
		},
		{
			{"N? Th? kh玦",0,103,1803},
			{"N? th? gi竝",0,100,1803},
			{"N? Th? ph鬰",0,101,1803},
			{"N? Th? Cung",0,4,1803},		
		},
		{
			{"N? Th? kh玦",0,103,1804},
			{"N? th? gi竝",0,100,1804},
			{"N? Th? ph鬰",0,101,1804},
			{"N? Th? Cung",0,4,1804},		
		},
	},
	--五毒
	{},
	--五毒邪侠
	{	
		{
			{"箃 Ph竎h di謓",0,103,2001},
			{"箃 Ph竎h y",0,100,2001},
			{"箃 Ph竎h ph鬰",0,101,2001},
			{"箃 Ph竎h 產o",0,7,2001},	
		},
		{
			{"箃 Ph竎h di謓",0,103,2002},
			{"箃 Ph竎h y",0,100,2002},
			{"箃 Ph竎h ph鬰",0,101,2002},
			{"箃 Ph竎h 產o",0,7,2002},		
		},
		{
			{"箃 Ph竎h di謓",0,103,2003},
			{"箃 Ph竎h y",0,100,2003},
			{"箃 Ph竎h ph鬰",0,101,2003},
			{"箃 Ph竎h 產o",0,7,2003},		
		},
		{
			{"箃 Ph竎h di謓",0,103,2004},
			{"箃 Ph竎h y",0,100,2004},
			{"箃 Ph竎h ph鬰",0,101,2004},
			{"箃 Ph竎h 產o",0,7,2004},		
		},
	},
	--五毒蛊师
	{	
		{
			{"чc T祄 di謓",0,103,2101},
			{"чc T祄 Y",0,100,2101},
			{"чc T祄 ph鬰",0,101,2101},
			{"чc T祄 Tr秓",0,11,2101},		
		},
		{
			{"чc T祄 di謓",0,103,2102},
			{"чc T祄 Y",0,100,2102},
			{"чc T祄 ph鬰",0,101,2102},
			{"чc T祄 Tr秓",0,11,2102},		
		},
		{
			{"чc T祄 di謓",0,103,2103},
			{"чc T祄 Y",0,100,2103},
			{"чc T祄 ph鬰",0,101,2103},
			{"чc T祄 Tr秓",0,11,2103},		
		},
		{
			{"чc T祄 di謓",0,103,2104},
			{"чc T祄 Y",0,100,2104},
			{"чc T祄 ph鬰",0,101,2104},
			{"чc T祄 Tr秓",0,11,2104},		
		},
	},

}
--60级装备列表
--070809更新头部装备ID
Tb_teacher_att[60] = {

	--少林
	{},
	--少林俗家
	{	
		{	
			{"H鏽 Nguy猲 m穙",0,103,211},
			{"H祅h Gi? ph鬰",0,100,201},
			{"H鏽 Nguy猲 trang",0,101,211},
			{"H祅h Gi? Gi韎 產o",0,3,201},
			{"H祅h Gi? Gi韎 c玭",0,5,201},
		},
		{	
			{"H鏽 Nguy猲 m穙",0,103,212},
			{"H祅h Gi? ph鬰",0,100,202},
			{"H鏽 Nguy猲 trang",0,101,212},
			{"H祅h Gi? Gi韎 產o",0,3,202},
			{"H祅h Gi? Gi韎 c玭",0,5,202},
		},	
	},
	--少林禅僧
	{	
		{	
			{"Thi襫 Tu m穙",0,103,311},
			{"Kh? H祅h b祇",0,100,301},
			{"Thi襫 Tu ph鬰",0,101,311},
			{"Kh? H祅h Trng",0,8,301},
		},
		{	
			{"Thi襫 Tu m穙",0,103,312},
			{"Kh? H祅h b祇",0,100,302},
			{"Thi襫 Tu ph鬰",0,101,312},
			{"Kh? H祅h Trng",0,8,302},
		},
	},
	--少林武僧
	{	
		{
			{"u T╪g m穙",0,103,411},
			{"Sa Di Ph鬰",0,100,401},
			{"u T╪g ph鬰",0,101,411},
			{"Sa Di H? Uy觧",0,0,401},
		},
		{
			{"u T╪g m穙",0,103,412},
			{"Sa Di Ph鬰",0,100,402},
			{"u T╪g ph鬰",0,101,412},
			{"Sa Di H? Uy觧",0,0,402},
		},
	},
	--唐门   
	{},
	--唐门   
	{	
		{	
			{"H? V? m穙",0,103,611},
			{"Trang kh竎h ph鬰",0,100,601},
			{"H? V? ph鬰",0,101,611},
			{"Trang Kh竎h Phi o",0,1,601},		
		},
		{
			{"H? V? m穙",0,103,612},
			{"Trang kh竎h ph鬰",0,100,602},
			{"H? V? ph鬰",0,101,612},
			{"Trang Kh竎h Phi o",0,1,602},		
		},
		{
			{"H? V? m穙",0,103,613},
			{"Trang kh竎h ph鬰",0,100,603},
			{"H? V? ph鬰",0,101,613},
			{"Trang Kh竎h Phi o",0,1,603},		
		},
		{
			{"H? V? m穙",0,103,614},
			{"Trang kh竎h ph鬰",0,100,604},
			{"H? V? ph鬰",0,101,614},
			{"Trang Kh竎h Phi o",0,1,604},		
		},
	},
	---峨嵋
	{},
	--峨嵋佛家
	
	{	{},{},
		{
			{"Th竔 V?",0,103,811},
			{"Thanh T﹎ t? y",0,100,801},
			{"Th竔 V? T? ph鬰",0,101,811},
			{"Thanh T﹎ T? Ki誱",0,2,801},		
		},
		{
			{"Th竔 V?",0,103,812},
			{"Thanh T﹎ t? y",0,100,802},
			{"Th竔 V? T? ph鬰",0,101,812},
			{"Thanh T﹎ T? Ki誱",0,2,802},
		},
	},
	--峨嵋俗家
	{	{},{},
		{
			{"Ph筸 ",0,103,911},
			{"T? Kh骳 t? y",0,100,901},
			{"Ph筺  ph鬰",0,101,911},
			{"T? Kh骳 T? C莔",0,10,901},	
		},
		{
			{"Ph筸 ",0,103,912},
			{"T? Kh骳 t? y",0,100,902},
			{"Ph筺  ph鬰",0,101,912},
			{"T? Kh骳 T? C莔",0,10,902},		
		},
	},
	--丐帮
	{},
	--丐帮净衣
	{	
		{
			{"Tr? Gian c﹏",0,103,1111},
			{"Ch蕄 B竧 Thng",0,100,1101},
			{"Tr? Gian ph鬰",0,101,1111},
			{"B竧 s?",0,0,1101},	
		},
		{
			{"Tr? Gian c﹏",0,103,1112},
			{"Ch蕄 B竧 Thng",0,100,1102},
			{"Tr? Gian ph鬰",0,101,1112},
			{"B竧 s?",0,0,1102},		
		},
		{
			{"Tr? Gian c﹏",0,103,1113},
			{"Ch蕄 B竧 Thng",0,100,1103},
			{"Tr? Gian ph鬰",0,101,1113},
			{"B竧 s?",0,0,1103},		
		},
		{
			{"Tr? Gian c﹏",0,103,1114},
			{"Ch蕄 B竧 Thng",0,100,1104},
			{"Tr? Gian ph鬰",0,101,1114},
			{"B竧 s?",0,0,1104},		
		},
	},
	--丐帮污衣
	{	
		{
			{"Tr鮪g 竎 c﹏",0,103,1211},
			{"Khi誹 Hoa y",0,100,1201},
			{"Tr鮪g 竎 ph鬰",0,101,1211},
			{"Khi誹 Hoa B鎛g",0,5,1201},	
		},
		{
			{"Tr鮪g 竎 c﹏",0,103,1212},
			{"Khi誹 Hoa y",0,100,1202},
			{"Tr鮪g 竎 ph鬰",0,101,1212},
			{"Khi誹 Hoa B鎛g",0,5,1202},		
		},
		{
			{"Tr鮪g 竎 c﹏",0,103,1213},
			{"Khi誹 Hoa y",0,100,1203},
			{"Tr鮪g 竎 ph鬰",0,101,1213},
			{"Khi誹 Hoa B鎛g",0,5,1203},		
		},
		{
			{"Tr鮪g 竎 c﹏",0,103,1214},
			{"Khi誹 Hoa y",0,100,1204},
			{"Tr鮪g 竎 ph鬰",0,101,1214},
			{"Khi誹 Hoa B鎛g",0,5,1204},		
		},
	},
	--武当
	{},
	--武当道家
	{	
		{
			{"Nh藀 Th蕋 c﹏",0,103,1411},
			{"Thanh Tu b祇",0,100,1401},
			{"Nh藀 Quan ph鬰",0,101,1411},
			{"Thanh Tu Ki誱",0,2,1401},	
		},
		{
			{"Nh藀 Th蕋 c﹏",0,103,1412},
			{"Thanh Tu b祇",0,100,1402},
			{"Nh藀 Quan ph鬰",0,101,1412},
			{"Thanh Tu Ki誱",0,2,1402},		
		},
		{
			{"Nh藀 Th蕋 c﹏",0,103,1413},
			{"Thanh Tu b祇",0,100,1403},
			{"Nh藀 Quan ph鬰",0,101,1413},
			{"Thanh Tu Ki誱",0,2,1403},		
		},
		{
			{"Nh藀 Th蕋 c﹏",0,103,1414},
			{"Thanh Tu b祇",0,100,1404},
			{"Nh藀 Quan ph鬰",0,101,1414},
			{"Thanh Tu Ki誱",0,2,1404},		
		},
	},
	--武当俗家
	{	
		{
			{"Thi觰 Dng c﹏",0,103,1511},
			{"Thanh Phong b祇",0,100,1501},
			{"Thi觰 Dng ph鬰",0,101,1511},
			{"Thanh Phong Th輈h",0,9,1501},	
		},
		{
			{"Thi觰 Dng c﹏",0,103,1512},
			{"Thanh Phong b祇",0,100,1502},
			{"Thi觰 Dng ph鬰",0,101,1512},
			{"Thanh Phong Th輈h",0,9,1502},		
		},
		{
			{"Thi觰 Dng c﹏",0,103,1513},
			{"Thanh Phong b祇",0,100,1503},
			{"Thi觰 Dng ph鬰",0,101,1513},
			{"Thanh Phong Th輈h",0,9,1503},		
		},
		{
			{"Thi觰 Dng c﹏",0,103,1514},
			{"Thanh Phong b祇",0,100,1504},
			{"Thi觰 Dng ph鬰",0,101,1514},
			{"Thanh Phong Th輈h",0,9,1504},		
		},
	},
	--杨门
	{},
	--杨门枪骑
	{	
		{
			{"Hi謚 髖 kh玦",0,103,1711},
			{"Khinh K? gi竝",0,100,1701},
			{"Hi謚 髖 Thi誸 ph鬰",0,101,1711},
			{"Khinh K? Thng",0,6,1701},	
		},
		{
			{"Hi謚 髖 kh玦",0,103,1712},
			{"Khinh K? gi竝",0,100,1702},
			{"Hi謚 髖 Thi誸 ph鬰",0,101,1712},
			{"Khinh K? Thng",0,6,1702},		
		},
		{
			{"Hi謚 髖 kh玦",0,103,1713},
			{"Khinh K? gi竝",0,100,1703},
			{"Hi謚 髖 Thi誸 ph鬰",0,101,1713},
			{"Khinh K? Thng",0,6,1703},		
		},
		{
			{"Hi謚 髖 kh玦",0,103,1714},
			{"Khinh K? gi竝",0,100,1704},
			{"Hi謚 髖 Thi誸 ph鬰",0,101,1714},
			{"Khinh K? Thng",0,6,1704},		
		},
	},
	--杨门弓骑
	{	
		{
			{"Й 髖 kh玦",0,103,1811},
			{"N? th? gi竝",0,100,1801},
			{"Й 髖 Thi誸 ph鬰",0,101,1811},
			{"N? Th? Cung",0,4,1801},	
		},
		{
			{"Й 髖 kh玦",0,103,1812},
			{"N? th? gi竝",0,100,1802},
			{"Й 髖 Thi誸 ph鬰",0,101,1812},
			{"N? Th? Cung",0,4,1802},		
		},
		{
			{"Й 髖 kh玦",0,103,1813},
			{"N? th? gi竝",0,100,1803},
			{"Й 髖 Thi誸 ph鬰",0,101,1813},
			{"N? Th? Cung",0,4,1803},		
		},
		{
			{"Й 髖 kh玦",0,103,1814},
			{"N? th? gi竝",0,100,1804},
			{"Й 髖 Thi誸 ph鬰",0,101,1814},
			{"N? Th? Cung",0,4,1804},		
		},
	},
	--五毒
	{},
	--五毒邪侠
	{	
		{
			{"Th玦 M謓h di謓",0,103,2011},
			{"箃 Ph竎h y",0,100,2001},
			{"Th玦 M謓h ph鬰",0,101,2011},
			{"箃 Ph竎h 產o",0,7,2001},	
		},
		{
			{"Th玦 M謓h di謓",0,103,2012},
			{"箃 Ph竎h y",0,100,2002},
			{"Th玦 M謓h ph鬰",0,101,2012},
			{"箃 Ph竎h 產o",0,7,2002},		
		},
		{
			{"Th玦 M謓h di謓",0,103,2013},
			{"箃 Ph竎h y",0,100,2003},
			{"Th玦 M謓h ph鬰",0,101,2013},
			{"箃 Ph竎h 產o",0,7,2003},		
		},
		{
			{"Th玦 M謓h di謓",0,103,2014},
			{"箃 Ph竎h y",0,100,2004},
			{"Th玦 M謓h ph鬰",0,101,2014},
			{"箃 Ph竎h 產o",0,7,2004},		
		},
	},
	--五毒蛊师
	{	
		{
			{"Th鵦 T﹎ di謓",0,103,2111},
			{"чc T祄 Y",0,100,2101},
			{"Th鵦 T﹎ ph鬰",0,101,2111},
			{"чc T祄 Tr秓",0,11,2101},		
		},
		{
			{"Th鵦 T﹎ di謓",0,103,2112},
			{"чc T祄 Y",0,100,2102},
			{"Th鵦 T﹎ ph鬰",0,101,2112},
			{"чc T祄 Tr秓",0,11,2102},		
		},
		{
			{"Th鵦 T﹎ di謓",0,103,2113},
			{"чc T祄 Y",0,100,2103},
			{"Th鵦 T﹎ ph鬰",0,101,2113},
			{"чc T祄 Tr秓",0,11,2103},		
		},
		{
			{"Th鵦 T﹎ di謓",0,103,2114},
			{"чc T祄 Y",0,100,2104},
			{"Th鵦 T﹎ ph鬰",0,101,2114},
			{"чc T祄 Tr秓",0,11,2104},		
		},
	},
}
--主逻辑处理函数
--	备注：俗少注意区分刀和棍子
function Add_Faction_Equipment(player_way,palyer_body,att_num,knife_rung)
	local att_level = (floor(att_num/10)) * 10
	local att_seq = att_num - att_level
	local add_flag = 0						--增加标志
	if att_seq == 0 then					--加全套的处理
		if player_way ~= 2 or (player_way == 2 and knife_rung == 0) then		--非俗少或俗少加全套
			for i = 1, getn(Tb_teacher_att[att_level][player_way][palyer_body]) do
				add_flag = add_flag * AddItem(Tb_teacher_att[att_level][player_way][palyer_body][i][2],Tb_teacher_att[att_level][player_way][palyer_body][i][3],Tb_teacher_att[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 4 then						--加刀
			for i = 1, (getn(Tb_teacher_att[att_level][player_way][palyer_body])-1) do
				add_flag = add_flag * AddItem(Tb_teacher_att[att_level][player_way][palyer_body][i][2],Tb_teacher_att[att_level][player_way][palyer_body][i][3],Tb_teacher_att[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end	
		elseif player_way == 2 and knife_rung == 5 then						--加棍
			for i = 1, (getn(Tb_teacher_att[att_level][player_way][palyer_body])-2) do
				add_flag = add_flag * AddItem(Tb_teacher_att[att_level][player_way][palyer_body][i][2],Tb_teacher_att[att_level][player_way][palyer_body][i][3],Tb_teacher_att[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end	
			add_flag = add_flag * AddItem(Tb_teacher_att[att_level][player_way][palyer_body][5][2],Tb_teacher_att[att_level][player_way][palyer_body][5][3],Tb_teacher_att[att_level][player_way][palyer_body][5][4],1,1,-1,-1,-1,-1,-1,-1)
		end
	else
		if player_way == 2 and att_seq == 4 then
			att_seq = knife_rung
		end
		add_flag = add_flag * AddItem(Tb_teacher_att[att_level][player_way][palyer_body][att_seq][2],Tb_teacher_att[att_level][player_way][palyer_body][att_seq][3],Tb_teacher_att[att_level][player_way][palyer_body][att_seq][4],1,1,-1,-1,-1,-1,-1,-1)
	end
	return add_flag
end
--新接口
function fe_AddFactionEquipment(player_way,palyer_body,att_num,knife_rung)
	return Add_Faction_Equipment(player_way,palyer_body,att_num,knife_rung);
end;
--===========================================================================================
Tb_Book = 
{		--奇数是秘籍　偶数是心法
	[0] = {{0,107,1,"Kim Cang Ph鬰 Ma kinh"},{0,107,2,"Kim Cang Ph鬰 Ma T﹎ Ph竝"},{0,107,5,"V? Tr莕 M藅 t辌h"},{0,107,6,"V? Tr莕 T﹎ Ph竝"},{0,107,3,"Ti襪 Long M藅 t辌h"},{0,107,4,"Ti襪 Long T﹎ Ph竝"},{0,107,7,"Thi猲 La M藅 T辌h"},{0,107,8,"Thi猲 La T﹎ Ph竝"},{0,107,9,"Nh? ? M藅 T辌h"},{0,107,10,"Nh? ? T﹎ Ph竝"},{0,107,11,"B輈h H秈 Ph?"},{0,107,12,"B輈h H秈 T﹎ Ph竝"},{0,107,13,"H鏽 чn M藅 t辌h"},{0,107,14,"H鏽 чn T﹎ Ph竝"},{0,107,15,"Qu? Thi猲 M藅 t辌h"},{0,107,16,"Qu? Thi猲 T﹎ Ph竝"},{0,107,17,"Huy襫 秐h M藅 t辌h"},{0,107,18,"Huy襫 秐h T﹎ Ph竝"},{0,107,19,"Qu﹏ T? M藅 t辌h"},{0,107,20,"Qu﹏ T? T﹎ Ph竝"},{0,107,21,"Tr蕁 Qu﹏ M藅 t辌h"},{0,107,22,"Tr蕁 Qu﹏ T﹎ Ph竝"},{0,107,23,"Xuy猲 V﹏ M藅 t辌h"},{0,107,24,"Xuy猲 V﹏ T﹎ Ph竝"},{0,107,25,"U Minh Qu? L鬰"},{0,107,26,"U Minh T﹎ Ph竝"},{0,107,27,"Linh C? M藅 t辌h"},{0,107,28,"Linh C? T﹎ Ph竝"}},
	[1] = {{0,107,1,"Kim Cang Ph鬰 Ma kinh"},{0,107,2,"Kim Cang Ph鬰 Ma T﹎ Ph竝"},{0,107,5,"V? Tr莕 M藅 t辌h"},{0,107,6,"V? Tr莕 T﹎ Ph竝"},{0,107,3,"Ti襪 Long M藅 t辌h"},{0,107,4,"Ti襪 Long T﹎ Ph竝"}},
	[2] = {{0,107,1,"Kim Cang Ph鬰 Ma kinh"},{0,107,2,"Kim Cang Ph鬰 Ma T﹎ Ph竝"}},	--少俗
	[3] = {{0,107,5,"V? Tr莕 M藅 t辌h"},{0,107,6,"V? Tr莕 T﹎ Ph竝"}},	--禅僧
	[4] = {{0,107,3,"Ti襪 Long M藅 t辌h"},{0,107,4,"Ti襪 Long T﹎ Ph竝"}},	--武僧
	[5] = {{0,107,7,"Thi猲 La M藅 T辌h"},{0,107,8,"Thi猲 La T﹎ Ph竝"}},
	[6] = {{0,107,7,"Thi猲 La M藅 T辌h"},{0,107,8,"Thi猲 La T﹎ Ph竝"}},	--唐门
	[7] = {{0,107,9,"Nh? ? M藅 T辌h"},{0,107,10,"Nh? ? T﹎ Ph竝"},{0,107,11,"B輈h H秈 Ph?"},{0,107,12,"B輈h H秈 T﹎ Ph竝"}},
	[8] = {{0,107,9,"Nh? ? M藅 T辌h"},{0,107,10,"Nh? ? T﹎ Ph竝"}},	--FMM
	[9] = {{0,107,11,"B輈h H秈 Ph?"},{0,107,12,"B輈h H秈 T﹎ Ph竝"}},	--QMM
	[10] = {{0,107,13,"H鏽 чn M藅 t辌h"},{0,107,14,"H鏽 чn T﹎ Ph竝"},{0,107,15,"Qu? Thi猲 M藅 t辌h"},{0,107,16,"Qu? Thi猲 T﹎ Ph竝"}},
	[11] = {{0,107,13,"H鏽 чn M藅 t辌h"},{0,107,14,"H鏽 чn T﹎ Ph竝"}},	--净衣
	[12] = {{0,107,15,"Qu? Thi猲 M藅 t辌h"},{0,107,16,"Qu? Thi猲 T﹎ Ph竝"}},	--污衣
	[13] = {{0,107,17,"Huy襫 秐h M藅 t辌h"},{0,107,18,"Huy襫 秐h T﹎ Ph竝"},{0,107,19,"Qu﹏ T? M藅 t辌h"},{0,107,20,"Qu﹏ T? T﹎ Ph竝"}},
	[14] = {{0,107,17,"Huy襫 秐h M藅 t辌h"},{0,107,18,"Huy襫 秐h T﹎ Ph竝"}},	--武道
	[15] = {{0,107,19,"Qu﹏ T? M藅 t辌h"},{0,107,20,"Qu﹏ T? T﹎ Ph竝"}},	--武俗
	[16] = {{0,107,21,"Tr蕁 Qu﹏ M藅 t辌h"},{0,107,22,"Tr蕁 Qu﹏ T﹎ Ph竝"},{0,107,23,"Xuy猲 V﹏ M藅 t辌h"},{0,107,24,"Xuy猲 V﹏ T﹎ Ph竝"}},
	[17] = {{0,107,21,"Tr蕁 Qu﹏ M藅 t辌h"},{0,107,22,"Tr蕁 Qu﹏ T﹎ Ph竝"}},	--杨枪
	[18] = {{0,107,23,"Xuy猲 V﹏ M藅 t辌h"},{0,107,24,"Xuy猲 V﹏ T﹎ Ph竝"}},	--杨弓
	[19] = {{0,107,25,"U Minh Qu? L鬰"},{0,107,26,"U Minh T﹎ Ph竝"},{0,107,27,"Linh C? M藅 t辌h"},{0,107,28,"Linh C? T﹎ Ph竝"}},
	[20] = {{0,107,25,"U Minh Qu? L鬰"},{0,107,26,"U Minh T﹎ Ph竝"}},	--邪侠
	[21] = {{0,107,27,"Linh C? M藅 t辌h"},{0,107,28,"Linh C? T﹎ Ph竝"}},--蛊师
}
--给师门秘籍，参数１表示路线
--参数２表示给的类型，０表示随机给，１表示给秘籍，２表示给心法
--参数３表示数量
--added by yanjun 2007-06-12
function fe_AddFactionBook(nRoute,nType,nCount)
	if nType == nil then
		nType = 0;
	end;
	if nCount == nil then
		nCount = 1;
	end;
	local nTbSize = getn(Tb_Book[nRoute]);
	local nRand = random(1,nTbSize);
	local nBookIdx = 0;
	local szBookName = 0;
	local nRetCode = 0;
	if nType == 0 then
		nBookIdx = nRand;
		szBookName = Tb_Book[nRoute][nBookIdx][4];
		nRetCode = AddItem(Tb_Book[nRoute][nBookIdx][1],Tb_Book[nRoute][nBookIdx][2],Tb_Book[nRoute][nBookIdx][3],nCount);
	else
		nBookIdx = floor((nRand-1)/2)*2+nType;
		szBookName = Tb_Book[nRoute][nBookIdx][4];
		nRetCode = AddItem(Tb_Book[nRoute][nBookIdx][1],Tb_Book[nRoute][nBookIdx][2],Tb_Book[nRoute][nBookIdx][3],nCount);
	end;
	if nRetCode == 1 then
		WriteLog("[feM藅 T辌h S? m玭]:"..GetName().."Nh薾 頲"..nCount.." (quy觧) M藅 T辌h S? m玭:"..szBookName);
	else
		WriteLog("[fe M藅 T辌h S? m玭 b? l鏸]:"..GetName().."Nh薾 頲"..nCount.." (quy觧) M藅 T辌h S? m玭:"..szBookName.."AddItem b竜 l鏸, RetCode:"..RetCode);
	end;
	return szBookName;
end;
--=========================================================================================
Tb_BFYWeapon = 	--步非烟武器
{
	[0]  = {{"Ph? Y猲 產o",0,3,6001},{"Ph? Y猲 c玭",0,5,6002},{"Ph? Y猲 trng",0,8,6003},{"H祄 Y猲 th?",0,0,6004},{"T祅g Y猲 ch﹎",0,1,6005},{"Phi Y猲 ki誱",0,2,6006},{"V薾 Y猲 c莔",0,10,6007},{"V﹏ Y猲 th?",0,0,6008},{"L璾 Y猲 c玭",0,5,6009},{"Huy襫 Y猲 ki誱",0,2,6010},{"V? Y猲 b髏",0,9,6011},{"H? Ti猰 Thng",0,6,6012},{"H祅h Y猲 Cung",0,4,6013},{"Tr鋍 Y猲 nh蒼",0,7,6014},{"Y猽 Y猲 tr秓",0,11,6015}},
	[1]  = {{"Ph? Y猲 產o",0,3,6001},{"Ph? Y猲 c玭",0,5,6002},{"Ph? Y猲 trng",0,8,6003},{"H祄 Y猲 th?",0,0,6004}},
	[2]  = {{"Ph? Y猲 產o",0,3,6001},{"Ph? Y猲 c玭",0,5,6002}},
	[3]  = {{"Ph? Y猲 trng",0,8,6003}},
	[4]  = {{"H祄 Y猲 th?",0,0,6004}},
	[5]  = {{"T祅g Y猲 ch﹎",0,1,6005}},
	[6]  = {{"T祅g Y猲 ch﹎",0,1,6005}},
	[7]  = {{"Phi Y猲 ki誱",0,2,6006},{"V薾 Y猲 C莔 ^",0,10,6007}},
	[8]  = {{"Phi Y猲 ki誱",0,2,6006}},
	[9]  = {{"V薾 Y猲 C莔 ^",0,10,6007}},
	[10] = {{"V﹏ Y猲 th?",0,0,6008},{"L璾 Y猲 c玭",0,5,6009}},
	[11] = {{"V﹏ Y猲 th?",0,0,6008}},
	[12] = {{"L璾 Y猲 c玭",0,5,6009}},
	[13] = {{"Huy襫 Y猲 ki誱",0,2,6010},{"V? Y猲 b髏",0,9,6011}},
	[14] = {{"Huy襫 Y猲 ki誱",0,2,6010}},
	[15] = {{"V? Y猲 b髏",0,9,6011}},
	[16] = {{"H? Ti猰 Thng",0,6,6012},{"H祅h y猲 Cung",0,4,6013}},
	[17] = {{"H? Ti猰 Thng",0,6,6012}},
	[18] = {{"H祅h y猲 Cung",0,4,6013}},
	[19] = {{"Tr鋍 Y猲 nh蒼",0,7,6014},{"Y猽 Y猲 tr秓",0,11,6015}},
	[20] = {{"Tr鋍 Y猲 nh蒼",0,7,6014}},
	[21] = {{"Y猽 Y猲 tr秓",0,11,6015}},
}
--参数１是路线
--参数２是数量
function fe_AddBFYWeapon(nRoute,nCount)
	if nCount == nil then
		nCount = 1;
	end;
	local nWeaponIdx = random(1,getn(Tb_BFYWeapon[nRoute]));
	local szName = Tb_BFYWeapon[nRoute][nWeaponIdx][1];
	local nID1 = Tb_BFYWeapon[nRoute][nWeaponIdx][2];
	local nID2 = Tb_BFYWeapon[nRoute][nWeaponIdx][3];
	local nID3 = Tb_BFYWeapon[nRoute][nWeaponIdx][4];
	local nRetCode = AddItem(nID1,nID2,nID3,nCount,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		WriteLog("[fe B? Phi Y猲_ v? kh輂:"..GetName().."Nh薾 頲"..szName);
	else
		WriteLog("[fe B? Phi Y猲_v? kh? b? l鏸]:"..GetName().."Nh薾 頲"..szName.."AddItem b竜 l鏸, RetCode:"..RetCode);
	end;
	return szName;
end;
--第4,5套师门装备名字
fe_tbFactionEquipExName = 
{
	[0] = {},
	[1] = {},	
	[2] = 
		{	--少林俗家
			[4] = {"B竧 B? Thi猲 Long u Kh玦","Thi猲 Long B竧 B? Kh秈 Gi竝","B竧 B? Thi猲 Long Trang","B竧 B? Thi猲 Long Ban Ch?","B竧 B? Thi猲 Long Ng鋍 Gi韎","B竧 B? Thi猲 Long Thi猲 Ch髇g C玭 (o)"},
			[5] = {"Чt Ma Th? To? д Th輈h uKh玦","Чt Ma Th? To? д Th輈h Kh秈 Gi竝 ","Чt Ma Th? To? д Th輈h Trang","Чt Ma Th? To? д Th輈h Ban Ch?","Чt Ma Th? To? д Th輈h Ng鋍 Gi韎","Чt Ma Th? To? д Th輈h C玭 (o)"},
		},
	[3] = 
		{	--少林禅僧
			[4] = {"V? Lng Ph竝 T玭 Thi襫 мnhM穙","V? Lng Ph竝 T玭 Thi襫 мnh B祇","V? Lng Ph竝 T玭 Trang","V? Lng Ph竝 T玭  Ban Ch?","V? Lng Ph竝 T玭  Ng鋍 Gi韎","V? Lng Ph竝 T玭 Thi襫 Trng"},
			[5] = {"T祅g Kinh Th? To? Huy襫 T辬h M穙","T祅g Kinh Th? To? Huy襫 T躰h B祇","T祅g Kinh Th? To? Huy襫 T辬h Trang","T祅g Kinh Th? To? Ban Ch?","T祅g Kinh Th? To? Ng鋍 Gi韎","T祅g Kinh Th? To? Huy襫 Trng"},
		},
	[4] = 
		{	--少林武僧
			[4] = {"B竧 B秓 La H竛 Чi Th鮝 uKh玦","B竧 B秓 La H竛 Чi Th鮝 Kh秈 Gi竝 ","B竧 B秓 La H竛 Чi Th鮝 Trang","B竧 B秓 La H竛 Чi Th鮝 Ban Ch?","B竧 B秓 La H竛 Чi Th鮝 Ng鋍 Gi韎","B竧 B秓 La H竛 Чi Th鮝 Th?"},
			[5] = {"La H竛 Th? To? u Kh玦","La H竛 th? T鋋 Ch輓h Gi竎 Kh秈 Gi竝 ","La H竛 Th? To? Ch輓h Gi竎 Trang","La H竛 Th? To? Ch輓h Gi竎 Ban Ch?","La H竛 Th? To? Ch輓h Gi竎 Ng鋍 Gi韎","La H竛 Th? To? Ch輓h Gi竎 Th?"},
		},
	[5] = {},			--唐门
	[6] = 
		{	--唐门
			[4] = {"Thi猲 C? S? Gi? Th莕 Tri謚 C﹏","Thi猲 C? S? Gi? Th莕 Tri謚 Ph鬰","Thi猲 C? S? Gi? Th莕 Tri謚 Trang","Thi猲 C? S? Gi? Th莕 Tri謚 B閕","Thi猲 C? S? Gi? Th莕 Tri謚 Ho祅","Thi猲 C? S? Gi? Th莕 Tri謚 Ch﹎"},
			[5] = {"Thi猲 Th? Th莕 V? Ti襪 萵 C﹏","Thi猲 Th? Th莕 V? Ti襪 萵 Ph鬰","Thi猲 Th? Th莕 V? Ti襪 萵 Trang","Thi猲 Th? Th莕 V? Ti襪 萵 B閕","Thi猲 Th? Th莕 V? Ti襪 萵 Ho祅","Thi猲 Th? Th莕 V? Ti襪 萵 Ch﹎"},
		},
	[7] = {},			--峨嵋
	[8] = 
		{	--峨嵋佛家
			[4] = {"B筩h Li猲 Ti猲 T? B秓 U萵 K?","B筩h Li猲 Ti猲 T? B秓 萵 Y","B筩h Li猲 Ti猲 T? B秓 U萵 Trang","B筩h Li猲 Ti猲 T? Ng鋍 Gi韎","B筩h Li猲 Ti猲 T? Gi韎 Ch?","B筩h Li猲 Ti猲 T? B秓 U萵 Ki誱"},
			[5] = {"Kim Quang Th竛h N? Ph藅 L? K?","Kim Quang Th竛h N? Ph藅 L? Y","Kim Quang Th竛h N? Ph藅 L? Trang","Kim Quang Th竛h N? Ph藅 L? Gi韎","Kim Quang Th竛h N? Ph藅 L? Ch?","Kim Quang Th竛h N? Ph藅 L? Ki誱"},
		},
	[9] = 
		{	--峨嵋俗家
			[4] = {"Ng鋍 V薾 Ti猲 T? Huy襫 H錸 K?","Ng鋍 V薾 Ti猲 T? Huy襫 H錸 Y","Ng鋍 V薾 Ti猲 T? Huy襫 H錸 Trang","Ng鋍 V薾 Ti猲 T? Ng鋍 Gi韎","Ng鋍 V薾 Ti猲 T? Gi韎 Ch?","Ng鋍 V薾 Ti猲 T? Huy襫 H錸 C莔"},
			[5] = {"Thi猲  Th竛h N? Ph藅 V薾 K?","Thi猲  Th竛h N? Ph藅 V薾 Y","Thi猲  Th竛h N? Ph藅 V薾 Trang","Thi猲  Th竛h N? Ph藅 V薾 Gi韎","Thi猲  Th竛h N? Ph藅 V薾 Ch?","Thi猲  Th竛h N? Ph藅 V薾 C莔"},
		},
	[10] = {},			--丐帮
	[11] = 
		{	--丐帮净衣
			[4] = {"Long u Th莕 C竔 Щng V﹏ C﹏","Long u Th莕 C竔 Щng V﹏ Ph鬰","Long u Th莕 C竔 Щng V﹏ Trang","Long u Th莕 C竔 Щng V﹏ B閕","Long u Th莕 C竔 Щng V﹏ Gi韎","Long u Th莕 C竔 Щng V﹏ Th?"},
			[5] = {"Ch蕄 Ph竝 Ph? T玭 C﹏","Ch蕄 Ph竝 Ph? T玭 Y","Ch蕄 Ph竝 Ph? T玭 Trang","Ch蕄 Ph竝 Ph? T玭 B閕","Ch蕄 Ph竝 Ph? T玭 Gi韎","Ch蕄 Ph竝 Ph? T玭 Th?"},
		},
	[12] = 
		{	--丐帮污衣
			[4] = {"Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C﹏","Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Y","Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Trang","Kh蕋 Thi猲 Th莕 C竔 V﹏ Du B閕","Kh蕋 Thi猲 Th莕 C竔 V﹏ Du Gi韎","Kh蕋 Thi猲 Th莕 C竔 V﹏ Du C玭"},
			[5] = {"Chng B鎛g Long Ch髇g C﹏","Chng B鎛g Long Ch髇g Y","Chng B鎛g Long Ch髇g Trang","Chng B鎛g Long Ch髇g B閕","Chng B鎛g Long Ch髇g Gi韎","Chng B鎛g Long Ch髇g C玭"},
		},
	[13] = {},			--武当
	[14] = 
		{	--武当道家
			[4] = {"Chng Kinh Thanh Quang C﹏","Chng Kinh Thanh Quang B祇","Chng Kinh Чo Nh﹏ Thanh Quang Ph竝 Trang","Chng Kinh Thanh Quang Gi韎","Chng Kinh Thanh Quang Ho祅","Chng Kinh Thanh Quang Ki誱"},
			[5] = {"Thng Thanh Th莕 Kh玭g C﹏","Thng Thanh Th莕 Kh玭g B祇","Thng Thanh Ch﹏ Nh﹏ Th莕 Kh玭g Ph竝 Trang","Thng Thanh Th莕 Kh玭g Gi韎","Thng Thanh Th莕 Kh玭g Ho祅","Thng Thanh Th莕 Kh玭g Ki誱"},
		},
	[15] = 
		{	--武当俗家
			[4] = {"Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 C﹏","Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ph鬰","Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Trang","Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Gi韎","Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 Ho祅","Th竔 蕋 T秐 Nh﹏ H筼 Nhi猲 B髏"},
			[5] = {"T? Ti猽 Ng? Kh玭g C﹏","T? Ti猽 Ng? Kh玭g Ph鬰","T? Ti猽 Ng? Kh玭g Trang","T? Ti猽 Ng? Kh玭g Gi韎","T? Ti猽 Ng? Kh玭g Ho祅","T? Ti猽 Ng? Kh玭g B髏"},
		},
	[16] = {},			--杨门
	[17] = 
		{	--杨门枪骑
			[4] = {"Long Tng Tng Qu﹏ Kh玦","Long Tng Ngao Kh? Chi課 kh秈","Long Tng Tng Qu﹏ Ng筼 Kh? Chi課 Trang","Long Tng Tng Qu﹏ H? Ph?","Long Tng Tng Qu﹏ L謓h K?","Long Tng Tng Qu﹏ Thng"},
			[5] = {"Tr蕁 Qu﹏ V? Song Chi課 Kh玦","Tr蕁 Qu﹏ V? Song Chi課 kh秈","Tr蕁 Qu﹏ Nguy猲 So竔 V? Song Chi課 Trang","Tr蕁 Qu﹏ V? Song H? Ph?","Tr蕁 Qu﹏ V? Song L謓h K?","Tr蕁 Qu﹏ V? Song Thng"},
		},
	[18] = 
		{	--杨门弓骑
			[4] = {"H? D鵦 Tng Qu﹏  Chi課 Kh玦","H? D鵦 M穘h S? Chi課 kh秈","H? D鵦 Tng Qu﹏ M穘h S? Chi課 Trang","H? D鵦 Tng Qu﹏ H? Ph?","H? D鵦 Tng Qu﹏ L謓h K?","H? D鵦 Tng Qu﹏ Cung"},
			[5] = {"Chinh L? B? Gi? Chi課 Kh玦","Chinh L? B? Gi? Chi課 kh秈","Chinh L? Nguy猲 So竔 B? Gi? Chi課 Trang","Chinh L? B? Gi? H? Ph?","Chinh L? B? Gi? L謓h K?","Chinh L? B? Gi? Cung"},
		},
	[19] = {},			--五毒
	[20] = 
		{	--五毒邪侠
			[4] = {"U Minh Qu? S竧 Tu La C﹏","U Minh Qu? S竧 Tu La Y","U Minh Qu? S竧 Tu La Trang","U Minh Qu? S竧 Tu La Huy誸 Gi韎","U Minh Qu? S竧 Tu La H綾 Gi韎","U Minh Qu? S竧 Tu La Nh蒼"},
			[5] = {"Di猰 La T玭 Gi? Ma H錸 C﹏","Di猰 La T玭 Gi? Ma H錸 Y","Di猰 La T玭 Gi? Ma H錸 Trang","Di猰 La T玭 Gi? Ma H錸 Huy誸 Gi韎","Di猰 La T玭 Gi? Ma H錸 H綾 Gi韎","Di猰 La T玭 Gi? Ma H錸 Nh蒼"},
		},
	[21] = 
		{	--五毒蛊师
			[4] = {"V? чng La S竧 Tr蕀 Huy誸 C﹏","V? чng La S竧 Tr蕀 Huy誸 Y","V? чng La S竧 Tr蕀 Huy誸 Trang","V? чng La S竧 Tr蕀 Huy誸 Gi韎","V? чng La S竧 Tr蕀 Huy誸 H綾 Gi韎","V? чng La S竧 Tr蕀 Huy誸 Tr秓"},
			[5] = {"C? чc T玭 Gi? Ph? Thi猲 C﹏","C? чc T玭 Gi? Ph? Thi猲 Y","C? чc T玭 Gi? Ph? Thi猲 Trang","C? чc T玭 Gi? Ph? Thi猲 Huy誸 Gi韎","C? чc T玭 Gi? Ph? Thi猲 H綾 Gi韎","C? чc T玭 Gi? Ph? Thi猲 Tr秓"},
		},
}
--给第4第5套师门装备
--nRoute：路线
--nBody：体形
--nGeneration：指明为第几套
--nType：1为头，2为衣服，3为裤子，4为首饰1，5为首饰2，6为武器
--nSpecFlag：专为少林俗家留的特殊标记。0为给刀和棍，1给棍，2给刀
function fe_AddFactionEquipmentEx(nRoute,nBody,nGeneration,nType,nSpecFlag)
	nSpecFlag = nSpecFlag or 0;
	local nID2,nID3 = 0,0;
	local szName = fe_tbFactionEquipExName[nRoute][nGeneration][nType];
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nGeneration-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nGeneration-1)*10+nBody;
	end;
	if nType == 1 then
		nRetCode = AddItem(0,103,nID3,1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 2 then
		nRetCode = AddItem(0,100,nID3,1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 3 then
		nRetCode = AddItem(0,101,nID3,1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 4 then
		nRetCode = AddItem(0,102,nID3,1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 5 then
		nID3 = nID3 + 4;
		nRetCode = AddItem(0,102,nID3,1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 6 then
		if nRoute == 2 then	--该死的少林俗家
			if nSpecFlag == 0 or nSpecFlag == 1 then
				nRetCode = AddItem(0,5,nID3,1,1,-1,-1,-1,-1,-1,-1);
			end;
			if nSpecFlag == 0 or nSpecFlag == 2 then
				nRetCode = AddItem(0,3,nID3,1,1,-1,-1,-1,-1,-1,-1);
			end;
		else
			nID2 = tbWeaponID2[nRoute];
			if nID2 ~= nil then
				nRetCode = AddItem(0,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
			end;
		end;
	end;
	if nRetCode == 1 then
		WriteLog("[feTrang b? s? m玭]:"..GetName().."Nh薾 頲"..szName..".nSpecFlag:"..nSpecFlag);
	else
		WriteLog("[feTrang b? s? m玭]:"..GetName().."Nh薾 頲"..szName.."AddItem x秠 ra l鏸, nSpecFlag:"..nSpecFlag..",RetCode:"..RetCode);
	end;
end;
