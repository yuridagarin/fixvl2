Include("\\script\\task_access_code_def.lua")

--����һ��CheckAndDoRegularClear(nType)����lua�ӿ�Ҳ�ǿ��Թ��߼����õģ�����ˢ�¶������������
--�����EM_REGULAR_CLEAR_TYPEƥ��
_EM_REGULAR_CLEAR_TYPE_NONE = 0
_EM_REGULAR_CLEAR_TYPE_ALL = _EM_REGULAR_CLEAR_TYPE_NONE
EM_REGULAR_CLEAR_TYPE_DAILY = 1
EM_REGULAR_CLEAR_TYPE_WEEKLY = 2
_EM_REGULAR_CLEAR_TYPE_COUNT = 3

-----------------------------------------------------------------------
--�ṩ���ű���ʵʱ��������ӿ�,����Щ�ӿ�ȡ�õ�����������ǻᶨ�������
function rc_GetDailyTask(nIndex)--�����GetDailyTask(nIndex)������ȫһ��
	local nType = EM_REGULAR_CLEAR_TYPE_DAILY
	return _rc_GetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nType)
end

function rc_SetDailyTask(nIndex, nValue)--�����SetDailyTask(nIndex, nValue)������ȫһ��
	local nType = EM_REGULAR_CLEAR_TYPE_DAILY
	return _rc_SetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nValue, nType)
end

function rc_GetWeeklyTask(nIndex)
	local nType = EM_REGULAR_CLEAR_TYPE_WEEKLY
	return _rc_GetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nType)
end

function rc_SetWeeklyTask(nIndex, nValue)
	local nType = EM_REGULAR_CLEAR_TYPE_WEEKLY
	return _rc_SetRegularClearTaskFromGroup(t_RegularClearTaskGroups[nType], nIndex, nValue, nType)
end
-----------------------------------------------------------------------


function _rc_GetRegularClearTaskFromGroup(tGroup, nIndex, nType)
	if not tGroup then
		assert(1==0)
		return
	end
	CheckAndDoRegularClear(nType)
	if nIndex >= 1 and nIndex <= getn(tGroup) then
		return GetTask(tGroup[nIndex][1])
	else
		--print(format("_rc_GetRegularClearTaskFromGroup(nIndex=%d, nType=%d) max=%d, nIndex invalid", nIndex, nType, getn(tGroup)))
		return 0
	end
end

function _rc_SetRegularClearTaskFromGroup(tGroup, nIndex, nValue, nType)
	if not tGroup then
		assert(1==0)
		return
	end
	CheckAndDoRegularClear(nType)
	if nIndex >= 1 and nIndex <= getn(tGroup) then
		return SetTask(tGroup[nIndex][1], nValue, tGroup[nIndex][2])
	else
		--print(format("_rc_SetRegularClearTaskFromGroup(nIndex=%d, nValue = %d, nType=%d) max=%d, nIndex invalid", nIndex, nValue, nType, getn(tGroup)))
		return 0
	end
end
-----------------------------------------------------------------------


-----------------------------------------------------------------------
--�ڲ���һЩ���ݶ���
--ÿ����������������
_t_DailyClearTaskIdGroup =
{
	{2914, TASK_ACCESS_CODE_DAILY_TASK},
	{2915, TASK_ACCESS_CODE_DAILY_TASK},
	{2916, TASK_ACCESS_CODE_DAILY_TASK},
	{2917, TASK_ACCESS_CODE_DAILY_TASK},
	{2918, TASK_ACCESS_CODE_DAILY_TASK},
	{2919, TASK_ACCESS_CODE_DAILY_TASK},
}

--ÿ����������������
_t_WeeklyClearTaskIdGroup =
{
    {3082, TASK_ACCESS_CODE_DAILY_TASK},
    {3083, TASK_ACCESS_CODE_DAILY_TASK},
    {3084, TASK_ACCESS_CODE_DAILY_TASK},
    {3085, TASK_ACCESS_CODE_DAILY_TASK},
    {3086, TASK_ACCESS_CODE_DAILY_TASK},
}

--ÿ����������������
_t_MonthClearTaskIdGroup =
{
	{3230, TASK_ACCESS_CODE_DAILY_REGISTRATION},
}

t_RegularClearTaskGroups = 
{
	_t_DailyClearTaskIdGroup,
	_t_WeeklyClearTaskIdGroup,
}

--Ŀ��������� ��������û����
_t_DailyClearTaskIdGroup = nil
_t_WeeklyClearTaskIdGroup = nil
-----------------------------------------------------------------------