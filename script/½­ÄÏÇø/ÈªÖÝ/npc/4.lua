--任务  
--地点：汴京 任务：天门阵任务，分支结点1
--策划：樊万松  2004.02.28

function main()
	UWorld1402 = GetTask(1402)
	UWorld1401 = GetTask(1401)
if ( UWorld1401 == 25 and UWorld1402 == 0  )  then
		Talk(2,"","B? u i nh﹏! T筰 h? nghe n鉯 c? m閠 m ngi m芻 quan ph鬰 tr? tr閚 v祇 thi猲 lao gi秈 c鴘 t? nh﹏!","C? chuy謓 nh? v藋 sao? Ph秐 r錳!  t?  b竜 tin! Зy ch髏 t? l? xin h穣 nh薾 l蕐!")
    SetTask(1402,5)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("B? m藅 b竜 quan ph? chuy謓 cp ng鬰!")
    Msg2Player("B? m藅 b竜 quan ph? chuy謓 cp ng鬰!")
else
		Talk(1,"","Nha m玭 l? n琲 c蕀 a! H?  cho ngi t? ti謓 x玭g v祇 sao?")
end
end;