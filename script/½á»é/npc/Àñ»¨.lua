
function main()
	local selTab = {
			"��t l�n/light_up",
			"Th�i! L�n sau �i!/nothing",
			}
	Say("Ng��i ��t l� hoa ch�?",getn(selTab),selTab);
end;

function light_up()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Ng��i V� h�nh"," ",nMapID,nMapX,nMapY);
	SetCurrentNpcSFX(nNpcIndex,936,1,1);
	SetNpcLifeTime(nNpcIndex,2*60*60);
	SetNpcScript(nNpcIndex,"\\script\\���\\npc\\��ȼ�����.lua");
end;

function nothing()

end;