--�����������ĺ���
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep >= 6 then
        local szTalk = {
            "Qu� l� m� ��n b� ��c �c!",
            "��c �c �? Kh�ng l�m v�y c� ai nh� ��n ta kh�ng?"
        };
        TalkEx("", szTalk);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 15 then
        task_15_00();
        return
    elseif nStep == 16 then
        task_16_00();
        return
    elseif nStep == 17 then
        Talk(1,"","Ng��i mau �i l�y <color=yellow>cao Thi�n Thi�m H�a ��c<color> cho Tr�n M�n ��i phu nghi�m ch�ng r�i mang ��n cho <color=yellow>H� H�u Li�n<color>!");
        return
    elseif nStep >= 20 and nStep < 22 then
        local szTalk = {
            "Sao c� n��ng l�i c�u H� H�u Li�n?",
            "Sau n�y ng��i kh�c bi�t."
        };
        TalkEx("", szTalk);
        return
    elseif nStep >= 22 then
        local szTalk = {
            "C� ph�i c� n��ng �� gi�t L�i Th�ng!",
            "Kh�ng ph�i ta, li�u y�u ��o t� nh� ta sao c� th� gi�t ���c ch�?",
            "V�y c� n��ng mua nhi�u binh kh� �� l�m g�?",
            "Ta c�ng c� � ��, nh�ng l�i s� v�o ��i lao. Ng��i�ng��i ��ng �i b�o quan�ta s� l�m!"
        };
        TalkEx("", szTalk);
        return
    else
        if GetSex() == 1 then --male
            Talk(1,"","Tr�nh xa ta ra! Mu�n ch�t �?");
        elseif GetSex() == 2 then --female
            Talk(1,"","Ti�u mu�i s�c ��p tuy�t tr�n! Th�t khi�n ta nh� v� th�i son tr�!");
        end;
    end;
end;