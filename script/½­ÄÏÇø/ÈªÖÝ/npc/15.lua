--任务
--地点：汴京府  任务：天门阵任务结点14
--策划：樊万松  2004.03.


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 120 )  then
		Talk(6,"say1401_14","C? ph秈 y l? <color=red>Ti猽 Thi猲 H鵸<color>Чi Tng qu﹏?","L? ta y, c? vi謈 g? kh玭g?","T筰 h? l? thu閏 h? c馻 M鬰 Ngh躠, c騨g bi誸 ch髏 v? c玭g n猲 頲 ph竔 n y g鉷 ch髏 c玭g s鴆 ki課 c玭g l藀 nghi謕.","Th藅 may, ta 產ng b祔 Thi猲 M玭 tr薾  t蕁 c玭g Nh筺 M玭 quan, tng so竔 l筰 kh玭g . Ngi mau v祇 <color=red>Thi猲 M玭 tr薾<color> thay ta l蕐 th? c蕄 thng tng qu﹏ T鑞g, 畂箃 <color=yellow>B秐  S琻 H? X? T綾<color>!","T筰 h? m筼 mu閕 h醝 m閠 c﹗ <color=yellow>B秐  S琻 H? X? T綾<color> l? g? v藋?","T蕀 <color=yellow>B秐  S琻 H? X? T綾<color> L? th竛h v藅 ti猲  giao cho thi猲 t?. Ai m? c? 頲 n? nh? n緈 to祅 b? thi猲 h? trong tay kh玭g bi誸 sao hi謓 nay l筰 xu蕋 hi謓 ? Nh筺 M玭 quan. Ta ph秈 huy ng 10 v筺 tinh binh ph? Thi猲 M玭 tr薾  畂箃 頲 t蕀 b秐  <color=yellow>S琻 H? X? T綾<color>. C? 頲 n? xem nh? 產i Li猽 ta n緈 頲 thi猲 h? r錳.","Л頲! T筰 h? v祇 <color=red>Thi猲 M玭 tr薾<color> nh蕋 nh s? 畂箃 t蕀<color=red>B秐  S琻 H? X? T綾<color>!")
    
elseif ( UWorld1401  == 125 ) then
		Talk(1,"","Ch? c莕 ngi v祇 <color=red>Thi猲 M玭 tr薾<color> l蕐 頲 t蕀 <color=red>B秐  S琻 H? X? T綾<color> ta s? tr鋘g thng!")
elseif ( UWorld1401  == 130 or UWorld1401  == 135 ) then
		Talk(1,"","Nh? ngi v祇<color=red>Thi猲 M玭 tr薾<color> l蕐 <color=red>B秐  S琻 H? X? T綾<color> sao c遪 ch莕 ch? ch璦 甶?")		

else
		Talk(1,"","Tr阨 s? ph? h? cho Чi Li猽 ta! Ha ha ha !")
end
end;

function  say1401_14()
		Say("L蕐 danh hi謚 phe n祇  v祇 Thi猲 M玭 tr薾 畂箃 <color=red>B秐  S琻 H? X? T綾<color>? ( sau n祔 c? th? i l筰)",2,"T鑞g Tri襲/yes1401_14","Li猽 Qu鑓/no1401_14")

end;

function  yes1401_14()
		Talk(1,"","L祄 sao ta c? th? s竧 h筰 Tng l躰h T鑞g qu﹏? Hay l? quay v? b竜 cho l穙 tng qu﹏ <color=red>Dng Nghi謕<color> v藋.")
    SetTask(1401,130)
    ----AddItem(0,0,0)
end;

function  no1401_14()
		Talk(1,"","Th玦 頲, qu﹏ T鑞g v? o nh? v藋, ta s? l蕐 danh l? Li猽 qu鑓 tng l躰h v祇 Thi猲 M玭 tr薾 畂箃 <color=red>B秐  S琻 H? X? T綾<color>.")
    SetTask(1401,125)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("L蕐 danh l? Li猽 qu鑓 tng l躰h v祇 Thi猲 M玭 tr薾 畂箃 B秐  S琻 H? X? T綾. (sau n祔 c? th? i l筰)")
    Msg2Player("L蕐 danh l? Li猽 qu鑓 tng l躰h v祇 Thi猲 M玭 tr薾 畂箃 B秐  S琻 H? X? T綾. (sau n祔 c? th? i l筰)")
end;

