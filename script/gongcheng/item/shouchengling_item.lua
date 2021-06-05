--create date:07-04-19
--author:yanjun
--describe:�س�����Ʒ�ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch� trong khu v�c C�ng th�nh chi�n m�i c� th� s� d�ng Th� V� l�nh.");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","Hi�n ch�a ph�i th�i gian nh�n ch�c Th� v�. Ch� trong giai �o�n chu�n b� m�i c� th� nh�n ch�c Th� v�");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= SHOU_ID then
		Talk(1,"","Ch� c� phe th� m�i c� th� s� d�ng Th� V� l�nh.");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","B�n �� l� Th� v� c�a "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format(" tr� th�nh "..tDoorName[1].."Th� v�/#use(%d,%d)",nItemIdx,1),
				format(" tr� th�nh "..tDoorName[2].."Th� v�/#use(%d,%d)",nItemIdx,2),
				format(" tr� th�nh "..tDoorName[3].."Th� v�/#use(%d,%d)",nItemIdx,3),
				"H�y b�/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say(gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szSEGuardName,20).."\n"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szSSGuardName,20).."\n"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szSWGuardName,20).."\n\nC�c th�nh tr�n ��y, c�c h� mu�n th�nh Th� v� c�a th�nh n�o?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch� trong khu v�c C�ng th�nh chi�n m�i c� th� s� d�ng Th� V� l�nh.");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","Hi�n ch�a ph�i th�i gian nh�n ch�c Th� v�. Ch� trong giai �o�n chu�n b� m�i c� th� nh�n ch�c Th� v�");
		return 0;
	end;
	local szGuardName = GCZ_GetGuardName(SHOU_ID,nDoorIdx);
	if szGuardName ~= "Ch�a" then
		Talk(1,"","Th�nh m�n n�y �� s�p x�p Th� v�. Xin h�y ch�n th�nh m�n kh�c!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),PlayerIndex);
		SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
		GCZ_Msg2Camp(GetName().."S� d�ng Th� Th�nh l�nh tr� th�nh "..tDoorName[nDoorIdx].."Th� v�",SHOU_ID);		
		Talk(1,"","B�n �� tr� th�nh Th� v� c�a <color=yellow>"..tDoorName[nDoorIdx].."<color>. Tr�ng tr�ch r�t n�ng n�!");
	end;
end;