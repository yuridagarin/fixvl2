--File name:mission_head.lua
--Describe:mission�ű�ͷ�ļ�
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\shinynight_head.lua");
--============================================================================
MISSION_ID = 22;
--=========================Mission Timer======================================
READY_TIMER_ID = 41;
READY_TIME = 30*18;	--�����ȴ�ʱ�䣺���֣����룬�����뱨ʱһ��
READY_TIMER_LOOP = 8;	--����

WAITSTART_TIMER_ID = 42;
WAITSTART_TIME = 5*18;	--�ȴ���ʼʱ�䣺ÿ���뱨ʱһ�Σ���������
WAITSTART_TIMER_LOOP = 5;	--��������

MATCH_TIMER_ID = 43
MATCH_TIME = 30*18;	--����ʱ�䣺ÿ�����뱨ʱһ�Σ���10����
MATCH_TIMER_LOOP = 19;	--����������

WAITSTOP_TIMER_ID = 44;
WAITSTOP_TIME = 10*18;	--������һ����ȴ�ʱ�䣺ÿ�����뱨ʱһ�Σ���������
WAITSTOP_TIMER_LOOP = 5;	--��������

WAITOUT_TIMER_ID = 45;
WAITOUT_TIME = 30*18;	--�����ɼ���ȴ����ͳ�ȥ��ʱ�䣺������
--============================================================================
MAXPLAYER = 8;	--����֧�ֵ���������
LEASTPLAYER = 2; --����֧�ֵ���С�����
--========================MissionValue========================================
MV_ROOMSTATE = 1;	--��¼���䵱ǰ������״̬������ʾ����û����ң�����ʾ���ڱ����׶Σ�����ң�
					--����ʾ������ʼǰ�ĵ���ʱ�׶Σ�����ʾ�����У�����ʾ�����˵�һ��
					--����ʾ��������������ȴ��볡
MV_COMPLETENUM = 2;	--��¼���ߵ�����
MV_TIMELEFT = 3;	--Timer��ʱ����
MV_ENTERORDER = 4; 	--��¼������ʼǰ�ж�����ҽ��������
MV_GAMELOOP = 5 --��¼��Ϸ��ʼʱ��ѭ��֡��
MV_GAMEID = 6 --��¼������ID
--============================================================================
--========================Mission Match State=================================
MS_STATE_IDLE = 0;		--�ȴ���������û����ҽ�����
MS_STATE_WAITSIGNUP = 1;--�ȴ�����������ҽ����ˣ�
MS_STATE_WAITSTART = 2;	--������ֹ���ȴ�������ʼ
MS_STATE_STARTED = 3;	--�����Ѿ���ʼ
MS_STATE_WAITCOMPLETE = 4	--�ȴ������ɱ�����������һ��֮��
MS_STATE_WAITOUT = 5;	--������Ҷ���ɱ������߱�������ʱ���ѵ�
--============================================================================
CAMP_ALL = 0;	--ȫ����Ӫ
CAMP_AUDIENCE = 1;
CAMP_PLAYER = 2;	--��Ҽ����Mission��Ӫ
--============================================================================
LOOPCOUNT = 1;
TRAPCOUNT = 49*LOOPCOUNT;	--TRAP����Ŀ��һȦ��49��
--============================================================================
BonusTab = {
		[1] = {1},
		[2] = {1,0},
		[3] = {2,1,0},
		[4] = {2,1,1,0},
		[5] = {3,2,1,0,0},
		[6] = {3,2,1,1,0,0},
		[7] = {4,3,2,1,1,0,0},
		[8] = {5,4,3,2,1,1,0,0},
		}
--============================================================================
--��ҽ����������ʱ��Ҫ�������²���
function Set_Player_State()
	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
	SetCreateTeam(1);	--�ر��齨����(���ߺ�ᱻ���)
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	SetPKFlag(0,0);	--����Ϊ����״̬
	RemoveRevivals();	--ɾ����������
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	RemvoeTempEffect();	--���������ʱ״̬������ˮ���Σ����ҵ�
	CastState("state_ignore_poison_damage",100,15*60*18,1,2000);
	SetTask(STATUS,CAMP_PLAYER);--�������Ϊ����ѡ��
	SetTask(FINISHTIME,999999999);
	SetDeathScript("\\script\\online\\dragonboat06\\playerdeath.lua");	
end;
--����뿪��������ʱ��Ҫ�������²���
function Restore_Player_State()
	SetLogoutRV(0);	--���õ�½��Ϊ���ߵ�
	SetDeathPunish(1);	--�������ͷ�
	SetCreateTeam(0);	--���Դ�������
	ForbitTrade(0);	--������
	InteractiveEnable(1);	--���Խ��н���
	StallEnable(1);	--�����̯
	UseScrollEnable(1);	--����ʹ�ûسǷ�
	SetFightState(0);	--����Ϊ��ƽ״̬
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(0,0);	--����PKΪ����״̬
	--�����������������
	SetTask(STATUS,0);
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--���һ��
	SetTask(ENTERORDER,0);
	SetTask(FLAG_COLOR,0);
	SetTask(FINISHTIME,999999999);	--����һ��������ʾû��ʱ��
	RemvoeTempEffect();	--���������ʱ״̬������ˮ���Σ����ҵ�
	for i=FLAG_BEGIN,FLAG_END do	--��������������ӵļ�¼
		SetTask(i,0);
	end;
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnIBBoat = 0;
	if nGenre == 0 and nDetail ==105 then	--�ж��ǲ�����IB����
		for i=26,31 do
			if nParticular ~= 29 and nParticular == i then
				bOnIBBoat = 1;	--��
				break;
			end;
		end;
	end;
	if bOnIBBoat == 1 then	--�����IB���۾�ɾ����
		local nItemIdx = GetPlayerEquipIndex(10);
		local nState = GetMissionV(MV_ROOMSTATE);
		--����״̬�ſ�����
		if nState == MS_STATE_STARTED or nState == MS_STATE_WAITCOMPLETE or nState == MS_STATE_WAITOUT then
			DelItemByIndex(nItemIdx,-1)
		end;
	end;
	local RetCode = UnEquipAtPosition(10);
	if RetCode == 0 then
		Write_Log("L�i l�y trang b�",GetName().."UnEquipAtPosition tr� h�m s� quay l�i 0");
	elseif RetCode == 2 then
		Msg2Player("Do khi r�i kh�i tr��ng ��u h�nh trang b�n kh�ng c�n kho�ng tr�ng ho�c v�c qu� n�ng, thuy�n R�ng c�a b�n ��nh ph�i b� xu�ng ��t.")
	end;
	for i=854,859 do
		if HaveLearnedSkill(i) == 1 then
			RemoveSkill(i);
		end
	end;
	CastState("state_ignore_poison_damage",0,15*60*18,1,2000);
	SetDeathScript("");
end;
--�����η���
function Give_Award()
	local rankTab = Get_Rank();
	local nDate = tonumber(date("%y%m%d"));
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);

	-- �Ի�֮ҹ���ַ����ı���
	local multiple = get_reward_multiple(SYS_DRAGONBOAT)
	if Get_Multiple_Status() == 1 then
		multiple = multiple*MULTIPLE;	--�౶������������ԻԻ�֮ҹ�ı��ʾ�����
	end;
	for i=1,getn(rankTab) do
		PlayerIndex = rankTab[i];
		if PlayerIndex > 0 then
			SetTask(ATTENDCOUNT,GetTask(ATTENDCOUNT)+1);	--��¼�ý��Ĵ���
			SetTask(ATTENDCOUNTPERDAY1,GetTask(ATTENDCOUNTPERDAY1)+1);	--�����ý�����
			-- ʦͽ�������ۣ�
			local nChance, nMaxChance = CustomDataRead("mp_longzhou")
			if nChance ~= nil then
				nChance = nChance + 1
				if nChance < nMaxChance then
					CustomDataSave("mp_longzhou", "dd", nChance, nMaxChance)
					Msg2Player("Nhi�m v� S� ��-Thuy�n r�ng ho�n th�nh nhi�m v�:"..nChance.."/"..nMaxChance)
				else
					PrenticeCompleteTask()
				end
			end
			SetTask(ATTENDCOUNTPERDAY2,nDate);	--��¼����
			-- �Ի�֮ҹ���ַ���
			local score = BonusTab[nPlayerCount][i] * multiple
			SetTask(BONUSPOINT,GetTask(BONUSPOINT)+score);	--��������
			Write_Log("Ho�t ��ng t�t �oan Ng�"," "..GetAccount().."\t"..GetName().."\t".."obtain "..score.." score.");
		else
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","mission_head.lua,Give_Award() h�m s� rankTab ng��i ch�i nh� h�n ho�c b�ng 0");
		end;
	end;
end;
--�����ź��������飬����Ԫ��Ϊ�������
function Get_Rank()
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);	
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_PLAYER);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	if TotalPlayerCount ~= getn(IDTab) then
		Write_Log("Ho�t ��ng �oan Ng� sai s�t","trong h�m s� Get_Rank, l�i khi li�t ra t�t c� ng��i ch�i.");
	end;
	local SortedTab = Sort_By_Rank(IDTab);
	if TotalPlayerCount ~= getn(SortedTab) then
		Write_Log("Ho�t ��ng �oan Ng� sai s�t","Get_Rank trong h�m s� Sort_By_Rank ng��i ch�i c� h�m s� quay l�i table b�o l�i.");
	end;
	return SortedTab;
end;
--����ҵ�����������Ϊ�������������һ���Ĺ���������
--����Ϊ���Ȱ������յ���Ⱥ��������û���յ�ľͼ��㵱ǰλ�ã����λ����ͬ�������֣�
--�����ٵ���ǰ�棬�������Ҳ��ͬ�������Ⱥ�����
function Sort_By_Rank(TempTab)
	local tempIndex;
	local OldPlayerIndex = PlayerIndex;
	for i=1,getn(TempTab)-1 do
		local bXChanged = 0; 
		for i=1,getn(TempTab)-1 do
			local nTime1,nTime2 = 0,0;
			PlayerIndex = TempTab[i];
			nTime1 = GetTask(FINISHTIME);
			PlayerIndex = TempTab[i+1];
			nTime2 = GetTask(FINISHTIME);
			if nTime1 > nTime2 then	--���ʱ��1��ʱ��2��Ļ����ͽ���
				tempIndex = TempTab[i+1];
				TempTab[i+1] = TempTab[i];
				TempTab[i] = tempIndex;
				bXChanged = 1;			
			elseif nTime1 == nTime2 then
				local nPos1,nPos2 = 0,0;
				PlayerIndex = TempTab[i];
				nPos1 = GetTask(POSITION);
				PlayerIndex = TempTab[i+1];
				nPos2 = GetTask(POSITION);
				if nPos1 < nPos2 then	--���λ��1��λ��2С�Ļ����ͽ���
					tempIndex = TempTab[i+1];
					TempTab[i+1] = TempTab[i];
					TempTab[i] = tempIndex;
					bXChanged = 1;	
				elseif nPos1 == nPos2 then
					local nBonus1,nBonus2 = 0,0;
					PlayerIndex = TempTab[i];
					nBonus1 = GetTask(BONUSPOINT);
					PlayerIndex = TempTab[i+1];
					nBonus2 = GetTask(BONUSPOINT);
					if nBonus1 > nBonus2 then	--�������1�Ȼ���2��Ļ����ͽ���
						tempIndex = TempTab[i+1];
						TempTab[i+1] = TempTab[i];
						TempTab[i] = tempIndex;
						bXChanged = 1;						
					elseif nBonus1 == nBonus2 then
						local nEnter1,nEnter2 = 0,0;
						PlayerIndex = TempTab[i];
						nEnter1 = GetTask(ENTERORDER);
						PlayerIndex = TempTab[i+1];
						nEnter2 = GetTask(ENTERORDER);
						if nEnter1 > nEnter2 then	--������볡�ص����1�����2��Ļ����ͽ���
							tempIndex = TempTab[i+1];
							TempTab[i+1] = TempTab[i];
							TempTab[i] = tempIndex;
							bXChanged = 1;							
						end;						
					end;
				end;
			end;
		end;
		if bXChanged == 0 then
			break;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	return TempTab;
end;
--��ʾ����
function Report_Result(RankTab)
	local sContent = "X�p h�ng cu�i c�ng: <enter>";
	local OldPlayerIndex = PlayerIndex;
	local nPlayerCount = getn(RankTab);
	local nPlayerScored = nPlayerCount;
	local FinishTime = 0;
	local nMin = 0;
	local nSec = 0;
	local sResult = "";
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= nPlayerCount then
		Write_Log("Ho�t ��ng �oan Ng� sai s�t","Trong h�m s� Report_Result, tham s� RankTab nh�p v�o v� s� tuy�n th� trong Mission kh�ng ph� h�p");
	end;
	if nPlayerCount > 6 then 
		nPlayerScored = 6 
	end;
	for i=1,nPlayerScored do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			FinishTime = GetTask(FINISHTIME);
			if FinishTime == 999999999 then
				sResult = "Thi ��u ch�a k�t th�c";
			else
				FinishTime = FinishTime/18;
				nMin = floor(FinishTime/60);
				nSec = format("%.2f",FinishTime - nMin*60);	--С�������λ�͹���
				sResult = ""..nMin.." Ph�t "..nSec.." Gi�y "
			end;
			if nPlayerCount > 0 and nPlayerCount <= MAXPLAYER then		
				local multiple = get_reward_multiple(SYS_DRAGONBOAT)
				if Get_Multiple_Status() == 1 then
					multiple = multiple*MULTIPLE;	--�౶������������ԻԻ�֮ҹ�ı��ʾ�����
				end;
				local score = BonusTab[nPlayerCount][i] * multiple
				sContent = sContent.."h�ng "..NumTab[i]..":<color=yellow> "..strsub(GetName(),1,10).." <color>th�i gian<color=red> "..sResult.." <color>�i�m t�ch l�y<color=yellow> "..score.."<color><enter>";
				Msg2MSAll(MISSION_ID,"h�ng "..NumTab[i].." Danh:"..GetName().." th�i gian s� d�ng:"..sResult);
			else
				Write_Log("Ho�t ��ng �oan Ng� sai s�t","Trong h�m s� Report_Result, bi�n l��ng nPlayerCount sai");
			end;
		else
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","Nh�n t� ng��i ch�i trong mission_head.lua,Report_Result(), RankTab l�n h�n ho�c = 0");
		end;
	end;
	for i=1,getn(RankTab) do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			SetTask(RANK,i);
			Talk(1,"",sContent);
		else
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","Nh�n t� ng��i ch�i trong mission_head.lua,Report_Result(), RankTab l�n h�n ho�c = 0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ��һ�����������OP_AllMSPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function OP_AllMSPlayer(func,tArg,Camp)
	local OldPlayerIndex = PlayerIndex;
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,Camp);	--����Ӫ��ʾ������Ӫ�����
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,Camp);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			func(tArg);
		else
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","Nh�n t� ng��i ch�i trong mission_head.lua,OP_AllMSPlayer(), IDTab l�n h�n ho�c =0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--�������εõ��������
function Get_Player_By_Rank(nRank)
	local RankTab = Get_Rank();
	if nRank > getn(RankTab) or nRank <= 0 then
		if nRank ~= 0 then
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","Trong h�m s� Get_Player_By_Rank, tham s� nh�p v�o kh�ng ��ng, tr� s� l�:"..nRank);
		end;
		return 0;
	end;
	return RankTab[nRank];
end;
--�õ��Լ���ǰ������
function Get_Self_Rank()
	local RankTab = Get_Rank();
	for i=1,getn(RankTab) do
		if PlayerIndex == RankTab[i] then
			return i;
		end;
	end;
	Write_Log("Ho�t ��ng �oan Ng� sai s�t","Trong h�m s� Get_Self_Rank kh�ng t�m th�y h��ng d�n ng��i ch�i ch�nh x�c");
	return 0;	--����
end;