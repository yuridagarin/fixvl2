Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	Say("Ta l� Ng�n T�m.",0)
	
	if AllTaskComplete() ==1 then
		TaskTip("H�y ��n Nguy�t l�o l�nh th��ng.")
		Msg2Player("Cu�i c�ng �� gi�p Nguy�t l�o t�c h�p cho 4 c�p t�nh nh�n, h�y mau g�p Nguy�t l�o l�nh th��ng.")
	end
end