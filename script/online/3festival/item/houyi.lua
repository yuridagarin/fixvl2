function OnUse(nItemIndex)
	--擂台使用限制
	if GetTaskTemp(242) ~= 0 or GetTask(1151) ~= 0 or check_map() == 0 then
		Msg2Player("Trong l玦 i kh玭g th? s? d鬾g k? n╪g n祔");
		return 1;
	end
	--西北关卡使用限制
	if nw_map_chk() == 1 then
		Msg2Player("秈 T﹜ B綾 kh玭g th? s? d鬾g k? n╪g n祔!")
		return 1
	end
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		if DoFireworks(862,1) == 1 then
			SetItemUseLapse(nItemIndex,5*60*18);	--冷却时间：5分钟
		end;
		return 1;
	end;
	return 0;
end;

function CanEquip()
	return 0;	--返回非1表示能右键装备。返回1表示不能装备
end

function OnEquip()
	return 0
end

function OnUnEquip()
	return 0
end

function check_map()
	local nMapID = GetWorldPos();
	if nMapID >= 839 and nMapID <= 842 or nMapID == 2010 or nMapID == 1010 or nMapID == 961 or nMapID == 962 or nMapID == 963 then
		return 0;
	else
		return 1;
	end;
end;
--西北关卡地图限制
function nw_map_chk()
	local map_id = GetWorldPos()
	for i = 1,5 do
		for j = 0,6 do
			if map_id == (1000+ (i*100) +j) then
				return 1
			end
		end
	end
	return 0
end
