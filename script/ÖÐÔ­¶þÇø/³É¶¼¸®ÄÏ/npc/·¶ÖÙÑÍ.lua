--�ļ�˵��
--NPC��������
--created by lizhi
--2005-8-12 14:57

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function main()
    local nStep = 0;
    
    if GetTask(1) < 25 or GetTask(1) == 100 then
        local szTalk = {
        "T�i h� thu lai phong c�nh d�, H�nh d��ng nh�n kh� v� l�u ��"
        };
        TalkEx("", szTalk);
        return
    end;
    
    nStep = GetTask(TASK_CD_FOUR);
    if nStep == 6 or nStep == 7 then
        task_four_0607();
        return
    elseif nStep == 8 then
        task_four_08();
        return
    end;
    
    nStep = GetTask(TASK_CD_THREE);
    if nStep == 1 then
        task_three_01();
        return
    elseif nStep == 2 then
        task_three_02();
        return
    elseif nStep == 3 then
        task_three_03();
        return
    elseif nStep == 4 then
        task_three_04();
        return
    end;
    
    nStep = GetTask(TASK_CD_ONE);
    if nStep == 0 then
        task_one_00();
        SetTask(132,2);
        if GetTask(130) == 2 and GetTask(131) == 2 then
            SetTask(1, 26); --�����������������������(���һ��)����ر��������
        end;
        return
    elseif nStep == 1 then
        task_one_01_00();
        return
    end;

    TalkEx("", szTalk);
end;