Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[8][2],tMoonCake[8][3],tMoonCake[8][4],1) == 1 then
		CastState("state_burst_enhance_rate",15,30*18,1,156000);	--ʩչ�ٶ����15%������30��
		Msg2Player("T�c �� thi tri�n t�ng 15% trong 30 gi�y");
		Msg2_LeiTai("B�nh Trung Thu Xo�i Giang S�n");
	end;
end;