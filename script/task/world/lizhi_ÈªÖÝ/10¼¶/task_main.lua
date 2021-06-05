
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ȫ�� 10 ����������ű�
-- Edited by peres
-- 2005/07/19 PM 19:29

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ���������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "H�ng h�a ta m�t h�t r�i, sao v� D��ng Ch�u ��y!"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

local strMain = {
	"Ta v�n ng��i D��ng Ch�u, g�n ��y nh�p m�t chuy�n {h�ng b�ng ng�c} mu�n chuy�n ��n Tuy�n Ch�u. Kh�ng ng� b� ��m {L�u manh} c��p m�t. Ng��i gi�p ta t�m 20 m�n Ng�c kh� ���c kh�ng?",
	"Ti�p nh�n nhi�m v�/task_000_01",
	"R�i kh�i/Task_Exit"
}

SelectSay(strMain);

end;

function task_000_01()
	Msg2Player("Gi�p V��ng Nghi�p V� t�m l�i 20 Ng�c kh�");
	TaskTip("Gi�p V��ng Nghi�p V� t�m l�i 20 Ng�c kh�");
	CreateTrigger(0, 189, 80);
	SetTask(TASK_LEV_10_ID, 1);
end;


function task_001_00()

local strMain = {
	"B�ng h�u ��n ��y c� chuy�n g�?",
	"D�ng Ng�c kh� ��i th� lao/task_001_01",
	"K�t th�c ��i tho�i/task_001_03"
}

SelectSay(strMain);

end;

function task_001_01()

    local strMain = {
    	"��ng l� h�ng h�a c�a ta nh�ng ch�a ��, th�i th� lao c�a ng��i ��y!",
    	"Th�c ra s� s�ch c�a ta c�ng b� c��p �i, nghe n�i ��u m�c c�a b�n l�u manh l� {Di�u L�p Th�nh} hi�n �ang tr�n � B�c Tuy�n Ch�u. Xin gi�p ta l�y l�i."
    };
    local szNotHaveEnough = 
    {
        "Ng��i ch�a t�m �� 20 m�n �� {b�ng ng�c}, ��i t�m �� m�i nh�n th� lao."
    };

    local szMsg = "C� v�t ph�m";
    local nItemCount = GetItemCount(2, 1, 154);
    --Msg2Player(szMsg..nItemCount);
	if nItemCount >= 20 then
		TalkEx("task_001_02", strMain);
	else
		TalkEx("task_001_03", szNotHaveEnough);
	end;
end;

function task_001_03()
    if GetTrigger(80) == 0 then
        CreateTrigger(0, 189, 80);
    end;
end;

-- ������񣬷������������ȥ��Ҧ����
function task_001_02()
    DelItem(2, 1, 154, 20);
	SetTask(TASK_LEV_10_ID, 2);
	GivePlayerAward("Level_10", "easy");    --����
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo1")		--�����̻�1
	RemoveTrigger(GetTrigger(80));
	
	Msg2Player("��nh Di�u L�p Th�nh (198.188) l�y l�i s� s�ch");
	TaskTip("��nh Di�u L�p Th�nh (198.188) l�y l�i s� s�ch");
	
end;

--�ӵ�ɱҦ�������񣬵���û��ɱ��ʱ���NPC�Ի�
function task_002_00()

    local szMain = 
    {
        "Nghe n�i {Di�u L�p Th�nh} � {B�c Tuy�n Ch�u} (198.188), ng��i mau ��n �� gi�p ta �o�t s� s�ch v�!"
    }
    TalkEx("", szMain);
end;

function task_003_00()
    
    local strMain = {
    	"C� l�y ���c s� s�ch kh�ng?",
    	"Di�u L�p Th�nh c��p h�ng h�a v� s� s�ch c�a �ng �� l�m g�?",
    	"Ng��i th� h�i {H� Ki�t} xem! Ta th�y h�n th��ng qua l�i v�i b�n C�n ��."
    }
    
    TalkEx("task_003_01", strMain);

end;

-- ������񣬷���
function task_003_01()

	SetTask(TASK_LEV_10_ID, 4);
	SetTask(TASK_LEV_12_ID, 100);   --����Ȫ�������Ľܲ���
	DelItem(2, 0, 32, 1);
	GivePlayerAward("Level_10", "hard", "weapon", "Level_10");    --����
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo2")		--�����̻�2
	Msg2Player("T�m H� Ki�t (166.182) ch�t v�n");
	TaskTip("T�m H� Ki�t (166.182) ch�t v�n");

end;

function task_004_00()
    
    local strMain = {
        "�a t� <sex> �� gi�p ��!",
        "Kh�ng c� chi."
    }
    TalkEx("",strMain);
end;

function Task_Exit()

end;