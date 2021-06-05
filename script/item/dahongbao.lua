Include("\\script\\lib\\globalfunctions.lua")

--function OnUse(itemIndex)
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if (nDate > 2011022024) then
--		DelItemByIndex(itemIndex, -1);
--		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng!")
--		return
--	end
--	
--	if (DelItemByIndex(itemIndex, 1) == 1) then
--		gf_EventGiveCustomAward(1, 200000, 1, "Hoat dong thang 1 nam 2011", "S� d�ng bao l� x�");
--		gf_AddItemEx2({2, 1, 30277, 10}, "Hoa Mai", "Hoat dong thang 1 nam 2011", "S� d�ng bao l� x�")
--	end
--end

szLogTitle = "Hoat dong thang 1 nam 2011"

YANHUO_TABLE = {
--	{"X�ch M�c H�a Di�m", 801, 10, 2, 1, 191},
--	{"Tranh M�c H�a Di�m", 802, 10, 2, 1, 193},
--	{"Lam M�c H�a Di�m", 805, 10, 2, 1, 192},
	{"Tranh S�c Y�n Hoa", 820, 3, 2, 1, 189},
	{"Lam S�c Y�n Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--�����̻�
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function OnUse(itemIndex)
	local nDate = tonumber( date( "%y%m%d" ) )
	if nDate > 110421 then
		DelItemByIndex(itemIndex, -1);
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng!")
		return
	end
	
	local nCurDate = floor ( GetTask( TSK_DAHONGBAO_201101 ) / 1000 ) -- l�y 6 s� ��u ti�n	
		-- th�c hi�n reset s� l�n s� d�ng trong ng�y v� th�i gian gi�n c�ch s� d�ng . n�u kh�ng ph�i l� ng�y hi�n t�i
	if nCurDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	if GetLevel () < 77 then
		Talk ( 1, "", "��ng c�p 77 tr� l�n m�i c� th� nh�n bao l� x�!" )
		return
	end
	
	-- ki�m tra nh�n v�t c� gia nh�p m�n ph�i ch�a
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a v�o m�n ph�i n�n kh�ng th� s� d�ng bao l� x�" )
		return
	end
	
	--if check_skill_55() == 0 then
	--	Talk(1, "", "Ch�a h�c k� n�ng c�p 55 c�a m�n ph�i n�n kh�ng th� ��t ph�o hoa!")
	--	return
	--end
	
	-- Vu�t qu� s� l�n s� d�ng --> tho�t 	
	local nCount = mod ( GetTask(TSK_DAHONGBAO_201101), 100 ) 
	if nCount >= 40 then
		Talk(1, "", "H�m nay thi�u hi�p �� d�ng qu� nhi�u bao l� x� r�i. H�y quay l�i v�o ng�y mai!")
		return
	end
	
	-- Th�i gian gi�n c�ch ��t ph�o hoa 30 gi�y
	local nDif = 30 - ( GetTime() - GetTask ( TSK_DAHONGBAO_201101_TIME ) )
	
	if nDif > 0 then
		Talk(1, "", "Thi�u hi�p ph�i ch� "..nDif.." gi�y n�a m�i c� th� ti�p t�c s� d�ng bao l� x�!")
		return
	end
	
	if gf_JudgeRoomWeight(3, 50) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0
	end
	
	local nHour = tonumber(date("%H%M"))
	if nHour < 0800 or ( nHour > 1000 and nHour < 1530 ) or ( nHour > 1730  and nHour < 2000 ) or ( nHour > 2200 )  then
		Talk ( 1, "", "Ho�t ��ng s� d�ng bao l� x� di�n ra ba ��t trong ng�y: ��t m�t t� 8 gi� ��n 10 gi�, ��t hai t� 15 gi� 30 ��n 17 gi� 30 v� ��t ba t� 20 gi� ��n 22 gi�!" )
		return
	end
	local nWeek = tonumber(date("%w")) -- tr� v� ng�y trong tu�n
	if (DelItemByIndex(itemIndex, 1) == 1) then				
		--if nHour < 0900 or (nHour > 1000 and nHour < 1530) or (nHour > 1630 and nHour < 2030) or nHour > 2130 then
			
		-- Gi�i h�n ph�o hoa s� d�ng � m�t s� map
		-- local nPos = GetWorldPos()
		-- if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
		--	Talk ( 1, "", "Ch� c� th� s� d�ng ph�o hoa t�i Tuy�n Ch�u, D��ng Ch�u, chi�n tr��ng Nh�n M�n Quan, S�t Th� ���ng v� trong T�i Nguy�n Chi�n!" )
		--	return
		-- end
		
		local nExp = 200000
		
		-- Ch� t�ng 400.000 exp khi v�o c�c ng�y th� 6,7, CN
		if nWeek == 0 or nWeek == 5 or nWeek == 6 then -- th� s�u + th� b�y + ch� nh�t
			nExp = 400000
		end
		
		if nDate >= 110203 and nDate <= 110205 then
			nExp = 600000
		end
		
		ModifyExp(nExp)
		Msg2Player("Nh�n ���c "..nExp.." �i�m kinh nghi�m")
		WriteLogEx(szLogTitle, "S� d�ng bao l� x� th�nh c�ng")
		AddMonthlyEventFireworkAward(10)
		SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 1)
		
		SetTask(TSK_DAHONGBAO_201101_TIME, GetTime())
			
		local nIndex = random ( 1, getn(YANHUO_TABLE) )	
		DoFireworks ( YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3] )
		
		StartTimeGuage ("H�ng Bao", 30,0,1 )
	end
end

function AddMonthlyEventFireworkAward(nCount)
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110225 and nDate <= 110327 then
		gf_AddItemEx2({2, 1, 30287, nCount}, "Nguy�n li�u ", "Hoat dong thang 3 nam 2011", "s� d�ng bao l� x�")
	end
end