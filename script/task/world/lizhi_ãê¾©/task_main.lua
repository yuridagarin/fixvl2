
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �꾩��������ű�
-- Edited by lizhi
-- 2005-8-8 10:27
-- ======================================================

-- ���������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_000_00()

local strMain = {
	"Kh�ng ���c��L�m sao b�y gi�?",
	"Ti�n b�i c� ph�i Kh�u Chu�n ��i nh�n kh�ng? Tri�u Di�n Ni�n v� D� T�u nh� ta mang b�c th� t�i, m�i ti�n b�i xem qua!",
	"��a ta xem n�o!",
	"[Kh�u Chu�n ��c b�c th�]",
	"<sex> ��n th�t ��ng l�c, ta c�ng kh�ng gi�u! Hi�n Li�u binh �ang ti�p c�n bi�n gi�i, qu�n t�nh kh�n c�p t� Nh�n M�n quan, h�n n�a g�n ��y Bi�n Kinh l�i x�y ra chuy�n�",
	"Chuy�n n�y v�n do quan sai ph� tr�ch! Nh�ng nh�n l�c �a s� b� �i�u �i n�i kh�c, hi�n ch� c�n l�i m�t s� gi� nua y�u �t. Ta th�y <sex> v� c�ng phi ph�m, nh�t ��nh kh�ng t� ch�i gi�p l�o phu �i gi�i v�y!",
	"Ti�n b�i c� d�n d�!",
	"T�t qu�! N�i chuy�n v�i <sex> th�t s�ng kho�i! Gi� phi�n <sex> ��n Thi�n Ba D��ng ph� g�p Xa Th�i Qu�n, b� �y �ang c� chuy�n b�c m�nh!",
}

TalkEx("task_000_01", strMain);

end;


function task_000_01()
    DelItem(2,0,49,1);
	Msg2Player("Kh�u Chu�n b�o b�n ��n Thi�n Ba D��ng ph� t�m Xa Th�i Qu�n");
	TaskTip("Kh�u Chu�n b�o b�n ��n Thi�n Ba D��ng ph� t�m Xa Th�i Qu�n");
	SetTask(TASK_BJ_ID, 1);
end;


function task_001_00()

    local strMain = {
        "H�! D��i ch�n thi�n t� m� ch�ng d�m ng�ng cu�ng v�y �!",
    	"B�m th�i qu�n t�i h� ���c Kh�u Chu�n ��i nh�n ph�i ��n ch� ng��i sai b�o!",
    	"Th� ra <sex> l� ng��i c�a Kh�u Chu�n ph�i ��n. Bi�n Kinh d�o n�y kh�ng y�n �n, ta �i�u tra ���c l� do m�t ��m L�u manh g�y ra, hi�n ng��i trong ph� ��u ra tr�n gi�t gi�c, mong <sex> gi�p ta tr�ng tr� b�n ch�ng!",
    	"V�y ��n ��u m�i t�m ���c m�y t�n L�u manh ��?",
    	"��m l�u manh th��ng xu�t hi�n � ph� ��ng Bi�n Kinh, T�y Bi�n Kinh, Nam Bi�n Kinh. N�u c� th� <sex> gi�p ta l�y 10 b�nh Thi�u t�u tr�n ng��i ch�ng ���c kh�ng!"
    };
    
    TalkEx("task_001_01", strMain);

end;


function task_001_01()
	Msg2Player("Xa Th�i Qu�n b�o b�n tr�ng tr� 20 t�n L�u manh v� t�m 10 b�nh Thi�u t�u");
	TaskTip("Xa Th�i Qu�n b�o b�n tr�ng tr� 20 t�n L�u manh v� t�m 10 b�nh Thi�u t�u");
	CreateTrigger(0, 200, KILL_BJ_LM);  --ɱ��20����å
	SetTask(TASK_BJ_ID, 2);
end;

function task_002_00()
    Talk(1,"","Ng��i gi�p ta tr�ng tr� 20 t�n l�u manh v� �em 10 b�nh Thi�u T�u v� ��y!");
    if GetTrigger(KILL_BJ_LM) == 0 then
        CreateTrigger(0, 200, KILL_BJ_LM);
    end;
end;

function task_003_00()

    local strMain = {
    	"Xem ra ta ph�i ��ch th�n ra tay m�i ���c!",
    	"B�m Th�i qu�n! T�i h� �� tr�ng tr� ��m L�u manh v� mang Thi�u t�u v� ��y!",
    	"Nhanh v�y? <sex> qu� nhi�n v� c�ng cao c��ng! N�u ng��i c�a Thi�n Ba D��ng ph� � ��y th� ��m C�n �� kh�ng d�m l�ng h�nh.",
    	"C�n ��? C� ng��i kh�c g�y s� n�a sao?",
    	"Kh�ng gi�u <sex> v�a l�c n�y qu�n s� ��n b�o ngo�i th�nh c� m�t ��m C�n �� lai l�ch kh�ng r� �ang g�y s�, ta ph�i m�t s� gia �inh ��n �� ng�n c�n kh�ng ng� b� ch�ng ��nh cho tr�ng th��ng.",
    	"Ta th�y m�y t�n C�n �� n�y th�t kh�ng ��n gi�n. <sex> gi�p ta ��n �� xem th�t h� th� n�o ���c kh�ng?",
    };


	if GetItemCount(2, 1, 12) >= 10 then
		TalkEx("task_004_00", strMain);
	else
		Talk(1,"","Ng��i gi�p ta tr�ng tr� 20 t�n l�u manh v� �em 10 b�nh Thi�u T�u v� ��y!");
	end;

end;


function task_004_00()
	Msg2Player("Xa Th�i Qu�n b�o b�n tr�ng tr� 10 t�n C�n ��");
	TaskTip("Xa Th�i Qu�n b�o b�n tr�ng tr� 10 t�n C�n ��");
	
	GivePlayerAward("Level_10", "hell");    	--����
	GivePlayerExp(SkeyBJShuxin,"liumang")		--��å���齱��
	-- ɾ�� 10 ���վ�
	DelItem(2, 1, 12, 10);
	
	CreateTrigger(0, 198, KILL_BJ_WL);  --ɱ��10������
	SetTask(TASK_BJ_ID, 4);
end;

function task_004_01()
    Talk(1,"","Mau �i tr�ng ph�t 10 t�n C�n ��!");
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 198, KILL_BJ_WL);
    end;
end;

function task_005_00()
    local strMain = {
    	"V� r�i �! <sex> �� thu th�p ���c tin t�c g� r�i?",
    	"��m C�n �� n�y qu� nhi�n v� ngh� cao c��ng!",
    	"Ch�c ch�n sau l�ng ch�ng c� ng��i ��ng ch� �i�m. <sex> �i b�t 1 v�i t�n C�n �� �� v� �i�u tra th� xem sao!",
    	"Chuy�n nh� th�i! Xin ��i tin vui c�a t�i h�!",
    };
    TalkEx("task_005_01", strMain);
end;


function task_005_01()
	
	GivePlayerAward("Level_10", "easy");    	--����
	GivePlayerExp(SkeyBJShuxin,"wulai1")		--����1
	Msg2Player("Xa Th�i Qu�n sai b�n �i b�t 5 t�n C�n �� v� �� �i�u tra");
	TaskTip("Xa Th�i Qu�n sai b�n �i b�t 5 t�n C�n �� v� �� �i�u tra");
	CreateTrigger(0, 199, KILL_BJ_WL);
	SetTask(TASK_BJ_ID, 6);
end;

function task_006_00()

    local strMain = {
        "V� r�i �? �i�u tra ���c g� r�i?",
        "��ng nh� ng��i d� �o�n. B�n n�y b� 1 ng��i t�n l� {Ti�u H�n} x�i gi�c. Ch�ng v�n l� du d�n ngo�i quan �i! H�y! C�ng ch� v� 2 ch� Ph� qu� m� th�i!",
        "Nghe n�i t�n Ti�u H�n n�y l� ng��i Li�u qu�c. L�n n�y may nh� c� <sex>, h�m�.",
        "L�o Th�i qu�n! T�i h� c�n chuy�n n�y mu�n h�i ng��i!",
        "L� chuy�n g�?",
        "T�i h� nghe 1 t�n C�n �� n�i: {Ti�u H�n} �ang mu�n t�m 1 ng��i t�n {B�ch Th�o �ng}! Th�i Qu�n c� nghe qua ng��i n�y ch�a?",
        "B�ch Th�o �ng? Ng��i n�y l� 1 th�n y � Bi�n Kinh. Kh�ng bi�t t�n Ti�u H�n kia t�m �ng ta �� l�m g�? Ng��i h�y mau ��n H�nh Hoa th�n �� b�o v� cho B�ch Th�o �ng! Nh�n ti�n �i�u tra manh m�i!",
        "Tu�n l�nh! T�i h� �i ngay!"
    };

    ---�����ڹ�
	if GetItemCount(2,0,46) >= 5 then
		TalkEx("task_006_02", strMain);
	else
		Talk(1,"task_006_01","Ng��i v�n ch�a l�y ���c kh�u cung t�n C�n �� n�o sao?");
	end;
end;

function task_006_01()
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 199, KILL_BJ_WL);
    end;
end;

function task_006_02()
	Msg2Player("��n H�nh Hoa th�n b�o v� B�ch Th�o �ng");
	TaskTip("��n H�nh Hoa th�n b�o v� B�ch Th�o �ng");
	
	GivePlayerAward("Level_10", "hard", "legs", "Level_15");    --����
	GivePlayerExp(SkeyBJShuxin,"wulai2")		--����2
	RemoveTrigger(GetTrigger(KILL_BJ_WL));
	DelItem(2,0,46,5);
	SetTask(TASK_BJ_ID, 7);
end;


function task_007_00()
    local strMain = {
    	"�.",
    	"V� c� n��ng n�y! T�i h� ��n th�m B�ch Th�o �ng ti�n b�i! Xin h�i�",
    	"[C� g�i m�p m�y m�i nh�ng kh�ng ph�t ra ti�ng]",
    	"Ta c� th� gi�p g� c� n��ng kh�ng?",
    	"[��a b�n 1 t� gi�y]",
    	"{T� Ong 5 c�i}, t�m � {H�nh Hoa th�n}; {C�t C�nh 5 c�i} t�m � ngo�i th�nh {Nam Bi�n Kinh}���y l� b�i thu�c?",
    	"[C� g�i g�t ��u]",
    	"���c! Xin ��i t�i h� �i l�y ch�ng v�!"
    }
    TalkEx("task_007_01", strMain);
end;

function task_007_01()
	Msg2Player("B�ch Th�y B�nh nh� b�n �i t�m 5 T� Ong v� ��n ph�a Nam Bi�n Kinh t�m 5 C�t C�nh");
	TaskTip("B�ch Th�y B�nh nh� b�n �i t�m 5 T� Ong v� ��n ph�a Nam Bi�n Kinh t�m 5 C�t C�nh");
	SetTask(TASK_BJ_ID, 8);
end;


function task_008_00()

local strMain = {
	"[C� g�i c� v� r�t c�ng th�ng]",
	"C� n��ng! Ta �� mang d��c li�u v� ��y!",
	"[C� g�i l�p t�c ph�i thu�c, sau �� u�ng ngay]",
	"<sex>! �n c�u m�ng n�y ti�u n� xin t�c d� ghi �n! <sex>! Xin h�i ng��i t�m gia ph� c�a ti�u n� c� vi�c g�?",
	"Ta ph�ng m�nh Xa Th�i Qu�n ��n b�o v� cho B�ch l�o b�!",
	"�i!...Ng��i ��n ch�m 1 b��c r�i! Gia ph� m�y ng�y tr��c �� b� 1 ��m cao th� ��n b�t �i ��u kh�ng bi�t n�a!",
	"Th�t ��ng tr�ch! Gi� c� c�ch n�o t�m ���c t�ng t�ch c�a l�nh �ng kh�ng?",
	"Vi�c n�y c�ng kh�ng kh� g�! Gi� h�y ra ngo�i b�t 1 �t Thi�t Gi�p tr�ng. Lo�i n�y r�t th�ch m�i thu�c tr�n ng��i gia ph�! Nh�t ��nh ch�ng s� bay �i d�n ���ng ch�ng ta. <sex>! Xin h�y �i ra th�n t�m 10 No�n tr�ng v� cho ti�u n� luy�n thu�c tr��c ��!",
	"Chuy�n nh�! Xin ��i tin t�i h�!",
}

    -- �䳲 2��1��13  �۹� 1��2��2
	if GetItemCount(2, 1, 13) >= 5 and GetItemCount(1, 2, 2) >= 5 then
		TalkEx("task_008_01", strMain);
	else
		Talk(1,"","�.");
	end;
	
end;

function task_008_01()
	Msg2Player("B�ch Th�y B�nh nh� b�n �i t�m 10 No�n tr�ng");
	TaskTip("B�ch Th�y B�nh nh� b�n �i t�m 10 No�n tr�ng");
	
	GivePlayerAward("Level_14", "easy");    --����
	GivePlayerExp(SkeyBJShuxin,"yaoshimizong")		--ҩ������
	--ɾ�� 5 ���䳲��5���۹�
	DelItem(2, 1, 13, 5);
	DelItem(1, 2, 2, 5);
	SetTask(TASK_BJ_ID, 9);
end;


function task_009_00()

local strMain = {
	"<sex> No�n tr�ng �� t�m ���c ch�a?",
	"C� ph�i l� 10 No�n tr�ng n�y kh�ng?",
	"[B�ch Th�y B�nh b� No�n tr�ng v�o 1 b�nh s�]",
	"��y l� M�ch T�ng C�. <sex>! B�n Thi�t Gi�p tr�ng n�y s� d�n ng��i ��n n�i c�a gia ph�. <sex>! Gi� xin tr�ng c�y v�o t�i ngh� c�a ng��i! Mong <sex> v� gia ph� b�nh y�n tr� v�!",
	"C� n��ng y�n t�m! ��y c�ng l� chuy�n c�a t�i h�!",
}

	if (GetItemCount(2, 1, 6) >= 10) then
		TalkEx("task_009_01", strMain);
	else
		Talk(1,"","�� t�m ���c 10 No�n tr�ng ch�a?");
	end;

end;

function task_009_01()
	
	-- ����������ٽ�׹�
	AddItem(2,0,47,1);
	Msg2Player("B�n mang theo M�ch T�ng C� �i t�m tung t�ch B�ch Th�o �ng!");
	TaskTip("B�n mang theo M�ch T�ng C� �i t�m tung t�ch B�ch Th�o �ng!");
	
	GivePlayerAward("Level_14", "hard", "legs", "Level_16");    --����
	GivePlayerExp(SkeyBJShuxin,"shimiliaoren")		--��������
	
	-- ɾ������
	DelItem(2, 1, 6, 10);
	SetTask(TASK_BJ_ID, 10);
end;

function task_010_00()
    Talk(1,"","Xin mang theo M�ch T�ng C� n�y �i t�m Gia ph�!");
    if GetItemCount(2,0,47) == 0 then
        AddItem(2,0,47,1);
    end;
end;

function task_013_00()
    local szTalk = {
    	"<sex> �� v� r�i �? M�i vi�c thu�n l�i ch�?",
        "Kh�u ��i nh�n! ��y c� 1 b�c th� c�a {Thi�n �m gi�o}! Xin ng��i ��c qua!",
        "[Kh�u Chu�n ��c nhanh]",
        "Ra l� v�y!...Ta nghe n�i Thi�n �m gi�o l� m�t t�ng gi�o th�n b� r�t c� �nh h��ng v�i gi�i qu� t�c Li�u qu�c. Li�n quan ��n Tr��ng ca m�n, t�t nh�t n�n �i h�i Tri�u Di�n Ni�n!",
        "V�y t�i h� �i b�i ki�n Tri�u ti�n b�i ��y!",
        "Ng��i �� v� ta m� v�t v� nhi�u qu�! C� ch�t t�nh �, xin <sex> nh�n l�y!"
    };
    TalkEx("task_013_01", szTalk);
end;

function task_013_01()
    SetTask(TASK_BJ_ID, 14);
    
    GivePlayerAward("Level_18", "hell", "chest", "Level_18");    --����
    GivePlayerExp(SkeyBJShuxin,"shitaijinji1")		--��̬����1
    SetTask(111, 101) --�������������
end;

function task_014_00()
    local szTalk = {
        "Thi�n �m gi�o l� 1 t�ng gi�o th�n b� r�t c� �nh h��ng v�i gi�i qu� t�c Li�u qu�c. Li�n quan ��n Tr��ng ca m�n, ng��i t�t nh�t n�n �i h�i Tri�u Di�n Ni�n!"
    };
end;