--����
--�ص㣺�꾩 �������Ź�������5
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 30  )  then
		Talk(1,"say1401_5","��i T�ng ��i lo�n, Qu�c gia h�ng vong, th�t phu h�u tr�ch. Ti�u nh�n c�ng xin ��n b�o danh ��u qu�n gi�t gi�c!")

			elseif ( UWorld1401  == 35 and GetItemCount(2,1,19) >= 1 ) then
						    Talk(6,"","Kh� kh��Qu� nhi�n l� nh�n t�i! Ng��i �� l� qu�n binh ��i T�ng! Mong ng��i t�n t�m t�n l�c b�o v� ��i T�ng. Thi�n T� s� kh�ng qu�n c�ng tr�ng c�a ng��i!","T�t l�m! T�i h� s� ��n <color=red>Nh�n M�n quan<color> b�o danh ngay!","Ng��i ��n <color=red>Nh�n M�n quan<color> l�m g�? H�y mau ��n qu�n doanh <color=red>L��ng S�n B�c<color> b�o tin!!","Kh�ng! Nh�ng ta mu�n ��n Nh�n M�n quan ch�ng tr� Li�u qu�n!","Nh�ng ta kh�ng c� quy�n! Ch� c� <color=red>Xa Th�i Qu�n � Thi�n Ba D��ng Ph�<color> m�i c� quy�n quy�t ��nh chuy�n c�a D��ng Gia qu�n.","�a t� �� ch� gi�o! T�i h� �i ngay ��y!")
						    if  DelItem(2,1,19,1) == 1 then
										 SetTask(1401,40)
										 GivePlayerExp(SkeyTianmenzhen,"yangmen")
										 --Earn(1200)
										 ModifyReputation(12,0)
										 --Earn(150000);
										 --AddNote("ȥ�첨�������̫����Ҫ�������Ź�ǰ��")
										 Msg2Player("��n Thi�n Ba D��ng Ph� t�m Xa Th�i Qu�n xin v�o ti�n tuy�n Nh�n M�n quan!")

								else
										 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
								end

					elseif ( UWorld1401  == 35 and GetItemCount(2,1,19) < 1 ) then
						Talk(1,"","�� kh�o nghi�m n�ng l�c c�a ng��i, h�y ��n ch�n n�i <color=red>Thi�u L�m t�<color> ��nh <color=red>H� d�<color> l�y v� <color=red>1 c�i �u�i h�<color>!")
					elseif ( UWorld1401  == 40 ) then
						Talk(1,"","C� vi�c g� h�y ��n <color=red>Thi�n Ba D��ng Ph�<color> g�p <color=red>Xa Th�i Qu�n<color> m� h�i! H�i ta c�ng v� �ch!")
							else
									Talk(1,"","D�o n�y nhi�u nh�n s� h�ng h�i ��n b�o danh ��u qu�n! Th�t ��ng m�ng!")
	end
end;

function  say1401_5()
		Say("H�ng h�i ��u qu�n, ta r�t hoan ngh�nh nh�ng ng��i c�n mang ��n <color=red>1 c�i �u�i h�<color> �� ch�ng t� th�c l�c c�a ng��i!",2,"C� th�/yes1401_5","Kh�ng th�/no1401_5")
end;

function  yes1401_5()
		Talk(2,"","X� g� 1 c�i �u�i h�! Ta �i ngay ��y!","�� kh�o nghi�m n�ng l�c c�a ng��i, h�y ��n ch�n n�i <color=red>Thi�u L�m t�<color> ��nh <color=red>H� d�<color> l�y v� <color=red>1 c�i �u�i h�<color>!")
		SetTask(1401,35)
		--AddNote("ȥ�ռ�1����β�����ܲξ���")
		Msg2Player("�i thu th�p 1 c�i �u�i h� m�i c� th� ��u qu�n!")
end;

function  no1401_5()
	Talk(1,"","��nh h� d� �? Th�i �i! Ta s� l�m!")
end;
