--�ɶ�����to�ɶ�
--GGH

--�޸ģ�yanjun 05-12-27
--�޸�Ŀ�ģ�Ԫ������������������ӵ������TRAP�����ͼ
Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B�n �ang tham gia thi ��u �o�t c� T�t Nguy�n ��n, gi�a ���ng ��ng r�i kh�i khu v�c thi ��u!",0)
		return 0
	end
	if(GetPKValue() <= 3 ) then
		NewWorld(300, 1627 ,3732)
		SetFightState(0);
	else
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")
	end	
end;