-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC֣��֮Script
-- By StarryNight
-- 2005/12/29 PM 16:05

--ʮһ��إ�� ������������  
--�ˣ�  ���¡����̡��޲֡����졢����������������������  
--�ɣ�  ������Ȣ  

-- ����С͵���ݣ�����������ʧ������ѹ�������

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);
local nTask_DL_State_45 = GetTask(TASK_DL_LV45_ID);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_62 = GetTask(TASK_DL_LV62_ID);
local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
	
	--��ȡŮ��������
	if nLevel >= 10 and nTask_DL_State_10 == 0 and XnTaskSwitch == 1 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_10 == 1 then
		task_001_00();
		return
	end;
	
	if nTask_DL_State_10 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_10 == 3 then
		task_003_00();
		return
	end;
	
	if nTask_DL_State_10 == 4 then
		local strTalk = {
			"Ta l� ng��i H�n, m�i ��n ��i L� l�m �n n�n c�ng kh�ng hi�u t�nh h�nh � ��y l�m. Nh�ng nghe n�i n�u c� g� li�n quan ��n Xi H�a gi�o th� c� th� t�m Qu�c c�ng Cao Th�ng Tuy�n �� h�i.",
			"���c! �� ta �i h�i xem."
		}
		TalkEx("",strTalk);
		return
	end;
	
	--��ȡ������ʹ����
	if nTask_DL_State_40 == 6 then
		task_004_00()
		return
	end
	
	--�Ѿ��ռ���10����Ƥ
	if nTask_DL_State_45 == 1 then
		task_005_00()
		return
	end
	
	--�Ѿ���ȡ������
	if nTask_DL_State_45 == 2 then
		task_006_00()
		return
	end
	
	--�Ѿ������ʿȡ���ż�
	if nTask_DL_State_45 == 3 then
		task_007_00()
		return
	end
	
	--�Ѿ����ż�����֣��֮
	if nTask_DL_State_45 == 4 then
		task_008_00()
		return
	end
	
	--�Ѿ���ȡ50������
	if nTask_DL_State_50 == 1 then
		task_009_00()
		return
	end
	
	--�Ѿ�����������첢�������峤�Ի���
	if nTask_DL_State_50 == 6 then
		task_010_00()
		return
	end
	
	--δ�����Ȫ�Ի�
	if nTask_DL_State_50 == 7 then
		task_011_00()
		return
	end
	
	--��ȡ֣��֮ծ������
	if nTask_DL_State_60 == 8 then
		task_012_00()
		return
	end
	
	--���������������ǰ
	if nTask_DL_State_60_1 >= 1 and nTask_DL_State_60_1 <= 5 or nTask_DL_State_60_2 >= 1 and nTask_DL_State_60_2 <= 4 then
		task_013_00()
		return
	end
	
	--���֣��֮�Ļ����������ȡ62��������ܶ���
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_62 == 0 then
		task_016_00()
		return
	end
	
	--δǰ�����۶��鿴
	if nTask_DL_State_62 == 1 then
		task_017_00()
		return
	end
	
	--ǰ�����۶��鿴������㱨
	if nTask_DL_State_62 == 2 then
		task_018_00()
		return
	end	

	--δɱ�����ܶ��˺�����ǰ
	if nTask_DL_State_62 == 3 then
		task_019_00()
		return
	end
	
	--�Ѿ�ɱ�����ܶ��˺�����
	if nTask_DL_State_62 == 4 then
		task_020_00()
		return
	end
	
	--δȥ���嶾�̽���
	if nTask_DL_State_62 == 5 then
		task_021_00()
		return
	end
	
	--����ռ������־����֣��֮�Ի�
	if nTask_DL_State_75 == 6 then
		task_022_00()
		return
	end
	
	--δ���Ħ�����ȶԻ�
	if nTask_DL_State_75 == 7 then
		task_023_00()
		return
	end
	
	--���Ħ�����Ⱥ�Ի�
	if nTask_DL_State_75 == 8 then
		task_024_00()
		return
	end
	
	--���Ħ�����������Ի�
	if nTask_DL_State_75 >= 9 then
		local strTalk = {
			"Ng��i qu� l� h�o h�n, c� Tr�nh t�c ta mang �n <sex>.",
			}
		TalkEx("",strTalk);
		return
	end

	
	--һ������µĶԻ�
	local strTalk = {
		"M�y n�m nay bu�n b�n kh� kh�n, n�u kh�ng ta ch�ng ph�i v�t v� t� Trung Nguy�n l�n l�i ��n n�i n�y ki�m s�ng!",
		"��c g� gh� th�! Ch� ngh� th�i c�ng �� th�y s�, n�u nh� tr�ng ph�i ch�c ti�u m�ng!"	
		}
	
	TalkEx("",strTalk);
	return
	
end;
