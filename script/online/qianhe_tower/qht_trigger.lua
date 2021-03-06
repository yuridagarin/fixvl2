Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function Qht_Trigger()
	--活动是否过期
	if qht_activity_isopen() ~= 1 then
		RemoveTrigger(GetTrigger(1277 * 2));
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	--地图判断
	if qht_map_allow({6021,6022,6023}, nMapId) ~= 1 then
		return 0;
	end
	--相关设置
	SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
	SetDeathPunish(0);
	--触发
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	
	if sName == "Tr? o H? V?" then
		qht_add_exp(3000)
	elseif sName == "Tr? M﹗ H? V?" then
		qht_add_exp(3500)
	elseif sName == "Thi猲 T莔 V? T╪g" then
		qht_add_exp(3500)
	elseif sName == "Thi猲 T莔 Ph竝 T╪g" then
		qht_add_exp(4000)
	elseif sName == "Ma Ni T╪g" then
		qht_add_exp(4000)
	elseif sName == "У La Ni T╪g" then
		qht_add_exp(4500)
	end
	
	local nRand = random(1,100);
	if nRand <= 20 then
		if nMapId == 6021 then
			if sName == "Tr? o H? V?" then
				qht_kill_6021_monster();
			elseif sName == "Tr? M﹗ H? V?" then
				qht_kill_6021_monster();
			end
		end
		if nMapId == 6022 then
			if sName == "Thi猲 T莔 V? T╪g" then
				qht_kill_6022_monster();
			elseif sName == "Thi猲 T莔 Ph竝 T╪g" then
				qht_kill_6022_monster();
			end
		end
		if nMapId == 6023 then
			if sName == "Ma Ni T╪g" then
				qht_kill_6023_monster();
			elseif sName == "У La Ni T╪g" then
				qht_kill_6023_monster();
			end
		end		
	end
end