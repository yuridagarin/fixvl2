--filename:zhuqian_npc.lua
--create date:2006-01-22
--author:yanjun
--describe:���x�ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Talk(5,"","Xin h�i ��i n��ng c� ph�i l� Chu Xuy�n? Chu L� v� La M�t y�u nhau, ��i n��ng bi�t kh�ng?",
				"Ta bi�t ch�! Nh�ng hai gia ��nh l� k� th� kh�ng ��i tr�i chung, ch�ng kh�ng th� n�o y�u nhau!",
				"��i n��ng bi�t kh�ng, nh�n duy�n ��i tr� l� do �ng tr�i s�p ��t, Nguy�t l�o se duy�n! Hi�m kh�ch c�a ��i tr��c, h� t�t �� ��i sau g�nh ch�u? Ngay c� thu�c ��c h� c�ng �� chu�n b�. Xin ��i n��ng ��ng chia loan r� ph�ng.",
				"Th�i ���c! Ta hy v�ng m�i t�nh n�y c� th� h�a gi�i �n o�n hai nh�.",
				"Nh� th� l� ��i n��ng �� ��ng �? Ta s� mang tin m�ng n�y v� b�o cho g� si t�nh La M�t.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,8)
			TaskTip("B�o tin m�ng cho La M�t")
		end
		PlayerIndex = OldPlayerIndex
	else
		if GetCash() == 928 then
			Say("Nh�n l� t�nh nh�n, ch�c m�i ng��i vui v�, ch�c nh�ng ��i t�nh nh�n s�m th�nh phu th�.",0)
		else
			Say("Ng��i l� ai v�y?",0)
		end
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H�y ��n Nguy�t l�o l�nh th��ng.")
		Msg2Player("Cu�i c�ng �� gi�p Nguy�t l�o t�c h�p cho 4 c�p t�nh nh�n, h�y mau g�p Nguy�t l�o l�nh th��ng.")
	end
end
