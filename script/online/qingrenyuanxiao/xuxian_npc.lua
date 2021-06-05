--filename:xuxian.lua
--create date:2006-01-22
--author:yanjun
--describe:���ɽű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY2,2) == 1 then
		Talk(5,"","Th�t phi�n qu�!",
				"H�a c�ng t�, B�ch T� Trinh nh� ta h�i c�ng t� h�m nay c� r�nh ��n nh� l�y d� ���c kh�ng?",
				"Ta v� vi�c n�y m� bu�n phi�n, mu�n chu�n b� 1 s� l� v�t nh�ng l�i thi�u <color=red>H�ng Ho�ng t�u<color>.",
				"��u kh�, �� ta ��n t�u l�u ch�c ch�n s� c�.",
				"V�y phi�n nh� v� qu�.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,3)
			TaskTip("��n t�u l�u mua cho H�a Ti�n 1 b�nh H�ng Ho�ng t�u")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		Say("B�ng h�u kh�ng ph�i gi�p ta mua r��u sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,4) == 1 then
		Talk(4,"","C� th� mua ���c H�ng Ho�ng t�u kh�ng?",
				"H�a c�ng t� ��ng lo l�ng, s� mua ���c m�.",
				"Th�t l� t�t qu�, l� ph�m c� b�n �� ��y ��, �� ta chu�n b� 1 ch�t s� ��n B�ch ph�.",
				"V�y �� ta v� n�i l�i v�i B�ch c� n��ng.")
		DelItem(2,0,359,1)
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,5)
			TaskTip("Th�ng b�o cho B�ch T� Trinh tin t�c c�a H�a Ti�n")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,5) == 1 then
		Say("C�c v� v�n ch�a g�p B�ch c� n��ng sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,6) == 1 then
		Talk(6,"","C�ng t� �� chu�n b� mang s� l� ph�m ��n B�ch c� n��ng ch�a?",
				"�, ta �ang chu�n b� mang �i, sao th�?",
				"Ta ���c bi�t B�ch T� Trinh kh�ng bi�t u�ng r��u, c�ng t� mang H�ng Ho�ng t�u ch� th�m m�t h�ng, hay l� thay th� kh�c �i.",
				"�a t� B�ng h�u �� nh�c nh�, n�u kh�ng th� h�ng vi�c, nh�ng kh�ng bi�t n�n mang g� theo?",
				"Th� n�y �i, <color=red>D��ng Trung ��ng t�ng 2<color> c� m�t s� <color=red>b�nh l�<color> m�i v� r�t ngon, th�ch h�p l�m qu� t�ng. Ta s� mang v� 12 c�i cho c�ng t�.",
				"Xin �a t� c�c v�.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,7)
			CreateTrigger(0,1203,3111)
			TaskTip("��n D��ng Trung ��ng t�ng 2 thu th�p 12 b�nh l� cho H�a Ti�n")
		end
		PlayerIndex = OldPlayerIndex			
	elseif CanAcceptTask(TASK_LOVESTORY2,7) == 1 then
		if GetItemCount(2,0,360) >= 12 then
			DelItem(2,0,360,12)
			Talk(4,"","��y l� b�nh l�, c�ng t� h�y g�i l�i mang t�ng B�ch c� n��ng.",
					"�a t� nh� v�.",
					"Ta ph�i tr� v� th�ng b�o cho B�ch c� n��ng.",
					"���c! �� ta chu�n b� ng�a r�i s� �i li�n.")
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				RemoveTrigger(GetTrigger(3111))
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY2,8)
				TaskTip("V� b�o tin cho B�ch T� Trinh")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("C�c v� kh�ng ph�i n�i � <color=red>D��ng Trung ��ng t�ng 2<color> c� m�t s� <color=red>b�nh l�<color> m�i v� r�t ngon, th�ch h�p l�m qu� t�ng, mu�n gi�p ta t�m 12 c�i �� sao?",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY2,8) == 1 then
		Say("C�c v� v�n ch�a g�p B�ch c� n��ng sao?",0)
	elseif GetTask(TASK_LOVESTORY2) == 9 then
		Say("Ch�c ��i t�nh nh�n s�m th�nh phu th�.",0)
	elseif GetTask(TASK_LOVESTORY2) == 0 or GetTask(TASK_LOVESTORY2) == 1 then
		Say("N�n t�ng th� g�?",0)
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