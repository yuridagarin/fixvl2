--�ļ�˵��
--���ƼɶԻ��Ľű�
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_TWO);
    if nStep == 101 then
        task_two_01();
        return
    elseif nStep == 102 then
        task_two_02();
        return
    elseif nStep == 103 then
        task_two_03();
        return
    end;

    i=random(1,3)
	if i == 1 then
		Say("T�n nhi�u ti�n ��n H�a kh� ph�ng nh�ng c�ng kh�ng r�n ���c m�n H�a kh� n�o c�. T�ng qu�n s�m nghe l�i ta ��u t� s� ti�n �� v�o �m kh� ph�ng c�a ta th� kh�ng ��n n�i n�y.",0)
	elseif	i == 2 then
		Say("Giang h� c� th�p ��i m�n ph�i nh�ng ph�i n�o l�i kh�ng s� �m kh� ���ng M�n ta.",0)
	else
		Say("Thi�n H�i h�c nhi�u hi�u r�ng, hi�u th�o v�i tr��ng b�i, t��ng lai s� tr� th�nh T�ng qu�n ��i k� ti�p.",0)
	end
end;