--��������������
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
Include("\\script\\task\\world\\lizhi_����\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 27 then
        task_27_00();
        return
    elseif nStep == 28 then
        Talk(1,"","<color=green>���ng Ninh<color>: H�y quay v� nh�n v�i <color=yellow>H� H�u C�m<color> y�n t�m, �� ta �� nh�n ���c r�i!");
        return
    end;
    
    nStep = GetTask(TASK_YZ_TWO);
    if nStep == 5 then
        two_05_00();
        return
    elseif nStep == 6 then
        local szTalk = {
            "Ta �� n�i h�t chuy�n ta bi�t cho ng��i. Chuy�n c�a {H� H�u C�m} h�y ��ch th�n ��n h�i!",
            "H� c� n��ng �� k� h�t cho ta bi�t. R�i kh�i Xi H�a gi�o, kh�ng s� h� l�m h�i c� n��ng sao?",
            "Ta ���ng ���ng mang h� ���ng, ch�ng d�m l�m g� ta!",
            "V�y ta y�n t�m! ���ng c� n��ng, xin b�o tr�ng!"
        };
        TalkEx("", szTalk);
        return
    end;

     Talk(1,"","<color=green>���ng Ninh<color>: C� chuy�n g� kh�ng?");
end;