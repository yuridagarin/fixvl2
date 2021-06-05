Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Bi�n Kinh D��c D�n 3")==1 then	--�����
		Say("B�nh m�u th�n �� kh�i, xin �a t�!", 0)
	elseif (CTask:CheckCanStart("Bi�n Kinh D��c D�n 3")==1) and (GetItemCount(2,0,30)>=1)  then	--�������
		StartTask003()
	elseif CTask:IsTaskStart("Bi�n Kinh D��c D�n 1")==1 then	--������
		Say("Ch�a m�i ���c ��i phu n�a sao?", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh D��c D�n 1")==1 then	--������
		StartTask001()
	else	--����ǰ
		Say("Hu! Hu! Hu!", 0)
	end
end;


function StartTask001()
	local strMain = {
		"Hu! Hu! M�u th�n ng� b�nh r�i, ng��i gi�p ta t�m ��i phu ���c kh�ng?",
		"Kh�ng th�nh v�n ��!/yes001", 
		"Ta b�n r�i!/no001", 
}
	CTask:SayEx(strMain)
end


function yes001()
	Say("Nh� ng��i t�m <color=yellow>L�nh ��i phu<color> ch�n b�nh cho m�u th�n, nghe n�i �ng ta �ang � h��ng ��ng <color=yellow>su�i th�c<color> h�i thu�c.", 0)
	CTask:StartTask("Bi�n Kinh D��c D�n 1");
	CTask:FinishTask("Bi�n Kinh D��c D�n 1");
	TaskTip("��n su�i th�c t�m L�nh ��i phu ch�n b�nh cho m�u th�n Ti�u H�.")
end;

function no001()
end;

function StartTask003()
local strMain = {
	"Thu�c c�a m�u th�n ng��i ��y!",
	"Xin �a t�! Th�c ra l�c tr��c trong th�n c� v� ��i hi�p t�n Th�i Thi�n c�ng t�t b�ng nh� ng�i nh�ng v� sau kh�ng bi�t do nguy�n nh�n g� �� r�i kh�i.",
	"Khi Th�i Thi�n th�c �i c� �� l�i m�t b�c th� n�i ��i ch�u l�n l�n t�m ���c 2 b�c c�n l�i l�n T��ng D��ng t�m �ng ta h�c v�. Gi� giao b�c th� l�i cho hi�p s�, hy v�ng n�m b�t c� h�i n�y.",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("Bi�n Kinh D��c D�n 3");
	DelItem(2,0,30,1)
	CTask:FinishTask("Bi�n Kinh D��c D�n 3")
	CTask:PayAward("Bi�n Kinh D��c D�n 3")
end;