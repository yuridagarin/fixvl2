--����ͼ����
--created by lizhi
--2005-9-27 17:14
LifeItem_Award_List = {
	{2, 9, 4 },		--���˿
	{2, 2, 37},		--����ʯ
	{2, 2, 11},		--����ľ
	{2, 2, 47},		--ɽʨ֮Ƥ
	{1, 2, 4 }		--����
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

--˳������װ����װ��ͷ
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

--�ں�3����˳������װ����װ��ͷ
--���ڵ����ݽṹ����ƷID������ȼ�
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
    Msg2Player("B�n nh�n ���c 1 m�n trang b�.");
end;

--ǰ3������������,Ȼ��������
item_bg_table = {
    [1] = {100, 1367, 3228, "Tr��c Ma T� T��ng Tuy�n Ch�u ph�"},
    [2] = {203, 1461, 3134, "Gi�a c�y c�u g� g�n Th�y xa � T�y Bi�n Kinh"},
    [3] = {303, 1704, 3009, "Tr��c c�i chu�ng n�o �� sau n�i Nga My"},
    [4] = {312, 1765, 3059, "Cu�i c�u d�y g�n V� �ang"},
    [5] = {202, 1396, 2798, "D��i th�c � H�nh Hoa Th�n"},
    [6] = {327, 1451, 2922, "Ch�nh gi�a tr�i � M�ng b�"},
    [7] = {326, 1540, 2992, "Ch�nh gi�a t�m th�m � M� Tuy�t s�n trang"},
    [8] = {310, 1394, 2988, "D��i c�ng l�u Ki�m M�n Quan"}
};


function GivePlayerAward_Bg(index)
    local nMapid1, nX1, nY1 = GetWorldPos()
    local nMapid2 = item_bg_table[index][1];
    local nX2 = item_bg_table[index][2];
    local nY2 = item_bg_table[index][3];
    local nDist = DistanceBetweenPoints(nMapid1, nX1, nY1, nMapid2, nX2, nY2);
    if nDist >= 0 and nDist <= 15 then
    	Say("<color=green>�m thanh th�n b�<color>: Tr��c khi khai qu�t kho b�u xem <color=yellow>�� s�c l�c v� kho�ng tr�ng<color> ch�a! Mu�n ti�p t�c kh�ng?",2,"Ti�p t�c!/#GiveAward("..index..")", "Ng�ng!/empty_function");
    else
        Msg2Player("Tr�n tranh b�t qu�i �n hi�n v� tr� kho b�u"..item_bg_table[index][4]..", h�nh nh� kh�ng ph�i n�i ��y!");
    end;
end;

function GiveAward(index)
	--ɾ������
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
		AddItem(2, 1, 148, 2, 1);	--С���Ϭ
	elseif index == 7 then
		AddItem(2, 1, 148, 4, 1);	--С���Ϭ
	elseif index == 8 then
		AddItem(2, 1, 148, 6, 1);	--С���Ϭ
	else
		AddItem(2, 1, 148, 1, 1);	--С���Ϭ
	end;
	
	if index == 2 then
		AddItem(2, 2, 7, 2, 1);		--������Ƭ
	elseif index == 3 then
		AddItem(2, 2, 7, 4, 1);		--������Ƭ
	elseif index == 4 or index == 5 then
		AddItem(2, 2, 7, 6, 1);		--������Ƭ
	elseif index == 6 then
		AddItem(2, 2, 8, 2, 1);		--����
	elseif index == 7 or index == 8 then
		AddItem(2, 2, 8, 4, 1);		--������Ƭ
	end;
	
	local nFuFlag = 0;		--�ж��Ƿ���˼�����
	
	if index == 3 then
		AddItem(2, 5, 6, 1, 1);		--6��������
	elseif index == 4 or index == 5 or index == 6 then
		if random(1, 100) > 50 then
			AddItem(2, 5, 7, 1, 1);		--7��������
			nFuFlag = 1;
		end;
	elseif index == 7 then
		for i=1, 2 do
			if random(1, 100) > 50 then
				AddItem(2, 5, 7, 1, 1);		--7��������
				nFuFlag = 1;
			end;
		end;
	elseif index == 8 then
		for i=1, 3 do
			if random(1, 100) > 50 then
				AddItem(2, 5, 7, 1, 1);		--7��������
				nFuFlag = 1;
			end;
		end;
	end;
	
	if index == 5 then
		AddItem(1, 0, 32, 5, 1);	--��ת�ػ굤
	elseif index > 5 then
		AddItem(1, 0, 32, 10, 1);	--��ת�ػ굤
	end;
	
	if index >= 6 and nFuFlag == 0 then
		GiveRandomEquipment();	--�������װ��
		GiveRandomEquipment();
	end;
end;

function GiveRandomEquipment()
	local nLevel = GetLevel();
	local nType = random(1, 3);	--���һ��װ������
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
    		Msg2Player("B�n nh�n ���c 1 m�n trang b�.");
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