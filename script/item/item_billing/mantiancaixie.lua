Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","Ph�o n�y ch� s� d�ng � khu v�c k�t h�n.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(871, 1);
	end;
end;