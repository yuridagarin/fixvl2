-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPCŷ����Script
-- By StarryNight
-- 2007/06/06 PM 4:47

-- ��л�������������ҷ�ƨ

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
local strTalk = {};

	---------------------------------- ��������01���İ�ӿ----------------------------------
	
	--��������Ի���δ��ŷ�����Ի�
	if nStep_XBTask == 2 and XBTaskSwitch == 1 then
		task_001_03_0();
		return
	end
	
	--���ػ�δ����Ůʽװ��
	if nStep_XBTask == 3 then
		task_001_04_0();
		return
	end
	
	--���ػ�δ����һƷ������
	if nStep_XBTask == 4 then
		task_001_05_0();
		return
	end
	
	---------------------------------- ��������02������ջ----------------------------------

	--�������δ���ѶԻ�
	if nStep_XBTask >= 5 and nStep_XBTask <= 9 then
		task_001_05_1();
		return
	end
	
	---------------------------------- ��������03��ʮ����----------------------------------
	
	--ѯ������������������˼��
	if nStep_XBTask == 10 then
		task_003_01_0();
		return
	end
	
	--�����δ����ǰ�Ի�
	if nStep_XBTask >= 11 and nStep_XBTask <= 12 then
		task_003_01_1();
		return
	end
	
	---------------------------------- ��������04�б�����----------------------------------
	--����������ڼ�Ի�
	if nStep_XBTask >= 13 and nStep_XBTask <= 14 then
		task_001_05_1();
		return
	end
	
	--ȡ��һƷ�����뺯��Ի�
	if nStep_XBTask == 15 then
		task_004_03_0();
		return
	end
	
	--��û�복�ְ����Ի��������һƷ��
	if nStep_XBTask == 16 then
		task_004_03_1();
		return
	end
	
	--��ŷ�����Ի�ѯ�ʼ���λ��
	if nStep_XBTask == 17 then
		task_005_02_0();
		return
	end
	
	--δ��������Ի�������ڽ����İ���
	if nStep_XBTask == 18 then
		task_005_02_1();
		return
	end
	
	--���ȶԻ���Ϊ����һƷ����С�ĵ�����
	if nStep_XBTask >= 19 and nStep_XBTask <= 39 then
		strTalk = {
			"<sex> gia nh�p Nh�t Ph�m ���ng m�i vi�c ��u ph�i th�n tr�ng.",
			}
		TalkEx("",strTalk)
		return
	end
	
	--����֧��ŷ����������
	if nStep_XBTask >= 39 and nStep_XBTask_02 == 0 and GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	end
	
	---------------------------------- ������11��֧1_3����֮Ĺ----------------------------------
	--��ŷ�����Ի���ûȡ�ý�˿����֮ǰ��ǰ����ɱһƷ�ð�ɱʹ
	if nStep_XBTask_01 == 9 then
		task_011_03_0();
		return
	end
	
	--��δ�ɹ�ǰ����ɱһƷ�ð�ɱʹand����������
	if nStep_XBTask_01 == 10 then
		task_011_03_1();
		return
	end
	
	--�Ѿ�ɱ��һƷ�ð�ɱʹ
	if nStep_XBTask_01 == 11 then
		task_011_04_0();
		return
	end
	
	--��ûȡ��10����˿������ŷ�����Ի�and����������
	if nStep_XBTask_01 == 12 then
		task_011_04_1();
		return
	end
	
	---------------------------------- ������13��֧1_5������Ĺ----------------------------------
	--ѯ��ŷ������Ĺ���
	if nStep_XBTask_01 == 17 then
		task_013_03_0();
		return
	end
	
	--δѯ����������Ĺ���
	if nStep_XBTask_01 == 18 then
		task_013_03_1();
		return
	end
	
	---------------------------------- ������13��֧1_7ҩ�˾���----------------------------------
	--��ŷ�����㱨����ҩ��һ��
	if nStep_XBTask_01 == 31 then
		task_016_03_0();
		return
	end
	
	--��δɱ��30ҩ��
	if nStep_XBTask_01 == 32 then
		task_016_03_1();
		return
	end
	
	--����30ҩ�˺���ŷ�����㱨���
	if nStep_XBTask_01 == 33 then
		task_016_04_0();
		return
	end
	
	--��δ������ѯ��ҩ�˶������
	if nStep_XBTask_01 == 34 then
		task_016_04_1();
		return
	end

	---------------------------------- ������18��֧1_9�ƺ�����----------------------------------
	--����ŷ����ҩ�˲���������һ��
	if nStep_XBTask_01 == 37 then
		task_018_01_0();
		return
	end
	
	--��û�ҵ��﷽�����ҩ�˲�һ��
	if nStep_XBTask_01 == 38 then
		task_018_01_1();
		return
	end
	
	---------------------------------- ������19��֧1_10�����----------------------------------
	--�ɹ���������ҩ�˲ݣ���ȥ��ŷ���Ի�
	if nStep_XBTask_01 == 42 then
		task_019_01_0();
		return
	end
	
	--��δ�������Ի�
	if nStep_XBTask_01 == 43 then
		task_019_01_1();
		return
	end
	
	--��ŷ��������ҩ��������ò
	if nStep_XBTask_01 == 44 then
		task_019_03_0();
		return
	end
	
	--δ����ܷܷ�Ի�������������װ
	if nStep_XBTask_01 == 45 then
		task_019_03_1();
		return
	end
	
	--�Ѿ�ɱ��ҩ������
	if nStep_XBTask_01 == 48 then
		task_019_07_0();
		return
	end
	
	
	--��δ���﷽�ʶԻ�
	if nStep_XBTask_01 == 49 then
		task_019_07_1();
		return
	end
	
	--�㱨ŷ����ɳĮ����һ��
	if nStep_XBTask_01 == 61 then
		task_022_02_0();
		return
	end

	--��δѯ��Ҷ�������ɳĮ����һ��
	if nStep_XBTask_01 == 62 then
		task_022_02_1();
		return
	end
	
	---------------------------------- ������23��֧1_14��ɳ��Ļ----------------------------------
	--�������֪ŷ����
	if nStep_XBTask_01 == 67 then
		task_023_05_0();
		return
	end
	
	---------------------------------- ������29����֮��------------------------------------------

	--��ŷ��������ȡ����֮������
	if nStep_XBTask_01 == 68 then
		task_029_01_0();
		return
	end
	
	--��δ���׼�Ի�
	if nStep_XBTask_01 == 69 then
		task_029_01_1();
		return
	end

	--һ������µĶԻ�
	strTalk = {
		{"B�c tranh c�a ng��i h�a s� ph�i c� � v� m�i l� tranh hi�m."},
		{"Tranh v� m� nh�n qu� l� tuy�t t�c."},
		{"Tuy ta c� bu�n b�n � Ph�ng T��ng nh�ng kh�ng b�n tranh, n�u ng��i bi�t th��ng th�c th� ta t�ng ng��i c� sao ��u."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
