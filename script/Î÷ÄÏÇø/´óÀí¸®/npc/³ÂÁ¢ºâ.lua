-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC������Script
-- By StarryNight
-- 2005/01/09 PM 15:38

--ũ����վ���ˣ��Ժ󿴲���ͨʤ�ˡ�����

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv50\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
--print("nTask_DL_State_50:"..nTask_DL_State_50)
	
	--��ȡ��˾�嵶����
	if nTask_DL_State_50 == 1 then
		task_000_00();
		return
	end
	
	--�Ѿ���ȡ��˾�嵶����
	if nTask_DL_State_50 == 2 then
		task_001_00();
		return
	end
	
	--�Ѿ������˾�嵶����û�������峤�Ի�
	if nTask_DL_State_50 == 3 then
		task_002_00();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Nghe n�i c� v� gi�o s� ��n t� Trung Nguy�n, mi�ng n�i nh�ng l�i kh� hi�u! Ta mu�n di�n ki�n h�n m�t phen!",
		"Tr�n L�p Ho�nh: bala b�l� bili! --(c� ng� ��i L�)",
		}
	TalkEx("",strTalk);
	return
	
end;
