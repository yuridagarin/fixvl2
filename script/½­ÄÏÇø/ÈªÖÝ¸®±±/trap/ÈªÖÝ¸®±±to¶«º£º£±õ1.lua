--Ȫ�ݸ���to��������1.lua
--GGH

--�޸ģ�yanjun 05-12-27
--�޸�Ŀ�ģ�Ԫ������������������ӵ������TRAP�����ͼ
Include("\\script\\task\\world\\task_var_id.lua");

Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B�n �ang tham gia thi ��u �o�t c� T�t Nguy�n ��n, gi�a ���ng ��ng r�i kh�i khu v�c thi ��u!",0)
		return 0
	end
    if GetTask(TASK_YZ_FOUR) >= 1 then
    	NewWorld(103,1662,3036);
    	SetFightState(1);
    else
        Msg2Player("Ph�a tr��c r�t nguy hi�m, chi b�ng ��ng v�o n�a!");
    end;
end;
