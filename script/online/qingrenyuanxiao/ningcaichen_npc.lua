--filename:ningcaichen.lua
--create date:2006-01-21
--author:yanjun
--describe:���ɳ��ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local selTab = {
				"Ta ��ng �/ok",
				"�� ta suy ngh� l�i/nothing"
				}
	if NoTaskBegin() == 1 then
		Say("4 nhi�m v� n�y c�n ph�i t� ��i th�c hi�n su�t t� ��u ��n cu�i! N�u kh�ng s� kh�ng th� ho�n th�nh",2,selTab)
	else
		ok()
	end
end

function ok()
	if GetTask(TASK_LOVESTORY3) == 0 then
		Talk(2,"","huhu��",
				"Th�t nguy hi�m!")
	elseif CanAcceptTask(TASK_LOVESTORY3,1) == 1 then
		Talk(6,"","C� vi�c g� m� v� m�t c�ng t� h�c h�c th�?",
				"Ta v� Ti�u S�nh mu�n b� tr�n, nh�ng Qu� V�c L�o L�o ph�t hi�n, su�t ch�t n�a m�t m�ng, hi�n gi� v�n c�n run s�!",
				"Ch� tr�ch!",
				"May m�n tho�t ���c, nh�ng Ti�u S�nh v� c�u ta n�n b� Qu� V�c L�o L�o b�t, hi�n b� c�m gi� � Giang T�n th�n, Ta kh�ng ngh� ra c�ch c�u n�ng, nh� v� h�y gi�p ta v�i1",
				"���c! �� ta gi�p.",
				"<color=yellow>Ti�u S�nh<color> �ang � <color=red>Giang T�n th�n<color>, nh� nh� v� th�m d� t�nh h�nh Ti�u S�nh r�i v� n�i cho ta bi�t.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("Ti�p nh�n nhi�m v� th�t b�i, xin h�y th� l�i!",0)
			return 0
		end		
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY3,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("��n Giang T�n th�n g�p Nhi�p Ti�u S�nh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY3,2) == 1 or CanAcceptTask(TASK_LOVESTORY3,3) == 1 then
		Say("C�c v� v�n ch�a �i �? <color=yellow>Ti�u S�nh<color>hi�n � <color=red>Giang T�n th�n<color>.",0)
	elseif CanAcceptTask(TASK_LOVESTORY3,4) == 1 then
		Talk(5,"","Sao th�? G�p Ti�u S�nh ch�a? N�ng v�n kh�e ch�? L�o L�o c� b�t ���c ch�a?",
				"N�ng v�n b�nh an, ch� l� b� Qu� V�c L�o L�o �i�m b�a ��nh th�n, nh�ng �� ���c h�a gi�i. N�u kh�ng ��nh b�i L�o L�o th� Ti�u S�nh v�nh vi�n kh�ng ���c gi�i tho�t. Nghe n�i ch� c� Y�n X�ch H� b�o ki�m m�i c� th� ti�u di�t L�o L�o.",
				"C�c v� mu�n gi�p ti�u di�t Qu� V�c L�o L�o �? Th�t hay qu�! Y�n X�ch H� b�o ki�m v� Ng�c b�i l� L�o L�o cho ta �� ph�ng th�n, nay c�c v� h�y l�y m� d�ng, H�y ��n <color=red>Giang T�n th�n<color> �i�m n�, L�o L�o s� t��ng ta ��n, nh�t ��nh s� hi�n th�n.",
				"���c! �� ta gi�p.",
				"��n Phong �� s� d�ng <color=red>Ng�c b�i<color>, Qu� V�c L�o L�o s� xu�t hi�n, nh� v� h�y c�m Y�n X�ch H� b�o ki�m ti�u di�t L�o. Ta v� Ti�u S�nh su�t ��i kh�ng qu�n ��i �n ��i ��c c�a nh� v�.")
		local OldPlayerIndex = PlayerIndex
		if AddItem(2,0,353,1) == 1 and AddItem(2,0,354,1) == 1 then
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY3,5)
				TaskTip("��n Giang T�n th�n s� d�ng ng�c b�i Ninh Th�i Th�n")
			end
			PlayerIndex = OldPlayerIndex
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		Say("��n Phong �� s� d�ng <color=red>Ng�c b�i<color>, Qu� V�c L�o L�o s� xu�t hi�n, nh� v� h�y c�m Y�n X�ch H� b�o ki�m ti�u di�t L�o. Ta v� Ti�u S�nh su�t ��i kh�ng qu�n ��i �n ��i ��c c�a nh� v�.",0)
		if GetItemCount(2,0,354) == 0 then
			AddItem(2,0,354,1)
			TaskTip("��n Giang T�n th�n s� d�ng ng�c b�i Ninh Th�i Th�n")
		end
		if GetItemCount(2,0,353) == 0 then
			AddItem(2,0,353,1)
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,6) == 1 then
		Talk(4,"","C� tin m�ng! Qu� V�c L�o L�o �� b� ��nh b�i! Tr� cho c�ng t� Y�n X�ch H� b�o ki�m.",
				"Ta �ang m� sao? Th�t hay qu�! T� nay kh�ng c�n ai c�n tr� n�a!",
				"Th� th� t�t, ch�c ��i t�nh nh�n s�m th�nh phu th�!",
				"Ch�c nh� v� vui v�! ��y l� m�n qu� t� l�, xin c�c v� ��ng t� ch�i!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			DelItem(2,0,354,1)
			DelItem(2,0,353,1)
			SetTask(TASK_LOVESTORY3,7)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("Ho�n th�nh nhi�m v�")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY3) == 7 then	
		Say("�a t�, ch�c nh� v� vui v�!",0)
	elseif GetTeamSize() == 2 then
		Say("Tho�t ��u l� ��i b�n, sao b�y gi� l� ��i t�nh nh�n v�y?",0)
	else
		Say("D��ng nh� 1 m�nh ng��i kh�ng th� gi�p ta, ph�i l� 1 ��i t�nh nh�n m�i ���c.",0)
	end

	if AllTaskComplete() ==1 then
		TaskTip("H�y ��n Nguy�t l�o l�nh th��ng.")
		Msg2Player("Cu�i c�ng �� gi�p Nguy�t l�o t�c h�p cho 4 c�p t�nh nh�n, h�y mau g�p Nguy�t l�o l�nh th��ng.")
	end
end

function nothing()

end