-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������ܺ�Script
-- By StarryNight
-- 2005/12/31 PM 14:30

--������  ������ ������

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local strTalk = {
	"Trong th� vi�t g� v�y?",
	"{Nh� Ho�ng T�} �ang � {T�y Song B�n N�p}? Ph�i l�p t�c b�o ngay cho {Cao Qu�c C�ng} th�i.",
	}
	TalkEx("",strTalk);
	if GetTask(TASK_DL_LV70_ID) == 2 then
		SetTask(TASK_DL_LV70_ID,3);--�Ѿ��Ķ����ż�
		Msg2Player("��n ��i L� th�ng b�o cho Cao Qu�c C�ng v� n�i dung trong th�.");
		TaskTip("��n ��i L� th�ng b�o cho Cao Qu�c C�ng v� n�i dung trong th�.");
	end
	return
end
