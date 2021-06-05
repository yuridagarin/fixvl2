Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

function InitMission() 	
	for i=1,10 do
		SetMissionS(i,"��ȱ")
	end	
	for i=1,50 do
		SetMissionV(i,0)
	end
	randomseed(GetTime())
	local nRoute = random(1,15);  --��ȡ������Ҫ��������ɣ�һ��15��
	SetMissionV(MV_ABLUEMOON_NEED_ROUTE,nRoute)
	AddGlobalNews("�ƾٿ��Ա����콱��Ҫ��ְҵ�ǣ�"..tNeedRoute[nRoute][2].."��")
	Msg2Global("�ƾٿ��Ա����콱��Ҫ��ְҵ�ǣ�"..tNeedRoute[nRoute][2].."��")
	RunMission(MISSION_ID);
end;

function RunMission()
	StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_LOOP_TIME);
end;

function EndMission()
	StopMissionTimer(MISSION_ID,TIMER_ID)
	SetMissionV(MV_MISSION_STATE,0);
end
