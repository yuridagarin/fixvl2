--=============================================
--create by baiyun 2009.9.14
--describe:越南2009年9月攻城战修改，竞投挑战令相关实现
--=============================================
--挑战令 		2,1,30117
--成都搜捕令 2,1,30118
--尚方宝剑 	 2,1,30119
--成都之印 	 2,1,30120
--成都疑案令 

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

File_name = "\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua";
--报名竞投挑战令
function baobing_jingtoutiaozhanling()
	local szTong = GetTongName();
	local nYear = tonumber(date("%Y"));
	local nDay = tonumber(date("%m%d"));
	
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Ch? l玦 i<color>: Ch? c? bang ch? m韎 c? th? b竜 danh u gi? khi猽 chi課 l謓h.")
		return 0
	end
	
	-- 是攻城或者守城方任意一方
	for index, value in tFightCityName do
		local szAttack, szDefence = GetCityWarAD(index)
		if szTong == szAttack then
			Talk(1,"","B筺  l? ngi c馻 "..value.." b猲 c玭g, kh玭g th? b竜 danh u gi? khi猽 chi課 l謓h th猰 l莕 n鱝")
			return 0
		end
		if szTong == szDefence then
			Talk(1,"","B筺  l? ngi c馻 "..value.." b猲 th?, kh玭g th? b竜 danh u gi? khi猽 chi課 l謓h th猰 l莕 n鱝.")
			return 0
		end
	end
	
	-- 是否是帮主

	
	-- 帮主必须在位7天以上
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green> Ch? l玦 i<color>: Th阨 gian t筰 v? c馻 c竎 h? 輙 h琻 7 ng祔, kh玭g th? b竜 danh u gi? khi猽 chi課 l謓h")
		return 0
	end
	
	-- 80级以上
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green> Ch? l玦 i<color>: C蕄 b薱 c竎 h? kh玭g  80, kh玭g th? b竜 danh u gi? khi猽 chi課 l謓h")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green> Ch? l玦 i<color>: C竎 h? ch璦 gia nh藀 m玭 ph竔, kh玭g th? b竜 danh u gi? khi猽 chi課 l謓h")
		return 0
	end
	
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"baoming_callback")
end

function baoming_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		if DelItem(2,1,1200,1) ~= 1 then
			Talk(1,"","<color=green> Ch? l玦 i<color>: Xin h穣 mang th? ti課 c?  b竜 danh khi猽 chi課 l謓h");
			return 0;
		end
		if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
			Talk(1,"","<color=green> Ch? l玦 i<color>: Bang ch?  b竜 danh u gi? khi猽 chi課 l謓h th祅h c玭g, qu? tr譶h u gi? s? b総 u v祇 19:40, xin bang ch? l璾 ?!");
			SetGlbValue(1020,GetGlbValue(1020) + 1)
		end
	else
		if nLastDate < nDate then
			if DelItem(2,1,1200,1) ~= 1 then
				Talk(1,"","<color=green> Ch? l玦 i<color>: Xin h穣 mang th? ti課 c?  b竜 danh khi猽 chi課 l謓h");
				return 0;
			end
			if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
				Talk(1,"","<color=green> Ch? l玦 i<color>: Bang ch?  b竜 danh u gi? khi猽 chi課 l謓h th祅h c玭g, qu? tr譶h u gi? s? b総 u v祇 19:40, xin bang ch? l璾 ?!");
				SetGlbValue(1020,GetGlbValue(1020) + 1)
			end
		else
			Talk(1, "", "<color=green> Ch? l玦 i<color>: Qu? bang ch?  giao n閜 th? ti課 c? r錳.");
		end
	end
end

function jingtou_tiaozhanling()
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Ch? l玦 i<color>: Ch? c? bang ch? m韎 c? th? u gi? khi猽 chi課 l謓h")
		return 0
	end
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"jingtou_callback");
end

function jingtou_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));	
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Ch? l玦 i<color>: Bang h閕 c馻 c竎 h? ch璦 b竜 danh u gi? khi猽 chi課 l謓h");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Ch? l玦 i<color>: Bang h閕 c馻 c竎 h? ch璦 b竜 danh u gi? khi猽 chi課 l謓h");
		else
			local nCount = 1;
			local nPreCount = GetItemCount(2,1,30117);
			if nPreCount > 999 then
				nPreCount = 999;
			end
			SetTaskTemp(103, nNum);
			
			AskClientForNumber("give_tiaozhanling", nCount, nPreCount, "Чi hi謕 mu鑞 giao n閜 bao nhi猽 khi猽 chi課 l謓h?");
		end
	end
end

function give_tiaozhanling(nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	if nCount == 0 then
		return 0;
	end
	if DelItem(2, 1, 30117, nCount) == 1 then
		AddRelayShareData("tiaozhanling", 0,0,File_name, "nothing", 2, szTong, "dds", nCount + GetTaskTemp(103), nDate, szTong);
		Talk(1, "", "<color=green> Ch? l玦 i<color>: Ngi  thay b鎛 bang h閕 giao n閜 "..nCount.." khi猽 chi課 l謓h");
		WriteLogEx("Cong Thanh Chien","n閜",nCount,"Khi猽 Chi課 L謓h","",GetTongName())
	else
		Talk(1, "", "<color=green> Ch? l玦 i<color>: C竎 h? mang khi猽 chi課 l謓h kh玭g , h穣 ki觤 tra l筰 s? lng khi猽 chi課 l謓h");
		return 0;
	end
end

--查看本帮竞投挑战令的情况
function view_tiaozhanling()
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"view_callback");
end

function view_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", 0, 0, szTong);
	DelRelayShareDataCopy("tiaozhanling",0,0);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Ch? l玦 i<color>: Bang h閕 c馻 c竎 h? ch璦 b竜 danh u gi? khi猽 chi課 l謓h");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Ch? l玦 i<color>: Bang h閕 c馻 c竎 h? ch璦 b竜 danh u gi? khi猽 chi課 l謓h");
		else
			Talk(1, "", "<color=green> Ch? l玦 i<color>: Hi謓 gi? bang h閕 c馻 c竎 h?  n閜 khi猽 chi課 l謓h "..nNum.." c竔 r錳.");
		end
	end
end

function nothing()

end

function main()
	if tonumber(date("%w")) == 5 then
		PlayerIndex = FirstPlayer()
		if SubWorldID2Idx(300) > 0 then
			ApplyRelayShareData("gongchengtype",0,0,File_name,"get_type_jingtou");				
		end		
	end
end

function get_type_jingtou(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		SetGlbValue(CITY_GLB_VALUE_TYPE, 1);		
	else
		local nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
		if nType == 0 then
			SetGlbValue(CITY_GLB_VALUE_TYPE, 1);			
		else
			SetGlbValue(CITY_GLB_VALUE_TYPE, nType);			
		end
	end
	if GetGlbValue(CITY_GLB_VALUE_TYPE) == 2 then
		ApplyRelayShareData("tiaozhanling",0,0,File_name,"main_callback");		
	end
end

function view_all_tiaozhanling()
	local nCount = GetGlbValue(1020) or 0	
	Talk(1,"","Hi謓 t筰 c? "..nCount.." bang h閕 b竜 danh u gi? Khi猽 Chi課 L謓h.")
end

function main_callback(szKey, nKey1, nKey2, nCount)
	local nDate = tonumber(date("%y%m%d"));	
	if nCount ~= 0 then
		local _, nNum, nLastDate, szTong = GetRelayShareDataByIndex(szKey, nKey1, nKey2, 0);
		
		if nDate == nLastDate then
			SetCityWarAttack(CITY_ID_CD, szTong);			
		end
		
		local szA, szD = GetCityWarAD(CITY_ID_CD)
		
		if szD ~= "" then						-- 如果有守城方
			SetCityWarAttack(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Ch骳 m鮪g bang h閕:"..szTong.." Bang h閕 nh薾 頲 "..tFightCityName[CITY_ID_CD].."_t? c竎h c玭g th祅h")
			AddGlobalNews("Ch骳 m鮪g bang h閕:"..szTong.." Bang h閕 nh薾 頲 "..tFightCityName[CITY_ID_CD].."_t? c竎h c玭g th祅h")
			WriteLogEx("Cong Thanh Chien",szTong.." nh薾 頲 "..tFightCityName[CITY_ID_CD].."_t? c竎h c玭g th祅h")			
		elseif szD == "" then					-- 如果没有守城方，则直接占有城市
			SetCityWarWinner(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Ch骳 m鮪g bang h閕:"..szTong.."  chi誱 頲 "..tFightCityName[CITY_ID_CD])
			AddGlobalNews("Ch骳 m鮪g bang h閕:"..szTong.."  chi誱 頲 "..tFightCityName[CITY_ID_CD])
			WriteLogEx("Cong Thanh Chien",szTong.."  chi誱 頲 "..tFightCityName[CITY_ID_CD])			
		end		
	end
end
