Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local sNpcName = GetNpcName(Launcher);
	local nDeathCamp = BT_GetCamp();
	local nCampPlace = nDeathCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--����������
	if sNpcName == nil then
		sNpcName = "K� th�"
	end;
	local nOldPlayerIndex = PlayerIndex;
	BT_AddBattleActivity(BA_VILL_DEATH);
	if Launcher == -1 then
		return 0;	--��caststate������
	end;
	if KillerIndex == 0 then	--��NPCɱ��
--		if strsub(sNpcName,strlen(sNpcName)-5,strlen(sNpcName))	~= "֪����" then	--������Ǳ�֪����ɱ����
--			Modify_Task_Step(BT_GetCamp(),-3);
--			Talk(1,"","<color=green>"..sNpcName.."<color>������㱾�£�Ҳ����������죬�������Ĺ�������ȥ�ɣ�������");
--		end;
	elseif KillerIndex > 0 then
		--�����ɱ��
		PlayerIndex = KillerIndex;
		local nKillerCamp = BT_GetCamp();
		if nKillerCamp == nDeathCamp then	--���Լ���ɱ��
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		BT_AddBattleEvenPoint(BP_VILLAGE_KILL_PLAYER);
		BT_AddBattleActivity(BA_VILL_KILL_PLAYER);
		BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
		PlayerIndex = nOldPlayerIndex;
		BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	end;
	PlayerIndex = nOldPlayerIndex;
end;