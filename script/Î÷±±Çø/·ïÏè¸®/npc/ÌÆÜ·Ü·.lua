-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC��˹����Script
-- By StarryNight
-- 2007/06/27 AM 10:16

-- ������ĸ���ɣ�����һ�Ĳ�ֵ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ���������֧1����09������ʹ----------------------------------
	
	--����ܷܷ�Ի������æ��������װ
	if nStep_XBTask_01 == 45 then
		task_019_04_0();
		return
	end
	
	--���ػ�û�д������˿����Ʒ����ܷܷ
	if nStep_XBTask_01 == 46 then
		task_019_05_0();
		return
	end
	
	--�Ѿ�ȡ������װ(��������װ)
	if nStep_XBTask_01 == 47 then
		task_019_05_1();
		return
	end
	
	
	--һ������µĶԻ�
	strTalk = {
		{"M�i v�t ��u c� th�i, ng��i ��p v� th�i gian c�ng kh� gi�."},
		{"xu�n m�ng tu� v�n t�n, phi hoa tr�c thu� l�u, ti�n kh�c ph�m �m t� giao nhu�"},
		{"M�i vi�c tr�n ��i ��u do tr�i ��nh s�n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
