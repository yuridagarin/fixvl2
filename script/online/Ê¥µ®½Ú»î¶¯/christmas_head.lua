CHRISTMAS_SWITCH = 0	--����أ�1Ϊ����0Ϊ��

--ȫ�ֱ���ʹ��(���ܴ���5000)
ID_PRESENT_NUMBER_CD = 4560 --��������ɶ�ʥ�����ϵ��������� 
ID_PRESENT_NUMBER_BJ = 4561 --���������꾩ʥ�����ϵ��������� 
ID_PRESENT_NUMBER_QZ = 4562 --��������Ȫ��ʥ�����ϵ��������� 
--�������ʹ��(���ܴ���2560)
TASK_GOT_PRESENT = 2340	--��������Ƿ���ȡ������
TASK_GOT_DATE = 2341	--������¼��ȡ���������
TASK_GOT_HAT = 2342	--������¼�Ƿ���ȡ��ʥ��ñ

function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function GetCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end