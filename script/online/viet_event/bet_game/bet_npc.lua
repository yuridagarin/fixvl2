-- C� �� BHTA l�n 3
-- Created by TuanNA5

Include("\\script\\online\\viet_event\\bet_game\\bet_head.lua")

function bet_select()
	if GetLevel() < 73 then
		Say(szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!",0)
		return
	end
	local tSay = {
--		"\nTham gia d� �o�n k�t qu� Bang H�i Tinh Anh l�n 3/bet_join",
		"\nNh�n th��ng d� �o�n k�t qu� Bang H�i Tinh Anh l�n 3/bet_prize",
		"\nNh�n Ti�n L� �� tr�ng th��ng (t�i �a 1000 Ti�n L� 1 l�n)/get_silver_win",
		"\nTa bi�t r�i/gf_DoNothing",
	}
	Say(szNpcName.."Nh�n d�p <color=yellow>Bang H�i Tinh Anh l�n 3<color>, ta t� ch�c cu�c thi d� �o�n k�t qu� cho c�c b�ng h�u g�n xa tham d�. C�c b�ng h�u c� th� ��t nhi�u nh�t <color=yellow>100 Ti�n L�<color> cho m�i k�t qu� d� �o�n. Sau b�o tr� th� t� h�ng tu�n c�c b�ng h�u c� th� ��n ch� ta nh�n th��ng n�u d� �o�n ��ng k�t qu�. <color=red>L�u �: m�i k�t qu� ch� ���c ph�p d� �o�n 1 l�n duy nh�t.<color> ",getn(tSay),tSay)
end

function bet_join()
	local tSay = {
		"\nD� �o�n c�c tr�n ng�y Th� B�y 03-04 (th�i h�n d� �o�n 24 gi� Th� S�u 02-04)/bet_select_1",
		"\nD� �o�n c�c tr�n ng�y Ch� Nh�t 04-04 (th�i h�n d� �o�n 24 gi� Th� B�y 03-04)/bet_select_2",
		"\nD� �o�n c�c tr�n ng�y Th� B�y 10-04 (th�i h�n d� �o�n 24 gi� Th� S�u 09-04)/bet_select_3",
		"\nD� �o�n c�c tr�n v�ng Chung K�t (th�i h�n d� �o�n 24 gi� Th� S�u 16-04)/bet_select_4",
		"\n�� ta suy ngh�/gf_DoNothing",
	}
	Say(szNpcName.."B�ng h�u c� th� ��t nhi�u nh�t <color=yellow>100 Ti�n L�<color> cho m�i k�t qu� d� �o�n.",getn(tSay),tSay)
end

function bet_prize()
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate > 2010050724 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n nh�n th��ng �� h�t!")
		return
	end
	local tSay = {	}
	if nDate >= 2010040708 then
		tinsert(tSay,"\nNh�n th��ng c�c tr�n ng�y Th� B�y 03-04 (th�i h�n nh�n th��ng 24 gi� Th� S�u 07-05)/#bet_prize_select(1)")
		tinsert(tSay,"\nNh�n th��ng c�c tr�n ng�y Ch� Nh�t 04-04 (th�i h�n nh�n th��ng 24 gi� Th� S�u 07-05)/#bet_prize_select(2)")
	end
	if nDate >= 2010041408 then
		tinsert(tSay,"\nNh�n th��ng c�c tr�n ng�y Th� B�y 10-04 (th�i h�n nh�n th��ng 24 gi� Th� S�u 07-05)/#bet_prize_select(3)")
	end
	if nDate >= 2010041500 then
		tinsert(tSay,"\nNh�n l�i Ti�n L� d� �o�n c�c tr�n Chung K�t (th�i h�n nh�n th��ng 24 gi� Th� S�u 07-05)/#bet_prize_select(4)")
	end
	tinsert(tSay,"\n�� ta suy ngh�/gf_DoNothing")
	Say(szNpcName.."B�ng h�u nh�n th��ng d� �o�n n�o?",getn(tSay),tSay)
end

function bet_select_1()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100402 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n d� �o�n �� h�t. M�i b�ng h�u ch�n d� �o�n k�t qu� kh�c!")
		return
	end
	local tSay = {
		"T�n 16 ��i l�t v�o 1-16 (t� l� 1 tr�ng 96)/#bet_select_confirm(1)",
		"T�n 2 ��i chi�n th�ng � b�ng A ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(2)",
		"T�n 2 ��i chi�n th�ng � b�ng B ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(3)",
		"T�n 2 ��i chi�n th�ng � b�ng C ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(4)",
		"T�n 2 ��i chi�n th�ng � b�ng D ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(5)",
		"T�n 2 ��i chi�n th�ng � b�ng E ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(6)",
		"T�n 2 ��i chi�n th�ng � b�ng F ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(7)",
		"T�n 2 ��i chi�n th�ng � b�ng G ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(8)",
		"T�n 2 ��i chi�n th�ng � b�ng H ng�y Th� B�y 03-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(9)",
		"�� ta suy ngh�/gf_DoNothing",
	}
	Say(szNpcName.."B�ng h�u d� �o�n k�t qu� n�o?",getn(tSay),tSay)
end

function bet_select_2()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100403 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n d� �o�n �� h�t. M�i b�ng h�u ch�n d� �o�n k�t qu� kh�c!")
		return
	end
	local tSay = {
		"T�n 8 ��i l�t v�o v�ng 1-8 (t� l� 1 tr�ng 32)/#bet_select_confirm(10)",
		"T�n 2 ��i chi�n th�ng � b�ng A ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(11)",
		"T�n 2 ��i chi�n th�ng � b�ng B ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(12)",
		"T�n 2 ��i chi�n th�ng � b�ng C ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(13)",
		"T�n 2 ��i chi�n th�ng � b�ng D ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(14)",
		"T�n 2 ��i chi�n th�ng � b�ng E ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(15)",
		"T�n 2 ��i chi�n th�ng � b�ng F ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(16)",
		"T�n 2 ��i chi�n th�ng � b�ng G ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(17)",	
		"T�n 2 ��i chi�n th�ng � b�ng H ng�y Ch� Nh�t 04-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(18)",
		"�� ta suy ngh�/gf_DoNothing",
	}
	Say(szNpcName.."B�ng h�u d� �o�n k�t qu� n�o?",getn(tSay),tSay)
end

function bet_select_3()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100409 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n d� �o�n �� h�t. M�i b�ng h�u ch�n d� �o�n k�t qu� kh�c!")
		return
	end
	local tSay = {
		"T�n 4 ��i l�t v�o Chung k�t Cao C�p (t� l� 1 tr�ng 12)/#bet_select_confirm(19)",	
		"T�n 4 ��i l�t v�o Chung K�t Si�u C�p (t� l� 1 tr�ng 12)/#bet_select_confirm(20)",
		"T�n 2 ��i chi�n th�ng � ��u Tr��ng 1 ng�y Th� B�y 10-04  (t� l� 1 tr�ng 2)/#bet_select_confirm(21)",
		"T�n 2 ��i chi�n th�ng � ��u Tr��ng 2 ng�y Th� B�y 10-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(22)",
		"T�n 2 ��i chi�n th�ng � ��u Tr��ng 3 ng�y Th� B�y 10-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(23)",
		"T�n 2 ��i chi�n th�ng � ��u Tr��ng 4 ng�y Th� B�y 10-04 (t� l� 1 tr�ng 2)/#bet_select_confirm(24)",
		"�� ta suy ngh�/gf_DoNothing",
	}
	Say(szNpcName.."B�ng h�u d� �o�n k�t qu� n�o?",getn(tSay),tSay)
end

function bet_select_4()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100416 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n d� �o�n �� h�t. M�i b�ng h�u ch�n d� �o�n k�t qu� kh�c!")
		return
	end
	local tSay = {
		"T�n 2 ��i tranh nh�t - nh� Cao C�p	(t� l� 1 tr�ng 4)/#bet_select_confirm(25)",	
		"T�n 2 ��i ��t h�ng ba - t� Cao C�p (t� l� 1 tr�ng 4)/#bet_select_confirm(26)",	
		"T�n 2 ��i tranh nh�t - nh� Si�u C�p (t� l� 1 tr�ng 4)/#bet_select_confirm(27)",	
		"T�n 2 ��i ��t h�ng ba - t� Si�u C�p (t� l� 1 tr�ng 4)/#bet_select_confirm(28)",	
		"T�n ��i v� ��ch Cao C�p Bang H�i Tinh Anh l�n 3 (t� l� 1 tr�ng 8)/#bet_select_confirm(29)",	
		"T�n ��i v� ��ch Si�u C�p Bang H�i Tinh Anh l�n 3 (t� l� 1 tr�ng 8)/#bet_select_confirm(30)",	
		"�� ta suy ngh�/gf_DoNothing",
	}
	Say(szNpcName.."B�ng h�u d� �o�n k�t qu� n�o?",getn(tSay),tSay)
end

function bet_select_confirm(nType)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Say(szNpcName.."B�ng h�u �� tham gia d� �o�n k�t qu� n�y r�i!",2,format("Xem k�t qu� �� ch�n/#view_selected(%d)",nType),"Ta bi�t r�i!/gf_DoNothing")
		return
	end
	SetTaskTemp(TSK_TEAM_LIST_1,0)
	SetTaskTemp(TSK_TEAM_LIST_2,0)
	SetTaskTemp(TSK_TMP_SELECT_COUNT,0)
	SetTaskTemp(TSK_TMP_CHOICE,nType)
	get_team(1,6,nType)
end

function get_team(nPage,nStep,nType)
	local tSay = {}
	local nCount = GetTaskTemp(TSK_TMP_SELECT_COUNT)
	local nMaxRow = getn(tServerName)
	local nNextPage = nPage + nStep
	
	if nNextPage > nMaxRow then
		nNextPage = nMaxRow
	end
	
	if nNextPage < 1 then
		nNextPage = 1
	end
	
	if nStep <= 0 then
		local nTemp = nPage
		nPage = nNextPage
		nNextPage = nTemp
	end
	
	for i=nPage,nNextPage do
		tinsert(tSay,format("%s/#select_team(%d,%d,%d)",tServerName[i][2],tServerName[i][1],nType,nPage))
	end
	
	if nNextPage < nMaxRow then
		tinsert(tSay,format("Xem trang sau/#get_team(%d,%d,%d)",nNextPage + 1,6,nType))
	end
	if nPage > 1 then
		tinsert(tSay,format("Xem trang tr��c/#get_team(%d,%d,%d)",nPage - 1,-6,nType))
	end
	
	tinsert(tSay,"T�i h� ch� gh� ngang!/gf_DoNothing")
	
	if nCount == tTaskByteBet[nType][4] then
		bet_select_confirm_final(tTaskByteBet[nType][4])	
		return
	end
	
	nCount = nCount + 1
	Say(szNpcName.."Ch�n ��i th� <color=yellow>"..nCount.."<color>",getn(tSay),tSay)	
end

function select_team(nTeamBit,nType,nPage)
	local nTeamTask = TSK_TEAM_LIST_1
	if nTeamBit > 31 then -- L�u ���c t�i �a 31 bit, bit 32 l�u tr� s� �m
		nTeamBit = nTeamBit - 31
		nTeamTask = TSK_TEAM_LIST_2
	end	
	if gf_GetTaskTempBit(nTeamTask,nTeamBit) == 1 then
		Say(szNpcName.."B�ng h�u �� ch�n ��i n�y r�i!",1,format("�� ta ch�n l�i/#get_team(1,6,%d)",nType))
		return
	end	
	SetTaskTemp(TSK_TMP_SELECT_COUNT,GetTaskTemp(TSK_TMP_SELECT_COUNT) + 1)
	gf_SetTaskTempBit(nTeamTask,nTeamBit,1)	
	get_team(nPage,6,nType)
end

function bet_select_confirm_final(nLimitedCount)
	if GetTaskTemp(TSK_TMP_SELECT_COUNT) ~= nLimitedCount then
		return
	end
	
	local nType = GetTaskTemp(TSK_TMP_CHOICE)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Talk(1,"bet_join",szNpcName.."B�ng h�u �� tham gia d� �o�n k�t qu� n�y r�i!")
		return
	end
	
	local strTeamList = ""
	for i=1,31 do
		if gf_GetTaskTempBit(TSK_TEAM_LIST_1,i) == 1 then
			strTeamList = strTeamList..tServerName[i][2]..","
		end
	end	
	for i=32,48 do
		if gf_GetTaskTempBit(TSK_TEAM_LIST_2,i-31) == 1 then
			strTeamList = strTeamList..tServerName[i][2]..","
		end
	end
	
	Say(szNpcName.."B�ng h�u �� ch�n "..nLimitedCount.." ��i <color=yellow>"..strTeamList.."<color>. ��ng � ch�?",2,"Ta ��ng �!/bet_select_confirm_final_put","Ta mu�n ch�n l�i/bet_join")
end

function bet_select_confirm_final_put()
	AskClientForNumber("bet_select_confirm_final_ok",1,100,"Nh�p s� Ti�n L�")
end

function bet_select_confirm_final_ok(nSilver)	
	local nType = GetTaskTemp(TSK_TMP_CHOICE)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Talk(1,"bet_join",szNpcName.."B�ng h�u �� tham gia d� �o�n k�t qu� n�y r�i!")
		return
	end
	if nSilver > 100 then
		return
	end
	if GetItemCount(2,1,198) < nSilver then
		Talk(1,"bet_join",szNpcName.."H�nh nh� b�ng h�u kh�ng mang �� Ti�n L�?")
		return
	end
	if  DelItem(2,1,198,nSilver) == 1 then
		if nType == 1 or nType == 10 then
			SetTask(tTaskByteControl[nType][1],GetTaskTemp(TSK_TEAM_LIST_1))
			WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,GetTask(tTaskByteControl[nType][1]))
			SetTask(tTaskByteControl[nType][2],GetTaskTemp(TSK_TEAM_LIST_2))
			WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,GetTask(tTaskByteControl[nType][2]),nSilver)
		else
			local nCountValue = 0
			for i=1,31 do
				if gf_GetTaskTempBit(TSK_TEAM_LIST_1,i) == 1 then
					if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) == 0 then
						gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2],i)						
						nCountValue = nCountValue + 1
						WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]),nSilver)
						if nType == 29 or nType == 30 then
							break
						end
					elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) == 0 then
						gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3],i)						
						nCountValue = nCountValue + 1
						WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]),nSilver)
					else
						if nType == 19 or nType == 20 then
							if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) == 0 then
								gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4],i)								
								nCountValue = nCountValue + 1
								WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]),nSilver)
							elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) == 0 then
								gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5],i)								
								nCountValue = nCountValue + 1
								WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]),nSilver)
							end
						end
					end
				end
			end
			if nCountValue < 4 then
				for i=32,48 do
					if gf_GetTaskTempBit(TSK_TEAM_LIST_2,i-31) == 1 then
						if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) == 0 then
							gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2],i)
							WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]),nSilver)
							if nType == 29 or nType == 30 then
								break
							end						
						elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) == 0 then
							gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3],i)
							WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]),nSilver)	
						else
							if nType == 19 or nType == 20 then
								if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) == 0 then
									gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4],i)	
									WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]),nSilver)	
								elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) == 0 then
									gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5],i)									
									WriteLogEx("Vui Cung BHTA","D� �o�n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]),nSilver)	
								end
							end						
						end
					end
				end
			end
		end		
		SetTaskTemp(TSK_TMP_SELECT_COUNT,0)		
		SetTaskTemp(TSK_TEAM_LIST_1,0)
		SetTaskTemp(TSK_TEAM_LIST_2,0)
		gf_SetTaskBit(TSK_SELECT_TYPE,nType,1)
		gf_SetTaskByte(tTaskByteBet[nType][1],tTaskByteBet[nType][2],nSilver)	
		Talk(1,"",szNpcName.."B�ng h�u �� ��t c��c th�nh c�ng. Ch�c b�ng h�u may m�n!") 
	end
end

function bet_prize_select(nPrizeType)	
	local nWinTotal = 0
	local tPrize = {
							{1,9},
							{10,18},
							{19,24},
							{25,30},				
						}
	for k=tPrize[nPrizeType][1],tPrize[nPrizeType][2] do
		if tWinner[k][1] ~= -1 then		
			if gf_GetTaskBit(TSK_SELECT_TYPE,k) == 1 then
				local nSilverCount = gf_GetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2])
				local nMatchResult = 1
				if k == 1 or k == 10 then
					for i=1, 31 do
						if gf_GetTaskBit(tTaskByteControl[k][1],i) ==1 then
							if check_win(tWinner[k],i) == 0 then
								nMatchResult = 0
								break;
							end				
						end
					end
					for i=32,48 do
						if gf_GetTaskBit(tTaskByteControl[k][2],i-31) == 1 then
							if check_win(tWinner[k],i) == 0 then
								nMatchResult = 0
								break;
							end	
						end
					end		
					if nMatchResult == 1 then
						nWinTotal = nWinTotal + nSilverCount * tTaskByteBet[k][3]
						gf_SetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2],0)
						SetTask(tTaskByteControl[k][1],0)
						SetTask(tTaskByteControl[k][2],0)
						SetTask(TSK_SILVER_WIN,GetTask(TSK_SILVER_WIN) + nSilverCount *  tTaskByteBet[k][3])
						WriteLogEx("Vui Cung BHTA","Tr�ng Type "..k,nSilverCount *  tTaskByteBet[k][3])	
					end
				else								
					if k == 19 or k == 20 then
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3]))  == 0  or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][4])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][5]))  == 0  then
							nMatchResult = 0
						end	
					elseif k == 29 or k== 30 then
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0  then
							nMatchResult = 0
						end
					else
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3]))  == 0  then
							nMatchResult = 0
						end				
					end
					if nMatchResult == 1 then
						nWinTotal = nWinTotal + nSilverCount * tTaskByteBet[k][3]
						gf_SetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2],0)
						gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2],0)
						if nType ~= 29 and nType ~= 30 then
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3],0)		
						end
						if k == 19 or k == 20 then					
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][4],0)
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][5],0)		
						end			
						SetTask(TSK_SILVER_WIN,GetTask(TSK_SILVER_WIN) + nSilverCount *  tTaskByteBet[k][3])
						WriteLogEx("Vui Cung BHTA","Tr�ng Type "..k,nSilverCount *  tTaskByteBet[k][3])	
					end			
				end
			end
		end
	end
		
	if nWinTotal > 0 then
		Say(szNpcName.."Ch�c m�ng b�ng h�u nh�n ���c <color=yellow>"..nWinTotal.." Ti�n L�<color>! B�ng h�u c� <color=yellow>"..GetTask(TSK_SILVER_WIN).." Ti�n L�<color> ch�a r�t ra!",0)
	else
		Say(szNpcName.."B�ng h�u kh�ng d� �o�n ��ng k�t qu� n�o ho�c ch�a c� k�t qu� thi ��u ho�c �� nh�n th��ng r�i!",0)
	end
end

function check_win(tResult, nTeam)	
	for i=1,getn(tResult) do
		if tResult[i] == nTeam then
			return 1
		end
	end
	return 0
end

function get_silver_win()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100507 then
		Talk(1,"bet_select",szNpcName.."Th�i h�n nh�n th��ng �� h�t!")
		SetTask(TSK_SILVER_WIN,0)
		return
	end
	local nSilverWin = GetTask(TSK_SILVER_WIN)
	Say(szNpcName.."B�ng h�u hi�n c� <color=yellow>"..nSilverWin.." Ti�n L�<color> � ch� ta. C� mu�n r�t ra kh�ng?",2,"Ta mu�n l�y/get_silver_won_confirm","�� ta suy ngh�/gf_DoNothing")
end

function get_silver_won_confirm()
	AskClientForNumber("get_silver_won_confirm_ok",1,1000,"Nh�p s� Ti�n L�")	
end

function get_silver_won_confirm_ok(nNumber)
	local nSilverWin = GetTask(TSK_SILVER_WIN)
	if nNumber > nSilverWin then
		Say(szNpcName.."B�ng h�u c� nh�m l�n kh�ng? H�nh nh� s� Ti�n L� mu�n r�t l�n h�n s� ta gi�!",0)
		return
	end
	local nCanTake = 0
	if nSilverWin > 0 then
		if nNumber < 1000 then
			nCanTake = nNumber
		else
			nCanTake = 1000
		end
		local nRoomNeeded = floor(nCanTake/100)
		if gf_Judge_Room_Weight(nRoomNeeded + 2,150*nRoomNeeded,szNpcName) == 0 then
			return
		end		
		SetTask(TSK_SILVER_WIN, GetTask(TSK_SILVER_WIN) - nCanTake)
		gf_AddItemEx2({2,1,198,nCanTake},"Ti�n L�","Vui Cung BHTA","r�t ra")	
	else
		Say(szNpcName.."B�ng h�u c� nh�m l�n kh�ng? Ta kh�ng gi� m�n g� c�a b�ng h�u c�!",0)
	end
end

function view_selected(nType)
	local szTeamList = ""	
	if nType == 1 or nType == 10 then
		for i=1, 31 do
			if gf_GetTaskBit(tTaskByteControl[nType][1],i) ==1 then
				szTeamList = szTeamList..tServerName[i][2]..","
			end
		end
		for i=32,48 do
			if gf_GetTaskBit(tTaskByteControl[nType][2],i-31) == 1 then
				szTeamList = szTeamList..tServerName[i][2]..","
			end
		end
	else
		if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) > 0 then
			szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2])][2]..","
		end
		if nType ~= 29 and nType ~= 30 then
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3])][2]..","
			end
		end
		if nType == 19 or nType == 20 then
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4])][2]..","
			end
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5])][2]..","
			end
		end	
	end
	Talk(1,"",szNpcName.."B�ng h�u �� ch�n c�c ��i sau:<color=yellow>"..szTeamList.."<color>")
end