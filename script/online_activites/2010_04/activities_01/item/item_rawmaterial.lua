Include("\\script\\online_activites\\2010_04\\activities_01\\head.lua");
function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201004_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    --���ؼ��
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --ɾ��ԭ�ϴ�
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        return 0;
    end
    --����Ʒ 
    gf_EventGiveRandAward(VET_201004_01_TB_RAWMATERIAL_AWARD_LIST, 100, 1, VET_201004_01_STR_LOG_TITLE, VET_201004_01_TB_LOG_ACTION_LIST[6]);
    return 1;
end