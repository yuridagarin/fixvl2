--filename:baisuzhen.lua
--create date:2006-01-22
--author:yanjun
--describe:������ű�
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
	if GetTask(TASK_LOVESTORY2) == 0 then
		Say("Sao H�a Ti�n v�n ch�a ��n?",0)	
	elseif CanAcceptTask(TASK_LOVESTORY2,1) == 1 then
		Talk(3,"","B�ch c� n��ng c� chuy�n g� m� bu�n phi�n v�y?",
				"M�y h�m tr��c, ta c� m��n H�a Ti�n 1 c�y d�, h�n H�a Ti�n h�m nay ��n l�y. Sao gi� v�n ch�a th�y ��n!",
				"B�ch c� n��ng ��ng lo l�ng, �� ta h�i H�a Ti�n.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("Ti�p nh�n nhi�m v� th�t b�i, xin h�y th� l�i!",0)
			return 0
		end
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("��n xem H�a Ti�n �ang l�m g�")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,2) == 1 or CanAcceptTask(TASK_LOVESTORY2,3) == 1 or CanAcceptTask(TASK_LOVESTORY2,4) == 1 then
		Say("B�ng h�u v�n ch�a g�p H�a Ti�n �?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,5) == 1 then
		Talk(6,"","B�ch c� n��ng ��ng lo, H�a c�ng t� v� chu�n b� m�t s� l� v�t v� mua H�ng Ho�ng t�u n�n ��n tr�.",
				"H�ng Ho�ng t�u? Sao l� v�t l�i c� H�ng Ho�ng t�u?",
				"B�ch c� n��ng sao kinh ng�c th�?",
				"Kh�ng gi�u g�, ta v�n l� b�ch x� tu luy�n th�nh ng��i. Ch� c�n ng�i m�i r��u th�i c�ng s� hi�n nguy�n h�nh.",
				"Th� n�y �i, �� t�i h� thuy�t ph�c H�a c�ng t� ��i l� v�t kh�c." ,
				"T�t qu���")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,6)
			TaskTip("Tr� v� thuy�t ph�c H�a Ti�n thay H�ng Ho�ng t�u b�ng l� v�t kh�c")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY2,6) == 1 or CanAcceptTask(TASK_LOVESTORY2,7) == 1 then
			Say("B�ng h�u v�n ch�a thuy�t ph�c <color=yellow>H�a Ti�n<color> sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,8) == 1 then
		Talk(4,"","Xin h�i, vi�c �� ti�n tri�n nh� th� n�o r�i?",
				"Y�n t�m. T�i h� �� khuy�n H�a c�ng t� thay H�ng Ho�ng t�u b�ng b�nh l�, m�t l�t n�a c�ng t� s� ��n ngay.",
				"�a t� nh� v�. Ch�c c�c v� vui v�!",
				"Kh�ng c� chi, ch� c�n y�u nhau kh�ng g� c�n tr� ���c.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,9)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
			TaskTip("K�t th�c nhi�m v�")
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY2) == 9 then
		Say("Ch�c nh�ng ��i t�nh nh�n s�m th�nh phu th�.",0)
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