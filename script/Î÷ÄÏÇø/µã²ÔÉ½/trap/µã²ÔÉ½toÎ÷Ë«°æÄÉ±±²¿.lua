function main(sel)
	if GetLevel() < 75 then
		Msg2Player("Ph�a tr��c r�t nguy hi�m, ch�a bi�t t�nh h�nh c� th� kh�ng n�n t� ti�n ��n ��!");
		TaskTip("Ph�a tr��c r�t nguy hi�m, ch�a bi�t t�nh h�nh c� th� kh�ng n�n t� ti�n ��n ��!");
		return
	end
	NewWorld(402, 1557 ,2724)
	SetFightState(1);
end;