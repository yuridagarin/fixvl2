-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ؾ�NPC���ص���Script
-- By StarryNight
-- 2007/08/07 PM 11:46

-- ������ĸ���ɣ�����һ�Ĳ�ֵ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	
	--�
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk3()
		if nRet == 1 then
			return
		end
	end	
	
	--------------
	
	local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- ������25��֧2_2�ؾ�����----------------------------------
	
	--����ʦ�ؾ������˵����ص��ӶԻ���ý�������
	if nStep_XBTask_02 == 7 then
		task_025_02_0();
		return
	end
	
	--��δ����������
	if nStep_XBTask_02 == 8 then
		task_025_02_1();
		return
	end
	
	--������������
	if nStep_XBTask_02 == 9 then
		task_025_03_0();
		return
	end
	
	--��δ��֪Ҷ����������һ��
	if nStep_XBTask_02 == 10 then
		task_025_03_1();
		return
	end
	
	--һ������µĶԻ�
	local strTalk = {
		"Thi�n S� m�t c�nh th�t vui, qu� nhi�n c� nhi�u em nh� v�y~~!? (*^_^*) hihi��",
		}
	
	TalkEx("",strTalk);
	return
	
end;
