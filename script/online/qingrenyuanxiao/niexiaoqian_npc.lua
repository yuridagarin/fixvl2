--filename:niexiaoqian.lua
--create date:2006-01-21
--author:yanjun
--describe:��Сٻ�ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY3,2) == 1 then
		Talk(5,"","C� n��ng c� ph�i l� Nhi�p Ti�u S�nh kh�ng? Ninh Th�i Th�n �� b�nh an quay v� Th�nh ��, nh� ta ��n h�i th�m. C� n��ng v�n kh�e ch�?",
				"Ta v�n kh�e, L�o L�o kh�ng �� ta b� g� ��u, nh�ng L�o L�o �� d�n cho ta 1 t�m ��nh th�n ph� kh�ng cho b� tr�n.",
				"C� c�ch n�o h�a gi�i kh�ng?",
				"��nh th�n ph� s� nh�t l� m�u ch�, h�y t�m <color=red>3 ch�n H�c Khuy�n Linh Huy�t<color> �� h�a gi�i n�.",
				"Hay qu�! Ta �i ngay ��y!")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY3,3)
			TaskTip("T�m 3 H�c Khuy�n Linh Huy�t cho Nhi�p Ti�u S�nh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY3,3) == 1 then
		if GetItemCount(2,2,33) >= 3 then
			DelItem(2,2,33,3)
			Talk(6,"","Ch�nh l� c�i n�y, c� th� h�a gi�i ��nh th�n ph� r�i. M�c d� kh�ng b� b� bu�c, nh�ng c�ng kh�ng th� ch�y tho�t.",
					"V�y th� h�y �� ta ��nh b�i L�o L�o",
					"Kh�ng th�, Qu� V�c L�o L�o qu� nham hi�m, c�c v� kh�ng ��nh n�i ��u",
					"Ph�i th� m�i bi�t.",
					"Th�i ���c, mu�n ti�u di�t ���c Qu� V�c L�o L�o ph�i c� <color=red>Y�n X�ch H� b�o ki�m<color>, hi�n �ang � ch� Ninh c�ng t�. L�n tr��c Y�n X�ch H� t�ng b�o ki�m cho <color=yellow>Th�i Th�n<color> �� tr� t� ma.",
					"V�y �� ta ��n ch� Ninh Th�i Th�n.")
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY3,4)
				TaskTip("T�m Ninh Th�i Th�n l�y Y�n X�ch H� b�o ki�m.")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("��nh th�n ph� s� nh�t l� m�u ch�, h�y t�m <color=red>3 ch�n H�c Khuy�n Linh Huy�t<color> �� h�a gi�i n�.",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY3,4) == 1 then
		Say("Th�i ���c, mu�n ti�u di�t ���c Qu� V�c L�o L�o ph�i c� <color=red>Y�n X�ch H� b�o ki�m<color>, hi�n �ang � ch� Ninh c�ng t�. L�n tr��c Y�n X�ch H� t�ng b�o ki�m cho <color=yellow>Th�i Th�n<color> �� tr� t� ma.",0)
	elseif CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		Say("B�ng h�u �� l�y ���c Y�n X�ch H� b�o ki�m, n�u nh� ��nh b�i L�o L�o, ta v� Th�i Th�n su�t ��i kh�ng qu�n �n.",0)
	elseif GetTask(TASK_LOVESTORY3) == 6 or GetTask(TASK_LOVESTORY3) == 7 then
		Say("�a t�, ch�c nh� v� vui v�!",0)
	elseif GetTask(TASK_LOVESTORY3) == 0 or GetTask(TASK_LOVESTORY3) == 1 then
		Say("Kh�ng bi�t Th�i Th�n hi�n gi� b�nh an hay kh�ng��",0)
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