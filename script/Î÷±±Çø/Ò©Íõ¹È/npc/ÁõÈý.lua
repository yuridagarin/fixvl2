-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ҩ����NPC����Script
-- By StarryNight
-- 2007/08/04 AM 10:52

-- ��ֻ��һ��������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	--�
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk2()
		if nRet == 1 then
			return
		end
	end	
	
	--------------


	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- ������17��֧1_8����֮��----------------------------------
	
	
	--������ѯ�ʹ���ҩ����������
	if nStep_XBTask_01 == 34 then
		task_017_01_0();
		return
	end
	
	--���ػ�δ����20ǧ����ľ��Ʒ
	if nStep_XBTask_01 == 35 then
		task_017_02_0();
		return
	end
	
	--��δ����һ��ҩ�˲�
	if nStep_XBTask_01 == 36 then
		task_017_02_1();
		return
	end
	
	---------------------------------- ������19��֧1_10�����----------------------------------
	--�ɹ���������ҩ�˲ݣ���ȥ��ŷ���Ի�
	if nStep_XBTask_01 == 43 then
		task_019_02_0();
		return
	end
	
	--δ�ر�ŷ����ҩ������ò
	if nStep_XBTask_01 == 44 then
		task_019_02_1();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Xung quanh Ph�ng T��ng ph� gi� c�t r�t m�nh th�i ��n g� ��u �a v�ng l�m sao b�n ���c? �em �i ��t c� l� h�n."},
		{"Xung quanh D��c V��ng ��ng c� m�t s� g� qu� nh�ng b� ta ch�t h�t r�i."},
		{"Tin ta �i D��c V��ng ��ng r�t nguy hi�m kh�ng n�n ��n ��."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
