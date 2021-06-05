--Խ�ϰ��õ��ű�
--by vivi
--2008/03/05

Include("\\script\\online\\march08\\march08_head.lua");

function OnUse()
	if check_rose_date() ~= 1 then
		return
	end
	
	local nLv = GetLevel();
	local nHongNum = GetTask(TASK_MARCH_HONG);
	local nFenhongNum = GetTask(TASK_MARCH_FENHONG);
	local nExp = nHongNum*HONG_EXP+nFenhongNum*FENHONG_EXP;
	
	if nLv < 11 then
		Talk(1,"","Nh�n v�t c�p 10 tr� l�n m�i c� th� s� d�ng hoa h�ng.");
		return
	end
	if nExp >= TOTAL_EXP then
		Talk(1,"","M�i nh�n v�t ch� c� th� th�ng qua ho�t ��ng n�y nh�n ���c t�i �a 10.000.000 �i�m kinh nghi�m.");
		return
	end
	if DelItem(2,0,1162,1) == 1 then
		ModifyExp(HONG_EXP);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..HONG_EXP.."Kinh nghi�m");
		SetTask(TASK_MARCH_HONG,GetTask(TASK_MARCH_HONG)+1);
	end
end