function OnUse()
	if DelItem(2,1,391,1) == 1 then
		CastState("state_add_strength",50,5*60*18,1,1002);--��������x��
		CastState("state_add_energy",50,5*60*18,1,1003);--�����ڹ�x��
		CastState("state_add_vitality",50,5*60*18,1,1004);--���Ӹ���x��
		CastState("state_add_dexterity",50,5*60*18,1,1005);--������x��
		CastState("state_add_observe",50,5*60*18,1,1006);--���Ӷ���x��
		Msg2Player("B�n �� �n 1 b�nh �t th�p c�m, trong v�ng 5 ph�t t�t c� �i�m c� b�n t�ng 50");
		Msg2_LeiTai("B�nh �t th�p c�m");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;
