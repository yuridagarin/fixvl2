--create date:07-04-04
--author:yanjun
--describe:四神仙NPC脚本
Include("\\script\\online\\sixinghexi_ib_ob\\sixinghexi_head.lua")
function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	local nNpcType = get_npc_type(szNpcName);
	if nNpcType ~= 0 then
		dlg_main(nNpcType);
	end;
end
--获取NPC的类型
function get_npc_type(szNpcName)
	local nNpcType = 0;
	if szNpcName == "Ph骳 Th莕" then
		nNpcType = 1;
	elseif szNpcName == "T礽 th莕" then
		nNpcType = 2;
	elseif szNpcName == "Chi課 th莕" then
		nNpcType = 3;
	elseif szNpcName == "Th鵦 th莕" then
		nNpcType = 4;
	end;
	return nNpcType;
end;
--获取当前地图的名字
function get_curmap_info()
	local nCurMapID = GetWorldPos();
	for i,v in tbMapInfo_ib_ob do
		if nCurMapID == v[3][1][1] then
			return v[2],v[1];
		end;
	end;
	return "";
end;

function dlg_main(nType)
	local selTab = {
				"T鑤 qu?! Xin 產 t?"..tbNpcInfo_ib_ob[nType][2].."!!/#get_present("..nType..")",
				" t?, s? v藅 ph萴 n祔  d祅h t苙g cho b籲g h鱱./nothing",
				}
	Say("<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: "..tbNpcInfo_ib_ob[nType][3],getn(selTab),selTab);
end;

function get_present(nType)
	--如果NPC不见了
	if GetTargetNpcName() ~= tbNpcInfo_ib_ob[nType][2] then
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%y%m%d%H%M"));
	local szMapName,nGlbIdx = get_curmap_info();
	local nPresentLeft = MAX_PRESENT_COUNT - GetGlbValue(nGlbIdx);
	local nLastMapID = GetTask(TASK_MAPID);
	local nGotDate = GetTask(TASK_GOT_DATE);
	local nGotTime = GetTask(TASK_TIME);
	local nCurMapID = GetWorldPos();
	local nCurTime = GetTime();
	if nPresentLeft == 0 then	--如果没礼物了
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Qu? ta mang n  ph竧 h誸 r錳, phi襫 b籲g h鱱 l莕 sau n s韒 nh?!");
		return 0;
	end;
	--判断是同一时段的方法：
	--上次领取时所处的地图和当前地图相同并且
	--当前时间减去上次领取礼物时间小于NPC生存时间
	if nLastMapID == nCurMapID and nCurTime - nGotTime < IB_OB_NPC_LIFE_TIME then	--本时段领取过礼物了
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Ngi  nh薾 qu? r錳, mu鑞 l祄 h秓 h竛 th? kh玭g 頲 tham nh? v藋 ch?.");
		return 0;
	end;
	if nDate > nGotDate then	--新的一天数据清除
		SetTask(TASK_GOT_DATE,nDate);
		SetTask(TASK_PRESENT_TIMES,0);
	end;
	if GetTask(TASK_PRESENT_TIMES) >= MAX_GOT_TIMES then	--如果当天领取了足够多的礼物
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: H玬 nay ngi may m緉  nh薾 頲 nhi襲 qu? r錳, ch? c遪 l筰  nhng cho ngi kh竎.");
		return 0;
	end;

	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: H祅h trang c馻 ngi  kh玭g c遪 ch? tr鑞g, h穣 s緋 x誴 l筰 r錳 n nh薾 qu?.");
		return 0;
	end;
	SetTask(TASK_PRESENT_TIMES,GetTask(TASK_PRESENT_TIMES)+1);
	SetTask(TASK_MAPID,nCurMapID);
	SetTask(TASK_TIME,nCurTime);
	SetGlbValue(nGlbIdx,GetGlbValue(nGlbIdx)+1);
	local nRand = 0;
	local szPresent = "";
	local szPlayerName = GetName();
	if nType == 1 then
		ModifyReputation(30,0);
		AddItem(2,5,7,5);
		Msg2Player("B筺 nh薾 頲 5 t蕀 Gi竚 мnh ph? c蕄 7.");
		Msg2Global("Ngi ch琲"..szPlayerName.."T筰"..szMapName.."G苝 頲 Ph骳 Th莕 nh薾 v? s? qu?, th藅 khi課 cho ngi kh竎 ph秈 ganh t?!")
	elseif nType == 2 then
		nRand = random(1,100)
		if nRand <= 75 then
			Earn(80000);
			szPresent = "8 v祅g";
		elseif nRand <= 95 then
			Earn(180000);
			szPresent = "18 ti襫 v祅g";
		else
			Earn(280000);
			szPresent = "28 ti襫 v祅g";
		end;
		Msg2Global("Ngi ch琲"..szPlayerName.."T筰"..szMapName.."G苝 Th莕 t礽 nh薾 頲 v? s? ng﹏ lng"..szPresent..", th藅 khi課 ngi kh竎 ph秈 ganh t?!");
	elseif nType == 3 then
		nRand = random(1,100)
		if nRand <= 85 then
			AddItem(2,1,481,1);
			Msg2Player("B筺 nh薾 頲 m閠 t骾 Ng? Hoa Ng鋍 L? Ho祅");
			szPresent = "Ng? Hoa Ng鋍 L? Ho祅 (ti觰)";
		elseif nRand <= 90 then
			AddItem(2,1,483,1);
			Msg2Player("B筺 nh薾 頲 m閠 t骾 Sinh Sinh H鉧 T竛");
			szPresent = "Sinh Sinh H鉧 T竛 (ti觰)";
		elseif nRand <= 95 then
			AddItem(2,1,489,1);
			Msg2Player("B筺 nh薾 頲 m閠 t骾 Ng鋍 Cao T竛");
			szPresent = "H綾 Ng鋍 筺 T鬰 Cao (ti觰)";
		else
			AddItem(2,1,495,1);
			Msg2Player("B筺 nh薾 頲 m閠 t骾 V筺 V藅 Quy Nguy猲 n");
			szPresent = "V筺 V藅 Quy Nguy猲 Кn (ti觰)";
		end;
		Msg2Global("Ngi ch琲"..szPlayerName.."T筰"..szMapName.."G苝 頲 Chi課 th莕 nh薾 頲 v? s? v藅 ph萴"..szPresent..", khi課 ngi kh竎 ph秈  k?!");
	elseif nType == 4 then
		nRand = random(1,100)
		if nRand <= 25 then
			AddItem(1,1,14,30);
			Msg2Player("B筺 nh薾 頲 30 C琺 chi猲 tr鴑g");
			szPresent = "30 ph莕 c琺 chi猲 tr鴑g";
		elseif nRand <= 50 then
			AddItem(1,1,9,30);
			Msg2Player("B筺 nh薾 頲 30 C秈 x祇 t醝");
			szPresent = "30 C秈 x祇 t醝";
		elseif nRand <= 75 then
			AddItem(1,1,13,30);
			Msg2Player("B筺 nh薾 頲 30 T髖 M閚g T鰑");
			szPresent = "30 T髖 M閚g T鰑";
		elseif nRand <= 83 then
			AddItem(1,1,15,20);
			Msg2Player("B筺 nh薾 頲 20 b竛h B閠 v祅g");		
			szPresent = "20 b竛h B閠 v祅g";
		elseif nRand <= 91 then
			AddItem(1,1,17,20);
			Msg2Player("B筺 nh薾 頲 20 Nh? th藀 t? ki襲 Minh Nguy謙 D?");
			szPresent = "20 Nh? th藀 t? ki襲 Minh Nguy謙 D?";
		else
			AddItem(1,1,19,20);
			Msg2Player("B筺 nh薾 頲 20 T﹜ B綾 V鋘g");	
			szPresent = "20 T﹜ B綾 V鋘g";	
		end;
		Msg2Global("Ngi ch琲"..szPlayerName.."T筰"..szMapName.."G苝 頲 Th鵦 th莕, nh薾 頲 v? s? th鵦 ph萴"..szPresent..", khi課 ngi kh竎 ph秈 ganh t?!");
	end;
	Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Ph莕 thng c馻 ngi y, ch骳 vui v?!");
end;