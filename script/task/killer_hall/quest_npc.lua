Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");

szNpcName = "<color=green>���ng Minh ��c:<color> "

function main()
	local tSay = {}
	local szHeader = szNpcName.."Ta nghe n�i S�t Th� ���ng c� r�t nhi�u k� tr�n d� b�o do b�n L� ��i Ch�y c��p ���c. Ta r�t mu�n �i m�t chuy�n �� m� mang t�m m�t. N�u ng��i  �em cho ta <color=yellow>1 M�t n� S�t Th� ���ng<color> v� <color=yellow>c�c lo�i b�o r��ng<color> trong �� th� ta s� cho ng��i c�c lo�i tr�i c�y qu� hi�m. Ca ca c�a ta l� <color=green>���ng Minh Th�nh � Tuy�n Ch�u<color> �ang c�n mua nh�ng tr�i c�y n�y!"
	
	tinsert(tSay, "Ta ��ng �!/accept_quest")
	tinsert(tSay, "S� d�ng m�t n� S�t Th� �� l�nh th��ng/done_quest")
	tinsert(tSay, "S� d�ng 3 m�t n� S�t Th� v� 99 Xu v�t ph�m �� l�nh th��ng/done_quest1")
	tinsert(tSay, "S�t Th� ���ng nguy hi�m tr�ng tr�ng, h�n khi kh�c v�y!/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function accept_quest()
	if GetLevel() < 75 then
		Talk(1, "", szNpcName.."��ng c�p 75 tr� l�n m�i c� th� nh�n nhi�m v� n�y!")
		return
	end
	if CheckSkill() == 0 then
		Talk(1, "", szNpcName.."Ph�i h�c ��y �� v� c�ng c�p 55 m�i c� th� nh�n nhi�m v� n�y!")
		return
	end
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus >= 1 then
		Talk(1, "", szNpcName.."C�c h� �ang th�c hi�n nhi�m v� n�n kh�ng th� nh�n th�m nhi�m v� m�i!")
		return
	end

	SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
	Msg2Player("�� nh�n nhi�m v� m� r��ng!")
	Talk(1, "", szNpcName.."�� nh�n nhi�m v� m� r��ng th�nh c�ng, khi n�o th�c hi�n xong c�c h� h�y t�m ta �� tr� nhi�m v�!")

end

function done_quest()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 1 then
		Talk(1, "", szNpcName.."C�c h� kh�ng mang theo M�t n� S�t Th� ���ng n�n kh�ng th� tr� nhi�m v�!")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."M�i ��t S�t Th� ���ng ch� cho ph�p ho�n th�nh nhi�m v� m� r��ng 4 l�n, c�c h� xin vui l�ng tr� l�i sau!")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."C�c h� ch�a ho�n th�nh nhi�m v� sao l�i ��n t�m ta ��i ph�n th��ng!")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end	
	local tExpAward =
	{
		[7] = 5000000,
		[8] = 7500000,
		[9] = 10000000,
	}
		
--	3 lo�i r��ng
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,1) == 1 then
		gf_WriteLogEx("Nhiem vu STD", "nh�n th�nh c�ng", 1, "Ti�u hao 1 m�t n�")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			--gf_AddItemEx2({2,1,30170,1}, "D�u", "Nhiem vu STD", "nh�n")
			ModifyExp(tExpAward[7])
			Msg2Player("Nh�n ���c "..tExpAward[7].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[7].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),3}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
			gf_AddItemEx2({2,1,30498,1}, "Hu�n ch��ng d�ng s�", "Nhiem vu STD", "nh�n")
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[7]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("Nh�n ���c "..tExpAward[8].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[8].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),4}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
			gf_AddItemEx2({2,1,30498,1}, "Hu�n ch��ng d�ng s�", "Nhiem vu STD", "nh�n")
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[8]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("Nh�n ���c "..tExpAward[9].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[9].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),5}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
			gf_AddItemEx2({2,1,30498,2}, "Hu�n ch��ng d�ng s�", "Nhiem vu STD", "nh�n")
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[9]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end


function done_quest1()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 3 then
		Talk(1, "", szNpcName.."Tr� nhi�m v� n�y c�n c� <color=yellow>3<color> m�t n� S�t Th� ���ng. C�c h� h�y chu�n b� ��y ��!")
		return
	end
	if GetItemCount(2,1,30230) < 99 then
		Talk(1, "", szNpcName.."C�c h� kh�ng mang theo �� Xu v�t ph�m n�n kh�ng th� tr� nhi�m v�!")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."M�i ��t S�t Th� ���ng ch� cho ph�p ho�n th�nh nhi�m v� m� r��ng 4 l�n, c�c h� xin vui l�ng tr� l�i sau!")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."C�c h� ch�a ho�n th�nh nhi�m v� sao l�i ��n t�m ta ��i ph�n th��ng!")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end
	local tExpAward =
	{
		[7] = 10000000,
		[8] = 15000000,
		[9] = 20000000,
	}
		
--	3 lo�i r��ng
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,3) == 1 and  DelItem(2,1,30230,99) == 1 then
		gf_WriteLogEx("Nhiem vu STD", "nh�n th�nh c�ng", 1, "Ti�u hao 3 m�t n� v� 99 xu")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			ModifyExp(tExpAward[7])
			Msg2Player("Nh�n ���c "..tExpAward[7].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[7].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),6}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[7]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("Nh�n ���c "..tExpAward[8].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[8].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),8}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
			gf_AddItemEx2({2,1,30499,1}, "Hu�n ch��ng anh h�ng", "Nhiem vu STD", "nh�n")
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[8]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("Nh�n ���c "..tExpAward[9].." �i�m kinh nghi�m!")
			gf_WriteLogEx("Nhiem vu STD", "nh�n "..tExpAward[9].." �i�m kinh nghi�m")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),10}, "Tr�i c�y", "Nhiem vu STD", "nh�n")
			gf_AddItemEx2({2,1,30499,1}, "Hu�n ch��ng anh h�ng", "Nhiem vu STD", "nh�n")	
		--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[9]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--			else
--				Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--			end
			---------					
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end

function do_nothing()

end

function CheckSkill()
	local tRouteSkillInfo =
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
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end
	end
end