--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9�»1 ������±��ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_09\\activites_01\\head.lua");--�ͷ�ļ�

g_szItemSayHead = gf_FixColor(VET_201009_01_TB_ITEM_LIST[1][1], 2, 1);

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[1])
        return
    end
    local nHaveAddedExp = GetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP)
    if nHaveAddedExp >= VET_201009_01_EXP_LIMITE_SP then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[14])
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nAddExp = 250000
        if nHaveAddedExp + nAddExp > VET_201009_01_EXP_LIMITE_SP then
            nAddExp = VET_201009_01_EXP_LIMITE_SP - nHaveAddedExp
        end
        SetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP,nHaveAddedExp+nAddExp)
        ModifyExp(nAddExp)
    end
end
