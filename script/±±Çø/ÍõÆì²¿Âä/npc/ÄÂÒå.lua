--����
--�ص㣺�꾩��  ����������������13
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1401 = GetTask(1401) 
--�����ǰ������������ʶ����������------------------------------------
if ( UWorld1401  == 90 ) then
		if ( GetItemCount(2,1,54) >= 20 and GetItemCount(2,1,75) >= 20 and GetItemCount(2,1,96) >=15 )  then
				if ( DelItem(2,1,54,20) == 1 and DelItem(2,1,75,20) == 1 and DelItem(2,1,96,15) == 1 ) then
					Talk(6,"","Xin h�i ��i nh�n ��y c� ph�i l� M�c Ngh�a?","L� ta ��y! C� vi�c g� kh�ng?","T�i h� v�n chuy�n l��ng th�c ��n.","<color=green>M�c Ngh�a<color>: nh�ng th� n�y kh�ng ph�i l� do Nhi�u L�n ph� tr�ch mang l�i hay sao?","Nhi�u L�n l�m b�nh n�n nh� t�i h� chuy�n thay!","<color=green>M�c Ngh�a<color>: th�i ���c, ta nh�n ���c r�i, ng��i y�n t�m.")
					 SetTask(1401,95)
					 GivePlayerExp(SkeyTianmenzhen,"liaoguofuma")
					 ModifyReputation(20,0)
					 TaskTip("�� chuy�n l��ng th�c ��n cho ph� m� M�c Ngh�a nh�ng ch�a l�y ���c tin t�c.")
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
		Talk(4,"mytalk1","<color=green> <color>: ta �� mang t�nh h�nh c�a Khi�t �an b�o v�i D��ng l�o t��ng qu�n r�i.","V�y th� t�t qu�, ph� th�n ta c� n�i g� n�a kh�ng?","D��ng l�o t��ng qu�n r�t vui, nh� t�i h� nh�n l�i n�u ��i nh�n c� r�nh th� v� th�m.","Ta r�t mu�n v� th�m ph� th�n, nh�ng b�n r�n th� n�y sao �i ���c ��y?")
		SetTask(1401,115)			
			 GivePlayerExp(SkeyTianmenzhen,"wangqibuluo")
			 TaskTip("T�m Li�u Th�ng l�nh, qu�n ph�c T�ng binh, gi�p T� Lang v� th�m ph� m�u.")	
			 Msg2Player("T�m Li�u Th�ng l�nh, qu�n ph�c T�ng binh, gi�p T� Lang v� th�m ph� m�u.")	
elseif ( UWorld1401  == 115 and GetItemCount(2,0,3) >= 1  and GetItemCount(2,0,4) >= 1 ) then
		if  (DelItem(2,0,3,1) == 1 and DelItem(2,0,4,1) == 1 ) then
			Talk(2,"","L�n n�y ta v� th�m ph� m�u ng��i tranh th� th�i gian ��n g�p <color=red>Ti�u Thi�n H�u<color> th�m d� v� b�n <color=yellow>B�n �� S�n H� X� T�c<color>, vi�c n�y r�t quan tr�ng c� th� �nh h��ng ��n c� nghi�p c�a c� ��i T�ng v� v�y n�n th�n tr�ng.","<color=green> <color>: t�t, c�c h� h�y b�o tr�ng! ta �i ��y.")

			 SetTask(1401,120)
			 GivePlayerExp(SkeyTianmenzhen,"chutao")
			 ModifyReputation(25,0)
			 --AddNote("ȥ���������±������ܴ�̽����һ������Ϣ��")
			 TaskTip("��n g�p Thi�n H�u c� th� t�m ra ch�t manh m�i.")
			 Msg2Player("��n g�p Thi�n H�u c� th� t�m ra ch�t manh m�i.")
			
		else
			 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
		
elseif (( GetItemCount(2,1,203) == 0  or  GetItemCount(2,1,204) == 0 )and UWorld1401  == 115 ) then
		Talk(1,"","<color=red>Li�u Th�ng l�nh<color> c� th� t�m � <color=red>Ngo�i t�c s�t th�<color>, <color=red>qu�n ph�c T�ng binh<color> c� th� ��n <color=red>Nh�n M�n quan<color> ��nh <color=red>T�ng �ao binh<color> �� l�y!")

elseif ( UWorld1401  == 120 ) then
		Talk(1,"","Ng��i ��n g�p <color=red>Ti�u Thi�n H�u<color> c� th� t�m ra ch�t manh m�i.")
		

--�����ǰ�������̽ĸ������---------------------------------------	

else
	Talk(1,"","Khi�t �an chu�n b� 10 v�n ��i qu�n, 10 v�n ��i qu�n! Kh� l�m!")
end
end;


function  say1401_13()
	Talk(4,"mytalk2","<color=green> <color>: ta ���c s� �y th�c c�a 1 ng��i b�n ��n th�m h�i 2 ng��i. Xin h�i c�c h� c�c bi�t <color=red>Ti�u Y�n Y�n<color> v� <color=red>H�n ��c Nh��ng<color> 2 ng��i n�y kh�ng?","Hai c�i t�n n�y ng��i c�ng d�m t�y ti�n n�i ra sao? <color=red>Y�n Y�n l� t�n c�m c�m c�a ���ng tri�u Ti�u Th�i H�u. H�n ��c Nh��ng l� t�n g�c H�n c�a ���ng tri�u ��i th�a t��ng Gia Lu�t Long V�n, l� n�o ng��i kh�ng bi�t?<color>","T�i h� ���c m�t ng��i th�n c�a h� l� <color=red>H�n Tr� Nh��ng<color> ph�i ��n ��y.","<color=green>M�c Ngh�a<color>: � , th� �. V� sau, chuy�n c�a Th�i H�u v� Th�a T��ng ng��i ��ng nh�c ��n n�a. C� chuy�n g� ta lo l� ���c r�i. Thi�u hi�p ��y l� ng��i H�n?")
    SetTask(1401,105)
    GivePlayerExp(SkeyTianmenzhen,"zhenshishenfen")
    ModifyReputation(15,0)
    --AddNote("�����Ź�����ҵ�����������ӻԵ���Ѷ���Լ��������ж���")
    TaskTip("Quay v� Nh�n M�n quan b�o tin t�c c�a T� Lang D��ng Di�n Huy v� h�nh ��ng c�a Khi�t �an.")
    Msg2Player("Quay v� Nh�n M�n quan b�o tin t�c c�a T� Lang D��ng Di�n Huy v� h�nh ��ng c�a Khi�t �an.")
	
end;

function mytalk1()
		Talk(3,"","T�i h� c� � n�y, hay l� ��i nh�n thay trang ph�c th��ng d�n, nh� v�y �i ���ng s� ti�n h�n.","H�o k�! Nh�ng c�n ph�i c� <color=red>L�nh b�i<color> v� thay ��i trang ph�c c�a <color=red>qu�n T�ng<color> gi� l�m ng��i Khi�t �an m�i ���c qua �i.","Qu� d�! <color=red>Li�u Th�ng l�nh<color> c� th� ��nh <color=red>S�t th� ngo�i t�c<color> quanh ��y �� l�y, <color=red>T�ng ph�c<color> c� th� ��n <color=red>Nh�n M�n quan<color> ��nh <color=red>T�ng �ao binh<color> �� l�y!")


end;


function mytalk2()
	Talk(4,"","Ti�u nh�n ��ch th�c l� ng��i H�n.","<color=green>M�c Ngh�a<color>: Tr�n ���ng ��n ��y c�c h� c� nghe ���c tin t�c c�a <color=red>D��ng Gia Qu�n<color>? Kh�ng gi�u gi c�c h�, ta v�n l� <color=red>D��ng Gia T� Lang, t�n D��ng Di�n Huy<color>, tr�n chi�n tr��ng th�t l�c v�i t��ng ph�, nh�n nh�c thu sinh, ��i t�n th�nh M�c Ngh�a, ngh�a l� v�i m�c v� d� 2 ch� gh�p l�i th�nh D��ng.","K� th�c th� t�i h� ch�nh l� thu�c h� c�a D��ng Nghi�p l�o t��ng, l�n n�y ��n ��y �� th�m d�.","Ti�u anh h�ng, ng��i mau ��n <color=red>Nh�n M�n quan<color> b�o cho ph� th�n ta l� <color=red>D��ng Nghi�p<color> r�ng Khi�t �an �� chu�n b� 10 v�n binh m� s�p t�n c�ng Nh�n M�n quan, c�n b�y Thi�n M�n tr�n. Ta � ��y m�i vi�c b�nh y�n kh�ng ph�i lo l�ng g� c�.")
end;

