--ʹ�ÿɴ��������޿�����
Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		Talk(1,"","B�n �� n�y kh�ng th� s� d�ng");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 then
			local nMapId, nX, nY = GetWorldPos();
			PlayerIndex = oldPlayerIdx;
			SetPos(nX, nY);
			Msg2Player("Ng��i s� d�ng T� Linh Th� ��a Ph� truy�n t�ng ��n ch� Th�n Th� Khan H� Gi�!");
			break;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetItemUseLapse(nItem, 30*18);
end