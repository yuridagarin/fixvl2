--filename:qingrenjie_item.lua
--create date:2006-01-19
--author:yanjun
--describe:���˽�ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse()
	local selTab = {}
	selTab[1] = "Xem n�i dung ho�t ��ng./know_detail"
	selTab[2] = "Ta nh�n ���c gi�ng hoa h�ng, s� d�ng nh� th� n�o?/know_useseed"
	selTab[3] = "Ta hi�u r�i!/nothing"
	
	if GetTask(TASK_GOT_QRJ) == 0 then
		Say("D��ng nh� ng��i v�n ch�a tr�c nghi�m ch� s� duy�n ph�n, l�m sao tham gia l� t�nh nh�n ��y?",0)
		return 0
	else
		Say("Ch� s� duy�n ph�n c�a b�n l�: <color=yellow>"..GetTask(TASK_YUANFEN).."<color>.",3,selTab)
	end
end

function know_detail()
	Talk(4,"","Khi ho�t ��ng di�n ra, c�c b�n c� th� ��n g�p Nguy�t l�o tr�c nghi�m ch� s� duy�n ph�n. Sau �� c�p nam n� �� tr�i qua tr�c nghi�m, c� th� gi�p Nguy�t L�o t�c h�p 4 ��i uy�n ��ng.",
				"H�y gi�p Nguy�t L�o t�c h�p 4 ��i t�nh nh�n, sau �� quay v� nh�n th��ng!",
				"��y xem nh� l� 4 nhi�m v� nh�, m�i nhi�m v� m�i ng�y m�i ng��i ch� c� th� l�m 1 l�n. ��ng th�i ��i nam n� v�n trong t� ��i th� m�i ho�n th�nh nhi�m v�, n�u kh�ng th� nhi�m v� h�m �� xem nh� kh�ng ho�n th�nh.",
				"S� kh�c nhau ch� s� duy�n ph�n v� �� th�n thi�n c�a 2 ng��i s� �nh h��ng ��n x�c su�t r�i v�t ph�m nhi�m v�. N�u ch� s� duy�n ph�n t��ng ��ng ho�c �� th�n thi�n l�n h�n 2000 th� x�c su�t r�i v�t ph�m cao nh�t, ng��c l�i s� th�p d�n.")
end

function know_useseed()
	Talk(3,"","Sau khi ho�n th�nh nhi�m v� t�nh y�u, nh�n v�t nam g�p Nguy�t L�o �� nh�n h�t gi�ng hoa h�ng v� l� th�y, ch� c� ng��i nam trong t� ��i m�i c� th� tr�ng h�t gi�ng hoa h�ng, sau khi tr�ng, t�i v� tr� ng��i nam �ang ��ng s� hi�n l�n 1 c�y con mang t�n nh�n v�t n�.",
				"C� 30 ph�t c� th� t��i l� th�y cho c�y con m�t l�n, trong qu� tr�nh t��i n��c 2 ng��i v�n trong t� ��i. N�u nh� trong v�ng 1h, kh�ng t��i n��c, hoa h�ng s� kh� ch�t.",
				"M�i l�n t��i n��c, hoa s� l�n l�n, sau 30 ph�t � tr�ng th�i hoa h�ng, ng��i n� m�i c� th� h�i xu�ng.")
end