--任务
--地点： 任务：
--策划：樊万松  2004.03.


function main()
UWorld1402 = GetTask(1402)

--------------以下是打开鬼城任务的第二步-----------------------------
if ( UWorld1402 == 35 )  then
		Talk(3,"","K� n祇  m� c鯽 ng Phong Ma? N鉯 mau!","Kh玭g ph秈 ta l祄! Th藅 s� kh玭g ph秈 ta l祄 m�! Ta n <color=red>Phong Й Qu� Th祅h<color> xem th�. G莕 y L穙 i ch髇g t玦 t nhi猲 xu蕋 hi謓 � nh﹏ gian, nh蕋 nh l� L穙 i th� ch髇g t玦 ra!","Л頲! T筸 tha m筺g cho mi !")
		SetTask(1402,40)
		--AddItem(1,1,1,1)
		--Earn(1)
		--ModifyExp(1)
		--AddNote("得知丰都鬼城出现的消息，赶快回阳月师太处通报。")
		TaskTip("Bi誸 頲 tin t鴆 Phong Й Qu� Th祅h xu蕋 hi謓, quay v� b竜 cho Dng Nguy謙 S� Th竔 bi誸.")
		
else
		Talk(1,"","Kh玭g ph秈 ta l祄! Th藅 s� kh玭g ph秈 ta l祄! Ki誴 trc ta b� ch誸 oan !")
end
end;
