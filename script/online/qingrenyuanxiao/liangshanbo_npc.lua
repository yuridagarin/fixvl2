--filename:liangshanbo_npc.lua
--create date:2006-01-21
--author:yanjun
--describe:��ɽ���ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")


function main()
	if CanAcceptTask(TASK_LOVESTORY1,3) == 1 then
		Talk(4,"","V� n�y ch�c l� L��ng S�n B� r�i? Ch�c Anh ��i g�n ��y c� vi�c b�n, b�o ta ��n h�i th�m c�ng t�!",
				"Ta �ang bu�n ch�t m�t th�i! <color=yellow>Kim Lan thi�p<color> t�n v�t k�t ngh�a c�a ta v� Ch�c hi�n �� �� b� m�t. Ta nghi ng� l� do th�ng nh�c ngh�ch ng�m <color=red>T� C�u<color> l�y. Nh�ng ta kh�ng ti�n ��i n�. Th�t l� phi�n qu�.",
				"T��ng chuy�n g� ch� vi�c n�y r�t d�, �� ta �i h�i cho.",
				"Th� th� hay qu�, <color=red>T� C�u<color> hi�n �ang ch�i � D��ng Ch�u, xin h�y gi�p ta!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,4)
			TaskTip("��n D��ng Ch�u t�m T� C�u l�y l�i Kim Lan thi�p.")
		end
		PlayerIndex = OldPlayerIndex	
	elseif CanAcceptTask(TASK_LOVESTORY1,4) == 1 or CanAcceptTask(TASK_LOVESTORY1,5)== 1 then
		Say("<color=red>T� C�u<color> th�ng b� n�y �ang ch�i � D��ng Ch�u ��y!",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,6) == 1 then
		Talk(2,"","�! H�! Ng��i �� ki�m l�i Kim Lan thi�p r�i sao! �a t�! Xin gi�p ta chuy�n l�i v�i Ch�c hi�n ��, ta d�o n�y v�n kh�e, c� r�nh c�ng u�ng tr� ng�m th�!",
				"<color=green>Ng��i ch�i<color>: ���c! Ta s� chuy�n l�i gi�p c�ng t�.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			DelItem(2,0,356,1)
			SetTask(TASK_LOVESTORY1,7)
			TaskTip("V� g�p Ch�c Anh ��i")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,7) == 1 then
		Say("Xin gi�p ta chuy�n l�i v�i Ch�c hi�n ��, ta d�o n�y v�n kh�e, c� r�nh c�ng u�ng tr� ng�m th�!",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,8) == 1 then
		Talk(9,"","Ch�ng kh�, Ch�c Anh ��i b�o ta mang v�t n�y v� chuy�n 1 l�i cho c�ng t�",
				"Ch�ng kh�? Th�t ta kh�ng hi�u?",
				"Ch�c Anh ��i nh� ta ��a c�y tr�m n�y v� n�i v�i c�ng t�: <color=red>m�t b�y, hai t�m, ba s�u, b�n ch�n<color>.",
				"Ta kh�ng ph�i l� con g�i, Ch�c hi�n �� t�i sao l�i t�ng ta c�y tr�m nh�?",
				"C�ng t� c� nh� �� n�i g� v�i Ch�c Anh ��i khi chia tay nhau kh�ng?",
				"N�u L��ng huynh Th�ch m�u ��n, h�y ��n nh� ti�u �� ch�i, sau nh� c� v��n m�u ��n r�t ��p, L��ng huynh ngh� sao!",
				"Ch�c hi�n �� n�i, n�u Anh ��i l� g�i gi� trai, th� L��ng huynh c� mu�n k�t l�m ��i uy�n ��ng kh�ng?", 
				"Ch�c hi�n �� n�i, L��ng huynh c� th�y con v�t n��c kia kh�ng, n� �ang c��i L��ng huynh gi�ng nh� ch�ng kh� ��!",
				"Ch�c hi�n �� n�i, hai ta gi�ng nh� Ng�u Lang Ch�c N� �i qua c�u � Th��c!")
		Talk(9,"","Ch�c hi�n �� n�i, b� ngo�i l� 1 nam t� h�n, nh�ng th�t ra l� g�i gi� trai.", 
				"Ch�c hi�n �� n�i, L��ng huynh c� nh�n th�y 2 b�ng ng��i � ��y gi�ng, 1 ��i nam n� �ang c��i ��a k�a!", 
				"Ch�c hi�n �� n�i, Quan �m ��i s� se duy�n cho ��i ta ��, ch�ng ta h�y b�i ���ng �i!",
				"C�n g� n�a? Sau �� Ch�c �� c�n n�i 1 c�u n�a m�?",
				"Ch�c hi�n �� n�i, L��ng huynh anh h�y s�m mang ki�u hoa ��n, �� h�n huynh v�o l� Th�t T�ch nh�!",
				"Ch�ng kh�, h�m nay Anh ��i ��a c�y tr�m n�y, l� n�o c�ng t� v�n ch�a hi�u sao?",
				"Tr�i, ta qu� l� th�ng ng�c, ta �� hi�u <color=red>m�t b�y, hai t�m, ba s�u, b�n ch�n<color>, ta s� chu�n b� l� c��i ��n nh� Anh ��i.",
				"Th� th� t�t, ch�c ��i t�nh nh�n s�m th�nh phu th�!",
				"Ch�c b�ng h�u vui v�! ��y l� m�n qu� t� l�, xin b�ng h�u ��ng t� ch�i!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,9)
			DelItem(2,0,357,1)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("Ho�n th�nh nhi�m v�")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY1) == 9 then
		Say("Ch�c b�ng h�u vui v�!",0)
	elseif GetTask(TASK_LOVESTORY1) == 0 or GetTask(TASK_LOVESTORY1) == 1 or GetTask(TASK_LOVESTORY1) == 2 then
		Say("C�u v�ng mu�n d�m tr�m hoa n�, ��i b��m bay l��n trong v��n hoa.",0)
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

