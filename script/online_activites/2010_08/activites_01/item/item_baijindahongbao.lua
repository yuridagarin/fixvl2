--=============================================
--create by zhangming 2010.7.15
--describe:Խ�ϰ�2010��8�»1 �׽�����ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--�ͷ�ļ�

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[5][1], 2, 1);

function OnUse(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(40000000)
    end
end
