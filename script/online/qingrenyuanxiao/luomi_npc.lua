--filename:luomi.lua
--create date:2006-01-21
--author:yanjun
--describe:���ܽű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local selTab = {
				"Ta ��ng �/ok",
				"�� ta suy ngh� l�i/nothing"
				}
	if NoTaskBegin() == 1 then
		Say("4 nhi�m v� n�y c�n ph�i t� ��i, b�n c� ��ng � c�ng l�m v�i ��i h�u kh�ng?",2,selTab)
	else
		ok()
	end
end

function ok()
	if GetTask(TASK_LOVESTORY4) == 0 then
		if GetCash() == 214 then
			Say("�i!...",0)
		elseif GetSex() == 2 and GetCash() == 521 then
			Say("C� n��ng c�n ��p h�n c� Chu L�, xem ra ta v��t qua bao th� k� ��n v�i th� gi�i v� l�m 2 l� �� h�i ng� c�ng n� hi�p.",0)
		else
			Say("N�ng c�ng y�u ta �?",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY4,1) == 1 then
		Talk(5,"","C� chuy�n g� v�y? Sao c�ng t� bu�n b� th�?",
				"D� y�n l�n tr��c ta c� quen v�i <color=yellow>Chu L�<color>, kh�ng bi�t n�ng c� th�ch ta kh�ng? Ta l�i ng�i h�i.",
				"Th� n�y �i, ta s� l�m mai gi�m hai ng��i.",
				"T�t qu�, nh� n� hi�p n�i gi�m: ta ngh� r�ng ch� c� ta kh�ng ng� ���c, kh�ng bi�t Chu L� c� ng� ���c hay kh�ng?",
				"V�y �� ta chuy�n l�i gi�m.")
		local OldPlayerIndex = PlayerIndex 
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("Ti�p nh�n nhi�m v� th�t b�i, xin h�y th� l�i!",0)
			return 0
		end		
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("Chuy�n l�i c�a La M�t cho Chu L� � Bi�n Kinh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,2) == 1 then
		Say("Nh� n� hi�p n�i gi�m: ta ngh� r�ng ch� c� ta kh�ng ng� ���c, kh�ng bi�t Chu L� c� ng� ���c hay kh�ng?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,3) == 1 then
		Talk(6,"","Sao r�i? C� h�i �m ch�a?",
				"�� truy�n ��t r�i, th� ra c� �y c�ng th�ch c�ng t�!",
				"Th� ra nh�n duy�n n�y l� do �ng tr�i s�p ��t!",
				"�ng tr�i �� s�p ��t, v�n ch�a t�t ��p hay sao?",
				"M�y l�n ta h�n n�ng, nh�ng n�ng ��u t� ch�i, t�i sao v�y?",
				"���c r�i, �� ta h�i l�i.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,4)
			TaskTip("G�p Chu L� h�i nguy�n nh�n")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,4) == 1 then
		Say("Nh� c� n��ng h�i gi�m ta, t�i sao m�i l�n h�n, n�ng ��u t� ch�i th�?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,5) == 1 then
		Talk(9,"","Chuy�n l� nh� th� n�y��",
				"Hai b�n h�n nhau nh� th�, n�u thi�n h� n�y ch� c� ta v� n�ng th� t�t bi�t m�y, s� kh�ng ph�i x�u m�t! ",
				"Sao l�i x�u m�t?",
				"Hai b�n l�m r�m ben l�n c�n kh�ng x�u m�t sao? �� ch�ng t� t�nh y�u c�a ta ��i v�i n�ng, ta s� t� t�!",
				"T� t�?",
				"Ta kh�ng ch� mu�n t� t�, m� ta ��nh c�ng ch�t v�i n�ng! ",
				"Th�t l� c�m ��ng! ",
				"Th�i, kh�ng c�n khuy�n ta n�a? Ta �� chu�n b� thu�c ��c, thu�c n�y c�n ��c h�n h�a c�t mi�n ch��ng.",
				"�� ta v� khuy�n Chu L�.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,6)
			TaskTip("Khuy�n Chu L�")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY4,6) == 1 or CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Say("S�ng tr�n ��i kh�ng ���c vui th� ch�t c�n h�n!",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,8) == 1 then
		Talk(2,"","��ng u�ng! Ta �� thuy�t ph�c gia ��nh n�ng ch�p nh�n cho c�ng t� v� Chu L� k�t th�nh v� ch�ng!",
				"Ch�c b�ng h�u vui v�! ��y l� m�n qu� t� l�, xin b�ng h�u ��ng t� ch�i!")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			DelItem(2,0,358,1)
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,9)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY4) == 9 then
		Say("�a t�, ch�c b�ng h�u vui v�.",0)
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
