-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����80������̴����ļ�
-- By StarryNight
-- 2006/01/13 PM 20:39

--���ȥ������ա�ȥ�ˣ�����һ�˼Ӱ�ing���� 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--��ܶγж���������ӶԻ�
function task_000_00()
	
local strTalk = {
	"�o�n Th�a �n �� b� ��nh b�i r�i, l� n�o ng��i l�i n�i gi�o cho gi�c?",
	"{Nh� Ho�ng T�} c��p ng�i, l�i c�u k�t v�i {Xi H�a gi�o} ph�n lo�n, ��y ���c xem l� vi�c ch�nh ngh�a sao?",
	"C�i g� l� c�u k�t v�i Xi H�a gi�o? C�i g� l� ph�n lo�n? Ng��i ch� hi�u g� ch� n�i b�a th�i.",
	"Ch� ph�i ng��i �� tranh ng�i c�a {Tam Ho�ng T�} sao? {Tam Ho�ng T�} l�n ng�i l� do � c�a {Ti�n ��}, ng��i n�n t� b� � ��nh n�y �i.",
	"C�i g� l� th�nh � c�a ti�n ��? Ph� ho�ng ch� mu�n ta l� ng��i k� v�, ��ng ti�c l� L�o tam �� l�m gi� th�nh ch�, ��y ta ��n ��i L� c�n vu kh�ng ta c�u k�t v�i Xi H�a gi�o �� t�c lo�n. Ng��i k� v� ch�nh l� ta!",
	"H�m, {Tam Ho�ng T�} d�m gi� th�nh ch� �?",
	"Chi�u th� th�t c�a Ti�n Ho�ng �ang � trong tay ta, nh�ng ��ng ti�c l� kh�ng c� c� h�i �� ch�ng minh m� th�i.",
	"V�y t�i h� c� th� gi�p �i�n h� �em {chi�u th�} n�y ��n {��ng Qu�c S�}, �ng �y c� th� ch�ng minh th�t gi�.",
	"��ng Qu�c S� tuy �� ph�i binh ��n chi�u m� ta, nh�ng c�ng c�n ch�ng minh ��y ��ch th�t l� b�t t�ch c�a Ho�ng th��ng, ng��i �em ��n �� gi�p ta.",
	"T�i h� s� �em th� n�y ��n cho {��ng Qu�c S�} x�c minh, c� g� s� th�ng b�o ngay cho �i�n h�.",
	"Ng��i �i mau �i, nh� b�o tr�ng!",
	}
	TalkEx("",strTalk);
	AddItem(2,0,381,1);--�õ������ӵ�����
	TaskTip("�em chi�u th� ��n cho ��ng Qu�c S�.");
	Msg2Player("�em chi�u th� ��n cho ��ng Qu�c S�.");
	SetTask(TASK_DL_LV80_ID,3);
	GivePlayerAward("Level_76","xn_step_1");
	GivePlayerExp(SkeyDali,"duanchengen")
	return

end;