-- ����ί����

Include("\\script\\task\\weekend\\task_head.lua")

function OnUse(idx)
	local nValue = GetTask(TASK_IB_BOOK2)
	
	if nValue == 1 then
		Say("B�n �� d�ng 1 l�n qu�n d�ng-�y nhi�m th�!", 0)
		return
	end
	
	Say("B�n mu�n d�ng qu�n d�ng-�y nhi�m th�? N� c� th� gi�p b�n gi� l�i �i�m ��nh qu�c an bang c�a ho�t ��ng cu�i tu�n l�n tr��c.", 
		2,
		"S� d�ng /yes_use",
		"Sai/no_say")
end

function yes_use()
	if DelItem(2,1,1030,1) == 1 then
		SetTask(TASK_IB_BOOK2, 1)
		Msg2Player("B�n �� d�ng 1 qu�n d�ng-�y nhi�m th�.")
	end
end

function no_say()

end
