--���ź�ҩ ������ҩ�ű�
--ֻ����ͨ��þ�����ڣ�ؿ�����ʹ��

t_allow_use_map={
	[6019] = 1,
	[6020] = 1,
	[6007] = 1,--��ɽ
	[427] = 1,--������
	[1010] = 1,--̫��þ�
	[2010] = 1,--̫��þ�
	[3010] = 1,--̫��þ�
	[4010] = 1,--̫��þ�
	[5010] = 1,--̫��þ�
}
function OnUse(nItemIdx)
	local nMapTemplate = GetMapTemplate(SubWorld)
	if 1 ~= t_allow_use_map[nMapTemplate] then
		Msg2Player("V�t ph�m n�y ch� c� th� s� d�ng trong V�n Ki�m Tr�ng, Th�ng Thi�n Huy�n C�nh, L��ng S�n, ��a Huy�n Cung, Th�i H�");
		return 0;
	end
	return 1;
end;