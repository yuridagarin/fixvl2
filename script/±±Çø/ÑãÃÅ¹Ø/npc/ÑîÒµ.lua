--任务
--地点：汴京 任务：天门关任务结点7
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ngi l? ai? Sao t? ti謓 v祇 y?","<color=green>ngi ch琲<color>: ta v鮝 m韎 n, v鮝 v祇 i ng?. Nh薾 l謓h Th竔 Qu﹏ n b竜 danh qu﹏ Dng Gia, c遪 n鱝, L穙 Th竔 Qu﹏ c? nh? ta chuy猲 n cho ng礽 1 c﹗, ch輓h l? 揟i觰 nh﹏ 琻g o, c萵 th薾 h祅h ng.?","<color=green>Dng Nghi謕<color>: Phu nh﹏ th藅 c? l遪g! Л頲 r錳, ti觰 anh h飊g y l莕 u n Nh筺 M玭 Quan, c騨g kh玭g ti謓 l猲 ti襫 tuy課 ngay, trc ti猲 h穣 gi髉 ta tr鮪g tr? nh鱪g t猲 tng kh玭g gi? lu藅 t? ti謓 h祅h ng.!","дn <color=red>Nh筺 M玭 quan<color> tr鮪g tr? m閠 s? <color=red>Ki猽 binh<color> thu v? <color=red> 10 M閏 B礽<color>.","<color=green>Ngi ch琲<color>: 頲, ti觰 nh﹏ s? 甶 ngay!")
		SetTask(1401,50)
		GivePlayerExp(SkeyTianmenzhen,"yangjiajiang")
		TaskTip("Gi髉 Dng Nghi謕 tr鮪g tr? Ki猽 binh thu v? 10 M閏 B礽.")
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 10 ) then
				if  DelItem(2,1,64,10) == 1 then
						    GivePlayerExp(SkeyTianmenzhen,"shumupai")
						    --Earn(1500)
						    ModifyReputation(18,0)						    
								--AddNote("惩治兵痞的任务完成。")
						    TaskTip("Nhi謒 v? tr鮪g tr? Ki猽 binh ho祅 th祅h.")
						    Msg2Player("Nhi謒 v? tr鮪g tr? Ki猽 binh ho祅 th祅h.")
		    
								Talk(6,"","<color=green>Dng Nghi謕<color>: qu? nhi猲 th﹏ th? b蕋 ph祄, ho祅 th祅h nhi謒 v? nhanh nh? v藋! th? th?, x誴 cho ngi m閠 <color=red>nhi謒 v? kh? kh╪ <color> v藋!","<color=green>Dng Nghi謕<color>: Ngi v鮝 m韎 n, qu﹏ Li猽 ch璦 g苝 qua ngi, th? th? ngi h穣 gi髉 ta qua qu﹏ doanh phe Li猽 th竚 th輓h tin t鴆 甶.","Nh璶g ta l? ngi H竛 l祄 sao ti誴 c薾 頲 v韎 ngi Khi誸 n?","Nghe n鉯 <color=red>Bi謓 Kinh ph?<color> c? m閠 ngi H竛 t猲 l? <color=red>H祅 Tr? Nhng<color> k誸 h玭 c飊g v韎 m閠 thi誹 n? ngi Khi誸 n.","дn t譵 <color=red>H祅 Tr? Nhng<color>, n鉯 ngi l? th玭g gia c馻 玭g 蕐, ch綾 ch緉 s? 頲 h藆 i. Tranh th? thu th藀 tin t鴆!","Л頲! T筰 h? s? n <color=red>Bi謓 Kinh ph? <color> t譵 <color=red>H祅 Tr? Nhng l穙 nh﹏<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 10 ) then
						Talk(1,"","дn <color=red>Nh筺 M玭 quan<color> tr鮪g tr? m閠 s? <color=red>Ki猽 binh<color> thu v? <color=red> 10 M閏 B礽<color>.")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau n <color=red>Bi謓 Kinh ph?<color> t譵 <color=red>H祅 Tr? Nhng<color> l穙 nh﹏.")
--以下是杨四郎任务---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","<color=green>Ngi ch琲<color>: B萴 tng qu﹏, t筰 h? th竚 th輓h 頲 ngi Khi誸 n  chu萵 b? 10 v筺 tinh binh b? tr? t筰 Thi猲 M玭 Чi Tr薾! Mong tng qu﹏ c? k? s竎h chu萵 b?!","C? th藅 kh玭g? Ngi nghe t? u v藋?","T筰 h? v鮝 t? ch? <color=red>Dng Di猲 Huy<color> tr? v?.","<color=green>Dng Nghi謕<color>: ta hi謓 v蒼 c遪 s鑞g tr猲 th? gian, c遪 l祄 ph? m? nc Li猽, 玭g tr阨 i i ta th藅 qu? t鑤 r錳! Ngi h穣 nhanh ch鉵g quay v? b竜 v韎 <color=red>ёnh Huy<color> r籲g h穣 y猲 t﹎, ta  suy t輓h, nh蕋 nh s? chu萵 b? trc. C遪 n鱝 g鰅 l阨 nh緉 c馻 m? anh 蕐 r蕋 nh? anh 蕐, c? th阨 gian h穣 quay l筰 th╩ b? 蕐.","T筰 h? s? l藀 t鴆 n <color=red>B? L筩 Vng K?<color> b竜 cho <color=red>Dng i nh﹏ <color>!")
						  GivePlayerExp(SkeyTianmenzhen,"zhunbeichutao")
						  --Earn(1500)
						  ModifyReputation(18,0)
							SetTask(1401,110)	    
							--AddNote("回王旗部落给杨延辉（穆义）回话。")
							TaskTip("Quay l筰 B? L筩 Vng K? h錳 b竜 ph? m? M鬰 Ngh躠")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","Phi襫 b籲g h鱱 h錳 b竜 l筰 cho nhi t? <color=red>Dng Di猲 Huy<color>.")
							
--以下是雁门关任务的大结局---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","B萴 b竜 Tng qu﹏, t筰 h? v鮝 t? ch? <color=red>Ti猽 Thi猲 H鵸<color> bi誸 頲 <color=yellow>B秐  S琻 H? X? T綾<color> hi謓 ? Thi猲 M玭 tr薾. V? quy誸 畂箃 頲 n?, Khi誸 n  chu萵 b? 10 v筺 tinh binh.","<color=green>Dng Nghi謕 <color>: A! <color=yellow>S琻 H? X? T綾 у <color> qu? nhi猲  xu蕋 hi謓 r錳, th藅 l? nghi謕 chng! L穙 phu hi v鋘g thi誹 hi謕 h穣 nhanh ch鉵g n <color=red>Thi猲 M玭 Tr薾<color> 畂箃 l蕐 <color=yellow>S琻 H? X? T綾 у<color>","<color=green>Ngi ch琲<color>: 頲! T筰 h? 甶 l藀 t鴆 n <color=red>Thi猲 M玭 Tr薾<color> 畂箃 l蕐 <color=yellow>S琻 H? X? T綾 у <color>#")
		    SetTask(1401,135)
		    GivePlayerExp(SkeyTianmenzhen,"huibao")
		    --Earn(2000)
		    ModifyReputation(25,0)
		    AddNote("V韎 danh ngh躠 tng l躰h qu﹏ T鑞g v祇 Thi猲 M玭 tr薾 畂箃 t蕀 B秐  S琻 H? X? T綾. (sau n祔 c? th? i l筰)")
		    TaskTip("V韎 danh ngh躠 tng l躰h qu﹏ T鑞g v祇 Thi猲 M玭 tr薾 畂箃 t蕀 B秐  S琻 H? X? T綾. (sau n祔 c? th? i l筰)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao r錳? C? tin t鴆 g? c馻 qu﹏ Li猽 kh玭g?")
		
		else
								Talk(1,"","Ch? So竔 Trng kh玭g 頲 t飝 ti謓!")
	end
end;
