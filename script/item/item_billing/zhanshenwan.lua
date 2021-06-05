Include("\\script\\lib\\globalfunctions.lua") 

function OnUse(nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = "";
	if nZhanGong < 0 then
		sCampName = "Li�u";
	elseif nZhanGong > 0 then
		sCampName = "T�ng";
	else
		sCampName = "Trung l�p";
	end; 
	local selTab = {
				"�� th�ng_T�ng/#change_camp(1,"..nItemIdx..")",
				"�� th�ng phe Li�u/#change_camp(2,"..nItemIdx..")",
				"Sau n�y m�i s� d�ng/nothing",
				}
				
	Say("Hi�n b�n thu�c: <color=yellow>"..sCampName.."<color>, chi�n c�ng hi�n t�i <color=yellow>"..abs(nZhanGong).."<color> �i�m. S� d�ng Chi�n Th�n ho�n c� th� gi�p b�n tr� th�nh <color=yellow>�� th�ng<color> c�a m�t phe ��ng th�i chi�n c�ng ���c <color=yellow>50000 �i�m<color>, mu�n s� d�ng kh�ng?",
		getn(selTab),
		selTab)
end;

function change_camp(nCamp,nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = ""
	
	if nZhanGong < 0 then
		sCampName = "Li�u"
	elseif (nZhanGong > 0) then
		sCampName = "T�ng"
	else
		sCampName = "Trung l�p"
	end
	
	if abs(nZhanGong) >= 50000 then	--�����ǰ��������ֵ���ڵ���50000
		Talk(1, "", "Hi�n b�n thu�c: <color=yellow>"..sCampName.."<color>, chi�n c�ng hi�n t�i <color=yellow>"..abs(nZhanGong).."<color> �i�m, v��t m�c <color=red>50000<color> kh�ng th� d�ng Chi�n Th�n ho�n.")
		return 0
	end
	
	if (DelItemByIndex(nItemIdx,1) == 1) then
		if (nCamp == 1) then						--��Ϊ�η���ͳ
			SetTask(701, 50000)						--�����η�����
			SetTask(704, 3)							--�����η���ǰ����
			if (GetTask(745) < 3) then				--���֮ǰ�η�����С�ڶ�ͳ
				SetTask(745, 3)						--�����η���߾���
			end
			if GetTask(702) < 50000 then
				SetTask(702,50000);	--�����η���߾���
			end;
			Say("B�n ���c phong l�m T�ng �� th�ng.", 0)
		elseif (nCamp == 2) then					--��Ϊ�ɷ���ͳ
			SetTask(701, -50000)					--�����ɷ�����
			SetTask(704, -3)						--�����ɷ���ǰ����
			if GetTask(746) > -3 then	--���֮ǰ�ɷ�����С�ڶ�ͳ
				SetTask(746,-3)	--�����ɷ���߾���
			end;
			if GetTask(703) < 50000 then
				SetTask(703,50000);	--�����ɷ���߾���
			end;
			Say("B�n ���c phong l�m Li�u �� th�ng",0);
		end;
		gf_WriteLogEx("SU DUNG CHIEN THAN HOAN", "s� d�ng th�nh c�ng", 1, "S� d�ng Chi�n Th�n Ho�n")
	end;
end;