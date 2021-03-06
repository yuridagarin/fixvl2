--file name:boy_meet_girl.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动，牛郎织女相遇事件启动脚本
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	if Get_Qixi06_State() == 1 then
		--三张银河地图不可放同一服务器
		local nStarCount1 = GetMapTaskTemp(GALAXY_MAP1,4);
		local nStarCount2 = GetMapTaskTemp(GALAXY_MAP2,4);
		local nStarCount3 = GetMapTaskTemp(GALAXY_MAP3,4);
		local nStarCount = 0;
		local nMapID = 0;
		if type(nStarCount1) == "number" then
			nStarCount = nStarCount1;
			nMapID = GALAXY_MAP1;
		elseif type(nStarCount2) == "number" then
			nStarCount = nStarCount2;
			nMapID = GALAXY_MAP2;	
		elseif type(nStarCount3) == "number" then
			nStarCount = nStarCount3;
			nMapID = GALAXY_MAP3;	
		else
			WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]: Trong files g鑓 boy_meet_girl.lua kh玭g t譵 kh玭g th蕐 map ch輓h x竎, c? kh? n╪g m竬 ch? kh玭g c? map Ng﹏ H?.");
			return 0;
		end;
		local nDate = tonumber(date("%y%m%d"));
		if nStarCount >= REQUIRE_STAR_COUNT or nDate == 060728 then
			AddLocalNews("Ng璾 Lang v? Ch鴆 N? s? g苝 nhau ? d秈 Ng﹏ H?, c竎 b筺 c? th? v祇 d秈 Ng﹏ H?  ch鴑g ki課 th阨 kh綾 c秏 ng n祔.")
			Msg2SubWorld("Ng璾 Lang v? Ch鴆 N? s? g苝 nhau ? d秈 Ng﹏ H?, c竎 b筺 c? th? v祇 d秈 Ng﹏ H?  ch鴑g ki課 th阨 kh綾 c秏 ng n祔.")		
			create_meeting(nMapID);
		else
			AddLocalNews("Цng ti誧 h玬 nay 竛h sao 秏 m, e r籲g s? kh玭g th蕐 c秐h Ng璾 Lang v? Ch鴆 N? g苝 nhau")
			Msg2SubWorld("Цng ti誧 h玬 nay 竛h sao 秏 m, e r籲g s? kh玭g th蕐 c秐h Ng璾 Lang v? Ch鴆 N? g苝 nhau")		
		end;
	end;
end;

function create_meeting(nMapID)
	SubWorld = SubWorldID2Idx(nMapID);
	if SubWorld > 0 then
		OpenMission(MISSION_ID);
		WriteLog("[Ho箃 ng Th蕋 T辌h]: Ng璾 Lang  g苝 Ch鴆 N?, ng祔:"..date("%y%m%d"));
	else
		WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]: Trong h祄 s? create_meeting, gi? tr? SubWorld sai, gi? tr? sai:"..SubWorld);
	end;
end;