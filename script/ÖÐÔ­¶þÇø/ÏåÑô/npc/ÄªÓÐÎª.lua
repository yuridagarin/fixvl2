Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1511 = GetTask(1511)
	if ( UWorld1511 == 0 and  GetLevel() > 22 )  then
		Say("Cha ta l�m b�nh, ��i phu c�n <color=red>15 �u�i h�<color> �� l�m thu�c, nh�ng bi�t t�m � ��u b�y gi�! B�ng h�u c� th� gi�p ta kh�ng?",2,"��ng �/yes1511","Kh�ng gi�p/no1511")
	elseif ( UWorld1511  == 5 and  GetItemCount(2,1,19) > 14)  then	
		Talk(1,"","V� c�ng B�ng h�u th�t l� cao c��ng, m�i �� �� t�m ���c 15 �u�i h�! Xin nh�n ch�t qu� m�n!")
		SetTask(1511,10)
		DelItem(2,1,19,15)
		--AddItem(2,1,1,1)
		Earn(700)
		GivePlayerExp(SkeyShiJieChongFu,"moyouwei")
		ModifyReputation(8,0)
		-- AddNote(��Ī��Ϊ�ռ���β���������)
		TaskTip("Ho�n th�nh nhi�m v� gi�p M�c H�u Vi t�m �u�i h�.")
	elseif ( UWorld1511  == 10  and  GetItemCount(2,1,19)<= 14  )  then
		Talk(1,"","�u�i h� c� th� t�m � Thi�u L�m T�, ng��i nh� c�n th�n!")
	else
		Talk(1,"","��i phu c�n 15 �u�i h� �� l�m thu�c cho cha, l�m sao ta c� th� t�m ���c ��y?")
	end
end;

function yes1511()
		Talk(1,"","Phi�n b�ng h�u ��n Thi�u L�m T� t�m <color=red>15 �u�i h�<color> may ra m�i c� th� c�u ���c cha ta!")
		SetTask(1511,5)
		--AddNote("���ܰ�Ī��Ϊ�ռ�15����β������")
		TaskTip("Nh�n nhi�m v� gi�p M�c H�u Vi thu th�p �u�i h�.")
end;

function no1511()
		Talk(1,"","Cha ta ���c c�u r�i!")
end;
