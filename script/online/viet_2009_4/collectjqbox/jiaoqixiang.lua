--=============================================
--create by baiyun 2009.4.15
--describe:越南版4月份收集校旗箱活动 校旗箱
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")
--------------------------------------
--OnUse()
--打开校旗箱获得红旗或蓝旗
--------------------------------------
function OnUse()
	-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin l鏸, ") == 0 then
		return 0
	end
	local nID = 0;
	local sItem = "";
	if DelItem(2, 1, 30079, 1) == 1 then
		local nRand = random(1, 100);
		if nRand > 0 and nRand <= 90 then
			nID = 30081;
			sItem = "Lam K?";
		else
			nID = 30080;
			sItem = "H錸g K?";
		end 
		if AddItem(2, 1, nID, 1) == 1 then
			Msg2Player("Nh薾 頲 1 " .. sItem);
			WriteLogEx("Hoat dong thang 4","Rng Hi謚 K?",1,sItem)
		end
	end
end