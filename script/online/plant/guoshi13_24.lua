--Event 2010 November  2010-11-23

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\vng\\config\\newserver.lua");

-- So 9880, 30,30,30, ... la so gi vay ?
tFruitAwardNov2010 =
{
	[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Nh�n"},
	[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Ch�m Ch�m"},
	[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
	[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "D�a"},
	[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "M�ng C�t"},
	[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "B��i"},
	[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "D�u"},
	[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Chu�i"},
	[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Xo�i"},
	[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "��o"},
	[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "M�n"},
	[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "V�i"},
	[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "T�o"},
	[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "B�"},
	[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, "�u ��"},
	[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "M�ng C�u"},
	[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Kh�m"},
	[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "L�"},
	[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "B�n bon"},
	[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "Kh�"},
}

function fruitcheckserverNov()
	--local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	
	local nServerID = GetGlbValue ( 1023 )  -- server id
	for i = 1, getn(tFruitAwardServerGroupNov) do
		for j = 1, getn(tFruitAwardServerGroupNov[i]) do
			if nServerID == tFruitAwardServerGroupNov[i][j] then
				return i
			end
		end	
	end
	return 0
end

