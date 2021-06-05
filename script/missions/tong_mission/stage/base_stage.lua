--create date:2007-07-10 
--author:yanjun
--describe:���ؿ������ࡱ����ʱֻ֧��ʹ��Mission�����Ĺؿ���
--��Mission���ָ��ŵ����������֧�ָ��㷺�Ĺؿ�
HUGE_NUMBER = 9999999999;	--һ������
LEFT_REGION = -1;	--�������
MID_REGION = 0;	--�м�����
RIGHT_REGION = 1;	--�ұ�����

function OO_Inherit(base)	--����һ���̳к���
	local derive = {};
	local foo = function(t,i)	--����"index"����
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	return derive;
end;

CBASE_STAGE = 
{
--======��������============================================================================
	nStage = 0,	--��ǰ�ؿ�
	tbTimerEven = {},	--ʱ����¼�table
	tbBossInfo = {},	--boss��Ϣ
--======������Ϊ============================================================================
	--��ʼ���ؿ�
	InitStage = function(self)
		SetMissionV(MV_STAGE,self.nStage);
		SetMissionV(MV_TIMER_LOOP,0);
		SetMissionV(MV_STAGE_OVER,0);
		SetMissionV(MV_CHECK_POINT,-1);	--��Ч����
		SetMissionV(MV_BOSS1,0);
		SetMissionV(MV_BOSS2,0);
		SetMissionV(MV_NPC_COUNT,0);
		SetMissionV(MV_FAC_NPC_COUNT,0);
		SetMissionV(MV_BOSS_COUNT,0);
		SetMissionV(MV_KILL_SUB_NPC,0);
		SetMissionV(MV_STAGE_STARTED,1);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_SECOND);	--��ʼһ���µļ�ʱ��
		TM_StopTimeGuage(-2);
		self:OnCreateBoss();
		TM_CreateSubNpc(SUB_NPC_COUNT);
		TM_StartTimeGuage("T�ng th�i gian  ",30*60,0,0);
	end,
	--ִ��ʱ����¼���nStartSec��ʾ�ӹؿ���ʼ�����һ�뿪ʼִ��,nIntervalSec��ʾִ�еļ��ʱ��
	--fEven��Ҫִ�еĲ�������
	ProcessTimerEven = function(self,nStartSec,nIntervalSec,funEven,tbArg)
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		local nStartLoop = floor(nStartSec/STARTED_TIMER_INTERVAL);
		local nIntervalLoop = floor(nIntervalSec/STARTED_TIMER_INTERVAL);
		if nLoop < nStartLoop then
			return 0;
		end;
		if nIntervalLoop <= 0 then	--���nIntervalSecС�ڵ���0,��ʾ�������ִֻ��һ�Σ����nIntervalLoop�踳ֵһ������
			nIntervalLoop = HUGE_NUMBER;
		end;
		local nElapseLoop = nLoop - nStartLoop;
		if mod(nElapseLoop,nIntervalLoop) == 0 then
			funEven(self,tbArg);	--��ȻfunEven�ǳ�Ա�����������ڲ���self:���ã�����Ҫ��self����
		end;
	end,
	--����һ���ؿ���Ĭ��Ϊ���سɹ�
	EndStage = function(self,bWin)
		SetMissionV(MV_STAGE_OVER,1);
		SetMissionV(MV_VALUE9,0);	--���ѡ���Ҫɾ��������1
		SetMissionV(MV_VALUE10,0);	--���ѡ���Ҫɾ��������2
		StopMissionTimer(MISSION_ID,TIMER_ID);
		self:RemoveTimerTrigger();
		self:ClearBoss();
		self:ClearStageValue();
		TM_StopTimeGuage(-2);
		local nMapID = SubWorldIdx2ID(SubWorld);
		TM_CreateFieldNpc(nMapID);
		if bWin ~= nil and bWin ~= 1 then	--�������ʧ�����˻�һ��
			SetMissionV(MV_STAGE,self.nStage-1);	--��Ҫ�ѵ�ǰ�ؿ����û���һ��
			Msg2MSAll(MISSION_ID,"V��t �i th�t b�i!");
		else
			TM_AddStagePassTimes(self.nStage);	--���ش�����1
			TM_AddPoint(250,self.nStage);	--�����˼�250���ػ��֣����������TM_AddPoint���������ж�
			TM_AddExpAward(self.nStage);	--���齱��
			TM_CreateBox(self.nStage);	--��BOSS���м䴴��һ������NPC
			Msg2MSAll(MISSION_ID,"Ch�c m�ng �� v��t �i "..self.nStage..".");
			self:SaveTongStage();	--����ؿ�����
		end;
	end,
	--�����ʱ��
	ProcessTimer = function(self)
		local nStartSec,nIntervalSec,funEven,tbArg = 0,0,nil,{};
		for i=1,getn(self.tbTimerEven) do
			nStartSec = self.tbTimerEven[i][1];
			nIntervalSec = self.tbTimerEven[i][2];
			funEven = self.tbTimerEven[i][3];
			tbArg = self.tbTimerEven[i][4];
			self:ProcessTimerEven(nStartSec,nIntervalSec,funEven,tbArg);
			if GetMissionV(MV_STAGE_OVER) == 1 then	--���ִ��������ĺ�����ؿ������ˣ���ô����ľͲ�Ӧ�ñ�ִ����
				return 0;
			end;
		end;
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		if nLoop == GetMissionV(MV_CHECK_POINT) then
			self:OnProcessCheckPoint();
		end;
	end,
--�����ҵ�ǰλ�ã���������򷵻�-1�����м����򷵻�0�����ұ����򷵻�1
	GetPlayerSection = function(self,nPlayerIdx)
		local nOldPlayerIdx = PlayerIndex
		if nPlayerIdx ~= nil then
			PlayerIndex = nPlayerIdx;
		end;
		local _,nMapX,nMapY = GetWorldPos();
		local tbPos = {
					--x1   y1	   x2	y2
					{{1583,3144},{1530,3198}},	--left line
					{{1604,3162},{1549,3219}},	--right line
					};
		--y=(x-x1)(y2-y1)/(x2-x1)+y1   ����ʽֱ�߷���
		local nYLeft = floor((nMapX-tbPos[1][1][1])*(tbPos[1][2][2]-tbPos[1][1][2])/(tbPos[1][2][1]-tbPos[1][1][1])+tbPos[1][1][2]);
		local nYRight = floor((nMapX-tbPos[2][1][1])*(tbPos[2][2][2]-tbPos[2][1][2])/(tbPos[2][2][1]-tbPos[2][1][1])+tbPos[2][1][2]);
		PlayerIndex = nOldPlayerIdx;
		if nMapY > nYRight then
			return RIGHT_REGION;
		elseif nMapY < nYLeft then
			return LEFT_REGION;
		else
			return MID_REGION;
		end;
	end,
	--����һ������ʱ�䴥����������nSec�Ǵ�������Ҫ��ʱ�䣬������10�Ļ�����10��󴥷�
	--ִ�еĺ�����OnTimerTriggerEven
	SetTimerTrigger = function(self,nSec)
		StartMissionTimer(MISSION_ID,ASSI_TIMER_ID,nSec*FRAME_PER_SECOND);	--��ʼ������ʱ��
		SetMissionV(MV_TIMER_TRIGGER_STATE,1);
	end,
	--ɾ������ʱ�䴥����
	RemoveTimerTrigger = function(self)
		StopMissionTimer(MISSION_ID,ASSI_TIMER_ID);
		SetMissionV(MV_TIMER_TRIGGER_STATE,0);
	end,
	--��ȡ����ʱ�䴥������״̬
	GetTimerTriggerState = function(self)
		return GetMissionV(MV_TIMER_TRIGGER_STATE);
	end,
	--����Ƿ�ȫ��ͨ��
	CheckAllStagePass = function(self)
		local nCurStage = self.nStage;
		if nCurStage == MAX_STAGE then
			local nYearWeek = GetMissionV(MV_WEEK);
			local szTongName = GetMissionS(MS_TONG_NAME);
			StopMissionTimer(MISSION_ID,TIMER_ID);
			SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
			SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
			StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_SECOND);
			TM_SetRelayTongData(szTongName,KEY_WEEK,"d",nYearWeek);
			Msg2MSAll(MISSION_ID,"Ch�c m�ng c�c v� ��i hi�p �� v��t qua t�t c� c�c c�a �i!");
			Msg2Global(szTongName.."Bang h�i �� ��nh b�i hai ��i th�n th� H�a V� v� L�u Quang, th�ng qua t�t c� c�c kh�o nghi�m c�a T� Quang C�c");
			AddGlobalNews("<color=yellow>"..szTongName.."<color>Bang h�i ��nh b�i hai ��i th�n th� H�a V� v� L�u Quang, th�ng qua t�t c� c�c kh�o nghi�m c�a T� Quang C�c");
			return 1;
		end;	
		return 0;	
	end,
	--���BOSS��С��
	ClearBoss = function(self)
		local nMapID = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(nMapID);
	end,
	--�������STAGE����
	ClearStageValue = function(self)
		for i=MV_VALUE1,MV_VALUE10 do
			SetMissionV(i,0);
		end;
	end,
	--����ؿ�����
	SaveTongStage = function(self)
		local szTongName = GetMissionS(MS_TONG_NAME);
		local nCurStage = self.nStage;
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",nCurStage);
		Msg2MSAll(MISSION_ID,"B�o l�u ti�n ��: �i "..nCurStage..".");
		Msg2Global(szTongName.."Bang h�i th�ng qua T� Quang C�c �i "..nCurStage.." c�a kh�o nghi�m");
		WriteLog("[Bang h�i v��t �i]:"..szTongName.."Th�ng qua �i "..nCurStage..".");
	end,
	--�����������
	AllDeath = function(self)
		local funDeath = function(tbArg)
			ModifyLife(0);	
		end;
		local tbNormalPlayer = TM_GetPlayerTable();
		gf_OperatePlayers(tbNormalPlayer,funDeath,tbArg);
	end,
	--С����������������ÿ�ص�С���п��ܲ�һ����������Щ�ؿ���OnNpcDeath��Ҫ����
	OnNpcDeath = function(self,szNpcIdx)
		local nNpcIdx = tonumber(szNpcIdx);
		local nNpcFaction = TM_GetNpcFaction(nNpcIdx);
		if nNpcFaction == 0 then	--�������ɹ�
			SetNpcLifeTime(nNpcIdx,0);
			return 0;
		end;
		if GetPlayerFaction() == nNpcFaction then	--���������Ӧ�����ɹ�
			SetNpcLifeTime(nNpcIdx,0);
			SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)-1);
		end;
	end,
	--���NPC�����Ƿ񳬹�ĳ������ֵ�������Ļ����أ������򷵻أ�
	CheckNpcCount = function(self)
	local nNpcCount = GetMissionV(MV_FAC_NPC_COUNT);
		Msg2MSAll(MISSION_ID,"S� b�ng h� v� hi�n t�i:"..nNpcCount.."/"..self.nMaxNpcCount);
		if nNpcCount > self.nMaxNpcCount then
			return 1;
		else
			return 0;
		end;	
	end,
--=======���溯���൱���麯������������趨��ĺ���============================================
	--Ĭ�ϵ�CreateBoss����
	OnCreateBoss = function(self)
		gf_ShowDebugInfor("Ch�a ��nh ngh�a CreateBoss");
	end,
	--����ʱ�䴥������ִ�к���
	OnTimerTriggerEven = function(self)
		gf_ShowDebugInfor("Ch�a ��nh ngh�a TimerTriggerEven");
	end,
	--BOSS����������������Щ��������BOSS������OnBossDeath����Ϊ�麯��������ʵ����������
	OnBossDeath = function(self)
		gf_ShowDebugInfor("Ch�a ��nh ngh�a  OnBossDeath");
	end,
	--���㺯������ǰѭ����������֮�����ֻ������һ������
	OnProcessCheckPoint = function(self)
		gf_ShowDebugInfor("Ch�a ��nh ngh�a OnProcessCheckPoint");
	end,
}