--�ű����ܣ��ؿ������˶Ի�
--������ƣ����ܡ�С����
--���ܿ������������峤
--���ܲ��ԣ�С�ܡ�����
--����ʱ�䣺2011-8-23
--�޸ļ�¼��
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
Include("\\script\\missions\\dragonboat2011\\string.lua")

--����say�Ի�չ��
function DragonBoat_Say(tSayInfo)
	Say(tSayInfo[1],getn(tSayInfo[2]),tSayInfo[2])
end

function nothing()
end

function main()
	Talk(1,"",sNpcNameEntrance.."H�i Chi�n Long Ch�u �ang ���c n�ng c�p, ��i hi�p h�y quay l�i sau !!!")
	return 0
	--DragonBoat_Say(tSTRING_NPC_SAY[1][1])
end

--����ؿ�
function join_mission()
	--print("join_mission() called!")
	--ʱ������
	local nTime = tonumber(date("%H%M"))
	if (not ((tMsOpenTime[1][1] <= nTime and nTime < tMsOpenTime[1][2]) or (tMsOpenTime[2][1] <= nTime and nTime < tMsOpenTime[2][2]) or (tMsOpenTime[3][1] <= nTime and nTime < tMsOpenTime[3][2]))) then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[1])
		return 0
	end
	--����ȼ�����
	local nLevel = GetLevel();
	if nLevel < PLAY_NEED_LV then 
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[2],PLAY_NEED_LV))
		return 0
	end
	--�����ɲŸ���
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[3])
		return 0
	end
	--ѧ��1��55������
	if gf_Check55HaveSkill() == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[4])
		return 0
	end
	--�ϴν����Ƿ���ȡ
	if GetTask(VET_LZZ_PLAYER_RESULT) > 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[5])
		return 0
	end 
	--�Ƿ��ǵ��˱����μ�
	if GetTeamSize() > 1 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[6])
		return 0
	end
	--�۳���������
	if Pay(REGIST_FEES) == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[14])
		return 0
	end
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(2,1,"") == 0 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[11])
		return 0
	end
	--��������ϵ�װ��
	local nRezult = UnEquipAtPosition(10)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[13])
		return 0
	end
	--ȡ������
	nRezult = UnEquipAtPosition(2)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[10])
		return 0
	end
	--print("join_mission() called! again")
	--ȫ�������������
	SetTask(VET_LZZ_PLAYER_TAG,0)
	SetTask(VET_LZZ_PLAYER_TAG2,0)
	SetTask(VET_LZZ_PLAYER_POINT,0)
	SetTask(VET_LZZ_PLAYER_CAMP,0)
	SetTask(VET_LZZ_ENROLL_MAPID,0)
	SetTask(VET_LZZ_DRAGBOAT_KIND,0)
	SetTask(VET_LZZ_MISSION_MAPID,0)
	--�Ŷӻ���
	local nCurMapId = LZZ_GetSuitMap()
	local nCityMapId = GetWorldPos()
	local nMissionMapId
	if nCurMapId ~= 0 then
		--print(MISSIONID,CampSong_ID,nCurMapId)
		local nSong = mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId)
		local nLiao = mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId)
		--print("nSong="..nSong)
		--print("nLiao="..nLiao)
		if mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId) <= mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId) then 
				mf_JoinMission(MISSIONID,CampSong_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "v�o chi�n tr��ng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(1)
				--����Ϊ����ѡ��
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--���״̬
				RemvoeTempEffect()
		else					
				mf_JoinMission(MISSIONID,CampLiao_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "v�o chi�n tr��ng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(2)
				--����Ϊ����ѡ��
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--���״̬
				RemvoeTempEffect()
		end
	else --û�к��ʵģ��¿�һ��
		--print("û�к��ʵģ��¿�һ��")
		local nRoomID,nRoomIdx,nRoomCount = LZZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[11]);
			return 0
		end
		if mf_OpenMission(MISSIONID,nRoomID) == 1 then
			mf_SetMissionV(MISSIONID,MV_LZZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_INDEX,nRoomIdx,nRoomID);					
			mf_JoinMission(MISSIONID,CampSong_ID,nRoomID);
			SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
			--print(GetWorldPos())
			nMissionMapId = GetWorldPos()
			SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
			--print(3)
			--����Ϊ����ѡ��
			SetTask(PLAYER_STATUS,2)
			SetTask(VET_LZZ_PLAYER_1715,2)
			--���״̬
			RemvoeTempEffect()
		end
	end	

end

--�ؿ���Ϣ����
function mision_info()
	DragonBoat_Say(tSTRING_NPC_SAY[1][2])
end

--��ȡ��һ����������ս����
function get_award(nType)
	--����Ƿ�һ������ȡ���鳬����600W
	local nDay = zgc_pub_day_turn()
	if GetTask(VET_LZZ_PLAYER_AWARD_DAY) ~= nDay then
		SetTask(VET_LZZ_PLAYER_AWARD_DAY,nDay)
		SetTask(VET_LZZ_PLAYER_AWARD,0)
	end

	--����Ƿ�μӹ�
	if GetTask(VET_LZZ_PLAYER_RESULT) <=0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[7])
		return 0
	end

	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
        	Talk(1,"","H�nh trang c�c h� kh�ng �� ch� tr�ng �� nh�n th��ng")
		return 0
    	end

	local nNum = GetTask(VET_LZZ_PLAYER_AWARD)
	if nNum >= 6 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[8])
		return 0
	end
	--Check lo�i huy hi�u
	local tbNeedItem = tAwardItemNeed[nType]
	if type(tbNeedItem[1]) == "string" then
		if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
			Talk(1,"","C�c h� kh�ng c� "..tbNeedItem[1].." �� nh�n th��ng.");
			return 0;
		end
	end
	
	local nQCPoint =  tbQuanCong[nType][1]
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 or GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		nQCPoint =  tbQuanCong[nType][2]
	end
	
	if GetTask(701) < 0 then
		nQCPoint = 0 - nQCPoint
	end
		
	if GetTask(VET_LZZ_PLAYER_RESULT) == 1 then 
		if nNum == 5 then
			gf_Modify("Exp",FAIL_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("B�n nh�n ���c ".. tbQuanCong[nType][1].." �i�m qu�n c�ng!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(2,"",sNpcNameEntrance..tSTRING_NPC_TALK[12],sNpcNameEntrance..format(tSTRING_NPC_TALK[9],FAIL_AWARD))
		else
			gf_Modify("Exp",WIN_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("B�n nh�n ���c ".. tbQuanCong[nType][1].." �i�m qu�n c�ng!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+2)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[9],WIN_AWARD))
		end
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end
	--ʧ�ܽ���
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("B�n nh�n ���c "..tbQuanCong[nType][2].." �i�m qu�n c�ng!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[10],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	--ƽ��
	if GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("B�n nh�n ���c "..tbQuanCong[nType][2].." �i�m qu�n c�ng!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[13],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	WriteLogEx(LONGCHAU_LOG_TITLE, "Qu�n c�ng �ua Thuy�n R�ng: "..nQCPoint..", lo�i "..nType)	
end

--����ؿ���������
function mission_condition()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[1]);
end

--����ʱ�����
function mission_open_time()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[2]);
end

--��������ս�������
function mission_rule()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[3]);
end

--��������
function mission_prize()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[4]);
end

function get_award_infor()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "��i hi�p �� l�p ���c c�ng l�n, h�y nh�n ph�n th��ng H�i Chi�n Long Ch�u."
	
	tinsert(tbSayDialog, "- Kh�ng s� d�ng qu�n c�ng ch��ng �� l�nh th��ng/#get_award(0)")
	tinsert(tbSayDialog, "- S� d�ng qu�n c�ng ch��ng �� l�nh th��ng/#get_award(1)")
	tinsert(tbSayDialog, "- S� d�ng huy hi�u chi�n c�ng ��i �� l�nh th��ng/#get_award(2)")	
	tinsert(tbSayDialog, "- S� d�ng huy hi�u chi�n c�ng huy ho�ng �� l�nh th��ng/#get_award(3)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
