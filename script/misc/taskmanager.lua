Include("\\script\\lib\\globalfunctions.lua")

local TaskGroup = {}
TaskManager = {}
TaskManager.tbUseGroup = {}
TaskManager.tbTaskGroup = 
{
	[1] = 
	{
		-- date:2011-02-25 00:00~2011-03-28 00:00	2�»
		-- date:2011-03-12 00:00~2011-04-30 00:00	��������
		-- date:2011-06-15 00:00~2011-07-11 00:00	2011summer holiday
		-- date:2011-07-15 00:00~2011-08-21 00:00	7������ѩ��
		-- date:2011-08-26 00:00~2011-10-03 00:00	8�������±�
		-- date:2011-10-07 00:00~2011-11-06 00:00	10�»
		-- date:2011-11-11 00:00~2011-12-13 00:00	11���׻��
		-- date:2011-12-30 00:00~2012-01-08 00:00	Ԫ���
		-- date:2012-02-10 00:00~2012-03-05 00:00	2�����˽ڻ
		-- date:2012-06-15 00:00~2012-07-16 00:00 6���Ͻ�ˮ���
		-- date:2012-10-26 00:00~2012-11-12 00:00 ׷�ش������ --����ʱ��μ�\script\online\dazitie\dzt_head.lua
		-- date:2013-02-14 00:00~2013-02-28 00:00 2013�����˽ڻ
		-- date:2013-05-17 00:00~2013-06-15 00:00 ��ɢ���
		-- date:2013-10-05 00:00~2013-10-18 00:00 �ؿ�ǧѰ��� --ʱ����\script\online\qianhe_tower\qht_head.lua����Ϊ׼
		-- date:2014-02-13 00:00~2014-02-16 00:00 2014��1�¸��3
		-- date:2014-04-18 00:00~2014-05-12 00:00 2014��4�»
		-- ������ʱ��ο�\script\function\invite_code\ic_define.lua
		-- date:2014-09-22 00:00~2014-09-29 00:00 �ڵ��߲����
		nCurrentVersion = 18,
		nVersionTask = 2761,
		tbTaskSet = {2762,2763,2764,2765,2766,2767,2768,2769,2770,2771},
	},
	[2] = 
	{
		-- date:2011-02-25 00:00~2011-03-28 00:00	2�»
		-- date:2011-03-12 00:00~2011-04-30 00:00	��������
		-- date:2011-07-15 00:00~2011-08-21 00:00	7������ɫ��
		-- date:2011-08-26 00:00~2011-10-03 00:00	8�¿��±�
		-- date:2011-10-07 00:00~2011-11-06 00:00	����ɫ��
		-- date:2011-11-11 00:00~2011-12-13 00:00	�ͻ��
		-- date:2011-12-30 00:00~2012-01-08 00:00	ʥ���ڻ
		-- date:2012-03-09 00:00~2012-04-09 00:00	���ʸ�Ů��
		-- date:2012-07-20 00:00~2012-08-13 00:00	�ຣ�
		-- date:2012-11-16 00:00~2012-12-17 00:00	��ʦ�ڻ
		-- date:2013-03-08 00:00~2013-04-15 00:00	���ʸ�Ů�ڻ
		-- date:2013-06-14 00:00~2013-07-15 00:00	�������
		-- date:2013-10-18 00:00~2013-11-11 00:00	10�����
		-- date:2014-01-30 00:00~2014-02-07 00:00	2014��1�¸��4
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014��4�¸��
		-- date:2014-07-04 00:00~2014-08-01 00:00	2014��7�»
		-- date:2014-10-04 00:00~2014-11-01 00:00	2014��10�»
		nCurrentVersion = 17,
		nVersionTask = 2781,
		tbTaskSet = {2782,2783,2784,2785,2786,2787,2788,2789,2790,2791},
	},
	[3] = 
	{
		-- date:2011-04-22 00:00~2011-05-30 00:00 ����ռ���
		-- date:2011-08-26 00:00~2011-10-03 00:00 8�µƻ�
		-- date:2011-11-11 00:00~2011-12-13 00:00 ��ʦ�ڻ
		-- date:2011-12-30 00:00~2012-01-08 00:00 ʥ���ڸ��
		-- date:2012-03-12 00:00~2012-04-09 00:00	���ʸ�Ů��
		-- date:2012-07-20 00:00~2012-08-13 00:00	������ϯ�
		-- date:2012-11-16 00:00~2012-12-17 00:00	��ʦ�ڸ��
		-- date:2013-06-14 00:00~2013-07-15 00:00	���ʶ�ͯ��
		-- date:2013-10-18 00:00~2013-11-11 00:00	10�¸��
		-- date:2014-01-31 00:00~2014-01-15 00:00	�з����ڻ\script\online\spring2014\sp_define.lua
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014��4�¸��1
		-- date:2014-07-04 00:00~2014-08-01 00:00	2014��7�¸��
		-- ������ʱ��ο�\script\function\invite_code\ic_define.lua
		nCurrentVersion = 14,
		nVersionTask = 2801,
		tbTaskSet = {2802,2803,2804,2805,2806,2807,2808,2809,2810,2811},
	},
	[4] = 
	{
		-- date:2011-08-26 00:00~2011-10-03 00:00 8�µƻ�-����
		-- date:2011-11-11 00:00~2011-12-13 00:00 �ֻ��
		-- date:2011-12-30 00:00~2012-01-08 00:00 ʥ��������
		-- date:2012-04-13 00:00~2012-05-06 00:00 ��������
		-- date:2012-08-17 00:00~2012-09-10 00:00 ������Т�
		-- date:2012-12-21 00:00~2013-01-21 00:00 ʥ���
		-- date:2013-04-19 00:00~2013-05-13 00:00 �Ͷ��ڻ
		-- date:2013-07-19 00:00~2013-08-19 00:00 7�»
		-- date:2013-11-15 00:00~2013-12-16 00:00	11�����
		-- date:2014-02-21 00:00~2014-03-17 00:00	2014��2�»
		-- date:2014-04-18 00:00~2014-05-12 00:00	2014��4�¸��2
		--CDKey�\script\function\cdkey\ck_define.lua
		nCurrentVersion = 13,
		nVersionTask = 2821,
		tbTaskSet = {2822,2823,2824,2825,2826,2827,2828,2829,2830,2831},
	},
	[5] = 
	{
		-- date:2011-12-30 00:00~2012-01-08 00:00 װ��ʥ�����
		-- date:2012-04-13 00:00~2012-05-06 00:00 �����
		-- date:2012-08-17 00:00~2012-09-10 00:00 ��ʳ�̻
		-- date:2012-12-21 00:00~2013-01-21 00:00 ʥ�����
		-- date:2013-04-19 00:00~2013-05-13 00:00 ������ػ
		-- date:2013-07-19 00:00~2013-08-19 00:00 7�¸��
		-- date:2013-11-15 00:00~2013-12-16 00:00	11�¸��
		-- date:2014-02-21 00:00~2014-03-21 00:00	2014��2�¸��1
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014��5�»
		-- date:2014-08-08 00:00~2014-09-01 00:00	2014��8�»
		-- date:2014-10-05 00:00~2014-11-01 00:00	2014��10�¸��
		nCurrentVersion = 11,
		nVersionTask = 2841,
		tbTaskSet = {2842,2843,2844,2845,2846,2847,2848,2849,2850,2851},
	},
	[6] = 
	{
		-- date:2012-01-13 00:00~2012-02-20 00:00 ���ڻ
		-- date:2012-04-13 00:00~2012-05-06 00:00 �����
		-- date:2012-09-14 00:00~2012-10-08 00:00 ����ڻ
		-- date:2012-12-21 00:00~2013-01-21 00:00 ����
		-- date:2013-xx-xx 00:00~2013-xx-xx 00:00 �������ռ����ƻ
		-- date:2013-08-23 00:00~2013-09-16 00:00 8�»
		-- date:2013-12-20 00:00~2014-01-13 00:00	12�����
		-- date:2014-02-21 00:00~2014-03-21 00:00	2014��2�¸��2
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014��5�¸��
		-- date:2014-08-08 00:00~2014-09-01 00:00	2014��8�¸��
		-- date:2014-10-04 00:00~2014-11-01 00:00	2014��10�¸��
		nCurrentVersion = 11,
		nVersionTask = 2772,
		tbTaskSet = {2777,2778,2779,2780,2792,2793,2794,2795,2796,2797},
	},
	[7] = 
	{
		-- date:2012-01-23 00:00~2012-02-02 00:00 �����������ǻ
		-- date:2012-05-11 00:00~2012-06-11 00:00 ������ٻ
		-- date:2012-09-14 00:00~2012-10-08 00:00 ����ڸ��
		-- date:2012-12-21 00:00~2013-01-21 00:00 ʥ�����
		-- date:2013-05-17 00:00~2013-06-10 00:00 ���������
		-- date:2013-08-23 00:00~2013-09-16 00:00 8�¸��
		-- date:2013-12-20 00:00~2014-01-13 00:00	12�¸��
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014��3�»
		-- date:2014-05-09 00:00~2014-06-01 00:00	2014��5�¸��
		-- date:2014-08-22 00:00~2014-09-08 00:00 ǧѰ��� --ʱ����\script\online\qianhe_tower\qht_head.lua����Ϊ׼
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014��11�»
		nCurrentVersion = 10,
		nVersionTask = 2773,
		tbTaskSet = {2798,2799,2800,2812,2813,2814,2815,2816,2817,2818},
	},
	[8] = 
	{
		-- date:2012-02-10 00:00~2012-02-20 00:00 ���˽ڻ
		-- date:2012-05-11 00:00~2012-06-11 00:00 ������ٻ
		-- date:2012-09-14 00:00~2012-10-08 00:00 ǧѰ��� --ʱ����\script\online\qianhe_tower\qht_head.lua����Ϊ׼
		-- date:2012-12-21 00:00~2013-01-21 00:00 С����
		-- date:2013-05-17 00:00~2013-06-10 00:00 ����õ��
		-- date:2013-09-19 00:00~2013-10-13 00:00 9�����
		-- date:2014-01-17 00:00~2014-02-17 00:00 2014��1�����
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014��3�¸��
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014��6�»
		-- date:2014-09-05 00:00~2014-10-01 00:00 2014��9�»
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014��11�¸��
		nCurrentVersion = 11,
		nVersionTask = 2774,
		tbTaskSet = {2819,2820,2832,2833,2834,2835,2836,2837,2838,2839},
	},
	[9] = 
	{
		-- date:2012-01-13 00:00~2012-02-02 00:00 �������̹��
		-- date:2012-06-15 00:00~2012-07-16 00:00 6�»
		-- date:2012-10-12 00:00~2012-11-12 00:00 ��Ů�ڻ
		-- date:2013-01-25 00:00~2013-02-25 00:00 ���ڻ
		-- date:2013-05-17 00:00~2013-06-10 00:00 ���������
		-- date:2013-09-19 00:00~2013-10-13 00:00 9�¸��
		-- date:2014-01-17 00:00~2014-02-17 00:00 2014��1�¸��1
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014��3�¸��1
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014��6�¸��
		-- date:2014-09-05 00:00~2014-10-01 00:00 2014��9�¸��
		-- date:2014-11-07 00:00~2014-12-01 00:00	2014��11�¸��
		nCurrentVersion = 11,
		nVersionTask = 2775,
		tbTaskSet = {2840,2852,2853,3051,3052,3053,3054,3055,3056,3057},
	},
	[10] = 
	{
		-- date:2012-01-13 00:00~2012-02-20 00:00 ���ڻ���
		-- date:2012-06-15 00:00~2012-07-16 00:00 6���л������
		-- date:2012-10-12 00:00~2012-11-12 00:00 ��Ů�ڸ��
		-- date:2013-01-25 00:00~2013-02-25 00:00 ÷��ӭ��
		-- date:2013-05-24 00:00~2013-06-14 00:00 ���������
		-- date:2013-09-19 00:00~2013-10-13 00:00 9�¸��
		-- date:2014-01-25 00:00~2014-02-09 00:00 2014��1�¸��2
		-- date:2014-03-21 00:00~2014-04-14 00:00	2014��3�¸��2
		-- date:2014-06-06 00:00~2014-07-01 00:00	2014��6�¸��
		-- \script\online_activites\201409\huadeng.lua 2014��9�����ﻨ��
		nCurrentVersion = 10,
		nVersionTask = 2776,
		tbTaskSet = {3058,3059,3060,3061,3062,3063,3064,3065,3066,3067},
	},
}

--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId)
	return GetTask(self:GetTaskId(nGroupId, nIndex))
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetTask(self:GetTaskId(nGroupId, nIndex), nValue)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:AddTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex)
	return SetTask(nTaskId, GetTask(nTaskId) + nValue)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetDailyTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId);
	local nTaskValue =  GetTask(self:GetTaskId(nGroupId, nIndex));
	local nCurDate = tonumber(date("%y%m%d"));
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256;
		SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue);
	end
	return mod(nTaskValue, 256);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetDailyTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId);
	local nCurDate = tonumber(date("%y%m%d"));
	local nTaskValue =  nCurDate * 256;
	return SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue + nValue);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:AddDailyTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId);
	local nTaskValue =  GetTask(self:GetTaskId(nGroupId, nIndex));
	local nCurDate = tonumber(date("%y%m%d"));
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256;
		SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue);
	end
	return SetTask(self:GetTaskId(nGroupId, nIndex), nTaskValue + nValue);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetTaskBit(nGroupId, nIndex, nBitPos)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return SafeGetBit(GetTask(nTaskId), nBitPos);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetTaskBit(nGroupId, nIndex, nBitPos, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return SetTask(nTaskId, SafeSetBit(GetTask(nTaskId), nBitPos, nValue));
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetTaskByte(nGroupId, nIndex, nByteIndex)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetTaskByte(nTaskId,nByteIndex);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetTaskByte(nGroupId, nIndex, nByteIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetTaskByte(nTaskId,nByteIndex,nValue);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetMyTaskByte(nGroupId, nIndex, nByteIndex1, nByteIndex2)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetMyTaskByte(nTaskId,nByteIndex1,nByteIndex2);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetMyTaskByte(nGroupId, nIndex, nByteIndex1, nByteIndex2, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetMyTaskByte(nTaskId,nByteIndex1,nByteIndex2,nValue)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetMyTaskBit(nGroupId, nIndex, nBitIndex1, nBitIndex2)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_GetMyTaskBit(nTaskId,nBitIndex1,nBitIndex2);
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetMyTaskBit(nGroupId, nIndex, nBitIndex1, nBitIndex2, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex);
	return gf_SetMyTaskBit(nTaskId,nBitIndex1,nBitIndex2,nValue)
end

--��ȡĳ�������������������Id
function TaskManager:GetTaskId(nGroupId, nIndex)

	if type(self:GetGroupTaskTable(nGroupId)[nIndex]) ~= "number" then
		return error(format("tbTaskGroup[%s].tbTaskSet[%s] is not a number", nGroupId, nIndex))
	end
	
	return self.tbTaskGroup[nGroupId].tbTaskSet[nIndex]
end
--��ȡ�鵱ǰ�汾��
function TaskManager:GetCurrentVersion(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nCurrentVersion) ~= "number" then
		return error(format("tbTaskGroup[%s].nCurrentVersion is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nCurrentVersion
end


--���ĳ�����������������������
function TaskManager:GetGroupTaskTable(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	if type(self.tbTaskGroup[nGroupId].tbTaskSet) ~= "table" then
		return error(format("tbTaskGroup[%s].tbTaskSet is not a table", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].tbTaskSet
end




--���ĳ�����������İ汾���������Id
function TaskManager:GetVersionTaskId(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nVersionTask) ~= "number" then
		return error(format("tbTaskGroup[%s].nVersionTask is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nVersionTask
end

--������������İ汾���Ƿ�һ��
function TaskManager:CheckTaskGroup(nGroupId)
	if GetTask(self:GetVersionTaskId(nGroupId)) == self:GetCurrentVersion(nGroupId) then
		return 1
	end
end

--����һ���������
function TaskManager:ResetTaskGroup(nGroupId)
	if self:CheckTaskGroup(nGroupId) ~= 1 then
		SetTask(self:GetVersionTaskId(nGroupId), self:GetCurrentVersion(nGroupId))
		for i=1, getn(self:GetGroupTaskTable(nGroupId)) do
			SetTask(self:GetTaskId(nGroupId, i), 0)
		end
	end
end

--������ʹ�ñ��õ����������
function TaskManager:ResetUseGroup()
	for nGroupId, bUse in self.tbUseGroup do
		if bUse == 1 then
			self:ResetTaskGroup(nGroupId)
		end
	end
end

--���һ�����������ʹ������
function TaskManager:AddUseGroup(nGroupId)
	if self.tbUseGroup[nGroupId] == 1 then
		return
	end
	self.tbUseGroup[nGroupId] = 1
end

--���Լ����û����д�ظ���TaskId
function TaskManager:DebugCheck()
	local tbFlag = {}
	local tbGroup = TaskManager.tbTaskGroup
	
	for i=1, getn(tbGroup) do
		local Group = tbGroup[i]
		local nId = Group.nVersionTask
		
		if tbFlag[nId] then
			error(format("%d, %d",i, nId))
		else
			tbFlag[nId] = 1
		end
		
		for j=1, getn(Group.tbTaskSet) do 
			local nId = Group.tbTaskSet[j]
			if tbFlag[nId] then
				error(format("%d, %d, %d",i, j, nId))
			else
				tbFlag[nId] = 1
			end
		end
		
	end
end

function TaskManager:Create(nGroupId, nVersion)
	self:AddUseGroup(nGroupId)
	local tb = {}
	for key , value in %TaskGroup do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	tb:_init(nGroupId, nVersion)
	tb.TaskManager = self
	return tb
end


function TaskGroup:_init(nGroupId, nVersion)
	self.nGroupId = nGroupId
	self.nVersion = nVersion
end

function TaskGroup:GetTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTask(self.nGroupId, nIndex)
end

function TaskGroup:SetTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:AddTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetDailyTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetDailyTask(self.nGroupId, nIndex)
end

function TaskGroup:SetDailyTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetDailyTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddDailyTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:AddDailyTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetTaskBit(nIndex, nBitPos)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskBit(self.nGroupId, nIndex, nBitPos)
end

function TaskGroup:SetTaskBit(nIndex, nBitPos, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTaskBit(self.nGroupId, nIndex, nBitPos, nValue)
end

function TaskGroup:GetTaskId(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskId(self.nGroupId, nIndex);
end

function TaskGroup:GetTaskByte(nIndex, nByteIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskByte(self.nGroupId, nIndex, nByteIndex)
end

function TaskGroup:SetTaskByte(nIndex, nByteIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetTaskByte(self.nGroupId, nIndex, nByteIndex, nValue)
end

function TaskGroup:GetMyTaskByte(nIndex, nByteIndex1, nByteIndex2)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetMyTaskByte(self.nGroupId, nIndex, nByteIndex1, nByteIndex2)
end

function TaskGroup:SetMyTaskByte(nIndex, nByteIndex1, nByteIndex2, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetMyTaskByte(self.nGroupId, nIndex, nByteIndex1, nByteIndex2, nValue)
end

function TaskGroup:GetMyTaskBit(nIndex, nBitIndex1, nBitIndex2)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetMyTaskBit(self.nGroupId, nIndex, nBitIndex1, nBitIndex2)
end

function TaskGroup:SetMyTaskBit(nIndex, nBitIndex1, nBitIndex2, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:SetMyTaskBit(self.nGroupId, nIndex, nBitIndex1, nBitIndex2, nValue)
end
