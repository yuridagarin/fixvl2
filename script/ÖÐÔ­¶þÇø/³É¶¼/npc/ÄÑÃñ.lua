--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
	UWorld1402 = GetTask(1402)
	if UWorld1402 == 100 then
		UWorld1402 = 0
	end
	if ( UWorld1402 == 0 and GetLevel() >= 40 )  then
			Talk(4,"","G�n ��y sao c� nhi�u n�n d�n th�?","L�m �n cho t�i <color=red>2 c�i b�nh ng�<color>! M�y ng�y nay t�i ch�ng c� g� �� �n.","C�c ng��i t� ��u ��n?","L�m �n cho t�i <color=red>2 c�i b�nh ng�<color>! M�y ng�y nay t�i ch�ng c� g� �� �n.")
			SetTask(1402,5)
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) > 1  )  then
			Talk(2,"","Xin �a t�! Ch�ng t�i ��u l� ng��i c�a <color=red>Giang T�n th�n<color>, n�i �� ��t nhi�n xu�t hi�n nhi�u y�u ma qu� qu�i, mong ��i hi�p ra tay gi�p ��! C� v� ��i hi�p t�n l� <color=red>Tr��ng ��nh<color> �ang chi�n di�t tr� b�n y�u qu�i � ��, c� vi�c g� c� h�i y.","���c! �� ta ��n �� m�t chuy�n xem sao.")
			if  DelItem(1,1,1,2) == 1 then 
				 SetTask(1402,10)
				 --AddItem(0,0,0)
				 Earn(500)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng1")		--�ᶼ���1
				 ModifyReputation(5,0)
				 --AddNote("���߾��顪����������������ȥ����������������������")
				 TaskTip("Nhi�m v� Ho�ng Kim--nhi�m v� Qu� Th�nh, b�t ��u! ��n Giang T�n th�n h�i Tr��ng ��nh t�nh h�nh c� th�.")
			else
			 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
			end
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) < 2 and GetItemCount(1,1,1) >= 0 )  then
			Talk(1,"","L�m �n cho t�i <color=red>2 c�i b�nh ng�<color>! M�y ng�y nay t�i ch�ng c� g� �� �n.")
	elseif ( UWorld1402 == 10 )  then
			Talk(1,"","<color=red>Giang T�n th�n<color> c� v� ��i hi�p t�n <color=red>Tr��ng ��nh<color> �ang di�t tr� ma qu�i, c� vi�c g� c� h�i y.")
	elseif ( GetLevel() <40 ) then
			Talk(1,"","��i ��n l�c v� c�ng c�a ��i hi�p ti�n b� th�m h�y ��n <color=red>Giang T�n th�n<color> gi�p b�n t�i!")
	else
			Talk(1,"","L�m �n cho ti�u nh�n xin 2 c�i b�nh ng� �n �i!")
	end
end;
