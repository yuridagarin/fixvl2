--=======================================================
--create by baiyun 2009.5.30
--describe:Խ�ϰ�7�·ݻ֮һ׷Ѱ�����գ���ԭ����NPC�ű�
--=======================================================

Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Ho�t ��ng truy t�m tr��ng sinh ph� di�n ra t� 19-06-2009 ��n 24:00 19-07-2009. Trong th�i gian s� ki�n, ��ng ��o c� th� thu th�p B� Ph� C� N�t th�ng qua c�c nhi�m v� sau: S� M�n, Th�i H�, B�t Nh�, H�t Gi�ng, s�n Th� M�p.\n- �� kh�i ph�c B� Ph� C� N�t th�nh Tr��ng Sinh Ph�, ��ng ��o d�ng 10 B� Ph� C� N�t v� 1 Ph�c Nguy�n Thu�t (c� b�n t�i Ng� C�c) ��n NPC Ph�c Nguy�n Ch�n Nh�n ho�c t�i C�m Nang ��i S� Ki�n.\n Khi s� d�ng Tr��ng Sinh Ph�, ��ng ��o c� c� h�i nh�n ���c ��ng Ti�n V�ng, c� t�c d�ng d�ng �� ��i c�c v�t ph�m gi� tr� t�i NPC D� Th�o",
				3,
				"T�i h� mu�n kh�i ph�c B� Ph� C� N�t (nh�n ���c 1 Tr��ng Sinh Ph�)../GetChangshengpu",
				"T�i h� �ang c�n 1 C�m Nang ��i S� Ki�n./GetJinnang",
				"T�i h� ch� gh� ngang!/dialog_over");
	else
		Say("Ho�t ��ng n�y �� k�t th�c!",0)
	end
end

function GetJinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "C�c h� �� c� C�m Nang ��i S� Ki�n r�i, kh�ng th� nh�n th�m ���c n�a!!");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	local nRetCode, nItem = gf_AddItemEx({2, 1, 30045, 1}, "C�m Nang ��i S� Ki�n");
	gf_SetItemExpireTime(nItem, 2009, 7, 20, 0, 0, 0); 
end

function dialog_over()

end