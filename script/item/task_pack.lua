-- �����������ͷ�ļ�
Include("\\script\\task\\random\\task_head.lua");

function OnUse()
	-- �����û�������ɾͲ�������
	if GetPlayerFaction()==0 then
		
		Msg2Player("B�n ch�a gia nh�p m�n ph�i, kh�ng th� nh�n nhi�m v� ng�u nhi�n!");
		return
	
	end;
	
	CreateTask();
	RandomTaskTip("B�n nh�n ���c 1 nhi�m v� ng�u nhi�n!");
	
end;
