--脚本名称：结婚二期怪物死亡脚本
--脚本功能：结婚二期中挖碎片刷出的怪物的死亡回调脚本，处理给于玩家奖励的功能
--策划人：铁羊
--代码开发人：村长
--代码开发时间：2007-06-07
--代码修改记录
	Tb_ma_monster_prize = {
		{
			{50,	80,	70,	1,	2},
			{100,	240,100,2,	2},
		},
		{
			{100,	400,50,	3,	4},
			{100,	400,100,9,	4},
		},
	}
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	--是否是已婚人士杀的此怪
	if GetMateName() == "" then
		return
	end
        if GetTask(2286) ~= tonumber(index) then
            return
        end
	--加物品(经验系数保存)
	local monster_diff = 1
	if npc_name == "Чo t芻 h竜 s綾 Tr莕 c玭g t?" then
		monster_diff = 2
	end
		--奖励等级
	local prize_level = 1
	local ran_num = random(1,100)
		if ran_num > Tb_ma_monster_prize[monster_diff][1][3] then
			prize_level = 2
		end
	--开始增加物品
	local ash_num = Tb_ma_monster_prize[monster_diff][prize_level][4]
	if AddItem(2,1,584,ash_num) == 1 then
		Msg2Player("B筺 nh薾 頲 "..ash_num.." L璾 tinh Chi Sa!")
	end
	local frag_num = Tb_ma_monster_prize[monster_diff][prize_level][5]
	for i = 1,frag_num do
		AddItem(2,1,random(568,571),1)
	end
	Msg2Player("B筺 nh薾 頲 "..frag_num.." m秐h v?!")

	--增加经验
	local exp_base_num = 1
	if random(1,100) <= Tb_ma_monster_prize[monster_diff][1][1] then
		exp_base_num = Tb_ma_monster_prize[monster_diff][1][2]
	else
		exp_base_num = Tb_ma_monster_prize[monster_diff][2][2]
	end
	local team_member_num = GetTeamSize()
	if team_member_num <= 1 then
            local player_level = GetLevel()
	    local exp_num = player_level * player_level * exp_base_num
            SetTask(2286, 0)
	    ModifyExp(exp_num)
        else
	    for i = 1,team_member_num do
	        PlayerIndex = GetTeamMember(i)
                if GetTask(2286) == tonumber(index) then
		    local player_level = GetLevel()
		    local exp_num = player_level * player_level * exp_base_num
                    SetTask(2286, 0)
		    ModifyExp(exp_num)
	        end
	    end
        end
end
