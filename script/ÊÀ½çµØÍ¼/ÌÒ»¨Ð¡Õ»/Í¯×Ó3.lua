--桃花小栈地图门童传入脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>M玭 уng: <color>%s mu鑞 v祇 Уo Hoa Ti觰 S筺 kh玭g?",sName),2,"Ta mu鑞 v祇/entrance","Kh玭g c莕 u/do_nothing");
end

function entrance()
	--根据任务决定进入的地图
	if IsHaveTaskOrCanGet2(21, 52) == 1 then
		NewWorld(6009,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(53, 61) == 1 then
		NewWorld(6010,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(62, 65) == 1 then
		NewWorld(6011,1579,3218);
		SetFightState(0);
		return 1;
	end
	Talk(1,"","c竎 h? kh玭g th? v祇 khu v鵦 n祔.");
	return 0;
end

function do_nothing()
end