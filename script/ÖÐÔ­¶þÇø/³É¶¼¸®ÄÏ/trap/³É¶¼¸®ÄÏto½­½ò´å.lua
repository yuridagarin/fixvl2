--�ɶ�����to�����
--GGH

--�޸ģ�yanjun 05-12-27
--�޸�Ŀ�ģ�Ԫ������������������ӵ������TRAP�����ͼ
Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B�n �ang tham gia thi ��u �o�t c� T�t Nguy�n ��n, gi�a ���ng ��ng r�i kh�i khu v�c thi ��u!",0)
		return 0
	end
UWorld1402 = GetTask(1402)
if ( UWorld1402 >= 10 )  then
	NewWorld(306, 1332 ,2843)
	SetFightState(1);
else
	Talk(1,"","Ph�a tr��c y�u ma hung �c, hay l� ��n Th�nh �� g�p n�n d�n c�a Giang T�n Th�n t�m hi�u t�nh h�nh!")
end
end;
