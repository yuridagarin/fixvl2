--=============================================
--create by zhangming 2010.6.18
--describe:Խ�ϰ�2010��7�»1 ��ʯ���ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--�ͷ�ļ�

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[1][1], 2, 1);

function OnUse(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if gf_Judge_Room_Weight(1,0," ") ~= 1 then
            return
        end
        gf_EventGiveRandAward(VET_201007_01_KUANGSHIBAG_AWARD,100,1,VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[2])
    end
end
