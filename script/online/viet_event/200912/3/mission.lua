--=============================================
--create by baiyun 2009.11.25
--describe:Խ�ϰ�12�·�ʥ���ڻ������ʦmission����
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_functions.lua");
function InitMission()
	MS_InitMission();
end;

function RunMission()
	MS_StartMission();
end;

function EndMission()
	MS_EndMission();
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	MS_LeaveMission();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	MS_JoinMission(nCamp);
	PlayerIndex = RoleIndex;
end;
