--Create Date:2007年第二天
--Describe:０７年春节雪仗开启Mission之脚本
--Author:yanjun
Include("\\script\\online\\春节活动\\snowwar\\snowwar_head.lua");
function main()
        local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091224 and nDate <= 100117 then
		for i=1,getn(tMAP_CITY_FIELD) do
			SubWorld = SubWorldID2Idx(tMAP_CITY_FIELD[i][2]);
			if SubWorld > 0 then
				OpenMission(MISSION_ID);
				Msg2SubWorld(tMAP_CITY_FIELD[i][3].."Khu v鵦 n衜 tuy誸  m? c鯽, m阨 m鋓 ngi v祇 xem.")
			end;
			SubWorld = nOldSubWorld;
		end;
	end;
end;
