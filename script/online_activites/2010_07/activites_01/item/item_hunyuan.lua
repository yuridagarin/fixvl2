--=============================================
--create by zhangming 2010.6.18
--describe:Խ�ϰ�2010��7�»1 ��Ԫ���ܽű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--�ͷ�ļ�

function VET_201007_01_Give_Hunyuangong_Award(nLevel, nItemIdx)
    nLevel = nLevel / 2
    local nFlag = GetTask(VET_201007_01_TASK_HUNYUANGONG_NUM)
    for i = 1, (nLevel-1) do
        nFlag = floor(nFlag / 10)
    end
    if mod(nFlag,10) >= 1 then
        Talk(1,"",format(VET_201007_01_TB_STRING_LIST[9],1))
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        nFlag = 1
        for i = 1, (nLevel-1) do
            nFlag = nFlag * 10
        end
        local tbItemIds = VET_201007_01_TB_ITEM_LIST[15+nLevel]
        SetTask(VET_201007_01_TASK_HUNYUANGONG_NUM,GetTask(VET_201007_01_TASK_HUNYUANGONG_NUM)+nFlag)
        VET_201007_01_get_exp(nLevel*2000000)
    end
end


