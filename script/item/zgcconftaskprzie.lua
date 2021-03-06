--奖励装备属性配置
--注意：此处填写尽量只新增不修改，因为玩家可能已经存在了该属性的装备。
--说明，1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4-9（1-3的魔法属性和等级）10：五行（），11：名字
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
prize_att = {}
for i = 1,7 do
	prize_att[i] = {}
end
prize_att[1] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10, 	4,	357,	4,	358,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10, 	4,	357,	4,	361,	4,	0, 	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	5,  	4,	357,	4,	358,	4,	0,  0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,  	4,	357,	4,	361,	4,	0,  0,	0,	"Long Di猲 Hng Nang (n?)"},
	{100,	14, 	4,	333,	4,	340,	5,	341,5,	0,	"X輈h Long B祇 (nam ti猽 chu萵)"},
	{100,	32, 	4,	333,	4,	340,	5,	341,5,	0,	"L玦 Ng﹏ Gi竝 (nam kh玦 ng?)"},
	{100,	50, 	4,	333,	4,	340,	5,	341,5,	0,	"H? C? V? Y (n? g頸 c秏)"},
	{100,	68, 	4,	333,	4,	340,	5,	341,5,	0,	"Th竔 Hoa Thng (Ki襲 n?)"},
	{0,  	12, 	4,	333,	4,	65, 	6,	43,	7,	0,	"Ng? Phng Qu? Ch髇g (bao tay)"},
	{1,  	51, 	4,	333,	4,	65, 	6,	43,	7,	0,	"Th蕋 S竧 Thi猲 La (竚 kh?)"},
	{4,  	117,	4,	333,	4,	65, 	6,	43,	7,	0,	"Xi Nha (cung)"},
}
prize_att[2] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	360,	4,	361,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10,		4,	358,	4,	361,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	5,		4,	357,	4,	358,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,		4,	357,	4,	361,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{101,	14,		4,	333,	4,	340,	5,	341,5,	0,	"Phi Ng? Trang (nam ti猽 chu萵)"},
	{101,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Thi猲 L玦 Trang (nam kh玦 ng?)"},
	{101,	50,		4,	333,	4,	340,	5,	341,5,	0,	"Thi猲 M? (n? g頸 c秏)"},
	{101,	68,		4,	333,	4,	340,	5,	341,5,	0,	"Th莕 N? (Ki襲 n?)"},
	{0,		12,		4,	333,	4,	67,		6,	43,	7,	0,	"Ng? Phng Qu? Ch髇g (bao tay)"},
	{3,		62,		4,	333,	4,	65,		6,	43,	7,	0,	"Thi猲 S竧 (產o)"},
	{11,	10,		4,	333,	4,	65,		6,	43,	7,	0,	"Ng璶g Sng (tr秓)"},
}
prize_att[3] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	358,	4,	359,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10,		4,	358,	4,	360,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10,		4,	357,	4,	359,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	5,		4,	358,	4,	359,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,		4,	358,	4,	360,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,		4,	357,	4,	359,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{103,	14,		4,	333,	4,	340,	5,	341,5,	0,	"X輈h Thanh Nh穘 Tr竜 (nam ti猽 chu萵)"},
	{103,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Ng? Qu? u C﹏ (nam kh玦 ng?)"},
	{103,	50,		4,	333,	4,	340,	5,	341,5,	0,	"箃 H錸 (n? g頸 c秏)"},
	{103,	68,		4,	333,	4,	340,	5,	341,5,	0,	"Thi猲 Nga (Ki襲 n?)"},
	{5,		38,		4,	333,	4,	65,		6,	43,	7,	0,	"Thi猲 X? c玭 (c玭)"},
	{10,	73,		4,	333,	4,	67,		6,	43,	7,	0,	"L鬰 Kh雐 (c莔)"},
	{9,		84,		4,	333,	4,	65,		6,	43,	7,	0,	"Ph? Qu﹏ (b髏)"},
}
prize_att[4] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	359,	4,	360,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10,		4,	359,	4,	361,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	10,		4,	357,	4,	360,	4,	0,	0,	0,	"M苩 Ng鋍 Ng鋍 B閕 (nam)"},
	{102,	5,		4,	359,	4,	360,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,		4,	359,	4,	361,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	5,		4,	357,	4,	360,	4,	0,	0,	0,	"Long Di猲 Hng Nang (n?)"},
	{102,	8,		4,	333,	4,	340,	5,	341,5,	0,	"Уo Hoa Ng鋍 B閕 (nam)"},
	{102,	3,		4,	333,	4,	340,	5,	341,5,	0,	"Tr莔 Уn Hng Nang (n?)"},
	{2,		25,		4,	333,	4,	67,		6,	43,	7,	0,	"B輈h Huy誸 (ki誱)"},
	{8,		95,		4,	333,	4,	67,		6,	43,	7,	0,	"Чi B竧 Nh? trng (trng)"},
	{6,		106,	4,	333,	4,	65,		6,	43,	7,	0,	"Trng B竧 X? m﹗ (thng)"},
	{7,		10,		4,	333,	4,	65,		6,	43,	7,	0,	"T玦 Nguy謙 (song 產o)"},
}
--二等装备:1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4、几项属性，5、名字
prize_att[5] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thi猲 Gi竛g B祇 (nam ti猽 chu萵)"},
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thi猲 Gi竛g B祇 (nam ti猽 chu萵)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B? ? kim Y (nam kh玦 ng?)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B? ? kim Y (nam kh玦 ng?)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thi猲 Th竔 Thng (n? g頸 c秏)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thi猲 Th竔 Thng (n? g頸 c秏)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ng? Th竔 Ngh? Thng (Ki襲 n?)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ng? Th竔 Ngh? Thng (Ki襲 n?)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"? T祄 Trang (nam ti猽 chu萵)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"? T祄 Trang (nam ti猽 chu萵)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"? T祄 Trang (nam ti猽 chu萵)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi猲 Canh Trang (nam kh玦 ng?)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi猲 Canh Trang (nam kh玦 ng?)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi猲 Canh Trang (nam kh玦 ng?)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th竔 Thanh (n? g頸 c秏)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th竔 Thanh (n? g頸 c秏)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th竔 Thanh (n? g頸 c秏)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu蕋 V﹏ (Ki襲 n?)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu蕋 V﹏ (Ki襲 n?)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Xu蕋 V﹏ (Ki襲 n?)"},
	{103,	18,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"B? Th莕 Qu竛 (nam ti猽 chu萵)"},
	{103,	36,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Di Th莕 u C﹏ (nam kh玦 ng?)"},
	{103,	54,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Chu Tc (n? g頸 c秏)"},
	{103,	72,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Trng Sinh (Ki襲 n?)"},
}
prize_att[6] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S琻 Qu? Huy誸 y (nam ti猽 chu萵)"},
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S琻 Qu? Huy誸 y (nam ti猽 chu萵)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy誸 H? Qu? Vng Kh秈 (nam kh玦 ng?)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy誸 H? Qu? Vng Kh秈 (nam kh玦 ng?)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi猲 Y (n? g頸 c秏)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thi猲 Y (n? g頸 c秏)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V? Song u y (Ki襲 n?)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V? Song u y (Ki襲 n?)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S竧 Ki誴 Trang (nam ti猽 chu萵)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S竧 Ki誴 Trang (nam ti猽 chu萵)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S竧 Ki誴 Trang (nam ti猽 chu萵)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy誸 H? Trang (nam kh玦 ng?)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy誸 H? Trang (nam kh玦 ng?)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Huy誸 H? Trang (nam kh玦 ng?)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H? Ti誹 (n? g頸 c秏)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H? Ti誹 (n? g頸 c秏)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H? Ti誹 (n? g頸 c秏)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H錸g Ng鋍 (Ki襲 n?)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H錸g Ng鋍 (Ki襲 n?)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"H錸g Ng鋍 (Ki襲 n?)"},
	{103,	17,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"M苩 n? S琻 Qu? (nam ti猽 chu萵)"},
	{103,	35,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"M苩 n? Chung Qu?"},
	{103,	53,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Tu La (n? g頸 c秏)"},
	{103,	71,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Vu H祄 (Ki襲 n?)"},
}
--黄金装备：需要填入1：副类（装备大类都为0省略），2：小类，3是否鉴定：( 数量都为1省略；0未鉴定 ，1已鉴定， 2拾取绑定 ，3装备绑定， 4已经绑定)，4：名称，5：属性。
prize_att[7] = {
{3,		6001,	1,	0,	"Ph? Y猲 產o"},
{5,		6002,	1,	0,	"Ph? Y猲 c玭"},
{0,		6004,	1,	0,	"H祄 Y猲 th?"},
{8,		6003,	1,	0,	"Ph? Y猲 trng"},
{1,		6005,	1,	0,	"T祅g Y猲 ch﹎"},
{2,		6006,	1,	0,	"Phi Y猲 ki誱"},
{10,	6007,	1,	0,	"V薾 Y猲 c莔"},
{0,		6008,	1,	0,	"V﹏ Y猲 th?"},
{5,		6009,	1,	0,	"L璾 Y猲 c玭"},
{2,		6010,	1,	0,	"Huy襫 Y猲 ki誱"},
{9,		6011,	1,	0,	"V? Y猲 b髏"},
{6,		6012,	1,	0,	"H? Ti猰 Thng"},
{4,		6013,	1,	0,	"H祅h Y猲 Cung"},
{7,		6014,	1,	0,	"Tr鋍 Y猲 nh蒼"},
{11,	6015,	1,	0,	"Y猽 Y猲 tr秓"},
}
--装备属性对应解释
prize_att_string = {
	"Th? l鵦 +",
	"Ph秐 n",
	"Ph筸 vi t蕁 c玭g 竚 kh? +",
	"H髏 n閕 mi詎 d辌h",
	"H髏 huy誸 mi詎 d辌h",
	"T? l? t蕁 c玭g nh蕋 nh",
	"T? l? t蕁 c玭g d葃 l飅 i phng",
	"Kh鑞g ch? i phng ph鬰 h錳 m竨",
	"T? l? m礽 m遪 v? kh? gi秏",
	"M鏸 10 gi﹜ 竚 kh? t╪g",
	"Sinh l鵦 +",
	"N閕 l鵦 +",
	"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",
	"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",
	"H駓 mi詎 d辌h c馻 i phng",
	"10 gi﹜ sinh l鵦 gi秏, ngo筰 c玭g t╪g",
	" 10 gi﹜ n閕 l鵦 gi秏, n閕 c玭g t╪g ",
	"Ngo筰 ph遪g gi秏, ngo筰 k輈h t╪g",
	"N閕 ph遪g gi秏, N閕 c玭g t╪g",
	"H? g鬰 i phng n閕 l鵦 h錳 ph鬰 ",
	"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",
	"S竧 thng 竚 kh? gi秏",
	"Ch輓h x竎 t╪g",
	"T鑓  thi tri觧 v? c玭g t╪g",
	"Sau khi tr飊g sinh n閕 thng gi秏 nh?",
	"Sau khi tr飊g sinh ngo筰 thng gi秏 nh?",
	"T? l? xu蕋 chi猽 t╪g",
	"V? c玭g hao n閕 gi秏",
	"Khi課 i phng gi秏 t鑓",
	"T? l? nh蕋 nh t蕁 c玭g m筺h nh蕋",
	"H? g鬰 i phng s鴆 m筺h t╪g ",
	"H? g鬰 i phng g﹏ c鑤 t╪g",
	"H? g鬰 i phng th﹏ ph竝 t╪g ",
	"H? g鬰 i phng Linh ho箃 t╪g",
	"H? g鬰 i phng n閕 c玭g t╪g ",
	"H? g鬰 i phng ch輓h x竎 t╪g ",
	"H? g鬰 i phng n? tr竛h t╪g ",
	"H? g鬰 i phng ch? m筺g t╪g",
	"Dc hi謚 k衞 d礽",
	"T? l? nh蕋 nh gi秏 mi詎 d辌h",
	"H? tr? t蕁 c玭g  duy tr? ",
	"H? tr? ph遪g th? duy tr? ",
	"600 gi﹜  b襫 v? kh? h錳 ph鬰",
	"N閕 ph遪g t╪g ",
	"Ph遪g th? ngo筰 c玭g t╪g",
	"Chuy觧 h鉧 s竧 thng th祅h n閕 l鵦",
	"V韎 thu閏 t輓h ﹎ s竧 thng t╪g",
	"V韎 thu閏 t輓h ﹎ ch輓h x竎 t╪g",
	"T蕁 c玭g l祄 i phng hao t鎛 n閕 l鵦",
	"Ph? ph遪g th? i phng",
	"H髏 n閕 l鵦",
	"H髏 sinh l鵦",
	"T? l? nh蕋 nh l祄 i phng kh? huy誸 hao t鎛",
	"T? l? nh蕋 nh l祄 i phng ch﹏ nguy猲 hao t鎛",
	"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",
	"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",
	"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",
	"Khi課 i phng gi秏 Linh ho箃 ",
	"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",
	"T? l? nh蕋 nh t蕁 c玭g ph筸 vi",
	"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",
	"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",
	"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",
	"Khi課 i phng gi秏 N閕 ph遪g",
	"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",
	"V? kh? nh ngo筰 th蕄 nh蕋 t╪g ",
	"V? kh? nh n閕 l韓 nh蕋 t╪g",
	"V? kh? nh n閕 th蕄 nh蕋 t╪g ",
	"T蕁 c玭g k蘭 c s竧",
	"L祄 ch薽 i phng m閕 th阨 gian",
	"T? li謙 i phng m閠 th阨 gian",
	"L祄 cho竛g i phng m閠 th阨 gian",
	"мnh th﹏ i phng m閠 th阨 gian",
	"H鏽 lo筺 i phng m閠 th阨 gian",
	"L祄 i phng ng? m閠 th阨 gian",
	"Kh? n╪g nh b筰 i phng",
	"T蕁 c玭g t╪g ",
	"S竧 thng 竚 kh? t╪g",
	"Sinh l鵦 t鑙 產 t╪g",
	"N閕 l鵦 + ",
	"Kh? n╪g y l飅 i phng",
	"чc s竧 gi秏",
	"H? g鬰 i phng n閕 l鵦 h錳 ph鬰 ",
	"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"Ngo筰 ph遪g+",
	"N閕 ph遪g + ",
	"Gi秏 th阨 gian tr髇g thng",
	"L祄 gi秏 n閕- ngo筰 ph遪g c馻 i phng",
	"T鑓  h錳 ph鬰 ngo筰 thng t╪g",
	"T鑓  h錳 ph鬰 n閕 thng t╪g ",
	"T? l? nh ch苙 xu蕋 chi猽 c馻 i phng",
	"G﹏ c鑤 t╪g",
	"S鴆 m筺g t╪g",
	"Th﹏ ph竝 t╪g",
	"Linh ho箃 t╪g",
	"N閕 c玭g t╪g ",
	"Kinh nghi謒 nh薾 頲 t╪g",
	"T? l? nh蕋 nh kh竛g c",
	"Di chuy觧 t╪g",
	"T蕋 c? thu閏 t輓h t╪g",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"T? l? nh蕋 nh tr竛h b蓎",
	"T? l? nh蕋 nh ch辵 n gi秏 n鯽",
	"N? tr竛h + ",
	"y猽 c莡 ng c蕄 gi秏 ",
	"S鴆 l鵦 t╪g",
	"Цnh t藀 trung t╪g",
	"600 gi﹜  b襫 thng y h錳 ph鬰 ",
	"600 gi﹜  b襫 n鉵 h錳 ph鬰 ",
	"600 gi﹜  b襫 h? y h錳 ph鬰 ",
	"Kinh nghi謒 nh薾 頲 t╪g",
	"Ch鑞g gi秏 t鑓  nh t╪g",
	"Ch鑞g gi秏 t鑓 di chuy觧 t╪g",
	"T? l? nh ng? i phng",
	"Цnh ch苙 i phng xu蕋 chi猽",
	"T? kh? t鑙 產 t╪g 1 ?",
	"Mi詎 d辌h nh ng?",
	"T? l? mi詎 d辌h nh lui",
	"T? l? mi詎 d辌h t? li謙",
	"T? l? mi詎 d辌h cho竛g",
	"T? l? mi詎 d辌h nh th﹏",
	"T? l? mi詎 d辌h h鏽 lo筺",
	"T? l? mi詎 d辌h g﹜ ng?",
	"T? l? mi詎 d辌h l祄 ch薽 ",
	"T? l? mi詎 d辌h gi秏 t鑓",
	"N? tr竛h t╪g",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"Ngo筰 k輈h + ",
	"S鴆 l鵦 t╪g",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 t? li謙 i phng",
	"L祄 cho竛g i phng",
	"觤 huy謙 i phng",
	"L祄 h鏽 lo筺 i phng",
	"G﹜ ng?",
	"Kh? n╪g nh b筰 i phng",
	"Kh? n╪g y l飅 i phng",
	"Цnh n閕-kh鉧 v藅 ph萴",
	"Цnh n閕-kh鉧 k? n╪g t蕁 c玭g",
	"Цnh n閕-kh鉧 k? n╪g h? tr?",
	"T? l? nh蕋 nh khi課 i phng ch辵 n閕 thng c蕄 1",
	"T? l? nh蕋 nh khi課 i phng ch辵 ngo筰 thng c蕄 1",
	"T? l? nh蕋 nh khi課 i phng ch辵 n閕 thng c蕄 2",
	"T? l? nh蕋 nh khi課 i phng ch辵 ngo筰 thng c蕄 2",
	"T? l? nh蕋 nh khi課 i phng ch辵 n閕 thng c蕄 3",
	"T? l? nh蕋 nh khi課 i phng ch辵 ngo筰 thng c蕄 3",
	"T? l? nh蕋 nh khi課 i phng ch辵 n閕 thng c蕄 4",
	"T? l? nh蕋 nh khi課 i phng ch辵 ngo筰 thng c蕄 4",
	"T? l? nh蕋 nh khi課 i phng ch辵 n閕 thng c蕄 5",
	"T? l? nh蕋 nh khi課 i phng ch辵 ngo筰 thng c蕄 5",
	"G﹏ c鑤 t╪g",
	"S鴆 m筺g t╪g",
	"Th﹏ ph竝 t╪g",
	"Linh ho箃 t╪g",
	"N閕 c玭g t╪g ",
	"Sinh l鵦 +",
	"T蕁 c玭g k蘭 c s竧",
	"Ph? ph遪g th? i phng",
	"Sinh l鵦 t鑙 產 t╪g",
	"N閕 l鵦 + ",
	"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",
	"V? kh? nh n閕 l韓 nh蕋 t╪g",
	"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",
	"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",
	"чc s竧 t╪g",
	"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"G﹏ c鑤 t╪g",
	"S鴆 m筺g t╪g",
	"Th﹏ ph竝 t╪g",
	"Linh ho箃 t╪g",
	"N閕 c玭g t╪g ",
	"S竧 thng t╪g ",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"Khi課 i phng gi秏 t鑓",
	"L祄 ch薽 i phng",
	"L祄 gi秏 ph遪g th? N閕-ngo筰 c玭g i phng",
	"Gi秏 l鵦 nh i phng",
	"T蕁 c玭g k蘭 c s竧",
	"T鑓  thi tri觧 v? c玭g t╪g",
	"Sinh l鵦 t鑙 產 t╪g",
	"N閕 l鵦 + ",
	"N閕 ph遪g t╪g ",
	"Ngo筰 ph遪g +",
	"T蕁 c玭g k蘭 c s竧",
	"N? tr竛h t╪g",
	"Цnh ch苙 i phng xu蕋 chi猽",
	"чc s竧 t╪g",
	"чc s竧 t╪g",
	"Gi秏 th阨 gian tr髇g thng",
	"M鴆 t? kh? l韓 nh蕋 t╪g",
	"T? l? nh ch苙 xu蕋 chi猽 c馻 i phng",
	"N? tr竛h t╪g",
	"Sinh l鵦 t鑙 產 t╪g",
	"N閕 l鵦 + ",
	"H? tr? t蕁 c玭g  duy tr? ",
	"H? tr? ph遪g th? duy tr? ",
	"Ngo筰 ph遪g gi秏, ngo筰 k輈h t╪g",
	"Ngo筰 ph遪g gi秏, N閕 k輈h t╪g",
	"Kh綾 n?",
	"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",
	"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",
	"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",
	"Khi課 i phng gi秏 Linh ho箃 ",
	"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",
	"T? l? ch辵 n gi秏 n鯽",
	"Ph竧 huy c玭g k輈h l韓 nh蕋",
	"V? c玭g hao n閕 gi秏",
	"Dc hi謚 k衞 d礽",
	"Ch輓h x竎 t╪g",
	"Ch輓h x竎 t╪g",
	"Chuy觧 h鉧 s竧 thng th祅h n閕 l鵦",
	"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",
	"V? kh? nh ngo筰 th蕄 nh蕋 t╪g ",
	"V? kh? nh n閕 l韓 nh蕋 t╪g",
	"V? kh? nh n閕 th蕄 nh蕋 t╪g ",
	"Th阨 gian duy tr? Kim Chung Tr竜 k衞 d礽",
	"Th阨 gian duy tr? Kim Cang B蕋 Ho筰 k衞 d礽",
	"Th阨 gian duy tr? Hu? Nh穘 Ch? k衞 d礽",
	"Th阨 gian duy tr? T﹎ Nh穘 k衞 d礽",
	"L鵦 nh Ng鋍 N? Ki誱 ph竝 t╪g",
	"L鵦 nh T飝 ? Kh骳 t╪g",
	"L鵦 nh Th玭g T? Quy襫 t╪g ",
	"L鵦 nh Khu X? c玭 ph竝 t╪g",
	"Th阨 gian duy tr? V? Ng? T﹎ Ph竝 k衞 d礽",
	"L鵦 nh Th竔 蕋 Ti猽 Di猽 C玭g t╪g",
	"L鵦 nh Dng Gia Ph? Phong Thng t╪g",
	"T? l? nh y l飅 t╪g",
	"L鵦 nh Dng Gia Li猲 X? Thu藅 t╪g",
	"T蕁 c玭g b? qua n? tr竛h c馻 i phng",
	"R髏 ng緉 gi穘 c竎h xu蕋 chi猽 Thi B閏 Чi Ph竝",
	"L鵦 nh Cu錸g Phong Tr秓 t╪g",
	"T蕋 c? thu閏 t輓h t╪g",
	"Trong 5 gi﹜ t鑓  ch箉 t╪g 100, c竎h nhau 10 ph髏",
	"S竧 thng t╪g ",
	"чc s竧 t╪g",
	"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",
	"y猽 c莡 ng c蕄 gi秏 ",
	"T? l? nh ph筸 vi",
	"Th? l鵦 t鑙 產 t╪g",
	"Ch輓h x竎 t╪g",
	"N? tr竛h t╪g",
	"Ph秐 n",
	"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",
	"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",
	"Цnh t藀 trung t╪g",
	"N閕 ph遪g t╪g ",
	"Ph遪g th? ngo筰 c玭g t╪g",
	"V? c玭g hao n閕 gi秏",
	"Ph竧 huy c玭g k輈h l韓 nh蕋",
	"чc s竧 gi秏",
	"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",
	"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",
	"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",
	"Khi課 i phng gi秏 Linh ho箃 ",
	"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",
	"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",
	"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",
	"Gi秏 th阨 gian tr髇g thng",
	"T? l? nh ch苙 xu蕋 chi猽 c馻 i phng",
	"G﹏ c鑤 t╪g",
	"S鴆 m筺g t╪g",
	"Th﹏ ph竝 t╪g",
	"Linh ho箃 t╪g",
	"N閕 c玭g t╪g ",
	"Ph? ph遪g th? i phng",
	"T蕁 c玭g k蘭 c s竧",
	"Kh綾 n?",
	"T? l? nh蕋 nh ch辵 n gi秏 n鯽",
	"Kinh nghi謒 nh薾 頲 t╪g",
	"T蕋 c? thu閏 t輓h t╪g",
	"Ngo筰 k輈h + ",
	"N閕 k輈h t╪g ",
	"T? l? xu蕋 chi猽 t╪g",
	"T鑓  thi tri觧 v? c玭g t╪g",
	"S竧 thng t╪g ",
	"T? l? tr竛h gi秏 t鑓 t╪g",
	"T? l? tr竛h l祄 ch薽 t╪g ",
	"T? l? tr竛h nh lui t╪g",
	"T? l? tr竛h nh ng? t╪g",
	"T? l? tr竛h t? li謙 t╪g",
	"T? l? tr竛h cho竛g t╪g",
	"T? l? tr竛h nh th﹏ t╪g",
	"T? l? tr竛h h鏽 lo筺 t╪g",
	"T? l? tr竛h ng? t╪g",
	"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",
	"Khi課 i phng gi秏 N閕 ph遪g",
	"G﹏ c鑤 t╪g",
	"S鴆 m筺g t╪g",
	"Th﹏ ph竝 t╪g",
	"Linh ho箃 t╪g",
	"N閕 c玭g t╪g ",
	"C玭g k輈h + ",
	"T? l? xu蕋 chi猽 t╪g",
	"D飊g linh n Nguy謙 Lng Th?, c竎h nhau 5 ph髏",
	"Tri謚 g鋓 H籲g Nga ti猲 t? gi髉 phe m譶h h錳 ph鬰. Gi穘 c竎h 5 ph髏",
	"Tri謚 g鋓 H藆 Ngh? b緉 m苩 tr阨, c竎h nhau 5 ph髏",
	"S竧 thng t╪g ",
	"(Tr筺g th竔 PK kh玭g th? s? d鬾g)",										
}
prize_iron_num = {5,5,5,5,5,5,20}
prize_water_num = {3,3,3,3,5,5,10}
prize_zhuangbei_jilv = {220,220,260,240,24,24,30}
--======================================点击宝箱分配装备=============================
function OnUse(id)
	local box_diff = GetItemParticular(id)
	local PlayerIndex_save = PlayerIndex 											--保存帮主索引
	--物品初始化处理及校验--
	for i = 1,2 do
		if GetItemParam(id,i) > 10000 then
			SetItemParam(id,0,0)
			SetItemParam(id,1,0)
			SetItemParam(id,2,0)
		end
	end
	--处理结束--
	local prize_level = box_diff - 525										--奖励等级
	-----------------------------------陨铁增加-------------------------------------------
	if GetItemParam(id,1) == 0 then											--首先判断陨铁是否还在
		if zgc_conf_task_iron_add(prize_level) == 1 then
			if prize_level == 7 and random(1000) <= prize_zhuangbei_jilv[7] then
				local add_flag = AddItem(2,0,1082,50)
				if add_flag == 1 then
					AddGlobalNews("Ngi ch琲"..GetName().."D飊g 'B竎h B秓 rng B? Phi Y猲' m? 50 quy觧 'Th竔 D辌h H鏽 Nguy猲 C玭g у'!")
					SendTongMessage(GetName().."D飊g 'B竎h B秓 rng B? Phi Y猲' m? 50 quy觧 'Th竔 D辌h H鏽 Nguy猲 C玭g у'!")
				else
					WriteLog("B? Phi Y猲: Ngi ch琲["..GetName().."]d飊g 'B竎h B秓 rng B? Phi Y猲' th猰 50 quy觧 'Th竔 D辌h H鏽 Nguy猲 C玭g у' th蕋 b筰, nh d蕌:  "..add_flag)
				end
			end
			SetItemParam(id,1,1)
		else
			return
		end		
	end
	---------------------------------装备属性写入---------------------------------------
	if GetItemParam(id,0) == 0 then											--宝箱第一次分配
		if random(1,1000) > prize_zhuangbei_jilv[prize_level] then			--无装备出现
			local del_flag = DelItemByIndex(id,1)
			if del_flag ~= 1 then				
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "x鉧 b秓 rng th蕋 b筰, tr? ph秐 h錳:"..del_flag)				
			end
			return
		else																--有装备出现
			local prize_seq = 0
			if prize_level <= 4 then										--1-4等直接保存顺序好
				prize_seq = random(1,getn(prize_att[prize_level]))
			elseif prize_level == 7 then									--7等直接保存数据号
				prize_seq = random(1,getn(prize_att[7]))
			else															--二等处理较为复杂
				prize_seq = random(1,getn(prize_att[prize_level]))
				local att_1,att_2,att_3 = zgc_conf_task_att_return(prize_level,prize_seq)
				prize_seq = Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
			end
			SetItemParam(id,0,prize_seq)
		end
	end
	------------------------------------装备属性读取--------------------------------------
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""	
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = GetItemParam(id,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_3 = prize_att[prize_level][prize_seq][8]
		prize_jieshi_1 = " (thu閏 t輓h:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; kh鉧)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; kh鉧)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		prize_jieshi_1 = "Trang b? Ho祅g Kim:"..prize_att[7][prize_seq][5]
		--按兔子姐姐要求加上世界消息
		AddGlobalNews("Ngi ch琲"..GetName().."S? d鬾g \'B竎h B竨 Rng c馻 B? Phi Y猲\' m? Ho祅g Kim V? Kh?:"..prize_att[7][prize_seq][5])
	else
		prize_seq,att_seq_1,att_seq_2,att_seq_3 = Zgc_conf_task_att_dealout(prize_seq)				--属性解析取到属性序号，而不是属性代码
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_1 = prize_att[prize_level][prize_seq][5+(att_seq_1*2)]
			att_2 = prize_att[prize_level][prize_seq][11+(att_seq_2*2)]
			att_3 = prize_att[prize_level][prize_seq][15+(att_seq_3*2)]
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_1 = prize_att[prize_level][prize_seq][5]
			att_2 = prize_att[prize_level][prize_seq][7+(att_seq_2*2)]			
		end
		prize_jieshi_1 = " (thu閏 t輓h:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; kh鉧)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; kh鉧)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	------------------------------------队友对话组合-------------------------------------
		local teamer_dialog = {}											--队友table
		local player_name = ""
		if GetTeamSize() == 0 then
			player_name = GetName()
			player_name = replace(player_name,"/","-")
			player_name = replace(player_name,"|","-")
			player_name = replace(player_name,":","-")
			teamer_dialog[1]=player_name..": "..player_fini_cond().." (Ch? ph竧 cho bang ch髇g)./#Prize_add(0)"
			teamer_dialog[2]="m trang b? c蕋 gi? t筸 th阨/Zgc_end_dialog"
		else
			local conf_name_save = GetTongName()
			local team_number = GetTeamSize()
			local team_seq = 1
			for i = 1, team_number do
				PlayerIndex = GetTeamMember(i)									--修改当前玩家索引
				if conf_name_save == GetTongName() then
					player_name = GetName()
					player_name = replace(player_name,"/","-")
					player_name = replace(player_name,"|","-")
					player_name = replace(player_name,":","-")
					local finish_condition = player_fini_cond()
					teamer_dialog[team_seq] = player_name.." V遪g 3:"..finish_condition.."/#Prize_add("..i..")"
					team_seq = team_seq + 1
				end
			end
			teamer_dialog[team_seq]="m trang b? c蕋 gi? t筸 th阨/Zgc_end_dialog"
			PlayerIndex = PlayerIndex_save
		end
	------------------------------------分配对话组合--------------------------------------
	SendTongMessage(GetName().." M? b秓 rng, ph竧 hi謓 "..prize_jieshi_1)
	if prize_level ~= 7 then
		SendTongMessage(prize_jieshi_2)
	end
	SetTaskTemp(155,id)
	prize_jieshi = prize_jieshi_1..prize_jieshi_2
	Say("B筺 ph竧 hi謓 b猲 trong b秓 rng c? 1 "..prize_jieshi.." Nh蕁 v祇 b猲 m閠 h秓 h鱱 trong danh s竎h, s? kho竧 頲 trang b? l猲 ngi . <color=red>(Kh玭g ph秈 trang b? Ho祅g Kim sau khi m芻 l猲 ngi s? b? kh鉧!)<color>.",
		getn(teamer_dialog),teamer_dialog
	)
end
--*****************************************物品分配函数*******************************
function Prize_add(player_seq)
	local PlayerIndex_save = PlayerIndex 											--保存帮主索引
	local box_index = GetTaskTemp(155)
	local box_diff = GetItemParticular(box_index)
	local prize_level = box_diff - 525												--奖励等级
	local prize_seq = 0
	local att_1 = 0
	local att_level_1 = 0
	local att_2 = 0
	local att_level_2 = 0
	local att_3 = 0
	local att_level_3 = 0
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""
	prize_seq = GetItemParam(box_index,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_level_1 = prize_att[prize_level][prize_seq][5]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_level_2 = prize_att[prize_level][prize_seq][7]
		att_3 = prize_att[prize_level][prize_seq][8]
		att_level_3 = prize_att[prize_level][prize_seq][9]
		prize_jieshi_1 = " (thu閏 t輓h:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		att_1 = -1
		att_level_1 = -1
		att_2 = -1
		att_level_2 = -1
		att_3 = -1
		att_level_3 = -1
		prize_jieshi_1 = "Trang b? Ho祅g Kim:"..prize_att[7][prize_seq][5]
	else
		prize_seq,att_1,att_2,att_3 = Zgc_conf_task_att_dealout(prize_seq)				--属性解析
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_level_1 = prize_att[prize_level][prize_seq][(att_1*2)+6]
			att_1 = prize_att[prize_level][prize_seq][(att_1*2)+5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+12]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+11]
			att_level_3 = prize_att[prize_level][prize_seq][(att_3*2)+16]
			att_3 = prize_att[prize_level][prize_seq][(att_3*2)+15]		
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_level_1 = prize_att[prize_level][prize_seq][6]
			att_1 = prize_att[prize_level][prize_seq][5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+8]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+7]		
		end
		prize_jieshi_1 = " (thu閏 t輓h:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	if player_seq == 0 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--判断玩家负重和空间						--=========================在此加入负重和空格数的判断
			Say ("H祅h trang c馻 b筺 qu? y, s緋 x誴 r錳 quay l筰!",
					1,
					"Ta bi誸 r錳!/Zgc_dialog_end"
				)
				return
		else
			local del_flag = DelItemByIndex(box_index,1)
			if del_flag == 1 then
				local add_flag = 0
				if prize_level <=4 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
				elseif prize_level == 7 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
				else
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
				end
				if add_flag ~= 0 then
					SendTongMessage(GetName().."m 1:"..prize_jieshi_1..prize_jieshi_2)
					SendTongMessage(" m芻 l猲 m譶h, nhi謒 v? v遪g 3:"..player_fini_cond())
					if prize_level == 7 then												
						WriteLogEx(strLogCaption, "trang b? Ho祅g Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())				
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"th猰 trang b? th蕋 b筰, tr? ph秐 h錳:"..add_flag)
				end
			else
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"x鉧 b秓 rng th蕋 b筰, tr? ph秐 h錳:"..del_flag)
			end
		end
	else
		-------------------------------------判断该完家是否在在该队伍中-------------------------------------
		local player_belong_flag = 0
		PlayerIndex = GetTeamMember(player_seq)
		local player_name = GetName()
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if player_name == GetName() then
				player_belong_flag = 1
			end
		end
		PlayerIndex = PlayerIndex_save
		if player_belong_flag ~= 1 then			
			Say("Xin x竎 nh薾 ngi ch琲  c? trong i ng?, n誹 t? i thay i ph秈 ph﹏ b? l筰!",
				1,
				"Ta bi誸 r錳/Zgc_end_dialog"
			)
			return
		else
			PlayerIndex = GetTeamMember(player_seq)
			if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--判断玩家负重和空间						--=========================在此加入负重和空格数的判断
				PlayerIndex = PlayerIndex_save				
				Say ("H祅h trang huynh  c馻 b筺 qu? y, s緋 x誴 r錳 quay l筰!",
					1,
					"Ta bi誸 r錳!/Zgc_dialog_end"
				)
				return
			else
				PlayerIndex = PlayerIndex_save
				local del_flag = DelItemByIndex(box_index,1)
				PlayerIndex = GetTeamMember(player_seq)
				if del_flag == 1 then
					local add_flag = 0
					if prize_level <=4 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
					elseif prize_level == 7 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
					else
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
					end
					if add_flag ~= 0 then
						local name = GetName()
						local task_fini_cond = player_fini_cond()
						PlayerIndex = PlayerIndex_save
						SendTongMessage(GetName().."m 1:"..prize_jieshi_1..prize_jieshi_2)
						SendTongMessage("ph﹏ b? cho "..name.." , nhi謒 v? v遪g 3:"..task_fini_cond)
						WriteLog("Nhi謒 v?B?Phi Y猲: Ngi ch琲 ["..GetName().."] T筰 b秐  ID"..GetWorldPos().."L蕐 1 "..prize_jieshi_1..prize_jieshi_2.."Cho "..name)
						PlayerIndex = GetTeamMember(player_seq)
						if prize_level == 7 then														
							WriteLogEx(strLogCaption, "trang b? Ho祅g Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())
						end
					else
						WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"th猰 trang b? th蕋 b筰, tr? ph秐 h錳:"..add_flag)
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"x鉧 b秓 rng th蕋 b筰, tr? ph秐 h錳:"..del_flag)
				end
				PlayerIndex = PlayerIndex_save
			end
		end
	end
end
--===================================本脚本公用函数===================================
--*********************************二等箱子属性计算函数********************************
function zgc_conf_task_att_return(prize_level,prize_seq)
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	local random_num = 0
	if prize_att[prize_level][prize_seq][4] == 2 then
		random_num = random(0,2)
		att_2 = random_num
		return 0,att_2,0
	else
		random_num = random(0,2)
		att_1 = random_num
		random_num = random(0,1)
		att_2 = random_num
		random_num = random(0,1)
		att_3 = random_num
		return att_1,att_2,att_3
	end
end
--***********************************属性整合*************************************
function Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
	local att_save_num = prize_seq*1000+att_1*100+att_2*10+att_3
	return att_save_num
end
--***********************************属性分解*************************************
function Zgc_conf_task_att_dealout(att_save_num)
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = floor(att_save_num/1000)
	att_1 = floor((att_save_num - prize_seq*1000)/100)
	att_2 = floor((att_save_num - prize_seq*1000 - att_1*100)/10)
	att_3 = floor((att_save_num - prize_seq*1000 - att_1*100 - att_2*10)/10)
	return prize_seq,att_1,att_2,att_3
end
--***********************************陨铁增加函数**********************************
function zgc_conf_task_iron_add(prize_level)
	if GetFreeItemRoom() < (prize_water_num[prize_level] + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < (prize_iron_num[prize_level] + 50) then			--判断玩家负重和空间					--=========================在此加入负重和空格数的判断
		Say ("H祅h trang c馻 b筺 qu? y, kh玭g th? l蕐 Thi猲 Th筩h ra, xin ki觤 tra l筰!",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
			)
		return 0
	else	
		local iron_name = "Thi猲 th筩h"
		local add_flag = 0
		if prize_level < 5 then
			add_flag = AddItem(2,2,7,prize_iron_num[prize_level])
			iron_name = "M秐h Thi猲 th筩h"
		else
			add_flag = AddItem(2,2,8,prize_iron_num[prize_level])
		end
		add_flag = add_flag + AddItem(2,1,1052,prize_water_num[prize_level])
		if add_flag == 0 then
			WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "nh薾 頲 "..iron_name.." th蕋 b筰, tr? quay v?:"..add_flag)				
		else
			Msg2Player("B筺 ph竧 hi謓 b猲 trong b秓 rng c?"..prize_iron_num[prize_level].."c竔"..iron_name.."!")
			Msg2Player("B筺 ph竧 hi謓 b猲 trong b秓 rng c?"..prize_water_num[prize_level].." B錸g Lai L? Th駓!")
			SendTongMessage(GetName().."M? b秓 rng th祅h c玭g, nh薾 頲"..prize_iron_num[prize_level].."c竔"..iron_name.."!")
			SendTongMessage(GetName().."M? b秓 rng th祅h c玭g, nh薾 頲"..prize_water_num[prize_level].." B錸g Lai L? Th駓!")
			WriteLogEx(strLogCaption, "nh薾" ,prize_iron_num[prize_level], iron_name, "", GetTongName())
			WriteLogEx(strLogCaption, "nh薾" ,prize_water_num[prize_level], "B錸g Lai L? Th駓", "", GetTongName())			
		end
		return 1
	end
end
--***************************计算玩家近三轮的收集品缴纳情况***********************
function player_fini_cond()
	local string_return = ""
	local goods_num_count = 0
	local turn_num_sum = 0
	for i = 956,958 do
		if (Zgc_conf_task_time_return() - Zgc_conf_task_cent_date(1,i)) <=2 then
			goods_num_count = goods_num_count + Zgc_conf_task_cent_date(0,i)
			turn_num_sum = turn_num_sum + 1
		end
	end
	string_return = "("..turn_num_sum.." v遪g,"..goods_num_count.." 甶觤 t輈h l騳)"
	return string_return
end
--**************************数量和日期分装函数*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************轮次计算函数*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--***********************************字符替换函数*********************************
function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--***********************************对话结束（空）*******************************
function Zgc_end_dialog()

end