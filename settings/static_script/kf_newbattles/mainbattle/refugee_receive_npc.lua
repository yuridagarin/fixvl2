Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N�n d�n T�ng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: � ��y kh�ng nh�n n�n d�n phe ��ch");
		return 0;
	elseif sSubString == "N�n d�n Li�u" and nCamp ~= LIAO_ID then
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
	SetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1,GetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1)+1)
	KillFollower();
	BT_SetTempData(PTT_FOLLOWER,0);
	BT_SetData(PT_HELP_REFUGEE,BT_GetData(PT_HELP_REFUGEE)+1);
	BT_SetData(PTNC_HELP_REFUGEE,BT_GetData(PTNC_HELP_REFUGEE)+1);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	local nPoint = BT_GetBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	BT_AddMissionPoint(nCamp,nPoint);
	Create_Refugee(nCamp,1);	
	Judge_State_By_Point(nCamp);
end;