--=============================================
--create by baiyun 2010.1.7
--describe:Խ�ϰ�2010��1�´��ڻ1 ԭ�ϴ��ű��ļ�
--============================================
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");

function OnUse(nItemIdx)
    if gf_JudgeRoomWeight(1, 10, " ") == 0 then
        return 0;
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201001_01_TB_AWARD_YUANLIAODAI, 100, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[19]);
    end
end
