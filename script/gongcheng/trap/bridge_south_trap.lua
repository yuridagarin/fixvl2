--create date:07-04-27
--author:yanjun
--describe:�ϱ�����Trap��
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1114,2944},{1114,2944}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--�����׼���׶ζ�����ͨ��
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hi�n �ang trong giai �o�n chu�n b�, kh�ng th� �i qua");
		return 0;
	end;
end;