-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPCҶ��Script
-- By StarryNight
-- 2007/06/13 AM 10:54

-- ��������ʵ��ƽ�⣬����Ҫ�κμ��ɣ��Ƕ��Ƿ�ƨ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- ��������05�²ְ���----------------------------------
	
	--��Ҷ�϶Ի���������Ҷ����
	if nStep_XBTask == 20 then
		task_005_05_0();
		return
	end
	
	--δ��������Ҷ����
	if nStep_XBTask == 21 then
		task_005_05_1();
		return
	end
	
	--�Ѿ���������Ҷ����
	if nStep_XBTask == 22 then
		task_005_07_0();
		return
	end
	
	--δ��ɽ�����Ҷ�϶Ի�
	if nStep_XBTask == 23 then
		task_005_07_1();
		return
	end
	
	---------------------------------- ������26��֧2_3�ǳ�����----------------------------------
	--δ��ŷ�����Ի�������������
	if nStep_XBTask_02 == 11 then
		task_025_04_2();
		return
	end
	
	--��Ҷ������Ҷ�ϱ�ƽ��
	if nStep_XBTask_02 == 12 then
		task_026_02_0();
		return
	end

	--δ��Ҷ����Ի���Ҷ�϶Ի�
	if nStep_XBTask_02 == 13 then
		task_026_02_1();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"C�n L�n n�i cao ���ng d�c, th�t kh� �i!"},
		{"Th��ng nh�n ��n t� T�y V�c tuy v�t v� nh�ng m�i l�n ��n ��u ch� ��y xe h�ng, v� t�ng ta �t �� ch�i k� l�."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
