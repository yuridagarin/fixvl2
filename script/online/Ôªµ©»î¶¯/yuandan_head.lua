YUANDAN_SWITCH = 0 --Ԫ�����տ��أ�1Ϊ����0Ϊ��

--������ȫ�ֱ���
ID_FLAG_NUMBER_CD = 4570	--������¼�Ͻ������ӵ���Ŀ���ɶ����ϣ�
ID_FLAG_NUMBER_BJ = 4571	--������¼�Ͻ������ӵ���Ŀ���꾩���ϣ�
ID_FLAG_NUMBER_QZ = 4572	--������¼�Ͻ������ӵ���Ŀ��Ȫ�ݸ�����

--�������������
TASK_FLAG_HANDUP = 2350	--������¼�Ƿ��Ͻ�������
--��������ʱ�������
TASK_FLAG_FOLLOW = 111	--������¼�Ƿ��������
MAP_ID 	= 112
MAP_X	= 113
MAP_Y	= 114

function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function GetCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function GetCurMonth()
	nMonth = date("%m")
	return tonumber(nMonth)
end