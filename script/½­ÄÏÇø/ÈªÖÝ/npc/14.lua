--����
--�ص㣺�꾩��  ����������������13
--�߻���������  2004.03.


function main()
UWorld1401 = GetTask(1401) 
--�����ǰ������������ʶ����������------------------------------------
if ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) >= 10 or GetItemCount(2,1,75) >= 10 or GetItemCount(2,1,96) >=5 )  then
				if ( DelItem(2,1,54,10) == 1 and DelItem(2,1,75,10) == 1 and DelItem(2,1,96,5) == 1 ) then
Talk(6,"","Xin h�i ��i nh�n ��y c� ph�i l� M�c Ngh�a?","L� ta ��y! C� vi�c g� kh�ng?","T�i h� v�n chuy�n l��ng th�c ��n.","Ch�ng ph�i vi�c n�y l� do Nhi�u L�n ph� tr�ch sao?","Nhi�u L�n l�m b�nh n�n nh� t�i h� chuy�n thay!","V�y c�ng t�t, ng��i �� l��ng th�c l�i ��y.")
					 SetTask(1401,95)
					 ----AddItem(0,0,0)
					 --Earn(10000)
					 ModifyExp(10000)
					 AddNote("�� chuy�n l��ng th�c ��n cho ph� m� M�c Ngh�a nh�ng ch�a l�y ���c tin t�c.")
					 Msg2Player("�� chuy�n l��ng th�c ��n cho ph� m� M�c Ngh�a nh�ng ch�a l�y ���c tin t�c.")
				else
				 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
				end
		else
				Talk(1,"","B�ng c�ch n�o ng��i l�i x�m nh�p ���c v�o B� L�c V��ng K� ta?")
		end
elseif ( UWorld1401  == 95  ) then
		Talk(2,"say1401_13","T�i h� c� chuy�n n�y mu�n b�o cho ��i nh�n.","Ng��i n�i nhanh �i.")	
--������ֱ�ӻ�¸���������������---------------------------
elseif ( UWorld1401  == 100  ) then
	Talk(2,"say1401_13","Xin h�i ��i nh�n ��y c� ph�i l� M�c Ngh�a?","Ng��i l� ai?")
--�����Ǵ��������������Ժ�����---------------------------
elseif ( UWorld1401  == 105 ) then
		Talk(1,"","Ti�u anh h�ng, ng��i mau ��n <color=red>Nh�n M�n quan<color> b�o cho ph� th�n ta l� <color=red>D��ng Nghi�p<color> r�ng Khi�t �an �� chu�n b� 10 v�n binh m� s�p t�n c�ng Nh�n M�n quan, c�n b�y Thi�n M�n tr�n. Ta � ��y m�i vi�c b�nh y�n kh�ng ph�i lo l�ng g� c�.")


--�����ǰ�������̽ĸ������----------------------------------		
elseif ( UWorld1401  == 110 ) then
		Talk(7,"","T�i h� �� b�m b�o l�i s� vi�c cho D��ng l�o t��ng qu�n, hi�n gi� �ang chu�n b� �ng chi�n.","V�y th� t�t qu�, ph� th�n ta c� n�i g� n�a kh�ng?","D��ng l�o t��ng qu�n r�t vui, nh� t�i h� nh�n l�i n�u ��i nh�n c� r�nh th� v� th�m.","Ta r�t mu�n v� th�m ph� th�n, nh�ng b�n r�n th� n�y sao �i ���c ��y?","T�i h� c� � n�y, hay l� ��i nh�n thay trang ph�c th��ng d�n, nh� v�y �i ���ng s� ti�n h�n.","H�o k�! Nh�ng c�n ph�i c� <color=red>L�nh b�i<color> v� thay ��i trang ph�c c�a <color=red>qu�n T�ng<color> gi� l�m ng��i Khi�t �an m�i ���c qua �i.","<color=red>Li�u Th�ng l�nh<color> c� th� t�m � <color=red>Ngo�i t�c s�t th�<color>, <color=red>qu�n ph�c T�ng binh<color> c� th� ��n <color=red>Nh�n M�n quan<color> ��nh <color=red>T�ng �ao binh<color> �� l�y!")
		SetTask(1401,115)			
			 AddNote("T�m Li�u Th�ng l�nh, qu�n ph�c T�ng binh, gi�p T� Lang v� th�m ph� m�u.")
			 Msg2Player("T�m Li�u Th�ng l�nh, qu�n ph�c T�ng binh, gi�p T� Lang v� th�m ph� m�u.")	
elseif ( UWorld1401  == 115 and GetItemCount(2,0,3) >= 1  and GetItemCount(2,0,4) >= 1 ) then
		if  (DelItem(2,0,3,1) == 1 and DelItem(2,0,4,1) == 1 ) then
			Talk(2,"","M�i th� �� s�n s�ng! Ti�u anh h�ng! D��ng Di�n Huy ta m�i kh�ng qu�n �n ��c c�a ng��i! Ta mu�n h�i qu�c th�m m�u th�n t� l�u nh�ng l�c n�y h�y ��n <color=red>Ti�u Thi�n H�u<color> d� th�m th�m ch�t tin t�c v� <color=yellow>B�n �� S�n H� X� T�c<color>.","��i nh�n nh� b�o tr�ng.")

			 SetTask(1401,120)
			 ----AddItem(0,0,0)
			 --Earn(10000)
			 ModifyExp(10000)
			 AddNote("��n g�p Thi�n H�u c� th� t�m ra ch�t manh m�i.")
			 Msg2Player("��n g�p Thi�n H�u c� th� t�m ra ch�t manh m�i.")
			
		else
			 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
		
elseif (( GetItemCount(2,1,203) == 0  or  GetItemCount(2,1,204) == 0 )and UWorld1401  == 115 ) then
		Talk(1,"","Ch�ng ph�i ng��i n�i d� d�ng l�y ���c <color=red>Li�u Th�ng l�nh<color> v� <color=red>T�ng Binh qu�n ph�c<color> v� sao? Ta �ang mong tin t�t c�a ng��i!")

elseif ( UWorld1401  == 120 ) then
		Talk(1,"","Ng��i ��n g�p <color=red>Ti�u Thi�n H�u<color> c� th� t�m ra ch�t manh m�i.")
		

--�����ǰ�������̽ĸ������---------------------------------------	

else
	Talk(1,"","Khi�t �an chu�n b� 10 v�n ��i qu�n, 10 v�n ��i qu�n! Kh� l�m!")
end
end;


function  say1401_13()
	Talk(7,"","Xin h�i c� bi�t <color=red>Ti�u Y�n Y�n<color> v� <color=red>H�n ��c Nh��ng<color> � ��u?","Hai c�i t�n n�y ng��i c�ng d�m t�y ti�n n�i ra sao? <color=red>Y�n Y�n l� t�n c�m c�m c�a ���ng tri�u Ti�u Th�i H�u. H�n ��c Nh��ng l� t�n g�c H�n c�a ���ng tri�u ��i th�a t��ng Gia Lu�t Long V�n, l� n�o ng��i kh�ng bi�t?<color>","T�i h� ���c m�t ng��i th�n c�a h� l� <color=red>H�n Tr� Nh��ng<color> ph�i ��n ��y.","L�n sau c� vi�c g� c� b�o v�i ta l� ���c r�i, m� ng��i c�ng l� ng��i H�n �?","Ti�u nh�n ��ch th�c l� ng��i H�n.","Ng��i c� tin t�c g� v� <color=red>t�nh h�nh c�a D��ng gia<color> kh�ng? Kh�ng gi�u g� ng��i, ta ch�nh l� <color=red>T� Lang D��ng Di�n Huy<color>, v� s� an to�n n�n �� ��i t�n th�nh M�c Ngh�a.","K� th�c th� t�i h� ch�nh l� thu�c h� c�a D��ng Nghi�p l�o t��ng, l�n n�y ��n ��y �� th�m d�.","Ti�u anh h�ng, ng��i mau ��n <color=red>Nh�n M�n quan<color> b�o cho ph� th�n ta l� <color=red>D��ng Nghi�p<color> r�ng Khi�t �an �� chu�n b� 10 v�n binh m� s�p t�n c�ng Nh�n M�n quan, c�n b�y Thi�n M�n tr�n. Ta � ��y m�i vi�c b�nh y�n kh�ng ph�i lo l�ng g� c�.")
    SetTask(1401,105)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("Quay v� Nh�n M�n quan b�o tin t�c c�a T� Lang D��ng Di�n Huy v� h�nh ��ng c�a Khi�t �an.")
    Msg2Player("Quay v� Nh�n M�n quan b�o tin t�c c�a T� Lang D��ng Di�n Huy v� h�nh ��ng c�a Khi�t �an.")
end;
