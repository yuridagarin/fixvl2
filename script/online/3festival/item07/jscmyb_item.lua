Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[10][2],tMoonCake[10][3],tMoonCake[10][4],1) == 1 then
		CastState("state_receive_half_damage",30,15*18,1,290000);	--�˺��������30%������15��
		Msg2Player("S�t th��ng gi�m 30% trong 15 gi�y");
		Msg2_LeiTai("B�nh Trung Thu Xo�i Giang S�n");
	end;
end;