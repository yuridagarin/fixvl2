--��������
--�ص㣺����  �����ռ�ǹͷ�͵���
--�߻���������  2004.01.27

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\world\\task_award.lua")

function main()

local strMain_001 = {
	"Ng��i �� nghe qua Th� Ph� � Ph�c Ng�u S�n ch�a?",
	"Ta kh�ng quan t�m, ch� c�n b� t�nh kh�ng sao l� ���c r�i!",
	"Nh�ng ta nghe n�i b�n ch�ng �� �em b�nh s� c�a Th�i th� �i r�i?",
	"Chuy�n n�y b� m�t, nghe n�i ch� c� ch��ng m�n <color=yellow>T� H�c Ch�n Nh�n<color> � <color=yellow>V� �ang ph�i<color> bi�t th�i.",
	"C�i b�nh g�m n�y c�ng c� li�n quan ��n V� �ang ch��ng m�n �?",
	"N�u v�y th� ph�i h�i T� H�c Ch�n Nh�n th�i."
}

	if CTask:IsTaskStart("T�m Tr��ng �nh_T��ng D��ng")==1 then
		CTask:TalkEx("task_yes_001", strMain_001);
		return
	end;

	UWorld1510 = GetTask(1510)
	if ( UWorld1510 == 0 and  GetLevel() > 19 )  then
		Say("S� th�ch c�a ta l� thu th�p v� kh�, ng��i c� th� ��n V� �ang thu th�p cho ta 10 Thi�t Th��ng ��u v� bao �ao kh�ng?",2,"Chuy�n nh� th�i m�/yes1510","Ta �ang b�n l�m!/no1510")
	elseif ( UWorld1510 == 5 and  GetItemCount(2,1,20) > 9 and GetItemCount(2,1,21) > 9)  then	
		Talk(1,"","Ti�u huynh �� qu� nhi�n n�i l� l�m, c� ch�t th�nh � xin nh�n cho!")
		SetTask(1510,10)
		DelItem(2,1,20,10)
		DelItem(2,1,21,10)
		Earn(600)
		GivePlayerExp(SkeyShiJieChongFu,"zhangying")
	  ModifyReputation(8,0)
		    --AddNote("����Ӱ�ռ��������������")
		TaskTip("Ho�n th�nh nhi�m v� gi�p Tr��ng �nh thu th�p v� kh�")
	elseif ( UWorld1510  ==10 )  and  (GetItemCount(2,1,20)<= 9 or GetItemCount(2,1,21)<= 9  )  then
		Talk(1,"","D��i ch�n n�i V� �ang c� th� t�m ���c bao �ao v� Thi�t Th��ng ��u.")
	else
		i=random(1,3)
		if i==1 then 
			Talk(1,"","Kh�ng sai, ta ch�nh l� �� nh�t thi�n h�, tr�n ��i n�y kh�ng c� g� l� ta kh�ng bi�t.")
		elseif i == 2 then  
			Talk(1,"","B�t lu�n l� t� ph�i hay ch�nh ph�i, c� v�ic g� kh�ng r� c� ��n t�m ta.")
		else
			Talk(1,"","Bi�t nhi�u qu� ��i l�c c�ng kh�.")
		end
	end
end;

-- ��������ȥ���Ϻ�����
function task_yes_001()
	CTask:FinishTask("T�m Tr��ng �nh_T��ng D��ng");
	CTask:StartTask("T��ng D��ng_t�m T� H�c Ch�n Nh�n");
	return
end;

function yes1510()
		Talk(1,"","Phi�n ti�u huynh �� ��n ch�n n�i V� �ang t�m gi�p ta 10 bao �ao v� Thi�t Th��ng ��u.")
		SetTask(1510,5)
		--AddNote("���ܰ���Ӱ�ռ�����������")
		TaskTip("Nh�n nhi�m v� thu th�p v� kh� cho Tr��ng �nh.")
		--ModifyReputation(8,0)
end;

function no1510()
		Talk(1,"","Ta ch� c� l�c r�nh m�i ��ng th�.")
end;