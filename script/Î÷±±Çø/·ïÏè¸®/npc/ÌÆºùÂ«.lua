-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC�ƺ�«Script
-- By StarryNight
-- 2007/08/07 PM 4:07

-- �ö��Ǻ�«����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--һ������µĶԻ�
	strTalk = {
		{"K�o H� L� do ta l�m chua chua ng�t ng�t, c� th� coi la ngon nh�t ��i T�ng."},
		{"X�u K�o H� L� l� ph�i ch�n ���c qu� s�n tra k�ch th��c b�ng nhau, ghim tr�n kh�c g� tr�ng nh� c�y con."},
		{"Kh�ch quan th� qua b�ng tr�n ���ng H� L� ch�a? N�u c� th� h�c ���c c�ch l�m l�nh c�a T�y T�ng th� k�o h� l� �� s� tr� th�nh m�n ngon c�a nh�n gian."},
		}
	local i = random(1,getn(strTalk));
	
	local  tSay = aah_GetSayDialog(95);
	if tSay and getn(tSay) ~= 0 then
		tinsert(tSay, "T�i h� ch� xem qua th�i/do_nothing");
		Say(strTalk[i][1], getn(tSay), tSay);
		return 0;
	end
	
	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- ������20��֧1_11������թ----------------------------------
	
	--���ƺ�«�Ի����Ǻ�«
	if nStep_XBTask_01 == 54 then
		task_020_04_0();
		return
	end
	
	--δȡ��10�����Ǻ�« ����������
	if nStep_XBTask_01 == 55 then
		task_020_04_1();
		return
	end

	TalkEx("",strTalk[i]);
	return
	
end;

function do_nothing()
end
