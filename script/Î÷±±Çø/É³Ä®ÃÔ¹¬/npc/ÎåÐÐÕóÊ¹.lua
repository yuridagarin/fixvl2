-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC������ʹScript
-- By StarryNight
-- 2007/08/07 PM 4:30

-- ���������ܣ�������ϼӰ�~~~~

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


---------------------------------- ������21��֧1_12��������----------------------------------
	
	--�Ѿ���ȡ���񵫻�δȡ���ذ���Ի�
	if nStep_XBTask_01 == 57 then
		task_021_03_1();
		return
	end
	
	--�Ѿ�ȡ���ذ��ˢ������ʹ
	if nStep_XBTask_01 == 58 then
		task_021_03_0();
		return
	end
	
	--�Ѿ�ɱ������ʹ���ؿ��ӿڿ���
	if nStep_XBTask_01 == 59 then
		task_021_03_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"L� Ng� H�nh Tr�n do Nh�t Ph�m ���ng l�p ra, ng��i kh�c kh�ng th� v�o.",
		"N�i chuy�n sao kh� nghe th�."
		}
	
	TalkEx("",strTalk);
	return

end;
