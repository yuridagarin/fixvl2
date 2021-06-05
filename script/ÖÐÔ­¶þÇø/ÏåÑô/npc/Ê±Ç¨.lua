Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Th�i Thi�n T��ng D��ng (3 )")==1 then	--�����
		Talk(1,"","Giang h� l�i d�y s�ng n�a r�i.")
	elseif CTask:CheckTask("Th�i Thi�n T��ng D��ng (3 )")==1 then	--�������
		FinishTask003()
	elseif CTask:IsTaskStart("Th�i Thi�n T��ng D��ng (3 )")==1 then	--������
		Talk(1,"","<color=yellow>Kh�ng Kh�ng Di�u Th�<color> ch� c� th� ��nh b�i <color=yellow>V��ng Lu�n<color> � <color=yellow>D� Tr� l�m <color> m�i c� th� l�y ���c.")
	elseif CTask:CheckCanStart("Th�i Thi�n T��ng D��ng (3 )")==1 then	--������
		StartTask003()
	elseif CTask:IsTaskFinish("Th�i Thi�n T��ng D��ng (2 )")==1 then	--�����
		Talk(1,"","��i ��n <color=yellow>c�p 30<color> h�y quay l�i.")
	elseif CTask:CheckTask("Th�i Thi�n T��ng D��ng (2 )")==1 then	--�������
		FinishTask002()
	elseif CTask:IsTaskStart("Th�i Thi�n T��ng D��ng (2 )")==1 then	--������
		Talk(1,"","Ng��i ��n <color=yellow>D� Tr� l�m<color> ��nh b�i <color=yellow>Quan sai<color> l�y <color=yellow>3 Phong th� m�t<color>")
	elseif CTask:CheckCanStart("Th�i Thi�n T��ng D��ng (2 )")==1 then	--������
		StartTask002()
	elseif CTask:IsTaskFinish("Th�i Thi�n T��ng D��ng (1 )")==1 then	--�����
		Talk(1,"","��n <color=yellow>c�p 25<color> h�y quay l�i.")
	elseif CTask:CheckTask("Th�i Thi�n T��ng D��ng (1 )")==1 then	--�������
		FinishTask001()
	elseif CTask:IsTaskStart("Th�i Thi�n T��ng D��ng (1 )")==1 then	--������
		Talk(1,"","<color=yellow>3 t�m H� B�<color> v�n ch�a �� �? H�y ��n Nh� Long s�n t�m th�m nh�!")
	elseif (CTask:CheckCanStart("Th�i Thi�n T��ng D��ng (1 )")==1) and (GetItemCount(2,0,18)>=1) and (GetItemCount(2,0,22)>=1) and (GetItemCount(2,0,23)>=1) then	--������
		StartTask001()
	else	--����ǰ
		Talk(1,"","Giang h� l�i d�y s�ng n�a r�i")
	end
end;


function StartTask001()
	local strMain = {
		"Xin h�i c� ph�i l� Th�i Thi�n ti�n b�i?",
		"Ta l� Thi�n T�c Minh, sao ai c�ng nh�m l�n v�y nh�?",
		"T�i h� c� m�t v�i b�c th� xin ti�n b�i xem qua.",
		"� ��y kh�ng ti�n, ng��i c� g� n�i mau �i.",
		"T�i h� b�t t�i xin ti�n b�i ch� gi�o th�m.",
		"G�n ��y � <color=yellow>Nh� Long S�n<color> xu�t hi�n kh�ng �t b�ch h�, ng��i gi�p ta ��n �� gi�t ch�ng l�y <color=yellow>3 t�m h� b�<color> nh�!",
		"���c! Ta� h� ��ng � ��n <color=yellow>Nh� Long S�n<color>t�m <color=yellow>3 t�m h� b� <color>.",
}
	CTask:TalkEx("",strMain)
	DelItem(2,0,18,1)
	DelItem(2,0,22,1)
	DelItem(2,0,23,1)
	CTask:StartTask("Th�i Thi�n T��ng D��ng (1 )");
	TaskTip("��n Nh� Long s�n t�m 3 t�m H� B�")
end


function FinishTask001()
local strMain = {
	"Ti�n b�i, H� B� �� t�m �� r�i!",
	"T�t qu�, ��n <color=yellow>c�p 25<color> quay l�i nh�!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Th�i Thi�n T��ng D��ng (1 )")
	CTask:PayAward("Th�i Thi�n T��ng D��ng (1 )")
	TaskTip("Nhi�m v� �� ho�n th�nh, ��n c�p 25 ��n g�p Th�i Thi�n.")
end;


function StartTask002()
	local strMain = {
		"Ng��i ��n ��ng l�c l�m, ta v�a nh�n ���c tin c� m�t s� <color=yellow>Quan sai<color> s�p �i qua <color=yellow>D� Tr� l�m<color>, ch�ng c� mang theo m�t th� c�a Tri�u ��nh. Ta mu�n ng��i �i gi�t ch�ng �o�t m�t th�, kh�ng bi�t ng��i c� d�m kh�ng?",
		"Chuy�n n�y�",
		"Vi�c n�y c� h�i v�t v� m�t ch�t, n�u ng��i kh�ng l�m ���c th� �� ta ngh� c�ch kh�c v�y.",
		"T�i h� ��ng �!",
		"Kh� l�m, d�m ngh� d�m l�m. Ng��i ��n <color=yellow>D� Tr� l�m<color> ��nh b�i <color=yellow>Quan sai<color> l�y <color=yellow>3 m�t th�<color>.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Th�i Thi�n T��ng D��ng (2 )");
	TaskTip("��n D� Tr� l�m ��nh b�i Quan sai l�y 3 m�t th�.")
end


function FinishTask002()
local strMain = {
	"Ti�n b�i, m�t th� �� l�y ���c r�i!",
	"Ng��i kh� l�m, ta c� vi�c ph�i l�m r�i, ��n <color=yellow>c�p 30<color> quay l�i nh�!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Th�i Thi�n T��ng D��ng (2 )")
	CTask:PayAward("Th�i Thi�n T��ng D��ng (2 )")
	TaskTip("Nhi�m v� �� ho�n th�nh, c�p 30 ��n g�p Th�i Thi�n.")
end;


function StartTask003()
	local strMain = {
		"C�n nh� l�n tr��c ta k� cho ng��i nghe v� chuy�n th� v� mang �ao kh�ng?",
		"���ng nhi�n l� nh� r�i, ng��i n�i l�n �� g�p b�n ch�ng ngay c� v�t ph�ng th�n <color=yellow>Kh�ng Kh�ng Di�u Th�<color> c�ng b� ch�ng c��p m�t.",
		"��ng v�y, vi�c n�y ta �� �i�u tra k� v� ph�t hi�n ra �� ch�nh l� V��ng Lu�n, ta c�ng �� bi�t n�i �n n�u c�a h�n nh�ng kh�ng ti�n l� di�n n�n phi�n ��n ng��i.",
		"Kh�ng sao, c� tin � v�n b�i.",
		"���c! Theo ta bi�t<color=yellow>V��ng Lu�n<color> hi�n � <color=yellow>D� Tr� l�m<color>. Ch� c�n ng��i l�y l�i <color=yellow>Kh�ng Kh�ng Di�u Th�<color> l� ���c r�i! Nh�ng thu�c h� c�a h�n c�ng r�t l�i h�i, ng��i nh� c�n th�n.",
		"T�i h� bi�t r�i!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Th�i Thi�n T��ng D��ng (3 )");
	TaskTip("��n D� Tr� l�m ��nh V��ng Lu�n �o�t Kh�ng Kh�ng Di�u Th� cho Th�i Thi�n.")
end


function FinishTask003()
local strMain = {
	"Ti�n b�i! Kh�ng Kh�ng Di�u Th� �� l�y ���c r�i!",
	"T�t l�m! Th�i Thi�n ta kh�ng nh�n l�m ng��i. Xin �a t�!",
	"Ti�n b�i kh�ng c�n kh�ch s�o.",
	"Ta bi�t ng��i �ang th�c m�c v� sao Tri�u ��nh l�i truy c�u ta, v� ta �ang gi� m�t b� m�t ��i s�.",
	"B� m�t ��i s�?",
	"��ng v�y, b� m�t n�y c� li�n quan ��n v�n m�nh c�a b� t�nh <color=yellow>t�m b�n �� S�n H� X� T�c<color> �� xu�t hi�n r�i.",
	"C� ph�i v� chuy�n n�y m� thi�n h� b�t ��u d�y s�ng?",
	"H�nh t�u giang h� ph�i bi�t tr� giang di�t �c, c�ng nh� Th�i Thi�n ta th�y chuy�n ch��ng m�t kh�ng nh�ng tay v�o kh�ng ���c.",
	"Ti�n b�i hi�u s�u bi�t r�ng, xin ch� gi�o th�m.",
	"Ta c� m�t huynh �� <color=yellow>L�m Xung<color>, � <color=yellow>Nh� Long S�n<color> chuy�n c��p c�a ng��i gi�u chia cho ng��i ngh�o, thay tr�i h�nh ��o. N�u ng��i c� h�ng th� th� n�n ��n �� m�t chuy�n.",
	"�a t� ti�n b�i!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Th�i Thi�n T��ng D��ng (3 )")
	CTask:PayAward("Th�i Thi�n T��ng D��ng (3 )")
	TaskTip("Nhi�m v� �� ho�n th�nh, C� th� ��n Nh� Long s�n g�p L�m Xung.Th�i Thi�n.")
end;