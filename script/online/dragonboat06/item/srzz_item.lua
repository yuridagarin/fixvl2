function OnUse()
	if DelItem(2,1,388,1) == 1 then
		CastState("state_move_speed_percent_add",20,5*60*18,1,1001);	--5��������ƶ��ٶ�20%
		Msg2Player("B�n �� �n 1 b�nh �t nh�n th�t, trong v�ng 5 ph�t t�c �� di chuy�n t�ng 20%");
		Msg2_LeiTai("B�nh �t nh�n th�t");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;
