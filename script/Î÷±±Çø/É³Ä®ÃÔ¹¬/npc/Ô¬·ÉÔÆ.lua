-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPCԬ����Script
-- By StarryNight
-- 2007/08/04 AM 11:59

-- ���Ȱ����Ȱ�����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local	strTalk = {};

	---------------------------------- ������20��֧1_11������թ----------------------------------
	
	
	--�Ѿ�ɱ���˶�������
	if nStep_XBTask_01 == 54 then
		strTalk = {
			"S�t Th� Oa Oa th�ch nh�t K�o H� L� c�a ���ng H� L� trongPh�ng T��ng ph�, ng��i h�y mua v� cho �t Thu�c m� c�a ta v�o, b�o ��m kh�ng c� s� h�.",
			}
		TalkEx("",strTalk);	
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		"L�m ngh� c�a ch�ng t�i �� quen v�i b�ng gi� v� sa m�c r�i. Ch� c�n b�t ���c ph�m nh�n l� ���c r�i."
		}
	
	TalkEx("",strTalk);
	return
	
end;
