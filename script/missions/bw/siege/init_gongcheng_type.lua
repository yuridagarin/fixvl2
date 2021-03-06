--=============================================
--create by baiyun 2009.10.15
--describe:越南版10月攻城战调整，初始化攻城战的类型
--记在共享库里，类型1为打擂台，2为竞投挑战令
--=============================================
Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
File_name = "\\script\\missions\\bw\\siege\\init_gongcheng_type.lua";

function main()
	if tonumber(date("%w")) == 6 then--星期六来随机出一种攻城战资格类型
		local nType = 1--random(1, 2);
		SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
		WriteLog("[Ch鋘 ng蓇 nhi猲 tranh 畂箃 c玭g th祅h chi課]: Lo筰 h譶h tranh 畂箃 c玭g th祅h chi課 l莕 n祔 l?: "..tSignMethod[nType]);
		AddRelayShareData("gongchengtype", 0, 0, File_name, "clear_data", 2, "type", "d", nType); 
	end
end

function clear_data()
	ClearRelayShareData("tiaozhanling", 0, 0, File_name, "nothing");
end

function nothing()
	WriteLog("Last week tiaozhanling data has been cleared successful");
end