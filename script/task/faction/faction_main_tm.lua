
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �䵱��������ʵ�崦��ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

function task_001()

local strMain = {
	"���ng M�n ta l� danh m�n T� Xuy�n. Ai ai c�ng mu�n nh�p m�n. Ng��i c� g� h�n ng��i h�y n�i cho l�o l�o ��y bi�t?",
	"T�i h� trung th�nh v�i ���ng M�n, t� x�a ��n nay ch�ng ai b� ���c.",
	"Ti�u t� ng��i c�ng bi�t khua m�i m�a m�p. Ng��i h�y �i t�m <color=yellow>���ng Thi�n Ti�u<color> �� h�n s�p x�p cho ng��i c�ng nh� �� l�o l�o xem ng��i trung th�nh th� n�o."
}

TE_Talk(getn(strMain), "task_002", strMain);

end

-- �Ի��������޸����������1
function task_002()
	TaskTip("�i t�m ���ng Thi�n Ti�u nh�n th� th�ch!");
	SetTask(1005,1);
end


-- ������Х�ĶԻ�
function task_003()

local strMain = {
	"M�i vi�c c� theo � l�o l�o v�y.",
	"���c r�i! Ta s� s�p x�p m�i vi�c cho ng��i. T�ng qu�n ph�ng thu�c <color=yellow>���ng Xu�n<color> �ang ch� 1 lo�i thu�c m�i, c� th� s� c�n ng��i. H�y ��n �� th� xem!"
}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- �Ի��������޸����������2
function task_004()
	TaskTip("�i t�m T�ng qu�n D��c ph�ng ���ng Xu�n!");
	SetTask(1005,2);
end


-- ���ƴ��ĶԻ�
function task_005()

local strMain = {
	"Ng��i ��n l�m t�p d�ch hay l�m thu�c?",
	"L�m T�p d�ch/task_005_01",
	"Ng��i ph�i d��c/task_005_02",
	"Kh�ng l�m/task_005_03"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

-- ѡ��������
function task_005_01()

local strMain = {
	"Ng��i h�y xu�ng n�i t�m <color=yellow>5 R�ng s�i<color> v�. Ch� t�o �� l�u gi� �� xem H�a C�t Ph�n c� th�nh c�ng kh�ng!"
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- ѡ����ҩ��
function task_005_02()

local strMain = {
	"B�n tr�! T� nguy�n ��n l�m thu�c �, ��ng l� c� ch�t l�ng th�nh!",
	"Ch� v� H�a C�t Ph�n c�a ta r�t l�i h�i, v�i c�ng l�c c�a ng��i hi�n gi� n�u th� s� r�t nguy hi�m, h�y xu�ng n�i t�m <color=yellow>5 R�ng s�i x�m<color> v�."
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- ѡ��ʲô������
function task_005_03()

	Say("Th� th�ch c�a ta ng��i kh�ng qua ���c c�n mu�n gia nh�p ���ng M�n, kh�ng l� ng��i l� gian t�?",0);

end


-- ���ƴ��Ի�������ı����������3
function task_005_add()
	TaskTip("���ng Xu�n b�o b�n t�m R�ng s�i x�m!");
	SetTask(1005,3);
end


-- ���������������ƴ��ĶԻ�
function task_006()

local strMain = {
	"Hay l�m! H�a C�t Ph�n qu� nhi�n �� c� c�ng hi�u, t� nay ���ng M�n ta l�i c� m�t v� kh� �� tung ho�nh giang h�.",
	"Ng��i ��n ph�ng c� quan t�m <color=yellow>���ng V�n<color>, h�i �ng ta c�ch s� d�ng H�a C�t Ph�n."
}

	if (GetItemCount(2,1,3)>=5) then
	
		TE_Talk(getn(strMain), "task_007", strMain);
	
	else
	
		Say("Sai ng��i �i t�m <color=yellow>R�ng s�i x�m<color>, sao l�i quay v� ��y?",0);
		return
	
	end

end

-- ɾ�������������ı����������4
function task_007()
	DelItem(2,1,3,5);
	TaskTip("�i t�m ���ng V�n h�i c�ch d�ng H�a C�t Ph�n!");
	SetTask(1005,4);
end

-- �����ƵĶԻ�
function task_008()

local strMain = {
	"D�ng th� n�o �? ���ng nhi�n l� r�c v�o b�y r�i. N�u nh� l� b�n th� ch�ng ta ch�a tr� cho h�, ng��c l�i th� m�c k� ch�ng.",
	"G�n ��y nhi�u ng��i ra v�o ���ng M�n, kh�ng th� kh�ng �� ph�ng. � ��y c� 1 c�i x�ng s�t, ng��i h�y <color=yellow>��o 1 c�i b�y<color> d��i ch�n n�i.",
	"��o �� l�m g�?",
	"H�i nhi�u l�m chi? Sai ng��i ��o b�y th� c� ��o �i, nh� l� ch�n n�i c� 2 c�i c�y t�a �� l� <color=yellow>(196.187)<color>, ��ng n�n nh�m ch�!"
}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- �����ƶԻ���������һ�����²��ı������5
function task_009()
	AddItem(2,0,6,1);
	TaskTip("��n ch�n n�i (196.187) ��o 1 c�i b�y! ");
	SetTask(1005,5);
end


-- ����Ƿ�����ȷ�ĵص�ʹ�������£����ı������6
function task_CheckPos()

local mapID, mapX, mapY = GetWorldPos();

	if (mapX>1562) and (mapX<2993) and (mapY>1579) and (mapY<3019) and (FN_GetTaskState(FN_TM)==5) then
		Say("B�n �� ��o m�t c�i b�y! Quay v� ph�c m�nh ���ng V�n.",0);
		TaskTip("B�n �� ��o m�t c�i b�y! Quay v� ph�c m�nh ���ng V�n.");
		SetTask(1005,6);
	else
		return
	end

end


-- �������Ѿ�����������������Ƹ���
function task_010()

local strMain = {
	"T�t! Kh�ng ng� ng��i l�m vi�c c�ng nhanh nh�n. Chuy�n h�m nay kh�ng ���c n�i cho ng��i kh�c bi�t, ng��i h�y �i t�m <color=yellow>���ng M�n L�o L�o<color> �i."
}

TE_Talk(getn(strMain), "task_011", strMain);

end


-- �����ƶԻ���ı����������7
function task_011()
	DelItem(2,0,6,1);
	TaskTip("�i t�m ���ng M�n L�o L�o!");
	SetTask(1005,7);
end



-- ���������ѵĶԻ�
function task_012()

local strMain = {
	"Tr� tu�i m� c� th� l�m nh�ng vi�c nh� th� th�t ��ng kh�m ph�c! Ta s� nh�n ng��i l�m �� t� ���ng M�n.",
	"H�y nh� m�t khi gia nh�p ���ng M�n, s�ng l�m ng��i c�a ���ng M�n, ch�t l�m ma c�a ���ng M�n. Lu�n lu�n trung th�nh n�u kh�ng s� b� tr�ng tr� nghi�m kh�c",
	"�a t� l�o l�o, �� t� nh�t ��nh ghi nh� trong l�ng."
}

TE_Talk(getn(strMain), "task_013", strMain);

end

-- ���������ѵĶԻ�������ı����������8
function task_013()
	SetPlayerFaction(5)
	SetPlayerRoute(5)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,76,1)
		AddItem(0,108,76,1)
	elseif i==2 then
		AddItem(0,109,80,1)
		AddItem(0,108,80,1)
	elseif i==3 then
		AddItem(0,109,84,1)
		AddItem(0,108,84,1)
	else
		AddItem(0,109,88,1)
		AddItem(0,108,88,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ�������")
	TaskTip("B�n �� gia nh�p ���ng M�n, c� th� b�i s� h�c ngh�!")
	SetTask(1005,8);
	Say("Ta nh�n s� �� bi�t ng��i l� ng��i th�ng minh, gia nh�p ���ng M�n ph�i h�t l�ng v� b�n m�n!",0);
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_WD, 0);
	
end


function fix_tm()
FN_SetTaskState(FN_TM, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! B�ng h�u c� th� gia nh�p m�n ph�i l�i.",0);
end;