--filename:zhuyingtai.lua
--create date:2006-01-21
--author:yanjun
--describe:ףӢ̨�ű�
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
	if GetTask(TASK_LOVESTORY1) == 0 then
		Say("Kh�ng bi�t l�m sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,1) == 1 then
		Talk(5,"","Ph�i l�m sao ��y?",
				"Chuy�n g� l�m c� n��ng bu�n phi�n v�y?",
				"Ta mu�n ra ngo�i �i h�c, n�n ph�i gi� d�ng nam nhi. M�y h�m tr��c ta �� gi�t m�y b� nam trang, gi� kh�ng c� �o m�c, l�i kh�ng ti�n ��n Ti�m Nam ph�c, �ng ch� s� hi�u l�m.",
				"D� th�i, ta s� gi�p c� n��ng mua 1 b� nam trang <color=red>Hi�p Thi�u B� Y<color>, <color=red>Hi�p Thi�u B� Trang<color>, <color=red>Hi�p Thi�u c�n<color>.",
				"Ti�n n� xin �a t�.")
		local OldPlayerIndex = PlayerIndex
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("Ti�p nh�n nhi�m v� th�t b�i, xin h�y th� l�i!",0)
			return 0
		end
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("Mua cho Ch�c Anh ��i 1 b� Hi�p Thi�u B� Y, Hi�p Thi�u B� Trang, Hi�p Thi�u c�n.")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,2) == 1 then
		if GetItemCount(0,100,1) >= 1 and GetItemCount(0,101,1) >= 1 and GetItemCount(0,103,19) >= 1 then
			Talk(5,"","C� n��ng m�c th� 3 m�n �� n�y xem c� v�a ng��i hay kh�ng?",
					"�a t�! L�n n�y ta c� th� gi� nam trang ra ngo�i r�i, nh�ng ti�n n� v�n c�n 1 vi�c mu�n nh�.",
					"C� vi�c g� c� n�i ��ng ng�i, ta s� gi�p cho.",
					"Th�t ra c�ng kh�ng c� g�, nh�ng th�t kh� n�i, ta v� <color=yellow>L��ng S�n B�<color> l�u r�i ch�a g�p, l�i kh�ng ti�n �i xa. Mu�n nh� c�c v� thay ta ��n th�m huynh �y, hi�n �ang � <color=red>D��ng Ch�u<color>.",
					"���c! Ta l�p t�c ��n ��.")
			local OldPlayerIndex = PlayerIndex
			if GetItemCount(0,100,1) >= 1 and GetItemCount(0,101,1) >= 1 and GetItemCount(0,103,19) >= 1 then
				DelItem(0,100,1,1)
				DelItem(0,101,1,1)
				DelItem(0,103,19,1)
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY1,3)
					TaskTip("��n D��ng Ch�u g�p L��ng S�n B�")
				end
			else
				Say("Trang ph�c ��u? B�ng h�u kh�ng g�t ta th�?",0)
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("<color=red>Hi�p Thi�u B� Y<color>, <color=red>Hi�p Thi�u B� Trang<color>, <color=red>Hi�p Thi�u c�n<color> � Ti�m Nam ph�c c� b�n, nh� c�c v� mua gi�p.",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY1,3) == 1 then
		Say("<color=red>L��ng S�n B�<color> �ang � D��ng Ch�u.",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,4) == 1 or CanAcceptTask(TASK_LOVESTORY1,5)== 1 or CanAcceptTask(TASK_LOVESTORY1,6)== 1 then
		Say("Sao ta c�m th�y l�u r�i kh�ng g�p <color=red>L��ng S�n B�<color> v�y?",0)
	elseif CanAcceptTask(TASK_LOVESTORY1,7) == 1 then
		Talk(5,"","C�c v� v� r�i? L��ng S�n B� d�o n�y kh�e kh�ng? C� nh� ta kh�ng?",
				"L��ng S�n B� v�n kh�e, c�n n�i c� r�nh m�i c� n��ng u�ng tr� ng�m th�, nh�ng sao c�ng t� g�i c� n��ng l� Ch�c hi�n �� v�y? L� n�o L��ng huynh v�n ch�a bi�t c� l� n� gi� nam trang sao?",
				"Ch�ng y nh� t��ng g� v�y, u�ng c�ng ta nhi�u l�n ra hi�u. ��ng ti�c ��n g�y tay tr�u, ch� tr�ch L��ng huynh sao ng�c th�!",
				"Th�t kh�ng hi�u hai ng��i n�a, tr�c ti�p n�i th�ng kh�ng ���c sao!",
				"Xin gi�p ta ��a  tr�m n�y cho S�n B�, v� n�i v�i ch�ng: <color=red>m�t b�y, hai t�m, ba s�u, b�n ch�n<color>.")
			if AddItem(2,0,357,1) == 1 then
				local OldPlayerIndex = PlayerIndex
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY1,8)
					TaskTip("��a tr�m c�i t�c v� nh�n cho L��ng S�n B�")
				end
				PlayerIndex = OldPlayerIndex
			end
	elseif CanAcceptTask(TASK_LOVESTORY1,8) == 1 then
		Say("Xin gi�p ta ��a  tr�m n�y cho S�n B�, v� n�i v�i ch�ng: <color=red>m�t b�y, hai t�m, ba s�u, b�n ch�n<color>.",0)
	elseif GetTask(TASK_LOVESTORY1) == 9 then
		Talk(2,"","S�n B� �� hi�u t�m � c�a c�, n�i nh�t ��nh y h�n m� ��n.",
				"�a t�! Ch�c thi�u hi�p vui v�!")
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
