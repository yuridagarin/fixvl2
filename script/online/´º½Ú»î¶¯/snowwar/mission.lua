--Create Date:2006�����һ��
--Describe:�����괺��ѩ��Mission
--Author:yanjun
Include("\\script\\online\\���ڻ\\snowwar\\snowwar_head.lua");

function InitMission()
	SW_InitSnowWar();					--¥��������Щ��������head�ͷ�������ʲô�����أ�ֵ��˼��
end;

function RunMission()
	SW_RunSnowWar();					--2¥����¥�����ô�֮һ��������ļ�д���Ͳ����ٴ������Ϳ�ͷ�ļ�������
end;

function EndMission()
	SW_EndSnowWar();					--3¥����¥�ϵ�
end;

function OnLeave(RoleIndex)				--4¥������¥�ġ�¥�±��ֶ���
	PlayerIndex = RoleIndex;
	SW_LeaveSnowWar();
	PlayerIndex = RoleIndex
end;

function JoinMission(RoleIndex,nCamp)	--5¥������������
	PlayerIndex = RoleIndex;
	SW_JoinSnowWar();
	PlayerIndex = RoleIndex
end;