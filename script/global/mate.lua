Include("\\script\\item\\standin_doll.lua");
Include("\\script\\global\\mate_head.lua");

-- ��ż�����¼�
function OnMateOnline()
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- ��ż�����¼�
function OnMateOffline()
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- ����¼�
function OnDivorce()
	-- DEBUG
	print("OnDivorce")
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

function UpdateLove(interval)	--һ���ӵ���һ��
	-- �����ż���߻�����ʹ���������ޣ���ʱ����ͬ��ֵ
	if (GetMateOnlineStatus() == 1 or
		IsDollActive() == 1) then
		local time = GetTask(TASK_INCLOVE_TIME)
		local same_heart_value_max = GetTask(2023)
		time = time + interval
		if (time >= INTERVAL_INCLOVE) then
			local love = GetTask(TASK_LOVEGRADE) + VALUE_INCCLOVE
			if (love > MAX_LOVEGRADE) then
				SetTask(TASK_INCLOVE_TIME, 0)
				return
			end
			-- DEBUG
			print(format("T�ng [%s] tr� ��ng t�m: %d", GetName(), love))
			SetTask(TASK_LOVEGRADE, love)
			SetTask(TASK_INCLOVE_TIME, 0)
		else
			SetTask(TASK_INCLOVE_TIME, time)
		end
	end
end
