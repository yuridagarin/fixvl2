--File name:
--Describe:比赛场地工作者
--Create Date:2006-4-26
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local selTab = {
				"ng! Ta mu鑞 r阨 kh醝/leave",
				"Ti誴 t鬰 tham gia thi u/nothing",
				}
	Say("B筺 mu鑞 r阨 kh醝 trng u ngay b﹜ gi??",getn(selTab),selTab);
end;

function leave()
	if GetTask(STATUS) == CAMP_PLAYER then
		DelMSPlayer(MISSION_ID,CAMP_PLAYER);
	else
		local MapID = GetWorldPos();
		local MapIndex = floor(MapID/1000);
		if MapIndex == 1 then
			MapIndex = 3;
		elseif MapIndex == 3 then
			MapIndex = 1;
		end;
		NewWorld(LeavePoint[MapIndex][1],LeavePoint[MapIndex][2],LeavePoint[MapIndex][3]);
		Restore_Player_State();
		WriteLog("[L鏸 ho箃 ng t誸 an Ng鋆: C? ngi ch琲 kh玭g ph秈 l? tuy觧 th? tham gia trong khu v鵦 畊a thuy襫 R錸g, t猲 nh﹏ v藅:"..GetName());
	end;
end;