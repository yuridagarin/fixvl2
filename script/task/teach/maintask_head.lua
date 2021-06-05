
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ͷ�ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- Ұ��������������������¼
TEACH_STATE_ID = 806 -- �������״̬��1 Ϊ���ڽ�������2 Ϊ�Ѿ����������

-- �Ӻ��������Ի�ȡ��������Ľ�չ�̶�
function TE_GetTeachState()

	return GetTask(TEACH_SEASONNPC_ID)

end

-- �Ӻ������������ý�������Ľ�չ�̶�
function TE_SetTeachState(nValue)

	SetTask(TEACH_SEASONNPC_ID, nValue)

end

-- �Ӻ������õ����������״̬
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- �Ӻ��������ý��������״̬
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end

-- �Ӻ�������ȡ��������Ŀǰ���е�����һ��
-- ������ֵΪ�ڼ���
function TE_GetTeachLevel()

local nValue = GetTask(1);

	if (nValue >= 3) and (nValue < 7) then
		return 1
	elseif (nValue >= 8) and (nValue < 9) then
		return 2
	elseif (nValue >= 10) and (nValue < 11) then
		return 3
	elseif (nValue >= 12) and (nValue < 13) then
		return 4
	elseif (nValue >= 14) and (nValue < 18) then
		return 5
	elseif (nValue >= 19) and (nValue < 21) then
		return 6
	end

end


-- �Ӻ�����ʹ���������չ����һ��
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	Msg2Player("Nhi�m v� hi�n t�i:"..GetTask(TEACH_SEASONNPC_ID));
	return
end

-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	
