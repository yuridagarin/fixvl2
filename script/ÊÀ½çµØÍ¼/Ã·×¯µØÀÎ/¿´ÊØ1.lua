--梅庄地牢地图看守传入脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Th? v?: <color>%s c莕 v祇 Mai Trang мa Lao kh玭g?",sName),2,"Ta mu鑞 v祇/entrance","Kh玭g c莕 u/do_nothing");
end

function entrance()
	if IsHaveTaskOrCanGet2(46, 52) == 1 then
		NewWorld(6013,1606,3206);
		SetFightState(1);
		return 1;	
	end
	Talk(1,"","c竎 h? kh玭g th? v祇 khu v鵦 n祔.");	
end

function do_nothing()
end