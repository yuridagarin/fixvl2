Include("\\script\\lib\\task_main.lua");

function main()
	if CTask:IsTaskFinish("Bi�n Kinh ��ng Th� sinh 4")==1 then	--�����
		Say("T� vi�t: qu�n t� chi qu� d�, nh� nh�t nguy�t chi th�c y�n: Qu�, nh�n giai ki�n chi; c�i, nh�n giai ng��ng chi. Ch� c�n ta c� l�ng s� c�m h�a ���c ng��i kh�c.", 0)
	elseif CTask:CheckTask("Bi�n Kinh ��ng Th� sinh 3")==1 then	--�������
		FinishTask003()
	elseif CTask:IsTaskStart("Bi�n Kinh ��ng Th� sinh 3")==1 then	--������
		Say("B�n ngo�i c� nhi�u <color=yellow>C�n ��<color> l�m ta kh�ng d�m �i l�i, B�ng h�u h�y d�y ch�ng m�t b�i h�c, ti�n �em <color=yellow>5 T� Hoa h�i<color> v�!", 0)
	elseif CTask:CheckCanStart("Bi�n Kinh ��ng Th� sinh 3")==1 then	--������
		StartTask003()
	else	--����ǰ
		Say("T� vi�t: qu�n t� chi qu� d�, nh� nh�t nguy�t chi th�c y�n: Qu�, nh�n giai ki�n chi; c�i, nh�n giai ng��ng chi. Ch� c�n ta c� l�ng s� c�m h�a ���c ng��i kh�c.", 0)
	end
end;


function StartTask003()
	local strMain = {
		"Ta v�n d� �i g�p Nh� H�n kh�ng may gi�a ���ng g�p b�n <color=yellow>C�n ��<color> b�t ��n ��y. Ng��i gi�p ta d�y ch�ng b�i h�c ���c kh�ng?",
		"Kh�ng th�nh v�n ��!/yes003", 
		"Ta b�n r�i!/no003", 
}
	CTask:SayEx(strMain)
end


function yes003()
	Say("B�n <color=yellow>C�n ��<color> v�a m�i th�y ��y gi� kh�ng bi�t �i ��u. B�ng h�u d�y ch�ng b�i h�c nh�n ti�n �em <color=yellow>5 T� Hoa h�i<color> v�!", 0)
	CTask:StartTask("Bi�n Kinh ��ng Th� sinh 3");
	TaskTip("Tr�ng tr� C�n �� l�y 5 T� Hoa h�i.")
end;

function no003()
end;

function FinishTask003()
	Say("�� tr�ng tr� b�n C�n ��. V� b�o cho <color=yellow>H� T� C�<color> nghe ca ca l�m m�i chuy�n ��u ��ng l�m, ��ng qu� lo l�ng!", 0)
	CTask:FinishTask("Bi�n Kinh ��ng Th� sinh 3");
	CTask:PayAward("Bi�n Kinh ��ng Th� sinh 3")
	TaskTip("V� n�i l�i v�i H� T� C� nghe chuy�n anh trai c�a m�nh!")
end;