
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ü��������ʵ�崦��ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- ������Ի��ı�������

-- ������׵ĶԻ�
EM_MANTALK_01 = 1006;
-- �������ҵĶԻ�
EM_MANTALK_02 = 1007;
-- ��������ĶԻ�
EM_MANTALK_03 = 1008;
-- �����񶡵ĶԻ�
EM_MANTALK_04 = 1011;

-- ������ʦ̫�ĶԻ�
function task_001()

local strMain = {
		"G�n Th�nh �� x�y ra n�n ��i ch�a t�ng th�y trong 100 n�m qua. �� t� Nga My ta �� �i c�u t�, th�t s� kh�ng th� ki�m tra n�ng l�c ng��i l�c n�y. N�u ng��i c� l�ng c� th� h� s�n �i c�u t� d�n ch�ng?",
		"Ta n�n l�m th� n�o?",
		"<color=yellow>Chu Thi�n Nh�n<color> � Th�nh �� ph� l� ng��i c� l�ng h�o t�m, y �ang c�u t� d�n ch�ng � <color=yellow>T�n T��ng T�<color>, ng��i h�y gi�p y m�t tay."
	}
	
TE_Talk(getn(strMain), "task_002", strMain);

end

-- ������ʦ̫�ĶԻ�������ı������1
function task_002()

	SetTask(1003,1);
	
	TaskTip("Mau �i Th�nh �� gi�p Chu Thi�n Nh�n!");
	
end

-- �������˵ĶԻ�
function task_003()

local strMain = {
		"Ta mu�n ph�t ti�n �� c�u t� nh�ng b�n gia nh�n th� b�n gi�p n�u ch�o. Phi�n c� n��ng ��n th�ng b�o cho <color=yellow>N�n d�n Gi�p, �t, B�nh, �inh<color> � c�ng th�nh, b�o h� ��n nh�n c�u t�.",
		"�� th� �� ta �i thay �ng."
	}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- �������˵ĶԻ�������ı������2
function task_004()

	SetTask(1003,2);
	
	TaskTip("H�y th�ng b�o cho N�n d�n Gi�p, �t, B�nh, �inh � c�ng th�nh ��n nh�n c�u t�!");

end

-- ������׵ĶԻ�
function task_005()

local strMain = {
		"Chu Thi�n Nh�n m� kho ph�t l��ng th�c, sai ta ��n th�ng b�o cho ng��i bi�t.",
		"�a t� c� n��ng �� ��n b�o tin! �n ngh�a n�y c� ��i ta s� kh�ng qu�n!",
		"��ng kh�ch s�o! Ng��i mau �i �i!"
	}

TE_Talk(getn(strMain), "task_005_add", strMain);

TaskTip("B�n �� b�o tin cho N�n d�n Gi�p!");

end

function task_005_add()

	SetTask(EM_MANTALK_01,1);

end

-- �������ҵĶԻ�
function task_006()

local strMain = {
		"Chu Thi�n Nh�n m� kho ph�t l��ng th�c, sai ta ��n th�ng b�o cho ng��i bi�t.",
		"�a t� c� n��ng �� ��n b�o tin! �n ngh�a n�y c� ��i ta s� kh�ng qu�n!",
		"��ng kh�ch s�o! Ng��i mau �i �i!"
	}

TE_Talk(getn(strMain), "task_006_add", strMain);

TaskTip("B�n �� b�o tin cho N�n d�n �t!");

end

function task_006_add()

	SetTask(EM_MANTALK_02,1);

end

-- ��������ĶԻ�
function task_007()

local strMain = {
		"Chu Thi�n Nh�n m� kho ph�t l��ng th�c, sai ta ��n th�ng b�o cho ng��i bi�t.",
		"�a t� c� n��ng �� ��n b�o tin! �n ngh�a n�y c� ��i ta s� kh�ng qu�n!",
		"��ng kh�ch s�o! Ng��i mau �i �i!"
	}

TE_Talk(getn(strMain), "task_007_add", strMain);

TaskTip("B�n �� b�o tin cho N�n d�n B�nh!");

end

function task_007_add()

	SetTask(EM_MANTALK_03,1);

end


-- �����񶡵ĶԻ�
function task_007_01()

local strMain = {
		"Chu Thi�n Nh�n m� kho ph�t l��ng th�c, sai ta ��n th�ng b�o cho ng��i bi�t.",
		"�a t� c� n��ng �� ��n b�o tin! �n ngh�a n�y c� ��i ta s� kh�ng qu�n!",
		"��ng kh�ch s�o! Ng��i mau �i �i!"
	}

TE_Talk(getn(strMain), "task_007_01_add", strMain);

TaskTip("B�n �� b�o tin cho N�n d�n �inh!");

end


function task_007_01_add()

	SetTask(EM_MANTALK_04,1);

end


-- ��ȥ�������˵ĶԻ�
function task_008()

local strMain = {
		"Ta �� b�o tin cho t�t c� c�c n�n d�n.",
		"�a t� c� n��ng!",
		"� ng�i l�?",
		"Ta v�a nh�n ���c tin: ng�y mai trong th�nh v�t gi� c�a c�c c�a hi�u l�n s� t�ng 3 l�n, th� th� n�n d�n l�m sao s�ng?",
		"Ch�ng l� c�c ch� ti�m trong th�nh kh�ng c� ch�t l��ng t�m sao?",
		"Chuy�n n�y c�ng kh�ng th� tr�ch h�, ch� y�u l� trong th�nh c� 1 t�n L�u Manh chuy�n h� hi�p b� t�nh l��ng thi�n.",
		"B�n ch�ng d�m l�ng h�nh th� �? Nh�t ��nh ph�i cho ch�ng b�i h�c.",
		"L�u Manh � ph�a <color=yellow>T�y Th�nh ��<color>, c� n��ng qu� c� l�ng, h�y tr�ng tr� ch�ng v� l�y <color=yellow>2 b�nh Thi�u t�u<color> v�!"
	}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- �������˶Ի���ı����������4
function task_009()

	SetTask(1003,4); -- ֱ�ӱ䵽 4
	TaskTip("B�n h�y gi�o hu�n L�u Manh � T�y Th�nh ��, l�y 2 b�nh Thi�u t�u!");
end

-- ����������ı����������4
--function task_010()
--	FN_SetTaskAdd(FN_EM);
--end

-- ��ȥ��������
function task_011()

local strMain = {
		"C� n��ng kh�ng h� danh l� �� t� Nga My.",
		"Ta kh�ng ph�i �� t� Nga My, Ch�n Nh� S� Th�i n�i kh�ng c� th�i gian th� th�ch ta.",
		"V�i b�n l�nh c�a c� n��ng th� c�n g� th� th�ch. Ta s� cho b� c�u chuy�n th� ��n S� Th�i. C� n��ng h�y quay v� Nga My.",
		"Xin �a t�!"
	}

if (GetItemCount(2,1,12)>=2) then
	DelItem(2,1,12,2);
	TE_Talk(getn(strMain), "task_012", strMain);
else
	Say("��m L�u Manh � T�y Th�nh �� r�t l�ng h�nh, l�n n�y c� n��ng �i ph�i c�n th�n!",0);
	return
end;

end

-- �������˶Ի���ı������5
function task_012()
	SetTask(1003,5);
	TaskTip("Chu Thi�n Nh�n b�o b�n ��n g�p Ch�n Nh� S� Th�i!");
end


-- ��ȥ������ʦ̫�ĶԻ�
function task_013()

local strMain = {
		"Ng��i ch�a nh�p m�n n�u c� th� l�m xong vi�c n�y ta s� thu nh�n ng��i l�m �� t� Nga My.",
		"�a t� s� ph�! �� t� nh�t ��nh xin ghi nh� l�i c�a s� ph� su�t ��i."
	}

TE_Talk(getn(strMain), "task_014", strMain);

end

-- ������ʦ̫�Ի���ı����������6
function task_014()

	SetTask(1003,6);
	
	SetPlayerFaction(3);
	SetPlayerRoute(7);
	i=GetBody()
	if i==3 then 
		AddItem(0,109,81,1)
		AddItem(0,108,81,1)
	else 
		AddItem(0,109,85,1)
		AddItem(0,108,85,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ��������");
	TaskTip("B�n �� gia nh�p Nga My, c� th� b�i s� h�c ngh�!");
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_em()
FN_SetTaskState(FN_EM, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! Ng��i c� th� gia nh�p m�n ph�i l�i.",0);
end;