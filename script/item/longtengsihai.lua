--create date:2007-09-29 9:29
--author:yanjun
--describe:金山上市龙腾四海包脚本
Include("\\script\\lib\\globalfunctions.lua");

TSK_USE_DATE = 2358;
g_szItemName = "T骾 Long Щng T? H秈";
IB_VERSION = 1;
g_tbSkillID = {820,823,832,835,838,841,871};

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%H%M"));
	if nDate >= 071009 and nDate <= 071011 and nTime >= 2000 and nTime <= 2200 then
		if nDate > GetTask(TSK_USE_DATE) then
			local szExp = "";
			local nLevel = GetLevel();
			if IB_VERSION == 1 then
				szExp = "<color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).." kinh nghi謒 <color>. ";
			else
				szExp = "Chuy觧 <color=yellow>"..floor(10000000*(nLevel^3)/(80^3)).." 甶觤 <color>. ";
			end;
			local selTab = {
						"уng ?/#get_reward("..nItemIdx..","..nDate..")",
						"H駓 b?/nothing",
						}
			Say("H玬 nay b筺 m? ra l莕 u ti猲 <color=yellow>"..g_szItemName.."<color>B筺 nh薾 頲 1 ph竜, 1 Ph竜 hoa m祏 cam, 1 Ph竜 hoa m祏 xanh, 1 X輈h M筩 H醓 Di謒, 1 Lam M筩 H醓 Di謒, 1 Tranh M筩 H醓 Di謒, 1 Th莕 M藅 Y猲 Hoa"..szExp.."B筺 mu鑞 m? n? ra b﹜ gi??",getn(selTab),selTab);
		else
			do_fireworks(nItemIdx);
		end;		
	else
		Talk(1,"",g_szItemName.."Ch? <color=yellow>s? d鬾g m鏸 bu鎖 t鑙 t? 20:00 - 22:00, ng祔 9, 10, 11 th竛g 10 n╩ <color>.");
	end;
end;

function do_fireworks(nItemIdx)
	local nSkill = g_tbSkillID[random(1,getn(g_tbSkillID))];
	if DoFireworks(nSkill,5) == 1 then
		SetItemUseLapse(nItemIdx,30*18);
	end	
end;

function get_reward(nItemIdx,nDate)
	if gf_JudgeRoomWeight(8,20,"") == 1 then
		do_fireworks(nItemIdx);
		SetTask(TSK_USE_DATE,nDate);
		AddItem(2,3,214,1);
		Msg2Player("B筺 nh薾 頲 1 ph竜");
		AddItem(2,1,189,1);
		Msg2Player("B筺 nh薾 頲 1 Tranh s綾 Y猲 Hoa");
		AddItem(2,1,190,1);
		Msg2Player("B筺 nh薾 頲 1 Lam S綾 Y猲 Hoa");
		AddItem(2,1,191,1);
		Msg2Player("B筺 nh薾 頲 1 X輈h M筩 H醓 Di謒");
		AddItem(2,1,192,1);
		Msg2Player("B筺 nh薾 頲 1 Lam M筩 H醓 Di謒");
		AddItem(2,1,193,1);
		Msg2Player("B筺 nh薾 頲 1 Tranh M筩 H醓 Di謒");
		AddItem(2,1,194,1);
		Msg2Player("B筺 nh薾 頲 1 Th莕 M藅 Y猲 Hoa");
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(5000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		else
			nGoldenExp = floor(10000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[V藅 ph萴 m鮪g sinh nh藅 V? l﹎  ra l遌:"..GetName().."nh薾 頲 1 l莕 thng:"..nExp.." 甶觤 kinh nghi謒");
	end;
end;