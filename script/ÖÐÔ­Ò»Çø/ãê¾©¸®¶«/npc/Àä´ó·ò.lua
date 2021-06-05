Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Bi�n Kinh D��c D�n 2")==1 then	--�����
		Say("Ngh� th�y thu�c ph�i l�y ��c l�m tr�ng!", 0)
	elseif CTask:CheckTask("Bi�n Kinh D��c D�n 2")==1 then	--�������
		FinishTask002()
	elseif CTask:IsTaskStart("Bi�n Kinh D��c D�n 2")==1 then	--������
		Say("Kh�ng c� <color=yellow>X� h��ng<color> d� c� ch� ���c thu�c c�ng v� d�ng.", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh D��c D�n 2")==1 then	--������
		StartTask002()
	else	--����ǰ
		Say("Ngh� th�y thu�c ph�i l�y ��c l�m tr�ng!", 0)
	end
end;


function StartTask002()
	local strMain = {
		"B�ng h�u t�m ta c� chuy�n g�?",
		"M�u th�n Ti�u H� b�nh r�i, mu�n t�m ��i phu b�t m�ch.",
		"Kh�ng c�n xem m�y ng�y tr��c m� c�u ta c� l�i ch� ta b�t m�ch, ta th�y do l�m vi�c qu� ��, d�n ��n kh� huy�t kh�ng ���c l�u th�ng, ta c� d�n t�nh d��ng cho kh�e. Nay ng� b�nh xem ra b�nh t�nh nghi�m tr�ng, thu�c ta c� nh�ng thi�u m�t v� xem ra c�ng hi�u kh�ng ���c t�t l�m.",
		"Kh�ng bi�t ng�i c�n thu�c g�?",
		"<color=yellow>X� h��ng<color> tr�n ng��i b�n l�u manh, ng��i �i l�y <color=yellow>3 c�i<color> l� ��.",
		"���c th�i! �� t�i h� ra th�nh ��nh <color=yellow>L�u manh<color> l�y <color=yellow>3 c�i X� h��ng<color> v� l�m thu�c.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Bi�n Kinh D��c D�n 2");
	TaskTip("��nh l�u manh l�y 3 c�i X� h��ng l�m thu�c.")
end


function FinishTask002()
local strMain = {
	"��i phu, thu�c ng�i c�n ��y!",
	"T�t l�m! Ng��i mang g�i thu�c n�y v� cho Ti�u H�, ch� c�n m� h�n u�ng ��ng li�u l��ng, ba ng�y l� kh�i!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Bi�n Kinh D��c D�n 2")
	CTask:PayAward("Bi�n Kinh D��c D�n 2")
end;