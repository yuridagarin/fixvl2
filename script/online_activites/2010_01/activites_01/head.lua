--=============================================
--create by baiyun 2010.1.7
--describe:Խ�ϰ�2010��1�´��ڻ ͷ�ļ�
--related files: 
--script\settings\online_activites.txt ����ñ��ļ�
--settings\other.txt ����Ʒ
--\script\global\action_bar_callback.lua �����˺��������Ļص��ļ�������13��14�ź���
--=============================================

Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\2010_01\\activites_01\\strings.lua");--��ַ���
Include("\\script\\lib\\globalfunctions.lua");

VET_201001_EVENT_NUMBER = 1; --�ڻ���ϵı����1
VET_201001_NUM_GET_FACTION_AWARD_MAX_COUNT = 10;  --ÿ��ɫÿ�������ʦ���������Ĵ���
VET_201001_NUM_USE_JIPINZONGZI_EXP = 150000; --ʹ��һ����Ʒ���ӻ�õľ���
VET_201001_NUM_USE_JIPINZONGZI_MAX_COUNT = 270000000 / VET_201001_NUM_USE_JIPINZONGZI_EXP; --ÿ��ɫ���ʹ����������


--ͨ��ʦ�������õ�ʥ���ǹ�������
VET_201001_TB_FACTION_FINISH_AWARD_NUM_LIST = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 30,
	[5] = 30,
	[6] = 50,
	[7] = 60,
	[8] = 70,
	[9] = 80,
};

--���˺�������б�
VET_201001_TB_HONGBAO_AWARD_LIST = {
    {3, 2000, 80000, 1},
    {3, 100, 880000, 1},
    {3, 1, 8880000, 1},
    {2, 7899, 150000, 1},
};
function VET_201001_GiveHongBaoAward(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201001_TB_HONGBAO_AWARD_LIST, 10000, 4, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[18]);        
    end
end

function VET_201001_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201001_EVENT_NUMBER) == 1 then
        szSayHead = VET_201001_TB_STRINGS[3];--���Ҵ��¼�say�ı���
    
        tinsert(tbSayDialog, VET_201001_TB_STRINGS[5].."/exchange_jipinzongzi");
        tinsert(tbSayDialog, VET_201001_TB_STRINGS[6].."/get_xingyunhongbao");

        tinsert(tbSayDialog, VET_201001_TB_STRINGS[7].."/get_expmax_award");

        --�Ի�����
    end
    return tbSayDialog, szSayHead;
end

--��ȡ�������޽���
function get_expmax_award()
	if GetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD) == 0 then--������ȡ�������޽���
		Say("C�c h� ch�a s� d�ng �� s� l��ng B�nh Ch�ng!",0)
		return 0;
	end
	if GetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD) == 2 then--������ȡ�������޽���
		Say("C�c h� �� nh�n ph�n th��ng n�y r�i!",0)
		return 0;
	end
	if gf_JudgeRoomWeight(2, 50, VET_201001_TB_STRINGS[12]) == 0 then
           return 0;
     end    
    SetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD, 2);
    gf_EventGiveCustomAward(1, 30000000, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[15]);        
    gf_EventGiveRandAward(VET_201001_TB_AWARD_LIST3, 10000, 2, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[15]);        
end

--��ȡ���˺��
function get_xingyunhongbao()
    if GetLevel() < 73 or gf_Check55FullSkill() == 0 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[25]);
        return 0;
    end
     if gf_JudgeRoomWeight(3, 100, "") == 0 then
        return 0;
    end
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VET_201001_TASK_GET_HONGBAO_DATE) < nDate then
        SetTask(VET_201001_TASK_GET_HONGBAO_COUNT, 0);
    end
    if GetTask(VET_201001_TASK_GET_HONGBAO_COUNT) >= 2 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[26]);
        return 0;
    end
    if GetItemCount(VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4]) < 20 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[27]);
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4], 20) == 1 then
        gf_AddItemEx2({VET_201001_TB_ITEMS[8][2], VET_201001_TB_ITEMS[8][3], VET_201001_TB_ITEMS[8][4], 1}, VET_201001_TB_ITEMS[8][1],
                VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[17], 24 * 3600, 1);
        SetTask(VET_201001_TASK_GET_HONGBAO_COUNT, GetTask(VET_201001_TASK_GET_HONGBAO_COUNT) + 1);
        SetTask(VET_201001_TASK_GET_HONGBAO_DATE, nDate);
    end
end

function GivePlayerItem()
    if gf_CheckEventDateEx(VET_201001_EVENT_NUMBER) == 0 then
        return 0;
    end
    --�����Ҵ��¼�
    if GetItemCount(VET_201001_TB_ITEMS[2][2], VET_201001_TB_ITEMS[2][3], VET_201001_TB_ITEMS[2][4]) ~= 0 then
        return 0;
    end
    gf_AddItemEx2({VET_201001_TB_ITEMS[2][2], VET_201001_TB_ITEMS[2][3], VET_201001_TB_ITEMS[2][4], 1}, 
                    VET_201001_TB_ITEMS[2][1], VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[1], 0, 1);
end

--��������������nType=1С��nType=2��
function VET_201001_GiveBanRuoShuAward(nType)
    --�ⲿ�Ѿ��ж�ʱ��
    gf_AddItemEx2({VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4], 100},
                    VET_201001_TB_ITEMS[1][1], VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[10 + nType], 0, 1
    );
end

-- ���ʦ�����������
function VET_201001_Give_Faction_Award()
    --�ⲿ�Ѿ��ж�ʱ��
    gf_EventFactionAward(
        {VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4]},
        VET_201001_TB_ITEMS[1][1],
        VET_201001_TB_FACTION_FINISH_AWARD_NUM_LIST, 
        VET_201001_NUM_GET_FACTION_AWARD_MAX_COUNT, 
        VET_201001_TASK_FACTION_DATE, 
        VET_201001_TASK_FACTION_COUNT, 
        VET_201001_STR_LOG_TITLE
    );
end


--�һ���Ʒ����
function exchange_jipinzongzi()
    if GetItemCount(VET_201001_TB_ITEMS[3][2], VET_201001_TB_ITEMS[3][3], VET_201001_TB_ITEMS[3][4]) < 2 or 
        GetItemCount(VET_201001_TB_ITEMS[4][2], VET_201001_TB_ITEMS[4][3], VET_201001_TB_ITEMS[4][4]) < 1 or
        GetItemCount(VET_201001_TB_ITEMS[5][2], VET_201001_TB_ITEMS[5][3], VET_201001_TB_ITEMS[5][4]) < 1 or 
        GetItemCount(VET_201001_TB_ITEMS[6][2], VET_201001_TB_ITEMS[6][3], VET_201001_TB_ITEMS[6][4]) < 1 then
        Talk(1, "", VET_201001_TB_STRINGS[9]);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100, "") == 0 then
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[3][2], VET_201001_TB_ITEMS[3][3], VET_201001_TB_ITEMS[3][4], 2) == 1 and
        DelItem(VET_201001_TB_ITEMS[4][2], VET_201001_TB_ITEMS[4][3], VET_201001_TB_ITEMS[4][4], 1) == 1 and
        DelItem(VET_201001_TB_ITEMS[5][2], VET_201001_TB_ITEMS[5][3], VET_201001_TB_ITEMS[5][4], 1) == 1 and
        DelItem(VET_201001_TB_ITEMS[6][2], VET_201001_TB_ITEMS[6][3], VET_201001_TB_ITEMS[6][4], 1) == 1 then
        
        gf_AddItemEx2({VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4], 1}, VET_201001_TB_ITEMS[7][1],
          VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[13], 0, 1);
          SelectSay()
    end    
end

