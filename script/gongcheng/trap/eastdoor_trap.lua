--create date:07-04-13
--author:yanjun
--describe:东门Trap点
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1259,3015},{1259,3015}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--如果是准备阶段都不能通过
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player(" hi謓 產ng trong giai 畂筺 chu萵 b?, kh玭g th? 甶 qua");
		return 0;
	end;
	local nTrapState = GetMissionV(MV_TRAP_EAST_DOOR);
	if GetMissionV(MV_DESTROY_EAST_DOOR) == 1 then	--如果城门被摧毁
		return 0;
	end;
	if nTrapState == 0 or nPlayerCamp == nTrapState then	--如果对双方开放或对本阵营开放
		return 0;
	end;
	SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
	Msg2Player("Th祅h m玭 n祔 hi謓 do bang h閕 phe ch tr蕁 th?, kh玭g th? vt qua ");
end;