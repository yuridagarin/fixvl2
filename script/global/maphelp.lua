-- filename：s2map_ask.lua
-- By:Xsjcs
-- 帮助玩家查询练级地点
---------------------------------------------
lv_str = {	"T﹏ th?"," tr猲 c蕄 5","v鮝 qua c蕄 10","h琻 c蕄 10","v鮝 qua c蕄 20","h琻 c蕄 20","v鮝 qua c蕄 30","h琻 c蕄 30","v鮝 qua c蕄 40","h琻 c蕄 40","Cao th? c蕄 50","Tuy謙 h秓 cao th?"}
dangernpc = {	"Th? tr緉g, Th? x竚","L璾 manh, C玭 ","S鉯 x竚, S鉯 xanh, Thi誸 Gi竝 tr飊g","Heo r鮪g, Ong v祅g, B竎h Nh藅 ti詎","Tr閙 v苩, D琲, M? h莡, Ki誱 kh竎h","Phi t芻, o hi謕, H?","N? Ki誱 kh竎h, Tuy誸 qu竔","S鉯 甶猲, Ngi l飊, Qu?, Nh謓, N? Hi謕 Kh竎h, B竧 Ph? H? Йng s?, M閏 Nh﹏, Quan s?","Y猽 H?, S琻 t芻, Danh Thng Hi謕, Ki誱 s竧, D琲 H髏 m竨, Nh穘 K輓h x?, o tuy謙, Thi猲 L? Ti猽, Ki誱 cu錸g, уng Nh﹏, Ki誱 tuy謙, o Kh竎h","мa s竧, Huy襫 V? o, Cung Li謕, N? Ki誱 h祇, Li猽 Ti詎 binh, B? kho竔, Li猽 o binh, T鑞g Ti詎 binh, T鑞g o binh","Thi猲 s竧, T鑞g Thng qu﹏, B╪g qu竔, C? quan M閏 Nh﹏, M藅 th竚, Thng qu﹏ Li猽, H? Y Nh﹏, Хng o Kh竎h, Huy襫 V? Ki誱, o Kh竎h hoang m筩","C竎 NPc c蕄 100, nh? Ki誱 T?, Thng cu錸g"}
helpmap = {	"Khu v鵦 xung quanh Th祅h , Khu v鵦 xung quanh Bi謓 Kinh",
		"Khu v鵦 ven Th祅h , Khu v鵦 ven Bi謓 Kinh",
		"Khu v鵦 ven Nam m玭 Th祅h Й, Khu v鵦 ven Йng m玭 Bi謓 Kinh, H筺h Hoa th玭, xung quanh C竔 Bang, xung quanh Nga My ph竔",
		"Xung quanh Thi誹 L﹎, xung quanh Nga My, xung quanh V? ng, ch﹏ Ph鬰 Ng璾 s琻, b猲 ngo礽 H筺h Hoa th玭",
		"Xung quanh c竎 i m玭 ph竔",
		"Xung quanh c竎 i m玭 ph竔",
		"Xung quanh c竎 i m玭 ph竔, B╪g T﹎ ng t莕g 1",
		"Tng V﹏ ng, Dng Trung ng t莕g 2 tr竔,Ch﹏ Thanh Th祅h s琻, Th蕋 Tinh ng t莕g 1, Thi誹 L﹎ M藅 th蕋 t莕g 1, B╪g T﹎ ng t莕g 1",
		"Tng V﹏ ng, Dng Trung ng t莕g 1 v? 2, Th蕋 Tinh ng t莕g 1, Thi誹 L﹎ M藅 th蕋 t莕g 1, B╪g T﹎ ng t莕g 1, Tr骳 Ty ng t莕g 1, Lng S琻 B筩",
		"Dng Trung ng t莕g 3, Th蕋 Tinh ng t莕g 2, Thi誹 L﹎ M藅 th蕋 t莕g 2, Kim Quang ng, Ki誱 M玭 quan, Nh筺 M玭 quan",
		"Kim Quang ng, Dng Trung ng, Thi誹 L﹎ M藅 th蕋 t莕g 2, Kim Quang ng, Nh? Long S琻, Ki誱 M玭 quan, Nh筺 M玭 quan",
		"C竎 s琻 ng th莕 b?, S琻 tr筰, M藅 o, Huy謙 c鑓"
	}

function maphp()
	lvl = floor(GetLevel()/5 + 1)
	if (lvl>12) then 
		lvl=12;
	end;
	Talk(3,"","цi v韎 <color=red>"..lv_str[lvl].."<color> nh? ngi, th? a 甶觤 luy謓 c玭g th輈h h頿 nh蕋 l? <color=red>"..helpmap[lvl].."<color>. <enter>T筰 nh鱪g n琲 , t鑤 nh蕋 ngi n猲 nh <color=red>"..dangernpc[lvl].."<color>.","M芻 d? hi謓 t筰 ngi  r蕋 m筺h, nh璶g ta v蒼  ngh? ngi <color=red>n猲 t? i v韎 nhi襲 ngi kh竎<color>  t╪g th猰 s? an to祅 v? hi謚 qu? luy謓 c玭g!","<color=red>Ph秈 h誸 s鴆 ch? ?<color>: M鏸 khu v鵦 luy謓 c玭g ph﹏ b? <color=red>h鏽 t筽<color> c竎 lo筰 qu竔. V? v藋 i v韎 nh鱪g lo筰 c? t猲 <color=red>m祏 <color>, <color=blue>m祏 xanh<color> v? <color=yellow>m祏 v祅g<color> th? kh玭g n猲 n c chi課 u v韎 ch髇g! <enter>Sau khi <color=red> c? v? kh? ng? h祅h<color> + <color=red>ng c蕄 tng 琻g 40<color> v? ho祅 th祅h nhi謒 v? tng 琻g, ngi c? th? n <color=green>Phong Й<color>, <color=green>Giang T﹏ th玭<color>  luy謓 c玭g v韎 c竎 qu竔 v藅 <color=red> t輓h<color>")
end;