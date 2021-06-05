
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ؤ����������ʵ�崦��ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- Ϊ��ʡ����������������������Ϊ 8 BIT��ֻ����ǰ���
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

-- ��������ĶԻ�
function task_001()

local strMain = {
		"C�i Bang ta tuy x�ng l� Thi�n H� �� Nh�t ��i Bang, nh�ng ��u l� �n m�y, c� b�a nay kh�ng bi�t ng�y mai. Ng��i b�n tr�! H�y lo thi c�, kh�ng n�n ch�n v�i ti�n �� t�t ��p c�a m�nh.",
		"L�o ti�n b�i! C�i Bang b�c ch�ng Li�u, T�y ch�ng T�y H�, Nam ch�ng Th� Ph�n, v� qu�c qu�n th�n ��u l� nh�ng anh h�ng h�o hi�t, sao gi�ng �n xin b�nh th��ng ch�?",
		"T�i h� lu�n mu�n cu�c s�ng ti�u di�u t� t�i nh� ng��i trong C�i bang, c�i mong Bang ch� thu nh�n t�i h�.",
		"H�y ra ngo�i th�nh ��nh t�n L�u Manh l�y <color=yellow>6 b�nh Thi�u t�u<color>, r�t cho <color=yellow>c�c huynh �� trong bang<color> m�i ng��i 1 ch�n, �� ch�ng ki�n ng��i v�o bang.",
		"�� t� tu�n l�nh!"
	}

TaskTip("Long T�i Thi�n nh� b�n t�m 6 b�nh Thi�u t�u ph�n ph�t cho c�c �� t� C�i Bang!");

TE_Talk(getn(strMain), "task_002", strMain);

end

-- ��������Ի�������ı������1
function task_002()

	SetTask(1004,1);

end

-- ����ߵĶԻ�
function task_003()
local strMain = {
		"Ta �� nh�n ���c Nh�p Bang t�u c�a ng��i! Xin �a t�."
	}

TaskTip("B�n �� d�ng Nh�p Bang t�u cho H�ng Th�t!");

TE_Talk(getn(strMain), "task_003_add", strMain);

end

function task_003_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_001, 1));
end


-- ����֪ζ�ĶԻ�
function task_004()
local strMain = {
		"Ta �� nh�n ���c Nh�p Bang t�u c�a ng��i! Gi�i l�m! Nh�p bang xong ��n ch� ta c�n ch�n!"
	}
	
TaskTip("B�n �� d�ng Nh�p Bang t�u cho V�u Tri V�!");

TE_Talk(getn(strMain), "task_004_add", strMain);

end

function task_004_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_002, 1));
end


-- ����Ԫ���ĶԻ�
function task_005()
local strMain = {
		"Ta �� nh�n ���c Nh�p Bang t�u c�a ng��i! H�y suy ngh� k� n�n ch�n sau n�y theo � Y hay T�nh Y?"
	}

TaskTip("B�n �� d�ng Nh�p Bang t�u cho T�ng Nguy�n An!");

TE_Talk(getn(strMain), "task_005_add", strMain);

end

function task_005_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_003, 1));
end


-- �������ĶԻ�
function task_006()
local strMain = {
		"Ta �� nh�n ���c Nh�p Bang t�u c�a ng��i! H�y suy ngh� k� n�n ch�n sau n�y theo � Y hay T�nh Y?"
	}

TaskTip("B�n �� d�ng Nh�p Bang t�u cho M� T�nh Sinh!");

TE_Talk(getn(strMain), "task_006_add", strMain);

end

function task_006_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_004, 1));
end


-- ����Ӻ׵ĶԻ�
function task_007()
local strMain = {
		"Ta �� nh�n ���c Nh�p Bang t�u c�a ng��i! Sau khi nh�p bang ph�i tu�n th� Bang quy n�u kh�ng ta s� kh�ng dung t�nh."
	}

TaskTip("B�n �� d�ng Nh�p Bang t�u cho Tr�n Chung H�c!");

TE_Talk(getn(strMain), "task_007_add", strMain);

end

function task_007_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005)

	if (n==0) then
		DelItem(2,1,12,1);
	end

	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_005, 1));
end


-- ��������������ĶԻ�
function task_008()

local nTalk_001 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001);
local nTalk_002 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002);
local nTalk_003 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003);
local nTalk_004 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004);
local nTalk_005 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005);

local strMain = {
		"Huynh �� trong bang ��u �� c� r��u?",
		"�� ph�n ph�t xong!",
		"Hay l�m! C� ph�c c�ng h��ng c� h�a c�ng chia ch�nh l� ti�u ch� c�a bang ta.",
		"T�m l�ng c�a ng��i qu� hi�m th�y! H�y gia nh�p C�i Bang ta!"
	}

if (nTalk_001==1) and (nTalk_002==1) and (nTalk_003==1) and (nTalk_004==1) and (nTalk_005==1) then
	DelItem(2,1,12,1);
	TaskTip("B�n �� d�ng Nh�p Bang t�u cho Bang ch� Long T�i Thi�n!");
	TE_Talk(getn(strMain), "task_009", strMain);
else
	Say("Ng��i h�y �i t�m m�t �t Thi�u t�u, ph�n ph�t cho huynh �� trong bang",0);
end

end

-- ��������Ի�������ı����������2
function task_009()

	SetTask(1004,2);
	
	SetPlayerFaction(4)
	SetPlayerRoute(10)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,75,1)
		AddItem(0,108,75,1)
	elseif i==2 then
		AddItem(0,109,79,1)
		AddItem(0,108,79,1)
	elseif i==3 then
		AddItem(0,109,83,1)
		AddItem(0,108,83,1)
	else
		AddItem(0,109,87,1)
		AddItem(0,108,87,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ���ؤ��")
	TaskTip("B�n �� gia nh�p C�i Bang, c� th� b�i s� h�c ngh�!")

	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_gb()
FN_SetTaskState(FN_GB, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! B�ng h�u c� th� gia nh�p m�n ph�i l�i.",0);
end;