--������
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_����\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 6 then
        task_06_00();
    elseif nStep == 7 then
        task_07_00();
    elseif nStep == 8 then
        task_08_00();
    elseif nStep == 9 then
        task_09_00();
    elseif nStep == 10 then
        local szTalk = {
            "L�n tr��c ta �i ngang qua T�y Xu�n L�u d��ng nh� tr�ng th�y Thu Dung c� n��ng �ang n�i n�ng v�i m�y g� Xi H�a gi�o ��. H�y t�m c� n��ng �� h�i c� s�!"
        };
        TalkEx("",szTalk);
    elseif nStep > 10 then
        local szTalk = {
            "Hi�n th� �� kh�ng c�n b�n ta n�a! D� c� luy�n B�t L�o ti�n ��n c�ng kh�ng gi� n�i ng��i th��ng y�u nh�t b�n c�nh ta, c�ng ta s�ng ��n r�ng long ��u b�c!"
        };
        TalkEx("", szTalk);
    else
        Talk(1,"","Th� ��o g� ch�! Ban ng�y ban m�t n�i kh�ng cho v�o ��ng l� kh�ng v�o sao? V��ng ph�p g� ch�!");
    end;
end;