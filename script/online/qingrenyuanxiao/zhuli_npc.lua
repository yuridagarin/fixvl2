--filename:zhuli.lua
--create date:2006-01-21
--author:yanjun
--describe:�����ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY4,2) == 1 then
		Talk(5,"","Chu L� c� n��ng, c�ng t� La M�t, quen � ��m d� y�n l�n tr��c, nh� ta chuy�n l�i v�i n� hi�p.",
				"Chuy�n g� th�?",
				"Qu�n r�i, �� ta ngh� l�i ��.",
				"Ta ngh� r�ng ch� c� ta kh�ng ng� ���c! Th� ra Chu L� c� n��ng c�ng kh�ng ng� ���c sao?",
				"Ta ngh� r�ng ch� c� ta kh�ng ng� ���c! Th� ra Tinh Tinh c� n��ng c�ng kh�ng ng� ���c sao?")
		Talk(5,"","Ta ngh� r�ng ch� c� ta kh�ng ng� ���c, kh�ng bi�t Chu L� c� n��ng c� ng� ���c hay kh�ng?",
				"Ta ngh� r�ng ch� c� ta kh�ng ng� ���c, kh�ng bi�t Tinh Tinh c� n��ng c� ng� ���c hay kh�ng?",
				"B�ng h�u n�i g�? Sao ta kh�ng hi�u?",
				"Th� ra ch�ng c�ng y�u ta? Ch� tr�ch tim ta c�ng xao ��ng, thi�u hi�p bi�t kh�ng m�i khi ta g�p m�t ch�ng, ta kh�ng bi�t n�i g�? Ch�ng th�t th�ng minh! Ta c�n �ang ngh�, n�u ch�ng kh�ng th�ch ta th� l�m sao? Ch�ng c� v� r�i th� l�m sao ��y?",
				"Th� ra n�ng c�ng y�u La M�t �! Qu� d�! �� ta v� n�i l�i v�i La M�t!")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,3)
			TaskTip("V� g�p La M�t chuy�n ��t t�nh � c�a Chu L�")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,3) == 1 then
		Say("Tim ta �ang ��p th�nh th�ch...",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,4) == 1 then
		Talk(7,"","Ta �� truy�n ��t t�nh � cho hai ng��i y�u nhau, mong ��i uy�n ��ng gi� ch�t m�i t�nh n�y!",
				"���c! Ta s� tr�n tr�ng m�i t�nh n�y.",
				"La M�t c�ng t� n�i m�y l�n h�n v�i c� n��ng, sao c� n��ng ��u c� tuy�t v�y?",
				"huhu�",
				"C� n��ng h�y t� t� n�i!",
				"B� Chu Xuy�n n�i, La M�t l� ch�u c�a �o�t m�nh th� sinh, k� th� kh�ng ��i tr�i chung c�a nh� ta. H�n �� ��nh b�i ���ng Thi�n H�o, phu qu�n c�a b� b�, �o�t l�y binh kh� ph� v� v��n l�n h�ng th� hai, ��y ���ng M�n B� V��ng Th��ng xu�ng h�ng th� 3, cho n�n nghi�m c�m ta kh�ng ���c qua l�i v�i La M�t.",
				"Th� ra nh� th�, �� ta v� n�i l�i v�i La M�t.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,5)
			TaskTip("Tr� v� n�i v�i La M�t m�i th� gi�a hai nh�")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY4,5) == 1 then
		Say("B�ng h�u kh�ng ph�i gi�p ta ngh� c�ch �� sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,6) == 1 then
		Talk(5,"","Nghe n�i hai ng��i mu�n t� t� v� t�nh?",
				"��ng th�! L�m ng��i kh�ng vui cho d� c� tr��ng sinh b�t t� c�ng v� d�ng!",
				"Th� n�y �i, �� ta thuy�t ph�c Chu Xuy�n, sau �� c� n��ng giao ��c d��c cho ta.",
				"Xin c� l�y! Nh�ng nh� tr� cho ta nh�!",
				"Y�n t�m! Thu�c ��c n�y ta gi� l�m g�. Th�i �� ta n�i chuy�n v�i Chu Xuy�n.")
		AddItem(2,0,358,1)
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,7)
			TaskTip("C� g�ng thuy�t ph�c Chu Xuy�n")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Say("Hy v�ng thi�u hi�p thuy�t ph�c ���c <color=yellow>Chu Xuy�n<color> b� b�.",0)
	elseif GetTask(TASK_LOVESTORY4) == 8 or GetTask(TASK_LOVESTORY4) == 9 then
		DelItem(2,0,358,1)
		Say("�a t�! Ch�c thi�u hi�p vui v�.",0)
	elseif GetTask(TASK_LOVESTORY4) == 0 or GetTask(TASK_LOVESTORY4) == 1 then
		if GetCash() == 214 then
			Say("Tr�i!",0)
		elseif GetSex() == 1 and GetCash() == 521 then
			Say("Thi�u hi�p c�n ��p trai h�n c� La M�t, xem ra ta v��t qua bao th� k� ��n v�i th� gi�i v� l�m 2 l� �� h�i ng� c�ng thi�u hi�p.",0)
		else
			Say("Ch�ng c�ng y�u ta �?",0)
		end
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