--ͨ�����Ľ�һ���
Include("\\script\\task_access_code_def.lua")

--��¼�۽���Ŀ�������������λͭ��
PC_COIN_TASK = 3134;

--���Դ�����ʵ����������
function pc_back_originalserver_pay()
	local nTotalValue = GetTask(PC_COIN_TASK);
	if nTotalValue > 0 then
		if Pay(nTotalValue) == 1 then
			SetTask(PC_COIN_TASK, 0, TASK_ACCESS_CODE_KUAFU_DRAG);
			WriteLog(format("[pc_back_originalserver_pay]\t%s\t%s\t%d", GetAccount(), GetName(), nTotalValue));
		end
	end
end