--random�Ľӿں���
--created by lizhi
--2005-9-28 18:44

--˵��
--�������������ĸ����� n/MAX_MOD * 100%
--���������������淵��1�����򷵻�nil

RAN_SEED = tonumber(date("%M%S"))

function g_probability(n, MAX_MOD)
    if GetGlbValue(300) == 0 then
        randomseed(GetGameLoop() + RAN_SEED);
        SetGlbValue(300, 1);
    end;
    rand = mod(random(1, 28564198), MAX_MOD);
    if rand <= n then
        --Msg2Player(rand);
        return 1;
    else
        return nil;
    end;
end;