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
	
	--ѯ����û�в�˹���Ѿ���
	if nStep_XBTask_01 == 2 then
		task_009_03_0();
		return
	end
	
	--��ûȡ�����Ѿ�and�����̺�������
	if nStep_XBTask_01 == 3 then
		task_009_03_1();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Con ���ng v�n chuy�n t� l�a tuy t�t nh�ng qu� d�i� T� Ph�ng T��ng ��n An T�c ph�i m�t hai m��i m�y ng�y."},
		{"Ng�n ng� trung nguy�n kh� h�c qu�, ng��i trung nguy�n l�i kh�ng ch�u h�c ti�ng c�a ta, bi�t th�m m�t s� ti�ng c� g� kh�ng t�t ch�? Ta c�ng bi�t n�i ng�n ng� c�a m�t s� qu�c gia v�y."},
		{"Ng��i ch� c� nghe t�n ���ng H� L� n�i b�y, T�y V�c l�m g� c� ph��ng ph�p l�m l�nh, ta ch� chuy�n b�n h�ng h�a T�y V�c, R��u Ba T�."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
