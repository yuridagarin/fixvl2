Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("T�ng Giang_Th�y B�c (5)")==1 then	--�����
		Say("Huynh �� ta �� l� Th�nh �n t��ng qu�n chuy�n ph� tr�ch truy b�t t�i ph�m. Ch�ng ta h�nh t�u giang h� c�n ph�i c�n th�n kh�ng ���c l�m lo�n ph�p k�.", 0)
	elseif CTask:CheckTask("T�ng Giang_Th�y B�c (5)")==1 then	--�������
		FinishTask005()
	elseif CTask:IsTaskStart("T�ng Giang_Th�y B�c (5)")==1 then	--������
		Say("Sao? V�n ch�a g�p ���c Ho�ng Th��ng �? Ng��i ��n Bi�n Kinh t�m L� S� S� ngh� c�ch.", 0)
	elseif CTask:CheckTask("T�ng Giang_Th�y B�c (4)")==1 then	--�������
		FinishTask004()
	elseif CTask:IsTaskStart("T�ng Giang_Th�y B�c (4)")==1 then	--������
		Say("��nh b�i Cao C�u �o�t c� L�nh quan binh �t s� t� b�i.", 0)
	elseif CTask:CheckTask("T�ng Giang_Th�y B�c (3)")==1 then	--�������
		FinishTask003()
	elseif CTask:IsTaskStart("T�ng Giang_Th�y B�c (3)")==1 then	--������
		Say("C�i Bang v� L��ng S�n k�t t�nh giao h�u, m�i h� r�ng l�nh.Ng��i ��n �� g�p Long T�i Thi�n bang ch� xem c� c�ch n�o tr� gi�p kh�ng?", 0)
	elseif CTask:CheckCanStart("T�ng Giang_Th�y B�c (3)")==1 then	--������
		StartTask003()
	elseif CTask:IsTaskFinish("T�ng Giang_Th�y B�c (2)")==1 then	--�����
		Say("��n c�p <color=yellow>c�p 35<color> quay l�i t�m ta.", 0)
	elseif CTask:CheckTask("T�ng Giang_Th�y B�c (2)")==1 then	--�������
		FinishTask002()
	elseif CTask:IsTaskStart("T�ng Giang_Th�y B�c (2)")==1 then	--������
		Say("G�n ��y c� m�t t�n gi�c c� d�m m�o mu�i t�n c�a ta �� l�m chuy�n ��i b�i, ng��i �i kh� tr� t�n n�y l�y t�m b�i ph� r�i quay l�i g�p ta!", 0)
	elseif CTask:CheckTask("T�ng Giang_Th�y B�c (1)")==1 then	--�������
		FinishTask001()
	elseif CTask:IsTaskStart("T�ng Giang_Th�y B�c (1)")==1 then	--������
		Say("��n D� Tr� l�m l�y ��u c�a quan sai �em v� ��y m�i c� th� gia nh�p.", 0)
	elseif CTask:CheckCanStart("T�ng Giang_Th�y B�c (1)")==1 then	--������
		StartTask001()
	else	--����ǰ
		Say("Ch�ng ta tuy l� v�o r�ng l�m th�o kh�u nh�ng l�c n�o c�ng kh�ng th� qu�n trung hi�u ��i ngh�a!", 0)
	end
end;


function StartTask001()
	local strMain = {
		"���c V� T�ng � Nh� Long s�n ch� gi�o ��n ��y xin g�p gia nh�p L��ng S�n.",
		"T� l�u �� nghe danh V� Nh� Lang. N�u l� ng��i c�a V� �� ph�i ��n th� ta c�ng kh�ng c�n l� nghi r��m r�. Ng��i tr��c ti�n h�y ch�ng minh b�n l�nh c�a m�nh tr��c khi gia nh�p.",
		"B�ng c�ch n�o?",
		"C� th� �i l�y ��u c�a quan sai r�i quay l�i g�p ta.",
		"H�?",
		"Qu�c c� qu�c ph�p, gia c� gia quy, L��ng S�n c�ng kh�ng n�m ngo�i l�. H�n 100 anh h�ng h�o h�n � ��y ��u nh� v�y c�. N�u kh�ng c� g� ch�ng minh so c� th� tin ���c ng��i ch�? H�y ��n D� Tr� L�m l�y ���c ��u c�a quan sai m�i c� th� gia nh�p.",
}
	CTask:TalkEx(strMain)
	CTask:StartTask("T�ng Giang_Th�y B�c (1)");
	TaskTip("��n D� Tr� l�m l�y ��u quan sai")
end


function FinishTask001()
local strMain = {
	"T�ng ��i ca, �� ho�n th�nh l� ra m�t r�i.",
	"Kh� l�m, qua vi�c l�m v�a r�i �� hi�u ���c b�n l�nh c�a ng��i. T� nay ch�ng ta l� huynh �� h�o h�n m�t nh�. Nh�ng L��ng S�n ch�ng ta c� 10 �i�u l�, 20 lu�t v� 30 nguy�n t�c c�n ph�i nh�. Tr��c ti�n h�y h�c thu�c kh�u hi�u: Thay tr�i h�nh ��o!",
	"Thay tr�i h�nh ��o!",
	"G�n ��y c� m�t t�n gi�c c� d�m m�o mu�i t�n c�a ta �� l�m chuy�n ��i b�i, ng��i �i kh� tr� t�n n�y l�y t�m b�i ph� r�i quay l�i g�p ta!",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("T�ng Giang_Th�y B�c (1)")
	CTask:PayAward("T�ng Giang_Th�y B�c (1)")
	CTask:StartTask("T�ng Giang_Th�y B�c (2)");
	TaskTip("�i tr� t�n gi�c c� l�y b�i ph� v� cho T�ng Giang.")
end;


function FinishTask002()
local strMain = {
	"��i ca �� l�y ���c b�i ph�.",
	"T�n n�y ��ng ph�i ch�t! Ng��i l�m kh� l�m, ��y l� ph�n th��ng. Sau n�y nh� quay l�i ta c�n c� vi�c nh� ng��i.",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("T�ng Giang_Th�y B�c (2)")
	CTask:PayAward("T�ng Giang_Th�y B�c (2)")
	TaskTip("Ho�n th�nh nhi�m v�, c�p 30 ��n g�p T�ng Giang.")
end;


function StartTask003()
	local strMain = {
		"Ng��i ��n ��ng l�c l�m, ta v�a nh�n ���c tin, tri�u ��nh chu�n b� binh m� ti�u di�t L��ng S�n. Ng��i c� ��i s�ch g� kh�ng?",
		"Tr��c ti�n n�n t�n d�ng l�c l��ng c�a L��ng S�n sau �� m�i nh� ��n s� vi�n tr� b�n ngo�i.",
		"C�i Bang v� L��ng S�n k�t t�nh giao h�u, m�i h� r�ng l�nh.Ng��i ��n �� g�p Long T�i Thi�n bang ch� xem c� c�ch n�o tr� gi�p kh�ng?",
}
	CTask:TalkEx(strMain)
	CTask:StartTask("T�ng Giang_Th�y B�c (3)");
	TaskTip("��n C�i Bang nh� Long T�i Thi�n bang ch� vi�n tr� L��ng S�n.")
end


function FinishTask003()
local strMain = {
	"��i ca, Long T�i Thi�n s� ��a �� t� ��n tr� gi�p.",
	"C�i Bang qu� l� ngh�a kh� h�n ng��i, ���c s� tr� gi�p c�a h� th� y�n t�m r�i. Qu�n tri�u ��nh �� k�p ��n ch�n n�i, ng��i mau t�m th�m ��ng ��i ti�u di�t b�n ch�ng.",
	"Ta �i ngay!",
	"D�n ��u ��m qu�n �y l� Cao C�u, ch� c�n ng��i ��nh b�i h�n �o�t ���c c� l�nh l� ���c r�i!",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("T�ng Giang_Th�y B�c (3)")
	CTask:PayAward("T�ng Giang_Th�y B�c (3)")
	CTask:StartTask("T�ng Giang_Th�y B�c (4)");	
	TaskTip("Ph�i h�p v�i ��ng ��i ��nh b�i Cao C�u �o�t c� l�nh.")
end;


function FinishTask004()
local strMain = {
	"��i ca, �� ��nh b�i Cao C�u �o�t ���c c� l�nh.",
	"Ng��i v�t v� qu�. L��ng S�n ch�ng ta c��p c�a ng��i gi�u chia cho ng��i ngh�o, ��ng qu�n c�u kh�u hi�u: Thay tr�i h�nh ��o!",
	"Hi�u r�i. Thay tr�i h�nh ��o!Thay tr�i h�nh ��o!",
	"Th� l�c c�a L��ng S�n b�nh tr��ng c�ng l�m kinh ��ng ��n ho�ng th��ng, nh� v�y c�ng �� r�i. B�y gi� ta giao cho ng��i nhi�m v� ��n Bi�n Kinh g�p L� S� S�, t�m c�ch g�p Ho�ng th��ng. N�u ho�ng th��ng chi�u an th� ch�ng ta c� th� l�m ��i quan s� c� ti�n t�i, m� n�...Nhi�m v� n�y h�i nguy hi�m ng��i nh� ��ng �� ng��i th� 2 bi�t. C�n g� kh�ng r� n�a kh�ng?",
	"C� th� kh�ng �i ���c kh�ng?",
	"Kh�ng ���c, b�c th� n�y ��a cho Ho�ng th��ng, ta ��c c�ch g�i ng��i 500 l��ng �� mua y ph�c m�i. Ng��i mau �i ch�ng v�, ��ng �� m�t m�t L��ng S�n.",
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("T�ng Giang_Th�y B�c (4)")
	CTask:PayAward("T�ng Giang_Th�y B�c (4)")
	CTask:StartTask("T�ng Giang_Th�y B�c (5)");	
	TaskTip("��n Bi�n Kinh t�m L� S� S� t�m c�ch ti�p c�n Ho�ng Th��ng.")
end;