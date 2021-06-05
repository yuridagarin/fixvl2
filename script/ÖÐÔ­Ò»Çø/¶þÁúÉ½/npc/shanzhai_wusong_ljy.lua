Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("V� T�ng_Nh� Long s�n")==1 then	--�����
		Say("Nh� Long S�n e l� kh�ng th�ch h�p, chi b�ng ng��i l�n <color=green>L��ng S�n B�c<color> th� nh�!", 0)
	elseif CTask:CheckTask("V� T�ng_Nh� Long s�n")==1 then	--�������
		FinishTask001()
	elseif CTask:IsTaskStart("V� T�ng_Nh� Long s�n")==1 then	--������
		Say("��nh gi�c tr��c ti�n ph�i b�t t��ng, ch� c�n ng��i ��nh b�i t�n th� l�nh <color=green>L��ng Trung Th�<color>, l�y ���c <color=green>Trung Th� L�nh<color> th� kh�ng c�n ��nh ch�ng c�ng t� b�i r�i.", 0)
	elseif CTask:CheckCanStart("V� T�ng_Nh� Long s�n")==1 then	--������
		StartTask001()
	else	--����ǰ
		Say("Quan ph� ng�y ng�y v� v�t, L��ng s�n ng�y c�ng kh� kh�n, s�ng sao ��y?", 0)
	end
end


function StartTask001()
local strMain = {
		"Ng��i ���c Th�i Thi�n ��c c�ch ��n? Hi�n nay d��i ch�n n�i Long S�n c� m�t ��m quan binh, h�y ��n �� ti�u tr� ch�ng.",
		"��ng �",
		"��nh gi�c tr��c ti�n ph�i b�t t��ng, ch� c�n ng��i ��nh b�i t�n th� l�nh <color=green>L��ng Trung Th�<color>, l�y ���c <color=green>Trung Th� L�nh<color> th� kh�ng c�n ��nh ch�ng c�ng t� b�i r�i.",
}
	CTask:TalkEx(strMain)	
	CTask:StartTask("V� T�ng_Nh� Long s�n");
	TaskTip("��nh b�i L��ng Trung Th� l�y Trung Th� L�nh.")
end

function FinishTask001()
local strMain = {
	"Ti�n B�i, �� ��nh b�i L��ng Trung Th� l�y ���c <color=green>Trung Th� L�nh<color>.",
	"�a t� ng��i!",
	"Ng��i kh�ng c�n n�i ta c�ng �� hi�u r�i, n� m�t Th�i Thi�n ta kh�ng th� t� ch�i. Nh�ng hi�n nay Nh� Long s�n t�nh h�nh �ang kh� kh�n, quan sai ng�y ng�y v� v�t chi b�ng ng��i h�y l�n <color=green>L��ng S�n B�c<color> c�ng c�c huynh �� truy t�m <color=green>t�m b�n �� S�n H� X� T�c<color>",
	"L��ng S�n ��a h�nh r�ng l�n, th� l�nh <color=green>T�ng Giang <color> ��i ca l�i l� ng��i c� t�nh c� ngh�a. Ng��i l�n �� s� c� ti�n �� h�n.",	
}
	CTask:TalkEx(strMain)
	CTask:FinishTask("V� T�ng_Nh� Long s�n")
	CTask:PayAward("V� T�ng_Nh� Long s�n")	
	TaskTip("Nhi�m v� �� ho�n th�nh, ng��i c� th� ��n L��ng S�n B�c t�m T�ng Giang nh�p h�i.")
end

		
