
-- ������Ե II ʦ������
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

-- ��ʼ�����ȶԻ�
function task_001()

local strMain = {
	"Xin th� ch� t�y tr�n tr��c sau �� quay l�i t�m b�n t�ng.",
	"M�i vi�c th� ch� c� th� h�i Huy�n Minh."
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("�i t�m Huy�n Minh h�i chuy�n nh�p m�n!");

end

-- �Ի��������ı������1
function task_002()

	SetTask(1001,1);

end

-- �������Ի�
function task_003()

local strMain = {
	"Tr��c t� c� con su�i nh�, m�i Th� ch� ��n �� t�m <color=yellow>H�a C�ng ��u (177.204)<color> �� t�y tr�n, sau �� h�y quay l�i t�m ta."
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("�i t�m H�a C�ng ��u (177.204)!");

end

-- �Ի��������ı������2
function task_004()

	SetTask(1001,2);

end


-- ��﹤ͷ�Ի�
function task_005()

local strMain = {
	"Xin Th� ch� b� th� 50 ��ng ti�n nhang ��n r�i h�y t�y tr�n t�nh th�n.",
	"��a 50 ��ng/task_005_okay",
	"Ta kh�ng mang theo ti�n/task_005_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_005_okay()

	if (Pay(50) == 1) then
	
		-- �Ի��������ı������3
		SetTask(1001,3);
		
		Say("Th� ch� h�y t�nh t�m tr��c ��! H�y �i g�p Th� t�a Huy�n Minh �� ���c h��ng d�n!",0);
		RestoreStamina()
		
		TaskTip("H�a C�ng ��u b�o b�n �i t�m Huy�n Minh!");
		
	else
		Say("Th� ch� t�m �� 50 ��ng r�i h�y quay l�i!",0);
	end

end


function task_005_no()

	Say("Th� ch� t�m �� 50 ��ng r�i h�y quay l�i!",0);
	
end


-- �ؼ������ĶԻ�
function task_006()

local strMain = {
	"Ph�m �� t� Thi�u L�m ta, tr��c khi nh�p t� ph�i c�ng 1 ch�n <color=yellow>ch�o L�p B�t<color> �� t� l�ng th�nh k�nh.",
	"Th� ch� c� th� ��n <color=yellow>ch�n n�i<color> h�i <color=yellow>H��ng Kh�ch<color>, b�n h� th�nh t�m l� Ph�t ch�c c� th� ��."
	}

TE_Talk(getn(strMain), "task_007", strMain);

TaskTip("H�y xu�ng ch�n n�i t�m H��ng Kh�ch xin 1 ch�n ch�o L�p B�t!");

end


-- �Ի��������ı������4
function task_007()

	SetTask(1001,4);
		
end


-- ��ɽ�µ���ͶԻ�
function task_008()

local strMain = {
	"��i th�c! Ta mu�n gia nh�p Thi�u L�m nh�ng thi�u m�t ch�n ch�o L�p B�t �� c�ng Ph�t t�, kh�ng bi�t �ng c� th� cho ta xin 1 ch�n?",
	"Cho ng��i? N�i d� nghe th�! Ch�o L�p B�t c�a ta ph�i d�ng Xuy�n B�i, C�t C�nh, Kim Li�n Hoa, B�t T� Th�o v� Thi�n S�n Tuy�t Li�n n�u trong b�y b�y b�n m��i ch�n ng�y! Cho ng��i �! H�!",
	"V�n b�i v� tri! Xin ��i th�c ch� �i�m th�m!",
	"�i 3 ng�y ���ng, ta c�ng m�t r�i, tr� phi ng��i v�n d�ng <color=yellow>K� n�ng giang h�<color> l�m <color=yellow>3 c�i b�nh ng�<color> �� ��i, n�u kh�ng ta s� �n ch�n ch�o n�y!",
	"Kh�ng ph�i ��i th�c d�ng ch�n ch�o n�y �� k�nh Ph�t �? Hu�ng chi t�i h� c�ng ch�ng c� k� n�ng giang h�.",
	"K�m qu�! K� n�ng giang h� l� b�n n�ng v�n c� c�a m�i ng��i, ng��i ch� c�n nh�n <color=yellow><F5><color> m� giao di�n k� n�ng v� c�ng, nh�n ch�n <color=yellow>S�ng<color> s� hi�u.",
	"V�n b�i s� th� l�m b�nh ng�, ��i th�c h�y ch� l�y!"
	}
	
TE_Talk(getn(strMain), "task_009", strMain);

end

-- �Ի��������ı������5
function task_009()
	TaskTip("H��ng Kh�ch b�o b�n l�m 3 c�i b�nh ng� ��i ch�o L�p B�t!");
	SetTask(1001,5);
end

-- �������ͷ��������ʱ
function task_010()

local strMain = {
		"��i th�c! ��y l� b�nh ng� c�a ng��i!",
		"Hay l�m! Ch�n <color=yellow>Ch�o L�p B�t<color> n�y xin d�ng l�n Ph�t t� d�m!"
	}

	if (GetItemCount(1,1,1)>=3) then
		TE_Talk(getn(strMain), "task_011", strMain);		
	else
		Say("Ch�a l�m xong b�nh ng�? H�y mau l�n n�u kh�ng ta s� �n ch�n ch�o n�y �!",0);
		return
	end;

end;

-- �Ի��������ı������6
-- ɾ����ͷ������������
function task_011()
	TaskTip("B�n �� l�y ���c ch�o L�p B�t, c� th� quay v� t�m Huy�n Minh!");
	DelItem(1,1,1,3);
	AddItem(2,0,5,1);
	SetTask(1001,6);
end;


-- ��ȥ�������ĶԻ�
function task_012()

local strMain = {
	"A Di �� Ph�t!",
	"Th� ch� t�y tr�n xong, c� th� �i t�m <color=yellow>Ph��ng Tr��ng ��i S�<color> �� gia nh�p Thi�u L�m!"
	}

TE_Talk(getn(strMain), "task_013", strMain);

TaskTip("Huy�n Minh b�o b�n t�m Ph��ng Tr��ng �� gia nh�p Thi�u L�m!");

end


-- �۳������࣬�ı������7
function task_013()

DelItem(2,0,5,1);
SetTask(1001,7);

end


-- ��ȥ�����ȵĶԻ�
function task_014()

local strMain = {
	"Mu�n gia nh�p Ph�t m�n ta ph�i h�nh thi�n t�ch ��c, kh�ng ���c lo�n s�t v� c�, th� ch� c� th� l�m ���c kh�ng?",
	"��ng �/task_015",
	"Kh�ng ��ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_015()

local strMain = {
	"Gia nh�p Ph�t m�n ph�i t�nh t�m tu h�nh, th� ch� c� l�m ���c kh�ng?",
	"��ng �/task_016",
	"Kh�ng ��ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_016()

local strMain = {
	"Gia nh�p Ph�t m�n l�c c�n thanh t�nh, kh�ng ���c c� t� ni�m, d�m �! Th� ch� c� l�m ���c kh�ng?",
	"��ng �/task_017",
	"Kh�ng ��ng �/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_017()
	-- �Ի��������ı������8
	SetTask(1001,8);
	SetPlayerFaction(1)
	SetPlayerRoute(1)
	Say("A Di �� Ph�t! Hoan ngh�nh Thi�u hi�p gia nh�p Thi�u L�m.",0);
	i=GetBody()
	if i==1 then 
		AddItem(0,109,73,1)
		AddItem(0,108,73,1)
	else 
		AddItem(0,109,77,1)
		AddItem(0,108,77,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ��������ɣ�")
	TaskTip("B�n �� gia nh�p Thi�u L�m, c� th� b�i s� h�c ngh�!")

	-- ����������������״̬
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


-- ѡ�񲻵�ѡ��
function task_no()
	Say("Th� ch� c�n v��ng v�n h�ng tr�n, b�n t� kh�ng th� thu nh�n! Xin Th� ch� v� �i!",0);
end


function fix_sl()
FN_SetTaskState(FN_SL, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! Thi�u hi�p c� th� gia nh�p m�n ph�i l�i.",0);
end;