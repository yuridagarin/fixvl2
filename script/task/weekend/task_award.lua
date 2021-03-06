--八卦图奖励
--created by lizhi
--2005-9-27 17:14
LifeItem_Award_List = {
	{2, 9, 4 },		--冷虫丝
	{2, 2, 37},		--黑钨石
	{2, 2, 11},		--铁线木
	{2, 2, 47},		--山狮之皮
	{1, 2, 4 }		--麝香
};

Item_bg_table = {
    {2,0,321},
    {2,0,322},
    {2,0,323},
    {2,0,324},
    {2,0,325},
    {2,0,326},
    {2,0,327},
    {2,0,328}
};

--顺序是上装，下装，头
Equipment_Award_List = {
    [1] = {
        {0,109,1},
        {0,110,1},
        {0,108,1}
    },
    
    [2] = {
        {0,109,2},
        {0,110,2},
        {0,108,2}
    },

    [3] = {
        {0,109,3},
        {0,110,3},
        {0,108,3}
    },
    
    [4] = {
		{0,109,4},
		{0,110,4},
		{0,108,4}
    },
    
    [5]= {
    	{0,109,5},
    	{0,110,5},
    	{0,108,5}
    },
    
    [6] = {
    	{0,109,6},
    	{0,110,6},
    	{0,108,6}
    },
    
    [7] = {
    	{0,109,7},
    	{0,110,7},
    	{0,108,7}
    },
    
    [8] = {
    	{0,109,8},
    	{0,110,8},
    	{0,108,8}
    }
};

--内含3个表，顺序是上装，下装，头
--表内的数据结构是物品ID，需求等级
Random_Equipment_List = {
	[1] = {
		{0, 100, 17, 69},
		{0, 100, 15, 61},
		{0, 100, 13, 52},
		{0, 100, 11, 44},
		{0, 100, 9,  35},
		{0, 100, 7,  27},
		{0, 100, 5,  18},
		{0, 100, 3,  10}
	},
	
	[2] = {
		{0, 101, 17, 74},
		{0, 101, 15, 66},
		{0, 101, 13, 57},
		{0, 101, 11, 49},
		{0, 101, 9,  40},
		{0, 101, 7,  32},
		{0, 101, 5,  23},
		{0, 101, 3,  15}
	},
	
	[3] = {
		{0, 103, 17, 72},
		{0, 103, 15, 64},
		{0, 103, 13, 55},
		{0, 103, 11, 47},
		{0, 103, 9,  38},
		{0, 103, 7,  30},
		{0, 103, 5,  21},
		{0, 103, 3,  13}
	}
};

function GivePlayerEquipment(index)
	local nType = random(1, 3);
    local nBody = GetBody();
    local i, j, k;

    i = Equipment_Award_List[index][nType][1];
    j = Equipment_Award_List[index][nType][2];
    k = Equipment_Award_List[index][nType][3];
    
    if nBody == 1 then
        k = k;
    elseif nBody == 2 then
        k = k + 18;
    elseif nBody == 3 then
        k = k + 36;
    else
        k = k + 54;
    end;
    
    AddItem(i,j,k,1,1);
    Msg2Player("B筺 nh薾 頲 1 m鉵 trang b?.");
end;

--前3个数字是坐标,然后是描述
item_bg_table = {
    [1] = {100, 1367, 3228, "Trc Ma T? Tng Tuy襫 Ch﹗ ph?"},
    [2] = {203, 1461, 3134, "Gi鱝 c﹜ c莡 g? g莕 Th駓 xa ? T﹜ Bi謓 Kinh"},
    [3] = {303, 1704, 3009, "Trc c竔 chu玭g n祇  sau n骾 Nga My"},
    [4] = {312, 1765, 3059, "Cu鑙 c莡 d﹜ g莕 V? ng"},
    [5] = {202, 1396, 2798, "Di th竎 ? H筺h Hoa Th玭"},
    [6] = {327, 1451, 2922, "Ch輓h gi鱝 tr筰 ? M玭g b?"},
    [7] = {326, 1540, 2992, "Ch輓h gi鱝 t蕀 th秏 ? M? Tuy誸 s琻 trang"},
    [8] = {310, 1394, 2988, "Di c鎛g l莡 Ki誱 M玭 Quan"}
};


function GivePlayerAward_Bg(index)
    local nMapid1, nX1, nY1 = GetWorldPos()
    local nMapid2 = item_bg_table[index][1];
    local nX2 = item_bg_table[index][2];
    local nY2 = item_bg_table[index][3];
    local nDist = DistanceBetweenPoints(nMapid1, nX1, nY1, nMapid2, nX2, nY2);
    if nDist >= 0 and nDist <= 15 then
    	Say("<color=green> thanh th莕 b?<color>: Trc khi khai qu藅 kho b竨 xem <color=yellow> s鴆 l鵦 v? kho秐g tr鑞g<color> ch璦! Mu鑞 ti誴 t鬰 kh玭g?",2,"Ti誴 t鬰!/#GiveAward("..index..")", "Ng璶g!/empty_function");
    else
        Msg2Player("Tr猲 tranh b竧 qu竔 萵 hi謓 v? tr? kho b竨"..item_bg_table[index][4]..", h譶h nh? kh玭g ph秈 n琲 y!");
    end;
end;

function GiveAward(index)
	--删除道具
	local IsExist = DelItem(Item_bg_table[index][1], Item_bg_table[index][2], Item_bg_table[index][3],1);
	if (IsExist ~= 1) then
		return
	end;
	
	if random(1, 1000) < 200 then
		GivePlayerEquipment(index);
	end;
	if index == 8 and random(1, 1000) < 200 then
		GivePlayerEquipment(index);
	end;
	
	local n = random(1, 5);
	if index == 1 or index == 2 then
		AddItem(LifeItem_Award_List[n][1], LifeItem_Award_List[n][2], LifeItem_Award_List[n][3], 10, 1);
	elseif index == 3 then
		AddItem(LifeItem_Award_List[n][1], LifeItem_Award_List[n][2], LifeItem_Award_List[n][3], 20, 1);
	else
		AddItem(LifeItem_Award_List[n][1], LifeItem_Award_List[n][2], LifeItem_Award_List[n][3], 40, 1);
	end;
	
	if index == 6 then
		AddItem(2, 1, 148, 2, 1);	--小块金犀
	elseif index == 7 then
		AddItem(2, 1, 148, 4, 1);	--小块金犀
	elseif index == 8 then
		AddItem(2, 1, 148, 6, 1);	--小块金犀
	else
		AddItem(2, 1, 148, 1, 1);	--小块金犀
	end;
	
	if index == 2 then
		AddItem(2, 2, 7, 2, 1);		--陨铁碎片
	elseif index == 3 then
		AddItem(2, 2, 7, 4, 1);		--陨铁碎片
	elseif index == 4 or index == 5 then
		AddItem(2, 2, 7, 6, 1);		--陨铁碎片
	elseif index == 6 then
		AddItem(2, 2, 8, 2, 1);		--陨铁
	elseif index == 7 or index == 8 then
		AddItem(2, 2, 8, 4, 1);		--陨铁碎片
	end;
	
	local nFuFlag = 0;		--判断是否给了鉴定符
	
	if index == 3 then
		AddItem(2, 5, 6, 1, 1);		--6级鉴定符
	elseif index == 4 or index == 5 or index == 6 then
		if random(1, 100) > 50 then
			AddItem(2, 5, 7, 1, 1);		--7级鉴定符
			nFuFlag = 1;
		end;
	elseif index == 7 then
		for i=1, 2 do
			if random(1, 100) > 50 then
				AddItem(2, 5, 7, 1, 1);		--7级鉴定符
				nFuFlag = 1;
			end;
		end;
	elseif index == 8 then
		for i=1, 3 do
			if random(1, 100) > 50 then
				AddItem(2, 5, 7, 1, 1);		--7级鉴定符
				nFuFlag = 1;
			end;
		end;
	end;
	
	if index == 5 then
		AddItem(1, 0, 32, 5, 1);	--九转回魂丹
	elseif index > 5 then
		AddItem(1, 0, 32, 10, 1);	--九转回魂丹
	end;
	
	if index >= 6 and nFuFlag == 0 then
		GiveRandomEquipment();	--两件随机装备
		GiveRandomEquipment();
	end;
end;

function GiveRandomEquipment()
	local nLevel = GetLevel();
	local nType = random(1, 3);	--随机一样装备类型
	local nBody = GetBody();
    local i, j, k;
    
	for index, value in Random_Equipment_List[1] do
		if nLevel >= value[4] then
		    i = value[1];
		    j = value[2];
		    k = value[3] + random(0,1);
		    
		    if nBody == 1 then
		        k = k;
		    elseif nBody == 2 then
		        k = k + 18;
		    elseif nBody == 3 then
		        k = k + 36;
		    else
		        k = k + 54;
		    end;
    
    		AddItem(i,j,k,1,1,-1,-1,-1,-1,-1,-1);
    		Msg2Player("B筺 nh薾 頲 1 m鉵 trang b?.");
    		break
    	end;
    end;
end;

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;

function empty_function()

end;