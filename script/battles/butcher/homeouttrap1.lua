--宋方后营外Trap点触发的脚本
Include("\\script\\battles\\butcher\\head.lua")
function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
		if(GetCurCamp() == 1) then
			print("homeouttrap1  homeouttrap1  homeouttrap1  homeouttrap1")
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		elseif (GetCurCamp() == 2) then
			Msg2Player("Trc khi khai chi課, t蕋 c? tng s? kh玭g 頲 t? ? r阨 kh醝 qu﹏ doanh c馻 m譶h! H穣 i l骳 khai chi課 gi誸 gi芻 l藀 c玭g!")
			SetFightState(1)
		end;
end;


