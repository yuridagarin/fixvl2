-- IP Bonus Created by TuanNA5

Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\golden_card\\npc_golden.lua") -- event Ho�ng Kim L�nh B�i
Include("\\script\\online\\viet_event\\bet_game\\bet_npc.lua") -- D� �o�n k�t qu� thi ��u
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua") -- IP Bonus 2011 (CSM)
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh.lua");
Include("\\script\\vng\\all_trangbi.lua");

szNpcName = "<color=green>Ch� Ph�ng M�y: <color>"

--szLogTitle = "NHAN THUONG MOI BAN"
--szLogTitle = "CHI TON VUONG LENH"
	tbTrangBiHaoNguyet_trangbi = {
		[2] = HaoNguyet_TLD,
		[3] = HaoNguyet_TLT,
		[4] = HaoNguyet_TLQ,
		[6] = HaoNguyet_DM,
		[8] = HaoNguyet_NMK,
		[9] = HaoNguyet_NMD,
		[11] = HaoNguyet_CBQ,
		[12] = HaoNguyet_CBB,
		[14] = HaoNguyet_VDK,
		[15] = HaoNguyet_VDB,
		[17] = HaoNguyet_DGT,
		[18] = HaoNguyet_DGC,
		[20] = HaoNguyet_5DD,
		[21] = HaoNguyet_5DT,
		[23] = HaoNguyet_CLTS,
		[29] = HaoNguyet_TYVT,
		[30] =HaoNguyet_TYLN,
	}
tbVBonusItemShop = {
		[1] = {"B�ch C�u Ho�n", {2,1,270,1,4}, 4, 2,5},
		[2] = {"Tam Thanh Ho�n", {2,1,1097,1,4}, 2, 2,6},
		[3] = {"L�c Th�n Ho�n", {2,1,1064,1,4}, 2, 2,7},
		[4] = {"Ng�i Sao May M�n", {2,1,30191,1,4}, 16, 2,8},
--		[5] = {"T� Linh Ti�n ��n", {2,1,30460,1,4}, 50, 2, 9},
	}
	-- table define: {ItemName, {G,D,P}, Prize, Quanlity, Position in Task}
	
	
function main()
	if IsIPBonus() == 1 then
		--IpBonusClose()
		--IpBonusStart()	
		--npc_talk()
	else
		Say(szNpcName.."Ho�t ��ng �� k�t th�c!",0)
	end
end


function npc_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%y%m%d%H"))
	local tSay = {
			"Nh�n th��ng t�ch l�y online/IpBonus",
			"Nh�n th��ng Vinh Danh T��ng S�/get_solider_glory",
			"Nguy�n So�i tuy�n b� chi�m ��ng th�nh th� n�y, ta mu�n l�m nhi�m v� qu�n ��i/do_military_job",
			"Thu h�i C�m Nang ��i S� Ki�n/get_camnang",
			"Ta ch� gh� qua/nothing",
	}
	if CheckVbonus() == 1 then
		tinsert(tSay,1,"Nh�n th��ng VBonus/VBonusMenu")
		tinsert(tSay,1,"Mua v�t ph�m Si�u �u ��i h�ng ng�y c�a VBonus/VBonusShop")
	end
	if nDate >= 20130401 and nDate < 20130405 then
		tinsert(tSay,1,"Nh�n th��ng N�p ZingXu tr�c tuy�n/VBonus_123Pay")
	end
	----------------------------------------------------------------------------------------------
--	if nDate >= 20091202 then
--		tinsert(tSay,1,"Nh�n th��ng Ho�ng Kim L�nh B�i/golden_award")
--	end
	--Ch� T�n V��ng L�nh
--	tinsert(tSay,1,"Ch� T�n V��ng L�nh/CTVL_first")
	-- ****************** Quay s� Ingame th�ng 12-2013******************
	if nDate >= 20131219 and nDate < 20140101 then
		tinsert(tSay,1,"Nh�n th��ng may m�n/lucky_award")
	end
	if nDate >= 20120314 and nDate <= 20120504 then
		tinsert(tSay, "Nh�n th��ng Huynh �� Th�m Giao /get_Invite")
	end
--	if nDate >= 20120611 and nDate <= 20120715 then
--		tinsert(tSay, "M� R��ng Th�n T�i ��n Phi�n B�n M�i/get_Invite")
	--end	
	
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	if nDate >= 20120907 and nDate <= 20121230 then
		if  nWeek == 0 then
			tinsert(tSay,1,"Ta mu�n nh�n Vinh Danh VIP JX2/vip_award")
		end
	end
	Say(szNpcName.."Ta chuy�n ph� tr�ch c�c ho�t ��ng nh�n th��ng. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end


function do_military_job()
	Talk(1,"",szNpcName.."Hi�n t�i th�nh n�y ch�a c� Nguy�n So�i n�o chi�m ��ng!")
end


function vip_award()
	local nValVipP = GetBit(GetExtPoint(0),1)
	local nValVipE = GetBit(GetExtPoint(0),2)
	if nValVipE ~= 1 and nValVipP ~= 1 then
		Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� kh�ng c� trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng r�i!")
		return 
	end	
	if nValVipP == 1 then
		if abs(GetTask(704)) ~= 6 then
			Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� kh�ng ph�i Nguy�n So�i n�n kh�ng th� nh�n th��ng ���c!")
			return 
		end
		if abs(GetTask(701)) < 880000 then
			Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� ph�i c� qu�n c�ng l�n h�n 880000 m�i c� th� nh�n th��ng ���c!")
			return 
		end
	end
	if gf_Judge_Room_Weight(10, 100," ") ~= 1 then
        	return
    end	
	if PayExtPoint(0, GetExtPoint(0)) == 1 then
		gf_AddItemEx2({2,1,30369,10,4},"C� Linh Th�ch","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,1,30368,10,4},"C� Linh Th�ch","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,95,204 ,1,1},"Thi�n Cang L�nh","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,1,30071,6,1},"Nh�n S�m V�n N�m","Tai khoan VIP 092012","nh�n")	
		gf_AddItemEx2({2,1,1125,6,4},"B�nh �t b�t b�o","Tai khoan VIP 092012","nh�n")		
		gf_AddItemEx2({2,1,30346,1,1},"M�nh B�ch Kim","Tai khoan VIP 092012","nh�n")				
		gf_WriteLogEx("Tai khoan VIP 2012", "Nh�n th�nh c�ng", 1, "Nh�n th��ng account VIP")		
		--gf_EventGiveCustomAward(2,10000000,0,"Tai khoan VIP","nh�n v�ng")
		--gf_EventGiveCustomAward(5,240*60,1,"Tai khoan VIP","nh�n BCH")
	end	
end


function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� l�nh th��ng!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� l�nh th��ng!")
		return
	end
	if gf_JudgeRoomWeight(2,100,szNpcName) == 0 then
		return
	end
	 local tGloryAwardExp = {	
		{240000,300000,1000000,0},
		{300001,350000,1300000,0},
		{350001,400000,1600000,1},
		{400001,450000,1900000,1},
		{450001,500000,2200000,2},
		{500001,550000,2500000,2},
		{550001,800000,3000000,3},
		{800000,9000000,3500000,3}	
	}
	local nBattlePoint = abs(GetTask(701))
	local nRank = 0
	for i=1,getn(tGloryAwardExp) do
		if tGloryAwardExp[i][1] <= nBattlePoint and nBattlePoint <= tGloryAwardExp[i][2] then
			nRank = i
			break
		end
	end
	if nRank <= 0 then
		Talk(1,"",szNpcName.."�i�m c�ng tr�ng c�a c�c h� ch�a �� �� l�nh th��ng!")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."H�m nay c�c h� �� l�nh th��ng 3 l�n r�i!")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "Vinh Danh Tuong Si","nh�n")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th�i D�ch H�n Nguy�n C�ng ��","Vinh Danh Tuong Si","nh�n")
	end
end


function get_award_for_hklb()
	local nExtVal = GetExtPoint(4)
	if nExtVal == 1 or nExtVal == 2 or nExtVal == 3 then
		local strItem = "1 ��nh H�n Thi�n Th�ch Th�n Th�ch"
		if nExtVal == 2 then
			strItem = "1 Thi�n Th�ch Linh Th�ch"
		elseif nExtVal == 3 then
			strItem = "2 Thi�n Th�ch Linh Th�ch"
		end
		Say(szNpcName.."Ch�c m�ng c�c h� �� tr�ng th��ng <color=yellow>"..strItem.."<color>, c� mu�n nh�n kh�ng?",2,"Ta mu�n nh�n!/get_award_for_hklb_confirm","Ch�a c�n/gf_DoNothing")	
	else
		Talk(1,"",szNpcName.."C�c h� kh�ng c� t�n trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng!")		
	end
end


function get_award_for_hklb_confirm()
	local nExtVal = GetExtPoint(4)
	if nExtVal == 1 or nExtVal == 2 or nExtVal == 3 then
		if gf_Judge_Room_Weight(3,100,szNpcName) == 0 then
			return
		end
		PayExtPoint(4,nExtVal)
	else
		return
	end
end


function get_camnang()
	local nCount = GetItemCount(2, 1, 30045)
	if nCount > 0 then
		DelItem(2, 1, 30045,nCount)
		Talk(1,"",szNpcName.."Thu h�i C�m Nang ��i S� Ki�n th�nh c�ng!")
	else
		Talk(1,"",szNpcName.."H�nh nh� ng��i kh�ng c� C�m Nang ��i S� Ki�n trong ng��i?")
	end
end


function lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	local tSay = {
		"Ta mu�n th� v�n may c�a m�nh/confirm_lucky_award",
		"Ta bi�t r�i/nothing",
	}
	Say(szNpcName.."Trong th�i gian t� <color=red>19/12/2013 - 31/12/2013<color>, khi qu� ��ng ��o th�c hi�n n�p ZingXu v� quy ��i sang Xu V� L�m Truy�n K� II th� s� nh�n ���c c�c l�n Quay S� Nh�n Th��ng trong game �� c� c� h�i nh�n ���c c�c ph�n th��ng may m�n � ch� ta. Hi�n t�i c�c h� c�n <color=yellow>"..nExtVal.."<color> l�n nh�n th��ng.",getn(tSay),tSay)
end


function confirm_lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."S� l�n nh�n th��ng may m�n c�a c�c h� kh�ng c�n.");
		return
	end
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	Msg2Player("�ang ti�n h�nh quay s�...")
--	CastState("state_fetter", 4 * 18)
	DoWait(13,14,3)	
end


function IpBonus()
	local tSay = {}
	tinsert(tSay, "Nh�n hi�u qu� h� tr� h�ng ng�y/buff_award")
	tinsert(tSay, "Nh�n th��ng m�i 1 gi� tr�n m�ng/online_award")
	tinsert(tSay, "Xem th�i gian t�ch l�y/show_time")
	tinsert(tSay, "T�m hi�u ho�t ��ng/get_help")
	tinsert(tSay, "Ta ch� gh� qua/nothing")	
	Say(szNpcName.."Th�i gian tr�n m�ng c�a c�c h� s� ���c t�ch l�y �� ��i nh�ng ph�n th��ng h�p d�n. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end


function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."Ch�a gia nh�p m�n ph�i kh�ng th� nh�n ���c ch�c n�ng h� tr�");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."H�m nay c�c h� �� nh�n ���c ch�c n�ng h� tr� r�i, kh�ng th� ti�p t�c nh�n th�m.");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	local nAttrId = 2600022;
	nRandAttr = gf_GetRandItemByTable(tBuff, 1000, 1);
	for i = 1, getn(tBuff[nRandAttr][3]) do
		CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId, 1);
		nAttrId = nAttrId + 1;
	end
	Say("Trong h�m nay c�c h� nh�n ���c hi�u qu� "..tBuff[nRandAttr][1],0)
	Msg2Player("B�n nh�n ���c hi�u qu� "..tBuff[nRandAttr][1]);
	
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end


function online_award()
	local tSay = {
		"\nNh�n ph�n th��ng s� c�p/get_low_award",
		--"\nNh�n ph�n th��ng trung c�p/get_med_award",
		"\nNh�n ph�n th��ng cao c�p/get_high_award",
		"\nNh�n ph�n th��ng Ho�ng Kim/#get_online_award(4,0)",
		"\nNh�n ph�n th��ng B�ch Kim/#get_online_award(5,0)",	--new
		"Ta ch� gh� qua/nothing",
	}
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_low_award()
	local tSay = {
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n)/#get_online_award(%d,%d)",1,0),
		--format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n)/#get_online_award(%d,%d)",1,1),
		--format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n + 1 gi� T� Linh Ho�n)/#get_online_award(%d,%d)",1,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n)/#get_online_award(%d,%d)",2,0),
		format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n)/#get_online_award(%d,%d)",2,1),
		format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,3),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n)/#get_online_award(%d,%d)",3,0),
	--	format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n)/#get_online_award(%d,%d)",3,1),
	--	format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n + 1 gi� T� Linh Ti�n ��n)/#get_online_award(%d,%d)",3,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- tr� 6  t��ng �ng v�i ph�n t� 1,2,3 trong b�ng th��ng
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	local nSmallTLH = GetTask(3105)
	
	local nBigBCH = GetTask(2507)
	local nBigLTH = EatLiushen(2,0)
	local nBigTTH = EatSanqin(2,0)
	local nBigTLH = GetTask(3106)
	
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	local nExBigTLH = GetTask(3107)
	
	if nType == 5 then
		if GetOnlineTime() < 1 * 3600 * 6 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 6 gi�!")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 1 gi�!")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 1 gi�!!!")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 1 gi�!!")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."T�nh n�ng t�m ��ng!")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
		return
	end
	if nType == 5 then
		if SetOnlineTime(3600 * 6,2) >= 0 then	
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
			SetTask(3105, nSmallTLH - 480,8)
			SetTask(3106, nBigTLH - 480,8)
			SetTask(3107, nExBigTLH - 480,8)
		
			ModifyExp(7900000)
			Msg2Player("B�n nh�n ���c 7.900.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online B�ch Kim ")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p exp ")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all ")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all & ch�n kh� ")		
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p exp ")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all ")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all & ch�n kh� ")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()
		elseif nType == 4 then
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
		
			ModifyExp(7200000)
			Msg2Player("B�n nh�n ���c 7.200.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Ho�ng Kim")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
			return
		end		
	end	
end

function day_award()
	local tSay = {
		format("Nh�n ph�n th��ng v�t ph�m thu th�p/#get_day_award(%d)",1),
		format("Nh�n ph�n th��ng v�t ph�m qu�n d�ng/#get_day_award(%d)",2),
		format("Nh�n ph�n th��ng T�ng Ki�m Anh H�ng Thi�p/#get_day_award(%d)",3),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end

function get_day_award(nType)
	Talk(1,"","T�nh n�ng nh�n th��ng �� ��ng ng�y l�u r�i")
	do return end
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))	
	if GetTask(TASK_GET_DAY_AWARD) == nDate then
		Talk(1,"IpBonus",szNpcName.."H�m nay c�c h� ��i ph�n th��ng n�y r�i. M�i ng�y ch� ���c ��i 1 l�n.")
		return
	end
	
	
	if GetTask(TASK_FULL_8_HOUR) ~= 1 then
		Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 8 gi�!")
		return
	end		

	if GetFreeItemRoom() < 2 then
		Talk(1,"IpBonus",szNpcName.."H�nh trang c�c h� kh�ng �� 2 � tr�ng.")
		return
	end	
	
	local nLevel = floor(GetLevel()/10) - 6 -- tr� 6  t��ng �ng v�i ph�n t� 1,2,3 trong b�ng th��ng		
	SetTask(TASK_GET_DAY_AWARD,nDate)
	SetTask(TASK_FULL_8_HOUR,2)
	local nRet, nItemIdx = gf_AddItemEx(tDayAward[nType][nLevel][2], tDayAward[nType][nLevel][1] )
	WriteLogEx("IP Bonus","nh�n","",tDayAward[nType][nLevel][1])			
	if nType == 3 and nRet == 1 then
		SetItemExpireTime(nItemIdx,2 * 24 * 3600)
	end
end

function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%sTh�i gian tr�n m�ng c�a c�c h� l�: <color=yellow>%d gi� %d ph�t %d gi�y<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function get_help()
	local tSay = {
		format("%sTh�i gian nh�n v�t tr�n m�ng s� ���c t�ch l�y li�n t�c. Nh�n v�t c� th� s� d�ng 2 gi�  tr�n m�ng �� ��i c�c lo�i ph�n th��ng. Ph�n th��ng bao g�m kinh nghi�m, danh v�ng, �i�m s� m�n v� v�ng. <color=red>Ch� �: n�u ch�n nh�n th��ng t�t c�, s� l��ng ph�n th��ng s� nhi�u h�n. M�i nh�n v�t ch� c� th� t�ch l�y ���c 8 gi� tr�n m�ng, sau khi ��i th��ng th� th�i gian ti�p t�c ���c t�ch l�y<color>.",szNpcName),
		format("%sN�u t�ch l�y �� 8 gi� tr�n m�ng, nh�n v�t c� th� ��i ���c c�c lo�i v�t ph�m thu th�p, v�t ph�m qu�n d�ng ho�c Anh H�ng Thi�p (kh�ng th� giao d�ch, h�n t�n t�i 2 ng�y). <color=red>Ch� �: m�i ng�y nh�n v�t ch� c� th� ��i 1 l�n<color>.",szNpcName),
		format("%sNgo�i ra, nh�n v�t c�n c� th� nh�n ���c hi�u qu� h� tr� ng�u nhi�n h�ng ng�y. <color=red>Ch� �: sau 24 gi� h�ng ng�y, hi�u qu� s� bi�n m�t. M�i ng�y nh�n v�t ch� c� th� nh�n hi�u qu� h� tr� 1 l�n<color>.",szNpcName),
	}
	TalkEx("IpBonus",tSay)
end

function nothing()
end

tbMoiBanCungChoi = {
	[1] = {{0, 100, 8055}, {0, 101, 8055},{0, 103, 8055}, "Set Thi�n Chi Vi�m ��"},
	[2] = {
				{"Ph� Y�n �ao", {0, 3, 6001,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Ph� Y�n c�n", {0, 5, 6002,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Ph� Y�n tr��ng", {0, 8, 6003,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H�m Y�n th�", {0, 0, 6004,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"T�ng Y�n ch�m", {0, 1, 6005,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Phi Y�n ki�m", {0, 2, 6006,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V�n Y�n c�m", {0, 10, 6007,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V�n Y�n th�", {0, 0, 6008,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"L�u Y�n c�n", {0, 5, 6009,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Huy�n Y�n ki�m", {0, 2, 6010,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V� Y�n b�t", {0, 9, 6011,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H� Ti�m Th��ng", {0, 6, 6012,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H�nh Y�n Cung", {0, 4, 6013,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Tr�c Y�n nh�n", {0, 7, 6014,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Y�u Y�n tr�o", {0, 11, 6015,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
			},
	[3] = {{2,1,9977,8}, "Qu�n c�ng Huy Ho�ng", 7*24*60*60},
	[4] = {{2,1,9998,8}, "Qu�n c�ng ��i", 7*24*60*60},
	[5] = {{2,1,30087,5}, "T�i h�t gi�ng", 7*24*60*60},
	[6] = {{2,1,1008,1}, "B�ch C�u Ti�n ��n", 7*24*60*60},
}
tbMoRuongThanTai = {
		[4] = {"T�i Thi�n Th�ch Tinh Th�ch",{2,1,3356,1}, 7*24*60*60 },
		[5] = {"Qu�n C�ng Huy Ho�ng",{2,1,9977,1}, 7*24*60*60 },
		[6] = {"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1}},
		[7] = {"Chi�m Y Ph�",{0,107,66,1}},
	}

function get_Invite()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n ph�n th��ng."
	
	tinsert(tbSayDialog, "- Nh�n 1 b� trang b� Thi�n Chi Vi�m �� [+10]/#get_TCVD_new(10)")
	tinsert(tbSayDialog, "- Nh�n 1 b� trang b� Vi�m �� [+13]/#get_VD(13)")
	tinsert(tbSayDialog, "- Nh�n 1 m�t t�ch cao c�p theo h� ph�i/#get_Award(3)")	
	tinsert(tbSayDialog, "- Nh�n 1 t�i Thi�n Th�ch Tinh Th�ch/#get_Award(4)")	
	tinsert(tbSayDialog, "- Nh�n 1 qu�n c�ng Huy Ho�ng/#get_Award(5)")	
	tinsert(tbSayDialog, "- Nh�n 1 Thi�n Th�ch Tinh Th�ch/#get_Award(6)")	
	tinsert(tbSayDialog, "- Nh�n 1 Chi�m Y Ph�/#get_Award(7)")	
	
	
	--tinsert(tbSayDialog, "- Nh�n 1 v� kh� Vi�t Y�n [+10]/get_vukhi")
	--tinsert(tbSayDialog, "- Nh�n 8 qu�n c�ng Huy Ho�ng/#get_prize(3)")
	--tinsert(tbSayDialog, "- Nh�n 8 qu�n c�ng ��i/#get_prize(4)")
	--tinsert(tbSayDialog, "- Nh�n 5 T�i h�t gi�ng/#get_prize(5)")
	--tinsert(tbSayDialog, "- Nh�n 1 B�ch C�u Ti�n ��n/#get_prize(6)")
	tinsert(tbSayDialog, "Ta ch� gh� qua/nothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_TCVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n ph�n th��ng."
	
	tinsert(tbSayDialog, "- Nam Ti�u Chu�n/#get_prize(1,1)")
	tinsert(tbSayDialog, "- Nam Kh�i Ng�/#get_prize(1,2)")
	tinsert(tbSayDialog, "- N� G�i C�m/#get_prize(1,3)")
	tinsert(tbSayDialog, "- Ki�u N�/#get_prize(1,4)")
	tinsert(tbSayDialog, "Tr� l�i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_vukhi()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n v� kh� c�n nh�n."
	
	tinsert(tbSayDialog, "- Ph� Y�n �ao/#get_prize(2,1)")
	tinsert(tbSayDialog, "- Ph� Y�n c�n/#get_prize(2,2)")
	tinsert(tbSayDialog, "- Ph� Y�n tr��ng/#get_prize(2,3)")
	tinsert(tbSayDialog, "- H�m Y�n th�/#get_prize(2,4)")
	tinsert(tbSayDialog, "- T�ng Y�n ch�m/#get_prize(2,5)")
	tinsert(tbSayDialog, "- Phi Y�n ki�m/#get_prize(2,6)")
	tinsert(tbSayDialog, "- V�n Y�n c�m/#get_prize(2,7)")
	tinsert(tbSayDialog, "- V�n Y�n th�/#get_prize(2,8)")
	tinsert(tbSayDialog, "- L�u Y�n c�n/#get_prize(2,9)")
	tinsert(tbSayDialog, "- Huy�n Y�n ki�m/#get_prize(2,10)")
	tinsert(tbSayDialog, "- V� Y�n b�t/#get_prize(2,11)")
	tinsert(tbSayDialog, "- H� Ti�m Th��ng/#get_prize(2,12)")
	tinsert(tbSayDialog, "- H�nh Y�n Cung/#get_prize(2,13)")
	tinsert(tbSayDialog, "- Tr�c Y�n nh�n/#get_prize(2,14)")
	tinsert(tbSayDialog, "- Y�u Y�n tr�o/#get_prize(2,15)")
	tinsert(tbSayDialog, "Tr� l�i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_prize(nGetType, nSelected)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if nGetType == 0 then
		return 0;
	end	
	if gf_Judge_Room_Weight(10, 500, "") == 0 then
        return 0;
    	end	
	if gf_GetExtPointByte(1,2) <= 0 then
		Talk(1, "", "��i hi�p ch�a k�ch ho�t code ho�c �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng ���c n�a!!!")
		return
	end
	if nGetType == 1 then
		if  gf_GetExtPointByte(1,2) == 1 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					nP = 8055 + nSelected - 1		
					gf_AddItemEx2({0, 100, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")	
					gf_AddItemEx2({0, 101, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")			
					gf_AddItemEx2({0, 103, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")													
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	
	if nGetType == 2 then
		if  gf_GetExtPointByte(1,2) == 2 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					local nChoose = tbMoiBanCungChoi[nGetType][nSelected][2]
					gf_AddItemEx2(nChoose, tbMoiBanCungChoi[nGetType][nSelected][1], szLogTitle, "nh�n th�nh c�ng")											
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	
	if nGetType == 3 then
		if  gf_GetExtPointByte(1,2) == 3 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 4 then
		if  gf_GetExtPointByte(1,2) == 4 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 5 then
		if  gf_GetExtPointByte(1,2) == 5 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 6 then
		if  gf_GetExtPointByte(1,2) == 6 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		end
	end
end
function Check_Award()
	local nValue = 0
	nValue = GetExtPoint(6)
	if nValue > 0 then
		return nValue
	end
	return 0
end
function get_VD(nLv)
	local VD =
	{
		{0,103,8000,"Vi�m �� Kh�i"},
		{0,100,8000,"Vi�m �� Gi�p"},
		{0,101,8000,"Vi�m �� Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 2 then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end	
	PayExtPoint(6, GetExtPoint(6))
	
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Mo Ruong Than Tai","nh�n th��ng VD th�nh c�ng")
	end
end
function get_TCVD_new(nLv)
	local TCVD =
	{
		{0,103,8054,"Thi�n Chi Vi�m �� Kh�i"},
		{0,100,8054,"Thi�n Chi Vi�m �� Gi�p"},
		{0,101,8054,"Thi�n Chi Vi�m �� Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 1 then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))
	for i = 1 , getn(TCVD) do
		gf_AddItemEx2({TCVD[i][1],TCVD[i][2],TCVD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},TCVD[i][4],"Mo Ruong Than Tai","nh�n th��ng TCVD th�nh c�ng")
	end
end
function get_Award(nType)
	local nCheck  = Check_Award()
	local nRoute = GetPlayerRoute()
	if nType == 3 then	
		if nRoute <= 0 then
			Talk(1, "", "��i hi�p ch�a gia nh�p h� ph�i n�n kh�ng th� nh�n th��ng !!!")
			return 0
		end
	end
	if nCheck ~= nType then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))

	if nType == 3 then
		gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], VET_70_GAOJIMIJI_NEW[nRoute][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng")
	elseif nType == 4 or nType == 5 then
		gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng", tbMoRuongThanTai[nType][3])
	elseif nType == 6 or nType == 7 then
			gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng")
	
	end
--tbMoRuongThanTai
end


function VBonusMenu()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	tinsert(tbSay,"K�ch ho�t c�p �� 81/ChonPheVBonus")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 83/#NhanThuongVBonus(83)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 86/#NhanThuongVBonus(86)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 89/#NhanThuongVBonus(89)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 91/#NhanThuongVBonus(91)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 96/#NhanThuongVBonus(96)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 98/#NhanThuongVBonus(98)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 99/#NhanThuongVBonus(99)")
	tinsert(tbSay,"Ta ch� gh� xem th�i/gf_DoNothing")
	Say(szNpcName .."Ta l� ng��i ch�u tr�ch nhi�m trao ph�n th��ng ch��ng tr�nh V-Bonus cho c�c h�", getn(tbSay), tbSay)
end


function ChonPheVBonus()
	tbSay = {}
	tinsert(tbSay, "Ta mu�n ch�n phe T�ng/#KichHoatVBonus(1)")
	tinsert(tbSay, "Ta mu�n ch�n phe Li�u/#KichHoatVBonus(2)")
	tinsert(tbSay, "Ta c�n suy ngh� th�m/gf_DoNothing")
	Say("C�c h� h�y ch�n cho m�nh phe ph�i th�ch h�p.", getn(tbSay), tbSay)
end


function KichHoatVBonus(nPhe)
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� ch�a ���c ch� ph�ng m�y k�ch ho�t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� h�t h�n nh�n th��ng.")
		return 0
	end
	if GetBit(nVB,3) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� k�ch ho�t c�p �� 81 r�i.")
		return 0
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."��i hi�p ch�a gia nh�p h� ph�i, ta kh�ng th� gi�p g� ���c...")
		return 0
	end
	if GetLevel() >= 81 then
		Talk(1,"",szNpcName.."��ng c�p c�c h� �� qu� cao, ta kh�ng th� gi�p g� ���c...")
		return 0
	end
--	if gf_Judge_Room_Weight(7,100) ~= 1 then
--		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
--		return 0
--	end
	
--	nVB = SetBit(nVB,3,1)
--	PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--	AddExtPoint(EXT_VBONUS, nVB)
	VNG_SetExtBit(EXT_VBONUS,3,1)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng k�ch ho�t")
	SetLevel(81,0)
	SetTask(336,GetTask(336) + 2000)
	Msg2Player("C�ng hi�n s� m�n t�ng 2000 �i�m.")
	ModifyReputation(2000,0)
	SetTask(TSK_nvVBonus, 1) --task x�c ��nh b�t ��u �� b�t l�m nhi�m v� VBonus
	if nPhe == 1 then
		SetTask(701,GetTask(701)+3000)
	else
		local nCongTrang = GetTask(701)
		nCongTrang = -nCongTrang
		SetTask(701,nCongTrang-3000)
	end
	Msg2Player("C�ng tr�ng t�ng 3000 �i�m.")
--	local tbItem = {item={{gdp={2,1,30340,6789}, name = "M�c R��ng"}}}
--	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
--	LIB_Award.szLogAction = "nh�n"
--	LIB_Award:Award(tbItem)
	Talk(1,"","��ng c�p c�a c�c h� �� t�ng ��n 81, vui l�ng ��ng nh�p l�i �� c� hi�u l�c.")
end


function TopCheckSkill(nSkillLevel)
	tb_Skill_ID = {
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[29] = 1196,
		[30] = 1230,
	}
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;


function VBonusShop()
	local nDate = tonumber(date("%m%d"))
	if mod(tonumber(GetTask(TSK_VBONUS_SaleOff)),10000) ~= nDate then
		SetTask(TSK_VBONUS_SaleOff, nDate)
	end
	local tbSay = {}
	for i=1,getn(tbVBonusItemShop) do
		tinsert(tbSay, "Mua "..tbVBonusItemShop[i][1].." ("..tbVBonusItemShop[i][3].." xu v�t ph�m)/#VBonusShop_Buy("..i..")")
	end
	tinsert(tbSay,"Ta ch� mu�n gh� xem/gf_DoNothing")
	Say(szNpcName.."Ta c� l� h�ng gi� ��c bi�t, ch� d�nh ri�ng cho b�ng h�u �� k�ch ho�t VBonus, c�c h� h�y xem th�...", getn(tbSay), tbSay)
end


function VBonusShop_Buy(nOption)
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName.."Ch� c� b�ng h�u tham gia ch��ng tr�nh VBonus m�i ���c mua l� h�ng n�y.");
		return 0
	end
	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
		return 0
	end
	local szName = tbVBonusItemShop[nOption][1]
	local tbItem = tbVBonusItemShop[nOption][2]
	local nPrize = tbVBonusItemShop[nOption][3]
	local nMax = tbVBonusItemShop[nOption][4]
	local nPos = tbVBonusItemShop[nOption][5]
	local nQty = GetTaskPosition(TSK_VBONUS_SaleOff, nPos)
	if nQty >= nMax then
		Talk(1,"",szNpcName.."B�ng h�u �� mua �� <color=red>"..nMax.."<color> <color=yellow>"..szName.."<color> trong ng�y, mai h�y quay l�i nh�.");
		return 0
	end
	if GetItemCount(2,1,30230) < nPrize then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �em �� <color=yellow>"..nPrize.." xu v�t ph�m<color>, h�y chu�n b� th�m.");
		return 0
	end
	
	if DelItem(2,1,30230, nPrize) == 1 then
		gf_AddItemEx2(tbItem, szName,"MUA VAT PHAM VBONUS","nh�n", 7*24*60*60)
		SetTaskPosition(TSK_VBONUS_SaleOff, nPos, nQty+1)
	end
end


function GetTaskPosition(nTask, nPosition)
	if nPosition <= 0 then
		return
	end
	local nTaskValue = GetTask(nTask)
	local nResult = floor(nTaskValue/(10^(nPosition-1)))
	return mod(nResult,10)
end


function SetTaskPosition(nTask, nPosition, nValue)
	if nPosition <= 0 then
		return
	end
	if nValue > 9 or nValue < 0 then
		return
	end
	local nTaskValue = GetTask(nTask)
	local nResult = floor(nTaskValue/(10^nPosition))*(10^nPosition) + nValue*(10^(nPosition-1)) + mod(nTaskValue,(10^(nPosition-1)))
	SetTask(nTask, nResult)
	return 1
end


function NhanThuongVBonus(nOption)
	local tbAwardList = {
		[83] = {fn = "VBonus_NhanThuong83()", nChankhi = 5000},
		[86] = {fn = "VBonus_NhanThuong86()", nChankhi = 10000},
		[89] = {item={{gdp={0,105,10107,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Thi�u D��ng Ki�m", nExpired = 14*24*60*60}}, fn = "VBonus_NhanThuong89()", nPetExp = 300, nChankhi = 15000},
		[91] = {item={{gdp={2,1,1068,1,4}, name = "Thi�n Th�ch Linh Th�ch", nExpired = 30*24*60*60}}, nPetExp = 300, nPetLinhluc = 200, nChankhi = 15000},
		[96] = {item={{gdp={2,1,1067,1,4}, name = "��nh h�n thi�n th�ch", nExpired = 30*24*60*60}},nPetExp = 300, nPetLinhluc = 200, nChankhi = 20000},
		[98] = {item={
								{gdp={2,0,1082,1000}, name = "M�nh Th�i D�ch"},
								{gdp={2,1,9977,2,4}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 7*24*60*60},
							}
							, nChankhi = 20000, nGold = 10000000},
		[99] = {item={
					{gdp={2,1,30345,1,1}, name = "Chuy�n Sinh ��n", nExpired = 60*24*3600},
					{gdp={2,1,1113,1,4}, name = "��i ��nh H�n", nExpired = 30*24*60*60},
				},
				fn = "VBonus_NhanThuong99()"}
	}
	if tbAwardList[nOption] == nil then
		return 0
	end
	
	local tbCondition = {
		[83] = {nPos = 4, nSlot = 6, nWeight = 300},
		[86] = {nPos = 5, nSlot = 6, nWeight = 300},
		[89] = {nPos = 6, nSlot = 6, nWeight = 300},
		[91] = {nPos = 7, nSlot = 6, nWeight = 300},
		[96] = {nPos = 8, nSlot = 6, nWeight = 300},
		[98] = {nPos = 9, nSlot = 6, nWeight = 300},
		[99] = {nPos = 10, nSlot = 6, nWeight = 300},
	}
	local tbTaskCondition = {
		[83] = {1},
		[86] = {2},
		[89] = {3},
		[91] = {4},
		[96] = {5},
		[98] = {6},
		[99] = {7},
	}
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� ch�a ���c ch� ph�ng m�y k�ch ho�t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� h�t h�n nh�n th��ng.")
		return 0
	end
	if GetBit(nVB,tbCondition[nOption]["nPos"]) == 1 then
		Talk(1,"",szNpcName .."C�c h� �� nh�n th��ng c�p �� ".. nOption .." r�i.")
		return 0
	end
	if GetLevel() < nOption then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �� ��ng c�p nh�n th��ng, h�y c� g�ng th�m.");
		return 0
	end
	vb_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
	local nRoute = GetPlayerRoute()
	if vb_tbRoute [nRoute] ~= 1 then
		Talk(1, "", " Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return 0
	end
	local nTaskNhiemVu_check = mod(GetTask(TSK_nvVBonus),10)	
	if nTaskNhiemVu_check ~= tbTaskCondition[nOption][1] then
		Talk(1,"",szNpcName.."B�ng h�u ch�a nh�n th��ng c�p tr��c ��.");
		return 0
	end
	if nOption == 99  then
		if TopCheckSkill(20) == 0 then
			Talk(1, "", szNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
			return 0
		end
		if abs(GetTask(701)) < 180000 then
			Talk(1, "", szNpcName.."�i�m c�ng tr�ng ch�a �� 180000, ch�a th� nh�n th��ng..");
			return 0
		end
		if GetReputation() < 15000 then
			Talk(1, "", szNpcName.."�i�m danh v�ng ch�a �� 15000, ch�a th� nh�n th��ng..");
			return 0
		end
		if GetTask(336) < 15000 then
			Talk(1, "", szNpcName.."�i�m s� m�n ch�a �� 15000, ch�a th� nh�n th��ng..");
			return 0
		end
	end
	if nOption >= 88  then
		if TopCheckSkill(10) == 0 then
			Talk(1, "", szNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 10 c�p.");
			return 0
		end
	end
	if gf_Judge_Room_Weight(tbCondition[nOption]["nSlot"], tbCondition[nOption]["nWeight"]) ~= 1 then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �� ".. tbCondition[nOption]["nSlot"] .." � h�nh trang, "..tbCondition[nOption]["nWeight"].." s�c l�c, h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheckNV = check_nhiemvu(nOption) 
	if nCheckNV ~= 1 then
		return 0
	end
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	
	SetTask(TSK_nvVBonus, nTaskNhiemVu + 1) -- settask x�c nh�n l�m nhi�m v� th�m 1 �� l�m nhi�m v� m�i cho nh�n th��ng level ti�p
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAwardList[nOption])
--	if nOption ~= 86 then
--		nVB = SetBit(nVB,tbCondition[nOption]["nPos"],1)
--		PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--		AddExtPoint(EXT_VBONUS, nVB)
		VNG_SetExtBit(EXT_VBONUS,tbCondition[nOption]["nPos"],1)
--	end
	if nOption ~= 83 and nOption ~= 86 and nOption ~= 99 then
		gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p "..nOption)
	end
end

function VBonus_NhanThuong83()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiHaoNguyet_trangbi[nRoute]
	LIB_Award:AwardByBody(tbAward)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 83")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 83.")
end

function VBonus_NhanThuong86()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet_trangbi)	
	LIB_Award:AwardByRoute(tbNgocBoiCuuChau)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 86")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 86.")
end

function VBonus_NhanThuong86_old()	--Vbonus c�
	local tbSay = {}
	tinsert(tbSay,"Thi�n Ngh�a C�u D��ng/#NhanThuongThienNghia(1)")
	tinsert(tbSay,"Thi�n Ngh�a C�u �m/#NhanThuongThienNghia(2)")
	tinsert(tbSay,"�� ta suy ngh� th�m/gf_DoNothing")
	Say(szNpcName .."Ng��i h�y ch�n cho m�nh b� trang b� th�ch h�p.", getn(tbSay), tbSay)
end

function VBonus_NhanThuong89()
	local tbMatTich = {
		[2] = {item={{gdp={0, 112, 101, 1}}}},
		[4] = {item={{gdp={0, 112, 102, 1}}}},		
		[3] = {item={{gdp={0, 112, 103, 1}}}},		
		[6] = {item={{gdp={0, 112, 104, 1}}}},		
		[8] = {item={{gdp={0, 112, 105, 1}}}},		
		[9] = {item={{gdp={0, 112, 106, 1}}}},		
		[11] = {item={{gdp={0, 112, 107, 1}}}},		
		[12] = {item={{gdp={0, 112, 108, 1}}}},		
		[14] = {item={{gdp={0, 112, 109, 1}}}},		
		[15] = {item={{gdp={0, 112, 110, 1}}}},		
		[17] = {item={{gdp={0, 112, 111, 1}}}},		
		[18] = {item={{gdp={0, 112, 112, 1}}}},		
		[20] = {item={{gdp={0, 112, 113, 1}}}},		
		[21] = {item={{gdp={0, 112, 114, 1}}}},
		[23] = {item={{gdp={0,112,192,1}}}},
		[29] = {item={{gdp={0,112,196,1}}}},
		[30] = {item={{gdp={0,112,197,1}}}},
	}
	local nRoute = GetPlayerRoute()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"	
	LIB_Award:Award(tbMatTich[nRoute])
end
function VBonus_NhanThuong99()
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	if tbVuKhiChienCuong[nBody] == nil or tbVuKhiChienCuong[nBody][nRoute] == nil then
			return 0
		end
	tbNewItem = tbVuKhiChienCuong[nBody]
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbNewItem)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 99")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 99.")
	
end

function NhanThuongThienNghia_old(nOption)
	local tbNuOaTinhThach = {item={{gdp={2,1,504,6,4}, name = "N� Oa Tinh Th�ch	", nExpired = 30*24*60*60}}}
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	
	local tbThienNghia2_B1 = {item = {
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B2 = {item = {
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B3 = {item = {
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B4 = {item = {
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghiaSet2 = {
		[1] = tbThienNghia2_B1,
		[2] = tbThienNghia2_B2,
		[3] = tbThienNghia2_B3,
		[4] = tbThienNghia2_B4,
	}
	local nVB = GetExtPoint(EXT_VBONUS)
--	nVB = SetBit(nVB,4,1)
--	PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--	AddExtPoint(EXT_VBONUS, nVB)
	VNG_SetExtBit(EXT_VBONUS, 4, 1)
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	if nOption == 1 then
		LIB_Award:AwardByBody(tbThienNghiaSet1)
	else
		LIB_Award:AwardByBody(tbThienNghiaSet2)
	end
	LIB_Award:Award(tbNuOaTinhThach)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 86")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 86.")
end


function VBonus_NhanThuong93()
	local tbNgocBoi = {item={
			{gdp={0,102,3122,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Huy�n Th�ch Kim Ng�c"},
			{gdp={0,102,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Ph� Th�y Ng�c ��i"},
			{gdp={0,102,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Nguy�t Hoa Th�y B�i"},
			{gdp={0,102,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- C�u �u H�a Gi�i"},
			{gdp={0,102,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Ng�ng Ng�c Th� Ho�n"},
		},
	}
	local tbThieuLamDao = {item={{gdp={0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-L�u Ly Gi�i �ao"}}}
	local tbThieuLamQuyen = {item={{gdp={0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-L�i �m Nang Th�"}}}
	local tbThieuLamTruong = {item={{gdp={0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Kinh L�i Thi�n Tr��ng"}}}
	local tbDuongMon = {item={{gdp={0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-�m D��ng Xuy�n �nh"}}}
	local tbNgaMyKiem = {item={{gdp={0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-T� H�n �m Ki�m"}}}
	local tbNgaMyDan = {item={{gdp={0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-C�u Ho�n B�i C�m"}}}
	local tbCaiBangQuyen = {item={{gdp={0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Quy L�n H� Th�"}}}
	local tbCaiBangBong = {item={{gdp={0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Tr�n Ng�o C�n"}}}
	local tbVoDangKiem = {item={{gdp={0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Thu�n Phong Ki�m"}}}
	local tbVoDangBut = {item={{gdp={0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Tinh ��u Chuy�n B�t"}}}
	local tbDuongGiaThuong = {item={{gdp={0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Ph� Qu�n Tr�n Th��ng"}}}
	local tbDuongGiaCung = {item={{gdp={0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Truy M�nh Cung"}}}
	local tbNguDocCoSu = {item={{gdp={0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Luy�n H�n Huy�t Tr�o"}}}
	local tbNguDocTaHiep = {item={{gdp={0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Thi�p C�t Huy�t �ao"}}}	
	local tbConLonThienSu = {item={{gdp={0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Ng� Thi�n Phong Ki�m"}}}	
	local tbThuyYenVuTien = {item={{gdp={0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Linh Lung Chi"}}}
	local tbThuyYenLinhNu = {item={{gdp={0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-C�u Ti�u S�o"}}}
	local tbVuKhiThienNghia = {
		[2] = tbThieuLamDao,
		[3] = tbThieuLamTruong,
		[4] = tbThieuLamQuyen,
		[6] = tbDuongMon,
		[8] = tbNgaMyKiem,
		[9] = tbNgaMyDan,
		[11] = tbCaiBangQuyen,
		[12] = tbCaiBangBong,
		[14] = tbVoDangKiem,
		[15] = tbVoDangBut,
		[17] = tbDuongGiaThuong,
		[18] = tbDuongGiaCung,
		[20] = tbNguDocTaHiep,
		[21] =tbNguDocCoSu,
		[23] = tbConLonThienSu,
		[29] = tbThuyYenVuTien,
		[30] = tbThuyYenLinhNu,
	}
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbNgocBoi);
	LIB_Award:AwardByRoute(tbVuKhiThienNghia)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 93")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 93.")
end
--==nhi�m v� VBonus

--Task nhi�m v� VBonus: TSK_nvVBonus =
	tbVBonus = {	--nType = 1:H�t gi�ng, 2:BNN, 3:TMT, 4:T� Linh, 5:TNC, 6:Th�i h�, 7:C�ng T�, 8:Th�y l�i, 9:Ng�i sao, 10:N� oa, 11:nv S� m�n, 12:LSB, 13:Tr� an, 14:Nh�n m�n quan, 15: B�o v� th�nh tr�, 16:Luy�n ��n
					[1] = {83, 16, 16, 3}, --lev, h�t gi�ng, BNN, TMT
					[2] = {86, 8, 3, 1}, --lev, t� linh, TNC, Th�i h�
					[3] = {89, 3, 1}, --lev, c�ng t�, th�y l�i
					[4] = {91, 16, 100, 3},
					[5] = {96, 3, 3},
					[6] = {98, 1, 1, 3},
					[7] = {99, 1},
					}
					
function nhiemvuVBonus(nType)
	if CheckVbonus() ~= 1 then
		return 0
	end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)
	if nTaskNhiemVu >= 8 then
		Talk(1, "", "��i hi�p �� nh�n h�t ph�n th��ng c�a VBonus")
		return 0
	end	
	if nTaskNhiemVu == 1 then
		nhiemvu83(nType)
	elseif nTaskNhiemVu == 2 then
		nhiemvu86(nType)
	elseif nTaskNhiemVu == 3 then
		nhiemvu89(nType)
	elseif nTaskNhiemVu == 4 then
		nhiemvu91(nType)
	elseif nTaskNhiemVu == 5 then
		nhiemvu96(nType)
	elseif nTaskNhiemVu == 6 then
		nhiemvu98(nType)
	elseif nTaskNhiemVu == 7 then
		nhiemvu99(nType)
	end
end

function check_nhiemvu(nLevel)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)						
	if nLevel == 83 and nTaskNhiemVu == 1 then
		local nHatGiong = VNG_GetTaskPos(TSK_nvVBonus,3,2)
		local nBNN = VNG_GetTaskPos(TSK_nvVBonus,5,4)
		local nTMT = VNG_GetTaskPos(TSK_nvVBonus,6,6)
		if nHatGiong < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 16 h�t gi�ng")
			return 0
		end
		if nBNN < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 16 c�y b�t nh� nh�")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng �� 3 l�n Thi�n M�n Tr�n")
			return 0
		end
		return 1
	end
	if nLevel == 86 and nTaskNhiemVu == 2 then
		local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
		if nTulinh < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 8 c�y T� Linh")
			return 0
		end
		if nTNC < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 l�n nhi�m v� T�i Nguy�n Chi�n")
			return 0
		end
		if nThaiHu < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh �i 8 Th�i H� Huy�n c�nh")
			return 0
		end
		return 1	
	end
	if nLevel == 89 and nTaskNhiemVu == 3 then
		local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nCungTe < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� C�ng T�")
			return 0
		end
		if nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh nhi�m v� Th�y L�i")
			return 0
		end
		return 1
	end
	if nLevel == 91 and nTaskNhiemVu == 4 then
		local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
		local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
		local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)	
		if nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a s� d�ng �� 16 ng�i sao")
			return 0
		end	
		if nNuOa < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a s� d�ng �� 100 n� oa b�o h�p")
			return 0
		end
		if nSuMon < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh �� 3 nhi�m v� s� m�n")
			return 0
		end	
		return 1
	end
	if nLevel == 96 and nTaskNhiemVu == 5 then
		local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nLuongSon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� L��ng S�n B�c")
			return 0
		end
		if nTriAn < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� Tr� An")
			return 0
		end
		return 1
	end
	if nLevel == 98 and nTaskNhiemVu == 6 then
--		local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--		if nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng Nh�n M�n Quan")
--			return 0
--		end
		if nThanhTri < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng B�o V� Th�nh Tr�")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng 3 l�n Thi�n M�n Tr�n")
			return 0
		end
		return 1
	end
	if nLevel == 99 and nTaskNhiemVu == 7 then
		local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)	
		if nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 1 l�n Luy�n ��n")
			return 0
		end
		return 1
	end	
	return 0
end
function nhiemvu83(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	--TSK_nvVBonus: dccbba: a:nhi�m v�; bb: h�t gi�ng; cc: BNN; d: TMT
	if nTaskNhiemVu < 1 or nTaskNhiemVu > 1 then
		Talk(1, "", "C� l�i nhi�m v� c�p 83")
		return 0
	end
	local nHatGiong = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nBNN = VNG_GetTaskPos(TSK_nvVBonus,5,4)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,6,6)
	if nType == 1 and nHatGiong < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nHatGiong + 1,3,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: h�t gi�ng")
	end
	if nType == 2 and nBNN < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nBNN + 1,5,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: BNN")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,6,6)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TMT")
	end
end

function nhiemvu86(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhi�m v�; b: c�y t� linh; c: TNC; d: Th�i h�
	if nTaskNhiemVu < 2 or nTaskNhiemVu > 2 then
		Talk(1, "", "C� l�i nhi�m v� c�p 86")
		return 0
	end
	local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
	if nType == 4 and nTulinh < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nTulinh + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: c�y t� linh")
	end
	if nType == 5 and nTNC < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTNC + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TNC")
	end
	if nType == 6 and nThaiHu < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nThaiHu + 1,4,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: th�i h�")
	end
end

function nhiemvu89(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: cba: a:nhi�m v�; b: c�ng t�; c: Th�y l�i
	if nTaskNhiemVu < 3 or nTaskNhiemVu > 3 then
		Talk(1, "", "C� l�i nhi�m v� c�p 89")
		return 0
	end
	local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 7 and nCungTe < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nCungTe + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: c�ng t�")
	end
	if nType == 8 and nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThuyLoi + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Th�y l�i")
	end
end

function nhiemvu91(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: dcccbba: a:nhi�m v�; bb: ng�i sao; ccc: N� oa; d: s� m�n
	if nTaskNhiemVu < 4 or nTaskNhiemVu > 4 then
		Talk(1, "", "C� l�i nhi�m v� c�p 91")
		return 0
	end
	local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
	local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)
	if nType == 9 and nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nNgoiSao + 1,3,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Ng�i sao")
	end
	if nType == 10 and nNuOa < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nNuOa + 1,6,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: N� oa")
	end
	if nType == 11 and nSuMon < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nSuMon + 1,7,7)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: S� m�n")
	end
end

function nhiemvu96(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: cba: a:nhi�m v�; b: L��ng S�n; c: Tr� An
	if nTaskNhiemVu < 5 or nTaskNhiemVu > 5 then
		Talk(1, "", "C� l�i nhi�m v� c�p 96")
		return 0
	end
	local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 12 and nLuongSon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuongSon + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: LSB")
	end
	if nType == 13 and nTriAn < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTriAn + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: tr� an")
	end
end

function nhiemvu98(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhi�m v�; b: Nh�n m�n; c: Th�nh Tr�; d:TMT
	if nTaskNhiemVu < 6 or nTaskNhiemVu > 6 then
		Talk(1, "", "C� l�i nhi�m v� c�p 98")
		return 0
	end
--	local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--	if nType == 14 and nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--		VNG_SetTaskPos(TSK_nvVBonus, nNhanMon + 1,2,2)
--		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
--		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Nh�n m�n")
--	end
	if nType == 15 and nThanhTri < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThanhTri + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: th�nh tr�")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,4,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TMT")
	end
end

function nhiemvu99(nType)
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: ba: a:nhi�m v�; b: Luy�n ��n
	if nTaskNhiemVu < 7 or nTaskNhiemVu > 7 then
		Talk(1, "", "C� l�i nhi�m v� c�p 99")
		return 0
	end
	local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	if nType == 16 and nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuyenDon + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: luy�n ��n")
	end
end