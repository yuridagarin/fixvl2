Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[9][2],tMoonCake[9][3],tMoonCake[9][4],1) == 1 then
		CastState("state_move_speed_percent_add",20,30*18,1,178000);	--�ܶ��ٶ����20%������30��
		Msg2Player("T�c �� di chuy�n t�ng 20% trong 30 gi�y");
		Msg2_LeiTai("B�nh Trung Thu S�u Ri�ng Giang S�n");
	end;
end;