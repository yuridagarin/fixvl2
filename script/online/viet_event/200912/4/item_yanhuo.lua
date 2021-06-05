--=============================================
--create by baiyun 2009.11.18
--describe:Խ�ϰ�12�·ݻ �̻�ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	do return end
    local nDate = tonumber(date("%y%m%d"));
    local nDay = tonumber(date("%w"))
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);

    if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 or GetLevel() < 10 or GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ph�i c�p 10 tr� l�n v� �� gia nh�p m�n ph�i, t� ��i �� 8 ng��i th� ��i tr��ng m�i c� th� s� d�ng ph�o hoa");
        return 0;
    end

    if nDate > 100117 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."V�t ph�m n�y �� qu� h�n s� d�ng.");
        return 0;
    end

    if nDay == 2 or nDay == 3 or nDay == 4 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."V�t ph�m n�y ch� v�o th� hai, th� s�u, th� b�y, ch� nh�t m�i c� th� s� d�ng");
        return 0;
    end

    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    --�ж��Ƿ����ʹ���̻�
    local nOldIndex = PlayerIndex;
    local nCanUse = 1;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex > 0 then                                                  
            if check_can_use() == 0 then
                nCanUse = 0;
            end
        end
    end
    PlayerIndex = nOldIndex;
    if nCanUse == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Trong t� ��i c� ng��i kh�ng �� �i�u ki�n ��t ph�o hoa, v� v�y kh�ng th� ti�n h�nh ��t ph�o hoa ���c.");
        gf_Msg2Team("Trong t� ��i c� ng��i kh�ng �� �i�u ki�n ��t ph�o hoa, v� v�y kh�ng th� ti�n h�nh ��t ph�o hoa ���c.", 1);
        return 0;
    end
    
    --���̻���
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nOldIndex = PlayerIndex;
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            if PlayerIndex > 0 then                                                  
                use_yanhuo();
            end
        end
        PlayerIndex = nOldIndex;
        DoFireworks(801, 10);
    end
end

function check_can_use()
    local nDate = tonumber(date("%y%m%d"));
    local nTime = GetTime();
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);
    local nLastUseTime = GetTask(VIET_0912_TASK_USE_YANHUO_TIME);
    
    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    local nHasUseCount = GetTask(VIET_0912_TASK_USE_YANHUO_COUNT);

    if GetLevel() < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."C�c h� kh�ng �� c�p 10, kh�ng �� �i�u ki�n nh�n ph�n th��ng.");
        return 0;
    end

    if GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ch�a gia nh�p m�n ph�i kh�ng th� nh�n ph�n th��ng");
        return 0;
    end

    if nHasUseCount >= VIET_0912_YANHUO_MAX_COUNT then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."S� l�n nh�n ph�n th��ng c�a h�m nay �� ��n m�c cao nh�t, kh�ng th� nh�n th�m.");
        return 0;
    end

    if nTime - nLastUseTime < 300 then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."Gi�n c�ch c�a hai l�n nh�n ph�n th��ng ch�a ��n 5 ph�t, xin h�y ��i th�m l�t n�a.");
        return 0;
    end

    return 1;
    
end

function use_yanhuo()
    gf_EventGiveCustomAward(1, 100000, 1);
    SetTask(VIET_0912_TASK_USE_YANHUO_DATE, tonumber(date("%y%m%d")));
    SetTask(VIET_0912_TASK_USE_YANHUO_TIME, GetTime());
    SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, GetTask(VIET_0912_TASK_USE_YANHUO_COUNT) + 1);
end
