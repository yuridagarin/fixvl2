Include("\\script\\online\\olympic\\oly_head.lua")

function OLY_Trigger()
	if oly_IsActivityOpen() ~= 1 then
		RemoveTrigger(GetTrigger(1276*2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 328 then
		return 0;
	end
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	if sName == "Ti�u Lam �ao Qu�" or sName == "Ti�u Lam Xoa Qu�" then
		local nRand = gf_GetRandItemByTable(TRIGGER_TABLE,100,1);
		dostring(TRIGGER_TABLE[nRand][1]);
	end
end

TRIGGER_TABLE = {
	{"DropYellowSH()",10},
	{"YoulingEvent()",2},
	{"CaijiYaorencao()",10},
	{"do_nothing()",78},
}

function DropYellowSH()
	AddItem(2,1,30399,1);
	Msg2Player("C�c h� nh�n ���c Ho�ng S�c Th�nh H�a")
end

function YoulingEvent()
	if gf_GetTaskByte(VET_OLY_TASK3,2) >= 5 then
		return 0;
	end
	if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) ~= 0 then
		return 0;
	end
	local npcIndex = CreateNpc("minghuoguiling","Minh H�a Qu� Linh",GetWorldPos());
	SetNpcDeathScript(npcIndex,"\\script\\online\\olympic\\npc\\minghuoguiling.lua");
	SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,npcIndex);
	SetNpcLifeTime(npcIndex,60 * 5);

end

function CaijiYaorencao()
--	if GetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX) ~= 0 then
--		return 0;
--	end
	local npcIndex = CreateNpc("D��c Nh�n Th�o","U Minh Hoa",GetWorldPos());
	SetNpcDeathScript(npcIndex,"\\script\\online\\olympic\\npc\\youminghua.lua");
--	SetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX,npcIndex);
	SetNpcLifeTime(npcIndex,60 * 5);
end