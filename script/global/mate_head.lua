DOLL_TIME_LIMIT		= 10000000;		-- �������޵�ʹ��ʱ�������
TASKVAR_DOLLTIME 	= 2013			-- ����������������޵�ʹ��ʣ��ʱ�䣨�룩
TASKVAR_DOLLEXP	 	= 2014			-- ����������������޵ľ��飨δ���԰ٷֱȣ�
TASK_LOVEGRADE 		= 2015			-- ���������ͬ��ֵ
TASK_MARRYDATE		= 2016			-- ���������������ڣ���� * 600 + �·� * 40 + ���ڣ�
TASK_MATESTYLE		= 2017			-- �����������ż����
TASK_DECLOVE_TIME	= 2020			-- �����ϴο۳�ͬ��ֵ������ʱ��
TASK_INCLOVE_TIME 	= 2021			-- �����ۼƵķ�ͬʱ����ʱ��
TASK_DOLL_ACTIVE	= 2022			-- ��ʾ��ǰ�Ƿ���ʹ���������ޣ���¼����ʹ�ó������ʱ��
TMPV_DECLOVE_TIME	= 0				-- �����ʱ�����������ϴο۳�ͬ��ֵ������ʱ��
TMPV_INCLOVE_TIME	= 1				-- �����ʱ�����������ۼƵķ�ͬʱ����ʱ��
VALUE_DECLOVE		= 4				-- ÿ�ο۳���ͬ��ֵ
VALUE_INCCLOVE		= 1				-- ÿ�����ӵ�ͬ��ֵ
INTERVAL_INCLOVE	= 15 * 60		-- �ۼ�ͬ��ֵ��ʱ�������룩
MAX_LOVEGRADE		= 500			-- ͬ��ֵ�����ֵ
DOLL_TIME			= 2*3600			-- �������޵�ʹ��ʱ�䣨�룩

SFX_DOLL			= 949			-- ����������ЧID

function encode_datetime(year, mon, day)
	return year * 1000 + mon * 40 + day 
end

-- ����ͬ��ֵ
function dec_lovegrade(datetime, player, value)
	if (GetTask(TASK_DECLOVE_TIME,player) < datetime) then	--�Է������ʱ����ʱ�䲻һ����ɶ��
		local grade = GetTask(TASK_LOVEGRADE, player)
		if (grade ~= 0) then
			if (grade >= value) then
				grade = grade - value
			else
				grade = 0
			end
			SetTask(TASK_LOVEGRADE, grade, 0, player)
			SetTask(TASK_DECLOVE_TIME,datetime, 0, player);
		end
	end
end