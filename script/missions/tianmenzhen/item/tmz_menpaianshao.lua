--���ɰ���

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("Kh�ng th� s� d�ng v�t ph�m n�y trong b�n ��",0)
		return 0;
	end	
	if GetFightState() == 0 then
		Talk(1,"","Kh�ng th� s� d�ng v�t ph�m trong tr�ng th�i n�y");
		return 0;
	end
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(1345,nFaction);
		Msg2Player("Tri�u g�i 6 qu� t��ng.");
	end 
end

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 6006 then
		return 0;
	else
		return 1;
	end
end