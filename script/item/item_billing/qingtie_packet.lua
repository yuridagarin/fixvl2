Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(10,10) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0;
	end;
	local nLeftTime = GetItemParam(nItemIdx,0);
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	if nLeftTime > 2 or nLeftTime < 0 then
		Talk(1,"","S� li�u b�o l�i, xin li�n h� nh� cung c�p!");
		WriteLog("[K�t h�n b�o l�i]:"..GetName().."S� d�ng bao thi�p m�i b�o l�i, nLeftTime:"..nLeftTime);
		return 0;
	end;
	add_invitation(10,task_date,task_para);
	SetItemParam(nItemIdx,0,nLeftTime-1);		
	if nLeftTime == 1 then
		DelItemByIndex(nItemIdx,1);
	else
		Msg2Player("B�n c�n c� th� d�ng"..(nLeftTime-1).." l�n bao thi�p m�i");
	end;
end;