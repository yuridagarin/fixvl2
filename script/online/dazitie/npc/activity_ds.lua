Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\lib\\talktmp.lua")

DZT_NPC = "<color=green>��i S� ho�t ��ng<color>:"

DZT_TITLE = "Trung Thu �� qua, ch� vi�t c�a Gia C�t K� t�ng cho t�i h� �� b� ��nh c�p, khi�n t�i h� r�t �au l�ng, v� n�o c� th� gi�p t�m l�i, t�i h� xin tr�ng th��ng h�u h�nh!"

DZT_DIALOG_TABLE = {
	"Gi�i thi�u ho�t ��ng/dzt_introduce",
	"Li�n quan ph�n th��ng ho�t ��ng/dzt_award",
	"T�i h� �� t�m l�i ch� vi�t 'Hoa H�o Nguy�t Vi�n'/dzt_find_hhyy",
	"T�i h� �� t�m l�i ch� vi�t 'Ph� Thi�n ��ng Kh�nh'/dzt_find_pttq",
}

function dzt_introduce()
	local strTitle = "Ho�t ��ng ��i t�c chi�n truy t�m ch� vi�t l�n n�y, ch� d�nh cho ng��i ch�i c�p 80 tr� l�n h�c ���c k� n�ng c�p 55. Ch� vi�t g�m [Hoa],[H�o],[Nguy�t],[Vi�n],[Ph� Thi�n ��ng Kh�nh], trong 5 lo�i n�y, b� ph�n ch� vi�t b� ��o t�c  c�t gi� trong L��ng S�n, V�n Ki�m Tr�ng, Th�ng Thi�n Huy�n C�nh, Chi�n tr��ng Thi�n M�n Tr�n, ph� b�n kh�c nhau th� x�c su�t sinh ra ch� vi�t c�ng kh�c nhau.\nNh�ng ��o t�c ��nh c�p ch� vi�t �n h�nh trong Nh� Long S�n, t� 10 gi� s�ng ��n 2 gi� t�i m�i ng�y, c� 1 gi� s� di�n ra ho�t ��ng vay b�t ��o t�c ��nh c�p ch� , ��nh b�i ch�ng kh�ng nh�ng c� th� l�y l�i ch� m� c�n nh�n ���c ph�n th��ng th�m. [Ph� Thi�n ��ng Kh�nh] ngo�i vi�c r�i ra t� c�c �i, ��o t�c ch� vi�t, c�n c� th� th�ng qua [B�t Long](b�n � Ng� C�c) ho�c d�ng v�ng vi�t ch� [Hoa],[H�o],[Nguy�t].[Vi�n] th�nh [Ph� Thi�n ��ng Kh�nh]";
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_award()
	local strTitle = "Ph�n th��ng cu�i c�ng c�a ho�t ��ng n�y l� Thi�n Cang L�nh, Thi�n M�n Kim L�nh. \n N�p[Hoa], [H�o], [Nguy�t], [Vi�n]: Trong th�i gian ho�t ��ng di�n ra m�i nh�n v�t c� th� n�p 200 l�n; \n N�p [Ph� Thi�n ��ng Kh�nh]: Kh�ng gi�i h�n s� l�n n�p, ngo�i ph�n th��ng n�p h�ng ng�y, c�n nh�n ���c:\n  N�p �� 50 l�n, nh�n ���c Ma �ao Th�ch c�p 1; �� 100 l�n nh�n ���c Ma �ao Th�ch c�p 2; \n   �� 200 l�n nh�n ���c Linh Th�ch c�p 7; �� 400 l�n nh�n ���c c��ng h�a quy�n 13; \n   �� 800 l�n nh�n ���c m�nh B�ch Kim; 1200 l�n nh�n ���c c��ng h�a quy�n 14; \n �� 1600 l�n nh�n ���c Thi�n Cang L�nh; \n   N�p 2200 l�n nh�n ���c Thi�n M�n Kim L�nh, s� l�n n�p thi�t l�p v� 0 c� th� n�p l�i t� ��u.";
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_find_hhyy()
	if dzt_check_condition() ~= 1 then
		return 0;
	end
	local strTitle = "Ph�n th��ng n�y c�n ph�i n�p [Hoa], [H�o],[Nguy�t], [Vi�n] m�i th� %d c�i, trong su�t ho�t ��ng c� th� nh�n %d l�n, hi�n t�i c�c h� �� nh�n %d l�n.";
	strTitle = format(strTitle, 1, DZT_HHYY_MAX, DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.HHYY));
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n Nh�n ph�n th��ng","dzt_get_award_hhyy"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_find_pttq()
	if dzt_check_condition() ~= 1 then
		return 0;
	end
	local strTitle = "Ph�n th��ng n�y c�n ph�i n�p [Ph� Thi�n ��ng Kh�nh]%d c�i, n�p m�i l�n nh�n ���c %d l�n n�p, khi n�p �� %d,  %d, %d, %d, %d,  %d, %d, %d nh�n ���c th�m ph�n th��ng. Sau khi nh�n ph�n th��ng l�n %d, s� l�n n�p s� thi�t l�p v� 0, c�c h� c� th� n�p th�m �� nh�n th�m ph�n th��ng, c�c h� �� n�p %d l�n, n�p th�m %d l�n th� c� th� nh�n ph�n th��ng: %s";
	local nNum = DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ);
	local nCount = 0;
	local nTempTb = {50, 100, 200, 400, 800, 1200, 1600, 2200};
	for i = 1, getn(nTempTb) do 
		if nNum < nTempTb[i]then
			nCount = nTempTb[i];
			break;
		end
	end	
	strTitle = format(strTitle, 1, 1, 50, 100, 200, 400, 800, 1200, 1600, 2200, 2200, nNum, nCount - nNum, DZT_SPECIAL_AWARD_TB[nCount][2]);
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n Nh�n ph�n th��ng","dzt_get_award_pttq"},
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end



