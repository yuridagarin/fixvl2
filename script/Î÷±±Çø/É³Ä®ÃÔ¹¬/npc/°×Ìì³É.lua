-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC�����Script
-- By StarryNight
-- 2007/08/07 PM 7:45

-- ���������ܣ�������ϼӰ�~~~~

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
		Say("B�o ki�m l�u l�m kh�ng s� d�ng, h�y gi�p ta m�i ki�m, cho ��n khi n�o V�ng trong Ki�m t�a �nh h�o quang ng�.\n<color=gold> ti�u di�t 333 Sa M�c H�nh Nh�n \n ti�u di�t 555 T�m B�o Nh�n <color>", 0);
		TaskTip("Ti�u di�t 333 Sa M�c H�nh Nh�n ");
		TaskTip("Ti�u di�t 555 T�m B�o Nh�n");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ������23��֧1_14��ɳ��Ļ----------------------------------
	
	--�Ѿ���ȡ���񵫻�δȡ�÷����������ɶԻ�
	if nStep_XBTask_01 == 62 then
		task_023_02_1();
		return
	end
	
	--ˢ������
	if nStep_XBTask_01 == 64 then
		task_023_02_0();
		return
	end
	
	--�������͸������
	if nStep_XBTask_01 == 65 then
		task_023_03_0();
		return
	end
	
	--�Ѿ�ɱ�����󣬹ؿ��ӿڿ���
	if nStep_XBTask_01 == 66 then
		task_023_02_2();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Ng��i l�...ng�n l�a trong sa m�c �!",
		}
	
	TalkEx("",strTalk);
	return

end;
