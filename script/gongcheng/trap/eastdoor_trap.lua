--create date:07-04-13
--author:yanjun
--describe:����Trap��
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1259,3015},{1259,3015}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--�����׼���׶ζ�����ͨ��
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hi�n �ang trong giai �o�n chu�n b�, kh�ng th� �i qua");
		return 0;
	end;
	local nTrapState = GetMissionV(MV_TRAP_EAST_DOOR);
	if GetMissionV(MV_DESTROY_EAST_DOOR) == 1 then	--������ű��ݻ�
		return 0;
	end;
	if nTrapState == 0 or nPlayerCamp == nTrapState then	--�����˫�����Ż�Ա���Ӫ����
		return 0;
	end;
	SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
	Msg2Player("Th�nh m�n n�y hi�n do bang h�i phe ��ch tr�n th�, kh�ng th� v��t qua ");
end;