--��������������
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 13 then
        task_13_00();
    elseif nStep == 14 then
        task_14_00();
    elseif nStep >= 15 then
        local szTalk = {"<sex>, mu�n mua binh kh� �? Ti�c r�ng ta �� b�n h�t r�i!"};
        TalkEx("", szTalk);
    else
        Talk(1,"","Th�t xui x�o! ��u n�m ��u th�ng ch� mua ���c t� ph�i th�p n�o!");
    end;
end;