--��������ű�
Include("\\script\\battles\\butcher\\head.lua")

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--����ɱNpc��Ŀ�����а�
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --��¼���ɱ������ҵ�����
			serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --��¼��ҵ�ǰ����ն��

--			if (mod(serieskill, 3) == 0) then
--				if (deathcamp == 1) then
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--	
--						Msg2Player("��������նս��"..BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--				else
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--	
--						Msg2Player("��������նս��"..BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--				end
--			end
	
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
				BT_SetData(PL_MAXSERIESKILL, serieskill) -- ͳ����ҵ������ն��
			end
			
			bt_addtotalpoint(1)
			but_addmissionpoint(3)
		
--			if (deathcamp == 1) then
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--			else
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--			end
		
			local rankname = "";
--			if (currank > 0) then
--				rankname = tbRANKNAME[currank]
--				if (deathcamp == 1) then
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 2) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				else
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 1) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				end
--			end
		
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = "T�ng"..LaunName.." �� h� g�c phe Li�u_"..rankname..DeathName.."c�a phe Li�u, t�ng s� PK l�"..BT_GetData(PL_KILLPLAYER);
			else
				str  = "Li�u"..LaunName.." �� h� g�c phe T�ng_"..rankname..DeathName.."c�a phe Li�u, t�ng s� PK l�"..BT_GetData(PL_KILLPLAYER);
			end
		
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	
	if (currank > 0) then
		if (mod(BT_GetData(PL_BEKILLED), 3) == 0) then
			Msg2Player("Tin t�c chi�n d�ch: B�n �� b� gi�ng ch�c!");
			BT_SetData(PL_CURRANK, currank - 1);
			Title_RemoveTitle(currank)
			if (currank > 1) then
				Title_AddTitle(currank - 1, 0, 99999)
			end
			Title_ActiveTitle(currank - 1)
		end
	end

	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end
