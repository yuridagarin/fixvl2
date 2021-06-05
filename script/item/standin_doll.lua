Include("\\script\\global\\mate_head.lua");
Include("\\script\\lib\\time.lua");
ITEM_LIANLIGUO 	 = {2, 1, 534}	-- �����

-- ��������Ͷ�Ӧ�ľ���������
CHUNHUNGUO_TYPE_SCALE = {
	[1] = 2,	--50%������
	[2] = 1,	--100%������
}

-- ���������޼Ӿ���
function AddExp(exp)
	local doll_exp = GetTask(TASKVAR_DOLLEXP)
	SetTask(TASKVAR_DOLLEXP, doll_exp + exp)
end

-- �޸�����״̬���������ɾ�����Ʒ��ɱ����������
function FinishDoll()
	local type = floor(GetTask(TASKVAR_DOLLTIME) / DOLL_TIME_LIMIT)
	local nDollExp = GetTask(TASKVAR_DOLLEXP);
	SetTask(TASKVAR_DOLLTIME, 0)
	SetTask(TASKVAR_DOLLEXP, 0)
	SetTask(TASK_DOLL_ACTIVE,0);
	-- �޸�����״̬����
	ActivateDoll(0)
	
	-- ɱ����������
	KillFollower()
	if type > 2 or type <= 0 then
		WriteLog("[K�t h�n b�o l�i]:"..GetName().."Tr�ng th�i b� l�i. GetTask(2013):"..GetTask(TASKVAR_DOLLTIME));
		return 0;
	end;
	local doll_exp = floor( nDollExp/CHUNHUNGUO_TYPE_SCALE[type])
	-- ���������
	if (doll_exp > 0) then
		local res, item = AddItem(ITEM_LIANLIGUO[1], ITEM_LIANLIGUO[2], ITEM_LIANLIGUO[3], 1)
		if (res ~= 0) then
			local mate_code = UnsignedHash(GetMateName())
			local self_code = UnsignedHash(GetName())
			--local mate_code = Hash(GetMateName())
			--local self_code = Hash(GetName())
			SetItemParam(item, 0, doll_exp)		-- ����ֵ
			SetItemParam(item, 1, mate_code)	-- ��ż���ֱ���
			SetItemParam(item, 2, self_code)	-- �Լ����ֱ���
		end
	end
	WriteLog("[K�t h�n]:"..GetName().."1 Li�n L� qu� ch�a:"..doll_exp);
end

-- �����������ʱ���Ƿ񵽻�����ż�Ƿ����ߣ���������޸�����״̬���������ɾ�����Ʒ��ɱ����������
function UpdateTime(interval)
	local doll_time = GetTask(TASKVAR_DOLLTIME)
	local type = floor(doll_time / DOLL_TIME_LIMIT)
	doll_time = mod(doll_time, DOLL_TIME_LIMIT)
	
	if (doll_time > interval) then
		doll_time = doll_time - interval
		SetTask(TASKVAR_DOLLTIME, doll_time + DOLL_TIME_LIMIT * type)
		if mod(doll_time,10*60) == 0 then	--10���ӱ�һ��ʣ��ʱ��
			Msg2Player("Hi�u qu� b�p b� th� th�n c�n"..tf_GetTimeString(doll_time));
		end;
	else
		FinishDoll()
	end
end
