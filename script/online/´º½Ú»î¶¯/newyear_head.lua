Include("\\script\\lib\\globalfunctions.lua");
NEWYEAR_SWITCH = 1	--���ڻ���ء�1Ϊ����0Ϊ��
--ȫ�ֱ�������
GLB_PRESENT_NUM_BJ	= 4580	--������¼�꾩�������ϵ���������
GLB_PRESENT_NUM_CD	= 4581	--������¼�ɶ��������ϵ���������
GLB_PRESENT_NUM_QZ	= 4582	--������¼Ȫ�ݸ������ϵ���������
--ȫ�ֳ���
TITLE_GENRE = 4	--�ƺ������ͱ��


XIAONIANSHOU_COUNT = 30;	--С���޵�����
--�������
TASK_GOT_NIANSHOU = 2359	--��¼��һ��С���������ʱ��
TITLE_OLD_DETAILTYPE = 2360	--������¼���ǰһ�����ڳƺ�
TASKID_OPEN_LITTER_GIFT = 2360 -- ��¼С���ʹ��ʱ��(Խ��)
TASK_GOT_JIAOZI = 2361	--������¼��ҵ��������Ƿ���ȡ������
TASK_GOT_PRESENT = 2362	--������¼��ҵ����Ƿ���ȡ����������
TASK_PET_BORN = 2363	--������¼����ĳ���ʱ��
TASK_GOT_BOX = 2364	--������¼�����ӵ�ʱ�� 
TASK_GOT_LIBAO	= 2365	--������¼��ҵ����Ƿ���ȡ�������
TASK_GOT_SNOWBALL = 2366	--������¼����Ƿ��ڽ�ѩ�̳��ص�ʱ����ȡ��ѩ��
TASK_EAT_NIANGAO	= 2367	--������¼��ҳ��������
TASK_EAT_SANXIAN	= 2368	--������¼��ҳ��˶��ٸ��������
--��ʱ�������

DATE_SPRING_START = 20080126
DATE_SPRING_END = 20080217

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

function Check_Date()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < DATE_SPRING_START then
		return -1;	--ʱ��δ��
	elseif nDate > DATE_SPRING_END then
		return 1;	--ʱ���ѹ�
	else
		return 0;	--�������
	end;
end;

function is_spring_2008_date_viet()
	local ndate = tonumber(date("%Y%m%d"));
	if ndate < DATE_SPRING_START or ndate > DATE_SPRING_END then
		return 0
	else
		return 1
	end
end
