--�ű����ƣ�IB���Ļص�
--�ű����ܣ������IB�����Ժ󣬽���ҵ�IB���ѽ��а��µ�ͳ��
--�߻��ˣ�ǿ��
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2008-01-12
--�����޸ļ�¼��
Include("\\script\\task_access_code_def.lua")

	IB_cost_month_seq = 1418
	IB_cost_num = 1419
	
	IB_cost_cur_month=3196

function ib_status_relay_ret(price)
	local nIBCostCurMonth = GetTask(IB_cost_cur_month)
	if nIBCostCurMonth < 2100000000 then
		local nIBCostCurMonthNew = nIBCostCurMonth+price
		SetTask(IB_cost_cur_month, nIBCostCurMonthNew, TASK_ACCESS_CODE_MONTHLY_IB)
	end
	--local month_seq_saved = GetTask(IB_cost_month_seq)
	--local month_seq_now = tonumber(date("%Y%m"))
	--if month_seq_now > month_seq_saved then
		--SetTask(month_seq_saved,month_seq_now)
		--SetTask(IB_cost_num,price)
	--else
		SetTask(IB_cost_num,(GetTask(IB_cost_num)+price))
	--end
end
