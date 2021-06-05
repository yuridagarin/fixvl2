Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

szLogTitle = "Phao hoa CNDSK 2013"

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

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

function use_firework(nItemIndex, nType)
	VietResetDate()
	local nDate = tonumber( date( "%y%m%d" ) ) --101116

	-- hai s� cu�i c�a task FIREWORK_CNDSK_USE l� s� l�n s� d�ng trong ng�y
	local nCurDate = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 9, 4)	--floor ( GetTask( FIREWORK_CNDSK_USE ) / 1000 ) -- l�y 6 s� ��u ti�n
		
	
	-- th�c hi�n reset s� l�n s� d�ng trong ng�y v� th�i gian gi�n c�ch s� d�ng . n�u kh�ng ph�i l� ng�y hi�n t�i
	if nCurDate ~= nDate then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, nDate, 9, 4)		--Reset ng�y s� d�ng--SetTask ( FIREWORK_CNDSK_USE, nDate * 1000 )
		SetTask ( FIREWORK_CNDSK_TIME, 0 )
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 2, 1)		--Reset s� l�n s� d�ng trong ng�y
--		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 3, 3) 	--Reset gi� tr� x�c ��nh x2 kinh nghi�m t�n 139 v�ng
	end
	
	local nCheck_kichhoat = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3)		
	if nType == 1 then
		if nCheck_kichhoat ~= 1 then
			if GetCash() < 1390000 then
				Talk(1, "", "��i hi�p kh�ng c� �� 139 v�ng �� th�c hi�n nh�n ��i �i�m kinh nghi�m !!!!")
				return
			end
			Pay(1390000)
			VNG_SetTaskPos(FIREWORK_CNDSK_USE, 1, 3, 3) 	--Set gi� tr� x�c ��nh x2 kinh nghi�m t�n 139 v�ng
			Msg2Player("��i hi�p ti�u hao 139 v�ng �� ���c nh�n ��i �i�m kinh nghi�m khi ��t ph�o hoa")
			gf_WriteLogEx(szLogTitle, "th�nh c�ng", 1, "Ti�u 139 v�ng ���c x2 kinh nghi�m")	
		end	
	elseif nType == 2 then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 2, 3, 3) 	--Set gi� tr� x�c ��nh kh�ng x2 kinh nghi�m 
	end			
	-- Gi�i h�n ph�o hoa s� d�ng � m�t s� map
	-- local nPos = GetWorldPos()
	-- if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
	--	Talk ( 1, "", "Ch� c� th� s� d�ng ph�o hoa t�i Tuy�n Ch�u, D��ng Ch�u, chi�n tr��ng Nh�n M�n Quan, S�t Th� ���ng v� trong T�i Nguy�n Chi�n!" )
	--	return
	-- end
	
	-- ki�m tra lev nh�n v�t >=73
	if GetLevel () < 73 then
		Talk ( 1, "", "��ng c�p 73 tr� l�n m�i c� th� ��t ph�o hoa!" )
		return
	end
	
	-- ki�m tra nh�n v�t c� gia nh�p m�n ph�i ch�a
--	if ( GetPlayerRoute() == 0 )  then
--		Talk ( 1, "" , "Thi�u hi�p ch�a v� m�n ph�i n�n kh�ng th� s� d�ng ph�o hoa" )
--		return
--	end
--	
--	-- ki�m tra nh�n v�t ph�i c� skill 55
--	if gf_Check55HaveSkill() == 0 then
--		Talk(1, "", "Ph�i c� k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng n�y!")
--		return
--	end
	
	-- Vu�t qu� s� l�n s� d�ng --> tho�t 	
	local nCount = mod ( GetTask(FIREWORK_CNDSK_USE), 100 ) 
	
	local nMaxDay = 60
	if nCount >= nMaxDay then
		Talk(1, "", "H�m nay thi�u hi�p �� d�ng qu� nhi�u ph�o hoa r�i, ch�ng c�n ph�o cho thi�u hi�p n�a ��u. H�y quay l�i v�o ng�y mai!")
		return
	end
	
	-- Th�i gian gi�n c�ch ��t ph�o hoa 90 gi�y
	local nDif = 90 - ( GetTime() - GetTask ( FIREWORK_CNDSK_TIME ) )
	
	if nDif > 0 then
		Talk(1, "", "Thi�u hi�p ph�i ch� "..nDif.." gi�y n�a m�i c� th� ti�p t�c ��t ph�o hoa!")
		return
	end
	
	if gf_JudgeRoomWeight(3, 50) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0
	end
	
	local nExp = 300000
	local nWeek = tonumber ( date ("%w") ) -- tr� v� ng�y trong tu�n
	
	-- Ch� t�ng 600.000 exp khi v�o c�c ng�y th� 6,7, CN  trong c� 3 m�c th�i gian
	if nWeek == 0 or nWeek == 5 or nWeek == 6  then 
		nExp = 600000
	end
				
	-- Th� 5, 6, 7, CN t�ng V� L�m B�o H�p
	if nDate <= 101226 and (nWeek == 0 or nWeek ==4 or nWeek == 5 or nWeek == 6) and mod(nCount, 2) == 1 then
		gf_AddItemEx2({2, 1, 30132, 1}, "V� L�m B�o H�p", "Vo Lam Bao Hap", "��t ph�o hoa nh�n th��ng")
	end

	if nItemIndex ~= nil then
		if DelItemByIndex(nItemIndex,1) ~= 1 then
			return
		end
	end
--	local nExpChanKhi = 15
--	if nCount == 39 or nCount == 79 or nCount == 119 then
--		AwardGenuineQi(nExpChanKhi)
--		--Msg2Player("Nh�n ���c "..nExpChanKhi.." �i�m ch�n kh�")
--		gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� ph�o hoa")		
--	end

	if VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3) == 1 then -- x2 kinh nghi�m khi kick ho�t x2
		nExp = nExp * 2
	end
	ModifyExp(nExp)
	Msg2Player("Nh�n ���c "..nExp.." �i�m kinh nghi�m")
	--- �i�m V�n May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExp
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--	else
--		Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--	end
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 21 then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	---------		
	Use_Award_PhaoHoa()
	--SetTask(336, GetTask(336) + 4)
	--Msg2Player("Nh�n ���c 4 �i�m S� M�n")
	--ModifyReputation(4, 0)
	--Msg2Player("Nh�n ���c 4 �i�m Danh V�ng")
	
	--WriteLogEx(szLogTitle, "S� d�ng ph�o hoa th�nh c�ng")
	if nCount == 99 then
		gf_WriteLogEx(szLogTitle, "kick ho�t th�nh c�ng", 1, "S� d�ng MAX ph�o hoa")
	end
	gf_WriteLogEx(szLogTitle, "kick ho�t th�nh c�ng", 1, "S� d�ng ph�o hoa th�nh c�ng")
	
	-- l�u task FIREWORK_CNDSK_USE (s� l�n s� d�ng ph�o hoa trong m�t ng�y) 
	-- 10111500 --> ng�y 15-11-2010 , ch�a s� d�ng
	-- 10111602 --> ng�y 16-11-2010 , s� d�ng 2 l�n	
	SetTask(FIREWORK_CNDSK_USE, GetTask(FIREWORK_CNDSK_USE) + 1)
	
	-- l�u l�i l�n s� d�ng ph�o hoa hi�n t�i
	SetTask(FIREWORK_CNDSK_TIME, GetTime())
	
	--set d�ng s� d�ng ph�o hoa
--	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 0 then
--		SetTask(TSK_ACTIVE_VIP_PHAOHOA, 2)
--	end
	-- khi s� d�ng ph�o hoa s� xu�t hi�n h�nh ph�o hoa
	local nIndex = random ( 1, getn(YANHUO_TABLE) )	
	DoFireworks ( YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3] )
	
	-- Hi�n thanh progress bar 1 ph�t 30 gi�y sau khi s� d�ng ph�o hoa m�i c� th� s� d�ng l�i l�n n�a
	StartTimeGuage ("Ph�o hoa", 90,0,1 )
end
