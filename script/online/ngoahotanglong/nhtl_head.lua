-- Event Ng�a H� T�ng Long -  V� l�m l�nh b�i
-- tEventGift table = {ItemName, FreeItemRoom, ItemWeight, Ext_Point_Used}
-- tEventFactionGift = {GiftName,GiftTypeName,GiftLevelRequire,Ext_Bit,Ext_Value,FreeItemRoom}


NHTL_DATE_START 	= 2008060900
NHTL_DATE_END 		= 2009010100

NHTL_EXT_POINT_FACTION = 0 	-- Bao g�m value t�i kho�n c� l�nh b�i + s� l�n nh�n trang b� m�n ph�i

NHTL_EXT_POINT_TND = 1 		-- Tr�ng gi�i b�y
NHTL_EXT_POINT_BCH = 2 			-- Tr�ng gi�i t�m

BIT_LEVEL_30 = 2
BIT_LEVEL_50 = 3
BIT_LEVEL_60 = 4


tEventGift =
{
	[1] = {"Th�n N�ng ��n",1,1,NHTL_EXT_POINT_TND}, -- Gi�i b�y
	[2] = {"B�ch C�u Ho�n",1,1,NHTL_EXT_POINT_BCH}, -- Gi�i t�m
}

tEventFactionGift =
{
	[1] = {"Trang b� m�n ph�i S� c�p", "V� Kh�, M�o, H� Y", 30, BIT_LEVEL_30, 2, 3},											-- Level 30
	[2] = {"Trang b� m�n ph�i Trung c�p", "V� kh�, Trang S�c", 50, BIT_LEVEL_50, 4, 3}, 										-- Level 50
	[3] = {"Trang b� T�ng Ki�m", "M�o, H� Y, Th��ng Y, Trang S�c v� V� Kh�", 60, BIT_LEVEL_60, 8, 6}, 				-- Level 60	
}


function CheckAccount()
	do
		return 0
	end
	local nCheckAccount = GetExtPoint(NHTL_EXT_POINT_FACTION)	
	if (nCheckAccount > 0) then	
		return 1
	end	
	return 0	
end


function IsEventStart()
	do
		return 0
	end
	local nDate = tonumber(date("%Y%m%d%H"));
	
	if nDate >= NHTL_DATE_START and nDate < NHTL_DATE_END then
		return 1
	end
	return 0
end 

function CheckFaction(nFaction)
	local tFaction = {0,1,5,7,10,13,16,19}
	local i = 0
	
	if nFaction == nil or nFaction < 0 then
		nFaction = 0
	end
	
	for i=1, getn(tFaction) do
		if nFaction == tFaction[i] then
			return 0
		end
	end
	return 1
end
