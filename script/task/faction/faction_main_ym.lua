
-- ������Ե II ʦ������
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ Ů�����


-- ��ʼ����̫���Ի�

function task_001()

local strMain = {
	"Ng��i �? N�i ��y l� qu�n doanh, c� n��ng c� ch�u ���c kh� c�c?",
	"D��ng M�n n� t��ng vang danh thi�n h�, Xa Th�i Qu�n sao l�i coi th��ng t�i h�?",
	"Ha ha! Th�i ���c! Ng��i h�y �i t�m M�c Qu� Anh, m�i vi�c c�a D��ng M�n ��u do c� ta qu�n l�.",
	"�a t� Xa Th�i Qu�n!",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("�i t�m M�c Qu� Anh xin gia nh�p D��ng m�n!");

end

-- �Ի��������ı������1
function task_002()

	SetTask(1032,1);

end

-- ���¹�Ӣ�Ի�1
function task_003()

local strMain = {
  "M�c t��ng qu�n! Ta mu�n gia nh�p D��ng M�n, Xa Th�i Qu�n b�o ta ��n t�m ng��i.",
	"Gia nh�p D��ng M�n? Hay l�m! M�c d� n� t�t kh�ng thu�c Khu M�t vi�n cai qu�n nh�ng ph�i ���c s� ��ng � c�a tri�u ��nh.",
	"H�y ��n Bi�n Kinh t�m Th�a t��ng <color=yellow>Tri�u Ph�<color> ghi t�n v�o s� r�i quay l�i ��y!",
  "�a t� M�c t��ng qu�n!",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("M�c Qu� Anh b�o b�n �i Bi�n Kinh t�m Tri�u Ph�");

end

-- �Ի��������ı������2
function task_004()

	SetTask(1032,2);

end


-- �����նԻ�1
function task_005()

local strMain = {
  "Tri�u ��i nh�n! T�i h� l� t�n binh c�a D��ng M�n, M�c Qu� Anh b�o t�i h� ��n ��y �� ghi danh v�o s�.",
	"Tr��c ��y th� ��ng l� ��n ch� ta �� ghi t�n v�o danh s�ch nh�ng g�n ��y vi�c n�y ���c chuy�n cho C�m qu�n l�m.",
	"H�y ��n c�ng ch�nh Ho�ng cung t�m <color=yellow>C�m qu�n<color> h�i t�nh h�nh c� th�.",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("Tri�u Ph� b�o b�n ��n c�ng Ho�ng cung t�m C�m qu�n");

end

-- �Ի��������ı������3
function task_006()

	SetTask(1032,3);

end

-- ����ٶԻ�
function task_007()

local strMain = {
  "D��ng M�n n� binh!?",
	"M�c d� D��ng M�n n� t�t thu�c qu�n l� c�a C�m qu�n nh�ng ch� l� tr�n danh ngh�a �� ti�n s�a ch�a t�n danh s�ch.",
	"Nh�ng th�t s� D��ng M�n v�n thu�c Thi�n Ba ph�, ng��i c� b�m b�o th� v�i Tri�u ��i nh�n.",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("C�m qu�n b�o b�n �i t�m Tri�u Ph�");

end;

-- �Ի��������ı������4
function task_008()

	SetTask(1032,4);

end;


-- �����նԻ�2
function task_009()

local strMain = {
  "Th� ra l� v�y! Nh�ng mu�n C�m qu�n nh�p s� ph�i ��n Khu M�t vi�n t�m T�o B�n ��i nh�n.",
	"Th� n�y v�y! Ta s� n�i v�i T�o ��i nh�n vi�c n�y, ng��i h�y v� b�m b�o <color=yellow>M�c Qu� Anh<color> t��ng qu�n �i!",
	"Phi�n Tri�u ��i nh�n v�y!",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("Tri�u Ph� b�o b�n �i t�m M�c Qu� Anh");

end

-- �Ի��������ı������5
function task_010()

	SetTask(1032,5);

end

-- ���¹�Ӣ�Ի�2
function task_011()

local strMain = {
  "�� xong vi�c r�i �?",
	"��ng v�y! Nh�ng sao l�c th� do C�m qu�n qu�n l� l�c th� Khu M�t vi�n l� th� n�o? Th�t phi�n ph�c!",
	"Vi�c n�y ta c�ng kh�ng r� l�m! Ta ch� lo vi�c qu�n t�nh c�n vi�c quan tr��ng ta kh�ng mu�n ngh� t�i!",
  "Cho n�n ta lu�n � trong ph� hi�m khi g�p b�n h�.", 
  "T�i h� c� th� mua ng�a c�a D��ng M�n � ��u?",
	"Trong ph� c� xa m� ph�ng, qu�n s� trong ph� lo luy�n chi�n m�, ng��i c� th� tr�c ti�p t�m <color=green>D��ng B�i Phong<color>.",
  "Tr�n chi�n tr��ng n�u b� th��ng c�ng l� chuy�n th��ng t�nh cho n�n nh�t ��nh ph�i bi�t c�ch tr� th��ng c� b�n. Ng��i �em <color=yellow>5 cu�n b�ng<color> ��n ��y cho ta.", 
  "B�ng? Ta kh�ng bi�t!",
  "R�t ��n gi�n! ��y l� <color=yellow>k� n�ng giang h�<color> ai c�ng ph�i bi�t. H�y xem trong giao di�n <color=yellow>k� n�ng s�ng<color>.", 
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("M�c Qu� Anh b�o b�n l�m 5 cu�n b�ng");

end

-- �Ի��������ı������6
function task_012()

	SetTask(1032,6);

end

-- ����б�����������ʱ
function task_013()

local strMain = {
		"T�i h� �� l�m xong 5 cu�n b�ng.",
		"Tay ch�n c�ng nhanh nh�n! Gi� h�y ��n g�p <color=yellow>Xa Th�i Qu�n<color>."
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("Nh�n <color=yellow>F5<color> ch�n <color=yellow>S�ng<color> �� xem <color=yellow>k� n�ng s�ng<color>.",0);
		return
	end;

end;

-- �Ի��������ı������7
-- ɾ������
function task_014()
	TaskTip("B�y gi� c� th� g�p Xa Th�i Qu�n");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- ��ȥ����̫���ĶԻ�

function task_015()

local strMain = {
		"T� nay tr� �i ng��i �� tr� th�nh ng��i c�a D��ng Gia T��ng, sau n�y h�y c� g�ng r�n luy�n kh�ng ���c l��i bi�ng.",
		"D��ng Gia T��ng ta tinh th�ng cung m�, D��ng Gia Th��ng n�i ti�ng thi�n h�. N�u ng��i mu�n h�c <color=yellow>Th��ng ph�p<color> ��n t�m <color=yellow>D��ng T�n B�o<color>; n�u mu�n h�c <color=yellow>Cung thu�t<color> ��n t�m <color=yellow>M�c Qu� Anh<color>."
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- �����ŶԻ��������ı����������8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ������ţ�")
	TaskTip("B�n �� gia nh�p D��ng M�n. T�m Gi�o ��u h�c v� c�ng")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ �������


-- ��ʼ����̫���Ի�


function task_101()

local strMain = {
	"Ng��i mu�n gia nh�p D��ng M�n? ��y l� qu�n doanh k� lu�t r�t nghi�m, kh�ng nh� c�c m�n ph�i tr�n giang h�. Ng��i n�n suy ngh� k�.",
	"T�i h� �� ngh� k�, qu�c gia c� n�n, ta c�ng ph�i c� ch�t tr�ch nhi�m",
	"Hay l�m! D��ng M�n nam t�t do <color=yellow>D��ng T�n B�o<color> qu�n l�, h�y �i t�m y.",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip("�i t�m D��ng T�n B�o xin gia nh�p D��ng m�n!");

end

-- �Ի��������ı������1
function task_102()

	SetTask(1031,1);

end

-- �����ڱ��Ի�1
function task_103()

local strMain = {
  "D��ng t��ng qu�n! T�i h� mu�n gia nh�p D��ng M�n, Xa Th�i Qu�n b�o t�i h� ��n t�m ng��i",
	"C� ch� kh�! T�ng qu�n b�o qu�c l� vi�c nam nh�n ��i tr��ng phu n�n l�m!",
  "V�y xem nh� t�i h� �� gia nh�p D��ng M�n r�i �?",
	"Mu�n t�ng qu�n ph�i ���c tri�u ��nh cho ph�p, h�y ��n Bi�n Kinh t�m Khu M�t S� <color=yellow>T�o B�n<color>, �ng ta qu�n l� danh s�ch qu�n s�.",
  "Tu�n l�nh t��ng qu�n!",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("D��ng T�n B�o b�o b�n �i Bi�n Kinh t�m T�o B�n");

end

-- �Ի��������ı������2
function task_104()

	SetTask(1031,2);

end


-- ��ܱ�Ի�1
function task_105()

local strMain = {
  "Ng�i l� T�o B�n ��i nh�n? T�i h� mu�n t�ng qu�n, D��ng T�n B�o t��ng qu�n b�o t�i h� ��n g�p ng�i.",
	"N�u nh� D��ng t��ng qu�n ti�n c� th� kh�ng c� v�n �� g�. Nh�ng ti�u huynh �� c� th� gi�p ta m�t chuy�n?",
  "Xin T�o ��i nh�n c� n�i!",
	"G�n ��y tri�u ��nh c� mua m�t ��n ng�a nh�ng ��n gi� v�n ch�a chuy�n ��n. Ng��i gi�p ta h�i ng��i <color=yellow>B�n ng�a<color> xem bao l�u s� chuy�n ��n.",
  "Th�i ���c!",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("T�o B�n b�o b�n �i Bi�n Kinh t�m B�n ng�a");

end

-- �Ի��������ı������3
function task_106()

	SetTask(1031,3);

end

-- ���꾩���Ի�
function task_107()

local strMain = {
  "�ng ch�! T�o ��i nh�n nh� t�i h�i �ng s� ng�a l�n tr��c ��t bao gi� chuy�n ��n.",
	"Ng�a c�a T�o ��i nh�n? Ta s� l�p t�c chuy�n qua.",
  "Xin �a t�!",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("Quay v� g�p T�o B�n");

end;

-- �Ի��������ı������4
function task_108()

	SetTask(1031,4);

end;


-- ��ܱ�Ի�2
function task_109()

local strMain = {
  "Th� n�o?",
	"B�n ng�a n�i s� l�p t�c chuy�n ��n.",
  "Hay l�m! ��i T�ng v� Khi�t �an �ang giao chi�n, chi�n m� r�t quan tr�ng ��i v�i c�c k� binh ngo�i chi�n tr��ng.",
  "Cho n�n nh�t ��nh mua nhi�u chi�n m�.",
  "Ng��i mu�n gia nh�p D��ng M�n, ch�nh l� l�y k� binh l�m ch�, sau n�y ph�i c� g�ng r�n luy�n.",
	"Ng��i trong D��ng M�n c�ng ��n Bi�n Kinh mua ng�a?",
  "C�ng ���c! Nh�ng trong D��ng M�n c� m� ph�ng do m�t a ho�n qu�n l�, D��ng Gia qu�n c� th� ��n �� l�y chi�n m�.",
	"T�i h� hi�u r�!",
  "���c r�i! Gi� ng��i c� th� v� g�p <color=yellow>D��ng T�n B�o<color>, ta s� �i�n t�n ng��i v�o danh s�ch.",
	"�a t� ��i nh�n!",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("T�o B�n b�o b�n �i t�m D��ng T�n B�o");

end

-- �Ի��������ı������5
function task_110()

	SetTask(1031,5);

end

-- �����ڱ��Ի�2
function task_111()

local strMain = {
  "M�i vi�c th� n�o r�i?",
	"�� �i�n t�n v�o s�!",
	"T�t l�m!",
  "Binh s� nhi�u n�n l��ng th�c c�ng l� vi�c r�t c�p b�ch. Nhi�u khi l�c h�nh qu�n, binh s� ph�i t� lo l��ng th�c.", 
  "H�y �i ��nh b�n <color=yellow> C�n ��<color> l�y <color=yellow> 2 ph�n th�t g� <color> v� ��y tr��c ��!", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("D��ng T�n B�o b�o b�n t�m 2 ph�n th�t G�");

end

-- �Ի��������ı������6
function task_112()

	SetTask(1031,6);

end

-- ����м�����������ʱ
function task_113()

local strMain = {
		"�� l�m xong r�i!",
	  "Nhanh v�y! Qu� l� c� ti�m ch�t �� t�ng qu�n!",
		"B�y gi� ng��i c� th� ��n g�p <color=yellow>Xa Th�i Qu�n<color>.",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("Ch�a l�m xong �?",0);
		return
	end;

end;

-- �Ի��������ı������7
-- ɾ������
function task_114()
	TaskTip("B�y gi� c� th� g�p Xa Th�i Qu�n");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- ��ȥ����̫���ĶԻ�

function task_115()

local strMain = {
		"D��ng T�n B�o �� ��ng �? Hay l�m! T� gi� ng��i �� l� m�t th�nh vi�n c�a D��ng Gia T��ng. B�n doanh qu�n lu�t r�t nghi�m. Ph�i lu�n tu�n th� nh�!",
    "D��ng Gia T��ng ta tinh th�ng cung m�, D��ng Gia Th��ng n�i ti�ng thi�n h�. N�u ng��i mu�n h�c <color=yellow>Th��ng ph�p<color> ��n t�m <color=yellow>D��ng T�n B�o<color>; n�u mu�n h�c <color=yellow>Cung thu�t<color> ��n t�m <color=yellow>M�c Qu� Anh<color>.",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- �����ŶԻ��������ı����������8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ������ţ�")
	TaskTip("B�n �� gia nh�p D��ng M�n. T�m Gi�o ��u h�c v� c�ng")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c kh�c ph�c, gi� ng��i c� th� nh�p m�n l�i.",0);
end;


