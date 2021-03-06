--File name:	lantern.lua
--Describe:		幸运灯笼npc脚本
--Create Date:	2008-08-28
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng trung thu : ".."L錸g n may m緉"		--此处分为2段只是为了不增加新的翻译
g_szFileName = "lantern.lua"					--文件名

g_tbItem = 
{
	--		"名称",		G1,	G2,	G3,		概率
	[1] = {"L? th駓",		2,	0,	351,	30	},
	[2] = {"C﹜ B竧 Nh?",	2,	0,	398,	5	},
	[3] = {"C﹜ B竧 Nh? nh?",2,	0,	504,	10	},
	[4] = {"M秐h B╪g th筩h",	2,	1,	148,	2	},
	[5] = {"B╪g th筩h",		2,	1,	149,	5	},
	[6] = {"M秐h Thi猲 th筩h",	2,	2,	7,		2	},
	[7] = {"Thi猲 th筩h",		2,	2,	8,		5	},
}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end

	local PKState = GetPKFlag()	
	if PKState == 0  then
		Msg2Player("B筺 ph秈 ? tr筺g th竔 chi課 u m韎 th緋 頲 l錸g n may m緉!")
		return
	end
	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLog("["..g_szLogTitle.." Error]: [Account: "..GetAccount().."][Role Name:"..GetName().."] In file "..g_szFileName.." function GetTargetNpc() return value = 0")
		return
	end

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCKY_DATE_08_MOONCAKE_VIET) then
		SetTask(LUCKY_DATE_08_MOONCAKE_VIET, nDate)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, 0)
	end

	if GetTask(LUCKY_TIMES_08_MOONCAKE_VIET) >= 5 then
		Msg2Player("M鏸 ng祔 m鏸 ngi ch? 頲 th緋 s竛g nhi襲 nh蕋 l? 5 l錸g n may m緉.")
		return
	end

	if GetItemCount(2,1,30029) < 1 then
		Msg2Player("Th緋 s竛g l錸g n may m緉 c莕 1 N課 v祅g, tr猲 h祅h trang c馻 b筺 kh玭g c? n課 v祅g, kh玭g th? th緋 l錸g n may m緉.")
		return
	end

	if DelItem(2,1,30029,1) == 1 then
		SetNpcLifeTime(nNpcIndex, 0)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, GetTask(LUCKY_TIMES_08_MOONCAKE_VIET)+1 )
	
		local nExp = 80000
		ModifyExp(nExp)
		Msg2Player("B筺 nh薾 頲  "..nExp.."  甶觤 kinh nghi謒")
		WriteLogEx(szLogTrungThuName,"nh薾",nExp,"甶觤 kinh nghi謒")		
		
		give_award()
	else
		Msg2Player("Th緋 s竛g l錸g n may m緉 c莕 1 N課 v祅g, tr猲 h祅h trang c馻 b筺 kh玭g c? n課 v祅g, kh玭g th? th緋 l錸g n may m緉.")
		return
	end
end

function give_award()
	local nRandom = random(1,100);
	local nBase = 0;
	for i=1, getn(g_tbItem) do
		nBase = nBase + g_tbItem[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tbItem[i]);
			return
		end;
	end;
end

function add_item_ex(tItem)
	local nRetCode,nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1  "..tItem[1]);
		WriteLogEx(szLogTrungThuName,"L錸g n may m緉",1,tItem[1])		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

