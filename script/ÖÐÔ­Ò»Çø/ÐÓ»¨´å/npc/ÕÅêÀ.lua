--任务
--地点：汴京 任务：天门关任务结点9
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");
function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C? d﹏ c馻 H筺h Hoa th玭  甶 u h誸 r錳? <color=red>H祅 Tr? Nhng<color> l穙 nh﹏ ? u?","T譵 ta c? chuy謓 chi? Gi髉 ta n H筺h Hoa th玭 l蕐 <color=red>10 b? quan ph鬰<color> c馻 b鋘 <color=red>Quan s? <color> r錳 h穣 n y!")
		SetTask(1401,65)
    --AddNote("要拿10套官服才能得到进一步的消息。")
    TaskTip("L蕐 v? 10 b? quan ph鬰 m韎 bi誸 th猰 tin t鴆!")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 10 ) then
				if  DelItem(2,1,34,10) == 1 then
						    Talk(2,"","Qu? nhi猲 l? h秓 h竛! H祅 Tr? Nhng v? mu鑞 tr竛h lo筺 l筩  萵 tr竛h ? <color=red>Йng Bi謓 Kinh Ph?<color>. T? m譶h 甶 t譵 玭g ta 甶!."," t?  ch? gi竜!")
						    SetTask(1401,70)
						    GivePlayerExp(SkeyTianmenzhen,"eli")
						    Earn(1000)
						    ModifyReputation(12,0)
						    --AddNote("得知韩智让已经搬到汴京府西了，需要进入作进一步调查。")
						    TaskTip("H祅 Tr? Nhng 產ng ? T﹜ Bi謓 Kinh (189.174), mau n  g苝!")
				else
						 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 10 ) then
			Talk(1,"","Gi髉 ta nh <color=red>Quan s?<color>, l蕐 頲 <color=red>10 b? quan ph鬰<color> r錳 h穣 n g苝 ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C? d﹏ c馻 H筺h Hoa th玭  n <color=red>Bi謓 Kinh ph? t﹜<color> l竛h n筺, ngi mau n  甶.")	
else
			Talk(1,"","B鋘 Quan s? n祔 ta quy誸 kh玭g tha cho ch髇g!")
	end
end;
