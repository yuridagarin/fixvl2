--=============================================
--create by baiyun 2009.7.17
--describe:Խ�ϰ�8�·ݻ���ؼ��ղؼҽű�
--=============================================
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");

function main()
	tbDialog = {
			"��i m�t t�ch (T�i h� c� 1 Linh X� Huy�t + 100 V�ng)/Viet0908_LingSheXie_Miji",
			"K�t th�c ��i tho�i/nothing"
	};
	Say("<color=green>Nh� S�u T�m M�t T�ch: <color>Hi�n t�i ch� ta �ang c� m�y cu�n m�t t�ch v� h�c m�i tr�ng r�t l�. C�c h� c� th� ��i l�y m�t t�ch m�i t�i ch� c�a ta. Nh�ng tr��c ti�n h�y gi�p ta t�m 1 ch�n Linh X� Huy�t v� 10 ��ng Ti�n V�ng r�i ��n g�p ta �� ��i m�t t�ch nh�.", getn(tbDialog), tbDialog);
end

function nothing()
end