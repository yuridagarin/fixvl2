Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1507 = GetTask(1507)
		if ( UWorld1507 == 0 and  GetLevel() > 4 )  then
				Say("Rau c�i trong v��n ta ��u b� th� c�n h�t! C� th� gi�p ta di�t ch�ng kh�ng?",2,"�� ta ra tay!/yes1507","Ta c�n ch�t vi�c/no1507")
		elseif ( UWorld1507  == 5 and  GetItemCount(2,1,2) >= 10)  then	
							Talk(1,"","B�ng h�u qu� l� th�n th� b�t ph�m! ��y l� m�t ch�t th�nh �, xin nh�n l�y!")
							SetTask(1507,10)
										DelItem(2,1,2,10)
							--AddItem(2,1,1,1)
					    Earn(300)
						GivePlayerExp(SkeyShiJieChongFu,"xiaohuitu")
					    ModifyReputation(2,0)
					    --AddNote("�ﰢʢ�������ӵ��������")
					    TaskTip("Ho�n th�nh nhi�m v� gi�p A Th�nh tr�ng tr� Th� hoang")
		elseif ( UWorld1507  == 5  and  GetItemCount(2,1,2)<= 9  )  then
							Talk(1,"","��m Th� X�m �ang ph� v��n rau c�a ta, h�y ��n ��nh ch�ng v� l�y <color=red>10 �u�i Th�<color> v� ��y.")
				else
							Talk(1,"","V��n nh� ta b� ��m Th� x�m l�m lo�n c� l�n, kh�ng bi�t ph�i l�m sao ��y!")
		end
end;

function yes1507 ()
		Talk(1,"","Nh� b�ng h�u gi�p ta di�t ch�ng v� l�y <color=red>10 �u�i Th�<color> v� ��y!")
		SetTask(1507,5)
		--AddNote("���ܰﰢʢ�������ӵ�����")
		TaskTip("Nh�n nhi�m v� gi�p A Th�nh tr�ng tr� Th� x�m")
end;

function no1507 ()
		Talk(1,"","B�ng h�u b�n vi�c ta c�ng kh�ng mi�n c��ng!")
end;
