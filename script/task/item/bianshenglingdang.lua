Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItem)
	if IsHaveTaskOrCanGet2(243, 246) ~= 1 then
		DelItemByIndex(nItem, 1);
		return 0;
	end
	if GetWorldPos() ~= 8010 then
		Say("Kh�ng ���c d�ng � b�n �� n�y!", 0);
		return 0
	end
	if IsNpcChangeModel(PIdx2NpcIdx()) == 1 then
		NpcChangeModel(PIdx2NpcIdx(),"");
		return 0;
	end
	if CanNpcChangeModel(PIdx2NpcIdx()) ~= 1 then
		Say("Tr�ng th�i hi�n t�i kh�ng th� bi�n th�n!", 0);
		return 0;
	end
	NpcChangeModel(PIdx2NpcIdx(),"Th��ng �ng")
end