------------------------------------------------------------
-- �����޼����Ľű� jiutianwujidan.lua
--
-- comment: ʹ�ú�ֱ�ӵ���73����3000������4000ʦ�Ź��׶ȣ�5w��ͳ����
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1006
------------------------------------------------------------

TSK_USE = 1540

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>C�u Thi�n V� C�c ��n<color>? N� c� th� gi�p b�n ��t ��n c�p 73, danh v�ng 3000, �� c�ng hi�n s� m�n 4000 v� qu�n c�ng chi�n tr��ng.",
		2,
		"���c/use_jiutianwuji_dan",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_jiutianwuji_dan()
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if GetTask(TSK_USE) ~= 0 then
		Say("B�n �� s� d�ng s� thu�c n�y.", 0)
		return
	end
	
	if (nCurLevel >= 73 and nCurRepu >= 3000 and nCurFactionRepu >= 4000 and (nZhanGong >= 50000 or nZhanGong <= -50000)) then
		Say("B�n �� l� cao th� v� l�m, kh�ng c�n d�ng ��n s� thu�c n�y.", 0)
		return
	end
	
	Say("B�n mu�n nh�p phe c�a �� th�ng n�o?",
		3,
		"�� th�ng_T�ng/#real_do_with_camp(1)",
		"�� th�ng phe Li�u/#real_do_with_camp(2)",
		"Kh�ng s� d�ng/cancel_dialog")
end;

function real_do_with_camp(nCamp)
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if (DelItem(2, 1, 1006, 1) == 1) then
		SetTask(TSK_USE,1)
		
		if (nCurLevel < 73) then
			SetLevel(73, 454)
			ResetProperty()
		end
	
		if (nCurRepu < 3000) then
			ModifyReputation(3000 - nCurRepu, 0)
		end
	
		if (nCurFactionRepu < 4000) then
			SetTask(336, 4000)
		end
	
		if (nCamp == 1 and nZhanGong < 50000) then	--��Ϊ�η���ͳ
			SetTask(701,50000)	--�����η�����
			SetTask(704,3)	--�����η���ǰ����
			if GetTask(745) < 3 then	--���֮ǰ�η�����С�ڶ�ͳ
				SetTask(745,3)	--�����η���߾���
			end;
			if GetTask(702) < 50000 then
				SetTask(702,50000);	--�����η���߾���
			end;
		elseif (nCamp == 2 and nZhanGong > -50000) then	--��Ϊ�ɷ���ͳ
			SetTask(701,-50000)	--�����ɷ�����
			SetTask(704,-3)	--�����ɷ���ǰ����
			if GetTask(746) > -3 then	--���֮ǰ�ɷ�����С�ڶ�ͳ
				SetTask(746,-3)	--�����ɷ���߾���
			end;
			if GetTask(703) < 50000 then
				SetTask(703,50000);	--�����ɷ���߾���
			end;
		end;
		
		ModifyExp(20000000)
	
		Say("B�n �� l� cao th� v� l�m, v� sau c� th� h�nh hi�p tr��ng ngh�a!", 0)
	end
end;

