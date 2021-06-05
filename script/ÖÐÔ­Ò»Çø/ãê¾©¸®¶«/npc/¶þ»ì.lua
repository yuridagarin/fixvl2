Include("\\script\\lib\\task_main.lua");

function main()	
	if CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 4")==1 then		--�����
		Say("H�! Ai d�m ��ng ��n ta! Hi, hi kh�ng ph�i n�i ng��i!", 0)
	elseif CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 2")==1 then	--�������
		Say("Ta kh�ng th�y t�n <color=yellow>H� Th�c C�<color>, ng��i nh� h�n ta tr�n c�n kh�ng k�p. B�ng h�u ��n ch� kh�c t�m th�, xin tha m�ng!", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh ��ng Th� sinh 2")==1 then	--������
		StartTask002()
	else	--����ǰ
		Say("H�! Ai d�m ��ng ��n ta! Hi, hi kh�ng ph�i n�i ng��i!", 0)
	end
end;


function StartTask002()		--�������죬����Ͷ������ʼս��
local strMain = {
	"Ph�i ng��i l� t�n c�n �� Nh� H�n h� hi�p b� t�nh kh�ng? Khai mau! Ng��i �em ca ca c�a T� C� <color=yellow>H� Th�c C�<color> gi�u � ��u?",
	"Ai v�y! D�m xen v�o chuy�n c�a ��i gia, mu�n ch�t �?",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Bi�n Kinh ��ng Th� sinh 2");
	ChangeNpcToFight(GetTargetNpc())	--ת���Ի�����npcΪս������
end


function OnDeath()
if CTask:IsTaskStart("Bi�n Kinh ��ng Th� sinh 2")==1 then
		finishTask002()
end;
end


function finishTask002()
local strMain = {
	"��i hi�p xin tha m�ng!",
	"N�i mau! Ng��i gi�u <color=yellow>H� Th�c C�<color> � ��u?",
	"H� Th�c C� n�o? ��i hi�p c� nh�m kh�ng t�n �� ta tr�n h�n c�n kh�ng k�p, sao l�i �em gi�u?",
	"Th�t sao? Nh�ng mu�i mu�i h�n n�i anh ta ��n t�m ng��i ��n gi� v�n ch�a v�.",
	"Oan �c qu� �i! C� th� anh ta b� l�c ���ng ch�ng? B�ng h�u ��n ch� kh�c t�m th�!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("Bi�n Kinh ��ng Th� sinh 2")
	CTask:PayAward("Bi�n Kinh ��ng Th� sinh 2")
	TaskTip("T�m H� Th�c C�")
end
