--任务
--地点：汴京府  任务：天门阵任务结点6
--策划：樊万松  2004.03.


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 40 )  then
	Talk(6,"","T筰 h? v蕁 an Xa L穙 Th竔 Qu﹏!","Kh?! Kh?!  t?! Xin h醝 anh h飊g c? g? ch? gi竜!","T? nh? t筰 h? v鑞 s飊g k輓h Dng tng qu﹏, nay mu鑞 b竜 danh gia nh藀 Dng Gia qu﹏ gi誸 gi芻 Khi誸 n. N祇 ng? b? bi謙 ph竔 n Lng S琻 B筩, xin L穙 Th竔 Qu﹏ ph竔 t筰 h? n Nh筺 M玭 quan ti襫 tuy課!","H?! Chuy謓 n祔 d? th玦! Chuy謓 c馻 Dng Gia qu﹏, l穙 y c? th? t? quy誸! C? n鉯 l? ta ph竔 ngi 甶 s? d? d祅g u qu﹏!","Ti謓 th? ngi chuy觧 l阨 cho phu qu﹏ <color=red>Dng Nghi謕<color> c馻 ta ? <color=red>Nh筺 M玭 quan<color> r籲g: Ti觰 nh﹏ l閚g quy襫, h? t蕋 ph秈 ph? t礽."," t? L穙 Th竔 Qu﹏ chi誹 c?! Ti觰 nh﹏ nh蕋 nh chuy觧 l阨!")
    SetTask(1401,45)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("дn Nh筺 M玭 quan t譵 Dng Nghi謕 chuy觧 l阨 c馻 Xa Th竔 Qu﹏, ng th阨 h醝 th╩ tin t鴆 v? B秐  S琻 H? X? T綾!")
    Msg2Player("дn Nh筺 M玭 quan t譵 Dng Nghi謕 chuy觧 l阨 c馻 Xa Th竔 Qu﹏, ng th阨 h醝 th╩ tin t鴆 v? B秐  S琻 H? X? T綾!")
	
elseif ( UWorld1401  == 45  ) then
		Talk(1,"","Gi髉 ta chuy觧 l阨 cho phu qu﹏ <color=red>Dng Nghi謕<color> ? <color=red>Nh筺 M玭 quan<color>!")	
elseif ( UWorld1401  > 45  ) then
	Talk(1,""," t? b籲g h鱱!")
else
	Talk(1,"","Gi芻 Khi誸 n t? cao t? i nh璶g kh玭g d? x﹎ ph筸 cng th? Чi T鑞g ta!")
end
end;
