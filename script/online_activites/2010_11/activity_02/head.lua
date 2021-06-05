Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

SF_title = "Ho�t ��ng th�ng 11 ���c ti�n h�nh v�o ng�y 29/10/2010 ~ 05/12/2010. Vui l�ng xem th�ng tin chi ti�t t�i http://volam2.zing.vn";
SF_useThreshold = 1500;
SF_activityID = 17;
SF_modeTaskID = VET_201011_02_TASK_MODE;
SF_usedCountTaskID = VET_201011_02_TASK_USED_COUNT;
SF_usedCountMode1TaskID = VET_201011_02_TASK_USED_COUNT_MODE1;
SF_usedCountMode2TaskID = VET_201011_02_TASK_USED_COUNT_MODE2;
SF_ifGotRewardTaskID = VET_201011_02_IF_GET_REWARD;

VET_201011_EVENT_LOG_TITLE = "Hoat dong thang 11 nam 2010"

SF_expReward = 
{
	200000, 
	250000
}

SF_weapon_bpy = {
				[1]  = {675, "Ph� Y�n �ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[2]  = {675, "Ph� Y�n tr��ng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {675, "H�m Y�n th�",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {675, "T�ng Y�n ch�m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[5]  = {675, "Phi Y�n ki�m",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {675, "V�n Y�n c�m",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[7] = {675, "V�n Y�n th�",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[8] = {675, "L�u Y�n c�n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[9] = {675, "Huy�n Y�n ki�m",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[10] = {675, "V� Y�n b�t",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {675, "H� Ti�m Th��ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {675, "H�nh Y�n Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[13] = {625, "Tr�c Y�n nh�n",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {600, "Y�u Y�n tr�o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {675, "Ph� Y�n C�n",{0, 5, 6002, 1,1,-1,-1,-1,-1,-1,-1}},
};

SF_items = 
{
	{2, 1, 30250, "Hoa H��ng D��ng"},
	{2, 1, 30251, "Gi�y g�i hoa"},
	{2, 1, 30252, "��a Hoa H��ng D��ng"},
	{2, 1, 30253, "Hoa h�ng ��"},
	{2, 1, 30254, "Hoa h�ng ph�n"},
	{2, 1, 30255, "Hoa h�ng v�ng"},
	{2, 1, 30256, "Hoa H�ng Tr�ng"},
	{2, 1, 30257, "L�ng Ba T�n Quy�n"},
	{2, 1, 30258, "Th��ng Thi�n L�nh"},
	{2, 1, 30259, "Ph�t �c L�nh"},
	{2, 1, 30230, " ��ng "},
	{2, 1, 199, "��i ng�n phi�u"}
};

SF_compositeTable1 = 
{
	{
		{"Hoa H��ng D��ng", 2, 1, 30250, 5},
		{"Gi�y g�i hoa", 2, 1, 30251, 1}
	},
	{
		{"��a Hoa H��ng D��ng", 100, {"��a Hoa H��ng D��ng", {2, 1, 30252, 1}}}
	}
};

SF_compositeTable2 = 
{
	{
		{"Hoa H��ng D��ng", 2, 1, 30250, 5},
		{" ��ng ", 2, 1, 30230, 2}
	},
	{
		{"��a Hoa H��ng D��ng", 100, {"��a Hoa H��ng D��ng", {2, 1, 30252, 1}}}
	}
};

SF_compositeTable3 = 
{
	{
		{"��i ng�n phi�u", 2, 1, 199, 1},
	},
	{
		{" ��ng ", 100, {" ��ng ", {2, 1, 30230, 100}}}
	}
};

-- base 1000
SF_itemReward =
{
	{3, 305, 10000, 1},
	{1, 100, "Thi�n th�ch", {2, 2, 8, 1}},
	{1, 60, "M�nh Thi�n th�ch", {2, 2, 7, 1}},
 	{1, 5, "Th� Th�n ph�", {2, 0, 556, 1}, 7 * 24 * 3600},
 	{1, 20, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 7 * 24 * 3600},
 	{1, 20, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
 	{1, 10, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
  	{4, 250, 10, 1},
  	{5, 140, 10, 1},
	{1, 5, "Thi�n H� M�t t�ch", {0, 107, 64, 1}},
	{1, 5, "T� H� M�t t�ch", {0, 107, 65, 1}},
	{1, 5, "Chi�m Y Ph�", {0, 107, 66, 1}},
	{1, 50, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
	{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
	{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
	{1, 10, "�� Nguy�t Th�n Sa", {2, 1, 3332, 1}},
};

SF_specialTimes = 20;
SF_maxCountExpReward = 20000000;

-- base 10000
SF_extraItemReward = {
    {8, 1000, 60, 1},
    {15, 1000, 60, 1},
    {12, 1000, 60, 1},
    {1, 600, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 300, "C� quan nh�n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 300, "S� tay s�ng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 500, "V� Ng�n Th�y", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "T�y T�y ��n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "T�y T�y linh ��n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 1240, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 1000, "Th�i H� �a M�t Qu� ", {2, 1, 387, 1}, 7 * 24 * 3600},
    {1, 1009, "T�ng Ki�m anh h�ng thi�p", {2, 0, 31, 1}, 7 * 24 * 3600},
    {1, 1000, "R��ng B� K�p", {2, 1, 30093, 1}, 7 * 24 * 3600},
    {1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
};

-- base 1000
SF_maxCountItemReward = 
{
	{3, 150, 5000000, 1},
	{1, 200, "Ch�m Ch�m", {2, 1, 30165, 50}},
	{1, 100, "Chi�n Th�n ho�n", {2, 1, 1005, 1}, 7 * 24 * 3600},
	{31, 10, "SF_get_bpy_weapon_201011()"},
	{1, 10, "Phi Y�n Th�ch", {2, 1, 30130, 1}},
	{1, 1, "Thi�n Qu�i Th�ch", {2, 0, 1084, 1}},
	{1, 10, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}},
	{1, 5, "B�ch Kim H�ng Bao (tr�ng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
	{1, 5, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 7 * 24 * 3600},
	{1, 10, "T� Kim H�ng Bao (tr�ng)", {2, 1, 536, 1}, 7 * 24 * 3600},
	{1, 200, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}},
	{1, 1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
	{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}},
	{1, 5, "Thi�n Th�ch Linh Th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
	{1, 1, "L�ng Ba Vi B�", {0, 112, 78, 1}},
	{32, 282, 7000, 1},
}

SF_options = 
{
	"\nGh�p ��a Hoa H��ng D��ng (c�n 5 Hoa H��ng D��ng + 1 Gi�y G�i)/SF_composite1",
	"Gh�p ��a Hoa H��ng D��ng (c�n 5 Hoa H��ng D��ng + 2 v�t ph�m xu)/SF_composite2",
}

SF_results = 
{
	"Nguy�n li�u mang theo kh�ng ��",
	"R�i kh�i",
	"C�c h� �� nh�n th��ng",
	"�� k�ch ho�t nh�n th��ng k�m v�t ph�m",
	"�� k�ch ho�t nh�n th��ng kh�ng k�m v�t ph�m, t�ng th�m 25% kinh nghi�m",
	"S� l��ng ��a Hoa H��ng D��ng s� d�ng �� ��t gi�i h�n 3000"
}

function SF_setMode(mode)
	SetTask(SF_modeTaskID, mode);
	WriteLogEx(VET_201011_EVENT_LOG_TITLE, "ch�nh nh�n th��ng lo�i "..mode)
end

function SF_getMode()
	local result = GetTask(SF_modeTaskID);
	if 0 == result then
		result = 1
	end
	return result;
end

function SF_getUsedCount()
	return GetTask(SF_usedCountTaskID);
end

function SF_getUsedCountMode1()
	return GetTask(SF_usedCountMode1TaskID);
end

function SF_getUsedCountMode2()
	return GetTask(SF_usedCountMode2TaskID)
end

function SF_addUsedCount()
	SetTask(SF_usedCountTaskID, GetTask(SF_usedCountTaskID)+1);
	if 1 == SF_getMode() then
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE1, GetTask(SF_usedCountMode1TaskID)+1);
	else
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE2, GetTask(SF_usedCountMode2TaskID)+1);
	end
end

function SF_notEnoughMaterial()
	local title = SF_results[1];
	local menu = {SF_results[2]};
	Say(title, getn(menu), menu);
end

function SF_maxCount()
	--WriteLog("SF_maxCount::called");
	local title = SF_results[6];
	local menu = {SF_results[2]};
	Say(title, getn(menu), menu);
end

function SF_composite1()
	if GetItemCount(2,1,30250) < 5 or GetItemCount(2,1,30251) < 1 then
        Talk(1,"","H�nh nh� ��i hi�p ch�a mang �� nguy�n li�u, vui l�ng th� l�i!")
        return
    end
    if gf_Judge_Room_Weight(2,200," ") ~= 1 then
        return
    end
    if DelItem(2,1,30250, 5) == 1 and DelItem(2,1,30251, 1) == 1 then
        gf_AddItemEx2({2,1,30252, 1}, "��a Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE, "gh�p v�t ph�m",0,1)
    end
    SelectSay()
end

function SF_composite2()
	AskClientForNumber("confirm_SF_composite2", 1, 999, "S� Hoa H��ng D��ng?")
end

function confirm_SF_composite2(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if gf_Judge_Room_Weight(3, 200," ") ~= 1 then
        	return
     end
	if GetItemCount(2, 1, 30250) < (5 * nQuantity) or GetItemCount(2,1,30230) < (2 * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� Hoa H��ng D��ng ho�c v�t ph�m Xu �� ��i!")
		return
	end
	if DelItem(2, 1, 30250, 5 * nQuantity) == 1 and DelItem(2,1,30230, 2 * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30252, nQuantity}, "��a Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE, "gh�p b�ng v�t ph�m Xu")
	end
	SelectSay()
end

function SF_getThresholdReward()
	local tSay = {}
	local szHeader = "��i hi�p h�y ch�n lo�i ph�n th��ng:"
	
	tinsert(tSay, "20000000 �i�m kinh nghi�m v� v�t ph�m/#SF_confirm_getThresholdReward(1)")
	tinsert(tSay, "20 �i�m N�ng C�p B�n ��ng H�nh v� v�t ph�m/#SF_confirm_getThresholdReward(2)")
	tinsert(tSay, "1 �i�m Linh L�c B�n ��ng H�nh v� v�t ph�m/#SF_confirm_getThresholdReward(3)")
	tinsert(tSay, "Tho�t/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function SF_confirm_getThresholdReward(nType)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nType == 2 then
		if nCurPetLevel < 1 then
			Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh, kh�ng th� nh�n ph�n th��ng n�y!")
			return
		end
	end
	if nType == 3 then
		if nCurPetLevel < 2 then
			Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� nh�n ph�n th��ng n�y!")
			return
		end
	end
	local title;
	local menu = {SF_results[2]};
	local usedCount = SF_getUsedCount(); 
	--WriteLog("used count: "..usedCount);
	--WriteLog("SF_useThreshold: "..SF_useThreshold);
	if usedCount >= SF_useThreshold then
		if 0 == GetTask(SF_ifGotRewardTaskID) then
			if 1 == gf_Judge_Room_Weight(2, 200, "") then
				SetTask(SF_ifGotRewardTaskID, 1);
				if nType == 1 then
					ModifyExp(SF_maxCountExpReward);
					Msg2Player("B�n nh�n ���c 20000000 �i�m kinh nghi�m")
				elseif nType == 2 then
					SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
					Msg2Player("B�n nh�n ���c 20 �i�m N�ng C�p B�n ��ng H�nh")
				elseif nType == 3 then
					Pet_AddGP(1)
					Msg2Player("B�n nh�n ���c 1 �i�m Linh L�c B�n ��ng H�nh")
				end
				gf_EventGiveRandAward(SF_maxCountItemReward, 1000, 1, VET_201011_EVENT_LOG_TITLE, "nh�n th��ng max event lo�i "..nType);			
			end
		else
			title = "C�c h� �� nh�n th��ng";
		end
	else
		title = "�� k�ch ho�t ["..usedCount.."/3000] ��a Hoa H��ng D��ng";
	end
	Say(title, getn(menu), menu);
end

function SF_onUse(itemIndex)
	if tonumber(date("%y%m%d")) < 101029 or tonumber(date("%y%m%d")) > 101205 then
		Talk(1,"","S� ki�n �� k�t th�c, kh�ng th� s� d�ng v�t ph�m n�y!")
		return
	end
	
	local usedCount = SF_getUsedCount();
	local mode = GetTask(SF_modeTaskID)
	if mode == 0 then
		Talk(1,"","B�n vui l�ng ch�n h�nh th�c nh�n th��ng tr��c!")
		return
	end
	if usedCount >= 3000 then
		SF_maxCount();
	else
		if 1 == gf_Judge_Room_Weight(2, 200, "") then
			if 1 == DelItemByIndex(itemIndex, 1) then
				ModifyExp(SF_expReward[mode])
				Msg2Player("B�n nh�n ���c "..SF_expReward[mode].." �i�m kinh nghi�m")
				if 1 == mode then
					if 0 == mod(usedCount+1, SF_specialTimes) then
						gf_EventGiveRandAward(SF_extraItemReward, 10000, 1, VET_201011_EVENT_LOG_TITLE, "nh�n th��ng m�c 20");	
					else
						gf_EventGiveRandAward(SF_itemReward, 1000, 1, VET_201011_EVENT_LOG_TITLE, "nh�n th��ng");
					end
					gf_WriteLogEx(VET_201011_EVENT_LOG_TITLE, "nh�n thu�ng b�nh th��ng", 1, "��a Hoa H��ng D��ng", "2, 1, 30252");									
				else
					gf_WriteLogEx(VET_201011_EVENT_LOG_TITLE, "nh�n th��ng �i�m kinh nghi�m", 1, "��a Hoa H��ng D��ng", "2, 1, 30252");
				end
				SF_addUsedCount();
			end
		end
	end
end

function SF_activateItemMode()
	local title = SF_results[4];
	local menu = {SF_results[2]};
	SF_setMode(1);
	Say(title, getn(menu), menu);	
end

function SF_activateNonItemMode()
	local title = SF_results[5];
	local menu = {SF_results[2]};
	SF_setMode(2);
	Say(title, getn(menu), menu);	
end

function SF_exchange()
	if 0 == gf_ExchangeItemEx(SF_compositeTable3, VET_201011_EVENT_LOG_TITLE, "composite3") then
		SF_notEnoughMaterial();
	end
end

function SF_dialog(menu, title)
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		title = SF_title
		for i=1, getn(SF_options) do
			tinsert(menu, SF_options[i]);
		end
	end
	return menu, title;
end

function SF_smallWisdomTreeReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GivePlantSmallTreeAward({2, 1, 30250, 75}, "Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_bigWisdomTreeReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GivePlantBigTreeAward({2, 1, 30250, 100}, "Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_soloMessengerQuestReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GiveDailyTaskPersonalAward({2, 1, 30250, 60}, "Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE);
	end
end

function SF_partyMessengerQuestReward()
	if gf_CheckEventDateEx(SF_activityID) == 1 then
		gf_GiveDailyTaskTeamAward({2, 1, 30250, 60}, "Hoa H��ng D��ng", VET_201011_EVENT_LOG_TITLE);
	end
end	

function SF_get_bpy_weapon_201011()
	local nRand = random(1, 10000)
	local nTotal = 0
	for i = 1, getn(SF_weapon_bpy) do
		if nRand <= nTotal + SF_weapon_bpy[i][1] then
			gf_AddItemEx2(SF_weapon_bpy[i][3], SF_weapon_bpy[i][2], VET_201011_EVENT_LOG_TITLE, "nh�n ph�n th��ng max event")
			break
		end
		nTotal = nTotal + SF_weapon_bpy[i][1]
	end
end

function give_sunflower()
	local nUsedDate = floor(GetTask(EVENT201011_GIVE_FLOWER) / 10)
	local nDate = tonumber(date("%y%m%d"))
	
	if nUsedDate ~= nDate then
		SetTask(EVENT201011_GIVE_FLOWER, nDate * 10)
	end
	
	local nCount = mod(GetTask(EVENT201011_GIVE_FLOWER), 10)	
	if nCount >= 3 then
		Talk(1,"","M�i ng�y ch� c� th� d�ng hoa t�i �a 3 l�n m� th�i!")
		return
	end
	if GetItemCount(2, 1, 30252) < 10 then
		Talk(1,"","��i hi�p kh�ng mang �� 10 ��a Hoa H��ng D��ng r�i!")
		return
	end
	if DelItem(2, 1, 30252, 10) == 1 then
		ModifyExp(2000000)
		Msg2Player("Nh�n ���c 2000000 �i�m kinh nghi�m")
		gf_WriteLogEx("Hoat dong thang 11 n�m 2010", "T�ng ��a Hoa H��ng D��ng nh�n 2000000 exp")
		SetTask(EVENT201011_GIVE_FLOWER, GetTask(EVENT201011_GIVE_FLOWER) + 1)
	end
end

function do_nothing()

end