-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC����ɮScript
-- By StarryNight
-- 2006/01/13 PM 20:37

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	return
end
   	