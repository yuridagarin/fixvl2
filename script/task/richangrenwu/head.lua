--=============================================
--create by baiyun 2009.12.14
--describe:Խ�ϰ�����ʹ���ճ����� ͷ�ļ�
--=============================================

Include("\\script\\task\\richangrenwu\\init_task.lua");
--�����ÿ�λ������֡�����ճ�����������ġ��ɴ��ļ��е�Give_Daily_Personal_Task_Award��Give_Daily_Team_Task_Awardʵ��
Include("\\script\\online_activites\\award.lua");
--Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--���������Ľӿ�

DAILY_TASK_0912_PERSONAL_TASK_DATE = 2123; --������������ܸ����ճ����������
DAILY_TASK_0912_TEAM_TASK_DATE = 2124; --��������������Ŷ��ճ����������
DAILY_TASK_0912_PERSONAL_TASK_ID = 2125;--��������������ճ������ֵ
DAILY_TASK_0912_TEAM_TASK_ID = 2126;--����������Ŷ��ճ������ֵ
DAILY_TASK_0912_PERSONAL_TASK_COUNT = 2127;--�����Ѿ���ɵĸ����ճ��������
DAILY_TASK_0912_TEAM_TASK_COUNT = 2128;--�����Ѿ���ɵ��Ŷ��ճ��������

DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT = 5;--ÿ������ճ������������
DAILY_CONST_0912_TEAM_TASK_MAX_COUNT = 3;--ÿ������ճ������������

DAILY_TASK_0912_PERSONAL_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_TEAM_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_PERSONAL_LOG_ACTION = "Ho�n th�nh nhi�m v� c� nh�n";
DAILY_TASK_0912_TEAM_LOG_ACTION = "Ho�n th�nh nhi�m v� t� ��i";
DAILY_TASK_0912_NPC = "<color=green>V� l�m s� gi�: <color>";


--�����ճ�������
DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST = {
        {1, 250, "��u h�n", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "Th�n N�ng ��n", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ng� d�ng b�ch ng�c th�ch", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5������
}
DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP = 1000000;

--�Ŷ��ճ�������
DALIY_TASK_0912_TEAM_TASK_AWARD_LIST = {
        {1, 250, "��u h�n", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "Th�n N�ng ��n", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ng� d�ng b�ch ng�c th�ch", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5������
}
DALIY_TASK_0912_TEAM_TASK_AWARD_EXP = 1000000;


function DaliyTask0912About()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end
    
    --���ϵͳ����û�д��������߷�����崻�����û�����������������һ��
    if GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, random(1, getn(DALIY_TASK_0912_PERSONAL_TASK_LIST)));
    end
    if GetGlbValue(DAILY_TASK_0912_TEAM_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, random(1, getn(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST)));
    end

    local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);

    local tb_main_dialog = {
        "Nh�n nhi�m v� th��ng nh�t c� nh�n/get_daliy_personal_task",
        "Nh�n nhi�m v� th��ng nh�t t� ��i/get_daliy_team_task",
        "Ki�m tra t�nh h�nh nhi�m v� th��ng nh�t/view_today_task_info",
        "H�y nhi�m v� th��ng nh�t c� nh�n/cancel_personal_task",
        "H�y nhi�m v� th��ng nh�t t� ��i/cancel_team_task",
        "N�p v� nh�n th��ng nhi�m v� th��ng nh�t c� nh�n/finish_daliy_personal_task_dlg",
        "N�p v� nh�n th��ng nhi�m v� th��ng nh�t t� ��i/finish_daliy_team_task_dlg",
        "K�t th�c ��i tho�i/dialog_over",
    };

    Say(DAILY_TASK_0912_NPC .. format("H�m nay nhi�m v� th��ng nh�t c� nh�n l� <color=yellow>%s<color>, nhi�m v� th��ng nh�t t� ��i l� <color=yellow>%s<color>",DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][1], DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][1]), getn(tb_main_dialog), tb_main_dialog);
end

function finish_daliy_personal_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "Nh�n ph�n th��ng nhi�m v�", "finish_daliy_personal_task"),
	        format("%s/#%s", format("S� d�ng %d %s ��i ph�n th��ng",2,"Xu"), "finish_daliy_personal_task(1)"),
	        "K�t th�c ��i tho�i/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("L�nh t� Minh Ch�, nay ho�n th�nh nhi�m v� v� l�m h�ng ng�y ��u ���c nh�n th�m <color=yellow>%s<color>, v�i l�nh b�i n�y c� th� ��n t�m Th�n Binh C�c Tr��ng L�o (T��ng D��ng:183, 175) ��i l�y trang b� S� M�n Ho�ng Kim b� 4. <enter>N�u nh� s� d�ng <color=yellow>%s<color> �� nh�n th��ng th� s� nh�n ���c <color=yellow>%s<color> s� l��ng g�p <color=green>%d<color> l�n, ph�n th��ng kinh nghi�m t�ng cao <color=green>%s<color>.","V� L�m Ho�ng Kim L�nh","Xu","V� L�m Ho�ng Kim L�nh",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

function finish_daliy_team_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "Nh�n ph�n th��ng nhi�m v�", "finish_daliy_team_task"),
	        format("%s/#%s", format("S� d�ng %d %s ��i ph�n th��ng",2,"Xu"), "finish_daliy_team_task(1)"),
	        "K�t th�c ��i tho�i/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("L�nh t� Minh Ch�, nay ho�n th�nh nhi�m v� v� l�m h�ng ng�y ��u ���c nh�n th�m <color=yellow>%s<color>, v�i l�nh b�i n�y c� th� ��n t�m Th�n Binh C�c Tr��ng L�o (T��ng D��ng:183, 175) ��i l�y trang b� S� M�n Ho�ng Kim b� 4. <enter>N�u nh� s� d�ng <color=yellow>%s<color> �� nh�n th��ng th� s� nh�n ���c <color=yellow>%s<color> s� l��ng g�p <color=green>%d<color> l�n, ph�n th��ng kinh nghi�m t�ng cao <color=green>%s<color>.","V� L�m Ho�ng Kim L�nh","Xu","V� L�m Ho�ng Kim L�nh",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

--��ɸ����ճ�����
function finish_daliy_personal_task(bBonus)
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� v�n ch�a nh�n nhi�m v� th��ng nh�t c� nh�n c�a h�m nay, kh�ng th� nh�n ph�n th��ng n�y.");
    elseif nPersonalTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� v�n ch�a ho�n th�nh nhi�m v� th��ng nh�t c� nh�n c�a h�m nay, kh�ng th� nh�n ph�n th��ng n�y");
    elseif nPersonalTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C�c h� mang <color=yellow>%s<color> kh�ng �� <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        Give_Daily_Personal_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(1)
    end
end

--����Ŷ��ճ�����
function finish_daliy_team_task(bBonus)
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� v�n ch�a nh�n nhi�m v� th��ng nh�t t� ��i c�a h�m nay, kh�ng th� nh�n ph�n th��ng n�y.");
    elseif nTeamTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� v�n ch�a ho�n th�nh nhi�m v� th��ng nh�t t� ��i c�a h�m nay, kh�ng th� nh�n ph�n th��ng n�y");
    elseif nTeamTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_TEAM_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C�c h� mang <color=yellow>%s<color> kh�ng �� <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        Give_Daily_Team_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(2)
    end
end

--��ȡ�����ճ�����
function get_daliy_personal_task()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nDate = tonumber(date("%y%m%d"));

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�p 70 tr� l�n m�i c� th� nh�n nhi�m v� th��ng nh�t c� nh�n");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nh�p m�n ph�i m�i c� th� nh�n nhi�m v� th��ng nh�t c� nh�n");
        return 0;
    end

    if nPersonalTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� �� nh�n 1 nhi�m v� th��ng nh�t c� nh�n r�i, tr��c ti�n h�y ho�n th�nh v� n�p nhi�m v� r�i quay tr� l�i ��y");
        return 0;
    end

    if nPersonalCount >= DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H�m nay �� nh�n s� l�n nhi�m v� th��ng nh�t c� nh�n ��t ��n gi�i h�n, ng�y mai h�y quay l�i nh�.");
        return 0;
    end
    
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, nPersonalCount + 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."H�m nay c�c h� �� nh�n nhi�m v� th��ng nh�t c� nh�n, ph�i ho�n th�nh nhi�m v� trong ng�y m�i c� th� nh�n th��ng!");

    local szPersonalTask = DALIY_TASK_0912_PERSONAL_TASK_LIST[GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK)][1];
    TaskTip(szPersonalTask);
end
--��ȡ�Ŷ��ճ�����
function get_daliy_team_task()
    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if check_can_get_team_task() == 1 then
            get_daliy_personal_task_perman();  
        end
    else
        --����ǲ��Ƕӳ�
        if GetName() ~= GetCaptainName() then
            Talk(1, "", DAILY_TASK_0912_NPC.."L�c nh�n nhi�m v� t� ��i, ch� c� ��i tr��ng m�i c� th� nh�n.");
            return 0;
        end

        --����Ƿ������˶����Խ�
        local nRetCode = 1;
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if check_can_get_team_task() == 0 then
                nRetCode = 0;
            end
        end
        PlayerIndex = nOldIndex;

        if nRetCode == 0 then
            Talk(1, "", DAILY_TASK_0912_NPC.."Trong t� ��i c� ng��i kh�ng �� �i�u ki�n, nh�n nhi�m v� th�t b�i.");
        else
            local nOldIndex = PlayerIndex;
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i);
                get_daliy_personal_task_perman();
            end
            PlayerIndex = nOldIndex;
            Talk(1, "", DAILY_TASK_0912_NPC.."T� ��i �� nh�n nhi�m v� th��ng nh�t t� ��i c�a h�m nay, ph�i ho�n th�nh nhi�m v� trong ng�y m�i c� th� nh�n th��ng!");
        end
    end
end
--����Ƿ����ʸ���ȡ�Ŷ��ճ�����
function check_can_get_team_task()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."Ng��i ch�i ph�i c�p 70 tr� l�n m�i c� th� nh�n nhi�m v� th��ng nh�t t� ��i.");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nh�p m�n ph�i m�i c� th� nh�n nhi�m v� th��ng nh�t t� ��i");
        return 0;
    end

    if nTeamTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� �� nh�n 1 nhi�m v� th��ng nh�t t� ��i, tr��c ti�n h�y ho�n th�nh v� n�p nhi�m v� r�i m�i ���c nh�n ti�p.");
        return 0;
    end

    if nTeamCount >= DAILY_CONST_0912_TEAM_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H�m nay c�c h� �� nh�n nhi�m v� th��ng nh�t t� ��i ��t ��n m�c cao nh�t, ngay mai quay l�i nh�");
        return 0;
    end

    return 1;
end
--ÿ���˽��Ŷ��ճ�����
function get_daliy_personal_task_perman()
    local nDate = tonumber(date("%y%m%d"));
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, nTeamCount + 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."C�c h� �� nh�n nhi�m v� th��ng nh�t t� ��i! Trong ng�y ph�i ho�n th�nh xong m�i c� th� nh�n th��ng!");

    local szTeamTask = DALIY_TASK_0912_TEAM_TASK_LIST[GetGlbValue(DAILY_TASK_0912_TEAM_TASK)][1];
    TaskTip(szTeamTask);
end

--�鿴���յ�����������
function view_today_task_info()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTaskPersonalStep = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nTaskTeamStep = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    local szPersonalState = "";
    local szTeamState = "";

    if nTaskPersonalStep == 0 then
        szPersonalState = "V�n ch�a nh�n nhi�m v�  th��ng nh�t c� nh�n";
    elseif nTaskPersonalStep == 1 then
        szPersonalState = "�� nh�n nhi�m v� th��ng nh�t c� nh�n v� v�n ch�a ho�n th�nh";
    elseif nTaskPersonalStep == 2 then
        szPersonalState = "�� nh�n nhi�m v� th��ng nh�t c� nh�n, v�n ch�a n�p nhi�m v� v� nh�n ph�n th��ng";
    end

    if nTaskTeamStep == 0 then
        szTeamState = "V�n ch�a nh�n nhi�m v� th��ng nh�t t� ��i";
    elseif nTaskTeamStep == 1 then
        szTeamState = "�� nh�n nhi�m v� th��ng nh�t t� ��i v� v�n ch�a ho�n th�nh";
    elseif nTaskTeamStep == 2 then
        szTeamState = "�� nh�n nhi�m v� th��ng nh�t t� ��i, v�n ch�a n�p nhi�m v� v� nh�n ph�n th��ng";
    end

    Say(DAILY_TASK_0912_NPC..format("H�m nay ��i hi�p �� nh�n <color=red>%d<color> l�n nhi�m v� th��ng nh�t c� nh�n <color=red>%d<color> l�n nhi�m v� th��ng nh�t t� ��i<enter>Hi�n t�i, <color=yellow> nhi�m v� th��ng nh�t c� nh�n <color> �� nh�n: <color=red>%s<color><enter>Hi�n t�i,  <color=yellow> nhi�m v� th��ng nh�t t� ��i <color> �� nh�n: <color=red>%s<color><enter>", nPersonalCount, nTeamCount, szPersonalState, szTeamState), 0);
end

--ȡ�������ճ�
function cancel_personal_task()
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C�c h� v�n ch�a nh�n nhi�m v� th��ng nh�t c� nh�n, v� v�y kh�ng th� h�y b� ���c.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X�c nh�n mu�n b� nhi�m v� th��ng nh�t c� nh�n?", 2, "��ng �/confirm_cancel_persional_task", "tr� l�i/DaliyTask0912About");
    end
end
function confirm_cancel_persional_task()
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."�� h�y b� th�nh c�ng nhi�m v� th��ng nh�t c� nh�n c�a h�m nay");
end

--ȡ���Ŷ��ճ�
function cancel_team_task()
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C�c h� v�n ch�a nh�n nhi�m v� th��ng nh�t t� ��i, v� v�y kh�ng th� h�y b� ���c.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X�c nh�n mu�n b� nhi�m v� th��ng nh�t t� ��i!", 2, "��ng �/confirm_cancel_team_task", "tr� l�i/DaliyTask0912About");
    end
end
function confirm_cancel_team_task()
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."�� h�y b� th�nh c�ng nhi�m v� th��ng nh�t t� ��i c�a h�m nay");
end

--��ɸ����ճ�����
function is_he_finish_the_personal_task(szMonsterName)
	if random(1, 1000) > 17 then
	    return 0;
	end
	    
	local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
	if nPersonalTask == 0 then
	    return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
	end
	
	local nMatch = 0;
	local tbMonsterList = DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][3]
	for i = 1, getn(tbMonsterList) do
		if tbMonsterList[i] == szMonsterName then
		    nMatch = 1;
		    break;
		end
	end
	
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 or nTeamSize == 1 then	
	  	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
	      	if nMatch == 1 then
	          		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
	          		TaskTip("��i hi�p �� ho�n th�nh nhi�m v� th��ng nh�t c� nh�n c�a h�m nay!");
	      	end
	  	end
	else
	    local nOldIndex = PlayerIndex;
	    for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);	
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
			end			
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
				if nMatch == 1 then
			        	SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
			        	TaskTip("��i hi�p �� ho�n th�nh nhi�m v� th��ng nh�t c� nh�n c�a h�m nay!");
			  	end
			end
		end         
	     PlayerIndex = nOldIndex;
	end
end

--����Ŷ��ճ�����
function is_he_finish_the_team_task(szItemName)
    --if random(1, 1000) > 17 then
    --    return 0;
    --end

    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
    if nTeamTask == 0 then
        return 0;
    end

    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= szItemName then
        return 0;
    end

    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
            SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
            TaskTip("��i hi�p �� ho�n th�nh nhi�m v� th��ng nh�t t� ��i c�a h�m nay!");
        end
    else
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
                SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
            end
            if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
                TaskTip("��i hi�p �� ho�n th�nh nhi�m v� th��ng nh�t t� ��i c�a h�m nay!");
            end
        end
        PlayerIndex = nOldIndex;
    end
    
end

function dialog_over()
end
