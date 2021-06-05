-- Event C�u Nguy�t H�o V�n 29/08/2008 - 30/09/2008
-- tEventCNHVGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}
-- Created by TuanNA5


CNHV_DATE_START 	= 2008090500
CNHV_DATE_END 		= 2008100800


CNHV_EXT_POINT_TND 		= 1 	-- Tr�ng gi�i t�m
CNHV_EXT_POINT_BCH 		= 2 	-- Tr�ng gi�i ch�n
CNHV_EXT_POINT_MTSM 	= 3 	-- Tr�ng gi�i t�
CNHV_EXT_POINT_TTLD 	= 4 	-- Tr�ng gi�i n�m
CNHV_EXT_POINT_BLTD 	= 5 	-- Tr�ng gi�i s�u
CNHV_EXT_POINT_TTH 		= 6 	-- Tr�ng gi�i b�y


tEventCNHVGift =
{
	[1] = {"Th�n N�ng ��n",1,1,CNHV_EXT_POINT_TND}, 		-- Gi�i t�m
	[2] = {"B�ch C�u Ho�n",1,1,CNHV_EXT_POINT_BCH}, 		-- Gi�i ch�n
	[3] = {"M�t T�ch S� M�n",1,1,CNHV_EXT_POINT_MTSM}, 	-- Gi�i t�
	[4] = {"T�y T�y Linh ��n",1,1,CNHV_EXT_POINT_TTLD},	-- Gi�i n�m
	[5] = {"B�ng Lai Ti�n ��n",1,1,CNHV_EXT_POINT_BLTD}, 	-- Gi�i s�u
	[6] = {"Tam Thanh Ho�n",1,1,CNHV_EXT_POINT_TTH}, 	-- Gi�i b�y
}


tBookList =
{
	[1]   = {"Kim Cang Ph�c Ma kinh",0,107,1,1},
	[2]   = {"V� Tr�n M�t t�ch",0,107,5,1},
	[3]   = {"Ti�m Long M�t t�ch",0,107,3,1},
	[4]   = {"Thi�n La M�t t�ch",0,107,7,1},
	[5]   = {"Nh� � M�t t�ch",0,107,9,1},
	[6]   = {"B�ch H�i Ph�",0,107,11,1},
	[7]   = {"H�n ��n M�t t�ch",0,107,13,1},
	[8]   = {"Qu� Thi�n M�t t�ch",0,107,15,1},
	[9]   = {"Huy�n �nh M�t t�ch",0,107,17,1},
	[10] = {"Qu�n T� M�t t�ch",0,107,19,1},
	[11] = {"Tr�n Qu�n M�t t�ch",0,107,21,1},
	[12] = {"Xuy�n V�n M�t t�ch",0,107,23,1},
	[13] = {"U Minh Qu� L�c",0,107,25,1},
	[14] = {"Linh C� M�t t�ch",0,107,27,1},
}

function IsEventCNHVStart()
	local nDate = tonumber(date("%Y%m%d%H"));	
	if nDate >= CNHV_DATE_START and nDate < CNHV_DATE_END then
		return 1
	end
	return 0
end 