Include("\\script\\online_activites\\2010_04\\activities_01\\head.lua");
function OnUse(nItemIdx)
    --if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
    if tonumber(date("%y%m%d")) > 100523 then
        return 0;
    end
    --���ؼ��
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --�������
    if GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) >= VET_201004_01_MAX_TIMES_EXP_FROM_VICBOX then
        Talk(1, "", VET_201004_01_TB_STRINGS[1][9]);
        return 0;
    end
    --ɾ��ʤ�����
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        return 0;
    end
    --������(1800������)
    if GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) < VET_201004_01_MAX_TIMES_EXP_FROM_VICBOX then
        ModifyExp(175000);
        Msg2Player(format(VET_201004_01_TB_STRINGS[1][8], 175000));
    else
        Talk(1, "", VET_201004_01_TB_STRINGS[1][9]);
        return 0;
    end
    --����Ʒ
if DEBUG == 1 then
    Msg2Player("Times = "..GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX));
end    
    if GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) < VET_201004_01_MAX_TIMES_EXP_FROM_VICBOX then
        if mod((GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) + 1), 50) == 0 then         --50x��
            gf_EventGiveRandAward(VET_201004_01_TB_VICBOX_AWARD_LIST_2, 10000, 1, VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[3]);
        else                                                                        --��50x��
            gf_EventGiveRandAward(VET_201004_01_TB_VICBOX_AWARD_LIST_1, 10000, 1, VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[3]);
        end
    --���������
        SetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX, GetTask(VET_201004_01_TASK_TIMES_OPEN_VICBOX) + 1);
        return 1;
    else
        Msg2Player(VET_201004_01_TB_STRINGS[1][9]);
    end
end