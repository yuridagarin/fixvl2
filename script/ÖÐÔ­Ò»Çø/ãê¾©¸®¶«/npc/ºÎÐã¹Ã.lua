Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 4")==1 then	--�����
		Say("Ca ca mu�i th��ng n�i: ��o l� � ��i quan tr�ng l� l� l� kh�ng ph�i � v� l�c. Tuy m�i ng��i kh�ng hi�u nh�ng r�t kh�m ph�c ca ca.", 0)
	elseif CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 3")==1 then	--�������
		FinishTask004()
	elseif CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 1")==1 then	--������
		Say("Ch�a c� tin t�c <color=yellow>H� Th�c C�<color> ca ca �? Ch�c ch�n �ang � ch� <color=yellow>Nh� H�n<color> c�i l�!", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh ��ng Th� sinh 1")==1 then	--������
		StartTask001()
	else	--����ǰ
		Say("Ca ca mu�i th��ng n�i: ��o l� � ��i quan tr�ng l� l� l� kh�ng ph�i � v� l�c. Tuy m�i ng��i kh�ng hi�u nh�ng r�t kh�m ph�c ca ca.", 0)
	end
end;


function StartTask001()
	local strMain = {
		"<color=yellow>Nh� H�n<color> th��ng t� t�p m�y t�n L�u manh qu�y nhi�u l��ng d�n. Ca ca <color=yellow>H� Th�c C�<color> ��n c�i l� gi� v�n ch�a v�. Ta r�t lo l�ng. Gi�p ta ��n �� xem th� ���c kh�ng?",
		"Kh�ng th�nh v�n ��!/yes001", 
		"Ta b�n r�i!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("<color=yellow>Nh� H�n<color> � g�n m�y c�n nh� <color=yellow>ph�a d��i<color>, phi�n b�ng h�u ��n �� xem th�!", 0)
	CTask:StartTask("Bi�n Kinh ��ng Th� sinh 1");
	CTask:FinishTask("Bi�n Kinh ��ng Th� sinh 1")
	TaskTip("��n nh� d�n t�m Nh� H�n h�i tin t�c H� Th�c C�.")
end;

function no001()
end;



function FinishTask004()
local strMain = {
	"Xin �a t�! C� ch�t l� v�t xin nh�n cho!",
	"Nh� n�m x�a, Th�i Thi�n c�n � trong th�n, m�y t�n L�u manh kh�ng d�m g�y s�. Nh�ng do anh �y c� t�t x�u hay l�y tr�m g�, v�t c�a d�n l�ng, m�i ng��i ngh� anh c� c�ng n�n kh�ng truy c�u, ti�c r�ng anh �y �� l�y c�p Ng� Th� B�nh m� Ho�ng th��ng ban t�ng cho Tr��ng C� Nh�n con c�a Tr��ng vi�n ngo�i, v� v�y b� �u�i kh�i th�n, hi�n kh�ng bi�t �i ��u.",
	"G�n ��y c� ng��i th�y anh ta xu�t hi�n � T��ng D��ng ph�, kh�ng bi�t th�c h� th� n�o, ng��i th� ��n �� th� v�n may xem nh�ng hi�n anh ta �ang mang t�i kh�ng d� l� di�n. N�u ng��i c� <color=yellow>3 Phong th� c�a d�n l�ng<color> th� hay h�n!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Bi�n Kinh ��ng Th� sinh 4");
	CTask:FinishTask("Bi�n Kinh ��ng Th� sinh 4")
	CTask:PayAward("Bi�n Kinh ��ng Th� sinh 4")
end;

