--=============================================
--create by baiyun 2010.2.24
--describe:Խ�ϰ�2010��3�»1 ��ɫ���ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--�ͷ�ļ�

function OnUse(nItemIdx)
    --��ʱ������
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then return end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201003_01_WUSEDAI_AWARD_LIST, 100, 1, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[2]);
    end
end
