--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9������ ��¯�ű��ļ�
--=============================================

Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--��ַ���
Include("\\script\\lib\\globalfunctions.lua");--���������ļ�

function main()
    local nNpcIndex = GetTargetNpc()
    local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    end
    local nKaoluPhase = GetTask(VET_201009_01_TASK_KAOLU_PHASE)
    local nKaoluTime = GetTask(VET_201009_01_TASK_KAOLU_TIME)
    local nTimeNow = GetTime()
    local nDifTime = nTimeNow - nKaoluTime
    nKaoluPhase = nKaoluPhase + 2 * floor(nDifTime/40)
    nDifTime = mod(nDifTime, 40)
    if mod(nKaoluPhase,2) == 0 then
        if mod(nDifTime,40) >= 10 then
            nKaoluPhase = nKaoluPhase + 1
            nDifTime = mod(nDifTime,40) - 10
        end
    else
        if mod(nDifTime,40) >= 30 then
            nKaoluPhase = nKaoluPhase + 1
            nDifTime = mod(nDifTime,40) - 30
        end
    end
    if mod(nKaoluPhase,2) == 0 then
        if nKaoluPhase <= 8 then
            local tbSel = {
                VET_201009_01_TB_STRING_LIST[18].."/#add_muchai("..nKaoluPhase..","..nTimeNow..")",
                VET_201009_01_TB_STRING_LIST[19].."/gf_DoNothing",
            }
            Say(VET_201009_01_TB_STRING_LIST[17],getn(tbSel),tbSel) --�Ų�
            return
        else
            local tbSel = {
                VET_201009_01_TB_STRING_LIST[22].."/get_mooncake",
                VET_201009_01_TB_STRING_LIST[23].."/gf_DoNothing",
            }
            Say(VET_201009_01_TB_STRING_LIST[21],getn(tbSel),tbSel) 
            --��ȡ�±�
        end
    else
        Talk(1,"",format(VET_201009_01_TB_STRING_LIST[20],30-nDifTime))--׼���Ų��׶�
    end
end


function add_muchai(nKaoluPhase, nTimeNow)
    if GetItemCount(VET_201009_01_TB_ITEM_LIST[6][2],VET_201009_01_TB_ITEM_LIST[6][3],VET_201009_01_TB_ITEM_LIST[6][4]) < 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    if DelItem(VET_201009_01_TB_ITEM_LIST[6][2],VET_201009_01_TB_ITEM_LIST[6][3],VET_201009_01_TB_ITEM_LIST[6][4],1) == 1 then
        SetTask(VET_201009_01_TASK_KAOLU_PHASE,nKaoluPhase+1) --��¼�׶�
        SetTask(VET_201009_01_TASK_KAOLU_TIME,nTimeNow) --��¼��ǰ�׶εĿ�ʼʱ��
        SetTask(VET_201009_01_TASK_MUCAI_NUM,GetTask(VET_201009_01_TASK_MUCAI_NUM)+1) --ľ��+1
        nLeftTime = VET_201009_01_TB_KAOLU_TIME[nKaoluPhase+1]
        SetNpcLifeTime(GetTask(VET_201009_01_TASK_FLAG_KAOLU),nLeftTime) --���ÿ�¯����ʱ��
        StartTimeGuage("L� n��ng", 30,0,1)
    end
end

function get_mooncake()
    local nMuChaiNum = GetTask(VET_201009_01_TASK_MUCAI_NUM)
    local nKaoshouNum = 2 * nMuChaiNum
    local nWeiKaoshouNum = 8 - nKaoshouNum
    local tbItemIds = {
        [1] = {
            VET_201009_01_TB_ITEM_LIST[1][2],
            VET_201009_01_TB_ITEM_LIST[1][3],
            VET_201009_01_TB_ITEM_LIST[1][4],
            nKaoshouNum,
        },
        [2] = {
            VET_201009_01_TB_ITEM_LIST[2][2],
            VET_201009_01_TB_ITEM_LIST[2][3],
            VET_201009_01_TB_ITEM_LIST[2][4],
            nWeiKaoshouNum,
        },
    }
    gf_AddItemEx2(tbItemIds[1],VET_201009_01_TB_ITEM_LIST[1][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[6],0,1)
    gf_AddItemEx2(tbItemIds[2],VET_201009_01_TB_ITEM_LIST[2][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[6],0,1)
    SetNpcLifeTime(GetTask(VET_201009_01_TASK_FLAG_KAOLU),0)
end
