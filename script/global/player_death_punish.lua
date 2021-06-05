
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\global\\battlefield_callback.lua")

TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

tBattleRank = {
	{"Binh S�",1},
	{"Hi�u U�",2},
	{"�� Th�ng",3},
	{"Ti�n Phong",4},
	{"T��ng Qu�n",5},
	{"Nguy�n So�i",6},
}

function OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
	if Enmity > 0 then
		DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	else
		DoNormalDeath(HitMeNpcIndex, DeathPunish)
	end
end

function DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	
	--��ȡʤ���ܷ�route
	local nOldPIdx = PlayerIndex;
	local nLoseRoute = GetPlayerRoute()--��������
	PlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)--ʹ��PlayerIndex
	local nWinRoute = GetPlayerRoute() --ʤ������
	PlayerIndex = nOldPIdx
	
	--PKʤ��ͳ��
	local nPKStatWinKey = nWinRoute*100+nLoseRoute
	local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
	AddRuntimeStat(15,3,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatLoseKey,1)
end

function DoNormalDeath(HitMeNpcIndex, DeathPunish)
	if DeathPunish > 0 then		-- �������ͷ�
		first_tong_event();
		DoExtraPunish();
		DoHonorPunish();
		local tTitle = 
			{
				[100] = {5},
				[300] = {1},
				[350] = {9},
			}
		local strDeathName = GetName()
		local nRank = GetTask(704)
		local nTitle =0
		for k,v in tTitle do
		 	if IsTitleExist(51, tTitle[k][1] + GetSex() - 1) == 1 then
		 		nTitle = 1
		 		break
		 	end
		 end
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if nRank == 6 or nRank == -6 or nTitle == 1 then
				local nOldIndex = PlayerIndex;
				PlayerIndex = HitMePlayerIndex;
				local strKillName = GetName()
				local nKillRank = GetTask(704)
				local strDeathSongLiao = ""
				local strKillSongLiao = ""
				if nRank > 0 then
					strDeathSongLiao = "T�ng "..tBattleRank[abs(nRank)][1]
				else
					strDeathSongLiao = "Li�u "..tBattleRank[abs(nRank)][1]
				end				
				if nTitle == 1 then
					strDeathSongLiao = "Th�nh Ch�"
				end				
				if nKillRank > 0 then
					strKillSongLiao = "T�ng "..tBattleRank[abs(nKillRank)][1]
				else
					strKillSongLiao = "Li�u "..tBattleRank[abs(nKillRank)][1]
				end
				
				local tMsg = {
					format("Th�t l�i h�i! <color=yellow>%s %s<color> �� ��nh b�i <color=yellow>%s %s<color> tr�ng th��ng, ph�i v� th�nh d��ng s�c.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("Th�t l�i h�i! <color=yellow>%s %s<color> nh�t th�c �o�t m�nh <color=yellow>%s %s<color>, qu� l� cao th� tuy�t ��nh v� l�m.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("Th�t l�i h�i! <color=yellow>%s %s<color> ra tay xu�t qu� nh�p th�n h� g�c <color=yellow>%s %s<color>, ch� k�p n�i Ki�p sau ta s� tr� th�!",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
					format("Th�t l�i h�i! <color=yellow>%s %s<color> �� ��nh b�i <color=yellow>%s %s<color>, oai d�ng v� song.",strKillSongLiao,strKillName,strDeathSongLiao,strDeathName),
				}
				
				local nRand = random(1,getn(tMsg))
				AddGlobalNews(tMsg[nRand])
				PlayerIndex = nOldIndex
			end
	
			if Zgc_pub_week_day() == 0 then --����		
				local nlv = GetLevel();
				if nlv < 60 then  --60�����²�ͳ��
					return
				end 			
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then
					if GetTask(921) ~= nWeek then --�µ�һ������ս��ʼ����ʼ��˫������
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end		
	else
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then	--����
				local nlv = GetLevel();
				if nlv < 60 then  --60�����²�ͳ��
					return
				end 				
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then				
					if GetTask(921) ~= nWeek then --�µ�һ������ս��ʼ����ʼ��˫������
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end
	end
end

function first_tong_event()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
	end;
end


function DoHonorPunish()
	SetRankPoint(5, 701, 1)	-- ˥��������SetRankPoint��ʱ��Ž���,����Ҫ��˥��,�ٿ�
	CalcBattleRank()
	
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	local nCurRank = abs(GetTask(704))
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end

	if nCurRank <= 3 then
		return
	end
	
	local song_or_liao = 1
	local nHonor = GetTask(701)
	if nHonor < 0 then
		nHonor = -nHonor
		song_or_liao = -1
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu�n c�ng c� th� chu�c ng�y h�m qua �� h�y b�.")
	end
	
	if nHonor > 80000 then
		if nCurRank == 4 then
			nHonor = nHonor - 40	--�ȷ�
			SetTask(771,GetTask(771)+40);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+40*song_or_liao);			
			Msg2Player("B�n t� vong t�n th�t 40 �i�m c�ng tr�ng")
		elseif nCurRank == 5 then
			nHonor = nHonor - 80	--��
			SetTask(771,GetTask(771)+80);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+80*song_or_liao);
			Msg2Player("B�n t� vong t�n th�t 80 �i�m c�ng tr�ng")
		elseif nCurRank == 6 then
			nHonor = nHonor - 150	--Ԫ˧
			SetTask(771,GetTask(771)+150);
			SetTask(TSK_JUNGONG_PUNISH,GetTask(TSK_JUNGONG_PUNISH)+150*song_or_liao);			
			Msg2Player("B�n t� vong t�n th�t 150 �i�m c�ng tr�ng")
		end
		if abs(GetTask(TSK_JUNGONG_PUNISH)) > 50000 then
			Msg2Player("Qu�n c�ng c� th� chu�c l�i �� �� 50000, ��t t�i �a.");
			SetTask(771,50000);	--����ۻ���50000�����
			SetTask(TSK_JUNGONG_PUNISH,50000*song_or_liao);
		end;
		nHonor = nHonor * song_or_liao
		SetTask(701, nHonor)
	end
end

--�������ƣ��ܼ����㺯��
--��        �ܣ����ؽ��������ڼ�
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--�����ܵ�����
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;

function DoExtraPunish()
	if GetLevel() >= 73 then
		ModifyReputation(-4, 0)
	end
	return
end