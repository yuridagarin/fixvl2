Include("\\script\\lib\\task_main.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_ShowDialog(128, bTag) then
		return
	end
	if CTask:IsTaskFinish("Bi�n Kinh ��ng tr��ng th�n 1") then	--��ɺ�
		Say("Ng��i gi� trong th�n b�o hi�n t��ng l� xu�t hi�n �t c� tai h�a, kh�ng bi�t mu�n �m ch� �i�m g�?", 0)
	elseif CTask:CheckTask("Bi�n Kinh ��ng tr��ng th�n 1")==1 then		--���
		FinishTask001()
	elseif CTask:IsTaskStart("Bi�n Kinh ��ng tr��ng th�n 1")==1 then	--������
		Say("Kh�ng ph�i ng��i ��ng � �i tr� kh� <color=yellow>S�i x�m<color> g�n <color=yellow>ru�ng d�a<color> sao?", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh ��ng tr��ng th�n 1")==1 then	--������
		StartTask001()
	else	--����ǰ
		Say("Ng��i gi� trong th�n b�o hi�n t��ng l� xu�t hi�n �t c� tai h�a, kh�ng bi�t mu�n �m ch� �i�m g�?", 0)
	end
end;


function StartTask001()
	local strMain = {
		"T� khi nh�ng ng��i ��i hi�p nh� ng��i xu�t hi�n qu�i trong th�n ng�y m�t nhi�u. Ng��i gi� b�o s�p c� t�i h�a �p ��n. Hy v�ng ng��i gi�p ta ti�u di�t ��m qu�i v�t n�y.",
		"Kh�ng th�nh v�n ��!/yes001", 
		"Ta b�n r�i!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("G�n <color=yellow>Ru�ng d�a<color> xu�t hi�n nhi�u <color=yellow>Ti�u th� lang<color> qu�y ph�. Ng�oi mau ��n �� tr� kh� ch�ng v� mang <color=yellow>5 c�i r�ng th� lang<color> v�!", 0)
	CTask:StartTask("Bi�n Kinh ��ng tr��ng th�n 1");
	TaskTip("Ti�u di�t Ti�u th� lang g�n ru�ng d�a v� mang 5 c�i R�ng s�i x�m v�!")
end;

function no001()
end;



function FinishTask001()
local strMain = {
	"B�ng h�u qu� nhi�n th�n th� b�t ph�m, m�i ��y �� ti�u di�t ���c th� lang! C� ch�t l�ng th�nh c�a ta, xin nh�n l�y!",
	"Nh� n�m x�a, Th�i Thi�n c�n � trong th�n, m�y t�n l�u manh kh�ng d�m g�y s� nh�ng do anh �y c� t�t x�u hay l�y tr�m g�, v�t c�a d�n l�ng, m�i ng��i ngh� anh c� c�ng n�n kh�ng truy c�u, ti�c r�ng anh �y �� l�y c�p Ng� Th� B�nh m� Ho�ng th��ng ban t�ng cho Tr��ng C� Nh�n con c�a Tr��ng vi�n ngo�i v� v�y b� �u�i kh�i th�n, hi�n kh�ng bi�t �i ��u.",
	"G�n ��y c� ng��i th�y anh ta xu�t hi�n � T��ng D��ng ph�, kh�ng bi�t th�c h� th� n�o, ng��i th� ��n �� th� v�n may xem nh�ng hi�n anh ta �ang mang t�i kh�ng d� l� di�n n�u ng��i c� 3 Phong th� c�a d�n l�ng th� hay h�n!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Bi�n Kinh ��ng tr��ng th�n 1")
	CTask:PayAward("Bi�n Kinh ��ng tr��ng th�n 1")
end;

