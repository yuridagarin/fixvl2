Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_move_speed_percent_add",30,30*18,1,178000);	--�ܶ��ٶ����30%������30��
		Msg2Player("T�c �� ch�y t�ng 30% trong 30 gi�y");
		Msg2_LeiTai("B�nh Trung Thu S�u Ri�ng");
	end;
end;