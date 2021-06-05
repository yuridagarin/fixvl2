Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\lib\\talktmp.lua")

function main()
	local tSay = {}
	local string1 = "Tranh �o�t tr�n chi�n tr��ng li�n ��u v� c�ng kh�c li�t, n�u kh�ng n�m r� c�c y�u quy�t sau s� kh� l�ng m� gi�nh chi�n th�ng.\n"
	local string2 = format("Chi�n tr��ng th�ng l�i: mu�n nh�n ���c th�ng l�i c�n ph�i nh�n ���c ��y �� �i�m t�ch l�y chi�n tr��ng. �i�m t�ch l�y chi�n tr��ng n�u b�n n�o ��t ��n s� �i�m gi�i h�n tr��c s� gi�nh th�ng l�i. Gi�i h�n �i�m t�ch l�y th�ng qua nh�n s� khi chi�n tr��ng b�t ��u �� quy�t ��nh, nh�n s� c�ng nhi�u th� chi�n tr��ng c�ng k�ch li�t �i�m t�ch l�y y�u c�u s� c�ng nhi�u. �i�m t�ch l�y chi�n tr��ng c� th� th�ng qua ti�u di�t ng��i ch�i ��i ph��ng, binh l�nh ��i ph��ng, t��ng l�nh, �o�t k� �� nh�n ���c. \n");
	local string3 = "Ph�n th��ng chi�n tr��ng: Mu�n nh�n ���c ph�n th��ng t�t sau khi chi�n ��u, c�n ph�i n� l�c gi�nh ���c th�ng l�i. Ph�n th��ng b�n th�ng s� t�t h�n ph�n th��ng b�n thua. Ngo�i ra trong chi�n tr��ng c� th� th�ng qua vi�c ��nh b�i ng��i ch�i ��i ph��ng, binh l�nh, t��ng l�nh, qu�i, �o�t k� v� nhi�u h�nh th�c �� nh�n ���c �i�m n�ng ��ng. �i�m n�ng ��ng c�ng cao th� s� nh�n ���c m�t s� ph�n th��ng v��t m�c. \n"
	local string4 = format("H� tr� tr�n chi�n tr��ng: tr�n chi�n tr��ng c� r�t nhi�u qu�i v�t trung l�p, ��nh b�i ch�ng to�n ��i ��u c� th� nh�n ���c hi�u �ng h� tr� kh� t�t. Tr�n chi�n tr��ng c�n c� %d Boss, ��nh b�i ch�ng kh�ng nh�ng nh�n ���c trang b� si�u m�nh, m� to�n phe ��u c� th� nh�n ���c hi�u �ng h� tr�.\n", 2);
	tSay.msg = "<color=green>Li�u Qu�n Nhu Quan: <color>"..string1..string2..string3..string4;
	tSay.sel = {
		{"Ta bi�t r�i", "nothing"},
	}
	temp_Talk(tSay);
end