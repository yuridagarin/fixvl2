--=============================================
--create by zhangming 2010.6.18
--describe:Խ�ϰ�2010��7�»1 ��Ԫ��2�ɽű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--�ͷ�ļ�
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_hunyuan.lua");--�ͷ�ļ�

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[16][1], 2, 1);

function OnUse(nItemIdx)
    VET_201007_01_Give_Hunyuangong_Award(2,nItemIdx)
end
