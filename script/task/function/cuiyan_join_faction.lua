--gtask���ܽű�
--�����������
--taskid 141

function JoinFaction()
	if GetLevel() < 10 then
		Talk(1,"","Ch�a ��t c�p 10, kh�ng th� gia nh�p m�n ph�i.");
		return 0;
	end
	
	if GetPlayerFaction() > 0 then
		Talk(1,"",format("Thi�u hi�p �� gia nh�p v�o m�n ph�i kh�c, kh�ng th� gia nh�p %s r�i.", "Th�y Y�n"));
		return 0;
	end
	
	--����Ů��
	if GetSex() ~= 2 then
		return 0;
	end
	
	--�����������
	SetPlayerFaction(10);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 *3);
	TaskTip(format("C�c h� �� gia nh�p %s, hi�n t�i c� th� t�m s� ph� b�i s� h�c v� r�i!", "Th�y Y�n"));
	Msg2Player(format("C�c h� �� gia nh�p %s, hi�n t�i c� th� t�m s� ph� b�i s� h�c v� r�i!", "Th�y Y�n"));
end

dostring("JoinFaction()");
