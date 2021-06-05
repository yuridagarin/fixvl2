Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","Ph�o hoa ch� c� th� s� d�ng � khu v�c k�t h�n.");
		return 0;
	end;
	local selTab = {
				"���c/#set_up_fireworks("..nItemIdx..")",
				"�� ta ngh� l�i/nothing",
				}
	Say("B�n mu�n ��t ph�o hoa � ��y kh�ng?",getn(selTab),selTab);

end;

function set_up_fireworks(nItemIdx)
	local nMapID = GetWorldPos();
	local nFieldType = map_field2type[nMapID];
	local nLihuaCount = GetMissionV(27);
	if nLihuaCount >= field_lihua_limit[nFieldType] then
		Talk(1,"","Khu v�c n�y kh�ng th� ��t th�m ph�o hoa!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nNpcIndex = CreateNpc("Ng��i V� h�nh","Ph�o hoa ch�a ��t",GetWorldPos());
		SetNpcLifeTime(nNpcIndex,2*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		SetNpcScript(nNpcIndex,"\\script\\���\\npc\\��.lua")
		SetMissionV(27,nLihuaCount+1)
	end;
end;