--����
--�ص㣺�꾩 �������Ź�������7
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ng��i l� ai? Sao t� ti�n v�o ��y?","<color=green>ng��i ch�i<color>: ta v�a m�i ��n, v�a v�o ��i ng�. Nh�n l�nh Th�i Qu�n ��n b�o danh qu�n D��ng Gia, c�n n�a, L�o Th�i Qu�n c� nh� ta chuy�n ��n cho ng�i 1 c�u, ch�nh l� �Ti�u nh�n ���ng ��o, c�n th�n h�nh ��ng.�","<color=green>D��ng Nghi�p<color>: Phu nh�n th�t c� l�ng! ���c r�i, ti�u anh h�ng ��y l�n ��u ��n Nh�n M�n Quan, c�ng kh�ng ti�n l�n ti�n tuy�n ngay, tr��c ti�n h�y gi�p ta tr�ng tr� nh�ng t�n t��ng kh�ng gi� lu�t t� ti�n h�nh ��ng.!","��n <color=red>Nh�n M�n quan<color> tr�ng tr� m�t s� <color=red>Ki�u binh<color> thu v� <color=red> 10 M�c B�i<color>.","<color=green>Ng��i ch�i<color>: ���c, ti�u nh�n s� �i ngay!")
		SetTask(1401,50)
		GivePlayerExp(SkeyTianmenzhen,"yangjiajiang")
		TaskTip("Gi�p D��ng Nghi�p tr�ng tr� Ki�u binh thu v� 10 M�c B�i.")
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 10 ) then
				if  DelItem(2,1,64,10) == 1 then
						    GivePlayerExp(SkeyTianmenzhen,"shumupai")
						    --Earn(1500)
						    ModifyReputation(18,0)						    
								--AddNote("���α�Ʀ��������ɡ�")
						    TaskTip("Nhi�m v� tr�ng tr� Ki�u binh ho�n th�nh.")
						    Msg2Player("Nhi�m v� tr�ng tr� Ki�u binh ho�n th�nh.")
		    
								Talk(6,"","<color=green>D��ng Nghi�p<color>: qu� nhi�n th�n th� b�t ph�m, ho�n th�nh nhi�m v� nhanh nh� v�y! th� th�, x�p cho ng��i m�t <color=red>nhi�m v� kh� kh�n <color> v�y!","<color=green>D��ng Nghi�p<color>: Ng��i v�a m�i ��n, qu�n Li�u ch�a g�p qua ng��i, th� th� ng��i h�y gi�p ta qua qu�n doanh phe Li�u th�m th�nh tin t�c �i.","Nh�ng ta l� ng��i H�n l�m sao ti�p c�n ���c v�i ng��i Khi�t �an?","Nghe n�i <color=red>Bi�n Kinh ph�<color> c� m�t ng��i H�n t�n l� <color=red>H�n Tr� Nh��ng<color> k�t h�n c�ng v�i m�t thi�u n� ng��i Khi�t �an.","��n t�m <color=red>H�n Tr� Nh��ng<color>, n�i ng��i l� th�ng gia c�a �ng �y, ch�c ch�n s� ���c h�u ��i. Tranh th� thu th�p tin t�c!","���c! T�i h� s� ��n <color=red>Bi�n Kinh ph� <color> t�m <color=red>H�n Tr� Nh��ng l�o nh�n<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 10 ) then
						Talk(1,"","��n <color=red>Nh�n M�n quan<color> tr�ng tr� m�t s� <color=red>Ki�u binh<color> thu v� <color=red> 10 M�c B�i<color>.")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau ��n <color=red>Bi�n Kinh ph�<color> t�m <color=red>H�n Tr� Nh��ng<color> l�o nh�n.")
--����������������---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","<color=green>Ng��i ch�i<color>: B�m t��ng qu�n, t�i h� th�m th�nh ���c ng��i Khi�t �an �� chu�n b� 10 v�n tinh binh b� tr� t�i Thi�n M�n ��i Tr�n! Mong t��ng qu�n c� k� s�ch chu�n b�!","C� th�t kh�ng? Ng��i nghe t� ��u v�y?","T�i h� v�a t� ch� <color=red>D��ng Di�n Huy<color> tr� v�.","<color=green>D��ng Nghi�p<color>: ta hi�n v�n c�n s�ng tr�n th� gian, c�n l�m ph� m� n��c Li�u, �ng tr�i ��i ��i ta th�t qu� t�t r�i! Ng��i h�y nhanh ch�ng quay v� b�o v�i <color=red>��nh Huy<color> r�ng h�y y�n t�m, ta �� suy t�nh, nh�t ��nh s� chu�n b� tr��c. C�n n�a g�i l�i nh�n c�a m� anh �y r�t nh� anh �y, c� th�i gian h�y quay l�i th�m b� �y.","T�i h� s� l�p t�c ��n <color=red>B� L�c V��ng K�<color> b�o cho <color=red>D��ng ��i nh�n <color>!")
						  GivePlayerExp(SkeyTianmenzhen,"zhunbeichutao")
						  --Earn(1500)
						  ModifyReputation(18,0)
							SetTask(1401,110)	    
							--AddNote("�����첿������ӻԣ����壩�ػ���")
							TaskTip("Quay l�i B� L�c V��ng K� h�i b�o ph� m� M�c Ngh�a")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","Phi�n b�ng h�u h�i b�o l�i cho nhi t� <color=red>D��ng Di�n Huy<color>.")
							
--���������Ź�����Ĵ���---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","B�m b�o T��ng qu�n, t�i h� v�a t� ch� <color=red>Ti�u Thi�n H�u<color> bi�t ���c <color=yellow>B�n �� S�n H� X� T�c<color> hi�n � Thi�n M�n tr�n. V� quy�t �o�t ���c n�, Khi�t �an �� chu�n b� 10 v�n tinh binh.","<color=green>D��ng Nghi�p <color>: A! <color=yellow>S�n H� X� T�c �� <color> qu� nhi�n �� xu�t hi�n r�i, th�t l� nghi�p ch��ng! L�o phu hi v�ng thi�u hi�p h�y nhanh ch�ng ��n <color=red>Thi�n M�n Tr�n<color> �o�t l�y <color=yellow>S�n H� X� T�c ��<color>","<color=green>Ng��i ch�i<color>: ���c! T�i h� �i l�p t�c ��n <color=red>Thi�n M�n Tr�n<color> �o�t l�y <color=yellow>S�n H� X� T�c �� <color>#")
		    SetTask(1401,135)
		    GivePlayerExp(SkeyTianmenzhen,"huibao")
		    --Earn(2000)
		    ModifyReputation(25,0)
		    AddNote("V�i danh ngh�a t��ng l�nh qu�n T�ng v�o Thi�n M�n tr�n �o�t t�m B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
		    TaskTip("V�i danh ngh�a t��ng l�nh qu�n T�ng v�o Thi�n M�n tr�n �o�t t�m B�n �� S�n H� X� T�c. (sau n�y c� th� ��i l�i)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao r�i? C� tin t�c g� c�a qu�n Li�u kh�ng?")
		
		else
								Talk(1,"","Ch� So�i Tr��ng kh�ng ���c t�y ti�n!")
	end
end;
