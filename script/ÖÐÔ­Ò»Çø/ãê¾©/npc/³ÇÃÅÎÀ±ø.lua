
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���������ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");

Include("\\script\\global\\maphelp.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	
	if (nState==8) then
		task_008_00();
		return
	else

		UWorld1503=GetTask(1503)
		UTask_world1504=GetTask(1504)
		
		if(UWorld1503 == 5 or UWorld1503 ==10) then
			if(UWorld1503 == 5) then
				Talk(1,"","T�i h� ph�ng l�nh Th�a t��ng Tri�u Ph� ��n th�c gi�c chuy�n chi�u th�!")
				Talk(1,"","Ta v�a m�i d�n xong! Phi�n b�ng h�u v� h�i b�m v�i th�a t��ng!")
				SetTask(1503,10)
			end
				if(UWorld1503 == 10) then
				Talk(1,"","Sao ng��i ch�a th�ng b�o cho ph� th�a t��ng?")
			end
		
		--�꾩�� ��������
		--�꾩���������񣺴������
		-- By: ������(2005.01.26)
		--Include("\\script\\global\\itemhead.lua")
		
		elseif (UTask_world1504 == 0 and GetLevel() > 7) then 		--��������
						Say("G�n ��y b�n C�n �� �ang ho�nh h�nh ngo�i th�nh, qu�y nhi�u d�n ch�ng! H�y �i tr�ng tr� ch�ng!",2,"Ta �i ngay!/W1504_get_yes","Sau n�y h�y t�nh/W1504_get_no")
		elseif (UTask_world1504 == 5  and  GetItemCount(2,1,11) >= 10 ) then		-- �������
						DelItem(2,1,11,10)
						SetTask(1504,10)
						Talk(1,"","Qu� nhi�n th�n th� b�t ph�m! ��y ch�t l� v�t xin nh�n l�y!")
						--AddNote("��10˫�廨Ь��������������������ɡ�")
						TaskTip("Giao 10 ��i T� Hoa h�i cho V� binh th�nh m�n, ho�n th�nh nhi�m v�!")
						--AddItem(2,1,1,1)
						Earn(400)
						GivePlayerExp(SkeyShiJieChongFu,"wulai")
						ModifyReputation(3,0)
		elseif (UTask_world1504 == 5  and  GetItemCount(2,1,11) < 10 ) then
						Talk(1,"","H�y tr�ng tr� b�n C�n �� ngo�i th�nh v� mang 10 ��i T� Hoa h�i v� l�m b�ng ch�ng!")
		else
						Say("Ta ��ng ��y �� h�n 10 n�m, t�ng g�p nhi�u cao th� h�o ki�t. Mu�n bi�t khu v�c luy�n c�ng, h�y ��n t�m ta! Ng��i c� h�ng th� kh�ng?",2,"Xin cho bi�t khu v�c luy�n c�ng th�ch h�p./yes","Ta kh�ng mu�n nghe./no")
		end

end;

end;

function yes()
	maphp()
end;

function no()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","Kinh th�nh �ang l�m nguy, m�i ng��i h�y g�p s�c t�m ���ng c�u v�n!")
	elseif i == 2 then  
		Talk(1,"","Mau �i qua! ��ng ��ng c�n c�ng th�nh!")
	else
		Talk(1,"","C�n th�n! Ngo�i quan �i �ang c� chi�n s�! ��ng b� s�t b�n gian t� Li�u Qu�c!")
	end
end;


function W1504_get_yes()
	SetTask(1504,5)
	Talk(1,"","H�y tr�ng tr� b�n C�n ��, l�y v� 10 ��i T� Hoa h�i c�a c�c d�n n� b� b�n C�n �� c��p b�c!")
	Talk(1,"","���c! T�i h� l�p t�c l�n ���ng!")
	--AddNote("�ӵ������ռ�10˫���廨Ь������������������ƾ֤��")
	TaskTip("Nh�n nhi�m v�: Thu th�p 10 ��i T� Hoa h�i, tr�ng tr� b�n C�n ��!")
end;
