Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua");
Include("\\script\\online_activites\\task_values.lua");

HB_TASK_VALUE_KEY_USED_COUNT = VET_201011_HB_TASK_USED_COUNT;
HB_USED_MAX = 20;

HB_ITEM_TYPE_MAIN = 2;
HB_ITEM_TYPE_SUB1 = 1;
HB_ITEM_TYPE_SUB2 = 30241;
HB_ITEM_THRESHOLD_TIMES = 10;
HB_TEMP_TASK_VALUE_KEY_ITEM = VET_201011_HB_TASK_TEMP_ITEM_INDEX;
HB_ADDITIONAL_REWARD_EXP = 1500000;
HB_MINOR_REWARD_EXP = 100000;

HB_TREE_SEED_REWARD_TIME = 12;
HB_SMALL_WISDOM_TREE_REWARD_TIME = 8;
HB_BIG_WISDOM_TREE_REWARD_TIME1 = 4;
HB_BIG_WISDOM_TREE_REWARD_TIME2 = 8;

HBRewardSourceTable = {
	2,	--big battlefield
	1,	--small battlefield
	1,	--killer hall
	1,	--planting tree seeds
	2,	--small wisdom tree
	1	--big wisdom tree
};

function HBResetCounter()
	SetTask(HB_TASK_VALUE_KEY_USED_COUNT, 0);
end

function HBClearItem()
	local itemCount = BigGetItemCount(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2);
	if 0 < itemCount then
		BigDelItem(HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, itemCount);
	end
end

function HBDayBegin()
	HBResetCounter();
	HBClearItem();
end

function HBRewardSource(tableIndex)
	do return end
	local itemID = {HB_ITEM_TYPE_MAIN, HB_ITEM_TYPE_SUB1, HB_ITEM_TYPE_SUB2, HBRewardSourceTable[tableIndex]};
	local itemName = "T�i May M�n";
	gf_AddItemEx2(itemID, itemName, "happiness bag", "reward");
end

function HBRewardInBigBattleField()
	HBRewardSource(1);
end

function HBRewardInSmallBattleField()
	HBRewardSource(2);
end

function HBRewardInKillerHall()
	HBRewardSource(3);
end

function HBRewardInPlantingTreeSeeds()
	if HB_TREE_SEED_REWARD_TIME == GetTask(TASK_PLANT_TREE_COUNT) then
		HBRewardSource(4);
	end
end

function HBRewardInBigWisdomTree()
	if HB_BIG_WISDOM_TREE_REWARD_TIME1 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	elseif HB_BIG_WISDOM_TREE_REWARD_TIME2 == GetTask(TASK_PLAN_BIGTREE_COUNT) then
		HBRewardSource(5);
	end	
end

function HBRewardInSmallWisdomTree()
	if HB_SMALL_WISDOM_TREE_REWARD_TIME == GetTask(TASK_PLAN_SMALLTREE_COUNT) then
		HBRewardSource(6);
	end
end

function HBBroadcast(rewardInfo)
	return AddGlobalCountNews("Ch�c m�ng "..GetName().."M� T�i May M�n nh�n ���c"..rewardInfo..",Th�t may m�n qu�!", 1);
end

HBStrings = 
{
	"Ch�c m�ng ",
	"Th�t may m�n qu�!",
	"C�c h� nh�n ���c 100 �i�m tu luy�n",
	"C�c h� nh�n ���c 200 �i�m tu luy�n",
	"C�c h� nh�n ���c 400 �i�m tu luy�n",
	"C�c h� nh�n ���c 800 �i�m tu luy�n"
}

-- base 10000
HBMajoyRewardList = {
	{2, 1600, 100000},
	{2, 1200, 200000},
	{2, 800, 400000},
	{2, 350, 800000},
	{31, 50, "ModifyExp(10000000);HBBroadcast(\'".."10000000 �i�m kinh nghi�m"..","..HBStrings[1].."\')"},
	{31, 500, "ModifyPopur(100);Msg2Player(\'"..HBStrings[3].."\')"},
	{31, 400, "ModifyPopur(200);Msg2Player(\'"..HBStrings[4].."\')"},
	{31, 300, "ModifyPopur(400);Msg2Player(\'"..HBStrings[5].."\')"},
	{31, 250, "ModifyPopur(800);Msg2Player(\'"..HBStrings[6].."\')"},
	{31, 50, "ModifyPopur(2000);HBBroadcast(\'".."2000 �i�m tu luy�n,"..", "..HBStrings[1].."\')"},
	{4, 1000, 1},
	{4, 400, 2},
	{4, 300, 4},
	{4, 200, 8},
	{4, 100, 50},
	{5, 1000, 10},
	{5, 400, 20},
	{5, 300, 40},
	{5, 250, 80},
	{5, 50, 1000},
	{3, 200, 50000},
	{3, 100, 100000},
	{3, 100, 200000},
	{3, 95, 400000},
	{31, 5, "Earn(10000000);HBBroadcast(\'".."1000 v�ng,"..", "..HBStrings[1].."\')"},
};

-- base 10000
HBAdditionalRewardList = {
	{6, 1300, 60, 1},
	{7, 100, 60, 1},
	{8, 100, 60, 1},
	{13, 1300, 60, 1},
	{10, 1300, 60, 1},
	{1, 1500, "T� H� M�t t�ch", {0, 107, 65, 1}},
	{1, 1500, "Thi�n H� M�t t�ch", {0, 107, 64, 1}},
	{1, 1500, "Chi�m Y Ph�", {0, 107, 66, 1}},
	{1, 270, "��u h�n", {2, 1, 1157, 1}, 7*24*3600},
	{1, 100, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 7*24*3600},
	{1, 5, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1, 4}, 1*24*3600},
	{1, 25, "Qu�n C�ng ��i", {2, 1, 9978, 1, 4}, 1*24*3600},
	{1, 200, "T� Quang Kim Thi�n Ti", {2, 0, 737, 1}},
	{1, 200, "T� Quang K� L�n V�", {2, 0, 736, 1}},
	{1, 200, "T� Quang Li�t Di�m C�m", {2, 0, 735 ,1}},
	{1, 200, "Th��ng C� K� L�n Huy�t", {2, 0, 739 ,1}},
	{1, 200, "M�nh Ti�t Ho�nh Th�", {2, 0, 738 ,1}},
};

function OnUse(itemIndex)
	do return end
	SetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM, itemIndex);
	HBOpenUI();
	return 1;    
end

function HBOpenUI()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	local title = "T�i May M�n: t�i th�n k� ch�a ��y may m�n.";
	title = title.."<enter>  ".."H�m nay c�c h� �� m� "..openedTimes.." T�i May M�n, ch� c� th� m� th�m";
	if HB_ITEM_THRESHOLD_TIMES > openedTimes then
		title = title..(HB_ITEM_THRESHOLD_TIMES-openedTimes);
	else
		title = title.."0"
	end;
	title = title.." T�i l� c� th� nh�n ���c ph�n th��ng may m�n r�i.";
	title = title.."<enter><color=Red>".."Ch� �: s� l��ng T�i May M�n m� trong ng�y nhi�u h�n"..HB_ITEM_THRESHOLD_TIMES.." , ti�p t�c m� th�m ch� nh�n ���c"..HB_MINOR_REWARD_EXP.."Kinh nghi�m.".."<color>";
	local menu = {};
	tinsert(menu, "M� T�i May M�n".."/HBDoOpen");
	tinsert(menu, "Ki�m tra ngu�n xu�t hi�n c�a T�i May M�n".."/HBDoHelp");
	tinsert(menu, "Tho�t".."/HBDoNothing");
	Say(title, getn(menu), menu);
end

function HBDoOpen()
	local openedTimes = GetTask(HB_TASK_VALUE_KEY_USED_COUNT);
	--WriteLog("opened times: "..openedTimes);
	if 0 <= openedTimes and openedTimes < HB_USED_MAX then
		if 1 == DelItemByIndex(itemIndex, -1) then
			if openedTimes+1 < HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenPreThreshold();
			elseif openedTimes+1 == HB_ITEM_THRESHOLD_TIMES then
				HBDoOpenThreshold();
			else
				HBDoOpenPstThreshold();
			end
			SetTask(HB_TASK_VALUE_KEY_USED_COUNT, openedTimes+1);
			local itemIndex = GetTaskTemp(HB_TEMP_TASK_VALUE_KEY_ITEM);
			--WriteLog("delete item by index: "..itemIndex);
		end
	elseif openedTimes >= HB_USED_MAX then
	  -- TODO: refine it by SunZhuoshi
		Msg2Player("r�t ti�c, �� ��t gi�i h�n s� l��ng ���c m� trong ng�y"); 
	end
end

function HBMajorReward()
	do return end
	gf_EventGiveRandAward(HBMajoyRewardList, 10000, 1, "happiness bag", "major reward");
end

function HBAdditionalReward()
	if gf_Judge_Room_Weight(1,0,"") ~= 1 then
  	return
  end
  gf_EventGiveRandAward(HBAdditionalRewardList, 10000, 1, "happiness bag", "additional reward");
  gf_EventGiveCustomAward(1, ADDITIONAL_REWARD_EXP, 1, "happiness bag", "additional reward");
end

function HBMinorReward()
	gf_EventGiveCustomAward(1, HB_MINOR_REWARD_EXP, 1, "happiness bag", "minor reward");
end

function HBDoOpenPreThreshold()
	HBMajorReward();
end

function HBDoOpenThreshold()
	HBMajorReward();
	HBAdditionalReward();
end

function HBDoOpenPstThreshold()
	HBMinorReward();
end

function HBDoHelp()
	local title = "Th�ng qua tham d� ho�t ��ng trong game, s� c� c� h�i nh�n ���c T�i May M�n, ho�t ��ng c� kh� n�ng xu�t hi�n: ";
	title = title.."<enter>".."Chi�n tr��ng, S�t Th� ���ng, Nhi�m v� V� L�m S� Gi� (c� nh�n v� t� ��i), tr�ng c�y, tr�ng c�y B�t Nh� l�n nh�";
	local menu = {};
	tinsert(menu, "Tho�t/HBDoNothing");
	tinsert(menu, "tr� l�i/HBOpenUI");
	Say(title, getn(menu), menu);
end

function HBDoNothing()
end