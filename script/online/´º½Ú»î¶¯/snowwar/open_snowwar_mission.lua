--Create Date:2007��ڶ���
--Describe:�����괺��ѩ�̿���Mission֮�ű�
--Author:yanjun
Include("\\script\\online\\���ڻ\\snowwar\\snowwar_head.lua");
function main()
        local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091224 and nDate <= 100117 then
		for i=1,getn(tMAP_CITY_FIELD) do
			SubWorld = SubWorldID2Idx(tMAP_CITY_FIELD[i][2]);
			if SubWorld > 0 then
				OpenMission(MISSION_ID);
				Msg2SubWorld(tMAP_CITY_FIELD[i][3].."Khu v�c n�m tuy�t �� m� c�a, m�i m�i ng��i v�o xem.")
			end;
			SubWorld = nOldSubWorld;
		end;
	end;
end;
