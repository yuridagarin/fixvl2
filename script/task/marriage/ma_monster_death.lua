--�ű����ƣ������ڹ��������ű�
--�ű����ܣ�������������Ƭˢ���Ĺ���������ص��ű������������ҽ����Ĺ���
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-06-07
--�����޸ļ�¼
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
	--�Ƿ����ѻ���ʿɱ�Ĵ˹�
	if GetMateName() == "" then
		return
	end
        if GetTask(2286) ~= tonumber(index) then
            return
        end
	--����Ʒ(����ϵ������)
	local monster_diff = 1
	if npc_name == "��o t�c h�o s�c Tr�n c�ng t�" then
		monster_diff = 2
	end
		--�����ȼ�
	local prize_level = 1
	local ran_num = random(1,100)
		if ran_num > Tb_ma_monster_prize[monster_diff][1][3] then
			prize_level = 2
		end
	--��ʼ������Ʒ
	local ash_num = Tb_ma_monster_prize[monster_diff][prize_level][4]
	if AddItem(2,1,584,ash_num) == 1 then
		Msg2Player("B�n nh�n ���c "..ash_num.." L�u tinh Chi Sa!")
	end
	local frag_num = Tb_ma_monster_prize[monster_diff][prize_level][5]
	for i = 1,frag_num do
		AddItem(2,1,random(568,571),1)
	end
	Msg2Player("B�n nh�n ���c "..frag_num.." m�nh v�!")

	--���Ӿ���
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
