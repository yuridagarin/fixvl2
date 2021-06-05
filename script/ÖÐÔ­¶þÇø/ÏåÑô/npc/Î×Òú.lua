Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1512 = GetTask(1512)
	if ( UWorld1512 == 0 and  GetLevel() > 29 )  then
		Say("C� th� gi�p ta ��n Thi�u L�m T� t�m 15 m�c th� kh�ng?",2,"��ng �/yes1512","Kh�ng gi�p/no1512")
	elseif ( UWorld1512  == 5 and  GetItemCount(2,1,31) > 14)  then	
		Talk(1,"","T�t qu�, t�t qu�! S� th�nh t�m c�a ng��i l� n�o l�i kh�ng nh�n.")
		SetTask(1512,10)
		DelItem(2,1,31,15)
		--AddItem(2,1,1,1)
		Earn(800)
		GivePlayerExp(SkeyShiJieChongFu,"mushou")
		ModifyReputation(20,0)
		  --AddNote("�������ռ�ľ�ֵ��������")
		TaskTip("Ho�n th�nh nhi�m v� gi�p Vu D�n thu th�p M�c Th�")
	elseif ( UWorld1512  ==5  and  GetItemCount(2,1,31)<= 14  )  then
		Talk(1,"","��ng Nh�n � Thi�u L�m m�t th�t kh�ng ��n gi�n, ph�i c�n th�n.")
	elseif ( UWorld1512  == 10 and GetLevel() > 34 )  then										Say("C� th� gi�p ta h� ��ng Nh�n � Thi�u L�m m�t th�t l�y 15 mi�ng ��ng kh�ng?",2,"���ng nhi�n l� ���c r�i!/yes1512_2","Xin l�i, n�ng l�c c� h�n!/no1512")	
	elseif ( UWorld1512  == 15 and GetItemCount(2,1,42) > 14 )  then								Talk(1,"","B� m�t c�a ��ng Nh�n, M�c Nh�n ta ��u bi�t c� r�i.")
		DelItem(2,1,42,15)
		SetTask(1512,20)
		--AddItem(2,1,1,1)
		GivePlayerExp(SkeyShiJieChongFu,"tongkuai")
		Earn(1000)
		ModifyReputation(28,0)
		-- AddNote("�������ռ�ͭ����������")
		TaskTip("Ho�n th�nh nhi�m v� gi�p Vu D�n thu th�p m�nh ��ng.")
	elseif ( UWorld1512  == 15 and GetItemCount(2,1,42) <=14  )  then
		Talk(1,"","��ng Nh�n r�i ra m�nh ��ng m� ta c�n.")								else
		Talk(1,"","Ta n�i ra nhi�u nh� v�y e l� kh�ng ti�n, th�i ng��i t� t�m l�y �i.")
	end
end;

function yes1512 ()
		Talk(1,"","Phi�n b�ng h�u gi�p ta ��n Thi�u L�m m�t th�t t�m 15 M�c Th�")
		SetTask(1512,5)
		--AddNote("���ܰ������ռ�ľ�ֵ�����")
		TaskTip("Nh�n nhi�m v� gi�p Vu D�n t�m M�c Th�")
end;

function yes1512_2 ()
		Talk(1,"","Phi�n b�ng h�u gi�p ta ��n Thi�u L�m m�t th�t t�m 15 m�nh ��ng")
		SetTask(1512,15)
		--AddNote("���ܰ������ռ�ͭ�������")
		TaskTip("Nh�n nhi�m v� gi�p Vu D�n t�m m�nh ��ng")
end;


function no1512 ()
		Talk(1,"","Xem ra ph�i nh� ��n ng��i kh�c th�i.")
end;
