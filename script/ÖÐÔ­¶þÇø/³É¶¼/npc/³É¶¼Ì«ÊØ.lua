--�ļ�˵��
--��ɶ�̫�ضԻ��Ľű�
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_THREE);
    
    if nStep == 2 then
        task_three_02_01();
        return
    elseif nStep == 3 then
        task_three_03_01();
        return
    end;

	i=random(1,4)

	if i==1 then 
		Talk(1,"","T� th�i nh� T�n L� B�ng ki�n �� Giang Y�n, l�c �� Th�nh �� l� v�ng ��t tr� ph� b�t ng�n, l� kho l��ng th�c c� thi�n h�. Nh�ng hi�n nay m�a m�ng th�t b�t, ta th�n l� Th�i Th� th�t h� th�n v�i b� t�nh l� d�n!")
	elseif i==2 then
		Talk(1,"","T� khi B�n �� S�n H� X� T�c b� v� ra th�nh m�nh, qu� qu�i Phong �� t�c y�u t�c qu�i, may nh� c�c n� hi�p Nga My x� th�n li�u m�ng, Th�nh �� m�i kh�ng b� hoang ph�!")
	elseif i==3 then
		Talk(1,"","Th�i cu�c bi�n lo�n, hy v�ng s�m c� ch�n anh h�ng �� b�nh �n thi�n h� c�u n�n b� t�nh!")
	else
		Talk(1,"","Con ���ng ph�a ��ng Th�nh �� �� b� phong t�a, b� t�nh ra ngo�i th�nh h�y c�n th�n!")
	end

end;