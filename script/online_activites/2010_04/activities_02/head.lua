Include("\\script\\online_activites\\task_values.lua");                        --�������ͷ�ļ�
Include("\\script\\online_activites\\2010_04\\activities_02\\strings.lua");    --��ַ���
Include("\\script\\lib\\globalfunctions.lua");                                 --���������ļ�

DEBUG = 0;
VET_201004_02_EVENT_NUMBER = 6;                                                --�ڻ���ϵı����6

function VET_201004_02_GivePlantSmallTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "T�i Nguy�n Li�u","Hoat dong thang 4 nam 2010","Ph�n th��ng tr�ng c�y b�t nh� nh�");
    end
    --���û��ʱ������
    --gf_EventGiveRandAward( VET_201004_02_TB_SMALLTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[2]);
end

function VET_201004_02_GivePlantBigTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "T�i Nguy�n Li�u","Hoat dong thang 4 nam 2010","Ph�n th��ng tr�ng c�y b�t nh� l�n");
    end
    --���û��ʱ������
    --gf_EventGiveRandAward( VET_201004_02_TB_BIGTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[3]);
end