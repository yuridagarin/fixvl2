--����Ь���
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
		return 0;
	end
	local nCount = api_daily_limit_get_yinquan_left_capacity()
	if nCount < 2500 then
		Msg2Player(format("Gi�i h�n c�n l�i �� nh�n ng�n phi�u h�m nay kh�ng �� %d", 2500));
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	--exp
	gf_Modify("Exp", 50000000);
	--����
	--ModifyYinJuan(1000, 1);
	api_daily_limit_award_yinquan(2500, 0, 1)
	--����Ь
	local  tFoot = {
		{1, 17, "Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 15, "Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tFoot, gf_SumRandBase(tFoot), 1, "L� Bao Ng� H�nh H�i", "L� Bao Ng� H�nh H�i");
end
