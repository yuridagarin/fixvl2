-- 读入随机任务头文件
Include("\\script\\task\\random\\task_head.lua");

function OnUse()
	-- 如果还没有入门派就不触发了
	if GetPlayerFaction()==0 then
		
		Msg2Player("B筺 ch璦 gia nh藀 m玭 ph竔, kh玭g th? nh薾 nhi謒 v? ng蓇 nhi猲!");
		return
	
	end;
	
	CreateTask();
	RandomTaskTip("B筺 nh薾 頲 1 nhi謒 v? ng蓇 nhi猲!");
	
end;
