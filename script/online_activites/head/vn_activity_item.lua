--脚本功能：20011年6月暑假活动脚本
--功能设计：越南方同事
--功能开发：村长
--开发时间：2011-5-16
--修改记录：刘波
--2011年6月暑假活动开始通过配置表处理活动基本信息
--<活动物品>响应脚本
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	if gf_CheckEventDateEx(138) ~= 1 then
		Talk(1,"","Event  h誸 n猲 i hi謕 kh玭g th? s? d鬾g v藅 ph萴 n祔 頲 n鱝!")
		return 0;
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)	

---- M? r閚g event
--
--	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
--	if tbActivity then
--		local nCheckMaxEvent = gf_GetTaskByte(2731, 1)
--		local tbPrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
--		--local nTask = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdGetFinalPrize)
--		local nUseTimes = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
--		if nUseTimes >= 2000 and nUseTimes < 4000 then
--			if GetTask(2785) < 1 or GetTask(2786) < 1 or GetTask(2787) < 1 then
--				Talk(1,"","Чi hi謕 ch璦 nh薾 ph莕 thng cu鑙 m鑓 2000 n猲 kh玭g th? s? d鬾g ti誴 v藅 ph萴 event !!!!")
--				return 0
--			end
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2788) == 4000 and GetTask(2789) == 4000 and GetTask(2790) == 4000 and nCheckMaxEvent == 0 then
----				--SetTask(2731,1)
----				gf_SetTaskByte(2731, 1, 1)
----			end
----		elseif nUseTimes >= 3000 and nUseTimes < 4000 then
----			if nCheckMaxEvent < 2 then
----				Talk(1,"","Чi hi謕 ch璦 nh薾 ph莕 thng cu鑙 m鑓 3000 v藅 ph萴 n猲 kh玭g th? s? d鬾g ti誴!!!!")
----				return 0
----			end
----			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2836) == 4000 and GetTask(2837) == 4000 and GetTask(2838) == 4000 and nCheckMaxEvent == 2 then
----				--SetTask(2731,3)
----				gf_SetTaskByte(2731, 1, 3)
----			end
--		else
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
--		end
--	end
	
	
end
