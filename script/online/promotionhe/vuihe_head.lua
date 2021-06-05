-- Event H� Ng�p Tr�n - Vui R�n R�ng 11/06/2008 - 20/07/2008
-- tEventGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}


VUIHE_DATE_START 	= 2008060900
VUIHE_DATE_END 		= 2008072100

VUIHE_EXT_POINT_SML = 3 		-- Tr�ng gi�i nh�t
VUIHE_EXT_POINT_PTL = 4			-- Tr�ng gi�i nh�
VUIHE_EXT_POINT_TKH = 5 		-- Tr�ng gi�i ba
VUIHE_EXT_POINT_TND = 1 		-- Tr�ng gi�i t�
VUIHE_EXT_POINT_BCH = 2 		-- Tr�ng gi�i n�m


tEventHeGift =
{
	[1] = {"Ch��ng M�n ��c Phong L�nh - Cao c�p",1,1,VUIHE_EXT_POINT_SML}, -- Gi�i nh�t
	[2] = {"Phong Th��ng L�nh Ti�n Phong - T�ng",1,1,VUIHE_EXT_POINT_PTL}, -- Gi�i nh�
	[3] = {"Phong Th��ng L�nh Ti�n Phong - Li�u",1,1,VUIHE_EXT_POINT_PTL}, -- Gi�i nh�
	[4] = {"B�o R��ng T�ng Ki�m Hoa Kh�",1,1,VUIHE_EXT_POINT_TKH}, -- Gi�i ba
	[5] = {"Th�n N�ng ��n",1,1,VUIHE_EXT_POINT_TND}, -- Gi�i t�
	[6] = {"B�ch C�u Ho�n",1,1,VUIHE_EXT_POINT_BCH}, -- Gi�i n�m
}


function IsEventHeStart()
	local nDate = tonumber(date("%Y%m%d%H"));
	
	if nDate >= VUIHE_DATE_START and nDate < VUIHE_DATE_END then
		return 1
	end
	return 0
end 