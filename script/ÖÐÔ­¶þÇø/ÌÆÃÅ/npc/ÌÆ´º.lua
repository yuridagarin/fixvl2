
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ����ʦ������Ľű�ͷ�ļ�
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    end;

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==2) then
		task_005();
		return
	elseif (nTaskValue==3) then
		task_006();
		return
	elseif (nTaskValue<8) then
		Say("Ng��i ��n C� quan ph�ng h�i ���ng V�n xem s� H�a C�t T�n n�y d�ng th� n�o m�i c� hi�u qu�.",0);
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("Ch� c�n l� ��c d��c nh�t ��nh c� thu�c gi�i. Ch� s� ��c t�nh qu� cao kh�ng k�p kh�c ch� th�i.",0)
		elseif	i == 2 then
			Say("C�ch h� ��c c�a Ng� ��c r�t ��c bi�t, n�u kh�ng ph�i m�n quy nghi�m ng�t ta �� b�t v�i t�n �� t� Ng� ��c v� �� tra h�i.",0)
		else
			Say("Kh�ng ph�i l� �� t� ���ng M�n ��ng h�ng ta cho thu�c gi�i ��c.")
		end
	end
	
end;

