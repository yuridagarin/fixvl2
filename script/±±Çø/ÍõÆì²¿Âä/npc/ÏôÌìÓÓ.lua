--任务
--地点：汴京府  任务：天门阵任务结点14
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1401 = GetTask(1401) 
if ( UWorld1401 == 120 )  then
		Talk(6,"say1401_14","<color=green> <color>: v? n祔 c? ph秈 l? <color=red>Ti猽 Thi猲 H鱱<color> i tng qu﹏?","L? ta y, c? vi謈 g? kh玭g?","T筰 h? l? thu閏 h? c馻 M鬰 Ngh躠, c騨g bi誸 ch髏 v? c玭g n猲 頲 ph竔 n y g鉷 ch髏 c玭g s鴆 ki課 c玭g l藀 nghi謕.","Th藅 may, ta 產ng b祔 Thi猲 M玭 tr薾  t蕁 c玭g Nh筺 M玭 quan, tng so竔 l筰 kh玭g . Ngi mau v祇 <color=red>Thi猲 M玭 tr薾<color> thay ta l蕐 th? c蕄 thng tng qu﹏ T鑞g, 畂箃 <color=yellow>B秐  S琻 H? X? T綾<color>!","T筰 h? m筼 mu閕 h醝 m閠 c﹗ <color=yellow>B秐  S琻 H? X? T綾<color> l? g? v藋?","<color=green> <color>: b秐 <color=yellow>S琻 H? X? T綾<color> n祔 l? minh ch鴑g cho thi猲 t?, l? th竛h v藅 tr阨 ban, th莕 l鵦 v? c飊g, c? 頲 n? ng ngh躠 v韎 n緈 頲 thi猲 h? trong tay. V鑞 l? v藅 gia truy襫 c馻 ho祅g  tri襲 i T鑞g, kh玭g ng? l筰 xu蕋 hi謓 t筰 khu v鵦 Nh筺 M玭 Quan. Ta d飊g mi v筺 tinh b輓h l藀 n猲 Thi猲 M玭 i tr薾 v﹜ quanh. Ch? c莕 n緈 頲 <color=yellow>b秐  S琻 H? X? T綾 <color> trong tay, nc i Li猽 ta s? n緈 頲 thi猲 h?!","Л頲! T筰 h? v祇 <color=red>Thi猲 M玭 tr薾<color> nh蕋 nh s? 畂箃 t蕀<color=red>B秐  S琻 H? X? T綾<color>!")
    
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
    GivePlayerExp(SkeyTianmenzhen,"xiaotianyou")
    ModifyReputation(25,0)
    --AddNote("现在可以去天门阵以辽国将领的身份取得山河社稷图。（以后随时都可以在进入天门阵的时候重新选择）")
    TaskTip("Gi? n Thi猲 M玭 Tr薾  畂箃 l蕐 b秐  S琻 H? X? T綾, chi b籲g h穣 t譵 M閏 Qu? Anh th竚 th輓h t譶h h譶h trc.")
    Msg2Player("Gi? n Thi猲 M玭 Tr薾  畂箃 l蕐 b秐  S琻 H? X? T綾, chi b籲g h穣 t譵 M閏 Qu? Anh th竚 th輓h t譶h h譶h trc.")
end;

