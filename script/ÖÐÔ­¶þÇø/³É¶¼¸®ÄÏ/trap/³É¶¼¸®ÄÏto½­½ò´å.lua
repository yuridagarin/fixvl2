--成都府南to江津村
--GGH

--修改：yanjun 05-12-27
--修改目的：元旦夺旗比赛不让有旗子的玩家走TRAP点出地图
Include("\\script\\online\\元旦活动\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B筺 產ng tham gia thi u 畂箃 c? T誸 Nguy猲 Цn, gi鱝 阯g ng r阨 kh醝 khu v鵦 thi u!",0)
		return 0
	end
UWorld1402 = GetTask(1402)
if ( UWorld1402 >= 10 )  then
	NewWorld(306, 1332 ,2843)
	SetFightState(1);
else
	Talk(1,"","Ph輆 trc y猽 ma hung 竎, hay l? n Th祅h Й g苝 n筺 d﹏ c馻 Giang T﹏ Th玭 t譵 hi觰 t譶h h譶h!")
end
end;
