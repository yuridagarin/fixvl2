--08春节拜年初始化脚本
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		local nState,nActionStep = getwindstate();
		SetMapTaskTemp(100,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(100,MAP_WIND_RAND,0);
		SetMapTaskTemp(150,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(150,MAP_WIND_RAND,0);
		SetMapTaskTemp(200,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(200,MAP_WIND_RAND,0);
		SetMapTaskTemp(300,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(300,MAP_WIND_RAND,0);
		SetMapTaskTemp(350,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(350,MAP_WIND_RAND,0);
		SetMapTaskTemp(400,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(400,MAP_WIND_RAND,0);
		Msg2SubWorld("Nhi謒 v? ch骳 t誸 v遪g m韎  b総 u, ngi tham gia xin nhanh ch鉵g n Ni猲 S? nh薾 nhi謒 v?!");	
	--	AddLocalNews("新的一轮拜年任务已经开始了，要参加的人请快快到新年使者处领取任务！");												
	end
end