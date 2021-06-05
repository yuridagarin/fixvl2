Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = strsub(sNpcName,1,2);
	if sSubString == "T�ng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: � ��y kh�ng nh�n n�n d�n phe ��ch");
		return 0;
	elseif sSubString == "Li�u" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: � ��y kh�ng nh�n n�n d�n phe ��ch");
		return 0;
	end;
	local selTab = {
				"�� l�m phi�n/give_refugee",
				"�� khi kh�c v�y/nothing",
				}
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Say("<color=green>"..sNpcName.."<color>: "..tSexName[GetSex()].." v�t v� qu�! Giao h�n cho ta l� ���c!",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>: Chi�n tranh th��ng gieo t�i h�a cho b� t�nh v� t�i"..tSexName[GetSex()].."N�u g�p n�n d�n, nh� b�ng h�u d�n h� ��n, ta s� s�p x�p!");
	end;
end;

function give_refugee()
	local nCamp = BT_GetCamp();
	local nPoint = BT_GetBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	SetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1,GetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1)+1)
	KillFollower();
	BT_SetTempData(PTT_FOLLOWER,0);
	BT_EmperorAward(1,1);
	BT_AddPersonalPoint(nPoint,0,1);
	local nPoint = BT_GetBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	Create_Refugee(nCamp,1);	
	Judge_State_By_Point(nCamp);
end;