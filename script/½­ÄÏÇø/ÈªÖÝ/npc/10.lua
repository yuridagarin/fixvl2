--任务
--地点：汴京 任务：天门关任务结点9
--策划：樊万松  2004.03.

function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C� d﹏ c馻 H筺h Hoa th玭  甶 u h誸 r錳? <color=red>H祅 Tr� Nhng<color> l穙 nh﹏ � u?","Trc ti猲 h穣 nh <color=red>Quan s�<color> l蕐 <color=red>20 b� Quan ph鬰<color> r錳 n g苝 ta!")
		SetTask(1401,65)
    AddNote("T譵 20 b� Quan ph鬰 cho Trng V﹏.")
    Msg2Player("T譵 20 b� Quan ph鬰 cho Trng V﹏.")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 20 ) then
				if  DelItem(2,1,34,20) == 1 then
						    Talk(2,"","Qu� nhi猲 l� h秓 h竛! H祅 Tr� Nhng v� mu鑞 tr竛h lo筺 l筩  萵 tr竛h � <color=red>Йng Bi謓 Kinh Ph�<color>. T� m譶h 甶 t譵 玭g ta 甶!."," t�  ch� gi竜!")
						    SetTask(1401,70)
						    ----AddItem(0,0,0)
						    --Earn(10000)
						    ModifyExp(10000)
						    AddNote("H祅 Tr� Nhng 產ng � T﹜ Bi謓 Kinh (189.174), mau n  g苝!")
						    Msg2Player("H祅 Tr� Nhng 產ng � T﹜ Bi謓 Kinh (189.174), mau n  g苝!")
				else
						 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 20 ) then
			Talk(1,"","Trc ti猲 h穣 nh <color=red>Quan s�<color> l蕐 <color=red>20 b� Quan ph鬰<color>  r錳 n g苝 ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C� d﹏ c馻 H筺h Hoa th玭  n <color=red>Bi謓 Kinh ph� t﹜<color> l竛h n筺, ngi mau n  甶.")	
else
			Talk(1,"","B鋘 Quan s� n祔 ta quy誸 kh玭g tha cho ch髇g!")
	end
end;
