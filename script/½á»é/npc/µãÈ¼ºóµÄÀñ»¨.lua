function main()
	local sName = GetName();
	if GetMissionS(1) == sName or GetMissionS(2) == sName then
		local selTab = {
					"Ta mu�n h�y n�/put_out",
					"Kh�ng c�n/nothing",
					}
		Say("Ng��i mu�n ��t l� hoa �?",getn(selTab),selTab);
	end;
end;

function put_out()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	SetMissionV(27,GetMissionV(27)-1);
	Msg2Player("B�n �� ��t 1 l� hoa ");
end;

function nothing()

end;