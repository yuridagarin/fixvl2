-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����30,62������̴����ļ�
-- By StarryNight
-- 2006/01/13 PM 10:34

--������ ������ ������ 
--��: ���� �ܻ� ���� ���� ���� ��Ȣ �ɲ� ��ж ���� ���� ���� ���� ���� ���� ��լ ���� ���� ��׽ ��� ��ľ ���˿� ��ˮ 
--��: ���� ���� �޷� ���� 
--��������: �帻 ����  
--�����˼�: ��ɷ С�� ���� ���� Ԫ��  
--ÿ��̥��ռ��: ռ�������ڱ� 
--����: ����ˮ ִִλ 
--��: ����(����)ɷ�� 
--����ټ�: �ﲻ����������ǿ �Ѳ�Զ�в������ 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--������Ի���ȡ����������
function task_000_00()

local strTalk = {
	"��i L� C�u Ch� �� b� H�c Tinh Tinh c��p �i, c� th� gi�p ta t�m ch�ng v� kh�ng?",
	"{H�c Tinh Tinh} �� � ��u?",
	"Ch�ng � T�y Song B�n N�p, ng��i ��n �� t�m 10 t�m ��i L� C�u Ch� nh�!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,5);
	RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));--ɾ���������Ի�������
	CreateTrigger(0,264,KILL_DL_JOCKO);
	TaskTip("��n T�y Song B�n N�p thu th�p 10 t�m ��i L� C�u Ch�");
	Msg2Player("��n T�y Song B�n N�p thu th�p 10 t�m ��i L� C�u Ch�");
	GivePlayerAward("Level_75","xn_step_1");
	GivePlayerExp(SkeyDali,"dalirizi")
	return
end	
	
--��ȡ�����������1
function task_001_00()

local strTalk = {
	"H�c Tinh Tinh � T�y Song B�n N�p, ng��i ��n �� t�m 10 t�m ��i L� C�u Ch�.",
	}
	
	--�жϴ����־��Ƭ��Ŀ
	if GetItemCount(2,0,379) >= 10 then
		DelItem(2,0,379,10);
		strTalk = {
			"V� r�i �, mau ��a ta xem n�o.",
			"�",
			"Ta �� x�c ��nh ���c th�n th� c�a Tr�nh Qu�n Trinh.",
			"R�t c��c l� ng��i th� n�o?",
			"V�o cu�i th�i ���ng, Tr�nh M�i T� c��p ng�i l�p n�n ��i Tr��ng H�p Qu�c. M��i m�y n�m sau Tri�u Thi�n Ch�nh v� D��ng Can Trinh c��p ng�i. D��ng Can Trinh c�n gi�t h�i c� d�ng t�c h� Tr�nh, nh�ng ng��i c�n s�t l�i r�i kh�i ��i L� sang l�nh n�n � ��i T�ng. Sau �� �o�n T� B�nh ki�n l�p l�i ��i L� cho g�i Tr�nh gia quay v� v� s�p v�o m�t trong 6 ��i gia t�c � ��i L�, nh�ng h� Tr�nh quy�t kh�ng quay l�i. Tr�nh Qu�n Chi l� m�t trong nh�ng h�u nh�n c�a d�ng t�c h� Tr�nh.",
			}
		TalkEx("task_001_01",strTalk);	
		return
	end
	
	--��������������������
	if GetTrigger(KILL_DL_JOCKO) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,264,KILL_DL_JOCKO);
		TaskTip("��n T�y Song B�n N�p thu th�p 10 t�m ��i L� C�u Ch�");
		Msg2Player("��n T�y Song B�n N�p thu th�p 10 t�m ��i L� C�u Ch�");
		return
	end
		
	TalkEx("",strTalk);
	return
end

--��ȡ�����������2
function task_001_01()

local strTalk = {	
	"L�m sao bi�t c� ta l� {h�u nh�n c�a Tr�nh gia}?",
	"D�ng t�c Tr�nh gia x�a nay c� c�ch ��t t�n ri�ng, Tr�nh Qu�n Chi c�ng kh�ng n�m ngo�i l�.",
	"Vi�c n�y c�ng ch�a ch�c ch�n l�m, ch�ng qua l� s� tr�ng h�p th�i.",
	"C�n n�a, Tr�nh Gia ��t t�n lu�n c� ch� Chi ��y l� ��t �i�m ri�ng c�a B�ch t�c x�a nay. Tr�nh Qu�n Chi ��ch th�c thu�c gia t�c h� Tr�nh r�i.",
	"C�ch ��t t�n n�y t�i h� c� nghe Tri�u Di�n Ni�n nh�c ��n. Nh�ng r�t cu�c c� ta ��n {��i L�} �� l�m g�?",
	"Ta c�ng kh�ng r�, ng��i n�n g�p c� �y h�i xem sao.",
	"���c! T�i h� s� �i ngay!",
	}
	TalkEx("",strTalk);
	RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
	SetTask(TASK_DL_LV75_ID,6);
	Msg2Player("��n ��i L� h�i v� th�n th� c�a Tr�nh Qu�n Chi");
	TaskTip("��n ��i L� h�i v� th�n th� c�a Tr�nh Qu�n Chi");
	GivePlayerAward("Level_75","xn_step_2","legs","Level_57");
	GivePlayerExp(SkeyDali,"heixingxing")
end

function task_002_00()
	local strTalk = {
		"G�p Tr�nh Qu�n Chi h�i v� th�n th� c�a c� ta."
		}
	TalkEx("",strTalk);
end