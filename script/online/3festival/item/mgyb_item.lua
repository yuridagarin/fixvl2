Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_burst_enhance_rate",30,30*18,1,156000);	--ʩչ�ٶ����30%������30��
		Msg2Player("T�c �� xu�t chi�u t�ng 30% trong 30 gi�y");
		Msg2_LeiTai("B�nh Trung Thu Xo�i");
	end;
end;